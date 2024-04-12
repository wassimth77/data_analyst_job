/*
-look at the average salary associated with each skill for DA positions
-focus on roles with specified salaries, regardless of location
-why?
*/

select DISTINCT skills,AVG(salary_year_avg) as avg_salary_skill
from job_postings_fact INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
where job_title_short='Data Analyst' AND salary_year_avg is NOT NULL
GROUP BY skills
order by avg_salary_skill DESC
limit 25
/*
[
  {
    "skills": "svn",
    "avg_salary_skill": "400000.000000000000"
  },
  {
    "skills": "solidity",
    "avg_salary_skill": "179000.000000000000"
  },
  {
    "skills": "couchbase",
    "avg_salary_skill": "160515.000000000000"
  },
  {
    "skills": "datarobot",
    "avg_salary_skill": "155485.500000000000"
  },
  {
    "skills": "golang",
    "avg_salary_skill": "155000.000000000000"
  },
  {
    "skills": "mxnet",
    "avg_salary_skill": "149000.000000000000"
  },
  {
    "skills": "dplyr",
    "avg_salary_skill": "147633.333333333333"
  },
  {
    "skills": "vmware",
    "avg_salary_skill": "147500.000000000000"
  },
  {
    "skills": "terraform",
    "avg_salary_skill": "146733.833333333333"
  },
  {
    "skills": "twilio",
    "avg_salary_skill": "138500.000000000000"
  },
  {
    "skills": "gitlab",
    "avg_salary_skill": "134126.000000000000"
  },
  {
    "skills": "kafka",
    "avg_salary_skill": "129999.162500000000"
  },
  {
    "skills": "puppet",
    "avg_salary_skill": "129820.000000000000"
  },
  {
    "skills": "keras",
    "avg_salary_skill": "127013.333333333333"
  },
  {
    "skills": "pytorch",
    "avg_salary_skill": "125226.200000000000"
  },
  {
    "skills": "perl",
    "avg_salary_skill": "124685.750000000000"
  },
  {
    "skills": "ansible",
    "avg_salary_skill": "124370.000000000000"
  },
  {
    "skills": "hugging face",
    "avg_salary_skill": "123950.000000000000"
  },
  {
    "skills": "tensorflow",
    "avg_salary_skill": "120646.833333333333"
  },
  {
    "skills": "cassandra",
    "avg_salary_skill": "118406.681818181818"
  },
  {
    "skills": "notion",
    "avg_salary_skill": "118091.666666666667"
  },
  {
    "skills": "atlassian",
    "avg_salary_skill": "117965.600000000000"
  },
  {
    "skills": "bitbucket",
    "avg_salary_skill": "116711.750000000000"
  },
  {
    "skills": "airflow",
    "avg_salary_skill": "116387.260563380282"
  },
  {
    "skills": "scala",
    "avg_salary_skill": "115479.533898305085"
  }
]
*/

