
TRUNCATE TABLE foods RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO foods (name, average_cooking_time,rating) VALUES ('Cookie', 10,2),('Cake',30,4);