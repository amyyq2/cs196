--- ADT For a binary search tree where each node has an value and internal nodes have pointers to two subtree
data BinarySearchTree = None
                      | BSTLeaf Int
                      | BSTNode Int BinarySearchTree BinarySearchTree

search :: BinarySearchTree -> Int -> Bool
search = undefined


--- This is the ADT for a new Tree data type, don't touch this code!
data Tree = Empty
          | Leaf Int
          | Node Tree Tree


--- Create a function that returns the depth of a Tree, as a Int
depth :: Tree -> Int
depth = undefined




--- We have a new data type for division, that allows you to return "Failure," if the user attempts to divide by zero
data FailableDouble = Failure
                    | OK Double
  deriving Show


-- Create a function "safeDiv," that returns either Failure, if a user attempts to divide by zero, or divides the two doubles otherwise
safeDiv :: Double -> Double -> FailableDouble
safeDiv = undefined




--- We have a new data type for a list of integers, that either is equivalent to nothing (EmptyList), or equals a construct of the head plus the rest of the list
data IntList = EmptyList | Cons Int IntList


-- Create a function "intListProd," that returns the product of an IntList as a Int
intListProd :: IntList -> Int
intListProd = undefined

-- Convert the IntList to a normal haskell List
intList2List :: IntList	-> [Int]
intList2List = undefined
