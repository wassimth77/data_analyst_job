/*
identify skills in heigh demand and associated with heigh average salaries
*/

with top_demanded as (
     select count(skills_job_dim.job_id) as demanded_skills,skills_dim.skill_id,skills_dim.skills
    from job_postings_fact INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
    where job_title_short='Data Analyst'
    GROUP BY skills_dim.skill_id
    
), paying_skills as (
    select AVG(salary_year_avg) as avg_salary_skill,skills_job_dim.skill_id
    from job_postings_fact INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
    where job_title_short='Data Analyst' AND salary_year_avg is NOT NULL
    GROUP BY skills_job_dim.skill_id
    
)

select skills,demanded_skills,avg_salary_skill
from top_demanded INNER join paying_skills ON top_demanded.skill_id=paying_skills.skill_id
WHERE  demanded_skills>10000
order by 
         avg_salary_skill DESC,
demanded_skills DESC
LIMIT 20
/*[
  {
    "skills": "azure",
    "demanded_skills": "10942",
    "avg_salary_skill": "105399.621865203762"
  },
  {
    "skills": "python",
    "demanded_skills": "57326",
    "avg_salary_skill": "101511.846673318614"
  },
  {
    "skills": "oracle",
    "demanded_skills": "10410",
    "avg_salary_skill": "100964.190417921687"
  },
  {
    "skills": "r",
    "demanded_skills": "30075",
    "avg_salary_skill": "98707.800763047530"
  },
  {
    "skills": "tableau",
    "demanded_skills": "46554",
    "avg_salary_skill": "97978.080173485533"
  },
  {
    "skills": "sql",
    "demanded_skills": "92628",
    "avg_salary_skill": "96435.332040119202"
  },
  {
    "skills": "sas",
    "demanded_skills": "14034",
    "avg_salary_skill": "93707.363179687500"
  },
  {
    "skills": "sas",
    "demanded_skills": "14034",
    "avg_salary_skill": "93707.363179687500"
  },
  {
    "skills": "sap",
    "demanded_skills": "11297",
    "avg_salary_skill": "92446.212559767760"
  },
  {
    "skills": "power bi",
    "demanded_skills": "39468",
    "avg_salary_skill": "92323.596881734914"
  },
  {
    "skills": "powerpoint",
    "demanded_skills": "13848",
    "avg_salary_skill": "88315.605245109733"
  },
  {
    "skills": "excel",
    "demanded_skills": "67031",
    "avg_salary_skill": "86418.902006532898"
  },
  {
    "skills": "word",
    "demanded_skills": "13591",
    "avg_salary_skill": "82940.755618477230"
  }
]
*/

