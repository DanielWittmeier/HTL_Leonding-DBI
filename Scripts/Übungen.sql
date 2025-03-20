/*
19.Gesucht ist der durchschnittliche Wert für Gehalt und Provision aller Mitarbeiter
aus Abteilung 30
*/



/*
Übung 06

1. NAME, INITIALS und Anzahl der gewonnenen Sätze für jeden Spieler
*/

select NAME, INITIALS, sum(won) AnzahlGewonneneSätze
from players pl
left join matches m on m.playerno = pl.playerno
group by NAME, INITIALS;

--1a.) NAME, INITIALS und Anzahl der gewonnenen Matches für jeden Spieler

select NAME, INITIALS, count(m.playerno) AnzahlGewonneneMatches
from players pl
left join matches m on m.playerno = pl.playerno and won > lost
group by NAME, INITIALS;

/*
2. NAME, PEN_DATE und AMOUNT absteigend sortiert nach AMOUNT
*/

select NAME, PEN_DATE, AMOUNT
from players pl
join penalties pe on pe.playerno = pl.playerno
order by amount desc;

select pl.NAME, pe.PEN_DATE, pe.AMOUNT
from players pl
join penalties pe on pe.playerno = pl.playerno
order by pe.amount desc, pl.name;

/*
3. TEAMNO, NAME (des Kapitäns) pro Team
*/

SELECT t.teamno, pl.name Kapitän
from teams t
join players pl on pl.playerno = t.playerno;

/*
4. NAME (Spielername), WON, LOST aller gewonnenen Matches
*/

SELECT * FROM PLAYERS;

SELECT * FROM MATCHES;

SELECT PL.NAME, M.WON, M.LOST
FROM PLAYERS PL
JOIN MATCHES M on M.PLAYERNO=PL.PLAYERNO
WHERE M.WON > M.LOST;

/*
5. PLAYERNO, NAME und Strafsumme für jeden Mannschaftsspieler. Hat eine
Spieler noch keine Strafe erhalten, so soll er trotzdem ausgegeben werden.
Die Sortierung soll nach der Höhe der Strafe aufsteigend erfolgen
*/

SELECT PL.PLAYERNO, PL.NAME, sum(pe.amount) Strafsumme
FROM PLAYERS PL
LEFT JOIN PENALTIES PE on PE.PLAYERNO = PL.PLAYERNO
group by PL.PLAYERNO, PL.NAME
order by nvl(sum(pe.amount),0);

/*
6. In welcher Stadt arbeitet der Mitarbeiter Allen?
*/

SELECT * FROM EMP;

SELECT * FROM DEPT;

SELECT d.loc
FROM EMP e
JOIN dept d on d.deptno=e.deptno
WHERE e.ename = 'ALLEN';

/*
7. Gesucht sind alle Mitarbeiter, die mehr verdienen als ihr Vorgesetzter
*/

SELECT * FROM EMP;

SELECT Mitarbeiter.ename MANAME, Mitarbeiter.sal MASAL, Boss.sal BossSal
FROM EMP Mitarbeiter
JOIN EMP Boss on Boss.empno = Mitarbeiter.mgr
WHERE Mitarbeiter.sal > Boss.sal;