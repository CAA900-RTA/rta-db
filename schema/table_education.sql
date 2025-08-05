CREATE TABLE `education` (
  `education_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `institution_name` varchar(255) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `major` varchar(100) DEFAULT NULL,
  `start_month` varchar(20) DEFAULT NULL,
  `start_year` year DEFAULT NULL,
  `end_month` varchar(20) DEFAULT NULL,
  `end_year` year DEFAULT NULL,
  `gpa` decimal(3,2) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`education_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `education_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
