{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Main where

import Web.Scotty
import Data.Text.Internal.Lazy (Text)
import Data.Aeson (FromJSON, ToJSON)
import Data.Monoid ((<>))
import GHC.Generics (Generic)

data Coordinate = Coordinate { latitude :: Float, longitude :: Float }
  deriving (Show, Generic)

instance ToJSON Coordinate
instance FromJSON Coordinate

newtype Shop = Shop { coordinate :: Coordinate }
  deriving (Show, Generic)

instance ToJSON Shop
instance FromJSON Shop

allShops :: [Shop]
allShops =
  [ Shop { 
    coordinate =
      Coordinate { latitude = 51.500, longitude = -0.172}
  }
  , Shop {
    coordinate =
      Coordinate { latitude = 51.500, longitude = -0.177}
  }
  , Shop {
    coordinate =
      Coordinate { latitude = 51.505, longitude = -0.172}
  }
  , Shop {
    coordinate =
      Coordinate { latitude = 51.505, longitude = -0.177}
  }
  ]


shops :: ActionM ()
shops = do
  json allShops

routes :: ScottyM ()
routes = do
  get "/shops" shops

main :: IO ()
main = do
  putStrLn "Starting Server..."
  scotty 3000 routes