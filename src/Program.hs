{-# LANGUAGE DeriveFoldable #-}
{-# LANGUAGE InstanceSigs #-}

module Program where

import Data.ByteString.Lazy.Char8 (ByteString, unpack)
import Data.List (intercalate)
import PrettyPrint (PrettyPrint, pPrint)
import Data.Char (toLower)

data Name a
  = Name a ByteString
  deriving (Foldable, Show)

instance Eq (Name a) where
  (Name _ bs1) == (Name _ bs2) = bs1 == bs2

instance PrettyPrint (Name a) where
  pPrint (Name _ bs) = unpack bs

data Type a
  = TVar a (Name a)
  | TUnit a
  | TBool a 
  | TString a
  | TInt a
  | TTuple a [Type a]
  | TList a (Type a)
  | TArrow a (Type a) (Type a)
  deriving (Foldable, Show)

allEq :: (Eq a) => [a] -> [a] -> Bool
allEq as1 as2 = all (uncurry (==)) $ zip as1 as2

instance Eq (Type a) where
  (TVar _ name1) == (TVar _ name2) = name1 == name2
  (TUnit _) == (TUnit _) = True
  (TInt _) == (TInt _) = True
  (TString _) == (TString _) = True
  (TBool _)  == (TBool _) = True
  (TTuple _ ts1) == (TTuple _ ts2) = allEq ts1 ts2
  (TList _ t1) == (TList _ t2) = t1 == t2
  (TArrow _ l1 r1) == (TArrow _ l2 r2) = l1 == l2 && r1 == r2
  _ == _ = False

instance PrettyPrint (Type a) where
  pPrint (TVar _ name) = pPrint name
  pPrint (TBool _) = "Bool"
  pPrint (TInt _) = "Int"
  pPrint (TString _) = "String"
  pPrint (TUnit _) = "()"
  pPrint (TTuple _ ts) = "#(" <> intercalate ", " (pPrint <$> ts) <> ")"
  pPrint (TList _ t) = "[" <> pPrint t <> "]"
  pPrint (TArrow _ l r) = pPrint l <> " -> " <> pPrint r

data Argument a
  = Argument a (Name a) (Maybe (Type a))
  deriving (Foldable, Show)

instance Eq (Argument a) where
  (Argument _ name1 t1) == (Argument _ name2 t2) = name1 == name2 && t1 == t2

instance PrettyPrint (Argument a) where
  pPrint (Argument _ name (Just t)) = "(" <> pPrint name <> " : " <> pPrint t <> ")"
  pPrint (Argument _ name Nothing) = pPrint name

data Dec a
  = Dec a (Name a) [Argument a] (Maybe (Type a)) (Exp a)
  deriving (Foldable, Show)

instance Eq (Dec a) where
  (Dec _ name1 args1 t1 exp1) == (Dec _ name2 args2 t2 exp2) = name1 == name2 && allEq args1 args2 && t1 == t2 && exp1 == exp2

instance PrettyPrint (Dec a) where
  pPrint (Dec _ name args (Just t) exp) = "let " <> pPrint name <> unwords (pPrint <$> args) <> " : " <> pPrint t <> " = " <> pPrint exp
  pPrint (Dec _ name args Nothing exp) = "let " <> pPrint name <> unwords (pPrint <$> args) <> " = " <> pPrint exp

data Operator a
  = Plus a
  | Minus a
  | Times a
  | Divide a
  | Eq a
  | Neq a
  | Lt a
  | Le a
  | Gt a
  | Ge a
  | And a
  | Or a
  deriving (Foldable, Show)

instance Eq (Operator a) where
  (Plus _) == (Plus _) = True
  (Minus _) == (Minus _) = True
  (Times _) == (Times _) = True
  (Divide _) == (Divide _) = True
  (Eq _) == (Eq _) = True
  (Neq _) == (Neq _) = True
  (Lt _) == (Lt _) = True
  (Le _) == (Le _) = True
  (Gt _) == (Gt _) = True
  (Ge _) == (Ge _) = True
  (And _) == (And _) = True
  (Or _) == (Or _) = True
  _ == _ = False

instance PrettyPrint (Operator a) where
  pPrint (Plus _) = "+"
  pPrint (Minus _) = "-"
  pPrint (Times _) = "*"
  pPrint (Divide _) = "/"
  pPrint (Eq _) = "=="
  pPrint (Neq _) = "=/="
  pPrint (Lt _) = "<"
  pPrint (Le _) = "<="
  pPrint (Gt _) = ">"
  pPrint (Ge _) = ">="
  pPrint (And _) = "&"
  pPrint (Or _) = "|"

data Exp a
  = EInt a Integer
  | EVar a (Name a)
  | EUnit a
  | EBool a Bool
  | EString a ByteString
  | ETuple a [Exp a]
  | EList a [Exp a]
  | EApp a (Exp a) (Exp a)
  | EIfThenElse a (Exp a) (Exp a) (Exp a)
  | ENeg a (Exp a)
  | EBinOp a (Exp a) (Operator a) (Exp a)
  | EOp a (Operator a)
  | ELetIn a (Dec a) (Exp a)
  deriving (Foldable, Show)

instance Eq (Exp a) where
  (EInt _ i1) == (EInt _ i2) = i1 == i2
  (EUnit _) == (EUnit _) = True
  (EBool _ b1) == (EBool _ b2) = b1 == b2
  (EVar _ name1) == (EVar _ name2) = name1 == name2
  (EString _ bs1) == (EString _ bs2) = bs1 == bs2
  (ETuple _ exps1) == (ETuple _ exps2) = allEq exps1 exps2
  (EList _ exps1) == (EList _ exps2) = allEq exps1 exps2
  (EApp _ proc1 arg1) == (EApp _ proc2 arg2) = proc1 == proc2 && arg1 == arg2
  (EIfThenElse _ cond1 conse1 alt1) == (EIfThenElse _ cond2 conse2 alt2) = allEq [cond1, conse1, alt1] [cond2, conse2, alt2]
  (ENeg _ exp1) == (ENeg _ exp2) = exp1 == exp2
  (EBinOp _ expL1 op1 expR1) == (EBinOp _ expL2 op2 expR2) = expL1 == expL2 && op1 == op2 && expR1 == expR2
  (EOp _ op1) == (EOp _ op2) = op1 == op2
  (ELetIn _ dec1 exp1) == (ELetIn _ dec2 exp2) = dec1 == dec2 && exp1 == exp2
  _ == _ = False

instance PrettyPrint (Exp a) where
  pPrint (EInt _ i) = show i
  pPrint (EVar _ name) = pPrint name
  pPrint (EUnit _) = "()"
  pPrint (EBool _ b) = map toLower $ show b
  pPrint (EString _ bs) = unpack bs
  pPrint (ETuple _ exps) = "#(" <> intercalate ", " (pPrint <$> exps) <> ")"
  pPrint (EList _ exps) = "[" <> intercalate ", " (pPrint <$> exps) <> "]"
  pPrint (EApp _ proc arg) = pPrint proc <> " " <> pPrint arg
  pPrint (EIfThenElse _ cond conseq alt) = "if " <> pPrint cond <> " then " <> pPrint conseq <> "else" <> pPrint alt
  pPrint (ENeg _ exp) = "-" <> pPrint exp
  pPrint (EBinOp _ expL op expR) = pPrint expL <> " " <> pPrint op <> " " <> pPrint expR
  pPrint (EOp _ op) = "(" <> pPrint op <> ")"
  pPrint (ELetIn _ dec exp) = pPrint dec <> " in " <> pPrint exp

data Program a = Program a [Dec a] (Dec a) deriving (Foldable, Show)

instance PrettyPrint (Program a) where
  pPrint (Program _ decs _main_) = intercalate "\n" (pPrint <$> decs) <> "\n" <> pPrint _main_
