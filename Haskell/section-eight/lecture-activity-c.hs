--- using the implementation of dupChan' as a guide (which creates a copy of a preexisting channel), make a version of
--- newChan, called newChan', using MVars.
--- Similar to activity b, try testing it by writing your own small application (such as activity a)
--- Try using newChan' in conjunction with readChan' and writeChan' from activity b. 
import Control.Concurrent hiding (Chan)

type Stream a = MVar (Item a)
data Item a   = Item a (Stream a)

data Chan a
 = Chan (MVar (Stream a))
        (MVar (Stream a))


newChan' :: IO (Chan a)
newChan' = undefined


dupChan' :: Chan a -> IO (Chan a)
dupChan' (Chan _ writeVar) = do
  hole <- takeMVar writeVar
  putMVar writeVar hole
  newReadVar <- newMVar hole
  return (Chan newReadVar writeVar)
