-- Database Created
CREATE DATABASE Customer_Sub;

-- Used Database Created
USE Customer_Sub;

-- Table Created
CREATE table Customer_Subscription (
	Customer_ID VARCHAR(50) Primary Key,
    Subscription_Category VARCHAR(50),
    Subscription_Plan VARCHAR(50),
    Monthly_Price DECIMAL (10,2),
    Signup_Date DATE,
    Status VARCHAR(50)
			);
            
-- Column Descriptions:

-- Customer_ID – Unique identifier for each customer
-- Subscription_Category – Type of service subscribed to (e.g., Music, Sports, Gaming)
-- Subscription_Plan – Pricing tier selected (Basic, Standard, Premium)
-- Monthly_Price – Monthly cost of the subscription
-- Signup_Date – Date the customer started the subscription
-- Status – Current subscription status (Active or Churned)

-- Analysis Questions:

-- 1. How many total customers are there?
		SELECT COUNT(*) AS Total_Customers
        FROM Customer_Subscription;
      
-- 2. How many customers are currently active?
		SELECT COUNT(*) Total_Customers
        FROM Customer_Subscription
        WHERE Status = 'Active';
        
-- 3. How many customers have churned?
		SELECT COUNT(*) Total_Customers
        FROM Customer_Subscription
        WHERE Status = 'Churned';
        
-- 4. How many customers are subscribed to each subscription plan (Basic, Standard, Premium)?
        SELECT Count(*) AS Total_Customers, Subscription_Plan
        FROM Customer_Subscription
        GROUP BY Subscription_Plan
        ORDER BY Total_Customers DESC;
        
-- 5. Which subscription plan has the highest number of active customers?
		SELECT Subscription_Plan, COUNT(*) AS Total_Customers
        FROM Customer_Subscription
        WHERE Status = 'Active'
        GROUP BY Subscription_Plan
        ORDER BY Total_Customers DESC
        Limit 1;
        
-- 6. How many customers are subscribed to each subscription category?
        SELECT Subscription_Category, Count(*) AS Total_Customers
        FROM Customer_Subscription
        GROUP BY Subscription_Category
        ORDER BY Total_Customers DESC;
        
-- 7. Which subscription category has the highest number of churned customers?
		SELECT Subscription_Category, Count(*) AS Total_Customers
        FROM Customer_Subscription
        WHERE Status = 'Churned'
        GROUP BY Subscription_Category
        ORDER BY Total_Customers DESC
        LIMIT 1;
        
-- 8. How does the average monthly subscription price vary by month across all three years?
		SELECT Month(Signup_Date) AS Month, ROUND(AVG(Monthly_Price),2) AS Average_Monthly_Subscription_Price
        FROM Customer_Subscription
        GROUP BY Month
        ORDER BY Month;
        
-- 9. Which subscription plan generates the highest estimated monthly revenue?
		SELECT Subscription_Plan, ROUND(SUM(Monthly_Price),2) AS Total_Revenue
        FROM Customer_Subscription
        GROUP BY Subscription_Plan
        ORDER BY Total_Revenue DESC;
        
-- 10. How many customers signed up in each year?
        SELECT Year(Signup_Date) AS Year, COUNT(*) AS Total_Customers
        FROM Customer_Subscription
        GROUP BY Year
        ORDER BY Total_Customers DESC;