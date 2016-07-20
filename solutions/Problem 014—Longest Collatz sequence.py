collatzLens = {1:1}

def collatzFunc(n):
    if collatzLens.get(n, -1) != -1:
        return collatzLens[n]
    else:
        value = 0
        if (n % 2 == 0):
            value = collatzFunc(n/2) + 1
        else:
            value = collatzFunc(3*n + 1) + 1
        collatzLens[n] = value
        return collatzLens[n]

def run(maximum=1000000 - 1):
    argmax = 1
    for n in range(2, maximum):
        if collatzFunc(n) > collatzFunc(argmax):
            argmax = n
    return argmax

print(run())
