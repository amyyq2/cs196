--- using the implementation of writeChan' as a guide, make a copy of
--- readChan, called readChan', using MVars.
--- To test it, try writing a small application (like the one in activity a) using your new readChan' and writeChan'


import Control.Monad (forever)
import Control.Concurrent hiding (Chan)

type Stream a = MVar (Item a)
data Item a   = Item a (Stream a)

data Chan a
 = Chan (MVar (Stream a))
        (MVar (Stream a))


-- <<writeChan', don't edit this!
writeChan' :: Chan a -> a -> IO ()
writeChan' (Chan _ writeVar) val = do
  newHole <- newEmptyMVar
  oldHole <- takeMVar writeVar
  putMVar oldHole (Item val newHole)
  putMVar writeVar newHole


-- <<readChan', this is the one that you do!
readChan' :: Chan a -> IO a
readChan' = undefined