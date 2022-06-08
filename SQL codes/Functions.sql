--created function for the IT department to get the attendance of a particular student
CREATE FUNCTION stdAttendance( @std_Id int)
RETURNS Table

AS

	RETURN 
	SELECT count(enter_date) AS Attendance_count 
	FROM gate_student_tbl 
	where student_Id = @std_Id AND gate_no = 1

	

select *from stdAttendance(1)


--created function for examination department to get exam details of a particular student
CREATE FUNCTION getModuleResult(@stdId int)
RETURNS TABLE
AS
	RETURN
	(
	SELECT m.module_name,e.attempt,e.result FROM student_exam_tbl AS e
	JOIN student_tbl AS s
	ON e.student_Id=s.student_Id
	JOIN exam_tbl AS ex
	ON e.exam_Id=ex.exam_Id
	JOIN module_tbl AS m
	ON m.module_Id=ex.module_Id
	WHERE e.student_Id=@stdId
	)

select*from getModuleResult(2)

--created function for examination department to get participated student count for a particular exam
CREATE FUNCTION getStdCountOfExam (@examId varchar(50))
RETURNS int
AS
BEGIN
DECLARE 
	@returnCount int;
	SELECT @returnCount=count(DISTINCT(student_Id))
	FROM student_exam_tbl
	WHERE exam_Id=@examId

	RETURN @returnCount;
END

select dbo.getStdCountOfExam ('csex01' ) 

--created function for the IT department to get number of students attend in a particular day
CREATE FUNCTION getStudentAttend(@eDate date)
RETURNS int
AS
BEGIN
	DECLARE
	@stdCount int;
	SELECT @stdCount=COUNT(DISTINCT(student_Id)) FROM gate_student_tbl
	WHERE gate_no=1 AND enter_date=@eDate;

	RETURN @stdCount
END

select dbo.getStudentAttend('2021/12/14')



