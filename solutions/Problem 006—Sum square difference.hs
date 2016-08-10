main = print $ sum nums ^2 - sum (map (^2) nums)
    where
        nums = [1..100]
