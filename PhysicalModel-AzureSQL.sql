/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      midterm_final-model.DM1
 *
 * Date Created : Sunday, October 22, 2023 21:58:39
 * Target DBMS : Microsoft Azure SQL DB
 */

/* 
 * TABLE: BusinessDim 
 */

CREATE TABLE BusinessDim(
    BusinessKey_sk           int             NOT NULL,
    BusinessId               varchar(18)     NOT NULL,
    Name                     varchar(255)    NULL,
    Address                  varchar(255)    NULL,
    City                     varchar(255)    NULL,
    State                    varchar(255)    NULL,
    Zipcode                  varchar(18)     NULL,
    PhoneNumber              varchar(20)     NULL,
    Latitude                 varchar(30)     NULL,
    Longitude                varchar(20)     NULL,
    DI_CreatedDate           date            NULL,
    DI_WorkflowFileName      varchar(10)     NULL,
    DI_Workflow_ProcessID    varchar(10)     NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (BusinessKey_sk)
)

go


IF OBJECT_ID('BusinessDim') IS NOT NULL
    PRINT '<<< CREATED TABLE BusinessDim >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE BusinessDim >>>'
go

/* 
 * TABLE: DateDim 
 */

CREATE TABLE DateDim(
    DateKey                  int             NOT NULL,
    CompleteDate             date            NULL,
    Date                     int             NOT NULL,
    Year                     int             NULL,
    Quarter                  int             NULL,
    Month                    int             NULL,
    Week                     int             NULL,
    Day                      varchar(10)     NULL,
    Weekend_Weekday          varchar(10)     NULL,
    DI_CreatedDate           date            NULL,
    DI_WorkflowFileName      varchar(255)    NULL,
    DI_Workflow_ProcessID    varchar(10)     NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (DateKey)
)

go


IF OBJECT_ID('DateDim') IS NOT NULL
    PRINT '<<< CREATED TABLE DateDim >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DateDim >>>'
go

/* 
 * TABLE: InspectionsFacts 
 */

CREATE TABLE InspectionsFacts(
   
    BusinessKey_sk           int               NOT NULL,
    DateKey                  int               NOT NULL,
    InspectionFact_sk        int               NOT NULL,
    InspectionId             varchar(10)       NULL,
    InspectionType           varchar(255)      NULL,
    ViolationTotalScore      int               NULL,
    InspectionResult         varchar(10)       NULL,
    DI_CreatedDate           date              NULL,
    DI_WorkflowFileName      char(255)         NULL,
    DI_Workflow_ProcessID    varchar(10)       NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (InspectionFact_sk)
)

go


IF OBJECT_ID('InspectionsFacts') IS NOT NULL
    PRINT '<<< CREATED TABLE InspectionsFacts >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE InspectionsFacts >>>'
go

/* 
 * TABLE: InspectionViolationFact 
 */

CREATE TABLE InspectionViolationFact(
    InspectionViolationKey_sk    int               NOT NULL,
    InspectionFact_sk            int          NOT NULL,
    ViolationKey_sk              int    NOT NULL,
    DI_CreatedDate               date              NULL,
    DI_WorkfkowFileName          char(255)         NULL,
    DI_Workflow_ProcessID        varchar(10)       NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (InspectionViolationKey_sk)
)

go


IF OBJECT_ID('InspectionViolationFact') IS NOT NULL
    PRINT '<<< CREATED TABLE InspectionViolationFact >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE InspectionViolationFact >>>'
go

/* 
 * TABLE: ViolationDim 
 */

CREATE TABLE ViolationDim(
    ViolationKey_sk             int        NOT NULL,
    ViolationId              varchar(10)     NOT NULL,
    ViolationCode            varchar(10)     NULL,
    ViolationDescription     varchar(255)    NULL,
    ViolationCategory        varchar(255)    NULL,
    ViolationScore           int             NULL,
    DI_CreatedDate           date            NULL,
    DI_WorkflowFileName      varchar(255)    NULL,
    DI_Workflow_ProcessID    varchar(10)     NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (ViolationKey_sk)
)

go


IF OBJECT_ID('ViolationDim') IS NOT NULL
    PRINT '<<< CREATED TABLE ViolationDim >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ViolationDim >>>'
go

/* 
 * TABLE: InspectionsFacts 
 */

ALTER TABLE InspectionsFacts ADD CONSTRAINT RefBusinessDim22 
    FOREIGN KEY (BusinessKey_sk)
    REFERENCES BusinessDim(BusinessKey_sk)
go

ALTER TABLE InspectionsFacts ADD CONSTRAINT RefDateDim23 
    FOREIGN KEY (DateKey)
    REFERENCES DateDim(DateKey)
go


/* 
 * TABLE: InspectionViolationFact 
 */

ALTER TABLE InspectionViolationFact ADD CONSTRAINT RefInspectionsFacts47 
    FOREIGN KEY (InspectionFact_sk)
    REFERENCES InspectionsFacts(InspectionFact_sk)
go

ALTER TABLE InspectionViolationFact ADD CONSTRAINT RefViolationDim49 
    FOREIGN KEY (ViolationKey_sk)
    REFERENCES ViolationDim(ViolationKey_sk)
go


