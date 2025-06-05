-- SQL Database schema for SDCKL Student Attendance System

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE students (
    student_id VARCHAR(20) PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    remarks TEXT
);

CREATE TABLE classes (
    class_id VARCHAR(20) PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL
);

CREATE TABLE attendance_records (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id VARCHAR(20) NOT NULL,
    timestamp DATETIME NOT NULL,
    status ENUM('Present', 'Late', 'Absent') NOT NULL,
    fingerprint_data BLOB,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Insert default admin user (password should be hashed in real use)
INSERT INTO users (username, password_hash, role, name) VALUES
('admin', 'admin123', 'admin', 'Administrator');
