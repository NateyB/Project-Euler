import Data.Char
import Data.Array

magnitude = 7 -- The power of ten beneath which to get the values ending in 89

getStart :: [Int] -> [Int]
getStart = dropWhile (and . (zipWith (/=) [89, 1]) . repeat)

nextNumber :: Int -> Int
nextNumber = (sum . map ((^2) . digitToInt) . show)

-- | Because we're examining all numbers below 10^7, the highest possible
-- digit sum is 7*(9^2), if the number is 99999999. So we only need to memoize
-- the values between 1 and that highest number
memoArray = listArray bounds thisList
    where bounds = (1, upper)
          thisList =  False : [89 == (head . getStart . iterate (nextNumber)) i | i <- [2..upper]]
          upper = 81*magnitude

main = print $ length $ solutions
    where solutions = filter (id) values
          values = map ((memoArray !) . nextNumber) [1..10^magnitude - 1]
