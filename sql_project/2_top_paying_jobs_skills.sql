/* 
question: what skills are required for the top paying DA jobs?
-use the top 10 heighest paying DA jobs from first query 
- add the specific skills required for this roles 
why?
*/
WITH top_paying_job as (
select  job_title_short,job_id,
        salary_year_avg,
         name as company_name
from job_postings_fact LEFT JOIN  company_dim ON
     job_postings_fact.company_id=company_dim.company_id

WHERE job_title_short='Data Analyst' and 
    job_work_from_home=TRUE and 
    salary_year_avg IS NOT NULL

order by salary_year_avg DESC
LIMIT 10


 )
 select skills as skills_name,top_paying_job.*
 FROM skills_dim INNER JOIN skills_job_dim ON
      skills_dim.skill_id=skills_job_dim.skill_id
    INNER JOIN top_paying_job ON skills_job_dim.job_id=top_paying_job.job_id
    order by top_paying_job.salary_year_avg DESC

/*
[
  {
    "skills_name": "sql",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "python",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "r",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "azure",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "databricks",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "aws",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "pandas",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "pyspark",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "jupyter",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "excel",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "tableau",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "power bi",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "powerpoint",
    "job_title_short": "Data Analyst",
    "job_id": 552322,
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "skills_name": "sql",
    "job_title_short": "Data Analyst",
    "job_id": 99305,
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "skills_name": "python",
    "job_title_short": "Data Analyst",
    "job_id": 99305,
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "skills_name": "r",
    "job_title_short": "Data Analyst",
    "job_id": 99305,
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "skills_name": "hadoop",
    "job_title_short": "Data Analyst",
    "job_id": 99305,
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "skills_name": "tableau",
    "job_title_short": "Data Analyst",
    "job_id": 99305,
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "skills_name": "sql",
    "job_title_short": "Data Analyst",
    "job_id": 1021647,
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers"
  },
  {
    "skills_name": "crystal",
    "job_title_short": "Data Analyst",
    "job_id": 1021647,
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers"
  },
  {
    "skills_name": "oracle",
    "job_title_short": "Data Analyst",
    "job_id": 1021647,
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers"
  },
  {
    "skills_name": "tableau",
    "job_title_short": "Data Analyst",
    "job_id": 1021647,
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers"
  },
  {
    "skills_name": "flow",
    "job_title_short": "Data Analyst",
    "job_id": 1021647,
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers"
  },
  {
    "skills_name": "sql",
    "job_title_short": "Data Analyst",
    "job_id": 168310,
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "python",
    "job_title_short": "Data Analyst",
    "job_id": 168310,
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "go",
    "job_title_short": "Data Analyst",
    "job_id": 168310,
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "snowflake",
    "job_title_short": "Data Analyst",
    "job_id": 168310,
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "pandas",
    "job_title_short": "Data Analyst",
    "job_id": 168310,
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "numpy",
    "job_title_short": "Data Analyst",
    "job_id": 168310,
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "excel",
    "job_title_short": "Data Analyst",
    "job_id": 168310,
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "tableau",
    "job_title_short": "Data Analyst",
    "job_id": 168310,
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "gitlab",
    "job_title_short": "Data Analyst",
    "job_id": 168310,
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "sql",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "python",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "azure",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "aws",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "oracle",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "snowflake",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "tableau",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "power bi",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "sap",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "jenkins",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "bitbucket",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "atlassian",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "jira",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "confluence",
    "job_title_short": "Data Analyst",
    "job_id": 731368,
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "skills_name": "sql",
    "job_title_short": "Data Analyst",
    "job_id": 310660,
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "skills_name": "python",
    "job_title_short": "Data Analyst",
    "job_id": 310660,
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "skills_name": "r",
    "job_title_short": "Data Analyst",
    "job_id": 310660,
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "skills_name": "git",
    "job_title_short": "Data Analyst",
    "job_id": 310660,
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "skills_name": "bitbucket",
    "job_title_short": "Data Analyst",
    "job_id": 310660,
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "skills_name": "atlassian",
    "job_title_short": "Data Analyst",
    "job_id": 310660,
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "skills_name": "jira",
    "job_title_short": "Data Analyst",
    "job_id": 310660,
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "skills_name": "confluence",
    "job_title_short": "Data Analyst",
    "job_id": 310660,
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "skills_name": "sql",
    "job_title_short": "Data Analyst",
    "job_id": 1749593,
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "python",
    "job_title_short": "Data Analyst",
    "job_id": 1749593,
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "go",
    "job_title_short": "Data Analyst",
    "job_id": 1749593,
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "snowflake",
    "job_title_short": "Data Analyst",
    "job_id": 1749593,
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "pandas",
    "job_title_short": "Data Analyst",
    "job_id": 1749593,
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "numpy",
    "job_title_short": "Data Analyst",
    "job_id": 1749593,
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "excel",
    "job_title_short": "Data Analyst",
    "job_id": 1749593,
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "tableau",
    "job_title_short": "Data Analyst",
    "job_id": 1749593,
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "gitlab",
    "job_title_short": "Data Analyst",
    "job_id": 1749593,
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "skills_name": "sql",
    "job_title_short": "Data Analyst",
    "job_id": 387860,
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology"
  },
  {
    "skills_name": "python",
    "job_title_short": "Data Analyst",
    "job_id": 387860,
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology"
  },
  {
    "skills_name": "r",
    "job_title_short": "Data Analyst",
    "job_id": 387860,
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology"
  }
]
*/
    
  


