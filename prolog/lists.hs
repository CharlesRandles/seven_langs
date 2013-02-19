chaz_last (x:[]) = x
chaz_last (_:xs) = chaz_last xs

main = do
     putStrLn $ show $ chaz_last [1,2,3,4]
