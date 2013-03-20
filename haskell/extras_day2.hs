module Main where

{-Write a function to determine the greatest common denominator of two integers.
-}

--Good ol' Greatest Common divisor
my_gcd :: Integral a => a -> a -> a
my_gcd _ 1 = 1
my_gcd a b = if (a==b) 
                then a 
                else my_gcd (maxarg - minarg) minarg
                     where minarg = min a b
                           maxarg = max a b

{- Create a lazy sequence of prime numbers. -}

--Primes. This is almost frightening in its expressiveness.
--It's appallingly inefficient, though.
divisors n = filter (\x -> (mod n x) == 0)  [2..(div (n+1) 2)]
prime = (\x -> x==0) . length . divisors
lazy_primes = filter prime [2..]

{- Break a long string into individual lines at proper word boundaries. -}

{-I'm going to use some library functions, and reading ahead, I think he means
split a string into lines of a specified length at word boundaries. -}

--Compose a line up to a given length from a list of words.
--FIXME: Infnite loop if any word exceeds the line length
-- compose_words line_length line_so_far word_list -> (complete_line, leftover_words)
compose_line ::  Int -> String -> [String] -> (String, [String])
compose_line _ line [] = (line, []) 
compose_line line_length current_line word_list = 
             if length current_line + (length $ head word_list) + 1 >= line_length
                then (current_line, word_list)
                else compose_line line_length (current_line ++ needed_space ++ (head word_list)) (tail word_list)
                     where needed_space = if current_line=="" then "" else " " --Don't start with a space

--Split a list of words into a list of lines
--that do not exceed a certain length (I cannot believe this worked on first try)
make_lines :: Int -> [String] -> [String]
make_lines _ [] = []
make_lines n word_list = (fst first_line):(make_lines n $ snd first_line)
                            where first_line = compose_line n "" word_list

{- Add line numbers to the previous exercise. -}
line_number :: Int -> [String] -> [String]
line_number _ [] = []
line_number n (x:xs) = (show n ++ ":\t" ++ x):(line_number (n + 1) xs) 

number_lines :: [String] -> [String]
number_lines = line_number 0

--Take a line length and a block of text and
--break it into lines not exceeding the length
text_to_lines :: Int -> String -> [String]
text_to_lines n s = make_lines n $ words s

--Justify functions
lpad :: Int -> String -> String
lpad 0 s = s
lpad n s = if length s == n then s else " " ++ lpad (n - 1) s

left_justify n = unlines . text_to_lines n
right_justify n s = unlines $ map (\x -> lpad n x) (text_to_lines n s)
full_justify = undefined
data Margin = LJust | RJust | FJust
     deriving (Show)

--Take a string of text, and split it to justified lines
justify :: Margin -> Int -> String -> String
justify LJust = left_justify
justify RJust = right_justify
justify FJust = full_justify

text = "If you should ever find yourself in the company of a hobbit and an ill-tempered dragon, remember - you do not have to outrun the dragon."

main :: IO ()
main = do
     putStrLn $ justify RJust 25 text