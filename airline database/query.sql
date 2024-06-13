-- checking if seats are available or not

SELECT COUNT(seat_occu) FROM seats WHERE  dept_time='2021-12-06 00:00:00'AND departure='China'AND arrival='Indonesia' AND class='eco' AND seat_occu=0;

-- if yes then we will get the flight details from below queries

SELECT flight_id,arr_time FROM flight_details WHERE dep_time='2021-12-06 00:00:00'AND departure='China'AND destination='Indonesia';
SELECT aircraft_id,fare FROM flight_vacceny_cost WHERE dept_time='2021-12-06 00:00:00'AND departure='China'AND arrival='Indonesia' AND class='eco';


-- creating customer_id  

INSERT INTO customers (email,phone_no) values ('aaa@gmail.com','0001');
SET  @current_customer_id := (SELECT MAX(customer_id)  FROM customers WHERE email='aaa@gmail.com' AND phone_no='0001');
-- inserting basic info

insert into basic_info (customer_id, first_name, last_name, gender, birth_date, age) values ((SELECT customer_id FROM customers WHERE email='eve@gmail.com' AND phone_no='2676152'), 'Antonie', 'MacInherney', 'Female', '1981-10-11', 36);
insert into basic_info (customer_id, first_name, last_name, gender, birth_date, age) values ( @current_customer_id, 'Antonie', 'MacInherney', 'Female', '1981-10-11', 36);
-- if it is international flight we insert travel documents info
insert into travel_documents_person (customer_id, passport_no) values ((SELECT customer_id FROM customers WHERE email='eve@gmail.com' AND phone_no='2676152'), '111111');
insert into travel_documents_details ( passport_no,nationality,issuing_cntry,expiry_date) values ('111111','bang','bang','2021-12-06 00:00:00');

-- here we show seat distribution
SELECT seat_no,seat_occu FROM seats WHERE dept_time='2021-12-06 00:00:00'AND departure='China'AND arrival='Indonesia' AND class='eco' AND aircraft_id='35-543-6507';


--  confirming payments and keeping information about payment & ticket
SET  @transaction_id :='1223';
INSERT INTO payments (transaction_id,total_cost,payment_method) values (@transaction_id,1232333.0,'paytm');

insert into tickets (ticket_id,customer_id,flight_id, aircraft_id, dept_time, arr_time, departure, destination,phone_no,class,seat_no,fare,extra_charges,discount) values ('000-111',1,'47-237-0075', '30-124-9225', '2022-02-27', '2022-04-20', 'China', 'Greece','305-750-1907','eco','2A',12000,300,150); 
SET  @ticket_id :=(SELECT ticket_id FROM tickets WHERE customer_id=1 );


INSERT INTO ticket_verification (ticket_id,transaction_id) VALUES (@ticket_id,@transaction_id);



-- getting ticket id using customer id and customer can get ticket info using it
SELECT ticket_id FROM tickets WHERE customer_id=1 ;
SELECT * FROM tickets WHERE ticket_id='11-1';


-- checking flight status
SELECT *FROM flight_status WHERE flight_id='47-237-0075' AND dep_time='2022-02-27 00:00:00';


-- Admin 

-- inserting aircraft
insert into aircrafts (aircarft_id,eco_cap, first_cap,buss_cap) values ('30-124-9225',30,50,60);
insert into aircrafts (aircarft_id,eco_cap, first_cap,buss_cap) values ('96-828-4203', 20,50,40);
insert into aircrafts (aircarft_id,eco_cap, first_cap,buss_cap) values ('79-179-8303', 60,90,90);
insert into aircrafts (aircarft_id,eco_cap, first_cap,buss_cap) values ('67-217-6592', 50,90,50);
insert into aircrafts (aircarft_id,eco_cap, first_cap,buss_cap) values ('47-787-4778', 70,70,70);


-- inserting flights
insert into flight_details (flight_id, aircraft_id, dep_time, arr_time, departure, destination) values ('47-237-0075', '30-124-9225', '2022-02-27', '2022-04-20', 'China', 'Greece');
insert into  flight_details (flight_id, aircraft_id, dep_time, arr_time, departure, destination) values ('47-784-3919', '96-828-4203', '2021-10-30', '2022-01-04', 'Ukraine', 'Chile');
insert into  flight_details (flight_id, aircraft_id, dep_time, arr_time, departure, destination) values ('17-558-6395', '79-179-8303', '2021-11-29', '2022-05-13', 'United States', 'Finland');
insert into  flight_details (flight_id, aircraft_id, dep_time, arr_time, departure, destination) values ('62-148-9266', '67-217-6592', '2022-02-15', '2022-04-21', 'China', 'england');
insert into  flight_details (flight_id, aircraft_id, dep_time, arr_time, departure, destination) values ('86-769-2913', '47-787-4778', '2021-07-20', '2021-08-14', 'Zimbabwe', 'Russia');
insert into  flight_details (flight_id, aircraft_id, dep_time, arr_time, departure, destination) values ('68-230-4775', '55-230-6851', '2022-01-02', '2022-03-31', 'Philippines', 'Guatemala');

-- inserting seat info
insert into  seats (aircraft_id,seat_no,class,dept_time,departure, arrival,seat_occu) values ('30-124-9225', 'eco_2A', 'eco','2022-02-14', 'China', 'Greece',0);
insert into  seats (aircraft_id,seat_no,class,dept_time,departure, arrival,seat_occu) values ('96-828-4203', 'bus_22A',  'bus','2021-10-30', 'Ukraine', 'Chile',0);
insert into  seats (aircraft_id,seat_no,class,dept_time,departure, arrival,seat_occu) values ('79-179-8303', 'eco_11H',  'eco' ,'2021-11-29', 'United States', 'Finland',0);
insert into  seats (aircraft_id,seat_no,class,dept_time,departure, arrival,seat_occu) values ('67-217-6592', 'first_33O',  'first','2022-02-15',  'China', 'england',1);
insert into  seats (aircraft_id,seat_no,class,dept_time,departure, arrival,seat_occu) values ('47-787-4778', 'bus_5D',  'bus','2021-07-20', 'Zimbabwe', 'Russia',1);

-- inserting fare

insert into  flight_vacceny_cost (aircraft_id,class,dept_time,departure, arrival,fare,discount,vacency) values ('30-124-9225',  'eco','2022-02-14', 'China', 'Greece',120023,200,1);
insert into  flight_vacceny_cost (aircraft_id,class,dept_time,departure, arrival,fare,discount,vacency) values ('96-828-4203',  'bus','2021-10-30', 'Ukraine', 'Chile',6154,672,0);
insert into  flight_vacceny_cost (aircraft_id,class,dept_time,departure, arrival,fare,discount,vacency) values ('79-179-8303',  'eco' ,'2021-11-29', 'United States', 'Finland',45000,900,0);
insert into  flight_vacceny_cost (aircraft_id,class,dept_time,departure, arrival,fare,discount,vacency) values ('67-217-6592',   'eco','2022-02-15',  'China', 'england',1,8900,1900,1);
insert into  flight_vacceny_cost (aircraft_id,class,dept_time,departure, arrival,fare,discount,vacency) values ('47-787-4778',  'bus','2021-07-20', 'Zimbabwe', 'Russia',1,34000,890,0);
 


