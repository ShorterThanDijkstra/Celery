module Main (main) where

import Data.ByteString.Lazy.Char8 (pack)
import Parser
import PrettyPrint (PrettyPrint (pPrint))
import Program

mkName _ str = Name () $ pack str

mkString _ str = EString () $ pack str


p0 :: Program ()
p0 = Program () [] (Dec () (mkName () "main") [] (Just (TUnit ())) (ENeg () (EInt () 8)))

p1 = let (Right p) = parseStr $ pPrint p0
     in fmap (const ()) p
main :: IO ()
main = putStrLn ""