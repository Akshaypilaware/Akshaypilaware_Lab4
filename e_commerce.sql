drop table supplier;
drop table customer;
use e_commerce;

CREATE TABLE supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer(
CUS_ID INT NOT NULL,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER CHAR,
PRIMARY KEY (CUS_ID));

CREATE TABLE IF NOT EXISTS category (
CAT_ID INT NOT NULL,
CAT_NAME VARCHAR(20) NOT NULL,
PRIMARY KEY (CAT_ID)
);


CREATE TABLE IF NOT EXISTS product (
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT NOT NULL,
PRIMARY KEY (PRO_ID),
FOREIGN KEY (CAT_ID) REFERENCES CATEGORY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS supplier_pricing (
PRICING_ID INT NOT NULL,
PRO_ID INT NOT NULL,
SUPP_ID INT NOT NULL,
SUPP_PRICE INT DEFAULT 0,
PRIMARY KEY (PRICING_ID),
FOREIGN KEY (PRO_ID) REFERENCES PRODUCT (PRO_ID),
FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID)
);

CREATE TABLE IF NOT EXISTS _order(
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE,
CUS_ID INT NOT NULL,
PRICING_ID INT NOT NULL,
PRIMARY KEY (ORD_ID),
FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID)
);

CREATE TABLE IF NOT EXISTS rating (
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY (ORD_ID) REFERENCES _order(ORD_ID)
);

INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

select * from Supplier;

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

select * from Customer;

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

select * from Category;

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

select * from Product;

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

select * from SUPPLIER_PRICING;

INSERT INTO _order VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO _order VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO _order VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO _order VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO _order VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO _order VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO _order VALUES(107,789,"2021-09-01",3,7);
INSERT INTO _order VALUES(108,780,"2021-09-07",5,6);
INSERT INTO _order VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO _order VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO _order VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO _order VALUES(112,789,"2021-09-16",4,7);
INSERT INTO _order VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO _order VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO _order VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO _order VALUES(116,99,"2021-09-17",2,14);

select * from _order;

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

select * from Rating;

SELECT CUS_GENDER, COUNT(CUS_ID) AS total_customers
FROM customer
JOIN _order ON customer.CUS_ID = _order.CUS_ID
WHERE ORD_AMOUNT >= 3000
GROUP BY CUS_GENDER;
/*
3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
*/

(select _order.ord_amount, _order.cus_id,customer.cus_gender, customer.cus_name
from _order
inner join
customer
on _order.cus_id=customer.cus_id
having _order.ord_amount>=3000);


/*
4)	Display all the orders along with product name ordered by a customer having Customer_Id=2
*/
(select o.*,p.PRO_NAME from e_commerce._order as o, e_commerce.product as p where o.cus_id=2);

/*
5)	Display the Supplier details who can supply more than one product
*/
select supplier.* from supplier where supplier.supp_id in
 (select SUPP_ID from supplier_pricing 
 group by SUPP_ID having count(supp_id)>1)
group by supplier.supp_id;

/*
6)	Find the least expensive product from each category and print the table with category id, name, product name and price of the product
*/
select category.cat_id,category.cat_name, min(t3.min_price)
as Min_Price, t3.pro_name from
category
inner join
(select product.cat_id, product.pro_name, t2.*from product inner join
(select pro_id, min(supp_price) as Min_price from supplier_pricing group by pro_id)
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;

/*
7)	Display the Id and Name of the Product ordered after “2021-10-05”.
*/
select product.pro_id, product.pro_name from _order inner join
supplier_pricing on supplier_pricing.pricing_id=_order.pricing_id
inner join product on product.pro_id = supplier_pricing.pro_id
 where _order.ord_date>"2021-10-05";

/*
8)	Display customer name and gender whose names start or end with character 'A'.
*/
select cus_name, cus_gender from customer
where cus_name like 'A%' or cus_name like '%A';

/*
9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
 */

 select S.supp_id, supp_name, avg(Q.rat_ratstars) as rating,
 case
  when avg(Q.RAT_RATSTARS)=5 then 'Excellent'
  when avg(Q.RAT_RATSTARS)>4 then 'Good'
  when avg(Q.RAT_RATSTARS)>2 then 'Average'
  else 'poor'
end as Type_of_Services from supplier s inner join
(select supp_id,P.RAT_RATSTARS from supplier_pricing SP inner join
(select pricing_id, RAT_RATSTARS from e_commerce._order inner join rating
on e_commerce._order.ord_id = rating.ord_id) as P on SP.pricing_id=P.pricing_id) as Q on s.supp_id=Q.supp_id group by S.supp_id;
