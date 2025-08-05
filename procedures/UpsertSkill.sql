DELIMITER $$
CREATE DEFINER=`resunanceadmin`@`%` PROCEDURE `UpsertSkill`(IN in_user_id INT, IN in_skill_name VARCHAR(100))
BEGIN
  DECLARE sid INT;

  SELECT skill_id INTO sid FROM skills_master WHERE skill_name = in_skill_name;

  IF sid IS NULL THEN
    INSERT INTO skills_master(skill_name) VALUES (in_skill_name);
    SET sid = LAST_INSERT_ID();
  END IF;

  INSERT IGNORE INTO user_skills(user_id, skill_id) VALUES (in_user_id, sid);
END$$
DELIMITER ;
