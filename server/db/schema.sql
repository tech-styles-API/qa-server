DROP DATABASE IF EXISTS qadb;
CREATE DATABASE qadb;

\c qadb;

CREATE TABLE questions (
  T SERIAL NOT NULL UNIQUE,
  product_id INTEGER,
  question_body VARCHAR,
  question_date BIGINT,
  asker_name VARCHAR,
  q_email VARCHAR,
  question_helpfulness INTEGER,
  reported INTEGER,
  -- answers VARCHAR[],
  PRIMARY KEY (question_id)
);

CREATE TABLE answers (
  id SERIAL NOT NULL UNIQUE,
  question_id INTEGER,
  body VARCHAR,
  date BIGINT,
  answerer_name VARCHAR,
  a_email VARCHAR,
  helpfulness INTEGER,
  a_reported INTEGER,
  -- photos VARCHAR[],
  PRIMARY KEY (id),
  FOREIGN KEY (question_id) REFERENCES questions (question_id)
);

CREATE TABLE photos (
  id SERIAL NOT NULL UNIQUE,
  answer_id INTEGER,
  url VARCHAR,
  PRIMARY KEY (id),
  FOREIGN KEY (answer_id) REFERENCES answers (id)
);

\c postgres