-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema wiretrust
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wiretrust
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wiretrust` ;
USE `wiretrust` ;

-- -----------------------------------------------------
-- Table `wiretrust`.`__efmigrationshistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`__efmigrationshistory` (
  `MigrationId` VARCHAR(95) NOT NULL,
  `ProductVersion` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`MigrationId`))
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`aspnetroles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`aspnetroles` (
  `Id` VARCHAR(255)   NOT NULL,
  `Name` VARCHAR(256)   NULL DEFAULT NULL,
  `NormalizedName` VARCHAR(256)   NULL DEFAULT NULL,
  `ConcurrencyStamp` LONGTEXT   NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `RoleNameIndex` (`NormalizedName` ASC)  )
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`aspnetroleclaims`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`aspnetroleclaims` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `RoleId` VARCHAR(255)   NOT NULL,
  `ClaimType` LONGTEXT   NULL DEFAULT NULL,
  `ClaimValue` LONGTEXT   NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_AspNetRoleClaims_RoleId` (`RoleId` ASC)  ,
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId`
    FOREIGN KEY (`RoleId`)
    REFERENCES `wiretrust`.`aspnetroles` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`aspnetusers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`aspnetusers` (
  `Id` VARCHAR(255)   NOT NULL,
  `UserName` VARCHAR(256)   NULL DEFAULT NULL,
  `NormalizedUserName` VARCHAR(256)   NULL DEFAULT NULL,
  `Email` VARCHAR(256)   NULL DEFAULT NULL,
  `NormalizedEmail` VARCHAR(256)   NULL DEFAULT NULL,
  `EmailConfirmed` TINYINT(1) NOT NULL,
  `PasswordHash` LONGTEXT   NULL DEFAULT NULL,
  `SecurityStamp` LONGTEXT   NULL DEFAULT NULL,
  `ConcurrencyStamp` LONGTEXT   NULL DEFAULT NULL,
  `PhoneNumber` LONGTEXT   NULL DEFAULT NULL,
  `PhoneNumberConfirmed` TINYINT(1) NOT NULL,
  `TwoFactorEnabled` TINYINT(1) NOT NULL,
  `LockoutEnd` DATETIME(6) NULL DEFAULT NULL,
  `LockoutEnabled` TINYINT(1) NOT NULL,
  `AccessFailedCount` INT(11) NOT NULL,
  `FullName` VARCHAR(50)   NULL DEFAULT NULL,
  `Image` VARCHAR(100)   NULL DEFAULT NULL,
  `DateOfRegistration` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `UserNameIndex` (`NormalizedUserName` ASC)  ,
  INDEX `EmailIndex` (`NormalizedEmail` ASC)  ,
  INDEX `IX_AspNetUsers_UserName` (`UserName` ASC)  )
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`aspnetuserclaims`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`aspnetuserclaims` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `UserId` VARCHAR(255)   NOT NULL,
  `ClaimType` LONGTEXT   NULL DEFAULT NULL,
  `ClaimValue` LONGTEXT   NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_AspNetUserClaims_UserId` (`UserId` ASC)  ,
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`aspnetuserlogins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`aspnetuserlogins` (
  `LoginProvider` VARCHAR(255)   NOT NULL,
  `ProviderKey` VARCHAR(255)   NOT NULL,
  `ProviderDisplayName` LONGTEXT   NULL DEFAULT NULL,
  `UserId` VARCHAR(255)   NOT NULL,
  PRIMARY KEY (`LoginProvider`, `ProviderKey`),
  INDEX `IX_AspNetUserLogins_UserId` (`UserId` ASC)  ,
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`aspnetuserroles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`aspnetuserroles` (
  `UserId` VARCHAR(255)   NOT NULL,
  `RoleId` VARCHAR(255)   NOT NULL,
  PRIMARY KEY (`UserId`, `RoleId`),
  INDEX `IX_AspNetUserRoles_RoleId` (`RoleId` ASC)  ,
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId`
    FOREIGN KEY (`RoleId`)
    REFERENCES `wiretrust`.`aspnetroles` (`Id`)
    ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`aspnetusertokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`aspnetusertokens` (
  `UserId` VARCHAR(255)   NOT NULL,
  `LoginProvider` VARCHAR(255)   NOT NULL,
  `Name` VARCHAR(255)   NOT NULL,
  `Value` LONGTEXT   NULL DEFAULT NULL,
  PRIMARY KEY (`UserId`, `LoginProvider`, `Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zaccountinginfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zaccountinginfo` (
  `UserId` VARCHAR(255)   NOT NULL,
  `DispatchedEscrows` INT(11) NOT NULL,
  `PendingEscrows` INT(11) NOT NULL,
  `CompletedEscrows` INT(11) NOT NULL,
  `TotalEscrows` INT(11) NOT NULL,
  `TrustSpent` DOUBLE NOT NULL,
  `TrustReceived` DOUBLE NOT NULL,
  `TrustBalance` DOUBLE NOT NULL,
  `Timestamp` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`UserId`),
  INDEX `IX_zAccountingInfo_UserId` (`UserId` ASC)  ,
  CONSTRAINT `FK_zAccountingInfo_AspNetUsers_UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zattachments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zattachments` (
  `EscrowId` VARCHAR(256)   NULL DEFAULT NULL,
  `ImageUrl` VARCHAR(100)   NULL DEFAULT NULL,
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`),
  INDEX `IX_zAttachments_EscrowId` (`EscrowId` ASC)  )
