module Main (main) where
import Data.ByteString.Lazy.Char8(pack)
import Program
import Parser
import PrettyPrint (PrettyPrint(pPrint))

mkName _ str = Name () $ pack str
p0 = Program () [Dec () (mkName () "_N") [] (Just (TList () (TUnit ()))) (EApp () (EBool () True) (EBinOp () (EString () (pack "p")) (Divide ()) (EApp () (EUnit ()) (EString () (pack "b")))))] (Dec () (mkName () "main") [] Nothing (EUnit ()))
p1 = let (Right p) = parseStr $ pPrint p0
     in fmap (const ()) p
main :: IO ()
main = putStrLn ""