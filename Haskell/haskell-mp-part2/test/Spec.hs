import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.QuickCheck2 (testProperty)
import Lib

main :: IO ()
main = defaultMain tests

tests =
	[
	testGroup "string to digits"
      [ testProperty "single character" (string2digitsChar)
      , testProperty "short strings" (string2digitsShort)
      , testProperty "longer strings" (string2digitsLong)
      , testProperty "extra tests" (string2digitsExtra)
      ]
    , testGroup "digits 2 string"
      [ testProperty "single character" (digits2StringChar)
      , testProperty "short arrays" (digits2StringShort)
      , testProperty "longer arrays" (digits2StringLong)
      , testProperty "extra tests" (digits2StringExtra)
      ]
    , testGroup "remainder"
      [ testProperty "simple remainders" (simpleRemainders)
      , testProperty "moderate remainder" (mediumRemainders)
      , testProperty "large numbers remainder" (largeRemainders)
      , testProperty "very large number remainder" (veryLargeRemainder)
      ]
    , testGroup "RSA encode"
      [ testProperty "test 1" (encode1)
      , testProperty "test 2" (encode2)
      , testProperty "test 2" (encode2)
      , testProperty "test 3" (encode3)
      , testProperty "test 4" (encode4)
      , testProperty "test 5" (encode5)
      , testProperty "test 6" (encode6)
      ]
    , testGroup "RSA decode"
      [ testProperty "test 1" (decode1)
      , testProperty "test 2" (decode2)
      , testProperty "test 3" (decode3)
      , testProperty "test 4" (decode4)
      , testProperty "test 5" (decode5)
      , testProperty "test 6" (decode6)
      ]
    ]

string2digitsChar :: Bool
string2digitsChar =
	let
		x = ((string2Digits "a") == [1])
		y = ((string2Digits "3") == [51])
		z = ((string2Digits "E") == [5])
	in x && y && z


string2digitsShort :: Bool
string2digitsShort =
	let
		x = ((string2Digits "cs196!!!") == [3, 19, 49, 57, 54, 0, 0, 0])
		y = ((string2Digits "wWwWWoOoOOWwwW") == [23,23,23,23,23,15,15,15,15,15,23,23,23,23])
		z = ((string2Digits "*&#@!#$#Ab353") == [0,0,0,0,0,0,0,0,1,2,51,53,51])
	in x && y && z

string2digitsLong :: Bool
string2digitsLong =
	let
		x = ((string2Digits "plEasE dOn't eNcOde ThIs") == [16,12,5,1,19,5,0,4,15,14,0,20,0,5,14,3,15,4,5,0,20,8,9,19])
		y = ((string2Digits "I work ON 196 when IT's coLd outSIDE!!!!!") == [9,0,23,15,18,11,0,15,14,0,49,57,54,0,23,8,5,14,0,9,20,0,19,0,3,15,12,4,0,15,21,20,19,9,4,5,0,0,0,0,0])
	in x && y

string2digitsExtra :: Bool
string2digitsExtra =
	let
		x = ((string2Digits "I really h0pE this works%%#") == [9,0,18,5,1,12,12,25,0,8,48,16,5,0,20,8,9,19,0,23,15,18,11,19,0,0,0])
	in x

digits2StringChar :: Bool
digits2StringChar =
	let
		x = ((digits2String [5]) == "E")
		y = ((digits2String [55]) == "7")
		z = ((digits2String [0]) == " ")
	in x && y && z

digits2StringShort :: Bool
digits2StringShort =
	let
		x = ((digits2String [3, 19, 49, 57, 54, 0, 0, 0]) == "CS196   ")
		y = ((digits2String [23,23,23,23,23,15,15,15,15,15,23,23,23,23]) == "WWWWWOOOOOWWWW")
		z = ((digits2String [0,0,0,0,0,0,0,0,1,2,51,53,51]) == "        AB353")
	in x && y && z

digits2StringLong :: Bool
digits2StringLong =
	let
		x = ((digits2String [16,12,5,1,19,5,0,4,15,14,0,20,0,4,5,3,15,4,5,0,20,8,9,19]) == "PLEASE DON T DECODE THIS")
		y = ((digits2String [9,0,23,15,18,11,0,15,14,0,49,57,54,0,23,8,5,14,0,9,20,0,19,0,3,15,12,4,0,15,21,20,19,9,4,5,0,0,0,0,0]) == "I WORK ON 196 WHEN IT S COLD OUTSIDE     ")
	in x && y

