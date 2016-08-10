fibs = 0 : 1 : zipWith(+) fibs (tail fibs)

main = print $ length $ takeWhile ((< 1000) . length . show) fibs
