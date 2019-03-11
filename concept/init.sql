DROP DATABASE elibs_db;
CREATE DATABASE IF NOT EXISTS elibs_db;
USE elibs_db;


CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  is_admin BOOLEAN NOT NULL DEFAULT FALSE,
  username VARCHAR(128) NOT NULL,
  email VARCHAR(128) NOT NULL,
  password VARCHAR(128) NOT NULL,
  phone VARCHAR(20),
  rating DOUBLE
);
-- Books
CREATE TABLE IF NOT EXISTS books (
  id INT AUTO_INCREMENT PRIMARY KEY,
  isbn VARCHAR(32) NOT NULL,
  title VARCHAR(128) NOT NULL,
  author VARCHAR(128) NOT NULL,
  synopsis TEXT,
  wear TINYINT
);

CREATE TABLE IF NOT EXISTS genres (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(32)
);

CREATE TABLE IF NOT EXISTS genres_books (
  genre_id INT,
  book_id INT,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE IF NOT EXISTS ads (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  price DOUBLE,
  shipping DOUBLE,
  tradable BOOLEAN,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS ads_books(
  ad_id INT,
  book_id INT,
  FOREIGN KEY (ad_id) REFERENCES ads(id),
  FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE IF NOT EXISTS trade_requests (
  id INT AUTO_INCREMENT PRIMARY KEY,
  sale_ad_id INT,
  wanted_ad_id INT,
  FOREIGN KEY (sale_ad_id) REFERENCES ads(id),
  FOREIGN KEY (wanted_ad_id) REFERENCES ads(id)
);

CREATE Table IF NOT EXISTS addresses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  billing BOOLEAN,
  address1 VARCHAR(256),
  address2 VARCHAR(256),
  country VARCHAR(128),
  city VARCHAR(128),
  state VARCHAR(128),
  zipcode VARCHAR(16),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS transactions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  ad_id INT ,
  buyer_id INT,
  trade_id INT,
  FOREIGN KEY (buyer_id) REFERENCES users(id),
  FOREIGN KEY (trade_id) REFERENCES trade_requests(id)
);
