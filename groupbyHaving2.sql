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

--Toplam salary değeri 2500 üzeri olan her bir çalışan için salary toplamını bulun.
select name, SUM(salary) AS "Total Salary" -- Cift tırnak sadece AS'te kullanılır
FROM workers 
group by name 
HAVING SUM(salary) > 2500; -- "Group by" ardından "where" kullanılmaz, sum, arg vs. kullanılır

-- Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun. (bulun diyor, select kullanırız)
select state, COUNT(state) AS number_of_employees -- state yanındakini gormek icin yazdık
FROM workers
GROUP BY state
HAVING COUNT(state)>1; -- Having, Group By ardından filtreleme icin kullanılır

--Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.
select state,max(salary)
from workers
group by state
having max(salary)<3000; 
-- Texas'ı vermedi cunku texsas'ın en buyuk degeri 7000 ve 3000'den fazla diye almadı
						
--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.
select company, MIN(salary) AS min_salary
from workers
group by company
having min(salary)>2000; 

--Tekrarsız isimleri çağırın.
SELECT DISTINCT name
FROM workers; -- DISTINCT clause, cagırılan terimlerden tekrarsız olanların sadece birincisini alır.

--Name değerlerini company kelime uzunluklarına göre sıralayın.
SELECT name, company
FROM workers
ORDER BY LENGTH(company);

--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
--Concat() fonksiyonu birden fazla sütun veya String degerini birlestirmek icin kullanılır.
--1. YOL
SELECT CONCAT(name, ' ',state) AS name_and_state AS neme_and_state
FROM workers
ORDER BY LENGTH(name) + LENGTH(state);

--2. YOL
SELECT name || ' ' || state || ' ' || LENGTH(name) + LENGTH(state) --concat yerine bu isaret kullanılır.
FROM workers
ORDER BY LENGTH(name) + LENGTH(state);

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

--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. 
--Unique(tekrarsız) recordları verir.
--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.
SELECT name
FROM workers
WHERE salary < 3000

EXCEPT -- haric demek

SELECT name
FROM workers
WHERE company = 'GOOGLE';

/*
JOINS: 1)INNER JOIN:
       2)LEFT JOIN:
	   3)RIGHT JOIN:
	   4)FULL JOIN:
	   5)SELF JOIN:
*/

