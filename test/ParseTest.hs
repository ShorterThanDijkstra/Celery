{-# LANGUAGE InstanceSigs #-}

module ParseTest where

import Parser (parseStr)
import PrettyPrint (PrettyPrint (pPrint))
import Program

prop_parse :: Program () -> Bool
prop_parse p =
  let (Right p') = parseStr $ pPrint p
      p'' = fmap (\_ -> ()) p'
  in p'' == p
  
