import Test.QuickCheck ( quickCheck )
import ProgramGen
import ParseTest ( prop_parse )
main :: IO ()
main = quickCheck prop_parse

-- main :: IO ()
-- main = showGen