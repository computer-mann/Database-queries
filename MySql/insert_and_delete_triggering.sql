SELECT * FROM wiretrust.zaccountinginfo;
use wiretrust;
delimiter $$
create trigger trForAccountingData after insert on aspnetusers
for each row 
begin
insert into zaccountinginfo
 set 
 UserId=new.Id , DispatchedEscrows=0, PendingEscrows=0, CompletedEscrows=0, TotalEscrows=0, TrustSpent=0 ,TrustReceived=0, TrustBalance=0;
end$$

delimiter ;



/*////////////////////////////////////////////////////////////////////////////////*//*////////////////////////////////////////*/
delimiter $$
create trigger trForDeleteAccountData after delete on aspnetusers
for each row
begin
delete from zaccountinginfo where UserId = old.Id;
end$$
/*////////////////////////////////////////////////////////////////////////////////*//*////////////////////////////////////////*/




