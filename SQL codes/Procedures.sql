--Create procedure to insert data to dle_logging table

CREATE PROCEDURE insertDleLogging(@stId int)
AS
	DECLARE @logDate DATE
	DECLARE @logTime TIME

BEGIN
	
	SET @logDate = GETDATE()
	SET @logTime = GETDATE()

	INSERT INTO dle_logging VALUES
	(@stId,@logDate,@logTime)

END

EXEC insertDleLogging 8






--Create procedure to insert data to wifi_logging table

CREATE PROCEDURE insertWifiLogging(@stId int)
AS
	DECLARE @logDate DATE
	DECLARE @logTime TIME

BEGIN
	
	SET @logDate = GETDATE()
	SET @logTime = GETDATE()

	INSERT INTO wifi_logging VALUES
	(@stId,@logDate,@logTime)

END

EXEC insertWifiLogging 8






--stored procedure for insert data to the dle table

CREATE PROCEDURE InsertDataDle
(
    @dle_un varchar(50),
	@student_Id int,
    @dle_pw varchar(50)
)
AS
BEGIN

    INSERT INTO dle_tbl (dle_un, student_Id, dle_pw) VALUES
	( @dle_un, @student_Id,HASHBYTES('SHA2_512',@dle_pw))

END

EXEC InsertDataDle 'wAmarasinghe',20,'waa123456789'






--stored procedure for insert data to the wifi table

CREATE PROCEDURE InsertDataWifi
(
    @wifi_un varchar(50),
	@student_Id int,
    @wifi_pw varchar(50)
)
AS
BEGIN

    INSERT INTO wifi_tbl (wifi_un, student_Id, wifi_pw) VALUES
	(@wifi_un, @student_Id,HASHBYTES('SHA2_512',@wifi_pw))
      
END

EXEC InsertDataWifi 'wifiyAmarasekara',2,'ay123456789'






--stored procedure for insert data to the student table

CREATE PROCEDURE insertDataStudent
(
	@f_name varchar(50),
	@l_name varchar(60),
	@dob date,
	@email varchar(100),
	@address varchar(150),
	@gender varchar(1),
	@fac_id varchar(25),
	@deg_id varchar(25)
)
AS
BEGIN

	INSERT INTO student_tbl 
	(f_name,l_name,DOB,email,std_address,gender,faculty_Id,deg_Id,deg_reg_date) 
	VALUES
	(@f_name,@l_name ,@dob ,@email ,@address ,@gender,@fac_id ,@deg_id ,GETDATE() );

END

EXEC insertDataStudent 'A','B','2000/12/8','DSF','SDFA','M','C1','E115'







--Create procedure to insert data to gate_student_tbl table

CREATE PROCEDURE insertGateStd
(
	@stId int,
	@gateNo int
)
AS
	DECLARE @enterDate DATE
	DECLARE @enterTime TIME

BEGIN
	
	SET @enterDate = GETDATE()
	SET @enterTime = GETDATE()

	INSERT INTO gate_student_tbl VALUES
	(@stId,@gateNo,@enterDate,@enterTime)

END

EXEC insertGateStd 16,2







--stored procedure for insert data to the book issunig table

CREATE PROCEDURE InsertDataBookIssuing
(
	@membership_id varchar(25),
	@bookId int
)
AS
BEGIN

	INSERT INTO book_issuing 
	VALUES
	(@membership_id,@bookId,GETDATE(),GETDATE()+30 );

END

EXEC InsertDataBookIssuing 'L18',10200




--stored procedure for insert data to the library table
CREATE PROCEDURE InsertDataLibrary
(
	@membership_id varchar(25)
)
AS
BEGIN

	INSERT INTO library_tbl 
	VALUES
	(@membership_id,GETDATE());

END

EXEC InsertDataLibrary 'L50'





--stored procedure for insert data to the book_tbl table

CREATE PROCEDURE insertBook
(
	@BookId int,
	@BookName varchar(100),
	@qty int
)
AS
BEGIN
	
	INSERT INTO book_tbl
	VALUES
	(@BookId,@BookName,@qty);

END

EXEC insertBook 1,'a',7

