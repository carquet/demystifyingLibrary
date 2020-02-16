-- db/comments.sql --

CREATE TABLE "reviews" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "body" text,
  "author" varchar,
  "book_id" integer,
  "created_at" datetime NOT NULL);