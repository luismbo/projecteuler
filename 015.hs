import Data.List

-- not a proper answer, see 015.txt for one. This was useful to
-- experiment with, though.

generateActions w h = (take w $ repeat '>') ++ (take h $ repeat 'v')
possibleRoutes w h = nub $ permutations $ generateActions w h
euler015 w h = length $ possibleRoutes w h
