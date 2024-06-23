{
{-# LANGUAGE DeriveFoldable #-}
module Parser (parseStr) where

import Data.ByteString.Lazy.Char8 (ByteString, pack)
import Data.Maybe (fromJust)
import Data.Monoid (First (..))
import Data.List (find)

import qualified Lexer as L
import Program
}

%name parseCelery prog
%tokentype { L.RangedToken }
%error { parseError }
%monad { L.Alex } { >>= } { pure }
%lexer { lexer } { L.RangedToken L.EOF _ }
%expect 0

%token
  -- Identifiers
  identifier { L.RangedToken (L.Identifier _) _ }
  -- Constants
  string     { L.RangedToken (L.String _) _ }
  integer    { L.RangedToken (L.Integer _) _ }
  boolean    { L.RangedToken (L.Boolean _) _ }
  -- Keywords
  let        { L.RangedToken L.Let _ }
  in         { L.RangedToken L.In _ }
  if         { L.RangedToken L.If _ }
  then       { L.RangedToken L.Then _ }
  else       { L.RangedToken L.Else _ }
  -- Arithmetic operators
  '+'        { L.RangedToken L.Plus _ }
  '-'        { L.RangedToken L.Minus _ }
  '*'        { L.RangedToken L.Times _ }
  '/'        { L.RangedToken L.Divide _ }
  -- Comparison operators
  '='        { L.RangedToken L.Eq _ }
  '<>'       { L.RangedToken L.Neq _ }
  '<'        { L.RangedToken L.Lt _ }
  '<='       { L.RangedToken L.Le _ }
  '>'        { L.RangedToken L.Gt _ }
  '>='       { L.RangedToken L.Ge _ }
  -- Logical operators
  '&'        { L.RangedToken L.And _ }
  '|'        { L.RangedToken L.Or _ }
  -- Parenthesis
  '#('       { L.RangedToken L.LHashPar _ }
  '('        { L.RangedToken L.LPar _ }
  ')'        { L.RangedToken L.RPar _ }
  -- Lists
  '['        { L.RangedToken L.LBrack _ }
  ']'        { L.RangedToken L.RBrack _ }
  ','        { L.RangedToken L.Comma _ }
  -- Types
  ':'        { L.RangedToken L.Colon _ }
  '->'       { L.RangedToken L.Arrow _ }
  'Int'      { L.RangedToken L.IntTypeToken _}
  'String'   { L.RangedToken L.StringTypeToken _ }
  'Bool' { L.RangedToken L.BoolTypeToken _ }

%right else in
%right '->' 
%left '|'
%left '&'
%nonassoc '=' '<>' '<' '>' '<=' '>='
%left '+' '-'
%left '*' '/'

%%

optional(p)
  :   { Nothing }
  | p { Just $1 }

manyRev(p)
  :               { [] }
  | manyRev(p) p { $2 : $1 }

many(p)
  : manyRev(p) { reverse $1 }

sepByRev(p, sep)
  : sepByRev(p, sep) sep p { $3 : $1 }
  | sepByRev(p, sep) sep {$1}
  | p { [$1] }
  | {- empty -} { [] }

sepBy(p, sep)
  : sepByRev(p, sep) { reverse $1 }

name :: { Name L.Range }
  : identifier { unTok $1 (\range (L.Identifier name) -> Name range name) }

type :: { Type L.Range }
  : name           { TVar (info $1) $1 }
  | 'Bool'         { TBool (L.rtRange $1) } 
  | 'Int'         { TInt (L.rtRange $1) } 
  | 'String'         { TString (L.rtRange $1) } 
  | '(' ')'        { TUnit (L.rtRange $1 <-> L.rtRange $2) }
  | '#(' sepBy(type, ',') ')'   { TTuple (L.rtRange $1 <-> L.rtRange $3) $2 }
  | '[' type ']'   { TList (L.rtRange $1 <-> L.rtRange $3) $2 }
  | type '->' type { TArrow (info $1 <-> info $3) $1 $3 }


typeAnnotation :: { Type L.Range }
  : ':' type { $2 }

argument :: { Argument L.Range }
  : '(' name optional(typeAnnotation) ')' { Argument (L.rtRange $1 <-> L.rtRange $4) $2 $3 }
  | name                                  { Argument (info $1) $1 Nothing }

dec :: { Dec L.Range }
  : let name many(argument) optional(typeAnnotation) '=' exp { Dec (L.rtRange $1 <-> info $6) $2 $3 $4 $6 }

prog :: { Program L.Range }
  : many(dec) { mkProgram $1 }

exp :: { Exp L.Range }
  : expapp                   { $1 }
  | expif                  { $1 }
  | '-' exp                  { ENeg (L.rtRange $1 <-> info $2) $2 }
  -- Arithmetic operators
  | exp '+'  exp             { EBinOp (info $1 <-> info $3) $1 (Plus (L.rtRange $2)) $3 }
  | exp '-'  exp             { EBinOp (info $1 <-> info $3) $1 (Minus (L.rtRange $2)) $3 }
  | exp '*'  exp             { EBinOp (info $1 <-> info $3) $1 (Times (L.rtRange $2)) $3 }
  | exp '/'  exp             { EBinOp (info $1 <-> info $3) $1 (Divide (L.rtRange $2)) $3 }
  -- Comparison operators
  | exp '='  exp             { EBinOp (info $1 <-> info $3) $1 (Eq (L.rtRange $2)) $3 }
  | exp '<>' exp             { EBinOp (info $1 <-> info $3) $1 (Neq (L.rtRange $2)) $3 }
  | exp '<'  exp             { EBinOp (info $1 <-> info $3) $1 (Lt (L.rtRange $2)) $3 }
  | exp '<=' exp             { EBinOp (info $1 <-> info $3) $1 (Le (L.rtRange $2)) $3 }
  | exp '>'  exp             { EBinOp (info $1 <-> info $3) $1 (Gt (L.rtRange $2)) $3 }
  | exp '>=' exp             { EBinOp (info $1 <-> info $3) $1 (Ge (L.rtRange $2)) $3 }
  -- Logical operators
  | exp '&'  exp             { EBinOp (info $1 <-> info $3) $1 (And (L.rtRange $2)) $3 }
  | exp '|'  exp             { EBinOp (info $1 <-> info $3) $1 (Or (L.rtRange $2)) $3 }
  | dec in exp               { ELetIn (info $1 <-> info $3) $1 $3 }

expapp :: { Exp L.Range }
  : expapp atom              { EApp (info $1 <-> info $2) $1 $2 }
  | atom                     { $1 }

expif :: { Exp L.Range }
  : if exp then exp else exp { EIfThenElse (L.rtRange $1 <-> info $6) $2 $4 $6 }

atom :: { Exp L.Range }
  : integer                  { unTok $1 (\range (L.Integer int) -> EInt range int) }
  | name                     { EVar (info $1) $1 }
  | string                   { unTok $1 (\range (L.String string) -> EString range string) }
  | boolean                  { unTok $1 (\range (L.Boolean b) -> EBool range b)}
  | '#(' sepBy(exp, ',') ')' { ETuple (L.rtRange $1 <-> L.rtRange $3) $2}
  | '[' sepBy(exp, ',') ']'  { EList (L.rtRange $1 <-> L.rtRange $3) $2 }
  | '(' exp ')'              { $2 }
  | '(' ')'                  { EUnit (L.rtRange $1 <-> L.rtRange $2) }
    -- Arithmetic operators
  | '(' '+' ')'              { EOp (L.rtRange $1 <-> L.rtRange $3) (Plus (L.rtRange $2)) }
  | '(' '-' ')'              { EOp (L.rtRange $1 <-> L.rtRange $3) (Minus (L.rtRange $2)) }
  | '(' '*' ')'              { EOp (L.rtRange $1 <-> L.rtRange $3) (Times (L.rtRange $2)) }
  | '(' '/' ')'              { EOp (L.rtRange $1 <-> L.rtRange $3) (Divide (L.rtRange $2)) }
  -- Comparison operators
  | '(' '=' ')'              { EOp (L.rtRange $1 <-> L.rtRange $3) (Eq (L.rtRange $2)) }
  | '(' '<>' ')'             { EOp (L.rtRange $1 <-> L.rtRange $3) (Neq (L.rtRange $2)) }
  | '(' '<' ')'              { EOp (L.rtRange $1 <-> L.rtRange $3) (Lt (L.rtRange $2)) }
  | '(' '<=' ')'             { EOp (L.rtRange $1 <-> L.rtRange $3) (Le (L.rtRange $2)) }
  | '(' '>' ')'              { EOp (L.rtRange $1 <-> L.rtRange $3) (Gt (L.rtRange $2)) }
  | '(' '>=' ')'             { EOp (L.rtRange $1 <-> L.rtRange $3) (Ge (L.rtRange $2)) }
  -- Logical operators
  | '(' '&' ')'              { EOp (L.rtRange $1 <-> L.rtRange $3) (And (L.rtRange $2)) }
  | '(' '|' ')'              { EOp (L.rtRange $1 <-> L.rtRange $3) (Or (L.rtRange $2)) }

{
parseError :: L.RangedToken -> L.Alex a
parseError _ = do
  (L.AlexPn _ line column, _, _, _) <- L.alexGetInput
  L.alexError $ "Parse error at line " <> show line <> ", column " <> show column

lexer :: (L.RangedToken -> L.Alex a) -> L.Alex a
lexer = (=<< L.alexMonadScan)

-- | Build a simple node by extracting its token type and range.
unTok :: L.RangedToken -> (L.Range -> L.Token -> a) -> a
unTok (L.RangedToken tok range) ctor = ctor range tok

validMain :: Dec L.Range -> Bool
validMain (Dec _ (Name _ name) args ty _) = name == pack "main" && validMainArgs args && validMainType ty
  where validMainArgs [] = True
        validMainArgs [Argument _ _ (Just (TList _ (TString _)))] = True
        validMainArgs [Argument _ _ Nothing] = True
        validMainArgs _ = False
        
        validMainType Nothing = True
        validMainType (Just (TUnit _)) = True
        validMainType _ = False

mkProgram :: [Dec L.Range] -> Program L.Range
mkProgram decs = let fst = head decs
                     lst = last decs
                     range = info fst <-> info lst
                 in  let main' = find validMain decs
                     in case main' of 
                          Nothing -> error  "parse failed: expect a main function"
                          Just (main'') -> Program range (filter (/=main'') decs) main''
-- | Unsafely extracts the the metainformation field of a node.
info :: Foldable f => f a -> a
info = fromJust . getFirst . foldMap pure

-- | Performs the union of two ranges by creating a new range starting at the
-- start position of the first range, and stopping at the stop position of the
-- second range.
-- Invariant: The LHS range starts before the RHS range.
(<->) :: L.Range -> L.Range -> L.Range
L.Range a1 _ <-> L.Range _ b2 = L.Range a1 b2

parseStr :: String -> Either String (Program L.Range)
parseStr str = L.runAlex (pack str) parseCelery
}
