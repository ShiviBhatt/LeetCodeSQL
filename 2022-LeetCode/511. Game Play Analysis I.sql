select x.player_id, x.event_date as first_login
from 
(
    select player_id, event_date, 
    rank() over ( partition by player_id 
                 order by event_date ) as rn
    from activity
) x
where x.rn = 1



OTHER SOLUTION


select player_id, min(event_date) as first_login from activity group by player_id
