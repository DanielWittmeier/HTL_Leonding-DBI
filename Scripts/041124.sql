/*
1. Ausgabe von PLAYERNO, NAME der Spieler, die nach 1980 geboren sind.
*/
SELECT playerno, name, year_of_birth
FROM players
WHERE year_of_birth > 1980;

/*
2. Ausgabe von PLAYERNO, NAME und TOWN aller weiblichen Spieler, die
nicht in Stratford wohnen.
*/
SELECT playerno, name, town, sex
FROM players
WHERE sex = 'F' and town != 'Stratford'; -- <> ist auch ungleich

/*
3. Ausgabe der Spielernummern der Spieler, die zwischen 1990 und 2000 dem
Club beigetreten sind.
*/

SELECT playerno, year_joined
FROM players
--WHERE year_joined >= 1990 and year_joined <= 2000;
WHERE year_joined between 1990 and 2000; -- Kürzer, selbes Ergebnis wie in der Zeile darüber

-- Exkurs
SELECT *
FROM EMP
--WHERE hiredate between to_date('1980-12-17', 'YYYY-MM-DD') and to_date ('1982-02-20', 'YYYY-MM-DD') ; -- Problem, die Uhrzeit ist im Datentyp Date mit dabei, sollte also am 20.02.1982 um 09:00 jemand dabei, wird dieser ausgeschlossen
WHERE   hiredate >= to_date('1980-12-17', 'YYYY-MM-DD') 
and     hiredate < to_date ('1982-02-21', 'YYYY-MM-DD'); -- somit werden alle bis inlusive 21.02.1982 angezeigt ( Datentype Date hat hh-mm-ss aber nicht ms )

--WILDCARD Suche ( nur mit String möglich, bei Zahlen müsste man diese zuvor in einen String umwandeln )
SELECT *
FROM emp
WHERE   ename like 'S%'; -- Anfagsbuchstabe S, alles was danach kommt, ist egal durch das %

SELECT *
FROM emp
WHERE   ename like '%H'; -- Selbe, nur dass alles vor dem H nicht relevant ist, muss mit H enden

SELECT *
FROM emp
WHERE   ename like 'S%T%'; -- Anfang S - Belieblige Zeichen - T - Beliebige Zeichen

SELECT  *
FROM    emp
WHERE   ename like '_L%'; -- bei _ kann eine beliebiger Buchstabe vor dem L stehen bzw. muss

SELECT  *
FROM    emp
WHERE   ename like '____'; -- Zeigt alle mit 4 Zeichen an
/*
4. Ausgabe von SpielerId, Name, Geburtsjahr der Spieler, die in einem Schaltjahr
geboren sind.
*/
SELECT playerno, name, year_of_birth
FROM players;
