-- =============================================================
-- CIS 4720  In Class Lab 8  -  Build a Database of Your Own
-- Schema: inventory_db
-- Run one statement at a time (Ctrl+E, Ctrl+E).
-- =============================================================


-- =============================================================
-- STEP 6. Create the INVENTORY table
-- =============================================================
-- Builds the parts cupboard table; item_id is the primary key so no two items share an id
CREATE TABLE INVENTORY (
    item_id      INT           NOT NULL,
    item_name    VARCHAR(40)   NOT NULL,
    category     VARCHAR(30),
    quantity     INT,
    unit_cost    DECIMAL(7,2),
    received_on  DATE,
    PRIMARY KEY (item_id)
);

DESCRIBE INVENTORY;



INSERT INTO INVENTORY (item_id, item_name, category, quantity, unit_cost, received_on)
VALUES (1, 'Laser Mouse', 'Peripherals', 25, 18.50, '2026-02-10');

INSERT INTO INVENTORY (item_id, item_name, category, quantity, unit_cost, received_on)
VALUES (2, 'Mechanical Keyboard', 'Peripherals', 12, 64.00, '2026-03-05');

INSERT INTO INVENTORY (item_id, item_name, category, quantity, unit_cost, received_on)
VALUES (3, 'USB Hub', 'Accessories', 40, 22.75, '2026-04-18');

SELECT * FROM INVENTORY;


SELECT item_id, item_name, unit_cost FROM INVENTORY;


UPDATE INVENTORY SET unit_cost = 59.99 WHERE item_id = 2;

SELECT item_id, item_name, unit_cost FROM INVENTORY;


CREATE VIEW INVENTORY_VALUE AS
SELECT item_name,
       quantity,
       unit_cost,
       quantity * unit_cost AS total_value
FROM INVENTORY;

SELECT * FROM INVENTORY_VALUE ORDER BY total_value DESC;


CREATE TABLE INVENTORY_COPY AS
SELECT * FROM INVENTORY;

SHOW CREATE TABLE INVENTORY_COPY;

SHOW CREATE TABLE INVENTORY;

ALTER TABLE INVENTORY_COPY ADD PRIMARY KEY (item_id);

DESCRIBE INVENTORY_COPY;

-- 

CREATE USER 'stockclerk'@'localhost' IDENTIFIED BY 'Stock#2026';


SELECT user, host FROM mysql.user ORDER BY user;
