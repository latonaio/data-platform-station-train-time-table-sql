CREATE TABLE `data_platform_station_train_time_table_header_data`
(
  `Station`                      int(16) NOT NULL,
  `RailwayLine`                  int(16) NOT NULL,
  `TimeTableVersion`             int(4) NOT NULL,
  `WeekdayType`                  varchar(6) NOT NULL,
  `StationTrainTimeTableID`      int(4) NOT NULL,
  `ExpressType`                  varchar(4) NOT NULL,
  `DepartingTime`                time(16) NOT NULL,
  `ArrivingTime`                 time(16) DEFAULT NULL,
  `Description`                  varchar(60) NOT NULL,
  `OperationRemarks`             varchar(100) DEFAULT NULL,
  `ValidityStartDate`            date NOT NULL,
  `ValidityEndDate`              date NOT NULL,
  `CreationDate`                 date NOT NULL,
  `CreationTime`                 time NOT NULL,
  `LastChangeDate`               date NOT NULL,
  `LastChangeTime`               time NOT NULL,
  `CreateUser`                   int(12) NOT NULL,
  `LastChangeUser`               int(12) NOT NULL,
  `IsReleased`                   tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`          tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`Station`, `RailwayLine`, `TimeTableVersion`, `WeekdayType`, `StationTrainTimeTableID`, `ExpressType`),

    CONSTRAINT `DPFMStationTrainTimeTableHeaderData_fk` FOREIGN KEY (`Station`, `RailwayLine`) REFERENCES `data_platform_station_railway_line_data` (`Station`, `RailwayLine`),
    CONSTRAINT `DPFMStationTrainTimeTableHeaderDataWeekdayType_fk` FOREIGN KEY (`RailwayLine`, `WeekdayType`) REFERENCES `data_platform_railway_line_weekday_type_data` (`RailwayLine`, `WeekdayType`),
    CONSTRAINT `DPFMStationTrainTimeTableHeaderDataExpressType_fk` FOREIGN KEY (`RailwayLine`, `ExpressType`) REFERENCES `data_platform_railway_line_express_type_data` (`RailwayLine`, `ExpressType`),
    CONSTRAINT `DPFMStationTrainTimeTableHeaderDataCreateUser_fk` FOREIGN KEY (`CreateUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DPFMStationTrainTimeTableHeaderDataLastChangeUser_fk` FOREIGN KEY (`LastChangeUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
