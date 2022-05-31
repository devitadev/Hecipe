CREATE TABLE Msfood (
    food_id VARCHAR(10),
    food_name VARCHAR(255),
    food_description VARCHAR(255),
    food_category VARCHAR(20),
    food_price INT,
    food_quantity INT,
    food_image VARCHAR(255),
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

INSERT INTO MsUser VALUES 
('devita@gmail.com', 'Devita', 'devita20', 'admin'),
('dewipt@gmail.com', 'Dewi', 'dewi15', 'admin'),
('syntia@gmail.com', 'Syntia', 'syntia3', 'member');

INSERT INTO MsFood VALUES
('FD001', 'Gado-Gado', 'Gado-gado is an Indonesian salad of steamed vegetables, hard-boiled eggs, boiled potato, fried tofu and tempeh, and lontong, served with a peanut sauce dressing.', 'Vegetarian', 20000, 10, 'assets/menu/gado-gado.jpeg'),
('FD002', 'Nasi Goreng Seafood', 'Nasi goreng seafood is an Indonesian salad of fried rice with shrimp and squid.', 'Meats', 25000, 10, 'assets/menu/nasi-goreng-seafood.jpeg'),
('FD003', 'Nasi Goreng', 'Nasi goreng seafood is an Indonesian salad that taste sweet and savoury', 'Vegetarian', 18000, 10, 'assets/menu/nasi-goreng.jpeg'),
('FD004', 'Nasi Padang', 'Nasi Padang is a Minangkabau steamed rice served with various pre-cooked dishes originating from West Sumatra, Indonesia. It is named after the city Padang, capital of West Sumatra province.', 'Meats', 28000, 5, 'assets/menu/nasi-padang.png'),
('FD005', 'Rendang', 'Rendang is a beef dish rich in spicy and herbal flavors indigenous to the Minangkabau region of West Sumatra, and one of the most famous representatives of Indonesian cuisine.', 'Meats', 35000, 3, 'assets/menu/rendang.jpeg');
