import Data.Char


--Reverse the given list
reverseList :: [a] -> [a]
reverseList	xs = undefined

-- the surface area of a cone is pi * radius * (radius + sqrt(h^2 + r^2))
-- your inputs are radius and height
-- you should take out some of the complexity with a let or a where!
surfaceAreaOfACone :: (RealFloat a) => a -> a -> a
surfaceAreaOfACone r h = undefined

-- take in a list of words, output an acronym for it!
-- the haskell keywords "words" is helpful here
-- if a word is lowercase, then it doesn't go in the abbreviation
-- therefore, Federal Bureau of Investigations turns into F.B.I., and not F.B.o.I.
-- Make sure to separate each letter in the acronym with a "."
acronym :: String -> String
acronym phrase = undefined


-- Convert something from english to pig latin
-- For each word, do the following:
-- If the first letter is a vowel, simply add "ay" to the end of the word
-- If it is not, move the first letter to the end of the work, then add and add "ay" to the end
-- In pigLatin, we also capitalize the first letter of every word, so make sure to do that as well (toUpper may be a useful function)
-- again, a helper function with 'words' is useful here, as well as infix elem
-- Ex: pigLatin "hello world" = "Ellohay Orldway"
pigLatin :: String -> String
pigLatin phrase = undefined

main = print x
    where x = pigLatin "Federal Bureau of Investigations"
