# Higher Order Function
A higher order function in haskell is a function that takes a function as a parameter or returns a function as its return value. 

Higher order functions can be extremely useful when coding in Haskell and there are quite a few built-in ones that will make your life a lot easier. Before we get into these built in ones, lets take a look at an example of what a higher order function looks like in haskell.

## An HOF (higher order function) example
Here we will look at a function `foldr*`, note this there is a built in function `foldr` that does the same thing. Lets take a look at the code and break it down line by line. The `foldr` function applies a function to an accumulator and an array from right to left. Note, there is also a `foldl` function that does the same thing from left to right

```haskell
foldr* :: (a -> b -> b) -> b -> [a] -> b
foldr* _ z [] = z
foldr* f z (x:xs) = f x (foldr* z xs)
```

1. The first line of this function is the function signature.
	- The first parameter `(a -> b -> b)` is a function that take in parameters of type `a` (note this can be any type: string, int, etc) and of type 'b' and returns a value of type 'b'.
	- The second parameter is our accumulator of type 'b'
	- The third parameter is our array of type 'a'.
	- The return value is of type 'b'

2. The second line is our base case when our array is empty. Here we just return our accumulator 'z'.

3. The final line is our recursive case. Here we want to start "folding" using the function 'f'. Note, the first parameter of `f` is of type `a`, so we will take the first element of of our list, `x` for this. The second parameter of our function is of type `b`. For this value we will recursively call of our `foldr*` function on the rest of the list. 

Now that we understand how our `foldr*` function works, we are ready to do use it. One useful example of how to use this function is to take the sum of a list. If we want to take sum of a list, we can simply do `foldr* (+) 0 myList`. Here, (+) is our function, 0 is our accumulator, and myList would be the list of values. We use 0 as an accumulator because thats the value we want to start accumulating the sum of the values in the list form. On the other hand, if we wanted to take the product of a list we could do `foldr* (*) 1 myList`, where (*) is the function, 1 is the acumulator, and myList is the list. Do you see why we choose to use `1` as the accumulator here instead of `0`? 

```
ghci> foldr* (+) 0 [1,2,3]
6
```

As you can see from this example of `foldr`, higher order functions can be extremely versatile. If you have several functions that are doing similar things, it may be useful to use a higher order function to eliminate redundant code!

## Built-in higher order functions
Luckily for you, haskell has plenty of built-in higher order functions for you to use. Some of the most useful ones include `map, zip, filter, foldr, foldl, flip` and several Others. You can find some great examples of how to use (and code these) [here](http://learnyouahaskell.com/higher-order-functions). 

While you'll find better/more in depth examples in that link. I'll quickly go over how you can use one of these built-in functions, `map`. In haskell, the `map` function takes a function and a list and applies the function to each element in the list. The function signature for `map` is the following `map :: (a -> b) -> [a] -> [b]`. It takes a function (which takes a parameter of type 'a' and returns a value of type 'b') and a list of type 'b', and it returns a list of type 'b'. Here is an example of how to use map
```
ghci> map (+3) [1,2,3,4]
[4,5,6,7]
```

Here, the function we passed in was `(+3)` to add three to every element. So, when we call map, we added 3 to every element. Its that simple!

# For lecture
For lecture, take a look into some other built-in higher order functions in Haskell! As always, if you have any questions, feel free to ask on piazza!