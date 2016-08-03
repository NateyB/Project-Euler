import Data.Char

main = putStrLn $ show $ solution
    where
        solution = maximum $ map (sum . (map digitToInt) . show) possibilities
        possibilities = [a^b | a <- [1..99], b <- [1..99]]
