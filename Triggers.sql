USE theater_information_system;

/*--------------------------------------------------------*/

# T1
# Trigger to update the number of shows left in the subscriptions table when a reservation is made:

DELIMITER $$
CREATE TRIGGER update_shows_left
AFTER INSERT
ON reservation
FOR EACH ROW
BEGIN
    UPDATE subscriptions
    SET num_of_shows_left = num_of_shows_left - NEW.num_of_tickets
    WHERE customer_ID = (SELECT customer_ID FROM customer_phone WHERE phone_number = NEW.phone_number);
END $$
DELIMITER ;

/*--------------------------------------------------------*/

# T2
# Trigger to update the number of shows purchased in the subscriptions table when a reservation is made:

DELIMITER $$
CREATE TRIGGER update_shows_purchased
AFTER INSERT
ON reservation
FOR EACH ROW
BEGIN
    UPDATE subscriptions
    SET num_of_shows_purchased = num_of_shows_purchased + NEW.num_of_tickets
    WHERE customer_ID = (SELECT customer_ID FROM customer_phone WHERE phone_number = NEW.phone_number);
END $$
DELIMITER ;

/*--------------------------------------------------------*/

# T3
# Trigger that updates the number of tickets sold in the schedule table when a reservation is made:

DELIMITER $$
CREATE TRIGGER update_num_of_tickets_sold
AFTER INSERT
ON reservation
FOR EACH ROW
BEGIN
    UPDATE schedule
    SET num_of_tickets_sold = num_of_tickets_sold + NEW.num_of_tickets
    WHERE performance_ID = NEW.performance_ID;
END $$
DELIMITER ;

/*--------------------------------------------------------*/

# T4
# Trigger to automatically create new rows in the tickets_in_reservation table when a reservation is made:
# (there is a procedure to update the specific seats in tickets)

DELIMITER $$
CREATE TRIGGER create_tickets_in_reservation
AFTER INSERT
ON reservation
FOR EACH ROW
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE next_ticket_ID INT;

    SET next_ticket_ID = (SELECT COALESCE(MAX(ticket_ID), 0) + 1 FROM tickets_in_reservation);
    
    WHILE i <= NEW.num_of_tickets DO
        INSERT INTO tickets_in_reservation (ticket_ID, reservation_ID, seat_ID)
        VALUES (next_ticket_ID, NEW.reservation_ID, NULL);
        SET i = i + 1;
        SET next_ticket_ID = next_ticket_ID + 1;
    END WHILE;
END $$
DELIMITER ;

