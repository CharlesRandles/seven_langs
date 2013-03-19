module Main where

{-How many different ways can you find to write allEven?-}

{-List consing-}
allEven_1 :: [Integer] -> [Integer]
allEven_1 [] = []
allEven_1 (x:xs) = 
          if even x 
             then x:allEven_1 xs 
             else allEven_1 xs

{- Point Free -}
allEven_2 :: [Integer] -> [Integer]
allEven_2 = filter even

{- List comprehension -}
allEven_3 :: [Integer] -> [Integer]
allEven_3 l = [x | x <- l, even x]


{-Write a function that takes a list and returns the same list in reverse. -}
--my_reverse :: [a] -> [a]
my_reverse [] = []
my_reverse (x:[]) = [x]
my_reverse (x:xs) = (my_reverse xs) ++ [x]

{-      Write a function that builds two-tuples with all possible combinations 
        of two of the colors black, white, blue, yellow, and red. 
        Note that you should include only one of (black, blue) and (blue, black).
-}
data Colour = Black | White | Blue | Yellow | Red
     deriving (Eq, Show, Ord)
colour_pairs :: [(Colour, Colour)]
colour_pairs = [(x,y) | x <- colours, y<-colours, x < y]
             where colours = [Black,  White,  Blue,  Yellow, Red]

{-           Write a list comprehension to build a childhood multiplication table. 
             The table would be a list of three-tuples 
             where the first two are integers from 1–12 and the third is the product of the first two.
-}
times_table :: [(Int, Int, Int)]
times_table = [(x, y , (x * y)) | x<- [1..12], y<-[1..12]]

main :: IO ()
main = do
     putStrLn $ show $ allEven_1 [1,2,3,4,5,6,7,8,9]
     putStrLn $ show $ allEven_2 [1,2,3,4,5,6,7,8,9]
     putStrLn $ show $ allEven_3 [1,2,3,4,5,6,7,8,9]
     putStrLn $ show $ my_reverse [1,2,3,4]
     putStrLn $ show colour_pairs
     putStrLn $ show $ last times_table
     
