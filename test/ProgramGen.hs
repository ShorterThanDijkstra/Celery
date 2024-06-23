module ProgramGen where
import Test.QuickCheck (Gen, Arbitrary (arbitrary), choose, generate, elements, listOf, suchThat)
-- import Program
import Data.Char (isAlpha, isDigit)

choose' :: (a, a) -> Gen a
choose' (x, y) = do
    choice <- choose (True, False)
    return $ if choice then x else y

identifierGen :: Gen String
identifierGen = do
    let alphas = ['a'..'z'] <> ['A'..'Z']
    let digits = ['0'..'9']
    let puncs = [ '_', '\'', '-', '<', '>', '!']
    firstChar <- elements $ ['-'] <> alphas
    rest <- listOf $ elements $ alphas<> digits <> puncs
    let identifier = firstChar : rest
    return identifier `suchThat` (\x -> x /= "_")



-- instance Arbitrary (Name ()) where 
--     arbitrary = 
-- arbitraryMainDec :: Gen (Dec ())
-- arbitraryMainDec = do 
--     name <- arbitrary :: Gen (Name ())
--     argTy <- choose' (Just $ TList $ TString, Noting)
--     args <- choose' ([], [Argument () name argTy])
--     ty <- choose (Nothing, Just $ TUnit)
--     return $ Dec () (name $ pack "main") args ty ()

-- instance Arbitrary (Program ()) where
--     arbitrary :: Gen (Program ())
--     arbitrary = do 
--         decs <- arbitrary :: Gen [Dec a]
--         mainDec <- arbitraryMainDec
--         return $ Program () decs mainDec

-- instance Arbitrary (Dec ()) where
--     arbitrary :: Gen (Dec ())
--     arbitrary = do 
--         name <- arbitrary :: Gen (Name ())
--         args <- arbitrary :: Gen [Argument ()]
--         ty <- arbitrary :: Gen (Maybe (Type ()))
--         return $ Dec () name args ty