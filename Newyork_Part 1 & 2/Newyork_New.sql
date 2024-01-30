/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Newyork.DM1
 *
 * Date Created : Sunday, June 18, 2023 22:59:51
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    DateSK                   int              NOT NULL,
    FullDateAK               date             NULL,
    DayNumberOfWeek          int              NULL,
    DayNameOfWeek            nvarchar(10)     NULL,
    DayNumberOfMonth         int              NULL,
    DayNumberOfYear          int              NULL,
    WeekNumberOfYear         int              NULL,
    MonthName                nvarchar(10)     NULL,
    MonthNumberOfYear        int              NULL,
    CalenderQuater           int              NULL,
    CalenderYear             smallint         NULL,
    DI_CreateDate            date             NULL,
    DI_WorkFlowDirecctory    nvarchar(256)    NULL,
    DI_WorkFlowFileName      nvarchar(256)    NULL,
    CONSTRAINT PK20 PRIMARY KEY NONCLUSTERED (DateSK)
)

go


IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Geo 
 */

CREATE TABLE Dim_Geo(
    AddressID               int              NOT NULL,
    Street                  nvarchar(30)     NULL,
    [Zip Code]              nvarchar(20)     NOT NULL,
    Boro                    nvarchar(20)     NULL,
    Latitude                nvarchar(10)     NULL,
    Logitude                nvarchar(10)     NULL,
    DI_CreateDate           date             NULL,
    DI_WorkFlowDirectory    nvarchar(256)    NULL,
    DI_WorkFlowFileName     nvarchar(256)    NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (AddressID)
)

go


IF OBJECT_ID('Dim_Geo') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Geo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Geo >>>'
go

/* 
 * TABLE: DIM_Grade 
 */

CREATE TABLE DIM_Grade(
    GradeSK                 varchar(10)      NOT NULL,
    Grade                   varchar(10)      NULL,
    DI_CreateDate           date             NULL,
    DI_WorkFlowDirectory    nvarchar(256)    NULL,
    DI_WorkFlowFileName     nvarchar(256)    NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (GradeSK)
)

go


IF OBJECT_ID('DIM_Grade') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Grade >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Grade >>>'
go

/* 
 * TABLE: Dim_Restaurant 
 */

CREATE TABLE Dim_Restaurant(
    RestaurantID            int              NOT NULL,
    Code                    nvarchar(30)     NULL,
    Name                    nvarchar(10)     NULL,
    Building_Name           nvarchar(10)     NULL,
    Phone                   nvarchar(10)     NULL,
    Cuisine_Discription     nvarchar(10)     NULL,
    CommunityID             int              NOT NULL,
    AddressID               int              NOT NULL,
    DI_CreateDate           date             NULL,
    DI_WorkFlowDirectory    nvarchar(256)    NULL,
    DI_WorkFlowFileName     nvarchar(256)    NULL,
    CONSTRAINT PK1_1 PRIMARY KEY NONCLUSTERED (RestaurantID)
)

go


IF OBJECT_ID('Dim_Restaurant') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Restaurant >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Restaurant >>>'
go

/* 
 * TABLE: Dim_Voilation 
 */

CREATE TABLE Dim_Voilation(
    VoilationSK              int              NOT NULL,
    Voilation_Code           int              NULL,
    Voilation_Description    nvarchar(50)     NULL,
    DI_CreateDate            date             NULL,
    DI_WorkFlowDirectory     nvarchar(256)    NULL,
    DI_WorkFlowFileName      nvarchar(256)    NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (VoilationSK)
)

go


IF OBJECT_ID('Dim_Voilation') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Voilation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Voilation >>>'
go

/* 
 * TABLE: [Dim-Community] 
 */

CREATE TABLE [Dim-Community](
    CommunityID             int              IDENTITY(1,1),
    Community_Board         int              NULL,
    Council_District        int              NULL,
    Census_Track            float            NULL,
    BIN                     float            NULL,
    BBL                     int              NULL,
    NTA                     int              NULL,
    DI_CreateDate           date             NULL,
    DI_WorkFlowDirectory    nvarchar(256)    NULL,
    DI_WorkflowFileName     nvarchar(256)    NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (CommunityID)
)

go


IF OBJECT_ID('Dim-Community') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim-Community >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim-Community >>>'
go

/* 
 * TABLE: Fact_InspectionReport 
 */

CREATE TABLE Fact_InspectionReport(
    InspectionReportID      int              NOT NULL,
    RestaurantID            int              NOT NULL,
    InspectionID            nvarchar(10)     NULL,
    Inspection_Type         nvarchar(50)     NOT NULL,
    Action                  nvarchar(50)     NULL,
    Score                   int              NULL,
    Crtical_Flag            nvarchar(20)     NULL,
    VoilationSK             int              NOT NULL,
    GradeDateSK             int              NOT NULL,
    InspectionDateSK        int              NOT NULL,
    GradeSK                 varchar(10)      NOT NULL,
    RecordDateSK            int              NOT NULL,
    DI_CreateDate           date             NULL,
    DI_WorkFlowFileName     nvarchar(256)    NULL,
    DI_WorkFlowDirectory    nvarchar(256)    NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (InspectionReportID)
)

go


IF OBJECT_ID('Fact_InspectionReport') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_InspectionReport >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_InspectionReport >>>'
go

/* 
 * TABLE: Dim_Restaurant 
 */

ALTER TABLE Dim_Restaurant ADD CONSTRAINT RefDim-Community1 
    FOREIGN KEY (CommunityID)
    REFERENCES [Dim-Community](CommunityID)
go

ALTER TABLE Dim_Restaurant ADD CONSTRAINT RefDim_Geo2 
    FOREIGN KEY (AddressID)
    REFERENCES Dim_Geo(AddressID)
go


/* 
 * TABLE: Fact_InspectionReport 
 */

ALTER TABLE Fact_InspectionReport ADD CONSTRAINT RefDim_Restaurant3 
    FOREIGN KEY (RestaurantID)
    REFERENCES Dim_Restaurant(RestaurantID)
go

ALTER TABLE Fact_InspectionReport ADD CONSTRAINT RefDim_Voilation4 
    FOREIGN KEY (VoilationSK)
    REFERENCES Dim_Voilation(VoilationSK)
go

ALTER TABLE Fact_InspectionReport ADD CONSTRAINT RefDim_Date5 
    FOREIGN KEY (GradeDateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE Fact_InspectionReport ADD CONSTRAINT RefDim_Date6 
    FOREIGN KEY (RecordDateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE Fact_InspectionReport ADD CONSTRAINT RefDim_Date7 
    FOREIGN KEY (InspectionDateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE Fact_InspectionReport ADD CONSTRAINT RefDIM_Grade8 
    FOREIGN KEY (GradeSK)
    REFERENCES DIM_Grade(GradeSK)
go


