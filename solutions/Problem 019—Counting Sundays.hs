data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday
             | Saturday | Sunday
             deriving (Eq, Show, Enum)

addLeapDays :: Int -> Int
addLeapDays year
            | year `mod` 400 == 0 = 1
            | year `mod` 100 == 0 = 0
            | year `mod` 4 == 0 = 1
            | otherwise = 0

getDayOfWeek :: Int -> Int -> Int -> Weekday
getDayOfWeek d m y
            | m <= 2 = toEnum result -- In or before February --> ignore leap days
            | otherwise = toEnum $ mod (result + addLeapDays y) 7
        where
            result = mod (remainders + d + yearRemainder) 7
            remainders = sum $ take (m - 1) monthRemainders
            monthRemainders = [3, 0, 3, 2, 3, 2, 3, 3, 2, 3, 2, 3]
            yearRemainder = sum [numDaysInYear i| i <- [1901..(y - 1)]]
            numDaysInYear = (365 +) . addLeapDays


main :: IO ()
main = print $ length $ filter (== Sunday) [getDayOfWeek 1 m y | m <- [1..12], y <- [1901..2000]]
