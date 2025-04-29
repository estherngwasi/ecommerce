-- ecommerce.sql
CREATE DATABASE ecommerce;
USE ecommerce;
-- 1. brand
CREATE TABLE brand (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. product_category
CREATE TABLE product_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 3. product
CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- 4. color
CREATE TABLE color (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- 5. size_category
CREATE TABLE size_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 6. size_option
CREATE TABLE size_option (
    id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    value VARCHAR(20) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

-- 7. product_item
CREATE TABLE product_item (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    size_option_id INT,
    color_id INT,
    sku VARCHAR(100) UNIQUE,
    stock_quantity INT DEFAULT 0,
    price DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id),
    FOREIGN KEY (color_id) REFERENCES color(id)
);

-- 8. product_image
CREATE TABLE product_image (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_item_id INT NOT NULL,
    image_url TEXT NOT NULL,
    FOREIGN KEY (product_item_id) REFERENCES product_item(id)
);

-- 9. product_variation
CREATE TABLE product_variation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    variation_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- 10. attribute_category
CREATE TABLE attribute_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 11. attribute_type
CREATE TABLE attribute_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50) NOT NULL UNIQUE
);

-- 12. product_attribute
CREATE TABLE product_attribute (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    attribute_category_id INT,
    attribute_type_id INT,
    name VARCHAR(100) NOT NULL,
    value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);

-- INSETING VALUES INTO ECOMMERCE DATABASE


-- 1. brand
INSERT INTO brand (name) VALUES 
('Nike'), 
('Samsung'), 
('Apple');

-- 2. product_category
INSERT INTO product_category (name, description) VALUES 
('Clothing', 'Apparel and garments'),
('Electronics', 'Gadgets and electronic devices');

-- 3. product
INSERT INTO product (name, brand_id, category_id, base_price) VALUES 
('Running Shoes', 1, 1, 5000.00),
('Smartphone', 2, 2, 45000.00),
('Wireless Earbuds', 3, 2, 15000.00);

-- 4. color
INSERT INTO color (name) VALUES 
('Red'), 
('Black'), 
('White');

-- 5. size_category
INSERT INTO size_category (name) VALUES 
('Clothing Sizes'), 
('Shoe Sizes');

-- 6. size_option
INSERT INTO size_option (size_category_id, value) VALUES 
(1, 'S'), (1, 'M'), (1, 'L'), 
(2, '40'), (2, '42');

-- 7. product_item
INSERT INTO product_item (product_id, size_option_id, color_id, sku, stock_quantity, price) VALUES 
(1, 4, 2, 'SHOE-BLK-40', 10, 5200.00),
(1, 5, 2, 'SHOE-BLK-42', 5, 5200.00),
(2, NULL, 3, 'PHONE-WHT', 15, 46000.00),
(3, NULL, 2, 'BUDS-BLK', 25, 15500.00);

-- 8. product_image
INSERT INTO product_image (product_item_id, image_url) VALUES 
(1, 'images/shoe_black_40.jpg'),
(2, 'images/shoe_black_42.jpg'),
(3, 'images/phone_white.jpg'),
(4, 'images/earbuds_black.jpg');

-- 9. product_variation
INSERT INTO product_variation (product_id, variation_name) VALUES 
(1, 'Size'), 
(1, 'Color'), 
(2, 'Color');

-- 10. attribute_category
INSERT INTO attribute_category (name) VALUES 
('Physical'), 
('Technical');

-- 11. attribute_type
INSERT INTO attribute_type (type) VALUES 
('text'), 
('number'), 
('boolean');

-- 12. product_attribute
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, name, value) VALUES 
(1, 1, 1, 'Material', 'Mesh'), 
(1, 1, 2, 'Weight', '0.5'),
(2, 2, 1, 'Operating System', 'Android'),
(2, 2, 2, 'Battery Capacity', '4000'),
(3, 2, 3, 'Noise Cancellation', 'true');
