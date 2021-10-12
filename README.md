# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| colum              | type   |    option        |
| --------------------------- | -----------------|
| email              | string | null: false ,uni |
| encrypted_password | string | null: false      |
| name               | string | null: false      |
| profile            | text   | null: false      |
| occupation         | text   | null: false      |
| position           | text   | null: false      |

## prototypes

| colum            | type     |       option                    |
|---------------------------------------------------------------|
| title           | string    | null: false                     |
| cath_copy       | text      | null: false                     |
| concept         | text      | null: false                     |
| user            | reference | null: false, foreign _key: true |

## comments テーブル

| colum     | type       |        option                  |
|---------------------------------------------------------|
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true | 
| user      | references | null: false, foreign_key: true |