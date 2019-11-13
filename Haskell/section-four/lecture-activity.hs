--- ADT For a binary search tree where each node has an value and internal nodes have pointers to two subtree
data BinarySearchTree = None
                      | BSTLeaf Int
                      | BSTNode Int BinarySearchTree BinarySearchTree

search :: BinarySearchTree -> Int -> Bool
search None _ = false
search (BSTLeaf a) val | a == val == True
		       | otherwise = False
search (BSTNode a l r) val | a == val = True
			   | a < val = search l val
			   | otherwise = search r val


--- This is the ADT for a new Tree data type, don't touch this code!
data Tree = Empty
          | Leaf Int
          | Node Tree Tree


--- Create a function that returns the depth of a Tree, as a Int
depth :: Tree -> Int
depth Empty = 0
depth (Leaf _) = 1
depth (Node l r) = 1 + max (depth l) (depth r)




--- We have a new data type for division, that allows you to return "Failure," if the user attempts to divide by zero
data FailableDouble = Failure
                    | OK Double
  deriving Show


-- Create a function "safeDiv," that returns either Failure, if a user attempts to divide by zero, or divides the two doubles otherwise
safeDiv :: Double -> Double -> FailableDouble
safeDiv _ 0 = Failure
safeDiv a b = OK (a / b)




--- We have a new data type for a list of integers, that either is equivalent to nothing (EmptyList), or equals a construct of the head plus the rest of the list
data IntList = EmptyList | Cons Int IntList


-- Create a function "intListProd," that returns the product of an IntList as a Int
intListProd :: IntList -> Int
intListProd EmptyList = 0
intListProd (Cons x (EmptyList)) = x
intListProd (Cons x xs) = x * intListProd xs

-- Convert the IntList to a normal haskell List
intList2List :: IntList	-> [Int]
intList2List EmptyList = []
intList2List (Cons x xs) = x : (intList2List xs)
