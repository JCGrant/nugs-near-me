{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty

hello :: ActionM ()
hello = do
  text "hello world!"

routes :: ScottyM ()
routes = do
  get "/hello" hello

main :: IO ()
main = do
  putStrLn "Starting Server..."
  scotty 3000 routes