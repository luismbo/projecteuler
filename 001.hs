divides x y = y `mod` x == 0
euler001 = sum [ x | x <- [1..1000], 3 `divides` x || 5 `divides` x ]
