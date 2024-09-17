with cte as(
    select "Android" as platform
    union
    select "IOS" as platform
    union
    select "Web" as platform
),
cte2 as(
    select "Reading" as experiment_name
    union
    select "Sports" as experiment_name
    union
    select "Programming" as experiment_name
)

select c1.*, c2.*,
count(e.experiment_id) as num_experiments
from cte c1 cross join cte2 c2
left join experiments e on
c1.platform = e.platform and c2.experiment_name = e.experiment_name
group by platform, experiment_name