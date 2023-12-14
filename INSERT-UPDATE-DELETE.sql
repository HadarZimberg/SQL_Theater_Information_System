USE theater_information_system;

/*--------------------------------------------------------*/

# 1
# INSERT a new show to the "shows" table:

INSERT INTO shows VALUES
(313, 'The Horror of Physics', 'Drama', '02:30:00', 180.00);

/*--------------------------------------------------------*/

# 2
# DELETE shows from the "schedule" table whose date has already passed:

DELETE FROM schedule
WHERE date_and_time < NOW();

/*--------------------------------------------------------*/

# 3
# UPDATE all prices of subscription packages in the "subscription_package" table by increasing them by 50%

UPDATE subscription_package
SET cost = cost * 1.5;

