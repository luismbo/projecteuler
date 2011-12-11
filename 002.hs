fibs = 1 : 2 : zipWith (+) fibs (tail fibs)
euler002 = sum . takeWhile (<= 4000000) . filter even $ fibs

-- alt #1
phi = (1 + sqrt 5) / 2
fib n = round $ phi^n / sqrt 5
evenFibs = map fib [3,6..]
euler002' = sum $ takeWhile (<= 4000000) evenFibs
