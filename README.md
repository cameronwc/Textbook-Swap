# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version
* Ruby 2.5.1

## System dependencies
* Rails 5.2.1
* Postgres

## Configuration

## Database creation
* Setup a postgres database with a textbookswap table
* This is done in different ways depending on your operating system
    macOS: https://www.codementor.io/engineerapart/getting-started-with-postgresql-on-mac-osx-are8jcopb
    linux: Depends on distrobution

## Database initialization
* in a terminal run these commands, replacing your username and password with the ones you setup in postgres:
```bash
export POSTGRES_USERNAME='username'
```
```bash
export POSTGRES_PASSWORD='password'
```

## How to run the test suite

## Deployment instructions
1. Ensure postgres db is running
2. bundle install
3. rails s