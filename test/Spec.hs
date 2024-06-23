import Test.QuickCheck
import ParseTest
main :: IO ()
main = quickCheck prop_reverse