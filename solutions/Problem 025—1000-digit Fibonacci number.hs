fibs = 0 : 1 : zipWith(+) fibs (tail fibs)

main = putStrLn $ show $ length $ takeWhile ((< 1000) . length . show) fibs
