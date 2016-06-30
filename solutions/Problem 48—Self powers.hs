main = putStrLn $ show $ mod (sum [x^x | x <- [1..1000]]) (10^10)
