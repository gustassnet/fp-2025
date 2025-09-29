module Lib1
    ( examples, Command(..)
    ) where

data Dumpable = Examples
  deriving Show

-- This is a "root" ADT representing your grammar,
-- Please expand this ADT as needed
data Command = Dump Dumpable
    | ShowBalance
    | Deposit Int
    | Withdraw Int
    | Breakdown Int
  deriving Show

examples :: [Command]
examples =
  [ ShowBalance
  , Deposit 250
  , Withdraw 115
  , Breakdown 115
  ]