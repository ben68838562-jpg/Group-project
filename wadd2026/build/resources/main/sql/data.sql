INSERT INTO users VALUES ('keith', '{noop}keithpw','keith teacher','teacher@email.com','12345678');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_USER');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_ADMIN');

INSERT INTO users VALUES ('john', '{noop}johnpw','john student','student@email.com','87654321');
INSERT INTO user_roles(username, role) VALUES ('john', 'ROLE_USER');

INSERT INTO lectures (title, summary) VALUES
    ('Database Basics', 'Introduction to relational logic.'),
    ('SQL Joins', 'Learning how to combine tables.'),
    ('Database Security', 'Protecting your data from hackers.');

INSERT INTO downloads (lecture_id, link_url)
VALUES (
           (SELECT LECTURES.LECTURE_ID FROM lectures WHERE title = 'Database Basics'),
           'https://files.edu/db_basics.pdf'
       );


