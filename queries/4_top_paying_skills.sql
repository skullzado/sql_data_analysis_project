/* 
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
Here’s a concise summary:

- Big Data and Cloud Expertise: High-paying skills like PySpark, Databricks, and GCP reflect the demand for managing and processing large-scale data in cloud environments.

- Automation and DevOps Tools: Skills in tools like DataRobot, Kubernetes, and Jenkins command premium salaries, highlighting the importance of automation, version control, and continuous integration in data workflows.

- Advanced Programming and Data Science: Proficiency in Python libraries (Pandas, Scikit-learn), programming languages (Scala, Swift), and AI tools like IBM Watson are highly valued for their role in sophisticated data analysis and machine learning tasks.
*/