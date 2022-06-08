--Created trigger to automaticlly decrease the book count when a book is issued
CREATE TRIGGER bookCountSubTrigger
ON book_issuing
AFTER INSERT
AS

DECLARE @bookId int

BEGIN
	
	SELECT @bookId=book_Id FROM inserted

     UPDATE book_tbl 
	 SET book_tbl.qty=book_tbl.qty-1
	 WHERE book_Id=@bookId

END


--Created trigger to automaticlly increase the book count when a book is returned back
CREATE TRIGGER bookCountAddTrigger
ON book_issuing
AFTER DELETE
AS

DECLARE @bookId int

BEGIN
	
	SELECT @bookId=book_Id FROM deleted

     UPDATE book_tbl 
	 SET book_tbl.qty=book_tbl.qty+1
	 WHERE book_Id=@bookId

END

