USE Letswhoosh;

CREATE TABLE Customers (
    customer_id VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    phone_no VARCHAR(30) NOT NULL
    
    
);
CREATE TABLE Flight (
    aircraft_id INT NOT NULL,
    dept_time DATETIME  NOT NULL,
    class VARCHAR(30) NOT NULL,
    fair INT NOT NULL,
	discounts INT NOT NULL
);








CREATE TABLE Seats (
    aircraft_id INT NOT NULL,
    seat_no INT NOT NULL,
    dept_time DATETIME  NOT NULL,
    class VARCHAR(30) NOT NULL,
    departure VARCHAR(30) NOT NULL,
    arrival VARCHAR(30) NOT NULL,
    seat_occu INT NOT NULL
);

CREATE TABLE Basic_info (
    customer_id VARCHAR(30) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    birth_date VARCHAR(30) NOT NULL,
	age INT NOT NULL
    
);

CREATE TABLE Administrator(
admin_id INT NOT NULL,
user_name VARCHAR(30)  NOT NULL,
phone_no VARCHAR(30) NOT NULL,
email VARCHAR(30) NOT NULL,
role VARCHAR(30) NOT NULL,
PRIMARY KEY(admin_id)


);

CREATE TABLE Payments(
transaction_id VARCHAR(30) NOT NULL,
ticket_id VARCHAR(30)  NOT NULL,
total_cost INT NOT NULL,
payment_method VARCHAR(30) NOT NULL,

PRIMARY KEY(transaction_id)


);

CREATE TABLE Forum(
message_id INT NOT NULL
);

CREATE TABLE Admin_feedback(
admin_id INT NOT NULL,
message_id INT NOT NULL

#FOREIGN KEY (admin_id) REFERENCES Administrator(admin_id) 
#FOREIGN KEY (message_id) REFERENCES Forum(message_id) 



);


CREATE TABLE Customer_review(
customer_id INT NOT NULL,
message_id INT NOT NULL

#FOREIGN KEY (customer_id) REFERENCES Customers(admin_id) 
#FOREIGN KEY (message_id) REFERENCES Forum(message_id) 

);

CREATE TABLE Travel_documents(
passport_no VARCHAR(30) NOT NULL,
customer_id VARCHAR(30)  NOT NULL,
p_issuing_cntry VARCHAR(30) NOT NULL,
expiry_date DATETIME NOT NULL,
nationality VARCHAR(30) NOT NULL


);

CREATE TABLE Ticket_time_place(
flight_id VARCHAR(30) NOT NULL,
departure VARCHAR(30)  NOT NULL,
destination VARCHAR(30) NOT NULL,
dep_time DATETIME NOT NULL,
arriv_time DATETIME NOT NULL


);

CREATE TABLE Ticket_time(
flight_id VARCHAR(30) NOT NULL,
dep_time DATETIME NOT NULL,
arriv_time DATETIME NOT NULL


);


CREATE TABLE Ticket_fare_discount (
    flight_id VARCHAR(30) NOT NULL,
    class VARCHAR(30) NOT NULL,
    departure VARCHAR(30) NOT NULL,
    fare INT NOT NULL,
    extra_charges INT NOT NULL,
    discount INT NOT NULL
);

CREATE TABLE Ticket_time1(
flight_id VARCHAR(30) NOT NULL,
departure VARCHAR(30)  NOT NULL,
destination VARCHAR(30) NOT NULL,
dep_time DATETIME NOT NULL

);
CREATE TABLE Ticket_time2(
flight_id VARCHAR(30) NOT NULL,
departure VARCHAR(30)  NOT NULL,
destination VARCHAR(30) NOT NULL,
arriv_time DATETIME NOT NULL

);





























