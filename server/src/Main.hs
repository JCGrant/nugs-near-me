{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Main where

import Web.Scotty
import Data.Text.Internal.Lazy (Text)
import Data.Aeson (FromJSON, ToJSON)
import Data.Monoid ((<>))
import GHC.Generics (Generic)


data User = User { userId :: Int, userName :: String }
  deriving (Show, Generic)

instance ToJSON User
instance FromJSON User

bob :: User
bob = User { userId = 1, userName = "bob" }

jenny :: User
jenny = User { userId = 2, userName = "jenny" }

allUsers :: [User]
allUsers = [bob, jenny]


hello :: ActionM ()
hello = do
  name <- param "name"
  text ("hello " <> name <> "!")

users :: ActionM ()
users = do
  json allUsers

matchesId :: Int -> User -> Bool
matchesId id user = userId user == id

user :: ActionM ()
user = do
  id <- param "id"
  json (filter (matchesId id) allUsers)

routes :: ScottyM ()
routes = do
  get "/hello/:name" hello
  get "/users" users
  get "/user/:id" user

main :: IO ()
main = do
  putStrLn "Starting Server..."
  scotty 3000 routes