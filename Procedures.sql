USE theater_information_system;

/*--------------------------------------------------------*/

# P1
# Procedure that not allow adding more than one row to the theater table:

DELIMITER //
CREATE PROCEDURE insert_theater_row(
    IN p_theater_ID INT,
    IN p_theater_name VARCHAR(50),
    IN p_theater_address VARCHAR(100),
    IN p_theater_phone_number VARCHAR(20)
)
BEGIN
    DECLARE theater_count INT;
    SELECT COUNT(*) INTO theater_count
    FROM theater;
    
    IF theater_count = 1 THEN
        SELECT 'Insert operation not allowed. Theater table already contains a row.' AS message;
    END IF;
END //
DELIMITER ;

CALL insert_theater_row (2,'Afeka Theater 2','Benei Ephraim St. 218 , Tel Aviv','03-7688600');

/*--------------------------------------------------------*/

# P2
# Procedure that allows to add a new perfornamce entry to the schedule table:

DELIMITER //
CREATE PROCEDURE add_to_schedule(
    IN performance_ID INT,
    IN theater_ID INT,
    IN show_ID INT,
    IN date_and_time DATETIME,
    IN hall_ID INT,
    IN num_of_tickets_sold INT
)
BEGIN
    INSERT INTO schedule (performance_ID, theater_ID, show_ID, date_and_time, hall_ID, num_of_tickets_sold)
    VALUES (performance_ID, theater_ID, show_ID, date_and_time, hall_ID, num_of_tickets_sold);
END //
DELIMITER ;

CALL add_to_schedule(4,1,309,'2023-06-17 21:30',102,0); #added

/*--------------------------------------------------------*/

# P3
# Procedure that allows to add a new reservation to the reservation table:

DELIMITER //
CREATE PROCEDURE add_new_reservation(
    IN reservation_ID INT,
    IN phone_number INT,
    IN performance_ID INT,
    IN num_of_tickets INT
)
BEGIN
    INSERT INTO reservation (reservation_ID, phone_number, performance_ID, num_of_tickets)
    VALUES (reservation_ID, phone_number, performance_ID, num_of_tickets);
END //
DELIMITER ;

CALL add_new_reservation(515,0507521016,419,5); #added

/*--------------------------------------------------------*/

# P4
# Procedure that retrieves all the reservations made by a specific customer:

DELIMITER //
CREATE PROCEDURE get_customer_reservations(IN customer_phone_number INT)
BEGIN
    SELECT reservation.reservation_ID, shows.show_name, schedule.date_and_time, theater.theater_name, hall.hall_name
    FROM reservation
    INNER JOIN schedule ON reservation.performance_ID = schedule.performance_ID
    INNER JOIN shows ON schedule.show_ID = shows.show_ID
    INNER JOIN hall ON schedule.hall_ID = hall.hall_ID
    INNER JOIN theater ON schedule.theater_ID = theater.theater_ID
    WHERE reservation.phone_number = customer_phone_number;
END //
DELIMITER ;

CALL get_customer_reservations(0547889632);

/*--------------------------------------------------------*/

# P5
# Procedure that retrieves the available seats for a specific performance in a particular hall:

DELIMITER //
CREATE PROCEDURE get_available_seats(
    IN performance_ID INT,
    IN hall_ID INT
)
BEGIN
    SELECT seat.seat_ID, seat.seat_number, seat.row_num, seat.section
    FROM seat
    LEFT JOIN tickets_in_reservation ON seat.seat_ID = tickets_in_reservation.seat_ID
    WHERE seat.hall_ID = hall_ID
    AND (tickets_in_reservation.ticket_ID IS NULL OR tickets_in_reservation.reservation_ID NOT IN (
        SELECT reservation_ID
        FROM reservation
        WHERE performance_ID = performance_ID
    ));
END //
DELIMITER ;

CALL get_available_seats(414, 102);

/*--------------------------------------------------------*/

# P6
# Procedure that retrieves reservations for a specific performance:

DELIMITER //
CREATE PROCEDURE get_reservations_by_performance (IN performanceID INT)
BEGIN
    SELECT *
    FROM reservation
    WHERE performance_ID = performanceID;
END //
DELIMITER ;

CALL get_reservations_by_performance(401);

/*--------------------------------------------------------*/

# P7
# Procedure that inserts a seat_ID into an existing record from the tickets_in_reservation table:
# (there is a trigger to insert automatically tickets without seats numbers)

DELIMITER //
CREATE PROCEDURE insert_seat_ID(
	IN p_ticket_ID INT,
    IN p_seat_ID INT
)
BEGIN
    UPDATE tickets_in_reservation
    SET seat_ID = p_seat_ID
    WHERE ticket_ID = p_ticket_ID;
END //
DELIMITER ;

CALL insert_seat_ID(610, 235);
CALL insert_seat_ID(611, 236);

