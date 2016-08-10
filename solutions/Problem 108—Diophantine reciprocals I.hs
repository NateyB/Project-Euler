{-
Oh, my. What a saga this problem was for me. I've always struggled with dealing
with Diophantine equations, since in high school during the math competitions I
could never quite figure them out (and they're the ones which I got wrong).

I was excited to tackle this problem because it was so reminiscent of those old
equations, and it would be a sort of fulfillment to have gotten one correct.
Historically, I have merely provided my solutions with an annotation, but I
think that this time I'll tell you a story.


First, I tried to reduce the problem. The following is an excerpt from my
initial comments:
"We know from the hyperbola 1/x + 1/y = 1/n that the bounds of x and y are in
[n + 1, n(n + 1)] because it asymptomatically approaches n in both x and y.
Solving the above equation for y, we have y = x*n(x - n)

We only care about the number of solutions, so checking for an integer solution
y is equivalent to checking x*n mod (x - n) == 0

The question, however, asks for the number of *unique* solutions. We know that
the hyperbola is symmetric about y = x (substitute into the equation; addition
is abelian/commutative), so we can set our x value to possibilities only on and
past that line of symmetry. That line of symmetry occurs when, as in the
equation above, y = x. 1/x + 1/x = 1/n -> 2/x = 1/n; x = 2n.

Therefore, we only need to check integers in the range x <- (2n, n(n + 1)) for
xn mod (x - n) == 0.
The solution is still quadratic in time, but that's way better than before.

And apparently not good enough, because having to run this on all of the natural
numbers until one is found is very expensive (I think cubic is a reasonable
assumption). So I need to find a way to do one of the following:
- Identify a small range of n values for which it could be
- Generate the x values more efficiently (in linear time)"

My work yielded this equation:
solutions = map (\n -> (n, 2 + (length $ [True|x <- [(2*n + 1)..(n*(n + 1) - 1)], ((x*n) `mod` (x - n)) == 0]))) [0..]
which stored with each integer the number of solutions that it could use. As
you can read in my notes, I saw that I had a problem: Too slow.


Given the importance of prime factors in number-theoretic problems, I decided to
try to find consistencies in answers based on the factors. The following work
is the charts and equations that I used in this process:

"I've observed that the number of unique solutions at 2^n is n + 1. I think that
this consistency is a clue.
Similarly, 3^n is n + 1.
Same with 7. So any prime to the nth power has merely solutions n + 1.
Next, 6^1 is 5 = 2^1 + 3^1 + 1
      6^2 is 5 + 8 = 5 + (2 + 2 + 2 + 2)
      6^3 is 5 + 8 + 12 = 5 + 8 + (2 + 2 + 2 + 2 + 2 + 2)
      6^4 is 5 + 8 + 12 + 16 = 5 + 8 + 12 + (2 + 2 + 2 + 2 + 2 + 2 + 2 + 2)
      6^5 is 5 + 8 + 12 + 16 + 20 = 5 + 8 + 12 + 16 + 2*10 = 2^5 + 2^5 - 2

s(product of 1 distinct prime)  is    2
s(product of 2 distinct primes) is    5
s(product of 3 distinct primes) is   14
s(product of 4 distinct primes) is   41
s(product of 5 distinct primes) is  122
s(product of 6 distinct primes) is  365
s(product of 7 distinct primes) is 1094

Or, the # of solutions for product of n distinct primes is
func n |
    n == 1 = 2
    otherwise = 3^(n - 1) + func(n - 1)

s(product of prime^0 and another prime) is    2 = 2
s(product of prime^1 and another prime) is    5 = 2 + 3
s(product of prime^2 and another prime) is    8 = 2 + 3 + 3
s(product of prime^3 and another prime) is   11 = 2 + 3 + 3 + 3
s(product of prime^4 and another prime) is   14 = 2 + 3 + 3 + 3 + 3
s(product of prime^4 and another prime) is   17 = 2 + 3 + 3 + 3 + 3 + 3
s(product of prime^n and another prime) is   2 + 3n

s(product of prime^0 and another prime^2) is  3 = 3
s(product of prime^1 and another prime^2) is  8 = 3 + 5
s(product of prime^2 and another prime^2) is 13 = 3 + 5 + 5
s(product of prime^3 and another prime^2) is 18 = 3 + 5 + 5 + 5
s(product of prime^4 and another prime^2) is 23 = 3 + 5 + 5 + 5 + 5
s(product of prime^5 and another prime^2) is 28 = 3 + 5 + 5 + 5 + 5 + 5
s(product of prime^n and another prime^2) is 3 + 5n

s(product of prime^0 and another prime^3) is  4 = 4
s(product of prime^1 and another prime^3) is 11 = 4 + 7
s(product of prime^2 and another prime^3) is 18 = 4 + 7 + 7
s(product of prime^3 and another prime^3) is 25 = 4 + 7 + 7 + 7
s(product of prime^4 and another prime^3) is 32 = 4 + 7 + 7 + 7 + 7
s(product of prime^5 and another prime^3) is 39 = 4 + 7 + 7 + 7 + 7 + 7
s(product of prime^n and another prime^3) is 4 + 7n

s(product of prime^0 and another prime^4) is  5 = 5
s(product of prime^1 and another prime^4) is 14 = 5 + 9
s(product of prime^2 and another prime^4) is 23 = 5 + 9 + 9
s(product of prime^3 and another prime^4) is 32 = 5 + 9 + 9 + 9
s(product of prime^4 and another prime^4) is 41 = 5 + 9 + 9 + 9 + 9
s(product of prime^5 and another prime^4) is 50 = 5 + 9 + 9 + 9 + 9 + 9
s(product of prime^n and another prime^4) is 5 + 9n

s(product of 3 distinct primes) is   14
s(product of prime^2 and another 2 primes) is 23 = 14 + 9
s(product of prime^3 and another 2 primes) is 32 = 14 + 9 + 9
s(product of prime^n and another 2 primes) = s(3 distinct primes) + 3^2*(n - 1)

s(product of prime^1 and another prime^2 and another prime^2) is 38 = 14 + 9 + 15
s(product of prime^1 and another prime^2 and another prime^3) is 53 = 14 + 9 + 15 + 15
s(product of prime^1 and another prime^2 and another prime^4) is 68 = 14 + 9 + 15 + 15 + 15
s(product of prime^1 and another prime^2 and another prime^n) is 14 + 9 + 15(n - 1)

s(product of prime^2 and another prime^2 and another prime^1) is  38 = 14 + 9 + 15 + 25*0
s(product of prime^2 and another prime^2 and another prime^2) is  63 = 14 + 9 + 15 + 25*1
s(product of prime^2 and another prime^2 and another prime^3) is  88 = 14 + 9 + 15 + 25*2
s(product of prime^2 and another prime^2 and another prime^4) is 113 = 14 + 9 + 15 + 25*3
s(product of prime^2 and another prime^2 and another prime^n) is 14 + 9 + 15 + 25*(n - 1)

s(product of prime^3 and another prime^2 and another prime^1) is  53 = 14 + 9 + 15*2
s(product of prime^3 and another prime^2 and another prime^2) is  88 = 14 + 9 + 15*2 + 35
s(product of prime^3 and another prime^2 and another prime^3) is 123 = 14 + 9 + 15*2 + 35*2
s(product of prime^3 and another prime^2 and another prime^4) is 158 = 14 + 9 + 15*2 + 35*3
s(product of prime^3 and another prime^2 and another prime^n) is  14 + 9 + 15*2 + 35*(n - 1)

s(product of prime^4 and another prime^3 and another prime^2) is 158 = 14 + 3(3 + 3*5 + 5^2 + 5)
s(product of prime^n and another prime^q and another prime^j) is s(three distinct) + 9*(n - 1) + 15*(q - 1) + 25*(j - 1)

s(product of 4 distinct primes) is   41
s(product of prime^2 and 3 other primes) is 68 = 41 + 27
s(product of prime^2 and prime^2 and 2 other primes) is 113 = 41 + 3^3 + 3^2*5
s(product of prime^3 and prime^2 and 2 other primes) is 158 = 68 + 45 + 45
s(product of prime^2 and prime^2 and prime^2 and other prime) is 188 = 113 + 75
s(product of prime^3 and 3 other primes) is 95 = 41 + 27 + 27

s(product of 5 distinct primes) is  122
s(product of prime^2 and 4 other primes) is 203 = 122 + 3^4
s(product of prime^3 and 4 other primes) is 284 = 122 + 81 + 81
s(product of prime^n and 4 other primes) is 284 = 122 + 3^4*(n - 1)

s(product of prime^2 and prime^2 and 3 other primes) is 338 = 203 + 135

s(prime^n) = n + 1
s(prime^n * prime^q) = q + 1 + n(1 + 2q)
s(prime^n * q other primes) = s(q + 1 distinct primes) + 3^q(n - 1)

s(product of prime^q and another prime^0 and another prime^n) is 1 + 1(n + q + 2qn)
s(product of prime^0 and another prime^2 and another prime^n) is 3 + 0*5 +  5n
s(product of prime^1 and another prime^2 and another prime^n) is 3 + 1*5 + 15n
s(product of prime^2 and another prime^2 and another prime^n) is 3 + 2*5 + 25n
s(product of prime^3 and another prime^2 and another prime^n) is 3 + 3*5 + 35n
s(product of prime^q and another prime^2 and another prime^n) is 3 + 5q + (5 + 10q)n
                                                               = 3 + 5q + 5n + 10qn
                                                               = 3 + 5(n + q + 2qn)
This appears to be the trend:
s(prime^n)                     is                                       n + 1
s(prime^n * prime^q)           is                           q(1 + 2n) + n + 1
s(prime^n * prime^q * prime^j) is       j(1 + 2n)(1 + 2q) + q(1 + 2n) + n + 1

I'm going to assume that the following holds:
s(prime^n * prime^q * prime^j * prime^d) is d(1 + 2j)(1 + 2n)(1 + 2q) + j(1 + 2n)(1 + 2q) + q(1 + 2n) + n + 1

And use that to construct the general formula:
s(prime^a * prime^b * ... * prime^n) is a(1 + 2b)(...)(1 + 2n) + b(...)(1 + 2n) + ... + n + 1"

So, as you can see, I constructed a general formula—the one used below. It,
fortunately for me, worked. I must confess that I'm slightly disappointed that I
didn't derive the solution in a more elegant manner—but hopefully reading the
forum comments will explain to me why this worked.
-}

import           Data.List
import           Data.Numbers.Primes

-- Where primes is a list of powers of each prime (the actual value of the prime is irrelevant)
numSolutionsGivenPrimes :: [Int] -> Int
numSolutionsGivenPrimes              [] = 1 -- Not technically true, but meh.
numSolutionsGivenPrimes (pow:remainder) = pow * product (map ((1+) . (2*)) remainder) + numSolutionsGivenPrimes remainder

main = print result
    where
        result = head $ filter ((> exceedsUnique) . numSolutionsGivenPrimes . map length . group . primeFactors) [1..]
        exceedsUnique = 1000
