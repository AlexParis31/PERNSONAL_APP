CREATE DATABASE pernbank;

CREATE TABLE transactionsTwo(
    transaction_id SERIAL PRIMARY KEY, name varchar(30), amount numeric(12,2), date varchar(30), category varchar(30)
);

CREATE TABLE sum(
    transaction_id SERIAL PRIMARY KEY, fundss decimal
);

CREATE TABLE myfunds(
    transaction_id SERIAL PRIMARY KEY, funds decimal
)

INSERT INTO sum (amount) VALUES ((SELECT SUM (amount) FROM transactions));

CREATE TABLE users (
    user_id uuid PRIMARY KEY DEFAULT
    uuid_generate_v4(),
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL
);

INSERT INTO users (user_name, user_email, user_password) VALUES ('alex', 'parisialexander@gmail.com', 'crm18882' );





CREATE TABLE jusers (
    user_id uuid DEFAULT uuid_generate_v4(),
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL UNIQUE,
    user_password VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE jbgtex (
    bank_id SERIAL,
    user_id UUID,
    name VARCHAR(255) NOT NULL,
    amount NUMERIC(12,2), 
    date VARCHAR(30), 
    category VARCHAR(30),
    PRIMARY KEY (bank_id),
    FOREIGN KEY (user_id) REFERENCES jusers(user_id)
);

INSERT INTO jusers (user_name, user_email, user_password) VALUES ('jacob', 'jacob123@gmail.com', 'crm18882');

INSERT INTO jbanks (user_id, name) VALUES ('7447c79a-2ccb-4942-bc07-a47201a608f4', 'uber');


CREATE TABLE jfunds (
    fund_id SERIAL,
    user_id UUID,
    funds DECIMAL NOT NULL,
    PRIMARY KEY (fund_id),
    FOREIGN KEY (user_id) REFERENCES jusers(user_id)
);

CREATE TABLE jbudget (
    budget_id SERIAL,
    user_id UUID,
    category VARCHAR(30),
    budget DECIMAL NOT NULL,
    PRIMARY KEY (budget_id),
    FOREIGN KEY (user_id) REFERENCES jusers(user_id)
);





SELECT category, SUM(amount) AS total_amount
FROM jbgtex
WHERE user_id = 'e869ec5c-aa9d-4810-a2f7-f74281450020'
GROUP BY category;

INSERT INTO jbgtex (user_id, name, amount, date, category) VALUES('e869ec5c-aa9d-4810-a2f7-f74281450020', 'null', 0, 0, 'null') RETURNING *