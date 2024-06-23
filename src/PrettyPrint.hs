module PrettyPrint (PrettyPrint, pPrint) where

class PrettyPrint a where
    pPrint :: a -> String