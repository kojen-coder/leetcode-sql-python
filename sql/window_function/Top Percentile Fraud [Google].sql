WITH CTE AS(
select *,
PERCENT_RANK() over(partition by state order by fraud_score desc) PERCENT_RNK
from fraud_score)

SELECT policy_num, state, claim_cost, fraud_score
FROM CTE
WHERE PERCENT_RNK <= 0.05