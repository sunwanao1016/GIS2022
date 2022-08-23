CREATE TABLE `nucleic_acid_detection_point` (
  `X` double,
  `Y` double,
  `Province` varchar(255),
  `Area` varchar(255),
  `Address` varchar(255),
  `Nucleic_acid_detection_point` varchar(255),
  `Daily_nucleic_acid_detection_amount` integer,
  `ID` integer,
  `Date` varchar(255),
  PRIMARY KEY (`Nucleic_acid_detection_point`, `Date`)
);

CREATE TABLE `vaccination_point` (
  `X` double,
  `Y` double,
  `Province` varchar(255),
  `Area` varchar(255),
  `Address` varchar(255),
  `Vaccination_point` varchar(255),
  `Amount_of_vaccine` integer,
  `ID` integer,
  `Date` varchar(255),
  PRIMARY KEY (`Vaccination_point`, `Date`)
);

CREATE TABLE `personnel_information` (
  `X` double,
  `Y` double,
  `Account_type` varchar(255),
  `Name` varchar(255),
  `Telephone` varchar(255),
  `Age` varchar(255),
  `Gender` varchar(255),
  `Number_of_vaccinations` integer,
  `Is_it_infected` boolean,
  `Password` varchar(255),
  PRIMARY KEY (`Name`, `Telephone`)
);

CREATE TABLE `nucleic_acid_detection_form` (
  `Name` varchar(255),
  `Nucleic_acid_detection_point` varchar(255),
  `Telephone` varchar(255),
  `Is_it_infected` boolean,
  `Date` varchar(255)
);

CREATE TABLE `nucleic_acid_reservation_form` (
  `Name` varchar(255),
  `Nucleic_acid_detection_point` varchar(255),
  `Date` varchar(255)
);

CREATE TABLE `vaccination_table` (
  `Name` varchar(255),
  `Vaccination_point` varchar(255),
  `Telephone` varchar(255),
  `Date` varchar(255)
);

CREATE TABLE `vaccine_appointment_form` (
  `Name` varchar(255),
  `Vaccination_point` varchar(255),
  `Date` varchar(255)
);

CREATE TABLE `message_board` (
  `Name` varchar(255),
  `Telephone` varchar(255),
  `Message` varchar(255),
  `Date` varchar(255)
);

CREATE TABLE `nucleic_acid_point_data` (
  `Nucleic_acid_detection_point` varchar(255) PRIMARY KEY,
  `Daily_nucleic_acid_detection_amount` integer
);

CREATE TABLE `vaccine_point_data` (
  `Vaccination_point` varchar(255) PRIMARY KEY,
  `Amount_of_vaccine` integer
);

ALTER TABLE `nucleic_acid_detection_point` COMMENT = '核酸检测点';

ALTER TABLE `vaccination_point` COMMENT = '疫苗接种点';

ALTER TABLE `personnel_information` COMMENT = '人员信息表';

ALTER TABLE `nucleic_acid_detection_form` COMMENT = '核酸检测表';

ALTER TABLE `nucleic_acid_reservation_form` COMMENT = '核酸预约表';

ALTER TABLE `vaccination_table` COMMENT = '疫苗接种表';

ALTER TABLE `vaccine_appointment_form` COMMENT = '疫苗预约表';

ALTER TABLE `message_board` COMMENT = '留言表';

ALTER TABLE `nucleic_acid_point_data` COMMENT = '核酸点数据';

ALTER TABLE `vaccine_point_data` COMMENT = '疫苗点数据';

ALTER TABLE `nucleic_acid_detection_form` ADD FOREIGN KEY (`Name`) REFERENCES `personnel_information` (`Name`);

ALTER TABLE `nucleic_acid_detection_form` ADD FOREIGN KEY (`Telephone`) REFERENCES `personnel_information` (`Telephone`);

ALTER TABLE `vaccination_table` ADD FOREIGN KEY (`Name`) REFERENCES `personnel_information` (`Name`);

ALTER TABLE `vaccination_table` ADD FOREIGN KEY (`Telephone`) REFERENCES `personnel_information` (`Telephone`);

ALTER TABLE `vaccine_appointment_form` ADD FOREIGN KEY (`Name`) REFERENCES `personnel_information` (`Name`);

ALTER TABLE `nucleic_acid_reservation_form` ADD FOREIGN KEY (`Name`) REFERENCES `personnel_information` (`Name`);

ALTER TABLE `message_board` ADD FOREIGN KEY (`Name`) REFERENCES `personnel_information` (`Name`);

ALTER TABLE `message_board` ADD FOREIGN KEY (`Telephone`) REFERENCES `personnel_information` (`Telephone`);

ALTER TABLE `nucleic_acid_detection_form` ADD FOREIGN KEY (`Nucleic_acid_detection_point`) REFERENCES `nucleic_acid_detection_point` (`Nucleic_acid_detection_point`);

ALTER TABLE `nucleic_acid_reservation_form` ADD FOREIGN KEY (`Nucleic_acid_detection_point`) REFERENCES `nucleic_acid_detection_point` (`Nucleic_acid_detection_point`);

ALTER TABLE `vaccination_table` ADD FOREIGN KEY (`Vaccination_point`) REFERENCES `vaccination_point` (`Vaccination_point`);

ALTER TABLE `vaccine_appointment_form` ADD FOREIGN KEY (`Vaccination_point`) REFERENCES `vaccination_point` (`Vaccination_point`);
