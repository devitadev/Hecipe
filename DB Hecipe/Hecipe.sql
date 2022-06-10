CREATE TABLE Msfood (
    food_id INT AUTO_INCREMENT,
    food_name VARCHAR(255),
    food_description VARCHAR(255),
    food_category VARCHAR(20),
    food_price INT,
    food_quantity INT,
    food_image VARCHAR(255),
    PRIMARY KEY (food_id)
);

CREATE TABLE MsUser (
    user_id INT AUTO_INCREMENT,
    email VARCHAR(255),
    user_name VARCHAR(255),
    user_password VARCHAR(255),
    user_role VARCHAR(10),
    PRIMARY KEY (user_id)
);

CREATE TABLE TrTransaction (
    transaction_id INT AUTO_INCREMENT,
    user_id INT,
    transaction_date DATE,
    transaction_processed VARCHAR(10),
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (user_id) REFERENCES MsUser(user_id)
);

CREATE TABLE Comment (
    comment_id INT AUTO_INCREMENT,
    user_id INT,
    food_id INT,
    content VARCHAR(1000),
    PRIMARY KEY (comment_id),
    FOREIGN KEY (user_id) REFERENCES MsUser(user_id),
    FOREIGN KEY (food_id) REFERENCES MsFood(food_id)
);

CREATE TABLE Cart(
    user_id INT,
    food_id INT,
    quantity INT,
    PRIMARY KEY (user_id, food_id),
    FOREIGN KEY (user_id) REFERENCES MsUser(user_id),
    FOREIGN KEY (food_id) REFERENCES MsFood(food_id)
);

CREATE TABLE TransactionDetail (
    transaction_id INT,
    food_id INT,
    food_quantity INT,
    PRIMARY KEY (transaction_id, food_id),
    FOREIGN KEY (transaction_id) REFERENCES TrTransaction(transaction_id),
    FOREIGN KEY (food_id) REFERENCES MsFood(food_id)
);

CREATE TABLE NumberOfUser (
    NumberOfUser INT
);

INSERT INTO MsUser (email, user_name, user_password, user_role) VALUES 
('devita@gmail.com', 'Devita', 'devita20', 'admin'),
('dewipt@gmail.com', 'Dewi', 'dewi15', 'admin'),
('syntia@gmail.com', 'Syntia', 'syntia3', 'member'),
('anthony@gmail.com', 'Anthony', 'gete1234', 'member'),
('kevin@gmail.com', 'Kevin', 'kevin20', 'member');

INSERT INTO MsFood (food_name, food_description, food_category, food_price, food_quantity, food_image) VALUES
('Gado-Gado', 'Gado-gado is an Indonesian salad of steamed vegetables, hard-boiled eggs, boiled potato, fried tofu and tempeh, and lontong, served with a peanut sauce dressing.', 'Vegetarian', 20000, 10, 'assets/menu/gado-gado.jpeg'),
('Nasi Goreng Seafood', 'Nasi goreng seafood is an Indonesian salad of fried rice with shrimp and squid.', 'Meats', 25000, 10, 'assets/menu/nasi-goreng-seafood.jpeg'),
('Nasi Goreng', 'Nasi goreng seafood is an Indonesian salad that taste sweet and savoury', 'Vegetarian', 18000, 10, 'assets/menu/nasi-goreng.jpeg'),
('Nasi Padang', 'Nasi Padang is a Minangkabau steamed rice served with various pre-cooked dishes originating from West Sumatra, Indonesia. It is named after the city Padang, capital of West Sumatra province.', 'Meats', 28000, 5, 'assets/menu/nasi-padang.png'),
('Rendang', 'Rendang is a beef dish rich in spicy and herbal flavors indigenous to the Minangkabau region of West Sumatra, and one of the most famous representatives of Indonesian cuisine.', 'Meats', 35000, 3, 'assets/menu/rendang.jpeg');

INSERT INTO Comment (user_id, food_id, content) VALUES
(3, 1, 'I really really like this food!!'),
(4, 1, 'This is the best gado-gado i ever had ! must try !!'),
(5, 1, 'This is the best gado-gado i ever had ! must try !! This is the best gado-gado i ever had ! must try !! This is the best gado-gado i ever had ! must try !! This is the best gado-gado i ever had ! must try !! This is the best gado-gado i ever had ! must try !! This is the best gado-gado i ever had ! must try !! This is the best gado-gado i ever had ! must try !! This is the best gado-gado i ever had ! must try !!');
