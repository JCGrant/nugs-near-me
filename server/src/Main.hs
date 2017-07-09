{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import Data.Text.Internal.Lazy (Text)
import Data.Monoid ((<>))

hello :: ActionM ()
hello = do
  name <- param "name"
  text ("hello " <> name <> "!")

routes :: ScottyM ()
routes = do
  get "/hello/:name" hello

main :: IO ()
main = do
  putStrLn "Starting Server..."
  scotty 3000 routes