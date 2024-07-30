SELECT p.page_id
FROM pages p left join page_likes l on p.page_id = l.page_id
where l.page_id is null
order by p.page_id
;