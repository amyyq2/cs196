--- Create a function outputTheInput, that will read in from a channel,
--- and write out to standard out whatever was inputted on that channel.
--- Make sure your function reads everything written to the channel, not just the first thing
--- To test it, first compile with stack ghc, then run the executable. 


import Control.Concurrent
import Control.Monad (forever)
import Control.Concurrent.Chan

outputTheInput chan = do
    forever $ do
	text <- readChan chan
	putStrLn text

main :: IO ()
main = do
  putStrLn "Let's output some things!"
  newChannelForUs <- newChan
  forkIO $ outputTheInput newChannelForUs
  writeChan newChannelForUs "Output this using the function!"
  writeChan newChannelForUs "Output this as well!"
  getLine
  putStrLn "Bye!"
