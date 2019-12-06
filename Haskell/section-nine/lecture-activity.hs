--- To test these functions, compile and test using the repl
--- Create a function fullWords, that takes in an integer, and outputs
--- the digits of the integer, with hyphens in between them (ignore leading zeroes)
--- For example, the input "145" will result in an output of "one-four-five"
--- and the input "098" will result in an output of "nine-eight"
--- "intersperse" and a lookup table will be helpful for this problem,
--- as well as the function "digitToInt"!


import Data.Char
import Data.List

fullWords :: Integer -> String
fullWords = undefined

--- Create a function quicksort, that takes in a list and outputs a sorted version
--- of it. You will need to do this recursively!
--- For an explanation on how quicksort works, use this link: https://www.geeksforgeeks.org/quick-sort/
--- TL;DR: Look at the first element of the list, which will will call 'x', and create two separate sublists
--- from from the rest of the list, one for all the elements < x, and one for all of the elements
--- greater than x, such that we return
--- lessThanXList ++ [x] ++ greaterThanXList
--- Hint hint, you will need to recursively call quicksort on these two sublists!

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let lessThanXList = quicksort [a | a <- xs, a <= x]
	greaterThanXList = quicksort [a | a <- xs, a > x]
    in lessThanXList ++ [x] ++ greaterThanXList

--- Create a recursive copy of the function "elem," called "elem'"
--- Remember, "elem" checks for membership in a list, so for example
--- "elem 1 [1,2,3,4,5]" returns True, and
--- "'o' `elem` "Qwerty"" returns False
--- For the purposes of readability, it might be helpful for you to recursively call "elem'" with the infix operator!

elem' :: (Eq a) => a -> [a] -> Bool
elem' x = any (== x)
elem' _ [] = False
elem' x (y:ys) = x==y || elem' x ys
