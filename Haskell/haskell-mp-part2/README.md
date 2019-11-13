# Haskell MP Part 2: RSA
## (Due Friday November 22 at 11:59PM CST)
***Fast Forward 2000 years from where we left off in part 1***. You are on your first mission working as a spy kid for the CIA. You are following in your parents footsteps; they too were spy kids, and their parents before them. You come from a long line of spies and cryptographers dating back to the times of the Roman empire. In fact, your ancestors were so good at their craft that one of them was even honored by Julius Caesar on several occasions for saving the Roman Empire from unnecessary wars through their exceptional use of the Caesar cipher.

Basically, its safe to say that there is a lot of pressure on you. You cannot bring dishonor to your family on your first mission. Nevertheless, back to your mission. Its been going well so far, and you've collected the information you were assigned to retreive. All thats left, is the get the information to your boss, and you can go home. Only one problem, he's back at the pentagon while you are on the other side of the world. You have reason to believe that all channels of communcation are being closely monitored by the hostile local government, so you are going to need to encrypt your message to not blow your cover. Unfornately for you, a Caesar Cipher isn't going to cut it this time; it may have been enough to fool the Saxons, but it won't take more than a few minutes for anyone today. Luckily for you, the US government made sure to teach you RSA Encoding during your training. Its been a while since you last studied it, so make sure to take your time to ensure you don't mess up (START EARLY). Good Luck, once your message reaches the your boss and he gives you the ok to return home, your first mission will be complete!

## Haskell functions to implement
In this part of the mp, you'll have 5 functions to implement: `string2Digits, digits2String, remainder, rsaEncode, rsaDecode`

## `string2Digits :: String -> [Int]`
Converts an input string to a list of Ints (one for each character in the string) following the given rules:
- Upper and lowercase letters are treated the same and are encoded as follows: A->1, B->2, C->3, ..., X->24, Y->25, Z->26
- Numbers (0-9) are encoding using their ASCII codes: 0->48, 1->49, etc.
- All other characters are encoded as 0.

Example:
`string2Digits “cs196!!!”` is `[3, 19, 49, 57, 54, 0, 0, 0]`

## `digits2String :: [Int] -> String`
Decodes a list of integers into the original string using the rules above. Also, decode non-alphanumeric characters (0s) as spaces. Note that the decoding will only be uppercase.

Example:
`digits2String [3, 19, 49, 57, 54, 0, 0, 0]` is `"CS196   "`

## `remainder :: Int -> Int -> Int -> Int`
Takes 3 Ints as parameters, we will refer to them as `b,x,y` respectively. Write a recursive function that computes (b<sup>x</sup> mod y). Assume that x >= 0 are positive integers and b,y > 1.

You may be asking yourself, why are we doing this recursively and why can't we use the built in `mod`? Well, the answer is that an Int can only be so large, and for some our examples, b<sup>n</sup> might get very large and cause ***overflow***. But not to fear, we have a recursive definition for you to use.

- Base case: (b<sup>0</sup> mod y) = 1
- Recursive case: b<sup>x</sup> (mod y) = ((b mod y) * (b<sup>x-1</sup> mod y)) mod y

This is a simple recursive definition to compute (b<sup>n</sup> mod k), but there exist many other efficient solutions to compute this. For all of you math geeks out there, try to find a better and faster recursive definition to compute this.

Example:
`remainder 5 9 34` is `29` since 5<sup>9</sup> mod 34 = 29.

## **Now for the Encoder and Decoder**
We will be writing the RSA encoder and decoder now. Use any online resources needed to understand what RSA encoding is. Start with [this wikipedia page](https://en.wikipedia.org/wiki/RSA_(cryptosystem)). We also provide you with the following ADT:

`data Key = PublicKey Int Int | PrivateKey Int Int`

This will be the data type we use to pass in the keys for the encoding and decoding. For the `PublicKey` the first Int is `n` and the second Int is `e` (where `n` and `e` are defined in the wiki page). For the `PrivateKey` the first Int is `n` and the second Int is `d` (once again as defined on the wikipedia page)

## `rsaEncode :: String -> Key -> [Int]`
Takes in 2 inputs: a String `s`, and a `PublicKey`. Encodes `s` using the `PublicKey` and returns the resulting list of Ints. ***Make sure to use the other functions you've already written! Will save you a lot of time!***

Example:
`rsaEncode "please work" (PublicKey 35 11)` gets encoded as `[11,3,10,1,24,10,0,32,15,2,16]`

## `rsaDecode :: [Int] -> Key -> String`
For this problem, we will be decoding the given list of Ints `xs` to get back the original string using the the second parameter as a `PrivateKey` ***Again, use the functions you've already written***

Example:
`rsaDecode [11,3,10,1,24,10,0,32,15,2,16] (PrivateKey 35 11)` gets decoded as `"PLEASE WORK"`

Good Luck, and feel free to ask any questions if you are stuck at any point!
