-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2020 at 04:25 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edufund`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDataAccount` (IN `email` VARCHAR(55), IN `password` VARCHAR(55))  BEGIN

	SELECT email, password, acc_id 
 	FROM account
	WHERE account.email = email and account.password = password
    and account.status = 'Active';

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDataAllLoanStatus` ()  BEGIN
	SELECT LoanStatusID, StatusName
    FROM loanstatus
    WHERE loanstatus.Status = 'Active';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDataAllProduct` ()  BEGIN
	SELECT product_id, product_name, status from product;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDataAllProvince` ()  BEGIN
	SELECT Province_ID, Province_Name FROM province;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDataAllVillage` ()  BEGIN
	SELECT Village_ID, Village_Name FROM village;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProfileAccountByEmail` (IN `email` VARCHAR(55))  BEGIN
	DECLARE AccountId INT DEFAULT 0;
	DECLARE ProfileId INT DEFAULT 0;
    
    SELECT acc_id into AccountId
    FROM account
	WHERE account.email = email;

    SELECT profile_id into ProfileId
    FROM profile
	WHERE profile.acc_id = AccountId;

	SELECT `profile`.`profile_id`,`profile`.`acc_id`,`profile`.`idcardnumber`,`profile`.`placeofbirth`,`profile`.`dateofbirth`,
    `profile`.`Gender`,`profile`.`Religion`,`profile`.`ImageKTP`,`profile`.`ImageSelfie`,`profile`.`StatusMarriage`,`profile`.`Education`,
    `profile`.`TaxID`,`profile`.`ImageFamilyMemberCard`,`profile`.`Occupation`,`profile`.`Fields`,`profile`.`Position`,`profile`.`StatusOfEmployment`,`profile`.`ProofOfEmployment`,
    `profile`.`ProofOfIncome`,`profile`.`ProofOfBusiness`,`profile`.`ProofOfBusinessIncome`,`profile`.`Type`,
    `profile`.`Status`,`profile`.`CreatedAt`,`profile`.`CreatedBy`,`profile`.`UpdatedAt`,`profile`.`UpdatedBy`,
	
	`address`.`Address_ID`,`address`.`Profile_ID`,`address`.`Village_ID`,
    `address`.`Province_ID`,`address`.`Street`,`address`.`Number`,`address`.`RT`,`address`.`RW`,
    `address`.`City`,`address`.`SubDistrict`,`address`.`PostalCode`,`address`.`ResidentialStatus`,
    `address`.`Duration`,`address`.`ProofOfResidence`,
     
	`emergencycontact`.`ID_EmergencyContact`,`emergencycontact`.`Profile_ID`,
    `emergencycontact`.`Name`,`emergencycontact`.`Phone`,`emergencycontact`.`Relationship`

	FROM `edufund`.`profile`
    LEFT JOIN `edufund`.`address` ON `edufund`.`profile`.`profile_id` = `edufund`.`address`.`Profile_ID`
    LEFT JOIN `edufund`.`emergencycontact` ON `edufund`.`profile`.`profile_id` = `edufund`.`emergencycontact`.`Profile_ID`
	WHERE `edufund`.`profile`.`profile_id` = ProfileId;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertSimulationHelper` (IN `acc_id` INT, IN `balance` DECIMAL(18,2), IN `principal` DECIMAL(18,2), IN `interest` DECIMAL(18,2), IN `installments` DECIMAL(18,2))  BEGIN
	DELETE FROM simulation_helper WHERE simulation_helper.acc_id = acc_id;
	INSERT INTO simulation_helper(acc_id, balance, principal, interest, installments)
    VALUES(acc_id, balance, principal, interest, installments);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ResetPassword` (IN `email` VARCHAR(55), IN `password` VARCHAR(55))  BEGIN
	DECLARE AccountId INT DEFAULT 0;
    
    SELECT acc_id into AccountId
    FROM account
	WHERE account.email = email;
    
	UPDATE account
	SET account.password = password,
    account.Status = 'Active'
	WHERE account.acc_id = AccountId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SignUpAccount` (IN `email` VARCHAR(55), IN `password` VARCHAR(55), IN `phone_number` VARCHAR(55))  BEGIN
		DECLARE AccountId INT DEFAULT 0;
        INSERT INTO account (email, password, phone_number, status)
		SELECT * FROM (SELECT email, password, phone_number, 'Disactive') AS tmp
		WHERE NOT EXISTS (
			SELECT account.email FROM account 
            WHERE account.email = email 
            OR account.phone_number = phone_number
		) LIMIT 1;
        IF(ROW_COUNT() > 0) THEN
        	SELECT acc_id into AccountId
			FROM account
			WHERE account.email = email;
            
			INSERT INTO profile (acc_id, CreatedAt, CreatedBy) VALUES (AccountId, CURDATE(), email);
        END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateProfileAccount` (IN `email` VARCHAR(55), IN `idcardnumber` INT(16), IN `placeofbirth` VARCHAR(50), IN `dateofbirth` DATE, IN `Gender` ENUM('L','P'), IN `Religion` ENUM('Kristen','Katolik','Islam','Hindu','Buddha'), IN `ImageKTP` VARCHAR(55), IN `ImageSelfie` VARCHAR(55), IN `StatusMarriage` ENUM('Married','Not Married'), IN `Education` ENUM('D3','S1','S2','S3'), IN `TaxID` TINYINT(11), IN `ImageFamilyMemberCard` VARCHAR(55), IN `Occupation` VARCHAR(50), IN `Fields` VARCHAR(20), IN `Position` VARCHAR(25), IN `StatusOfEmployment` VARCHAR(55), IN `ProofOfEmployment` VARCHAR(55), IN `ProofOfIncome` VARCHAR(55), IN `ProofOfBusiness` VARCHAR(55), IN `ProofOfBusinessIncome` VARCHAR(55), IN `Type` VARCHAR(20), IN `Status` VARCHAR(20), IN `Village_ID` INT, IN `Province_ID` INT, IN `Street` VARCHAR(55), IN `Number` INT(10), IN `RT` INT(10), IN `RW` INT(10), IN `City` VARCHAR(55), IN `SubDistrict` VARCHAR(55), IN `PostalCode` INT(20), IN `ResidentialStatus` VARCHAR(55), IN `Duration` INT(10), IN `ProofOfResidence` VARCHAR(55), IN `Name` VARCHAR(55), IN `Phone` VARCHAR(55), IN `Relationship` VARCHAR(55))  BEGIN

	DECLARE AccountId INT DEFAULT 0;
	DECLARE ProfileId INT DEFAULT 0;
    DECLARE AddressId INT DEFAULT 0;
    DECLARE IDEmergencyContact INT DEFAULT 0;

    
    SELECT acc_id into AccountId
    FROM account
	WHERE account.email = email;

    SELECT profile_id into ProfileId
    FROM profile
	WHERE profile.acc_id = AccountId;
    
	UPDATE profile
	SET profile.idcardnumber = idcardnumber,
    profile.placeofbirth = placeofbirth,
    profile.dateofbirth =  dateofbirth,
    profile.Gender = gender,
    profile.Religion = Religion,
    profile.ImageKTP = ImageKTP,
    profile.ImageSelfie = ImageSelfie,
	profile.StatusMarriage = StatusMarriage,
	profile.Education = Education,
    profile.TaxID = TaxID,
    profile.ImageFamilyMemberCard = ImageFamilyMemberCard,
    profile.Occupation = Occupation,
    profile.Fields = Fields,
    profile.Position = Position,
    profile.StatusOfEmployment = StatusOfEmployment,
    profile.ProofOfEmployment = ProofOfEmployment,
    profile.ProofOfIncome = ProofOfIncome,
    profile.ProofOfBusiness = ProofOfBusiness,
    profile.ProofOfBusinessIncome = ProofOfBusinessIncome,
    profile.Type = Type,
    profile.Status = Status,
    profile.UpdatedAt = CURDATE(),
    profile.UpdatedBy = ProfileId
	WHERE profile.profile_id = ProfileId;



IF(ProfileId != 0) THEN
	SELECT Address_ID into AddressId
	FROM address
	WHERE address.Profile_ID = ProfileId;

	DELETE FROM address WHERE address.Address_ID = AddressId;
	INSERT INTO address (Profile_ID, Village_ID, Province_ID, Street, Number, RT, RW, City, SubDistrict, PostalCode, ResidentialStatus, Duration, ProofOfResidence) 
	VALUES (ProfileId, Village_ID, Province_ID, Street, Number, RT, RW, City, SubDistrict, PostalCode, ResidentialStatus, Duration, ProofOfResidence);

	SELECT ID_EmergencyContact into IDEmergencyContact
	FROM emergencycontact
	WHERE emergencycontact.Profile_ID = ProfileId;
	
	DELETE FROM emergencycontact WHERE emergencycontact.ID_EmergencyContact = IDEmergencyContact;
	INSERT INTO emergencycontact (Profile_ID, Name, Phone, Relationship, Status, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy) 
	VALUES (ProfileId, Name, Phone, Relationship, 'Active', CURDATE(), ProfileId, CURDATE(), ProfileId);

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStatusAccount` (IN `email` VARCHAR(55), IN `Status` VARCHAR(55))  BEGIN

	DECLARE AccountId INT DEFAULT 0;
    
    SELECT acc_id into AccountId
    FROM account
	WHERE account.email = email;
    
	UPDATE account
	SET
    account.Status = 'Active'
	WHERE account.acc_id = AccountId;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `acc_id` int(4) NOT NULL,
  `password` varchar(999) NOT NULL,
  `email` varchar(55) NOT NULL,
  `phone_number` int(55) NOT NULL,
  `status` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`acc_id`, `password`, `email`, `phone_number`, `status`) VALUES
