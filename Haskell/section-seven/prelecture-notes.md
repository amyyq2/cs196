# Thread Communication
In the last lecture, we covered the basics of threads. Thus far, our threads have not been able to communicate with each other, thus causing some issues (such as the main thread exiting before our other threads are done). Today, we will aim to resolve these issues using MVars!

Here are the actions we will primarly be using to interact with MVars
```Haskell
data MVar a  -- abstract

newEmptyMVar :: IO (MVar a)
newMVar      :: a -> IO (MVar a)
takeMVar     :: MVar a -> IO a
putMVar      :: MVar a -> a -> IO ()
```

These actions do what you would expect them to do. `newEmptyMVar` and `newMVar` create new variables. `putMVar` puts a value into an MVar, and `takeMVar` takes back a MVar.

Lets look at and dissect an example
```Haskell
import Control.Concurrent
main = do
  v <- newEmptyMVar
  forkIO $
      do
        putMVar v "hello";
        print "second thread done"
  r <- takeMVar v
  print r
```

Here we create a new MVar called v. We then create a second thread with fork, and inside that thread, we put "hello" into v. Then in our main thread, we then take whatever value is in v and store it into `r` and print `r`. If you run this, you will see that r has the value "hello". The threads are communicating!

At this point you are probably wondering from our discussion earlier, is this nondeterministic? If the threads are independent how do we gaurantee that "hello" is stored into v, before v is stored into `r`?

This is the beauty of MVars! takeMVar will **block** until something is put into the variable that it is taking. Since `v` is originally empty, the line `r <- takeMVar` will be blocked from executing until something is put into `v`. As soon as it is, the line will be executed. When running this code though, you may find that "second thread finished" is sometimes printed before `r` and sometimes after. This is because the main thread is only blocked until something is put into `v`, after that it will proceed. So, sometimes `print r` will execute before `print "second thread done"` and sometimes it won't. If we want to control order of things executing in threads, we may want to add more blockers, or consider not performing the actions in a multiple threads since multithreaded programs should ideally be independent to run in parrallel.

Note, we can have use multiple MVars if we want to have several shared variables among the threads.

One to note about MVars, if we create a new MVar and try to take the value without ever putting something in it,  our program will not work.

If you want to learn more uses of MVars, you can check [this](https://www.oreilly.com/library/view/parallel-and-concurrent/9781449335939/ch07.html) out.
