--- using the implementation of dupChan' as a guide (which creates a copy of a preexisting channel), make a version of
--- newChan, called newChan', using MVars.
--- Similar to activity b, try testing it by writing your own small application (such as activity a)
--- Try using newChan' in conjunction with readChan' and writeChan' from activity b. 
import Control.Concurrent hiding (Chan)
import Control.Monad (forever)

type Stream a = MVar (Item a)
data Item a   = Item a (Stream a)

data Chan a
 = Chan (MVar (Stream a))
        (MVar (Stream a))


newChan' :: IO (Chan a)
newChan' = do
    hole <- newEmptyMVar
    readVar <- newMVar hole
    writeVar <- newMVar hole
    return (Chan readVar writeVar)


dupChan' :: Chan a -> IO (Chan a)
dupChan' (Chan _ writeVar) = do
  hole <- takeMVar writeVar
  putMVar writeVar hole
  newReadVar <- newMVar hole
  return (Chan newReadVar writeVar)

-- <<writeChan', don't edit this!
writeChan' :: Chan a -> a -> IO ()
writeChan' (Chan _ writeVar) val = do
  newHole <- newEmptyMVar
  oldHole <- takeMVar writeVar
  putMVar oldHole (Item val newHole)
  putMVar writeVar newHole


-- <<readChan', this is the one that you do!
readChan' :: Chan a -> IO a
readChan' (Chan readVar _) = do
    stream <- takeMVar readVar
    Item val new <- readMVar stream
    putMVar readVar new
    return val

outputTheInput chan = do
    forever $ do
	text <- readChan' chan
	putStrLn text

main :: IO ()
main = do
  putStrLn "Let's output some things!"
  newChannelForUs <- newChan'
  forkIO $ outputTheInput newChannelForUs
  writeChan' newChannelForUs "Output this using the function!"
  writeChan' newChannelForUs "Output this as well!"
  getLine
  putStrLn "Bye!"

