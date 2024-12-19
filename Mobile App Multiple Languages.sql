CREATE TABLE apps (
         app_id INT PRIMARY KEY, 
         app_name VARCHAR(100), 
         available_languages INT
     );
     INSERT INTO apps VALUES 
         (1, 'Truecaller', 10), 
         (2, 'Facebook', 5), 
         (3, 'Snapchat', 1);

SELECT * FROM APPS

/*
List all mobile apps available in multiple languages.
*/

SELECT APP_NAME
FROM APPS
WHERE AVAILABLE_LANGUAGES>1;