USE zeppelin
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(30),
    product VARCHAR(30),
    quantity INT,
    order_date DATE
);

DELIMITER $$
CREATE PROCEDURE generate_orders(cnt INT)
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i < cnt DO
    INSERT INTO orders (customer_name, product, quantity, order_date)
    VALUES (
      CONCAT('Customer', FLOOR(1 + (RAND()*1000))),
      CONCAT('Product', FLOOR(1 + (RAND()*100))),
      FLOOR(1 + (RAND()*10)),
      DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND()*365) DAY)
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;

-- 1,000개 생성
CALL generate_orders(1000);
DROP PROCEDURE IF EXISTS generate_orders;
