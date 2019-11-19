# Concurrency in Haskell
The primary action when it comes to concurrency in haskell is forking a new thread. Threads are ways for programs divide themselves into running tasks simultaneously. Each thread is able to work **concurrently** with the other threads in a program.

Luckily for us, Haskell has a very easy to use way for us to spawn and use new threads via `forkIO` the function signature for which you can find below:

```haskell
forkIO :: IO () -> IO ThreadId
```

This means that the `forkIO` function takes an IO action as a parameter and returns the threadId of the newly spawned thread. `forkIO` is called, the new thread will be spawned and perform the action given to it in the background.

If you can want to look up the documentation for `forkIO` and its related thread functions, you should take a look at the [Control.Concurrent Documentation](http://hackage.haskell.org/package/base-4.12.0.0/docs/Control-Concurrent.html).

Lets take a look now at an example program.

```Haskell
import Control.Concurrent (forkIO)

main = do
      forkIO $ (print $ sum [1..1000])
      forkIO $ print "hi"
      print $ sum [1..10000]
```

In our main method of this program, we hare forking two threads. For the first threading, we are passing it an action that prints out the sum of all the numbers between 1 and 1000. In the second thread, we are printing "hi", and in our main thread, we are printing the sum of the integers between 1 and 10000.

When you run this program, you may expect the output to first print the sum of 1 to 1000, then "hi" then the sum of 1 to 10000, but this is not necessarily the case. Remember, that threads run simultaneously, and even though it does take some time for a new thread to spin up, print ing "hi" is definitely less work than summing 1 to a 1000. So, you may find that "hi" actually prints out first. If you run this program several times, you may get a different order every time since each thread is running independently and there are several factors involved in how long each thread will take perform its given actions.

If we changed this program slightly to the following.

```Haskell
import Control.Concurrent (forkIO)

main = do
      forkIO $ (print $ sum [1..1000000])
      forkIO $ print "hi"
```

 and run this program, you may notice something odd: the output of the sum does not every get printed (and sometimes the "hi" does not either). To understand why we should look at what the main thread of this program is doing. It first spawns a thread for the sum, then spawns a thread for printing "hi" then it is done. The way this program is written, as soon as the main thread is done with its work, the program exits: it spawns the two threads and then its done. It does not have to wait for either thread to complete; thus, the program is fine with exiting without ever printing out the sum, which takes quite a bit of time, and sometimes won't print out the "hi".

 Note, if our main thread finishes before our other threads are done, we do not want to let them keep running. So, it is important to kill them off. we can do so with `killThread :: ThreadId α -> IO ()`. Like the following.

```Haskell
import Control.Concurrent (forkIO, killThread)

main = do
     a <- forkIO $ (print $ sum [1..1000000])
     killThread a
```

Here, we store our threadId into the `a` and simply call `killThread a` to kill `a`.

 Before lecture, mess around a bit with threads in Haskell and see what you can do!
