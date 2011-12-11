import Data.List
import Data.Char

units = [ "", "one", "two", "three", "four", "five", 
          "six", "seven", "eight", "nine" ]
tens = [ "", "ten", "twenty", "thirty", "forty", "fifty",
         "sixty", "seventy", "eighty", "ninety" ]
special = [ "eleven", "twelve", "thirteen", "fourteen", "fifteen", 
            "sixteen", "seventeen", "eighteen", "nineteen" ]
          
divides x y = y `mod` x == 0

represent n
  | n < 10 = units !! n
  | 10 `divides` n && n < 100 = tens !! (n `div` 10)
  | n < 20 = special !! (n-11)
  | n < 100 = represent (n `div` 10 * 10) ++ "-" ++ represent (n `mod` 10)
  | n < 1000 = represent (n `div` 100) ++ " hundred" ++ tens'
  | n == 1000 = "one thousand"
  where tens' = if null tens''
                then ""
                else " and " ++ tens''
        tens'' = represent (n `mod` 100)

euler017 = foldl (+) 0 $ map (length . (filter isAlpha) . represent) [1..1000]
