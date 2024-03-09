select distinct l1.account_id
from loginfo l1 inner join loginfo l2
on l1.account_id = l2.account_id
where l1.ip_address <> l2.ip_address
and ((l2.login >= l1.login and l2.login <= l1.logout) or
(l1.login >= l2.login and l1.login <= l2.logout))