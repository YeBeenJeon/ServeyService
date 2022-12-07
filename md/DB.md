## DB Schema

```SQL
CREATE TABLE `answers` (
  `surveyCode` varchar(20) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `location` varchar(10) DEFAULT NULL,
  `formType` varchar(10) DEFAULT NULL,
  `elementNum` varchar(10) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `elements` (
  `surveyCode` varchar(20) DEFAULT NULL,
  `location` varchar(10) DEFAULT NULL,
  `formType` varchar(10) DEFAULT NULL,
  `elementNum` varchar(10) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `questions` (
  `surveyCode` varchar(20) DEFAULT NULL,
  `location` varchar(10) DEFAULT NULL,
  `formType` varchar(10) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `surveyInfo` (
  `userEmail` varchar(50) NOT NULL,
  `surveyCode` varchar(20) NOT NULL,
  `lastModifyTime` datetime DEFAULT NULL,
  `title` varchar(45) DEFAULT '제목',
  PRIMARY KEY (`userEmail`,`surveyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `user` (
  `userPassword` varchar(64) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userEmailChecked` tinyint(1) DEFAULT NULL,
  `userEmailRandomString` varchar(45) NOT NULL,
  PRIMARY KEY (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
```
