-- Find the element with the longest collatz sequence less than 1 million
import Data.HashMap.Strict

memoizeCollatz :: HashMap Int Int -> Int -> HashMap Int Int
memoizeCollatz map n
    | member n map = map
    | even n = insert n (1 + (evenMap ! (n `div` 2))) evenMap 
    | otherwise = insert n (1 + (oddMap ! (3*n + 1))) oddMap
        where
        evenMap = memoizeCollatz map (n `div` 2)
        oddMap = memoizeCollatz map (3*n + 1)

main :: IO()
main = print solution
    where
        solution = foldrWithKey argmax 1 finalMap 
        argmax key val other
            | val > (finalMap ! other) = key
            | otherwise = other
        finalMap = foldl memoizeCollatz (singleton 1 0) [2..magnitude]
        magnitude = 10^6 :: Int
