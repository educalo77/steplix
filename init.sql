 -- schema.sql
-- Since we might run the import many times we'll drop if exists
DROP DATABASE IF EXISTS nodepsqldocker;

CREATE DATABASE nodepsqldocker;

-- Make sure we're using our `blog` database
\c nodepsqldocker;

-- We can create our user table
CREATE TABLE IF NOT EXISTS currencies (
  id SERIAL PRIMARY KEY,
  description VARCHAR(255) NOT NULL,
  symbol VARCHAR(255) NOT NULL
);

-- We can create our post table
CREATE TABLE IF NOT EXISTS rates (
  id SERIAL PRIMARY KEY,
  id_currency INTEGER REFERENCES currencies(id),
  value REAL NOT NULL,
);

INSERT INTO currencies (description, symbol) VALUES ('bitcoin', 'BTC');
INSERT INTO currencies (description, symbol) VALUES ('etherum', 'ETH');
INSERT INTO currencies (description, symbol) VALUES ('cardano', 'ADA');