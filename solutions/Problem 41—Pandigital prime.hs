import Data.Numbers.Primes
import Data.List

getPerms :: Int -> [Int]
getPerms num = ((map read (permutations (take num "123456789"))) :: [Int])

-- Get max of all primes that are permutations of the first digits 1 through 9.
main = putStrLn $ show $ result
    where
        result = maximum finalSolutions
        finalSolutions = concatMap ((filter (isPrime)) . getPerms) [1..9]
