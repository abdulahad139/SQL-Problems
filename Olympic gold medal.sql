USE practice
CREATE TABLE events (
ID int,
event varchar(255),
YEAR INt,
GOLD varchar(255),
SILVER varchar(255),
BRONZE varchar(255)
);
delete from events;
INSERT INTO events VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
INSERT INTO events VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
INSERT INTO events VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
INSERT INTO events VALUES (4,'100m',2016, 'Ronald','maria','paula');
INSERT INTO events VALUES (5,'200m',2016, 'Alfred','carol','Steven');
INSERT INTO events VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
INSERT INTO events VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
INSERT INTO events VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
INSERT INTO events VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
INSERT INTO events VALUES (12,'500m',2016,'Thomas','Steven','Catherine');

-- Solution
--subquery method
SELECT gold as Player_Name, COUNT(1) as no_of_GoldMedals 
from events
where gold not in (select silver from events union all select bronze from events)
GROUP BY gold;

-- CTE method
with cte as (
select GOLD as player_name,'GOLD' as medal_type from events union all
select SILVER as player_name,'SILVER' as medal_type from events union all
select BRONZE as player_name,'BRONZE' as medal_type from events
)
select player_name, count(1) as no_of_medals from cte
group by player_name
having count(distinct medal_type)=1 and max(medal_type)='GOLD';