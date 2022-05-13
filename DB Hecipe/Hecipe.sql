CREATE TABLE Msfood (
    food_id VARCHAR(10),
    food_name VARCHAR(255),
    food_description VARCHAR(255),
    food_category VARCHAR(20),
    food_price INT,
    food_quantity INT,
    food_image MEDIUMBLOB,
    PRIMARY KEY (food_id)
);

CREATE TABLE MsUser (
    email VARCHAR(255),
    user_name VARCHAR(255),
    user_password VARCHAR(255),
    user_role VARCHAR(10),
    PRIMARY KEY (email)
);

CREATE TABLE TrTransaction (
    transaction_id VARCHAR(10),
    email VARCHAR(255),
    transaction_date DATE,
    transaction_processed VARCHAR(10),
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (email) REFERENCES MsUser(email)
);

CREATE TABLE Comment (
    comment_id VARCHAR(10),
    email VARCHAR(255),
    food_id VARCHAR(10),
    content VARCHAR(255),
    PRIMARY KEY (comment_id),
    FOREIGN KEY (email) REFERENCES MsUser(email),
    FOREIGN KEY (food_id) REFERENCES MsFood(food_id)
);

CREATE TABLE Cart (
    email VARCHAR(255),
    food_id VARCHAR(10),
    quantity INT,
    PRIMARY KEY (email, food_id),
    FOREIGN KEY (email) REFERENCES MsUser(email),
    FOREIGN KEY (food_id) REFERENCES MsFood(food_id)
);

CREATE TABLE TransactionDetail (
    transaction_id VARCHAR(10),
    food_id VARCHAR(10),
    food_name VARCHAR(255),
    food_quantity INT,
    food_price INT,
    PRIMARY KEY (transaction_id, food_id),
    FOREIGN KEY (transaction_id) REFERENCES TrTransaction(transaction_id),
    FOREIGN KEY (food_id) REFERENCES MsFood(food_id)
);

