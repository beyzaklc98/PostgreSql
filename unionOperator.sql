CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);

INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;
/*
UNION Operator: 1) İki sorgu(query) sonucunu birleştirmek için kullanılır.
                2) Tekrarsız(unique) recordları verir.
                3) Tek bir sütuna çok sütun koyabiliriz.
				4) Tek bir sütuna çok sütun koyarken mevcut data durumuna dikkat etmek gerekir.			
*/

--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarsız olarak bulun.
select state AS "Name and State", salary
FROM workers
where salary>3000

UNION

select name, salary
FROM workers
where salary<2000;

--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarlı olarak bulun.
select state AS "Name and State", salary
FROM workers
where salary>3000

UNION ALL -- UNION ile aynı isi yapar, ancak tekrarlı degerleri de veririr.

select name, salary
FROM workers
where salary<2000;

--salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.
SELECT name
FROM workers
WHERE salary > 1000;

INTERSECT--INTERSECT Operator: İki sorgu (query) sonucunun ortak(common) değerlerini verir. Unique(tekrarsız) recordları verir.

SELECT name
FROM workers
WHERE salary < 2000;

--salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.
SELECT name
FROM workers
WHERE salary < 2000

INTERSECT

SELECT name 
FROM workers
WHERE company In('IBM', 'APPLE', 'MICROSOFT');
