with sent_table as(
    select user_id_sender, user_id_receiver, date
    from fb_friend_requests
    where action = 'sent'
),
accept_table as(
    select user_id_sender, user_id_receiver, date
    from fb_friend_requests
    where action = 'accepted'
)

select s.date,
cast(count(a.user_id_receiver) as decimal) / count(s.user_id_sender) as percentage_acceptance
from sent_table s left join accept_table a
on s.user_id_sender=a.user_id_sender and s.user_id_receiver = a.user_id_receiver
group by s.date
;
