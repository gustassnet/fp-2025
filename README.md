# fp-2025

## Setup

### To get started, you first need to open the project using Visual Studio Code and having Docker Desktop
1. `Ctrl + Shift + P`
2. `Dev Containers: Open Folder in Container`

### To Build & Test the Project, run the following commands
1. `stack build`
2. `stack test`

## Domain: Library

This project implements a Domain Specific Language (DSL) for managing a library of books.
The main entities are:

- `Book` – identified by `bookId`, has a `title`, `author`, `status` (*Available* or *Taken*) and a list of `chapters`.

- `Chapter` – identified by `chapterId`, has a `chapterTitle` and the chapter `text`.

- `Library` – a list of Books.

Operations in the DSL include:

- Adding and removing books (`AddBook`, `RemoveBook`)

- Viewing all books (`ShowBooks`)

- Borrowing a book (`BorrowBook`)

- Reading a book (`ReadBook`), including recursively reading chapters in order

- Dumping examples (`Dump Examples`)

The recursive element is reading chapters. A `ReadChapter` action may optionally call another `ReadChapter`, allowing a chain of chapters to be read in sequence.

### BNF

```
<command> ::= <AddBook> | <RemoveBook> | <ShowBooks> | <FindBook>
<AddBook> ::= <wp0> "AddBook" <wp> "(" <book> ")" <wp0>
<RemoveBook> ::= <wp0> "RemoveBook" <wp> <bookId> <wp0>
<ShowBooks> ::= <wp0> "ShowBooks" <wp0>
<FindBook> ::= <wp0> "FindBook" <wp> <bookId> <wp> <BookAction> <wp0>
<BookAction> ::= <BorrowBook>  | <ReadBook>
<BorrowBook> ::= "(BorrowBook" <wp> <days> ")"
<ReadBook> ::= "(ReadBook" <wp> <ReadAction> ")"
<ReadAction> ::= <ReadWhole> | <ReadChapter>
<ReadWhole> ::= <wp0> "(ReadWhole)" <wp0>
<ReadChapter> ::= <wp0> "(ReadChapter" <wp> <chapterId> ")" <wp0> | <wp0> "(ReadChapter" <wp> <chapterId> <wp> <ReadChapter> ")" <wp0>
<days> ::= [0-9]+


<book> ::= "Book" <wp> <bookId> <wp> <title> <wp> <author> <wp> <status> <wp> <chapters>
<bookId> ::= [0-9]+
<title> ::= "Harry Poter"
<author> ::= "J.K. Rowling"
<status> ::= "Available" | "Taken"
<chapters> ::= "[" <chapterList> "]"
<chapterList> ::= <chapter> | <chapter> <wp> ", " <wp> <chapterList>
<chapter> ::= <wp0> "Chapter" <wp> <chapterId> <wp> "\"" <chapterTitle> "\"" <wp> "\"" <text> "\"" <wp0>
<chapterId> ::= [0-9]+
<chapterTitle> ::= "The Boy Who Lived" | "The Vanishing Glass" | "The Letters from No One"
<text> ::= "....."

<wp0> ::= " "*
<wp> ::= " "+
```