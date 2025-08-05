DELIMITER $$
CREATE DEFINER=`resunanceadmin`@`%` PROCEDURE `SignupUser`(
  IN in_username VARCHAR(100),
  IN in_email VARCHAR(255),
  IN in_phone_number VARCHAR(50),
  IN in_location VARCHAR(255),
  OUT out_user_id INT
)
BEGIN
  DECLARE existing_user_id INT;

  SELECT user_id INTO existing_user_id FROM users WHERE email = in_email;

  IF existing_user_id IS NULL THEN
    INSERT INTO users (username, email, phone_number, location)
    VALUES (in_username, in_email, in_phone_number, in_location);
    SET out_user_id = LAST_INSERT_ID();
  ELSE
    -- Optional: update phone/location/username if you want to allow it
    UPDATE users
    SET username = in_username,
        phone_number = in_phone_number,
        location = in_location
    WHERE user_id = existing_user_id;
    
    SET out_user_id = existing_user_id;
  END IF;
END$$
DELIMITER ;
