half :: Fractional a => a -> a
half = (*) 0.5

add_lf :: String -> String
add_lf = reverse . (\x -> "\n" ++ x) . reverse