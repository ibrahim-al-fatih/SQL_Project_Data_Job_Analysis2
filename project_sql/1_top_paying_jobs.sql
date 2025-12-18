/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst jobs?
- Focuses on job postings which specified salaries (remove NULLS)
- Why? Highlight the top-paying opportunities for data analyst, 
offering insights into employment market landscape
*/

SELECT
    jpf.job_id,
    company_dim.name AS company_name,
    jpf.salary_year_avg,
    jpf.job_title,
    jpf.job_location,
    jpf.job_schedule_type,
    jpf.job_posted_date::DATE
FROM
    job_postings_fact AS jpf
LEFT JOIN company_dim ON company_dim.company_id = jpf.company_id
WHERE
    jpf.salary_year_avg IS NOT NULL AND
    jpf.job_title_short = 'Data Analyst' AND
    jpf.job_location = 'Anywhere'
ORDER BY
    jpf.salary_year_avg DESC
LIMIT 10;