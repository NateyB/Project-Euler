fac :: Int -> Int
fac n = product [1..n]

delete :: [a] -> Int -> [a]
delete elts n = let (hs, ts) = splitAt n elts in hs ++ (tail ts)

getNthPerm :: [a] -> Int -> [a]
getNthPerm elts n = permute elts (n - 1) []
    where
        permute :: [a] -> Int -> [a] -> [a]
        permute [] _ sel  = (reverse sel)
        permute items n sel = let (digits, q) = (fac (length items - 1), n `div` digits) in
                                  permute (delete items q)
                                          (n - q*digits)
                                          ((items !! q) : sel)

main = print $ getNthPerm ['0'..'9'] (10^6)

{-
Alternative solution:
import Data.List

main = print $ (sort permutations) !! (10^6 - 1)
-}
