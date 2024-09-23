select count(distinct company_id)
FROM
(
SELECT company_id
FROM job_listings
group by company_id, title, description
having count(*) > 1
)subquery;