digits2StringExtra :: Bool
digits2StringExtra =
	let
		x = (digits2String [9,0,18,5,1,12,12,25,0,8,48,16,5,0,20,8,9,19,0,23,15,18,11,19,0,0,0] == "I REALLY H0PE THIS WORKS   ")
	in x


simpleRemainders :: Bool
simpleRemainders =
	let
		x = (remainder 19343434 0 132343 == 1)
		y = (remainder 23 1 5 == 3)
		z = (remainder 5 9 34 == 29)
	in x && y && z

mediumRemainders :: Bool
mediumRemainders =
	let
		x = (remainder 25 7 209 == 9)
		y = (remainder 353 3 2034 == 1727)
	in x && y

largeRemainders :: Bool
largeRemainders =
	let
		x = (remainder 2343 34323 37 == 10)
		y = (remainder 234354556 3432343 209 == 156)
	in x && y

veryLargeRemainder :: Bool
veryLargeRemainder =
	let
		x = (remainder 358454548 3458373 3437473 == 2847922)
	in x


encode1 :: Bool
encode1 =
	let
		x = (rsaEncode "please work" (PublicKey 35 11) == [11,3,10,1,24,10,0,32,15,2,16])
	in x
decode1 :: Bool
decode1 = (rsaDecode [11,3,10,1,24,10,0,32,15,2,16] (PrivateKey 35 11) == "PLEASE WORK")

encode2 :: Bool
encode2 = (rsaEncode "hello world, this is another TEST! case." (PublicKey 7387 3607) == [4617,2955,3078,3078,985,0,5460,985,2052,3078,1847,0,0,6279,4617,4104,1944,0,4104,1944,0,1,1583,985,6279,4617,2955,2052,0,6279,2955,1944,6279,0,0,4925,1,1944,2955,0])

decode2 :: Bool
decode2 = (rsaDecode [4617,2955,3078,3078,985,0,5460,985,2052,3078,1847,0,0,6279,4617,4104,1944,0,4104,1944,0,1,1583,985,6279,4617,2955,2052,0,6279,2955,1944,6279,0,0,4925,1,1944,2955,0] (PrivateKey 7387 3607) == "HELLO WORLD  THIS IS ANOTHER TEST  CASE ")

encode3 :: Bool
encode3 = (rsaEncode "hello WORLD" (PublicKey 49447 1163) == [22019,34152,7558,7558,16091,0,29412,16091,16551,7558,2508])

decode3 :: Bool
decode3 = (rsaDecode [22019,34152,7558,7558,16091,0,29412,16091,16551,7558,2508] (PrivateKey 49447 9227) == "HELLO WORLD")

encode4 :: Bool
encode4 = (rsaEncode "123456" (PublicKey 49447 9227) == [34466,8042,29960,35181,34668,14749])

decode4 :: Bool
decode4 = (rsaDecode [34466,8042,29960,35181,34668,14749] (PrivateKey 49447 1163) == "123456")

encode5 :: Bool
encode5 = (rsaEncode "AaAaAa" (PublicKey 1380481 132229) == [1,1,1,1,1,1])

decode5 :: Bool
decode5 = (rsaDecode [1,1,1,1,1,1] (PrivateKey 1380481 547161) == "AAAAAA")

encode6 :: Bool
encode6 = (rsaEncode "This is the LAST TestCAse w!!!ooooooo!" (PublicKey 1380481 547161) == [1267321,189728,303908,812876,0,303908,812876,0,1267321,189728,729232,0,387415,1,812876,1267321,0,1267321,729232,812876,1267321,100889,1,812876,729232,0,1017778,0,0,0,132834,132834,132834,132834,132834,132834,132834,0])

decode6 :: Bool
decode6 = (rsaDecode [1267321,189728,303908,812876,0,303908,812876,0,1267321,189728,729232,0,387415,1,812876,1267321,0,1267321,729232,812876,1267321,100889,1,812876,729232,0,1017778,0,0,0,132834,132834,132834,132834,132834,132834,132834,0] (PrivateKey 1380481 132229) == "THIS IS THE LAST TESTCASE W   OOOOOOO ")