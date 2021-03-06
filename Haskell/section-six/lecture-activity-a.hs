{-
Given two files, print out how many first person pronouns are present in each file (Use threads to make this concurrent)
For each file, print out "[file name] has [insert number of pronouns here] first person pronouns"
You can run this function by first compiling using stack ghc, then running `./lecture-activity-a [first file] [second file]
To test this, you can run "./lecture-activity-a textfile1.txt textfile2.txt"
-}


import Control.Concurrent
import System.Environment

main = do
    [source] <- getArgs
    myString <- readFile source
    firstPersons myString

firstPersons :: String -> IO ()
firstPersons input =
    let
	s = words input
	filteredList = filter (\x -> x `elem` ["I", "we", "me", "my", "us"]) s
    in print (length filteredList)
			
