-- create a copy of the "map" HOF in Haskell, called newMap
-- the "map" function returns a list constructed by appling a function (the first argument) to all items in a list passed as the second argument
-- For example: map (+2) [1,2] = [3,4]
newMap :: (a -> b) -> [a] -> [b]
newMap _ [] = []
newMap f (x:xs) = f x : newMap f xs


-- create a copy of the "foldl" HOF in haskell, called newFoldl
-- The foldl function takes the second argument and the first item of the list and applies the function to them, then feeds the function with this result and the second argument and so on
-- An example: foldl (-) 0 [1,5,10,13] = -29, first we subtract 1 from 0 and get -1, then subtract 5 from -1, and so on
newFoldl :: (a-> b -> a) -> a -> [b] -> a
newFoldl _ z [] = z
newFoldl f z (x:xs) = newFoldl f (f z x) xs

-- create a copy of the "filter" HOF in Haskell, called newFilter
-- For example newFilter (>3) [1,2,3,4,5] = [4,5] since those are the only elements that are greater than 3
newFilter :: (a -> Bool) -> [a] -> [a]
newFilter f (x:xs) = if f x
    then x : newFilter f xs
    else newFilter f xs
newFilter _ [] = []

-- use foldr1 and a lambda to implement a copy of Haskell's "head" function, called newHead
-- Gets the head of the list
newHead :: [a] -> a
newHead xs = foldr1 (\x _ -> x) xs


-- use a higher order function to implement a copy of Haskell's "product" function, called newProduct
newProduct :: (Num a) => [a] -> a
newProduct [] = 1
newProduct xs = foldl (*) 1 xs

-- given a list of circle radii, return a list of areas of the corresponding circles. Use higher order functions and lambdas
getCircleAreas :: (RealFloat a) => [a] -> [a]
getCircleAreas [] = []
getCircleAreas xs = map (\x -> pi * x^2) xs
