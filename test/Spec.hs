import Test.QuickCheck ( quickCheck )
import ProgramGen (showGen)
import ParseTest ( prop_parse )
main :: IO ()
main = quickCheck prop_parse

-- main :: IO ()
-- main = showGen