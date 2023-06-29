select * from job_data;
select * from email_events;
select * from events;
select * from users;

select ds, count(job_id) as jobs_per_day, sum(time_spent)/3600 as hours_spent 
from job_data 
where ds >='2020-11-01' and ds <='2020-11-30'
group by ds ;


select language, count(language) * 100.0/sum(count(language)) over() 
from job_data group by language;

select *,count(job_id) as count_number 
from job_data 
group by job_id 
having count(job_id) >1;

select week(occurred_at) as week , count(user_id) as user_engage 
from events group by week(occurred_at);

select distinct user_id,device,week(occurred_at) as a,count(device) over(partition by device) 
from events order by a,device;

select week(occurred_at) as week , count(device) over(partition by device) as device_engage  
from events group by week(occurred_at) order by week;

select distinct user_id, action, count(action) 
over(partition by action) as total_email_engaging_service 
from email_events order by user_id;
