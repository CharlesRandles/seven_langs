module Main where
import qualified Data.Map as Map

{- Data.Map.Lookup already returns Maybe. Here's a ghci session.
Prelude> :m Data.Map
Prelude Data.Map> let m = Data.Map.fromList[(1,"First"), (2, "Second")]
Loading package array-0.4.0.0 ... linking ... done.
Loading package deepseq-1.3.0.0 ... linking ... done.
Loading package containers-0.4.2.1 ... linking ... done.
Prelude Data.Map> :t m
m :: Map Integer [Char]
Prelude Data.Map> :t Data.Map.lookup
Data.Map.lookup :: Ord k => k -> Map k a -> Maybe a
Prelude Data.Map> Data.Map.lookup 2 m
Just "Second"
Prelude Data.Map> Data.Map.lookup 3 m
Nothing
-}

{- Write a function that looks up a hash table value that uses the Maybe monad. -}

data HashMap k v = HashMap [(k,v)]
     deriving (Show)

m = HashMap [(1,11), (2,22)]

hashLookup :: Ord k => k -> HashMap k v -> Maybe v
hashLookup _ (HashMap []) = Nothing
hashLookup k (HashMap ((a,b):xs)) = if a == k then Just b else hashLookup k (HashMap xs)

{- Write a hash that stores other hashes, several levels deep. Use the Maybe monad to retrieve an element for a hash key several levels deep. -}
data HashPair k v = HashPair (k,v)
                  | NestPair (k, DeepHash k v)
        deriving (Show)

data DeepHash k v = DeepHash [HashPair k v]
     deriving Show

--Build a funky data structure
a1 = HashPair(1, "one")
a2 = HashPair(2, "two")
a3 = HashPair(3, "three")
b1 = NestPair (4, DeepHash [HashPair(5, "five")])
d1 = DeepHash [b1]
e1 = NestPair (6, d1)
dh = DeepHash [a1,a2,a3,b1, e1]

--Traverse a funky data structure
deepLookup :: (Ord k, Eq v) => k -> DeepHash k v -> Maybe v
deepLookup _ (DeepHash []) = Nothing
deepLookup k (DeepHash ((HashPair (a,b)):xs)) = if a == k then Just b else deepLookup k (DeepHash xs)
deepLookup k (DeepHash ((NestPair (a, DeepHash deep)):xs)) =
           if deepSearch /= Nothing then deepSearch else deepLookup k (DeepHash xs)
              where deepSearch = deepLookup k (DeepHash deep)

main :: IO ()
main = do
     putStrLn $ show m
     putStrLn $ show $ hashLookup 2 m
     putStrLn $ show $ hashLookup 3 m
     putStrLn $ show dh
     putStrLn $ show $ deepLookup 3 dh
     putStrLn $ show $ deepLookup 4 dh
     putStrLn $ show $ deepLookup 5 dh
     putStrLn $ show $ deepLookup (-23) dh
     
