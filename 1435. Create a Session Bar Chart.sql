(select "[0-5>" as bin, count(*) as total
from sessions where duration < 5*60)
UNION
(select "[5-10>" as bin, count(*) as total
from sessions where duration > 5*60 and duration < 10*60)
UNION
(select "[10-15>"  as bin, count(*) as total
from sessions where duration >= 10*60 and duration < 15*60)
UNION
(select "15 or more" as bin, count(*) as total
from sessions where duration > 15*60)
