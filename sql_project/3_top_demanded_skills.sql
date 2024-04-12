/*
-join job posting to inner join table similar to query 2
-identify the top 5 in demanded skills for a DA 
-focus on all job posting 
why?
*/





select skills,count(skills_job_dim.job_id) as demanded_skills
from job_postings_fact INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
where job_title_short='Data Analyst'
GROUP BY skills
ORDER BY demanded_skills DESC
LIMIT 5



/*
with count_job_home as (SELECT skill_id , count(*) as job_home
from skills_job_dim INNER JOIN job_postings_fact
ON skills_job_dim.job_id=job_postings_fact.job_id
where job_work_from_home=TRUE and job_title_short='Data Analyst'
group by skill_id
)

select skills,count_job_home.skill_id,count_job_home.job_home
 FROM skills_dim INNER JOIN count_job_home
 ON skills_dim.skill_id=count_job_home.skill_id
 ORDER BY job_home DESC
 */
