CREATE TABLE "books" (
  "id"         INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "title"      varchar,
  "summary"       text,
  "author"     varchar,
  "ISBN"		string,
  "in"			boolean,
  "published" datetime NOT NULL);