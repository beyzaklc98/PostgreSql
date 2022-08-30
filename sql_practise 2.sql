CREATE TABLE workers
(
  id int,
  name varchar(20),
  title varchar(60),
  manager_id int
);

INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

select * from workers;

-- Tabloya company_industry isminde sütun ekleyiniz
alter table workers add company_industry varchar(20);

-- TABLOYA worker_address sütunu ve default olarakta 'Miami, FL, USA' adresini ekleyiniz.
alter table workers
add column worker_adress varchar(50) default 'Miami, FL, USA';

-- tablodaki worker_address sütununu siliniz
ALTER TABLE workers DROP COLUMN worker_address;

-- Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.
alter table workers rename company_industry to company_profession;

-- Tablonun ismini employees olarak değişitiriniz.
alter table workers rename to employees;

-- Tablodaki title sütununa data tipini VARCHAR(50) olarak değiştiriniz.
ALTER TABLE employees
ALTER column title TYPE VARCHAR(50);

alter table employees alter title type varchar(50);

-- Tablodaki title sütununa "UNIQUE" kıstlaması ekleyiniz.
ALTER TABLE employees ADD CONSTRAINT title UNIQUE (title); -- olmayacak cunku ceo dan 2 tane var





