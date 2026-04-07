CREATE TABLE IF NOT EXISTS guestbook (
    id BIGINT GENERATED ALWAYS AS IDENTITY,
    date TIMESTAMP,
    message VARCHAR(255),
    name VARCHAR(255),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS downloads;
DROP TABLE IF EXISTS lectures;

CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(200) NOT NULL,
    phonenumber VARCHAR(8) NOT NULL,
    PRIMARY KEY (username)
);


CREATE TABLE IF NOT EXISTS user_roles (
    user_role_id INTEGER GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_role_id),
    FOREIGN KEY (username) REFERENCES users(username)
);

CREATE TABLE IF NOT EXISTS lectures (
    lecture_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(200) NOT NULL unique,
    summary VARCHAR(300)
);

CREATE TABLE IF NOT EXISTS downloads (
    download_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    lecture_id INTEGER NOT NULL,
    link_url VARCHAR(255),
    FOREIGN KEY (lecture_id) REFERENCES lectures(lecture_id)
);

CREATE TABLE IF NOT EXISTS comments
(
    comments_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    lecture_id  INTEGER NOT NULL,
    date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    message     VARCHAR(1000),
    name        VARCHAR(255),
    FOREIGN KEY (lecture_id) REFERENCES lectures (lecture_id)
)