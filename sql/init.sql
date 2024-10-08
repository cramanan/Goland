BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS users (
    id VARCHAR(36) PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    name VARCHAR(50) NOT NULL,
    password BYTEA NOT NULL,
    gender VARCHAR(1) NOT NULL,
    date_of_birth DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    created DATE NOT NULL,
    posts VARCHAR(5) ARRAY
);

CREATE TABLE IF NOT EXISTS posts (
    id VARCHAR(5) PRIMARY KEY,
    userid VARCHAR(36) REFERENCES users(id),
    categories TEXT ARRAY,
    content TEXT NOT NULL,
    created DATE NOT NULL,
    image_path TEXT
);

CREATE TABLE IF NOT EXISTS comments(
    id VARCHAR(5) PRIMARY KEY,
    userid VARCHAR(36) REFERENCES users(id),
    postid VARCHAR(5) REFERENCES posts(id),
    username VARCHAR(50),
    content TEXT NOT NULL,
    created DATE NOT NULL
);
COMMIT;