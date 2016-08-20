lettersUntil :: Int -> Int
lettersUntil n = sum result
    where
        result = tail $ take (n + 1) (numLengths ++ map lettersIn [15..n])
        -- The primary name lengths; one, two, three, four, etc.
        numLengths = [(-10^6), 3, 3, 5, 4, 4, 3, 5, 5, 4, 3, 6, 6, 8, 8]
        -- The secondary name lengths; twen, thir, for, fif, etc.
        numLengths2 = [(-10^6), (-10^6), 4, 4, 3, 3, 3, 5, 4, 4]

        lettersIn :: Int -> Int
        lettersIn 1000 = 11
        lettersIn 0 = 0
        lettersIn n
                | n < length numLengths = numLengths !! n
                | n >= 100 && n `mod` 100 > 0 = (numLengths !! (n `div` 100))
                                                + 10 + (lettersIn $ n `mod` 100)
                | n `mod` 100 == 0 = (numLengths !! (n `div` 100)) + 7
                | n < 100 && n >= 20 = (numLengths2 !! (n `div` 10))
                                                + 2 + (lettersIn $ n `mod` 10)
                | n < 20 = numLengths2 !! (n - 10) + 4 -- + "teen"

main :: IO()
main = print $ lettersUntil 1000
