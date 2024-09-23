select distinct t1.number as num1, t2.number as num2
from transportation_numbers t1 inner join transportation_numbers t2
on t1.number < t2.number and t1.number * t2.number > 11

;