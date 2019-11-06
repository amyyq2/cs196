import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.QuickCheck2 (testProperty)
import Lib

main :: IO ()
main = defaultMain tests

tests = 
	[
	testGroup "simple positive shifts"
      [ testProperty "Lowercase letter with a small shift" (simpleShiftLower)
      , testProperty "Uppercase letter with a small shift" (simpleShiftUpper)
      , testProperty "Non-letter shifts" (simpleShiftNonLetter)
      ]
    , testGroup "simple negative shifts"
      [ testProperty "Lowercase letter with negative shift" (negativeShiftLower)
      , testProperty "Uppercase letter with negative shift" (negativeShiftUpper)
      ]
    , testGroup "large shifts"
      [ testProperty "large positive shifts" (positiveLargeShift)
      , testProperty "large negative shifts" (negativeLargeShift)
      ]
    , testGroup "Caesar Cipher Encode Basic Tests"
      [ testProperty "single word" (shortCipherEncode)
      , testProperty "sentence" (sentenceEncode)
      ]
    , testGroup "Caesar Cipher Decode Basic Tests"
      [ testProperty "single word" (shortCipherDecode)
      , testProperty "sentence" (sentenceDecode)
      ]
    , testGroup "Extra Tests"
      [ testProperty "extra test 1" (extraTest1)
      , testProperty "extra test 2" (extraTest2)
      ]
    ]

simpleShiftLower :: Bool
simpleShiftLower =
	let 
		x = ((shift 'a' 5) == 'f')
		y = ((shift 'f' 2) == 'h')
		z = ((shift 'z' 0) == 'z')
	in x && y && z


simpleShiftUpper :: Bool
simpleShiftUpper = 
	let 
		x = ((shift 'A' 3) == 'D')
		y = ((shift 'X' 4) == 'B')
		z = ((shift 'M' 8) == 'U')
	in x && y && z

simpleShiftNonLetter :: Bool
simpleShiftNonLetter =
	let
		x = ((shift '4' 12) == '4')
		y = ((shift '%' 14) == '%')
	in x && y

negativeShiftLower :: Bool
negativeShiftLower =
	let
		x = ((shift 'p' (-4)) == 'l')
		y = ((shift 'a' (-10)) == 'q')
	in x && y

negativeShiftUpper :: Bool
negativeShiftUpper =
	let
		x = ((shift 'C' (-5)) == 'X')
		y = ((shift 'N' (-1)) == 'M')
	in x && y

positiveLargeShift :: Bool
positiveLargeShift =
	let
		x = ((shift 'M' 1000) == 'Y')
		y = ((shift 'x' 99999) == 'a')
	in x && y

negativeLargeShift :: Bool
negativeLargeShift =
	let 
		x = ((shift 'x' (-99999)) == 'u')
		y = ((shift 'M' (-1000)) == 'A')
	in x && y


shortCipherEncode :: Bool
shortCipherEncode =
	let
		myString = "haskellMP"
		x = ((cipherEncode myString 10) == "rkcuovvWZ")
		y = ((cipherEncode myString (-40)) == "tmewqxxYB")
	in x && y

shortCipherDecode :: Bool
shortCipherDecode =
	let
		myString = "haskellMP"
		n = 1234
	in (cipherDecode myString n) == "vogyszzAD"

sentenceEncode :: Bool
sentenceEncode =
	let
		myString = "haskell is a really cool language"
	in (cipherEncode myString 35) == "qjbtnuu rb j anjuuh lxxu ujwpdjpn"

sentenceDecode :: Bool
sentenceDecode =
	let
		myString = "vogyszz wg o fsozzm qccz zobuious. OAONWBU!"
		n = -123435454
	in (cipherDecode myString n) == "haskell is a really cool language. AMAZING!"


extraTest1 :: Bool
extraTest1 =
	let
		myString = "$%#$#@abdEf wowZW#1234xy..."
		n = -543
		encoded = cipherEncode myString n
		decoded = cipherDecode encoded n
	in myString == decoded

extraTest2 :: Bool
extraTest2 =
	let
		myString = "sldvpww td l cplwwj nzzw wlyrflrp. LXLKTYR!"
		n = 4535
		decoded = cipherDecode myString n
		correctDecode = "haskell is a really cool language. AMAZING!"
		encoded = cipherEncode decoded n
	in (myString == encoded) && (decoded == correctDecode)




