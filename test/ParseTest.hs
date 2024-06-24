{-# LANGUAGE InstanceSigs #-}

module ParseTest where

import Parser (parseStr)
import PrettyPrint (PrettyPrint (pPrint))
import Program

prop_parse :: Program () -> Bool
prop_parse p0 =
  let (Right p1) = parseStr $ pPrint p0
      p2 = fmap (\_ -> ()) p1
      p3 = fmap (\_ -> ()) p0
  in p2 == p3
  
