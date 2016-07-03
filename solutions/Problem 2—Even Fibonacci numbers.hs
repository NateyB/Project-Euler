main = putStrLn $ show result
    where
        result = sum $ filter (even) (takeWhile (< 4000000) fibs)
        fibs = 0 : 1 : (zipWith (+) fibs (tail fibs))
