import           Data.List
import           Data.Numbers.Primes

{-
The number of divisors of a function is the product of the powers of each of
its prime factors plus 1. That is, if n = p^q*n^r*j^k, then the number of its
divisors is q*r*k.
-}

triangularNums = 0  : scanl (+) 1 [2..]
numDivisors x = product $ map ((+ 1) . length) $ group $ primeFactors x

main = print result
    where
        result = head results
        results = dropWhile ((< 500) . numDivisors) triangularNums
