{-
This problem is a simple combinatorics problem. Since we can only go
down or to the right, we know that the maximum number of moves is twice
the side-length of the lattice. From that pool of moves, we have to choose
half of them. Why half? Because the other half is determined for us.
Suppose that we're selecting right movements. We can pick those twenty right
movements at any of the 40 possible moments, and the rest will be determined.
-}

fac n = product [1..n]
choose n q = fac n `div` (fac q * fac (n - q))

main = print $ choose 40 20
