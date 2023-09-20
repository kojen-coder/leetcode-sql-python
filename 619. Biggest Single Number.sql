select max(num) as num from
(select num from mynumbers group BY num Having Count(*) = 1) a