(1, 'angela123', 'angela@gmail.com', 89743232, 'Active'),
(2, 'jacky123', 'jacky@gmail.com', 89632332, 'Active'),
(5, '33b2c413c2db862b456d183bc1af81d79be6a693013dc5aef66e5e9', 'cloud@gmail.com', 124, 'Active'),
(6, '3c19eaa44d299bfda191df4dcfd5d73cfe2f591cc17791c7ae09257', 'jovita.sutanto97@gmail.com', 215451677, 'Active'),
(76, 'admin123', 'squall93@gmail.com', 12345, 'Disactive'),
(77, 'admin123', 'tidus93@gmail.com', 12345, 'Disactive'),
(84, 'admin123', 'love21@gmail.com', 12345877, 'Disactive'),
(85, 'admin123', 'love22@gmail.com', 123458727, 'Disactive'),
(86, 'admin123', 'love223@gmail.com', 1234587277, 'Disactive'),
(91, '9a365b0597e198ceac41966db1d6f47de66a86bb99e3e5a811c3030', 'franky.sutanto93@gmail.com', 1242, 'Active'),
(92, 'e4671fcdc5509e8bf837bb19bb0eb77044aeaca9418fa9e49cf2376', 'jovitasutanto98@gmail.com', 478485, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `Address_ID` int(10) NOT NULL,
  `Profile_ID` int(11) NOT NULL,
  `Village_ID` int(11) NOT NULL,
  `Province_ID` int(11) NOT NULL,
  `Street` varchar(55) NOT NULL,
  `Number` int(10) NOT NULL,
  `RT` int(10) NOT NULL,
  `RW` int(10) NOT NULL,
  `City` varchar(55) NOT NULL,
  `SubDistrict` varchar(55) NOT NULL,
  `PostalCode` int(20) NOT NULL,
  `ResidentialStatus` varchar(55) NOT NULL,
  `Duration` int(10) NOT NULL,
  `ProofOfResidence` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`Address_ID`, `Profile_ID`, `Village_ID`, `Province_ID`, `Street`, `Number`, `RT`, `RW`, `City`, `SubDistrict`, `PostalCode`, `ResidentialStatus`, `Duration`, `ProofOfResidence`) VALUES
