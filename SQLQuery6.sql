--------------1-----------

select SalPIDetail.ItemID, CmnItemMaster.ItemName, sum(Amount)/sum(Quantity) as AveragePriceForEachItem 
from SalPIDetail
INNER JOIN  CmnItemMaster
on SalPIDetail.ItemID= CmnItemMaster.ItemID
group by CmnItemMaster.ItemName,SalPIDetail.ItemID;


------------2--------



select SalPIDetail.ItemID,  sum(Amount)/sum(Quantity) as AveragePriceForEachMonth ,
--DateFormat(SalPIDetail.CreateOn,'%Y-%m') as yearandmonth
DATEPART (year,SalPIDetail.CreateOn) as yr,
DATEPART(month,SalPIDetail.CreateOn) as mnth,SalPIDetail.CreateOn
from SalPIdetail
inner join CmnItemMaster
on SalPIDetail.ItemID= CmnItemMaster.ItemID
group by CmnItemMaster.ItemName, SalPIDetail.CreateOn,SalPIDetail.ItemID;

------------3------

select SalPIDetail.ItemID, CmnItemMaster.ItemName, max(amount) as MaximumPrice, min(Amount) as MinimumPrice
from SalPIDetail
inner join CmnItemMaster
on SalPIDetail.ItemID=CmnItemMaster.ItemID
group by CmnItemMaster.ItemName, SalPIDetail.ItemID





---------------4-------------


select SalPIDetail.ItemID,  max(Amount)   as MostExpensiveItem,
--DateFormat(SalPIDetail.CreateOn,'%Y-%m') as yearandmonth
DATEPART (year,SalPIDetail.CreateOn) as yr,
DATEPART(month,SalPIDetail.CreateOn) as mnth, SalPIDetail.CreateOn
from SalPIDetail

inner join CmnItemMaster
on SalPIDetail.ItemID= CmnItemMaster.ItemID
group by CmnItemMaster.ItemName, SalPIDetail.ItemID,SalPIDetail.CreateOn;


---------------5----------------

select CmnUser.UserFullName, 
min(SalPIDetail.UnitPrice)   as LeastExpensiveItem
from CmnUser
inner join SalPIMaster
on CmnUser.UserID=SalPIMaster.BuyerID
inner join SalPIDetail
on SalPIMaster.PIID=SalPIDetail.PIID
group by CmnUser.UserFullName



---------------6----------------

select SalPIDetail.ItemID,  Amount/.[count] as AveragePriceOfEachCount
from SalPIDetail
inner join CmnItemMaster
on SalPIDetail.ItemID= CmnItemMaster.ItemID
inner join SalPIMaster
on SalPIMaster.PIID= SalPIDetail.PIID
where CreateOn BETWEEN '2021-01-01 21:00:00' AND '2022-12-31 00:00:00'
group by CmnItemMaster.ItemName, SalPIDetail.ItemID, SalPIMaster.PIID, SalPIDetail.CreateOn;

----------------7----------------



 select  top 1
 SalPIMaster.BuyerID ,  
 sum(SalPIDetail.Amount) as MaximumAmount,
 year(SalPIMaster.PIDate) as yr
 from SalPIMaster
 inner join SalPIDetail
 on SalPIMaster.PIID= SalPIDetail.PIID
 where SalPIMaster.PIDate BETWEEN '2021-01-01 21:00:00' AND '2022-12-31 00:00:00'
 group by SalPIMaster.BuyerID, year (SalPIMaster.PIDate)
 order by  MaximumAmount desc;
 



 ---------------8----------------
 select top 10
  SalPIMaster.BuyerID,  
 sum(SalPIDetail.Quantity) as MaximumQuantity
  from SalPIMaster
  inner join SalPIDetail
  on SalPIMaster.PIID=SalPIDetail.PIID
  group by SalPIMaster.BuyerID
  order by MaximumQuantity desc;


------------9-----------


select top 10
  SalPIMaster.BuyerID,  
 sum(SalPIDetail.Amount) as MaximumAmount
  from SalPIMaster
  inner join SalPIDetail
  on SalPIMaster.PIID=SalPIDetail.PIID
  group by SalPIMaster.BuyerID
  order by MaximumAmount desc;


  -----------10----------------





  --------------11-------------

select SalPIDetail.ItemID, CmnItemMaster.ItemName, sum(Amount)*85 as ExpensiveItemsfor$85
from SalPIDetail
inner join CmnItemMaster
on SalPIDetail.ItemID= CmnItemMaster.ItemID
 where SalPIDetail.CreateOn BETWEEN '2021-01-01 21:00:00' AND '2022-03-01 00:00:00' 
group by CmnItemMaster.ItemName,SalPIDetail.ItemID
order by ExpensiveItemsfor$85 desc;


select SalPIDetail.ItemID, CmnItemMaster.ItemName, sum(Amount)*100 as ExpensiveItemsfor$100
from SalPIDetail
inner join CmnItemMaster
on SalPIDetail.ItemID= CmnItemMaster.ItemID
 where SalPIDetail.CreateOn BETWEEN '2022-04-01 21:00:00' AND '2022-12-31 00:00:00'
group by CmnItemMaster.ItemName,SalPIDetail.ItemID
order by ExpensiveItemsfor$100 desc;


sum ()



-----------------12---------------






