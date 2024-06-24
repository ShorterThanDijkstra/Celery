module Main (main) where
import Data.ByteString.Lazy.Char8(pack)
import Program
import Parser
import PrettyPrint (PrettyPrint(pPrint))

mkName _ str = Name () $ pack str
mkString _ str = EString () $ pack str
p0 = Program () [Dec () (mkName () "_nmQ1") [] Nothing (EIfThenElse () (EVar () (mkName () "_Uk")) (EInt () 0) (ENeg () (ETuple () [mkString () "MT3",ENeg () (EString () "h\""),EString () "y"])))] (Dec () (mkName () "main") [] (Just (TUnit ())) (EUnit ()))
p1 = let (Right p) = parseStr $ pPrint p0
     in fmap (const ()) p
main :: IO ()
main = putStrLn ""