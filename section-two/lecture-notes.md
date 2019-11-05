# Haskell Lecture 2
Since we worked on recursion last lecture, and we learned about `where` and `let` in the prelecture, lets now see how we can use both of these concepts!

## Tail Recursion!
Tail recursion is where no computation is done after making the recursive call. The recursive call is the last work done by the function. Luckily for us, we now have all the tools we will need to work with tail recursion in Haskell.

When performing tail recursion, we will most likely be using an auxiliary function that we will be defining in a `where` statement. Before we go further into tail recursion, lets look at an example; a sum function for an array.

Here is the standard way we would write this function
```haskell
mySum [] = 0
mySum (x:xs) = x + mySum xs
```

This clearly does not use tail recursion. In our recursive case, we have `x + mySum xs`. Where `x` is added to whatever is returned by the recursive call. This computation makes this function not tail recursive. 

Here is how we could use tail recursion:
```haskell
mySum xs = aux xs 0
	where aux [] a = a
	      aux (x : xs) a = aux xs (a + x)
```

In this function we use an auxiliary function that takes not only the list `xs` but also an accumulator variable. 
Lets break down this auxiliary function 
- `aux [] a = a` : This is the base case when we have an empty list; here, we just return the accumulator.
- `aux (x:xs) a = aux xs (a + x)`. Here we pattern match our list into `(x:xs)` where `x`is the first element in the list, and `xs` is the remainder of the list. In our tail recursive call, we call add `x` to our accumulator `a` and recursive on `xs`. This is the epitome of tail recursion: no work is done after the recursive call; all the work is done before. 

## Lecture Activity
Now that we have learned how to use tail recursion, lets apply it, `let`, and `where` in solving some more complicated problems in Haskell!