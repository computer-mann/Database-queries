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
create trigger trForAddingBuyerCreatedEscrow after insert on zbuyercreated
for each row
begin
update zaccountinginfo
set 
DispatchedEscrows=DispatchedEscrows+1, 
TotalEscrows=TotalEscrows+1, TrustSpent=TrustSpent+new.AmountGHS where UserId=new.BuyerId;
end$$
/*////////////////////////////////////////////////////////////////////////////////*//*////////////////////////////////////////*/

/*////////////////////////////////////////////////////////////////////////////////*//*////////////////////////////////////////*/
delimiter $$
create trigger trForAddingSellerCreatedEscrow after insert on zsellercreated
for each row
begin
if new.BuyerId != null
  then 
	update zaccountinginfo
	set 
	PendingEscrows=PendingEscrows+1, 
	TotalEscrows=TotalEscrows+1 where UserId=new.BuyerId;
end if;
end$$
/*////////////////////////////////////////////////////////////////////////////////*//*////////////////////////////////////////*/


