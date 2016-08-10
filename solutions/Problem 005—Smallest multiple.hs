{-
Initially, I did the following:
 1:
 2: 2
 3:         3
 4: 2 2
 5:             5
 6: 2       3
 7:               7
 8: 2 2 2
 9:         3 3
10: 2           5
11:                 11
12: 2 2     3
13:                    13
14: 2             7
15:         3   5
16: 2 2 2 2
17:                       17
18: 2       3 3
19:                          19
20: 2 2         5

--> 2*2*2*2*3*3*5*7*11*13*17*19
  = 232792560

But this time, I wanted to make a function that could calculate the LCD for an
arbitrary set of numbers.
-}

-- Wow, I had no idea Prelude included an lcm function. Research before you act!
main = print $ foldl1 lcm [2..20]
