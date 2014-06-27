INSERT INTO address (CITY, COUNTRY, STREET, ZIPCODE) 
	values("BUDAPEST", "HUNGARY", "FUTO 14", "1085");

INSERT INTO RESTAURANT (NAME, ADDRESS_ID)
	VALUES("THE BEST", 1);

INSERT INTO FOOD (CALORIES, ISVEGAN, NAME, PRICE) 
	VALUES(1300, false, "VALAMI", 1400);
INSERT INTO FOOD (CALORIES, ISVEGAN, NAME, PRICE) 
	VALUES(1500, false, "VALAMI2", 100);
INSERT INTO FOOD (CALORIES, ISVEGAN, NAME, PRICE) 
	VALUES(1000, TRUE, "SZINTE INGYEN", 10);
INSERT INTO FOOD (CALORIES, ISVEGAN, NAME, PRICE) 
	VALUES(1040, TRUE, "EGESZ OLCSO", 100);
INSERT INTO FOOD (CALORIES, ISVEGAN, NAME, PRICE) 
	VALUES(1009, TRUE, "NEM IS ER MEG ENNYIT", 1000);

INSERT INTO MENU (RESTAURANT_ID, FROMDATE, TODATE) 
	values(1, CURDATE(), CURDATE()+ INTERVAL 2 MONTH - INTERVAL 1 day);
INSERT INTO MENU (RESTAURANT_ID, FROMDATE, TODATE) 
	values(1, CURDATE()+ interval 1 MONTH, CURDATE()+ INTERVAL 2 MONTH - INTERVAL 1 day);

INSERT INTO MENU_FOOD (MENU_ID, FOODS_ID) VALUES(1, 1);
INSERT INTO MENU_FOOD (MENU_ID, FOODS_ID) VALUES(1, 2);
INSERT INTO MENU_FOOD (MENU_ID, FOODS_ID) VALUES(1, 3);
INSERT INTO MENU_FOOD (MENU_ID, FOODS_ID) VALUES(1, 4);
INSERT INTO MENU_FOOD (MENU_ID, FOODS_ID) VALUES(1, 5);

INSERT INTO FOOD (CALORIES, ISVEGAN, NAME, PRICE) 
	VALUES(10, TRUE, "SOMETHING EXTRA", 100000);
INSERT INTO FOOD (CALORIES, ISVEGAN, NAME, PRICE) 
	VALUES(11, FALSE, "PRICELESS", 99999999);

INSERT INTO MENU_FOOD (MENU_ID, FOODS_ID) VALUES(2, 6);
INSERT INTO MENU_FOOD (MENU_ID, FOODS_ID) VALUES(2, 7);

SELECT * FROM FOOD;
SELECT * FROM FOOD WHERE ISVEGAN = TRUE;
SELECT * FROM FOOD ORDER BY PRICE;
SELECT * FROM FOOD WHERE PRICE = (SELECT MAX(PRICE) FROM FOOD);
SELECT MENU_ID, COUNT(*) FROM MENU_FOOD GROUP BY MENU_ID;
SELECT * FROM RESTAURANT JOIN ADDRESS;
SELECT * FROM FOOD 
WHERE FOOD.ID IN (
	SELECT FOODS_ID 
	FROM MENU_FOOD 
	WHERE MENU_FOOD.MENU_ID IN (
		SELECT ID 
		FROM MENU 
		WHERE CURDATE() BETWEEN FROMDATE AND TODATE));

SELECT FOOD.* 
FROM FOOD 
JOIN MENU_FOOD ON FOOD.ID = MENU_FOOD.FOODS_ID 
JOIN MENU ON MENU_FOOD.MENU_ID = MENU.ID 
WHERE curdate() BETWEEN MENU.FROMDATE AND MENU.TODATE;

SELECT * FROM MENU;