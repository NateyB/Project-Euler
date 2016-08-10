import           Data.Numbers.Primes

main = print result
    where
        num = 600851475143
        result = last $ filter ((== 0) . mod num) (take (floor $ sqrt $ fromIntegral num) primes)
