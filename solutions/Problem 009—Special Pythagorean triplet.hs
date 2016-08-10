-- Just another brute force approach
main = print result
    where
        result = uncurry (*) first * 1000 - uncurry (+) first
        first = head options
        options = [(a,b) | a <- [1..1000], b <- [1..(1000 - a)], a^2 + b^2 == (1000 - a - b)^2 ]
