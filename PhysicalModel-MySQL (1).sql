--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      midterm_final-model.DM1
--
-- Date Created : Sunday, October 22, 2023 23:45:04
-- Target DBMS : MySQL 8.x
--

-- 
-- TABLE: BusinessDim 
--

CREATE TABLE BusinessDim(
    BusinessKey_sk           INTEGER         NOT NULL,
    BusinessId               VARCHAR(50)     NOT NULL,
    Name                     VARCHAR(255),
    Address                  VARCHAR(255),
    City                     VARCHAR(255),
    State                    VARCHAR(255),
    Zipcode                  VARCHAR(50),
    PhoneNumber              VARCHAR(50),
    Latitude                 VARCHAR(255),
    Longitude                VARCHAR(255),
    DI_CreatedDate           DATE,
    DI_WorkflowFileName      VARCHAR(255),
    DI_Workflow_ProcessID    VARCHAR(255),
    PRIMARY KEY (BusinessKey_sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: DateDim 
--

CREATE TABLE DateDim(
    DateKey                  INTEGER           NOT NULL,
    Date                     INTEGER           NOT NULL,
    Year                     INTEGER,
    Quarter                  INTEGER,
    Month                    INTEGER,
    Week                     INTEGER,
    Day                      VARCHAR(10),
    Weekend_Weekday          VARCHAR(10),
    DI_CreatedDate           DATE,
    DI_WorkflowFileName      VARCHAR(255),
    DI_Workflow_ProcessID    VARCHAR(50),
    PRIMARY KEY (DateKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: InspectionFact 
--

CREATE TABLE InspectionFact(
    InspectionFact_sk        INTEGER           NOT NULL,
    BusinessKey_sk           INTEGER           NOT NULL,
    DateKey                  INTEGER           NOT NULL,
    InspectionId             VARCHAR(50),
    InspectionType           VARCHAR(50),
    ViolationTotalScore      INTEGER,
    InspectionResult         VARCHAR(50),
    DI_WorkflowFileName      VARCHAR(255),
    DI_CreatedDate           DATE,
    DI_Workflow_ProcessID    VARCHAR(50),
    PRIMARY KEY (InspectionFact_sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: InspectionViolationFact 
--

CREATE TABLE InspectionViolationFact(
    InspectionViolationKey_sk    INT               NOT NULL,
    ViolationKey_sk              INTEGER           NOT NULL,
    InspectionFact_sk            INTEGER,
    DI_CreatedDate               DATE,
    DI_WorkfkowFileName          VARCHAR(255),
    DI_Workflow_ProcessID        VARCHAR(250),
    PRIMARY KEY (InspectionViolationKey_sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: ViolationDim 
--

CREATE TABLE ViolationDim(
    ViolationKey_sk          INTEGER         NOT NULL,
    ViolationCodes           VARCHAR(10),
    ViolationDescriptions    VARCHAR(255),
    ViolationCategory        VARCHAR(255),
    ViolationScore           INTEGER,
    DI_CreatedDate           DATE,
    DI_WorkflowFileName      VARCHAR(255),
    DI_Workflow_ProcessID    VARCHAR(50),
    PRIMARY KEY (ViolationKey_sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: InspectionFact 
--

ALTER TABLE InspectionFact ADD CONSTRAINT RefBusinessDim22 
    FOREIGN KEY (BusinessKey_sk)
    REFERENCES BusinessDim(BusinessKey_sk)
;

ALTER TABLE InspectionFact ADD CONSTRAINT RefDateDim23 
    FOREIGN KEY (DateKey)
    REFERENCES DateDim(DateKey)
;


-- 
-- TABLE: InspectionViolationFact 
--

ALTER TABLE InspectionViolationFact ADD CONSTRAINT RefInspectionFact47 
    FOREIGN KEY (InspectionFact_sk)
    REFERENCES InspectionFact(InspectionFact_sk)
;

ALTER TABLE InspectionViolationFact ADD CONSTRAINT RefViolationDim49 
    FOREIGN KEY (ViolationKey_sk)
    REFERENCES ViolationDim(ViolationKey_sk)
;


