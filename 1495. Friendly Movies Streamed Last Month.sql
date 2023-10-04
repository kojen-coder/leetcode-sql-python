select title from content
where kids_content = 'Y' and content_type = 'Movies' and content_id in
(select content_id from TVprogram where program_date between '2020-06-01' and '2020-06-30'
)