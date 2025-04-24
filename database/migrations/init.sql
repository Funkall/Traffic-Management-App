CREATE DATABASE IF NOT EXISTS traffic_management;
USE traffic_management;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE traffic_signals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    status ENUM('red', 'yellow', 'green') NOT NULL
);

CREATE TABLE incidents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
