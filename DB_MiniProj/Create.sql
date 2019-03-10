-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema CourseWork
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CourseWork
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CourseWork` DEFAULT CHARACTER SET utf8 ;
USE `CourseWork` ;

-- -----------------------------------------------------
-- Table `CourseWork`.`STUDENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STUDENT` (
  `studentNumber` VARCHAR(45) NOT NULL,
  `studentName` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `postcode` VARCHAR(45) NULL,
  `birthDay` DATETIME NULL,
  `sex` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  `nationality` VARCHAR(45) NULL,
  `smoker` VARCHAR(45) NULL,
  `specialNeed` VARCHAR(45) NULL,
  `additionalComment` VARCHAR(45) NULL,
  `currentStatus` VARCHAR(45) NULL,
  PRIMARY KEY (`studentNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`LEASE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`LEASE` (
  `leaseNumber` VARCHAR(45) NOT NULL,
  `duration` INT NULL,
  `entryDate` DATETIME NULL,
  `leaveDate` DATETIME NULL,
  PRIMARY KEY (`leaseNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`STUDENT_LEASE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STUDENT_LEASE` (
  `studentNumber` VARCHAR(45) NOT NULL,
  `leaseNumber` VARCHAR(45) NOT NULL,
  INDEX `fk_STUDENT_LEASE_STUDENT1_idx` (`studentNumber` ASC),
  INDEX `fk_STUDENT_LEASE_LEASE1_idx` (`leaseNumber` ASC),
  CONSTRAINT `fk_STUDENT_LEASE_STUDENT1`
    FOREIGN KEY (`studentNumber`)
    REFERENCES `CourseWork`.`STUDENT` (`studentNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STUDENT_LEASE_LEASE1`
    FOREIGN KEY (`leaseNumber`)
    REFERENCES `CourseWork`.`LEASE` (`leaseNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`COURSE_A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`COURSE_A` (
  `courseNumber` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NULL,
  `leader` VARCHAR(45) NULL,
  `internalTelephoneNumber` VARCHAR(45) NULL,
  `roomNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`courseNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`COURSE_B`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`COURSE_B` (
  `courseNumber` VARCHAR(45) NOT NULL,
  `department` VARCHAR(45) NULL,
  INDEX `fk_COURSE_B_COURSE_A1_idx` (`courseNumber` ASC),
  CONSTRAINT `fk_COURSE_B_COURSE_A1`
    FOREIGN KEY (`courseNumber`)
    REFERENCES `CourseWork`.`COURSE_A` (`courseNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`ADVISOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`ADVISOR` (
  `advisorName` VARCHAR(45) NOT NULL,
  `position` VARCHAR(45) NULL,
  `nameOfDepartment` VARCHAR(45) NULL,
  `internalTelephoneNumber` VARCHAR(45) NULL,
  `roomNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`advisorName`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`STUDENT_ADVISOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STUDENT_ADVISOR` (
  `advisorName` VARCHAR(45) NOT NULL,
  `studentNumber` VARCHAR(45) NOT NULL,
  INDEX `fk_STUDENT_ADVIISOR_ADVISOR1_idx` (`advisorName` ASC),
  INDEX `fk_STUDENT_ADVIISOR_STUDENT1_idx` (`studentNumber` ASC),
  CONSTRAINT `fk_STUDENT_ADVIISOR_ADVISOR1`
    FOREIGN KEY (`advisorName`)
    REFERENCES `CourseWork`.`ADVISOR` (`advisorName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STUDENT_ADVIISOR_STUDENT1`
    FOREIGN KEY (`studentNumber`)
    REFERENCES `CourseWork`.`STUDENT` (`studentNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`BEDROOM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`BEDROOM` (
  `placeNumber` VARCHAR(45) NOT NULL,
  `rentRate` DECIMAL(5,2) NULL,
  `roomNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`placeNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`STUDENT_BEDROOM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STUDENT_BEDROOM` (
  `placeNumber` VARCHAR(45) NOT NULL,
  `studentNumber` VARCHAR(45) NOT NULL,
  INDEX `fk_STUDENT_BEDROOM_BEDROOM1_idx` (`placeNumber` ASC),
  INDEX `fk_STUDENT_BEDROOM_STUDENT1_idx` (`studentNumber` ASC),
  CONSTRAINT `fk_STUDENT_BEDROOM_BEDROOM1`
    FOREIGN KEY (`placeNumber`)
    REFERENCES `CourseWork`.`BEDROOM` (`placeNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STUDENT_BEDROOM_STUDENT1`
    FOREIGN KEY (`studentNumber`)
    REFERENCES `CourseWork`.`STUDENT` (`studentNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`SINGLE_ROOM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`SINGLE_ROOM` (
  `placeNumber` VARCHAR(45) NOT NULL,
  `roomNumber` VARCHAR(45) NULL,
  `rentRate` DECIMAL(5,2) NULL,
  PRIMARY KEY (`placeNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`STUDENT_SINGLE_ROOM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STUDENT_SINGLE_ROOM` (
  `studentNumber` VARCHAR(45) NOT NULL,
  `placeNumber` VARCHAR(45) NOT NULL,
  INDEX `fk_STUDENT_SINGLE_ROOM_STUDENT_idx` (`studentNumber` ASC),
  INDEX `fk_STUDENT_SINGLE_ROOM_SINGLE_ROOM1_idx` (`placeNumber` ASC),
  CONSTRAINT `fk_STUDENT_SINGLE_ROOM_STUDENT`
    FOREIGN KEY (`studentNumber`)
    REFERENCES `CourseWork`.`STUDENT` (`studentNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STUDENT_SINGLE_ROOM_SINGLE_ROOM1`
    FOREIGN KEY (`placeNumber`)
    REFERENCES `CourseWork`.`SINGLE_ROOM` (`placeNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`INVOICE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`INVOICE` (
  `invoiceNumber` VARCHAR(45) NOT NULL,
  `semester` VARCHAR(45) NULL,
  `paymentDue` VARCHAR(45) NULL,
  `dateOfPayment` DATETIME NULL,
  `methodOfPayment` VARCHAR(45) NULL,
  `dateOfFirstReminder` DATETIME NULL,
  `dateOfSecondReminder` DATETIME NULL,
  PRIMARY KEY (`invoiceNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`HALL_OF_RESIDENCE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`HALL_OF_RESIDENCE` (
  `hallName` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `postcode` VARCHAR(45) NULL,
  `telephoneNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`hallName`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`STUDENT_FLAT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STUDENT_FLAT` (
  `flatNumber` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `postcode` VARCHAR(45) NULL,
  `numberOfBedrooms` INT NULL,
  PRIMARY KEY (`flatNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`STAFF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STAFF` (
  `staffNumber` VARCHAR(45) NOT NULL,
  `staffName` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `postcode` VARCHAR(45) NULL,
  `birthDay` VARCHAR(45) NULL,
  `sex` VARCHAR(45) NULL,
  `position` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  PRIMARY KEY (`staffNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`STUDENT_COURSE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STUDENT_COURSE` (
  `studentNumber` VARCHAR(45) NOT NULL,
  `courseNumber` VARCHAR(45) NOT NULL,
  INDEX `fk_STUDENT_COURSE_STUDENT1_idx` (`studentNumber` ASC),
  INDEX `fk_STUDENT_COURSE_COURSE_A1_idx` (`courseNumber` ASC),
  CONSTRAINT `fk_STUDENT_COURSE_STUDENT1`
    FOREIGN KEY (`studentNumber`)
    REFERENCES `CourseWork`.`STUDENT` (`studentNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STUDENT_COURSE_COURSE_A1`
    FOREIGN KEY (`courseNumber`)
    REFERENCES `CourseWork`.`COURSE_A` (`courseNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`STUDENT_NEXT_OF_SKIN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STUDENT_NEXT_OF_SKIN` (
  `studentNumber` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  `relation` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `postcode` VARCHAR(45) NULL,
  `contact` VARCHAR(45) NULL,
  INDEX `fk_STUDENT_NEXT-OF-SKIN_STUDENT1_idx` (`studentNumber` ASC),
  CONSTRAINT `fk_STUDENT_NEXT-OF-SKIN_STUDENT1`
    FOREIGN KEY (`studentNumber`)
    REFERENCES `CourseWork`.`STUDENT` (`studentNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`LEASE_INVOICE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`LEASE_INVOICE` (
  `invoiceNumber` VARCHAR(45) NOT NULL,
  `leaseNumber` VARCHAR(45) NOT NULL,
  INDEX `fk_LEASE_INVOICE_INVOICE1_idx` (`invoiceNumber` ASC),
  INDEX `fk_LEASE_INVOICE_LEASE1_idx` (`leaseNumber` ASC),
  CONSTRAINT `fk_LEASE_INVOICE_INVOICE1`
    FOREIGN KEY (`invoiceNumber`)
    REFERENCES `CourseWork`.`INVOICE` (`invoiceNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LEASE_INVOICE_LEASE1`
    FOREIGN KEY (`leaseNumber`)
    REFERENCES `CourseWork`.`LEASE` (`leaseNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`HALL_OF_RESIDENCE_SINGLE_ROOM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`HALL_OF_RESIDENCE_SINGLE_ROOM` (
  `hallName` VARCHAR(45) NOT NULL,
  `placeNumber` VARCHAR(45) NOT NULL,
  INDEX `fk_HALL_OF_RESIDENCE_SINGLE_ROOM_HALL_OF_RESIDENCE1_idx` (`hallName` ASC),
  INDEX `fk_HALL_OF_RESIDENCE_SINGLE_ROOM_SINGLE_ROOM1_idx` (`placeNumber` ASC),
  CONSTRAINT `fk_HALL_OF_RESIDENCE_SINGLE_ROOM_HALL_OF_RESIDENCE1`
    FOREIGN KEY (`hallName`)
    REFERENCES `CourseWork`.`HALL_OF_RESIDENCE` (`hallName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HALL_OF_RESIDENCE_SINGLE_ROOM_SINGLE_ROOM1`
    FOREIGN KEY (`placeNumber`)
    REFERENCES `CourseWork`.`SINGLE_ROOM` (`placeNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`HALL_OF_RESIDENCE_ACCOMMODATION_STAFF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`HALL_OF_RESIDENCE_ACCOMMODATION_STAFF` (
  `hallName` VARCHAR(45) NOT NULL,
  `staffNumber` VARCHAR(45) NOT NULL,
  INDEX `fk_HALL_OF_RESIDENCE_ACCOMMODATION_STAFF_HALL_OF_RESIDENCE1_idx` (`hallName` ASC),
  INDEX `fk_HALL_OF_RESIDENCE_ACCOMMODATION_STAFF_STAFF1_idx` (`staffNumber` ASC),
  CONSTRAINT `fk_HALL_OF_RESIDENCE_ACCOMMODATION_STAFF_HALL_OF_RESIDENCE1`
    FOREIGN KEY (`hallName`)
    REFERENCES `CourseWork`.`HALL_OF_RESIDENCE` (`hallName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HALL_OF_RESIDENCE_ACCOMMODATION_STAFF_STAFF1`
    FOREIGN KEY (`staffNumber`)
    REFERENCES `CourseWork`.`STAFF` (`staffNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`STUDENT_FLAT_BEDROOM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STUDENT_FLAT_BEDROOM` (
  `placeNumber` VARCHAR(45) NOT NULL,
  `flatNumber` VARCHAR(45) NOT NULL,
  INDEX `fk_STUDENT_FLAT_BEDROOM_BEDROOM2_idx` (`placeNumber` ASC),
  INDEX `fk_STUDENT_FLAT_BEDROOM_STUDENT_FLAT2_idx` (`flatNumber` ASC),
  CONSTRAINT `fk_STUDENT_FLAT_BEDROOM_BEDROOM2`
    FOREIGN KEY (`placeNumber`)
    REFERENCES `CourseWork`.`BEDROOM` (`placeNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STUDENT_FLAT_BEDROOM_STUDENT_FLAT2`
    FOREIGN KEY (`flatNumber`)
    REFERENCES `CourseWork`.`STUDENT_FLAT` (`flatNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`STAFF_STUDENT_FLAT_INSPECTION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STAFF_STUDENT_FLAT_INSPECTION` (
  `staffNumber` VARCHAR(45) NOT NULL,
  `flatNumber` VARCHAR(45) NOT NULL,
  `dateOfInspection` DATETIME NULL,
  `isSatisfactory` VARCHAR(45) NULL,
  `comment` VARCHAR(45) NULL,
  INDEX `fk_STAFF_FLAT_INSPECTION_STAFF1_idx` (`staffNumber` ASC),
  INDEX `fk_STAFF_STUDENT_FLAT_INSPECTION_STUDENT_FLAT1_idx` (`flatNumber` ASC),
  CONSTRAINT `fk_STAFF_FLAT_INSPECTION_STAFF1`
    FOREIGN KEY (`staffNumber`)
    REFERENCES `CourseWork`.`STAFF` (`staffNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STAFF_STUDENT_FLAT_INSPECTION_STUDENT_FLAT1`
    FOREIGN KEY (`flatNumber`)
    REFERENCES `CourseWork`.`STUDENT_FLAT` (`flatNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`STUDENT_FLAT_BEDROOM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STUDENT_FLAT_BEDROOM` (
  `placeNumber` VARCHAR(45) NOT NULL,
  `flatNumber` VARCHAR(45) NOT NULL,
  INDEX `fk_STUDENT_FLAT_BEDROOM_BEDROOM2_idx` (`placeNumber` ASC),
  INDEX `fk_STUDENT_FLAT_BEDROOM_STUDENT_FLAT2_idx` (`flatNumber` ASC),
  CONSTRAINT `fk_STUDENT_FLAT_BEDROOM_BEDROOM2`
    FOREIGN KEY (`placeNumber`)
    REFERENCES `CourseWork`.`BEDROOM` (`placeNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STUDENT_FLAT_BEDROOM_STUDENT_FLAT2`
    FOREIGN KEY (`flatNumber`)
    REFERENCES `CourseWork`.`STUDENT_FLAT` (`flatNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseWork`.`STUDENT_FLAT_BEDROOM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CourseWork`.`STUDENT_FLAT_BEDROOM` (
  `placeNumber` VARCHAR(45) NOT NULL,
  `flatNumber` VARCHAR(45) NOT NULL,
  INDEX `fk_STUDENT_FLAT_BEDROOM_BEDROOM2_idx` (`placeNumber` ASC),
  INDEX `fk_STUDENT_FLAT_BEDROOM_STUDENT_FLAT2_idx` (`flatNumber` ASC),
  CONSTRAINT `fk_STUDENT_FLAT_BEDROOM_BEDROOM2`
    FOREIGN KEY (`placeNumber`)
    REFERENCES `CourseWork`.`BEDROOM` (`placeNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STUDENT_FLAT_BEDROOM_STUDENT_FLAT2`
    FOREIGN KEY (`flatNumber`)
    REFERENCES `CourseWork`.`STUDENT_FLAT` (`flatNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
