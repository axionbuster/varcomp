module Main (main) where

import Test.Hspec
import Variadic.Composition (Compose ((.**.)))

-- Test functions
toString :: Int -> String
toString = show

addOne :: Int -> Int
addOne = (+ 1)

add :: Int -> Int -> Int
add x y = x + y

concat3 :: String -> String -> String -> String
concat3 x y z = x ++ y ++ z

main :: IO ()
main = hspec $ do
  describe "Variadic composition" $ do
    it "works with single argument functions" $ do
      (toString .**. addOne) 5 `shouldBe` "6"

    it "works with two argument functions" $ do
      (toString .**. add) 1 2 `shouldBe` "3"

    it "works with three argument functions" $ do
      (toString .**. concat3) "a" "b" "c" `shouldBe` "abc"

    it "maintains function behavior" $ do
      let f = toString .**. addOne
      let g = toString . addOne
      f 10 `shouldBe` g 10 