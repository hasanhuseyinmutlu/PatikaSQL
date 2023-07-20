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