(1, 0, 0, 0, 'Jl Asoka Raya ', 5, 7, 12, 'Jakarta Barat', 'Kalideres', 11880, 'Pribadi', 3, 'sertifikat rumah'),
(8, 10, 1, 1, 'Jakarta Barat', 123456789, 11850, 11082, 'Jakarta', 'test', 11850, 'Active', 20, 'Test'),
(11, 11, 3, 1, 'Jalan dharma griya v', 79, 7, 12, 'Jakarta Barat', 'Semanan', 11850, 'Active', 20, 'House');

-- --------------------------------------------------------

--
-- Table structure for table `emergencycontact`
--

CREATE TABLE `emergencycontact` (
  `ID_EmergencyContact` int(10) NOT NULL,
  `Profile_ID` int(11) NOT NULL,
  `Name` varchar(55) NOT NULL,
  `Phone` varchar(55) NOT NULL,
  `Relationship` varchar(55) NOT NULL,
  `Status` varchar(55) NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `CreatedBy` varchar(55) DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `UpdatedBy` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emergencycontact`
--

INSERT INTO `emergencycontact` (`ID_EmergencyContact`, `Profile_ID`, `Name`, `Phone`, `Relationship`, `Status`, `CreatedAt`, `CreatedBy`, `UpdatedAt`, `UpdatedBy`) VALUES
(10, 10, 'Jovita', '0812123', 'No', 'Active', '2020-10-05', '10', '2020-10-05', '10'),
(13, 11, 'Jess', '485859', 'Cousin', 'Active', '2020-10-10', '11', '2020-10-10', '11');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(10) NOT NULL,
  `Loan_id` int(11) NOT NULL,
  `InstallmentNumber` int(20) NOT NULL,
  `LoanExternalID` varchar(55) NOT NULL,
  `DueDate` date NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `Loan_id` int(10) NOT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `loan_status_id` int(11) DEFAULT NULL,
  `AgreementDate` date NOT NULL,
  `DisbursementDate` date NOT NULL,
  `Interest` int(10) NOT NULL,
  `amount_without_interest` int(10) NOT NULL,
  `totalamount` int(20) NOT NULL,
  `DueAmount` int(20) NOT NULL,
  `DateAmount` date NOT NULL,
  `DueDateAmount` date NOT NULL,
  `PenaltyAmount` int(20) NOT NULL,
  `LoanQuality` varchar(25) NOT NULL,
  `LoanStatus` varchar(25) NOT NULL,
  `Reason` varchar(55) NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loanstatus`
--

CREATE TABLE `loanstatus` (
  `LoanStatusID` int(10) NOT NULL,
  `StatusName` varchar(55) NOT NULL,
  `Status` varchar(55) NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loanstatus`
--

INSERT INTO `loanstatus` (`LoanStatusID`, `StatusName`, `Status`, `CreatedAt`, `CreatedBy`, `UpdatedAt`, `UpdatedBy`) VALUES
(1, 'In Process', 'Active', '2020-09-20', 'SYSTEM', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(10) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(50) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `status`, `CreatedAt`, `CreatedBy`, `UpdatedAt`, `UpdatedBy`) VALUES
(1, 'collage', 'active', '2020-09-19', 'SYSTEM', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profile_id` int(10) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `idcardnumber` int(16) DEFAULT NULL,
  `placeofbirth` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `Gender` enum('L','P') DEFAULT NULL,
  `Religion` enum('Kristen','Katolik','Islam','Hindu','Buddha') DEFAULT NULL,
  `ImageKTP` varchar(55) DEFAULT NULL,
  `ImageSelfie` varchar(55) DEFAULT NULL,
  `StatusMarriage` enum('Married','Not Married') DEFAULT NULL,
  `Education` enum('D3','S1','S2','S3') DEFAULT NULL,
  `TaxID` tinyint(11) DEFAULT NULL,
  `ImageFamilyMemberCard` varchar(55) DEFAULT NULL,
  `Occupation` varchar(55) DEFAULT NULL,
  `Fields` varchar(20) DEFAULT NULL,
  `Position` varchar(25) DEFAULT NULL,
  `StatusOfEmployment` varchar(55) DEFAULT NULL,
  `ProofOfEmployment` varchar(55) DEFAULT NULL,
  `ProofOfIncome` varchar(55) DEFAULT NULL,
  `ProofOfBusiness` varchar(55) DEFAULT NULL,
  `ProofOfBusinessIncome` varchar(55) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `UpdatedBy` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`profile_id`, `acc_id`, `idcardnumber`, `placeofbirth`, `dateofbirth`, `Gender`, `Religion`, `ImageKTP`, `ImageSelfie`, `StatusMarriage`, `Education`, `TaxID`, `ImageFamilyMemberCard`, `Occupation`, `Fields`, `Position`, `StatusOfEmployment`, `ProofOfEmployment`, `ProofOfIncome`, `ProofOfBusiness`, `ProofOfBusinessIncome`, `Type`, `Status`, `CreatedAt`, `CreatedBy`, `UpdatedAt`, `UpdatedBy`) VALUES
(3, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01', 'admin', NULL, NULL),
(4, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01', 'admin', NULL, NULL),
(5, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-27', 'love223@gmail.com', NULL, NULL),
(6, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-02', 'franky.sutanto93@gmail.', NULL, NULL),
(7, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-02', 'franky.sutanto93@gmail.', NULL, NULL),
(8, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-03', 'franky.sutanto93@gmail.com', NULL, NULL),
(9, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-03', 'frankys.sutanto93@gmail.com', NULL, NULL),
(10, 91, 12344556, 'Jakarta', '1993-08-16', 'L', 'Kristen', '', '', 'Not Married', 'S1', 1, '', 'Indonesia', 'test', 'IT', 'Active', 'test', 'test', 'test', 'test', 'Data', 'Active', '2020-10-03', 'franky.sutanto93@gmail.com', '2020-10-05', '10'),
(11, 92, 58859595, 'Jakarta', '1997-10-04', 'P', 'Kristen', '...', '...', 'Not Married', 'S1', 1, '...', 'Indonesia', 'WNI', 'Technology', 'Intern', 'Internship', '1000000', 'Store', '1000000', 'Data', 'Active', '2020-10-10', 'jovitasutanto98@gmail.com', '2020-10-10', '11');

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `Province_ID` int(10) NOT NULL,
  `Province_Name` varchar(55) NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`Province_ID`, `Province_Name`, `CreatedAt`, `CreatedBy`, `UpdatedAt`, `UpdatedBy`) VALUES
(1, 'DKI Jakarta', '2020-08-19', 'SYSTEM', '0000-00-00', ''),
(2, 'Jawa Barat', '2020-08-19', 'SYSTEM', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `simulation_helper`
--

CREATE TABLE `simulation_helper` (
  `simulation_id` int(11) NOT NULL,
  `acc_id` int(4) DEFAULT NULL,
  `balance` decimal(18,2) DEFAULT NULL,
  `principal` decimal(18,2) DEFAULT NULL,
  `interest` decimal(18,2) DEFAULT NULL,
  `installments` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `village`
--

CREATE TABLE `village` (
  `Village_ID` int(10) NOT NULL,
  `Village_Name` varchar(55) NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `village`
--

INSERT INTO `village` (`Village_ID`, `Village_Name`, `CreatedAt`, `CreatedBy`, `UpdatedAt`, `UpdatedBy`) VALUES
(1, 'Grogol', '2020-09-19', 'SYSTEM', '0000-00-00', ''),
(2, 'Taman Sari', '2020-09-19', 'SYSTEM', '0000-00-00', ''),
(3, 'Cengkareng', '2020-09-19', 'SYSTEM', '0000-00-00', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`acc_id`) USING BTREE;

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Address_ID`);

--
-- Indexes for table `emergencycontact`
--
ALTER TABLE `emergencycontact`
  ADD PRIMARY KEY (`ID_EmergencyContact`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`Loan_id`);

--
-- Indexes for table `loanstatus`
--
ALTER TABLE `loanstatus`
  ADD PRIMARY KEY (`LoanStatusID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`Province_ID`);

--
-- Indexes for table `simulation_helper`
--
ALTER TABLE `simulation_helper`
  ADD PRIMARY KEY (`simulation_id`);

--
-- Indexes for table `village`
--
ALTER TABLE `village`
  ADD PRIMARY KEY (`Village_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `acc_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `Address_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `emergencycontact`
--
ALTER TABLE `emergencycontact`
  MODIFY `ID_EmergencyContact` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `Loan_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loanstatus`
--
ALTER TABLE `loanstatus`
  MODIFY `LoanStatusID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profile_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `Province_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `village`
--
ALTER TABLE `village`
  MODIFY `Village_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
