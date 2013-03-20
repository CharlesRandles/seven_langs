module Main where
import Data.Char

numerify :: String -> Float
numerify s = read $ filter (\c -> ((isDigit c) || (c=='.'))) s 

main :: IO ()
main = do
     putStrLn $ show $ numerify "$02,523,782.00" 

