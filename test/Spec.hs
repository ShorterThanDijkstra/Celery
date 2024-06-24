import Test.QuickCheck ( quickCheck, generate, Arbitrary (arbitrary) , Gen)
import ProgramGen
import ParseTest ( prop_parse )
import Program (Program(Program), Exp, Dec (Dec), Type)
import PrettyPrint (PrettyPrint(pPrint))
main :: IO ()
main = quickCheck prop_parse
-- main = do
--     p <- generate $ (arbitrary :: Gen (Program ()))
--     putStrLn $ pPrint p
-- main = showGen

-- main :: IO ()
-- main = showGen

-- main = do
--     p <- generate $ (arbitrary :: Gen (Exp ()))
    -- putStrLn $ pPrint p