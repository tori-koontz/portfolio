/* SQL notes for Retriving and analyzing Twitter data
Creates by Tori Koontz, with input from Kineret Grant-Sasson, Chris Gernon, and Benjamin Dohan */

/*Access geometry information from downloaded twitter tables, change CRS */
SELECT AddGeometryColumn ('public','dorian','geom',102004,'POINT',2, false);
update dorian
set geom = st_transform(st_setsrid(st_makepoint(lng, lat), 4326), 102004)

SELECT AddGeometryColumn ('public','november','geom',102004,'POINT',2, false);
update november
set geom = st_transform(st_setsrid(st_makepoint(lng, lat), 4326), 102004)

UPDATE counties SET geometry = st_transform(geometry, 102004)
select populate_geometry_columns()

DELETE FROM counties
WHERE statefp NOT IN ('54', '51', '50', '47', '45', '44', '42', '39', '37',
'36', '34', '33', '29', '28', '25', '24', '23', '22', '21', '18', '17',
'13', '12', '11', '10', '09', '05', '01');

ALTER TABLE november ADD COLUMN geoid varchar(5)

Update november
set geoid = (select geoid from counties
Where st_intersects(geom, counties.geometry))

ALTER TABLE dorian ADD COLUMN geoid varchar(5)

Update dorian
set geoid = (select geoid from counties
Where st_intersects(geom, counties.geometry))

/* Getting information from all tweets for november, and then the Dorian tweets, and adding them into the Counties table */
SELECT COUNT(status_id)
FROM november
group by geoid

alter table counties
add column novembertweets integer

alter table counties
add column doriantweets integer

update counties
set novembertweets =
(SELECT COUNT(status_id)
from november
WHERE november.geoid = counties.geoid
group by geoid)

update counties
set doriantweets =
(SELECT COUNT(status_id)
from dorian
WHERE dorian.geoid = counties.geoid
group by geoid)

UPDATE counties
set doriantweets = 0 WHERE doriantweets is null

UPDATE counties
set novembertweets = 0 WHERE novembertweets is null

/* Calculate the rate at which tweets were occuring during Dorian (NDTI) by comparing them to all November tweets */
alter table counties add column tweetrate real

update counties
set tweetrate = (doriantweets/pop)*10000

alter table counties add column ndti float

update counties
set ndti = 0 WHERE ((doriantweets+novembertweets) = 0)

update counties
set ndti = ((doriantweets-novembertweets*1.0)/(doriantweets+novembertweets)) 
WHERE doriantweets+novtweets >0

create table countiescentroids as
select*,
ST_Centroid(geometry)
from counties


