
-- a transaction
-- a rollback
-- commit means no more rollback =(

begin transaction;

delete Student where Id = 62;

select * from Student order by Id desc;

rollback transaction;

commit transaction;

