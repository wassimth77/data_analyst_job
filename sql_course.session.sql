SELECT  count(job_title_short) as nbr_tot,
case 
     whEN job_location='Anywhere' then 'remote'
    WHEN job_location='New York, NY' then 'locale'
    else 'onsite'
END AS location_categorie
from job_postings_fact
GROUP BY location_categorie
