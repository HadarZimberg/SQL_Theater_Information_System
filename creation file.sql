USE theater_information_system;

CREATE TABLE theater
(
    theater_ID INT PRIMARY KEY,
    theater_name VARCHAR(50) NOT NULL,
    theater_address VARCHAR(100) NOT NULL,
    theater_phone_number VARCHAR(20) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE customer (
    customer_ID INT PRIMARY KEY,
    customer_first_name VARCHAR(50) NOT NULL,
    customer_last_name VARCHAR(50) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE customer_phone (
    phone_number INT PRIMARY KEY,
    customer_ID INT NOT NULL,
    FOREIGN KEY (customer_ID) REFERENCES customer(customer_ID)
)ENGINE = InnoDB;

CREATE TABLE subscription_package (
    package_ID INT PRIMARY KEY,
    cost DECIMAL(6,2) NOT NULL,
    period_in_months INT NOT NULL,
    num_of_shows INT NOT NULL
)ENGINE = InnoDB;

CREATE TABLE subscriptions (
    customer_ID INT NOT NULL,
    package_ID INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    num_of_shows_purchased INT NOT NULL,
    num_of_shows_left INT NOT NULL,
    PRIMARY KEY (customer_ID, package_ID),
    FOREIGN KEY (customer_ID) REFERENCES customer(customer_ID),
    FOREIGN KEY (package_ID) REFERENCES subscription_package(package_ID)
)ENGINE = InnoDB;

CREATE TABLE shows (
	show_ID INT PRIMARY KEY,
    show_name VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    duration TIME NOT NULL,
    ticket_price DECIMAL(5,2) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE hall (
	hall_ID INT PRIMARY KEY,
    hall_name VARCHAR(50) NOT NULL,
    theater_ID INT NOT NULL,
	seating_capacity INT NOT NULL,
    FOREIGN KEY (theater_ID) REFERENCES theater(theater_ID)
)ENGINE = InnoDB;

CREATE TABLE schedule (
	performance_ID INT PRIMARY KEY,
	theater_ID INT NOT NULL,
	show_ID INT NOT NULL,
	date_and_time DATETIME NOT NULL,
	hall_ID INT NOT NULL,
	num_of_tickets_sold INT NOT NULL,
	FOREIGN KEY (theater_ID) REFERENCES theater(theater_ID),
	FOREIGN KEY (show_ID) REFERENCES shows(show_ID),
    FOREIGN KEY (hall_ID) REFERENCES hall(hall_ID)
);

CREATE TABLE seat (
	seat_ID INT PRIMARY KEY,
	seat_number INT NOT NULL,
    row_num INT NOT NULL,
    section VARCHAR(20) NOT NULL,
    hall_ID INT NOT NULL,
    FOREIGN KEY (hall_ID) REFERENCES hall(hall_ID)
)ENGINE = InnoDB;

CREATE TABLE reservation (
    reservation_ID INT PRIMARY KEY,
    phone_number INT NOT NULL,
    performance_ID INT NOT NULL,
    num_of_tickets INT NOT NULL,
    FOREIGN KEY (phone_number) REFERENCES customer_phone(phone_number),
    FOREIGN KEY (performance_ID) REFERENCES schedule(performance_ID)
)ENGINE = InnoDB;

CREATE TABLE tickets_in_reservation (
	ticket_ID INT NOT NULL,
	reservation_ID INT NOT NULL,
	seat_ID INT,
	PRIMARY KEY (ticket_ID, reservation_ID),
	FOREIGN KEY (reservation_ID) REFERENCES reservation(reservation_ID),
	FOREIGN KEY (seat_ID) REFERENCES seat(seat_ID)
);
