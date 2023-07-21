--film tablosunda bulunan title ve description sütunlarındaki verileri sıralayınız.
select title,description from film
--film tablosunda bulunan tüm sütunlardaki verileri film uzunluğu (length) 60 dan büyük VE 75 ten küçük olma koşullarıyla sıralayınız.
Select * from film where "length" between 60 and 75
--film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma koşullarıyla sıralayınız.
select * from film Where rental_rate = 0.99 And replacement_cost = 12.99 OR replacement_cost = 28.99
--customer tablosunda bulunan first_name sütunundaki değeri 'Mary' olan müşterinin last_name sütunundaki değeri nedir? [Smith]
select last_name,first_name From customer where first_name = 'Mary'
--film tablosundaki uzunluğu(length) 50 ten büyük OLMAYIP aynı zamanda rental_rate değeri 2.99 veya 4.99 OLMAYAN verileri sıralayınız.
Select * from film where length <=50 and rental_rate Not in (2.99,4.99);
--film tablosunda bulunan tüm sütunlardaki verileri replacement cost değeri 12.99 dan büyük eşit ve 16.99 küçük olma koşuluyla sıralayınız ( BETWEEN - AND yapısını kullanınız.)
select * from film where  (replacement_cost >= 12.99) and (replacement_cost <=16.99)
--actor tablosunda bulunan first_name ve last_name sütunlardaki verileri first_name 'Penelope' veya 'Nick' veya 'Ed' değerleri olması koşuluyla sıralayınız. ( IN operatörünü kullanınız.)
SELECT first_name,last_name FROM actor WHERE first_name IN ('Penelope','Nick','Ed');
--film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99, 2.99, 4.99 VE replacement_cost 12.99, 15.99, 28.99 olma koşullarıyla sıralayınız. ( IN operatörünü kullanınız.)
select * from film where rental_rate IN (0.99,2.99,4.99) and replacement_cost IN (12.99,15.99,28.99)
--country tablosunda bulunan country sütunundaki ülke isimlerinden 'A' karakteri ile başlayıp 'a' karakteri ile sonlananları sıralayınız.
select country from country where country like 'A_%a'
--country tablosunda bulunan country sütunundaki ülke isimlerinden en az 6 karakterden oluşan ve sonu 'n' karakteri ile sonlananları sıralayınız.
SELECT country FROM country WHERE LENGTH(country) >= 6 AND country LIKE '%n';
--film tablosunda bulunan title sütunundaki film isimlerinden en az 4 adet büyük ya da küçük harf farketmesizin 'T' karakteri içeren film isimlerini sıralayınız.
SELECT title FROM film WHERE title ILIKE '%T%T%T%T%';
--film tablosunda bulunan tüm sütunlardaki verilerden title 'C' karakteri ile başlayan ve uzunluğu (length) 90 dan büyük olan ve rental_rate 2.99 olan verileri sıralayınız.
SELECT * FROM film WHERE title LIKE 'C%' AND length > 90 AND rental_rate = 2.99;
--film tablosunda bulunan replacement_cost sütununda bulunan birbirinden farklı değerleri sıralayınız.
SELECT DISTINCT replacement_cost FROM film
--film tablosunda bulunan replacement_cost sütununda birbirinden farklı kaç tane veri vardır?
SELECT DISTINCT COUNT(replacement_cost) FROM film
--film tablosunda bulunan film isimlerinde (title) kaç tanesini T karakteri ile başlar ve aynı zamanda rating 'G' ye eşittir?
SELECT COUNT(*) FROM film WHERE title LIKE 'T%' AND rating= 'G';
--country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluşmaktadır?
SELECT country from country WHERE length(country) = 5
--city tablosundaki şehir isimlerinin kaç tanesi 'R' veya r karakteri ile biter?
SELECT COUNT(*) FROM city WHERE city ILIKE '%R';
--film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi sıralayınız.
select * from film where title ilike '%n' order by length desc limit 5;
--film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en kısa (length) ikinci(6,7,8,9,10) 5 filmi(6,7,8,9,10) sıralayınız.
SELECT title length FROM film WHERE title LIKE '%n' ORDER BY length LIMIT 6;
--customer tablosunda bulunan last_name sütununa göre azalan yapılan sıralamada store_id 1 olmak koşuluyla ilk 4 veriyi sıralayınız.
select * from customer where store_id = 1  order by last_name limit 4
--film tablosunda bulunan rental_rate sütunundaki değerlerin ortalaması nedir?
select avg(rental_rate) from film
--film tablosunda bulunan filmlerden kaç tanesi 'C' karakteri ile başlar?
select count(*) from film where title like 'C%'
--film tablosunda bulunan filmlerden rental_rate değeri 0.99 a eşit olan en uzun (length) film kaç dakikadır?
select   max(length) from film  where  rental_rate = 0.99
--film tablosunda bulunan filmlerin uzunluğu 150 dakikadan büyük olanlarına ait kaç farklı replacement_cost değeri vardır?
select count(distinct(replacement_cost)) from film where length > 150
--film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.
select rating from film group by rating
--film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda film sayısı 50 den fazla olan replacement_cost değerini ve karşılık gelen film sayısını sıralayınız.
select replacement_cost, count(*) from  film group by replacement_cost having count(*) > 50 
--customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir? 
select count(*),store_id from customer group by store_id
--city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra en fazla şehir sayısı barındıran country_id bilgisini ve şehir sayısını paylaşınız.
SELECT country_id, COUNT(city) FROM city GROUP BY country_id ORDER BY COUNT(city) DESC LIMIT 1;
--test veritabanınızda employee isimli sütun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE, email VARCHAR(100) olan bir tablo oluşturalım.
CREATE TABLE employee (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50),
  birthday DATE,
  email VARCHAR(100)
);

--Oluşturduğumuz employee tablosuna 'Mockaroo' servisini kullanarak 5 adet veri ekleyelim.
INSERT INTO employee (name, birthday, email)
VALUES
  ('John Doe', '1990-05-15', 'john.doe@example.com'),
  ('Jane Smith', '1988-09-22', 'jane.smith@example.com'),
  ('Michael Johnson', '1985-11-03', 'michael.johnson@example.com'),
  ('Emily Brown', '1992-03-07', 'emily.brown@example.com'),
  ('David Lee', '1987-12-18', 'david.lee@example.com');

--Sütunların her birine göre diğer sütunları güncelleyecek 5 adet UPDATE işlemi yapalım.
UPDATE employee
SET name = 'John Smith'
WHERE id = 1;
UPDATE employee
SET birthday = '1991-08-25'
WHERE id = 2;
UPDATE employee
SET email = 'jane.smith@example.org'
WHERE id = 3;
UPDATE employee
SET name = 'Michael Brown', birthday = '1986-05-20'
WHERE id = 4;
UPDATE employee
SET email = 'emily.brown@example.org', birthday = '1993-02-14'
WHERE id = 5;
--Sütunların her birine göre ilgili satırı silecek 5 adet DELETE işlemi yapalım.
DELETE FROM employee
WHERE name = 'John Smith';
DELETE FROM employee
WHERE birthday = '1991-08-25';
DELETE FROM employee
WHERE email = 'jane.smith@example.org';
DELETE FROM employee
WHERE name = 'Michael Brown' AND birthday = '1986-05-20';
DELETE FROM employee
WHERE email = 'emily.brown@example.org' AND birthday = '1993-02-14';