DELIMITER $$
CREATE DEFINER=`resunanceadmin`@`%` PROCEDURE `GetUserProfileByUsername`(IN in_username VARCHAR(255))
BEGIN
  SELECT * FROM users WHERE username = in_username;

  SELECT * FROM education 
  WHERE user_id = (SELECT user_id FROM users WHERE username = in_username);

  SELECT * FROM work_experience 
  WHERE user_id = (SELECT user_id FROM users WHERE username = in_username);

  SELECT * FROM project_experience 
  WHERE user_id = (SELECT user_id FROM users WHERE username = in_username);

  SELECT s.skill_name 
  FROM user_skills us
  JOIN skills_master s ON us.skill_id = s.skill_id
  WHERE us.user_id = (SELECT user_id FROM users WHERE username = in_username);

  SELECT * FROM certificates 
  WHERE user_id = (SELECT user_id FROM users WHERE username = in_username);
END$$
DELIMITER ;
