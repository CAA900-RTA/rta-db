DELIMITER $$
CREATE DEFINER=`resunanceadmin`@`%` PROCEDURE `UpsertEducation`(
  IN in_user_id INT,
  IN in_education_id INT,
  IN in_degree VARCHAR(100),
  IN in_institution VARCHAR(255),
  IN in_startDate DATE,
  IN in_endDate DATE
)
BEGIN
  IF in_education_id IS NULL OR in_education_id = 0 THEN
    INSERT INTO education (user_id, degree, institution_name, startDate, endDate)
    VALUES (in_user_id, in_degree, in_institution, in_startDate, in_endDate);
  ELSE
    UPDATE education
    SET degree = in_degree,
        institution_name = in_institution,
        startDate = in_startDate,
        endDate = in_endDate
    WHERE education_id = in_education_id AND user_id = in_user_id;
  END IF;
END$$
DELIMITER ;
