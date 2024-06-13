USE airplane;



CREATE TABLE customers(
	customer_id INT auto_increment,
    email VARCHAR(60) NOT NULL,
    phone_no VARCHAR(30) NOT NULL,
    
    PRIMARY KEY(customer_id)
);

 

CREATE TABLE travel_documents_details(
	passport_no VARCHAR(30),
    nationality VARCHAR(30) NOT NULL,
	issuing_cntry VARCHAR(30) NOT NULL,
    expiry_date DATETIME,
    
    FOREIGN KEY(passport_no) REFERENCES travel_documents_person(passport_no)
);




CREATE TABLE travel_documents_person(
	passport_no VARCHAR(30) NOT NULL,
    customer_id INT,
    
    PRIMARY KEY(passport_no),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE Basic_info (
    customer_id INT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
	age INT NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
    
    
);

CREATE TABLE seats (
    aircraft_id VARCHAR(30),
	seat_no VARCHAR(30) NOT NULL,
    class VARCHAR(30) NOT NULL,
	dept_time DATETIME  NOT NULL,
    departure VARCHAR(30) NOT NULL,
    arrival VARCHAR(30) NOT NULL,
    seat_occu BOOLEAN NOT NULL,
    
    PRIMARY KEY(aircraft_id,seat_no,dept_time,class),
    FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id)
);






CREATE TABLE administrator (
    admin_id INT NOT NULL,
    user_name VARCHAR(30) NOT NULL,
    admin_pass VARCHAR(30) NOT NULL,
    phone_no VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    admin_role VARCHAR(30) NOT NULL,
    PRIMARY KEY (admin_id)
);

DROP TABLE payments;
CREATE TABLE payments (
    transaction_id VARCHAR(30) NOT NULL,
    
    total_cost DOUBLE NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    PRIMARY KEY (transaction_id)
   
);

CREATE TABLE forum(
	message_id INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(message_id)
);

CREATE TABLE Admin_feedback (   
    admin_id INT,
    message_id INT,
    FOREIGN KEY (admin_id)
        REFERENCES administrator (admin_id),
    FOREIGN KEY (message_id)
        REFERENCES forum (message_id)
);


CREATE TABLE customer_review(
	customer_id INT,
	message_id INT,

FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (message_id) REFERENCES forum(message_id) 

);



CREATE TABLE ticket_verification(
	 transaction_id VARCHAR(30),
     ticket_id VARCHAR(30),
     FOREIGN KEY (transaction_id)  REFERENCES payments(transaction_id),
      FOREIGN KEY (ticket_id)  REFERENCES tickets(ticket_id)
     

);


CREATE TABLE tickets(
	ticket_id VARCHAR(30),
	customer_id INT,
    flight_id VARCHAR(30) ,
    aircraft_id VARCHAR(30),
    dept_time DATETIME NOT NULL,
	arr_time DATETIME NOT NULL,
    departure VARCHAR(30) NOT NULL,
	destination VARCHAR(30) NOT NULL,
	phone_no VARCHAR(30) NOT NULL,
	class VARCHAR(30) NOT NULL,
    seat_no VARCHAR(30),
	fare INT NOT NULL,
	extra_charges INT NOT NULL,
	discount INT NOT NULL,
	
	
    PRIMARY KEY(ticket_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (aircraft_id,seat_no,dept_time,class) REFERENCES seats(aircraft_id,seat_no,dept_time,class),
    FOREIGN KEY (flight_id) REFERENCES flight_details(flight_id)
);


CREATE TABLE aircrafts(
	aircraft_id VARCHAR(30) NOT NULL,
    eco_cap INT,
    first_cap INT,
    buss_cap INT,
    
	
    PRIMARY KEY(aircraft_id)
);

CREATE TABLE flight_status(
	flight_id VARCHAR(30) NOT NULL,
    departure VARCHAR(30) NOT NULL,
    destination VARCHAR(30) NOT NULL,
    dep_time DATETIME NOT NULL,
    ariv_time DATETIME NOT NULL,
    delay_dep_time DATETIME NOT NULL,
    delay_arr_time DATETIME NOT NULL,
    
    PRIMARY KEY(flight_id,dep_time)
);

CREATE TABLE flight_vacceny_cost(
	aircraft_id VARCHAR(30),
     class VARCHAR(10),
    dept_time DATETIME NOT NULL,
   
    departure VARCHAR(30) NOT NULL,
    arrival VARCHAR(30) NOT NULL,
    fare DOUBLE NOT NULL,
    discount DOUBLE NOT NULL,
	vacency INT NOT NULL,
    
    PRIMARY KEY(aircraft_id,dept_time,class),
    FOREIGN KEY(aircraft_id) REFERENCES aircrafts(aircraft_id)
);

CREATE TABLE flight_details (
    flight_id VARCHAR(30) NOT NULL,
    aircraft_id VARCHAR(30),
    dep_time DATETIME NOT NULL,
    arr_time DATETIME NOT NULL,
    departure VARCHAR(30) NOT NULL,
    destination VARCHAR(30) NOT NULL,
    PRIMARY KEY (flight_id , dep_time),
    FOREIGN KEY (aircraft_id)
        REFERENCES aircrafts (aircraft_id)
);


