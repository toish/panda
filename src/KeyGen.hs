module KeyGen(keyGen, keysGen, commonKey, commonKeys, GenData, Key, Result) where
import KeyTypes

p = 761
g = 6

keyGen :: Integer -> Key
keyGen x = Key ((g^x) `mod` p) (GenData p g)

keysGen :: [Integer] -> Key
keysGen xs = Keys [((g^x) `mod` p) | x <- xs] (GenData p g)

commonKey :: Key -> Integer -> Result
commonKey (Key x (GenData ps _)) s = Result (x^s `mod` ps)

commonKeys :: Key -> [Integer] -> Result
commonKeys (Keys xs (GenData ps gs)) ss = Result $ foldl (\acc (x,s) -> acc + (x^s `mod` ps)) 0 (zip xs ss)