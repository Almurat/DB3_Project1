-- SQLite
CREATE TABLE user (
  id INT PRIMARY KEY,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  password VARCHAR(45) NOT NULL,
  admin BOOLEAN,
  active BOOLEAN
);

CREATE TABLE product(
    product_id INT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    requirements VARCHAR(500) NOT NULL,
    tags VARCHAR(500) NOT NULL,
    year INT,
    platform VARCHAR(500) NOT NULL,
    genre VARCHAR(500) NOT NULL,
    steam_url VARCHAR(500) NOT NULL,
    original_cost INT NOT NULL,
    discount_cost INT NOT NULL
);

CREATE TABLE cart(
    cart_id INT PRIMARY KEY,
    product_id INT,
    user_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category_name TEXT
);

CREATE TABLE story (
    story_id INT PRIMARY KEY,
    title VARCHAR(45),
    URL VARCHAR(250),
    text VARCHAR(45),
    autors VARCHAR(45),
    date CURRENT_DATE
);

CREATE TABLE comments (
    coments_id INT PRIMARY KEY,
    text VARCHAR(45) ,
    is_deleted BOOLEAN,
    time CURRENT_DATE,
    ranking INT,
);

CREATE TABLE comments_items (
    comments_items_id  INT PRIMARY KEY,
    comment_id INT FOREIGN KEY REFERENCES comments(coments_id)
);

CREATE TABLE news_bridge (
    news_id INT PRIMARY KEY,
    user_id INT FOREIGN KEY REFERENCES user(id),
    news_category_id INT FOREIGN KEY REFERENCES category(category_id),
    story_id INT FOREIGN KEY REFERENCES story(story_id),
    comments_items_id FOREIGN KEY REFERENCES comments(comments_items_id),
);