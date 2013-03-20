module Main where
import Data.List 

{- quicksort form memory. likely to be wrong. -}
qsort1 :: Ord a => [a] -> [a]
qsort1 []=[]
qsort1 (x:[]) = [x]
qsort1 (x:xs) = (qsort1 $ smaller x xs) ++ [x] ++ (qsort1 $ larger x xs)
      where smaller a as = filter (\x -> (x < a)) as
            larger a as = filter (\x -> (x > a)) as

{- Now pass in the comparision as well -}
qsort2 :: (a -> a -> Bool) -> [a] -> [a]
qsort2 _  []=[]
qsort2 _ (x:[]) = [x]
qsort2 f (x:xs) = (qsort2 f (smaller x xs)) ++ [x] ++ (qsort2 f (larger x xs))
      where smaller a as = filter (\x -> (f x a)) as
            larger a as = filter (\x -> (not (f x a))) as


main :: IO ()
main = do
     let source = words "Now is the winter of our discontent" in
         let qs1 = unwords $ qsort1 source
             qs2 = unwords $ qsort2 by_length source in
                 putStrLn  $ qs1 ++"\n" ++ qs2
                           where by_length a b = (length a < length b)