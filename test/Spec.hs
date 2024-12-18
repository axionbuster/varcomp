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

compose0 :: Int -> String
compose0 = toString .**. addOne

compose1 :: Int -> Int -> String
compose1 = toString .**. add

main :: IO ()
main = hspec $ do
  describe "Variadic composition" $ do
    it "works with single argument functions" $ do
      compose0 5 `shouldBe` "6"

    it "works with two argument functions" $ do
      compose1 1 2 `shouldBe` "3"
