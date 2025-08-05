DELIMITER $$
CREATE DEFINER=`resunanceadmin`@`%` PROCEDURE `UpsertWorkExperience`(
  IN in_user_id INT,
  IN in_experience_id INT,
  IN in_role VARCHAR(100),
  IN in_company VARCHAR(255),
  IN in_responsibilities VARCHAR(500),
  IN in_startDate DATE,
  IN in_endDate DATE
)
BEGIN
  IF in_experience_id IS NULL OR in_experience_id = 0 THEN
    INSERT INTO work_experience (user_id, role, company, responsibilities, startDate, endDate)
    VALUES (in_user_id, in_role, in_company, in_responsibilities, in_startDate, in_endDate);
  ELSE
    UPDATE work_experience
    SET role = in_role,
        company = in_company,
        responsibilities = in_responsibilities,
        startDate = in_startDate,
        endDate = in_endDate        
    WHERE experience_id = in_experience_id AND user_id = in_user_id;
  END IF;
END$$
DELIMITER ;
