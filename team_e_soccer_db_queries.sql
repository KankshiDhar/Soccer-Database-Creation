create view AwardsPresented as
select concat(PlayerFirstName, ' ', PlayerLastName) as 'Player Name', AwardName as 'Award', AwardYear as 'Year', CountryName as "Nationality"
from players 
inner join awardshistory on players.PlayerId=awardshistory.PlayerId
inner join awards on awardshistory.AwardId = awards.AwardId
inner join nationalteams on players.NationalTeamId=nationalteams.NationalTeamId
order by Award desc;


select * from awardspresented;

create view europeleagueclubs as
select ClubName as 'Club Name', concat(ClubCity, ', ', CountryName) as 'Location', LeagueName as 'League', SeasonStartYear as 'Season Start Year', (SeasonStartYear +1) as 'Season End Year'
from clubs
join clubs_in_leagues using (ClubId)
left join leagues on clubs_in_leagues.LeagueId = leagues.LeagueId
left join nationalteams on clubs.ClubCountryId = nationalteams.NationalTeamId
where leagues.ContinentName = 'Europe'
order by  SeasonStartYear desc, LeagueName;

select * from clubsinleagues;
select * from europeleagueclubs;


create view topstrikers as 
select concat(PlayerFirstName, ' ', PlayerLastName) as 'Player Name', ClubName as 'Current Club', NationalTeamId as 'Nationality'
from players
left join clubs using (ClubId)
inner join playerstats using (PlayerId)
where playerstats.Attack > 350;

select * from topstrikers;

create view topdefenders as 
select concat(PlayerFirstName, ' ', PlayerLastName) as 'Player Name', ClubName as 'Current Club', NationalTeamId as 'Nationality'
from players
left join clubs using (ClubId)
inner join playerstats using (PlayerId)
where playerstats.Defense > 150;

select * from topdefenders;

create view goaldifference as
select GDTable.ClubId, ClubName as 'Club Name', SUM(GD) as 'Goal Difference' from (select ClubId, SUM(AwayGoals - HomeGoals) as 'GD' from clubs  join matchstats on clubs.ClubId = AwayTeamId group by ClubId
union
select ClubId, SUM(HomeGoals - AwayGoals) as 'GD' from clubs  join matchstats on clubs.ClubId = HomeTeamId group By ClubId order by ClubId) as GDTable
join clubs on GDTable.ClubId = clubs.ClubId
group by ClubId
order by SUM(GD) desc;

select * from goaldifference;


create view totalwinsthisyear as
select ClubId, ClubName as 'Club Name', COUNT(Winner) as 'Total Wins'
from clubs
join matchstats on clubs.ClubId=matchstats.Winner
where YEAR(DateOfMatch) = YEAR(CURRENT_TIMESTAMP) or YEAR(DateOfMatch) = (YEAR(CURRENT_TIMESTAMP) + 1)
group by ClubId
order by COUNT(Winner) desc, ClubName ;

select * from totalwinsthisyear;

create view totalwinsoverall as
select ClubId, ClubName as 'Club Name', COUNT(Winner) as 'Total Wins'
from clubs
join matchstats on clubs.ClubId=matchstats.Winner
group by ClubId
order by COUNT(Winner) desc, ClubName ;

select * from totalwinsoverall;

create view overallranking as
select ClubId, goaldifference.`Club Name`, `Total Wins`, `Goal Difference`  from totalwinsoverall
right join goaldifference using (ClubId) 
order by `Total Wins` desc, `Goal Difference` desc;

select * from overallranking;