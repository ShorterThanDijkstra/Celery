{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE InstanceSigs #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module ProgramGen where

import Data.ByteString.Lazy.Char8 (pack)
import PrettyPrint (PrettyPrint (pPrint))
import Program
  ( Argument (..),
    Dec (..),
    Exp (..),
    Name (..),
    Operator (..),
    Program (..),
    Type (..),
  )
import Test.QuickCheck (Arbitrary (arbitrary), Gen, choose, elements, generate, listOf, sized)

notIdentifier = ["let", "in", "true", "false", "main", "if", "then", "else"]

modifyIdentifilerGen :: String -> String
modifyIdentifilerGen str = if str `elem` notIdentifier then str else '_' : str

choose' :: (a, a) -> Gen a
choose' (x, y) = do
  choice <- choose (True, False)
  return $ if choice then x else y

identifierGen :: Gen String
identifierGen = do
  let alphas = ['a' .. 'z'] <> ['A' .. 'Z']
  let digits = ['0' .. '9']
  let puncs = ['_', '\'', '-', '<', '>', '!']
  firstChar <- elements $ ['_'] <> alphas
  rest <- listOf $ elements $ alphas <> digits <> puncs
  let identifier = modifyIdentifilerGen $ firstChar : rest
  return identifier

stringGen :: Gen String
stringGen = do
  let alphas = ['a' .. 'z'] <> ['A' .. 'Z']
  let digits = ['0' .. '9']
  listOf $ elements ("\"" <> alphas <> digits <> "\"")

instance Arbitrary (Name ()) where
  arbitrary :: Gen (Name ())
  arbitrary = do
    name <- identifierGen
    return $ Name () (pack name)

arbitraryMainDec :: Gen (Dec ())
arbitraryMainDec = do
  name <- arbitrary :: Gen (Name ())
  argTy <- choose' (Just (TList () (TString ())), Nothing)
  args <- choose' ([], [Argument () name argTy])
  ty <- choose' (Nothing, Just (TUnit ()))
  let arg = if null args then [] else [head args]
  return $ Dec () (Name () $ pack "main") arg ty (EUnit ())

instance Arbitrary (Program ()) where
  arbitrary :: Gen (Program ())
  arbitrary = do
    decs <- arbitrary :: Gen [Dec ()]
    mainDec <- arbitraryMainDec
    return $ Program () decs mainDec

instance Arbitrary (Type ()) where
  arbitrary :: Gen (Type ())
  arbitrary = sized arbitrarySizedType

arbitrarySizedType :: Int -> Gen (Type ())
arbitrarySizedType m = do
  name <- arbitrary :: Gen (Name ())
  ty1 <- arbitrarySizedType (m `div` 32)
  ty2 <- arbitrarySizedType (m `div` 32)
  elements [TVar () name, TUnit (), TBool (), TString (), TInt (), TList () ty1, TArrow () ty1 ty2]

instance Arbitrary (Argument ()) where
  arbitrary :: Gen (Argument ())
  arbitrary = do
    name <- arbitrary :: Gen (Name ())
    ty <- arbitrary :: Gen (Maybe (Type ()))
    return $ Argument () name ty

instance Arbitrary (Operator ()) where
  arbitrary :: Gen (Operator ())
  arbitrary =
    elements
      [ Plus (),
        Minus (),
        Times (),
        Divide (),
        Eq (),
        Neq (),
        Lt (),
        Le (),
        Gt (),
        Ge (),
        And (),
        Or ()
      ]

instance Arbitrary (Dec ()) where
  arbitrary :: Gen (Dec ())
  arbitrary = do
    name <- arbitrary :: Gen (Name ())
    args <- arbitrary :: Gen [Argument ()]
    ty <- arbitrary :: Gen (Maybe (Type ()))
    exp <- arbitrary :: Gen (Exp ())
    return $ Dec () name args ty exp
    -- return $ Dec () name args ty (EUnit ())

instance Arbitrary (Exp ()) where
  arbitrary :: Gen (Exp ())
  arbitrary = sized arbitrarySizedExp

arbitrarySizedExp :: Int -> Gen (Exp ())
arbitrarySizedExp m = do
  op <- arbitrary :: Gen (Operator ())
  i <- arbitrary :: Gen Integer
  b <- arbitrary :: Gen Bool
  str <- pack <$> stringGen
  name <- arbitrary :: Gen (Name ())
  dec <- arbitrary :: Gen (Dec ())
  exps <- arbitrary :: Gen [Exp ()]
  exp1 <- arbitrarySizedExp (m `div` 32)
  exp2 <- arbitrarySizedExp (m `div` 32)
  exp3 <- arbitrarySizedExp (m `div` 32)
  elements
    [ EInt () i,
      EVar () name,
      EUnit (),
      EBool () b,
      EString () str,
      ETuple () exps,
      EList () exps,
      EApp () exp1 exp2,
      EIfThenElse () exp1 exp2 exp3,
      ENeg () exp1,
      EBinOp () exp1 op exp2,
      EOp () op,
      ELetIn () dec exp1
    ]

showGen = do
  p <- generate (arbitrary :: Gen (Program ()))
  putStrLn $ show p
  putStrLn "------------------------"
  putStrLn $ pPrint p