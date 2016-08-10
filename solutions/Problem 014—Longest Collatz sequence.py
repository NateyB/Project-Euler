collatzLens = {1:1}

def collatz_func(n):
    if collatzLens.get(n, -1) != -1:
        return collatzLens[n]
    else:
        value = 0
        if (n % 2 == 0):
            value = collatz_func(n/2) + 1
        else:
            value = collatz_func(3*n + 1) + 1
        collatzLens[n] = value
        return collatzLens[n]

def run(maximum=1000000 - 1):
    argmax = 1
    for n in range(2, maximum):
        if collatz_func(n) > collatz_func(argmax):
            argmax = n
    return argmax

print(run())
