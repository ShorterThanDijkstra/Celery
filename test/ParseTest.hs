module ParseTest where
prop_reverse :: [Int] -> Bool
prop_reverse xs = reverse (reverse xs) == xs
