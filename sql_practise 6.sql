CREATE TABLE sirketler 
(
    sirket_id int, --ortak degerler
    sirket_isim VARCHAR(20)                         -- sirket id ler ortak odugu icin bu field lardan baglanti kutruldu
);                                                  --sirketler             siparisler      
                                                    --100 null                  101++
INSERT INTO sirketler VALUES(100, 'Toyota');        --101++                 102++
INSERT INTO sirketler VALUES(101, 'Honda');         --102++                 103++   
INSERT INTO sirketler VALUES(102, 'Ford');          --103++                 104 null
INSERT INTO sirketler VALUES(103, 'Hyundai');                               --105 null
                                                    
CREATE TABLE siparisler                         --  100    101        104
(                                           --              102       105
    siparis_id int,                      --                 103
    sirket_id int, --ortqak degerler
    siparis_tarihi DATE
);
    
INSERT INTO siparisler VALUES(11, 101, '2022-04-17');
INSERT INTO siparisler VALUES(22, 102, '2022-04-18');
INSERT INTO siparisler VALUES(33, 103, '2022-04-19');
INSERT INTO siparisler VALUES(44, 104, '2022-04-20');
INSERT INTO siparisler VALUES(55, 105, '2022-04-21');
select * from sirketler;
select * from siparisler;

--SORU1: Iki Tabloda sirket_id’si ayni olanlarin; sirket_ismi, siparis_id sirket id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
select A.sirket_id , A.sirket_isim, B.siparis_id, B.siparis_tarihi from siparisler  as B
inner join sirketler as A
on A.sirket_id=B.sirket_id;

--SORU2: sirketler tablosundaki tum sirketleri(yani isimler) ve bu sirketlere ait olan 
--siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
select A.sirket_id , A.sirket_isim, B.siparis_id, B.siparis_tarihi from siparisler as B
right join sirketler as A
on A.sirket_id= B.sirket_id;

select A.sirket_id , A.sirket_isim, B.siparis_id, B.siparis_tarihi from sirketler as A
left join siparisler as B
on A.sirket_id= B.sirket_id;

--full join ile cozum
select A.sirket_isim, B.siparis_id, B.siparis_tarihi
from siparisler as B
right join sirketler as A
on A.sirket_id=B.sirket_id;

union

select A.sirket_id, A.sirket_isim, B.siparis_tarihi
from sirketler as A
left join siparisler as B
on A.sirket_id =B.sirket_id;

--SORU3: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile
--bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
select A.sirket_id, A.sirket_isim, B.siparis_id, B.siparis_tarihi
from sirketler as A
full join siparisler as B
on A.sirket_id=B.sirket_id;

