import Data.List (find)

divides x y = y `mod` x == 0

intSqrt n = floor $ sqrt $ fromIntegral n

divisorCount 1 = 1
divisorCount n = sum [ 2 | x <- [1 .. intSqrt n], x `divides` n ]

trig n = n*(n+1) `div` 2

trigNumbers = map trig [1..]

euler012 = find (\x -> divisorCount x > 500) trigNumbers

main = print euler012