ENGINE = InnoDB
AUTO_INCREMENT = 41
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zbuyercreated`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zbuyercreated` (
  `Id` VARCHAR(255)   NOT NULL,
  `BuyerId` VARCHAR(255)   NOT NULL,
  `SellerId` VARCHAR(255)   NULL DEFAULT NULL,
  `Accepted` TINYINT(1) NOT NULL,
  `AmountGHS` DOUBLE NOT NULL,
  `EscrowName` VARCHAR(25)   NOT NULL,
  `EscrowPurpose` VARCHAR(25)   NOT NULL,
  `EscrowDetails` VARCHAR(1000)   NOT NULL,
  `DateCreated` DATETIME(6) NOT NULL,
  `DateAccepted` DATETIME(6) NULL DEFAULT NULL,
  `DatePaid` DATETIME(6) NULL DEFAULT NULL,
  `Status` VARCHAR(25)   NULL DEFAULT NULL,
  `Timestamp` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  INDEX `IX_zBuyerCreated_BuyerId` (`BuyerId` ASC)  ,
  INDEX `IX_zBuyerCreated_SellerId` (`SellerId` ASC)  ,
  CONSTRAINT `FK_zBuyerCreated_AspNetUsers_BuyerId`
    FOREIGN KEY (`BuyerId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE CASCADE,
  CONSTRAINT `FK_zBuyerCreated_AspNetUsers_SellerId`
    FOREIGN KEY (`SellerId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE RESTRICT)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zdisputedescrows`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zdisputedescrows` (
  `Id` VARCHAR(255)   NOT NULL,
  `EscrowId` LONGTEXT   NOT NULL,
  `EscrowLocation` VARCHAR(50)   NOT NULL,
  `InitiatorId` VARCHAR(255)   NOT NULL,
  `AccusedId` VARCHAR(255)   NOT NULL,
  `Reason` VARCHAR(1000)   NOT NULL,
  `Status` VARCHAR(25)   NOT NULL,
  `ActionRequired` VARCHAR(30)   NULL DEFAULT NULL,
  `Timestamp` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  INDEX `IX_zDisputedEscrows_AccusedId` (`AccusedId` ASC)  ,
  INDEX `IX_zDisputedEscrows_InitiatorId` (`InitiatorId` ASC)  ,
  CONSTRAINT `FK_zDisputedEscrows_AspNetUsers_AccusedId`
    FOREIGN KEY (`AccusedId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE CASCADE,
  CONSTRAINT `FK_zDisputedEscrows_AspNetUsers_InitiatorId`
    FOREIGN KEY (`InitiatorId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zincomingrequests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zincomingrequests` (
  `Id` VARCHAR(255)   NOT NULL,
  `EscrowId` VARCHAR(256)   NOT NULL,
  `SenderId` VARCHAR(255)   NULL DEFAULT NULL,
  `EscrowLocation` VARCHAR(50)   NULL DEFAULT NULL,
  `ReceiverId` VARCHAR(255)   NOT NULL,
  `Status` TINYINT(1) NOT NULL,
  `Timestamp` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  INDEX `IX_zIncomingRequests_ReceiverId` (`ReceiverId` ASC)  ,
  INDEX `IX_zIncomingRequests_SenderId` (`SenderId` ASC)  ,
  CONSTRAINT `FK_zIncomingRequests_AspNetUsers_ReceiverId`
    FOREIGN KEY (`ReceiverId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE CASCADE,
  CONSTRAINT `FK_zIncomingRequests_AspNetUsers_SenderId`
    FOREIGN KEY (`SenderId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE RESTRICT)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zinvitation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zinvitation` (
  `Id` VARCHAR(255)   NOT NULL,
  `Email` VARCHAR(256)   NULL DEFAULT NULL,
  `EscrowId` VARCHAR(256)   NULL DEFAULT NULL,
  `EscrowLocation` VARCHAR(25)   NULL DEFAULT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zloadwalletinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zloadwalletinfo` (
  `Id` VARCHAR(255)   NOT NULL,
  `UserId` VARCHAR(255)   NULL DEFAULT NULL,
  `Source` VARCHAR(50)   NULL DEFAULT NULL,
  `Amount` DOUBLE NOT NULL,
  `Date` DATETIME(6) NOT NULL,
  `NameOnAccount` VARCHAR(60)   NULL DEFAULT NULL,
  `PhoneOrAccountNumber` VARCHAR(15)   NULL DEFAULT NULL,
  `Timestamp` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  INDEX `IX_zLoadWalletInfo_UserId` (`UserId` ASC)  ,
  CONSTRAINT `FK_zLoadWalletInfo_AspNetUsers_UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE RESTRICT)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zsellercreated`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zsellercreated` (
  `Id` VARCHAR(255)   NOT NULL,
  `UniqueEscrowCode` VARCHAR(15)   NOT NULL,
  `SellerId` VARCHAR(255)   NOT NULL,
  `BuyerId` VARCHAR(255)   NULL DEFAULT NULL,
  `AmountGHS` DOUBLE NOT NULL,
  `Purpose` VARCHAR(50)   NULL DEFAULT NULL,
  `EscrowName` VARCHAR(50)   NOT NULL,
  `EscrowType` VARCHAR(50)   NOT NULL,
  `EscrowDetails` VARCHAR(1000)   NOT NULL,
  `DateCreated` DATETIME(6) NOT NULL,
  `DateAccepted` DATETIME(6) NULL DEFAULT NULL,
  `DatePaid` DATETIME(6) NULL DEFAULT NULL,
  `Status` VARCHAR(25)   NULL DEFAULT NULL,
  `Timestamp` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  INDEX `IX_zSellerCreated_BuyerId` (`BuyerId` ASC)  ,
  INDEX `IX_zSellerCreated_SellerId` (`SellerId` ASC)  ,
  CONSTRAINT `FK_zSellerCreated_AspNetUsers_BuyerId`
    FOREIGN KEY (`BuyerId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE RESTRICT,
  CONSTRAINT `FK_zSellerCreated_AspNetUsers_SellerId`
    FOREIGN KEY (`SellerId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zonetomanybuyers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zonetomanybuyers` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `BuyerId` VARCHAR(255)   NULL DEFAULT NULL,
  `SellerCreatedId` VARCHAR(255)   NULL DEFAULT NULL,
  `DateAccepted` DATETIME(6) NULL DEFAULT NULL,
  `DatePaid` DATETIME(6) NULL DEFAULT NULL,
  `Timestamp` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  INDEX `IX_zOneToManyBuyers_BuyerId` (`BuyerId` ASC)  ,
  INDEX `IX_zOneToManyBuyers_SellerCreatedId` (`SellerCreatedId` ASC)  ,
  CONSTRAINT `FK_zOneToManyBuyers_AspNetUsers_BuyerId`
    FOREIGN KEY (`BuyerId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE RESTRICT,
  CONSTRAINT `FK_zOneToManyBuyers_zSellerCreated_SellerCreatedId`
    FOREIGN KEY (`SellerCreatedId`)
    REFERENCES `wiretrust`.`zsellercreated` (`Id`)
    ON DELETE RESTRICT)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zonetomanyescrows`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zonetomanyescrows` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `SellerCreatedEscrowId` VARCHAR(255)   NOT NULL,
  `Code` VARCHAR(50)   NOT NULL,
  `Status` VARCHAR(50)   NULL DEFAULT NULL,
  `Timestamp` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  INDEX `IX_zOneToManyEscrows_Code` (`Code` ASC)  ,
  INDEX `IX_zOneToManyEscrows_SellerCreatedEscrowId` (`SellerCreatedEscrowId` ASC)  ,
  CONSTRAINT `FK_zOneToManyEscrows_zSellerCreated_SellerCreatedEscrowId`
    FOREIGN KEY (`SellerCreatedEscrowId`)
    REFERENCES `wiretrust`.`zsellercreated` (`Id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zpaystackwebhook`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zpaystackwebhook` (
  `Id` VARCHAR(255)   NOT NULL,
  `EscrowId` VARCHAR(256)   NULL DEFAULT NULL,
  `Reference` VARCHAR(256)   NULL DEFAULT NULL,
  `Email` VARCHAR(256)   NULL DEFAULT NULL,
  `Amount` DOUBLE NOT NULL,
  `Timestamp` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zusertransactiondata`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zusertransactiondata` (
  `Id` VARCHAR(255)   NOT NULL,
  `Timestamp` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
 
 ;


-- -----------------------------------------------------
-- Table `wiretrust`.`zwithdrawalinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiretrust`.`zwithdrawalinfo` (
  `Id` VARCHAR(255)   NOT NULL,
  `UserId` VARCHAR(255)   NULL DEFAULT NULL,
  `Source` VARCHAR(20)   NULL DEFAULT NULL,
  `Amount` DOUBLE NOT NULL,
  `Date` DATETIME(6) NOT NULL,
  `NameOnAccount` VARCHAR(100)   NULL DEFAULT NULL,
  `PhoneOrAccountNumber` VARCHAR(20)   NULL DEFAULT NULL,
  `Disbursed` TINYINT(1) NOT NULL,
  `BalanceAtWithdrawal` DOUBLE NOT NULL,
  `Timestamp` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  INDEX `IX_zWithdrawalInfo_UserId` (`UserId` ASC)  ,
  CONSTRAINT `FK_zWithdrawalInfo_AspNetUsers_UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `wiretrust`.`aspnetusers` (`Id`)
    ON DELETE RESTRICT)
ENGINE = InnoDB
 
 ;

USE `wiretrust`;

DELIMITER $$
USE `wiretrust`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `wiretrust`.`trForAccountingData`
AFTER INSERT ON `wiretrust`.`aspnetusers`
FOR EACH ROW
begin
insert into zaccountinginfo
 set 
 UserId=new.Id , DispatchedEscrows=0, PendingEscrows=0, CompletedEscrows=0, TotalEscrows=0, TrustSpent=0 ,TrustReceived=0, TrustBalance=0;
end$$

USE `wiretrust`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `wiretrust`.`trForDeleteAccountData`
AFTER DELETE ON `wiretrust`.`aspnetusers`
FOR EACH ROW
begin
delete from zaccountinginfo where UserId = old.Id;
end$$

USE `wiretrust`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `wiretrust`.`trForAddingBuyerCreatedEscrow`
AFTER INSERT ON `wiretrust`.`zbuyercreated`
FOR EACH ROW
begin
update zaccountinginfo
set 
DispatchedEscrows=DispatchedEscrows+1, 
TotalEscrows=TotalEscrows+1, TrustSpent=TrustSpent+new.AmountGHS where UserId=new.BuyerId;

 update zaccountinginfo set  TotalEscrows=TotalEscrows+1,PendingEscrows=PendingEscrows+1 where UserId=new.SellerId;
end$$

USE `wiretrust`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `wiretrust`.`trForAddingSellerCreatedEscrow`
AFTER INSERT ON `wiretrust`.`zsellercreated`
FOR EACH ROW
begin
if new.BuyerId is not null 
  then 
	update zaccountinginfo
	set 
	DispatchedEscrows=DispatchedEscrows+1, 
	TotalEscrows=TotalEscrows+1 where UserId=new.SellerId;
    
    update zaccountinginfo set  TotalEscrows=TotalEscrows+1,PendingEscrows=PendingEscrows+1 where UserId=new.BuyerId;
end if;
end$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
