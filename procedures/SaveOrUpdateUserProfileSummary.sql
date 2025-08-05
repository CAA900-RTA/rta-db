DELIMITER $$
CREATE DEFINER=`resunanceadmin`@`%` PROCEDURE `SaveOrUpdateUserProfileSummary`(
  IN fullName VARCHAR(100),
  IN in_username VARCHAR(100),
  IN in_summary TEXT,
  OUT out_user_id INT
)
BEGIN
  DECLARE existing_user_id INT;

  SELECT user_id INTO existing_user_id FROM users WHERE username = in_username;

  IF existing_user_id IS NULL THEN
    INSERT INTO users (last_name, username, professional_summary)
    VALUES (fullName, in_username, in_summary);

    SET out_user_id = LAST_INSERT_ID();
  ELSE
    UPDATE users
    SET professional_summary = in_summary,
    last_name = fullName
    WHERE user_id = existing_user_id;

    SET out_user_id = existing_user_id;
  END IF;
END$$
DELIMITER ;
