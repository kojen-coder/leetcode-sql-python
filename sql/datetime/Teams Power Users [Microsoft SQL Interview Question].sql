SELECT
sender_id, count(*) as message_count
FROM messages
where date(sent_date) >= '08/01/2022' and date(sent_date) < '09/01/2022'
group by sender_id
order by message_count desc
limit 2;