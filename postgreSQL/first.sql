DROP TABLE IF EXISTS subject;
DROP TABLE IF EXISTS instructor;
DROP TABLE IF EXISTS student;

CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    age INT NOT NULL CHECK (age > 17),
    height DECIMAL(5,2),
    grade FLOAT
);

CREATE TABLE instructor (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    age INT NOT NULL CHECK (age > 30),
    courses VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS student_instructor;

CREATE TABLE subject (
    student_id INTEGER NOT NULL,
    instructor_id INTEGER NOT NULL,
    PRIMARY KEY (student_id, instructor_id),
    FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
    FOREIGN KEY (instructor_id) REFERENCES instructor(id) ON DELETE CASCADE
);
