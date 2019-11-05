# Back to Haskell
Now that you've gotten a feel for the Haskell syntax, lets jump straight into the concepts!

## Pattern Matching
When defining functions, you can define different function bodies based on different patterns in the input. We have already seen a bit of this with our recursive functions. If the input obeys a base case pattern, we perform a specific action, and if it didn't match that pattern, we performed our recursive case.

Note, that patterns are checked from top to bottom. That is why we always put our base cases first, so that those patterns are checked before the recursive case. 

Here is another example of a function that uses pattern matching with with chars instead
```haskell
charName :: Char -> String
charName 'a' = "Alpha"
charName 'b' = "Beta"
charName 'c' = "Charlie"
charName _ = "Invalid"
```
Here, depending on which letter is passed in as a parameter, we match it with a different pattern!

Note that the final case is `_`. This is a catch all case. So if the input is anything besides the first three characters, we return the string "invalid".

## Let and Where

So far in our introduction to Haskell, you may have noticed that every line have writen has essentially been returning a value for the function depending on the inputs. You may be wondering: where are the intermediary variables? Not to fear. We have `where` and `let` for that. While `let` and `where` have their differences (you can learn more about these differences [here](https://wiki.haskell.org/Let_vs._Where)), they both serve to allow you to define and use intermediary variables. These can be extremely useful when it comes to coding in haskell so you don't end up feeling like you have to perform all the operations for a function in a single line. 

Here is a simple example of how to use these `let-in` in a function that performs the following operation `(n+4)*3` on an input `n`

```haskell
foo n =
	let a = 4
	    b = 3
	in (n * a) + b
```

Note here that `let` allows you to define variables that can be used in the `in` statement. After the `in` these variables will not be accessible. 

In this example, we define variables `a` and `b` in our `let` expression and assign them the value `4` and `3` respectively. For a `let-in` statement, the value that is returned is what is specified in the `in`. So here we have `(n * a) + b` in our in statement, so that is what is returned for a `foo n`.

Here is how to do this same thing inside of a where

```haskell
foo n = (n * a) + b
	  where a = 4
	        b = 3
```

Note here that `where` comes after the variables have been used. This is an important distiction between `let-in` and `where`, where comes afte you use the variables, `let` defines the variables before they are used in the `in` statement. Here is another example of how where can be used.

```haskell
foo n = bar n
      where bar n = (n * 4) + 3
```

In this case, we used the where to define a define a function `bar`!

As you code in haskell, you will find that `let-in` and `where` are extremely powerful tools and will greatly improve the readability of your haskell code!

# Lecture
In lecture, we will continue familiarizing ourselves with Haskell by working on some slightly harder haskell problems. We will also be going over a new concept: tail recursion. If you want to get a head start on tail recursion, you may want to check out [this video](https://pages.github-dev.cs.illinois.edu/cs421-sp19/web/videos/tail-recursion/) by Professor Mattox. As always, if you have any questions, feel free to ask them on piazza!	         