/*
question: what are top-paying data analust jobs?
-identify the top 10 highest-paying data analyses roles that are available remotely
-focus on job posting with specified salaries (removes null)
why? highlight the top-paying opportunities for DA,offering insights into employees
*/
select  job_title_short,
        salary_year_avg,
         name as company_name
from job_postings_fact LEFT JOIN  company_dim ON
     job_postings_fact.company_id=company_dim.company_id

WHERE job_title_short='Data Analyst' and 
    job_work_from_home=TRUE and 
    salary_year_avg IS NOT NULL

order by salary_year_avg DESC



