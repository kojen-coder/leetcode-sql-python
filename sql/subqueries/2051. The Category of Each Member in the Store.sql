select a.member_id, a.name,
(case
    when a.conver_rate >= 80 then "Diamond"
    when a.conver_rate < 80 and a.conver_rate >= 50 then "Gold"
    when a.conver_rate < 50 then "Silver"
    else "Bronze"
end) as category

from(
    select m.member_id, m.name,
    (100* count(p.visit_id)) / count(v.visit_id) as conver_rate
    from members m left join visits v on m.member_id = v.member_id
    left join purchases p on v.visit_id = p.visit_id
    group by m.member_id
) a

