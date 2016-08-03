{-
As a side remark, setting the of possible repetitions at 30 is also
acceptable--and allows the Int, rather than the Integer, type to be used
(and therefore is faster).
-}
isLychrel int = performCount 1 (nextIteration int)
    where
        isPalindrome n = let showN = show n in showN == reverse showN
        nextIteration n = n + ((read $ reverse $ show n) :: Integer)
        performCount 50 _ = True
        performCount n int
                    | (isPalindrome int) = False
                    | otherwise = performCount (n + 1) (nextIteration int)

main = putStrLn $ show $ solution
    where
        solution = length $ filter isLychrel [1..10000]
