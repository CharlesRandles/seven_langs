module Main where

{-
Write a function that takes an argument x and returns a lazy sequence
 that has every third number, starting with x. Then, write a function 
that includes every fifth number, beginning with y. Combine these 
functions through composition to return every eighth number, beginning with x + y.
-}

lazy_seq start step = start : (lazy_seq (start + step) step)

lazy_3 x = lazy_seq x 3

lazy_5 x = lazy_seq x 5

lazy_8 x y = map (\x-> (fst x + snd x)) (zip (lazy_3 x) (lazy_5 y)) -- I would not describe this as function composition


