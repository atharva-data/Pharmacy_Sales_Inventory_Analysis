-- SQL Tasks 
-- •	Calculate total medicine sales.  
-- •	Find the top 10 best-selling medicines.  
-- •	Calculate monthly sales revenue.  
-- •	Find medicines that are out of stock.  
-- •	Identify medicines nearing expiry.  
-- •	Calculate supplier-wise purchase quantity.  
-- •	Find average selling price by category.  
-- •	Rank medicines by total sales.  
-- •	Calculate category-wise revenue.  
-- •	Find the most profitable medicine category.  
desc pharmacy ;


-- •	Calculate total medicine sales. 
select sum(Quantity_sold)as Total_Medicine_Sales
from pharmacy;

-- •	Find the top 10 best-selling medicines.  
select Medicine_Name ,
sum(Quantity_sold) as Total_Sales 
from pharmacy 
group by Medicine_name 
order by Total_Sales desc 
limit 10 ;

-- •	Calculate monthly sales revenue. 
select year (Sale_Date) as year ,
month(Sale_Date) as month ,
sum(Revenue) as Monthly_Revenue
from pharmacy 
group by 
year(Sale_Date),
month(Sale_Date) 
order by 
year ,
month ;

-- •	Find medicines that are out of stock. 
select Medicine_Name , Stock_Quantity 
from pharmacy 
where Stock_Quantity=0;

-- 	Identify medicines nearing expiry. 
select Medicine_Name , Expiry_Date 
from pharmacy 
where Expiry_Date Between curdate() 
and date_add(curdate(),interval 30 day);

-- •	Calculate supplier-wise purchase quantity.
select Supplier_Name ,
sum(Purchase_Quantity) as Total_Purchase_Quantity
from pharmacy 
group by Supplier_Name ;

-- •	Find average selling price by category.  
select  Category ,
avg(Selling_Price) as Average_Selling_Price 
from pharmacy 
group by Category ;

-- •	Rank medicines by total sales. 
select Medicine_Name,
sum(Revenue) as Total_Sales ,
rank() over ( order by Sum(Revenue) desc)
as Sales_Rank
from pharmacy 
group by Medicine_Name ;

-- •	Calculate category-wise revenue.  
select Category ,
sum(Revenue) As Total_Revenue 
from pharmacy 
group by Category 
order by Total_Revenue desc ;

-- •	Find the most profitable medicine category. 
select Category ,
sum(Revenue) as Total_Revenue 
from pharmacy 
group by Category 
order by Total_Revenue desc 
limit 1 ;






















