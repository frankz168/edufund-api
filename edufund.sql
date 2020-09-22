-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2020 at 10:49 AM
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
    DECLARE LoginData INT DEFAULT 0;
    DECLARE AccountId INT DEFAULT 0;
    

	SELECT email, password, acc_id 

 	FROM account

	WHERE account.email = email and account.password = password
    and account.status = 'Active';
    
    SELECT COUNT(*) into LoginData 
    FROM account
	WHERE account.email = email and account.password = password;
    
	SELECT acc_id into AccountId
    FROM account
	WHERE account.email = email;
     
    if(LoginData <= 0) THEN
		UPDATE `edufund`.`account` 
		SET account.attempt_login_count = account.attempt_login_count + 1, 
		Status = CASE WHEN account.attempt_login_count >=5 THEN 'Suspend' ELSE Status END
		WHERE account.acc_id = AccountId;
    END IF;
        

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `ResetPassword` (IN `email` VARCHAR(55), IN `password` VARCHAR(55))  BEGIN
	DECLARE AccountId INT DEFAULT 0;
    
    SELECT acc_id into AccountId
    FROM account
	WHERE account.email = email;
    
	UPDATE account
	SET account.password = password,
    account.attempt_login_count = 0,
    account.Status = 'Active'
	WHERE account.acc_id = AccountId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SignUpAccount` (IN `email` VARCHAR(55), IN `password` VARCHAR(55), IN `phone_number` VARCHAR(55))  BEGIN
INSERT INTO account(email, password, phone_number, status)
VALUES(email, password, phone_number, 'Active');

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
  `status` varchar(55) NOT NULL,
  `attempt_login_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`acc_id`, `password`, `email`, `phone_number`, `status`, `attempt_login_count`) VALUES
(1, 'eee57390a790872edcf324fd9c90d78e7d5183a9a7d750b26ae335e', 'angela@gmail.com', 89743232, 'Active', 0),
(2, 'jacky123', 'jacky@gmail.com', 89632332, 'Active', 0),
(3, 'admin123', 'franky.sutanto93@gmail.com', 2147483647, '', 0),
(5, '33b2c413c2db862b456d183bc1af81d79be6a693013dc5aef66e5e9', 'cloud@gmail.com', 124, 'Active', 0),
(6, '5fec1b65ed95acded4799ae210caa7a396e4db49afecb946dc040d5', 'yuichan@gmail.com', 215451677, 'Active', 0);

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
  `Province` varchar(55) NOT NULL,
  `City` varchar(55) NOT NULL,
  `SubDistrict` varchar(55) NOT NULL,
  `Village` varchar(55) NOT NULL,
  `PostalCode` int(20) NOT NULL,
  `ResidentialStatus` varchar(55) NOT NULL,
  `Duration` int(10) NOT NULL,
  `ProofOfResidence` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`Address_ID`, `Profile_ID`, `Village_ID`, `Province_ID`, `Street`, `Number`, `RT`, `RW`, `Province`, `City`, `SubDistrict`, `Village`, `PostalCode`, `ResidentialStatus`, `Duration`, `ProofOfResidence`) VALUES
(1, 0, 0, 0, 'Jl Asoka Raya ', 5, 7, 12, 'DKI Jakarta', 'Jakarta Barat', 'Kalideres', 'Duri Kosambi', 11880, 'Pribadi', 3, 'sertifikat rumah');

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `borrower_id` int(4) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `va_number` int(55) NOT NULL,
  `external_id` varchar(45) NOT NULL,
  `va_external_id` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `idcardnumber` int(16) NOT NULL,
  `placeofbirth` varchar(50) NOT NULL,
  `dateofbirth` date NOT NULL,
  `Gender` enum('L','P') NOT NULL,
  `Religion` enum('Kristen','Katolik','Islam','Hindu','Buddha') NOT NULL,
  `ImageKTP` varchar(55) NOT NULL,
  `ImageSelfie` varchar(55) NOT NULL,
  `StatusMarriage` enum('Married','Not Married') NOT NULL,
  `Education` enum('D3','S1','S2','S3') NOT NULL,
  `TaxID` tinyint(11) DEFAULT NULL,
  `ImageFamilyMemberCard` varchar(55) NOT NULL,
  `Occupation` varchar(55) NOT NULL,
  `Fields` varchar(20) NOT NULL,
  `Position` varchar(25) NOT NULL,
  `StatusOfEmployment` varchar(55) NOT NULL,
  `ProofOfEmployment` varchar(55) NOT NULL,
  `ProofOfIncome` varchar(55) NOT NULL,
  `ProofOfBusiness` varchar(55) NOT NULL,
  `ProofOfBusinessIncome` varchar(55) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `borrower`
--
ALTER TABLE `borrower`
  ADD PRIMARY KEY (`borrower_id`);

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
  MODIFY `acc_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `Address_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `borrower`
--
ALTER TABLE `borrower`
  MODIFY `borrower_id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emergencycontact`
--
ALTER TABLE `emergencycontact`
  MODIFY `ID_EmergencyContact` int(10) NOT NULL AUTO_INCREMENT;

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
  MODIFY `profile_id` int(10) NOT NULL AUTO_INCREMENT;

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
