-- Just another brute force approach
main = putStrLn $ show $ result
    where
        result = (fst first)*(snd first)*(1000 - (fst first) - (snd first))
        first = head $ options
        options = [(a,b) | a <- [1..1000], b <- [1..(1000 - a)], a^2 + b^2 == (1000 - a - b)^2 ]
