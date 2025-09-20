SELECT * FROM Customers
SELECT * FROM Orders

select CustomerName,Product
from Customers as c
left join Orders as o
on c.CustomerID = o.CustomerID

