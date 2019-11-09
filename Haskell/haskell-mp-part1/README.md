# Haskell MP Part 1: Caesar's Cipher
## (Due Friday November 15 at 11:59PM CST)
You are a soldier in the Roman Empire’s Army assigned to spy on the Saxons tribe. Last night, you overheard a conversation between tribesmen about a rebellion against the Roman Empire that will occur next week. You have to send this information to your commander in order to save the Roman Empire.

But there is a catch. You don't want to blow your cover if the Saxons somehow manage to intercept your message, so you will have to encode this information using a special cipher you learned in your Roman cryptography class. The cipher works as follows:

In this cipher, you are to "shift" each letter of the message down the alphabet by a given number of places. For example, if we shift 'a' by 2, we get 'c'. If we shift 'X' by 4, we get 'B'. In this second case, there are not 4 more letters after 'X', so we wrap back around to the start of the alphabet to perform our shift. In our cipher, we do not shift non-aphabet characters, lowercase letters only shift to other lowercase letters, and uppercase letters only become other uppercase letters.

If you don't encode the message well, you risk your fellow Roman soldiers not being able to decipher your warning; in which case, many innocent Roman lives will be lost during a rebellion, and you will most certainly be executed for your incompetence as a spy. Luckily for you, your mind works like a computer, so you know you'll have no trouble with this as long as you take your time and don't rush to encode it an hour before the rebellion.

## Haskell Functions to implement
For this part of the mp, you'll have to implement 3 functions, `shift`, `cipherEncode`, and `cipherDecode`.

### `shift :: Char -> Int -> Char`
`shift` takes a `Char` and an `Int` as parameters, and returns a `Char`. In this function, you are to shift the `Char` down the alphabet by the value specified by the `Int` parameter, and return the resulting shifted `Char`. Make sure to follow the rules specified above in the description of the Caesar cipher:

- Only shift alphabet characters
- uppercase letters shift to uppercase letters
- lowercase letters shift to lowercase letters
- if you reach the end of the alphabet while shifting, wrap around to the start

Some examples:
- `shift 'a' 7` will return `h`
- `shift 'X' (-30)` will return `T`
- `shift 'm' 999` will return `x`
- `shift '%' 3` will return `%`

### `cipherEncode :: String -> Int -> String`
`cipherEncode` will take in a string and a shift value, and return the resulting string after each character in the input string is encoded following the rules of the cipher with the given shift. *you may want to use your `shift` to help you with this*.

Some examples:
- `cipherEncode "hello" 24` will return `fcjjm`
- `cipherEncode "The Saxons are COMING!!!" 365` will return `Uif Tbypot bsf DPNJOH!!!`

### `cipherDecode :: String -> Int -> String`
You expect to receive an encoded message back from your superiors to notify you that they received your warning and give you instructions on how to proceed. So, you will need to be able to decode whatever message they send you. In `cipherDecode`, you are given the encoded string and the shift that was used to encode it, and you will need to return the message that was encoded.

Some examples:
- `cipherDecode "Ork clo vlro ifcb" 23` will return `Run for your life`
- `cipher "emmb hmz!" (-444)` will return `good job!`

## Testing your code
If you wish to test your functions against our provided grader, you can run `stack test` in the command line. Note, we change a few of these test cases when we actually grade your submission, so we recommend that you also test your function against custom inputs. You can do so by running `stack repl` to open up a repl where you can run your functions using custom inputs.

Good luck and make sure to start on this early!
