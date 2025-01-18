# Query 1

SELECT tt.type AS Transaction_Type, SUM(at.amount) AS Total_Amount
FROM Account_Transaction at INNER JOIN Transaction_Type tt ON 
    at.type_id = tt.type_id
GROUP BY tt.type
ORDER BY Total_Amount DESC;

# Query 2 

SELECT lt.loan_name AS Loan_Type,SUM(lp.loan_amount) AS Total_Loan_Amount
FROM Loan_Payout lp INNER JOIN Loan_Type lt ON 
     lp.loan_id = lt.loan_id
GROUP BY lt.loan_name
HAVING SUM(lp.loan_amount) > 50000
ORDER BY Total_Loan_Amount DESC;

# Query 3

SELECT c.customer_id, c.first_name, c.last_name, a.street_name, z.city, ac.account_no, ac.start_balance 
FROM Customer c INNER JOIN Address a ON 
     c.customer_id = a.customer_id INNER JOIN Zipcode z ON 
     a.zipcode_no = z.zipcode_no INNER JOIN Account ac ON 
     c.customer_id = ac.customer_id
WHERE z.city LIKE 'N%' 
AND ac.account_type = 'Savings'
AND ac.start_balance > 500
ORDER BY ac.start_balance DESC;

# Query 4

SELECT concat(c.first_name,' ',c.last_name) AS Customer_Name, a.account_type, tt.type AS Transaction_Type, at.amount, at.account_transaction_date
FROM Account_Transaction at INNER JOIN Account a ON 
	 at.account_no = a.account_no INNER JOIN Customer c ON
     a.customer_id = c.customer_id INNER JOIN Transaction_Type tt ON 
     at.type_id = tt.type_id
ORDER BY at.account_transaction_date;

# Query 5 

SELECT a.account_no, a.account_type, c.overdraft_limit, s.interest_rate
FROM Account a LEFT JOIN Checking c ON 
     a.account_no = c.account_no LEFT JOIN Savings s ON 
     a.account_no = s.account_no
ORDER BY a.account_no;

# Query 6 

SELECT c1.customer_id,c1.last_name, c1.first_name, c1.referral_id, c2.last_name, c2.first_name
FROM Customer c1 LEFT JOIN Customer c2 ON
	c1.referral_id = c2.customer_id
WHERE c1.referral_id is Null 
Order by 2;