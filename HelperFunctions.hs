module HelperFunctions where
import Token 
import Grammar
import System.IO
import Data.Char

convertToTileList :: Exp -> [[Exp]]
convertToTileList (TmCellList a) = a

convertToCellList :: [[Exp]] -> Exp
convertToCellList = TmCellList

convertToInt :: Exp -> [[Int]]
convertToInt (TmCellList lst) = map (map cellToInt) lst
    where   cellToInt TmBlank = 0
            cellToInt TmFilled = 1

isValue :: Exp -> Bool
isValue (TmInt _) = True
isValue TmFilled = True
isValue TmBlank = True
isValue (TmVar _) = True
isValue (TmBool _) = True
isValue (TmCellList _) = True
isValue _ = False

tileNeg :: [[Exp]] -> [[Exp]]
tileNeg [] = []
tileNeg t = map (map tNeg) t
    where 
        tNeg c | c == TmFilled = TmBlank
               | otherwise = TmFilled

tileAnd :: [[Exp]] -> [[Exp]] -> [[Exp]]
tileAnd t1 t2 = zipWith tAnd t1 t2
    where
        tAnd [] [] = []
        tAnd (c1:t1) (c2:t2) | c1 == TmFilled && c2 == TmFilled = TmFilled : tAnd t1 t2
                             | otherwise = TmBlank : tAnd t1 t2

tileOr :: [[Exp]] -> [[Exp]] -> [[Exp]]
tileOr t1 t2 = zipWith tOr t1 t2
    where
        tOr [] [] = []
        tOr (c1:t1) (c2:t2) | c1 == TmBlank && c2 == TmBlank = TmBlank : tOr t1 t2
                            | otherwise = TmFilled : tOr t1 t2

appendH :: [[Exp]] -> [[Exp]] -> [[Exp]]
appendH [] t = t
appendH t1 t2 = zipWith (++) t1 t2

appendV :: [[Exp]] -> [[Exp]] -> [[Exp]]
appendV [] t = t
appendV t1 t2 = t1 ++ t2

tileRepeatV :: [[Exp]] -> Int -> [[Exp]]
tileRepeatV [] _ = []
tileRepeatV t 1 = t
tileRepeatV t n = appendV t (tileRepeatV t (n-1))

tileRepeatH :: [[Exp]] -> Int -> [[Exp]]
tileRepeatH [] _ = []
tileRepeatH t 1 = t
tileRepeatH t n = appendH t (tileRepeatH t (n-1))

expand :: [[Exp]] -> Int -> [[Exp]]
expand [] _ = []
expand t n = concatMap (replicate n . expandRow n) t
    where
        expandRow :: Int -> [Exp] -> [Exp]
        expandRow  n = concatMap (replicate n)

reflectR :: [[Exp]] -> Int -> [[Exp]]
reflectR [] _ = []
reflectR t n = map (reflecting n) t

reflectC :: [[Exp]] -> Int -> [[Exp]]
reflectC [] _ = []
reflectC t n = reflecting n t
reflecting :: Int -> [a] -> [a]
reflecting n row = reverse (drop (n+1) row) ++ [row !! n] ++ reverse (take n row) 

rotateCW :: [[Exp]] -> Int -> [[Exp]]
rotateCW [] _ = []
rotateCW t 0 = t
rotateCW t n = rotateCW (rotating t) (n-90)
    where
        rotating [] = []
        rotating t = reverse (map head t) : rotating [x | x <- map tail t, x /= []]

rotateACW :: [[Exp]] -> Int -> [[Exp]]
rotateACW [] _ = []
rotateACW t 0 = t
rotateACW t n = rotateACW (rotating t) (n-90)
    where rotating [] = []
          rotating t = map last t : rotating [x | x <- map init t, x /= []]

subtile :: [[Exp]] -> Int -> Int -> Int -> [[Exp]]
subtile t row col size = map (take  size) (take size t1)
    where t1 = map (drop row) (drop col t)

convertToExp :: [String] -> [[Exp]]
convertToExp = map (map converting)
    where converting c | c == '0' = TmBlank
                       | otherwise = TmFilled

convertToString :: [[Exp]] -> [[Int]]
convertToString = map (map converting)
    where converting c | c == TmBlank = 0
                       | otherwise = 1

getLength :: [[Exp]] -> Int
getLength [] = 0
getLength t = length (head t)

getWidth :: [[Exp]] -> Int
getWidth [] = 0
getWidth t = length t

rotateChecker :: Int -> Bool
rotateChecker n = n == 90 || n == 180 || n == 270

reflectChecker :: Int -> Int -> Bool
reflectChecker n size = n >= 0 && n < size

appendChecker :: Int -> Int -> Bool
appendChecker s1 s2 | s1 /= 0 = s1 == s2
                    | otherwise = True

subtileChecker :: Int -> Int -> Int -> Int -> Int -> Bool
subtileChecker sR sC sSize oR oC = sR >= 0 && sC >= 0 
                                    && sSize <= oR - sR && sSize <= oC - sC

tileBoolOpChecker :: [[Exp]] -> [[Exp]] -> Bool
tileBoolOpChecker [] [] = True
tileBoolOpChecker _ [] = False
tileBoolOpChecker [] _ = False
tileBoolOpChecker t1 t2 = (length t1 == length t2) && (length $ head t1) == (length $ head t2)

getFromFile :: FilePath -> IO [[Exp]]
getFromFile fileName = do
    content <- readFile (fileName ++ ".tl")
    return $ map (map convertToExp . map digitToInt) $ lines content
      where convertToExp 0 = TmBlank
            convertToExp 1 = TmFilled
            convertToExp x = error $ "Invalid input: " ++ show x
