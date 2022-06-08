--created view for the it department to view student entrance details
CREATE VIEW vwGateEntryDetails AS
	SELECT gs.student_id,g.gate_no,g.gate_location,gs.enter_date,gs.enter_time
	FROM gate_student_tbl AS gs
	INNER JOIN gate_tbl AS g
	ON gs.gate_no=g.gate_no

select*from vwGateEntryDetails



--created view for the it department to view student wifi logging details
CREATE VIEW vwWifiDetails AS
	SELECT w.student_Id,w.wifi_un AS wifi_username,wl.log_date,wl.log_time
	FROM wifi_tbl AS w
	LEFT JOIN wifi_logging AS wl
	ON w.student_Id=wl.student_Id

select*from vwWifiDetails 



--created view for the it department to view student dle logging details
CREATE VIEW vwDleDetails AS
	SELECT d.student_Id,d.dle_un AS dle_username,dl.log_date,dl.log_time
	FROM dle_tbl AS d
	LEFT JOIN dle_logging AS dl
	ON d.student_Id=dl.student_Id

select*from vwDleDetails 



--created view for the registration department to view all the student details
CREATE VIEW vwStdDetails AS
	SELECT s.*,g.gdn_name AS guardian_name
	FROM student_tbl AS s
	INNER JOIN guardian_tbl AS g
	ON s.student_Id=g.student_Id
	

SELECT*FROM vwStdDetails




--created view for the exam department to view all the student exam details
CREATE VIEW vwStdExam AS
	SELECT s.student_Id,s.exam_Id,e.module_Id,s.attempt,e.exam_date,s.result
	FROM student_exam_tbl AS s
	INNER JOIN exam_tbl AS e
	ON s.exam_Id=e.exam_Id

SELECT*FROM vwStdExam




--created view for the examination department to view all the students who have failed the exams
CREATE VIEW vwFailedStd AS
	SELECT s.student_Id,s.attempt,e.module_Id,m.module_name,s.result
	FROM student_exam_tbl AS s
	JOIN exam_tbl AS e
	ON e.exam_Id=s.exam_Id
	JOIN module_tbl AS m
	ON e.module_Id=m.module_Id
	WHERE s.result='F'

	select*from vwFailedStd



--created view for the librarian to view membership details
CREATE VIEW vwMembershipDetails AS
	SELECT s.student_Id,s.f_name AS first_name,s.l_name AS last_name,l.membership_Id,l.enroll_date
	FROM student_tbl AS s
	RIGHT JOIN library_tbl AS l
	ON s.membership_Id=l.membership_Id
	

	select*from vwMembershipDetails 




--created view for the librarian to view issued book details
CREATE VIEW vwIssueBookDetails AS
	SELECT i.membership_Id,s.f_name AS first_name,s.l_name AS last_name,i.book_Id,b.book_name,i.issue_date,i.due_date
	FROM student_tbl AS s
	INNER JOIN book_issuing AS i
	ON s.membership_Id=i.membership_Id
	INNER JOIN book_tbl AS b
	ON i.book_Id=b.book_Id

SELECT * FROM vwIssueBookDetails



