{-
Another brute force approach.
In my defense, my actual solution (probably this code, anyway) was lost, so I
redid this problem.
-}
main = putStrLn $ show result
    where
        result = maximum $ filter (\z -> (show z) == (reverse $ show z)) [x*y | x <- [100..999], y <- [100..999]]
