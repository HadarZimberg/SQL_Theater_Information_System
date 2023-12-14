USE theater_information_system;

/*--------------------------------------------------------*/

# S1
# Select the show names and genres from the shows table sorted by genre in ascending order:

SELECT show_name AS 'Show Name', genre AS 'Genre'
FROM shows
ORDER BY genre ASC;

/*--------------------------------------------------------*/

# S2
# Select the shows where the number of tickets sold is greater than 1:

SELECT performance_ID AS 'Performance ID',  show_name AS 'Show Name', num_of_tickets_sold AS 'Number of Tickets Sold'
FROM shows
JOIN schedule ON shows.show_ID = schedule.show_ID
WHERE schedule.num_of_tickets_sold > 1;

/*--------------------------------------------------------*/

# S3
# Select the top subscription packages with the highest number of subscriptions:

SELECT subscription_package.package_ID AS 'Package ID', COUNT(*) AS 'Number of Subscriptions'
FROM subscription_package 
JOIN subscriptions ON subscription_package.package_ID = subscriptions.package_ID
GROUP BY subscription_package.package_ID
ORDER BY COUNT(*) DESC
LIMIT 1;

/*--------------------------------------------------------*/

# S4
# Select the subscriptions names and the total number of tickets they have purchased:

SELECT CONCAT(customer.customer_first_name, ' ', customer.customer_last_name) AS 'Customer Name', COALESCE(SUM(reservation.num_of_tickets), 0) AS 'Total Tickets Purchased'
FROM customer
LEFT JOIN customer_phone ON customer.customer_ID = customer_phone.customer_ID
LEFT JOIN reservation ON customer_phone.phone_number = reservation.phone_number
LEFT JOIN subscriptions ON customer.customer_ID = subscriptions.customer_ID
WHERE CURDATE() BETWEEN subscriptions.start_date AND subscriptions.end_date
GROUP BY CONCAT(customer.customer_first_name, ' ', customer.customer_last_name)
ORDER BY COALESCE(SUM(reservation.num_of_tickets), 0) DESC;

/*--------------------------------------------------------*/

# S5
# Select the total number of people who visited each hall:

SELECT hall.hall_ID, hall_name, SUM(IFNULL(reservation.num_of_tickets, 0)) AS 'Total Number of Visitors'
FROM hall
LEFT JOIN schedule ON hall.hall_ID = schedule.hall_ID
LEFT JOIN reservation ON schedule.performance_ID = reservation.performance_ID
GROUP BY hall.hall_ID, hall.hall_name;

/*--------------------------------------------------------*/

# S6
# Select customers who have more than one phone number:

SELECT customer.customer_ID AS 'ID', customer_first_name AS 'First Name',customer_last_name AS 'Last Name', phone_number AS 'Phone Number'
FROM customer
JOIN customer_phone phone ON customer.customer_ID = phone.customer_ID
WHERE customer.customer_ID IN (
    SELECT customer_ID
    FROM customer_phone
    GROUP BY customer_ID
    HAVING COUNT(*) > 1
);

/*--------------------------------------------------------*/

# S7
# Select all the customers who have made reservations for 'The Broken Algorithm' shows:

SELECT CONCAT(customer_first_name, ' ', customer_last_name) AS 'Customer Name', date_and_time AS 'Date of the Performance'
FROM customer
JOIN customer_phone ON customer.customer_ID = customer_phone.customer_ID
JOIN reservation ON customer_phone.phone_number = reservation.phone_number
JOIN schedule ON reservation.performance_ID = schedule.performance_ID
WHERE schedule.show_ID = 304
ORDER BY date_and_time ASC;

/*--------------------------------------------------------*/

# S8
# Select the names of customers who have an active subscription package:
SELECT CONCAT(customer_first_name, ' ', customer_last_name) AS 'Customer Name', start_date AS 'Start Date', end_date AS 'End Date'
FROM customer
JOIN subscriptions ON customer.customer_ID = subscriptions.customer_ID
WHERE CURDATE() BETWEEN start_date AND end_date;

/*--------------------------------------------------------*/

# S9
# Select the top 5 customers who have made the most reservations:

SELECT CONCAT(customer_first_name, ' ', customer_last_name) AS 'Customer Name', COUNT(reservation.reservation_ID) AS 'Reservation Count'
FROM customer
JOIN customer_phone ON customer.customer_ID = customer_phone.customer_ID
JOIN reservation ON customer_phone.phone_number = reservation.phone_number
GROUP BY customer.customer_ID
ORDER BY COUNT(reservation.reservation_ID) DESC
LIMIT 5;

/*--------------------------------------------------------*/

# S10
# Select the seats that are currently available for a specific performance:

SELECT seat.seat_ID AS 'Seat ID', seat.seat_number AS 'Seat Number', seat.row_num AS 'Row Number', seat.section AS 'Section'
FROM seat
JOIN hall ON seat.hall_ID = hall.hall_ID
WHERE seat.hall_ID = 103 
    AND seat.seat_ID NOT IN (
        SELECT tickets_in_reservation.seat_ID
        FROM tickets_in_reservation
        JOIN reservation ON tickets_in_reservation.reservation_ID = reservation.reservation_ID
        WHERE reservation.performance_ID = 419
    );



