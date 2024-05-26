DROP DATABASE IF EXISTS Safesync;

CREATE DATABASE Safesync;

USE Safesync;

DROP TABLE IF EXISTS User;

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    age INT,
    address VARCHAR(255),
    contact_number VARCHAR(15)
);

DROP TABLE IF EXISTS Reports;

CREATE TABLE Reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    type_of_emergency VARCHAR(50) NOT NULL,
    severity ENUM('low', 'medium', 'high', 'critical') NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date_time DATETIME NOT NULL
);
