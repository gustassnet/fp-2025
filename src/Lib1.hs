module Lib1
    ( examples, Command(..), Dumpable (..)
    ) where

data Dumpable = Examples
  deriving Show

-- This is a "root" ADT representing your grammar,
-- Please expand this ADT as needed


-- Biblioteka
type Library = [Book]


-- Knygos struktura
data Book = Book
  { bookId :: Int
  , title :: String
  , author :: String
  , status :: BookStatus
  , chapters :: [Chapter]
  }
  deriving (Show)


-- Knygos skyrius
data Chapter = Chapter
  { chapterId :: Int
  , chapterTitle :: String
  , text :: String
  }
  deriving (Show)


-- Knygos statusas
data BookStatus = Available | Taken
  deriving (Show, Eq)


-- Skaitymo komandos
data BookAction
  = BorrowBook { days :: Int }
  | ReadBook { readAction :: ReadAction }
  deriving (Show)


-- Skaitymo veiksmai
data ReadAction
  = ReadWhole
  | ReadChapter { chapter :: Int, next :: Maybe ReadAction }
  deriving (Show)


-- Pagrindines komandos
data Command 
  = AddBook Book 
  | RemoveBook Int
  | ShowBooks 
  | FindBook Int BookAction
  | Dump Dumpable
  deriving Show


examples :: [Command]
examples =
  [ AddBook (Book 1 "Harry Potter and the Philosopher's Stone" "J.K.Rowling" Available 
              [ Chapter 1 "The Boy Who Lived" "....."
              , Chapter 2 "The Vanishing Glass" "....."
              , Chapter 3 "The Letters from No One" "....."
              ]),
    AddBook (Book 2 "Harry Potter and the Chamber of Secrets" "J.K.Rowling" Available 
              [ Chapter 1 "The Worst Birthday" "....."
              , Chapter 2 "Dobby's Warning" "....."
              , Chapter 3 "The Burrow" "....."
              ]),
    AddBook (Book 3 "Harry Potter and the Prisoner of Azkaban" "J.K.Rowling" Available 
              [ Chapter 1 "Owl Post" "....."
              , Chapter 2 "Aunt Marge's Big Mistake" "....."
              , Chapter 3 "The Knight Bus" "....."
              ]),
    RemoveBook 3,
    ShowBooks,
    FindBook 1 (BorrowBook 14),
    FindBook 1 (ReadBook (ReadChapter 1 (Just (ReadChapter 2 (Just ReadWhole))))),
    FindBook 2 (ReadBook (ReadChapter 1 (Just (ReadChapter 2 Nothing)))),
    Dump Examples
  ]