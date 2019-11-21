import System.IO
import System.Environment
--- Write the main method and a function that takes in a text from standard input,
--- removes all punctuation and writes back all the input in a single line (remove new lines) to a file specified by the application parameter
--- to run this, first compile using `stack ghc lecture_activity_c.hs`
--- Then run `cat tweet.txt | ./lecture_activity_c single_line.txt`
--- Note, that single_line.txt is the file to write the output to, but your code should be able to write to any file specified

main = do
	[file] <- getArgs
	text <- readFile "tweet.txt"
	writeFile file (removePunc (text))

removePunc :: String -> String
removePunc [] = []
removePunc xs = [ x | x <- xs, not (x `elem` "\n,.?!-:;\"\'") ]
