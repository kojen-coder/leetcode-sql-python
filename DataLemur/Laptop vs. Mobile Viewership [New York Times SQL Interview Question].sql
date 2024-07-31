SELECT
sum(case when device_type = 'laptop' then 1 end) as laptop_views,
sum(case when device_type = 'tablet' or device_type = 'phone' then 1 end) as mobile_views
FROM viewership;