module Main where

data State = WA | NT | QLD | SA | NSW | VIC
     deriving (Eq, Show)
states :: [State]
states = [WA, NT, QLD, SA,  NSW, VIC]

data Colour = Red | Green | Blue | Yellow
     deriving (Eq, Show)
colours:: [Colour]
colours = [Red, Green, Blue]
                  
colouring = [  [(WA, c_wa),
                (NT, c_nt),
                (QLD, c_qld),
                (SA, c_sa),
                (NSW, c_nsw),
                (VIC, c_vic) ] | 
                      c_wa <- colours, 
                      c_nt <- colours,
                      c_qld <- colours,
                      c_sa <- colours,
                      c_nsw <- colours,
                      c_vic <- colours, c_wa /= c_nt,
                                        c_wa /= c_sa,
                                        c_nt /= c_qld,
                                        c_nt /= c_sa,
                                        c_qld /= c_nsw,
                                        c_qld /= c_sa,
                                        c_nsw /= c_sa,
                                        c_nsw /= c_vic,
                                        c_sa /= c_vic]

main :: IO ()
main = do
       putStrLn . unlines . map show $ colouring
