create database customer_churn;

use customer_churn;

-- Solve Problem bussiness questions

-- Total dataset
select * from churn;

-- Total_customers
select count(*) as Total_customers
from churn;

-- Gender,partnre imapct for churn 
select gender, partner, count(churn) as total_churn
from churn
-- where gender = 'Male'
group by gender,partner
order by total_churn desc;

-- Overall churn rate 
select 
count(*) as Total_customer,
sum(case when churn = 'Yes' then 1 else 0
     end) as churned,
round(sum(case when churn = 'Yes' then 1 else 0
      end) * 100.0 / count(*),2) as churn_rate
from churn;
     
-- if churn rate is high so serious of the bussiness problem but churn rate have not highies 

-- Q2 Tenure category vs churn
select 
     tenure_category,
     sum(case when churn = 'Yes' then 1 else 0
      end) as churned
from churn 
group by tenure_category
order by churned desc;

-- Contract vs churn
select 
   contract,
   count(*) total_customer,
   sum(case when churn  = 'Yes' then 1 else 0
     end) churned
from churn 
group by contract;

-- Monthaly charged vs churned
select
    case 
       when MonthlyCharges < 50 then 
	'LOW'
	   when MonthlyCharges < 100 then
    'MEDIUM'
        else  'HIGH'
	end as charge_group,
    count(*) as total_customer,
    sum(case 
        when churn = 'yes' then 1 else 0 
        end) as churned
from churn
group by charge_group
order by churned desc;

-- payment methode vs churn 
select 
     paymentmethod,
     count(*) as total_customer,
     sum(case 
           when churn = 'yes' then 1 else 0
           end) as churned
from churn
group by paymentmethod;
         
-- internet servise vs churn 
select 
    internetservice,
    count(*) as total_customer,
    sum(case
          when churn = 'yes'  then 1 else 0
		end) as churned
from churn 
group by internetservice;

-- high risk customer identify
select *
from churn 
where churn = 'yes'
and tenure <= 12 
and MonthlyCharges > 80;
     
