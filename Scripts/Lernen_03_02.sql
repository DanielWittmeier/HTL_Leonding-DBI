/*
Übung 001
---------

1. Tabelle erstellen
Erstellen Sie eine Tabelle PERSONEN mit folgenden Attributen

*/

CREATE TABLE PERSONEN (
    PERSONEN_ID NUMBER(4) NOT NULL,
    NNAME VARCHAR2(50),
    VNAME VARCHAR(20)
);

/*
2. Werte einfügen
Einfügen der Werte (1, 'Mustermann', 'Max') durch folgenden Befehl:
INSERT INTO personen VALUES (1, 'Mustermann', 'Max');
Einfügen der Werte (2, 'Musterfrau', 'Mimi') durch Korrektur des obigen Statements
mit change und anschließender Ausführung.
Einfügen der Werte (3, 'Mustermann', 'Matthias') durch Korrektur des obigen
Statements im Editor mit anschließender Ausführung.
Einfügen der Werte (99999, 'Musterfrau', 'Maria') durch Korrektur des obigen
Statements im Editor mit anschließender Ausführung. Beurteilen Sie das Ergebnis.
*/

INSERT INTO PERSONEN VALUES (1,'Mustermann','Max');

INSERT INTO PERSONEN VALUES (2,'Musterfrau','Mimi');

INSERT INTO PERSONEN VALUES (3,'Mustermann','Matthias');

INSERT INTO PERSONEN VALUES (4,'Musterfrau','Maria');

/*
3. Spalten hinzufügen und ändern
Hinzufügen der Spalte
GEBURTSDATUM DATE
Ändern von NNAME auf VARCHAR2(30)
*/

ALTER TABLE PERSONEN
ADD GEBURTSDATUM DATE;

ALTER TABLE PERSONEN
MODIFY NNAME VARCHAR2(30);
commit;

/*
4. Spalten löschen
Löschen der Spalte VNAME
*/

ALTER TABLE PERSONEN
DROP COLUMN VNAME;

/*
5. Tabelle löschen
Löschen der Tabelle PERSONEN
*/

DROP TABLE PERSONEN;


/*
Übung 002
---------

1. Tabelle erzeugen
Erzeugen der Tabellen DEPT und EMP aus der Datei dept_emp.sql.
*/

/*
2. Einfache Ausgabe 1
Ausgabe aller Abteilungen (für DNAME Spaltenüberschrift ABTEILUNGSNAME).
*/

SELECT DEPTNO, DNAME ABTEILUNGSNAME, LOC FROM DEPT;

/*
3. Datumsausgabe
Ausgabe von EMPNO, ENAME und HIREDATE (Format DD. Month YYYY) zu jedem Angestellten.
*/
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'DD.MM.YYYY') HIREDATE FROM EMP;

/*
4. Datumsausgabe
Ausgabe von ENAME und Anzahl der Tage seit Eintritt in die
Firma (Spaltenüberschrift TAGE) zu jedem Angestellten.
*/

SELECT 
ename, 
TO_CHAR(hiredate, 'YYYY-MM-DD') as HIREDATE, 
TO_CHAR(SYSDATE, 'YYYY-MM-DD') as "SYSDATE", 
TRUNC(SYSDATE-HIREDATE) as TAGE 
FROM EMP;

/*
5. Einfache Ausgabe 2
Ausgabe der Jobs (je Job nur 1 Ausgabe).
*/

SELECT DISTINCT JOB FROM EMP;

/*
6. MinMax-Ausgabe
Ausgabe des minimalen, maximalen und durchschnittlichen Gehalts.
*/

SELECT
MIN(SAL) MinLohn,
MAX(SAL) MaxLohn,
TRUNC (AVG(SAL), 2) DurschnittsLohn
FROM EMP;

/*
7. Zählen 1
Statement zur Ermittlung von „Wie viele Angestellte gibt es?“.
*/

SELECT COUNT(EMPNO) FROM EMP;

/*
8. Zählen 2
Statement zur Ermittlung von „Wie viele unterschiedliche Jobs gibt es?“.
*/

SELECT COUNT(DISTINCT(JOB)) JOB FROM EMP;

/*
Übung 003
---------

1. Ausgabe von PLAYERNO, NAME der Spieler, die nach 1980 geboren sind.
*/

SELECT
PLAYERNO,
NAME,
YEAR_OF_BIRTH
FROM PLAYERS
WHERE YEAR_OF_BIRTH > 1980;

/*
2. Ausgabe von PLAYERNO, NAME und TOWN aller weiblichen Spieler, die
nicht in Stratford wohnen.
*/
SELECT
PLAYERNO,
NAME,
TOWN
FROM PLAYERS
WHERE
SEX = 'F' and NOT(TOWN = 'Stratford');

/*
3. Ausgabe der Spielernummern der Spieler, die zwischen 1990 und 2000 dem
Club beigetreten sind.	
*/

SELECT
*
FROM PLAYERS
WHERE YEAR_JOINED >= 1990 and YEAR_JOINED <= 2000;

/*
4. Ausgabe von SpielerId, Name, Geburtsjahr der Spieler, die in einem Schaltjahr
geboren sind.
*/

/*
5. Ausgabe der Strafennummern der Strafen zwischen 50,- und 100,-.
*/

SELECT PAYMENTNO FROM PENALTIES WHERE AMOUNT >= 50 and AMOUNT <= 100;

/*
6. Ausgabe von SpielerId, Name der Spieler, die nicht in Stratford oder Douglas
leben.
*/

SELECT * FROM PLAYERS WHERE NOT(TOWN IN ('Stratford','Douglas'));

/*
7. Ausgabe von SpielerId und Name der Spieler, deren Name 'is' enthält.
*/

SELECT PLAYERNO, NAME FROM PLAYERS WHERE NAME like '%is%';

/*
8. Ausgabe aller Hobbyspieler.
*/

SELECT * FROM PLAYERS WHERE LEAGUENO is NULL;

/*
9. Ausgabe derjenigen Mitarbeiter, die mehr Provision als Gehalt erhalten.
*/
SELECT * FROM EMP WHERE COMM > SAL;

/*
10.Ausgabe aller Mitarbeiter aus Abteilung 30, deren Gehalt größer gleich
1500,- ist.
*/
SELECT * FROM EMP WHERE DEPTNO = 30 and SAL >= 1500;

/*
11.Ausgabe aller Manager, die nicht zu Abteilung 30 gehören.
*/

SELECT * FROM EMP WHERE NOT(DEPTNO = 30) AND JOB = 'MANAGER';

/*
12.Ausgabe aller Mitarbeiter aus Abteilung 10, die weder Manager noch Büro-
angestellter (CLERK) sind.
*/
SELECT * FROM EMP WHERE DEPTNO = 10 AND NOT(JOB IN ('MANAGER','CLERK'));

/*
13.Ausgabe aller Mitarbeiter, die zwischen 1200,- und 1300,- verdienen.
*/
SELECT * FROM EMP WHERE SAL + nvl(COMM,0) >= 1200 and SAL + nvl(COMM,0) <= 1300;

/*
14.Ausgabe aller Mitarbeiter, deren Name 5 Zeichen lang ist und mit ALL beginnt.
*/
SELECT * FROM EMP WHERE ENAME like 'ALL__';

/*
15.Zu jedem Mitarbeiter soll das ges. Gehalt (Gehalt + Provision) ausgegeben
werden.
*/
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, SAL + nvl(COMM,0) GesGehalt, DEPTNO FROM EMP;

/*
16.Ausgabe aller Mitarbeiter, deren Provision über 25% des Gehalts liegt.
*/
SELECT * FROM EMP WHERE COMM > SAL*0.25;

/*
17.Gesucht ist der durchschnittliche Gehalt aller Büroangestellten.
*/
SELECT trunc(avg(SAL),2) FROM EMP;

/*
18.Gesucht ist die Anzahl der Mitarbeiter, die eine Provision erhalten haben.
*/
SELECT * FROM EMP WHERE COMM IS NOT NULL;

/*
19.Gesucht ist der Anzahl der verschiedenen Jobs in Abteilung 30.
*/

SELECT COUNT(DISTINCT(JOB)) "Anzahl Jobs" FROM EMP WHERE DEPTNO = 30;

/*
20.Gesucht ist die Anzahl der Mitarbeiter in Abteilung 30.
*/
SELECT COUNT(EMPNO) "Anzahl Mitarbeiter" FROM EMP WHERE DEPTNO = 30;

/*
21.Ausgabe der Mitarbeiter, die zwischen 4.1.81 und 15.4.81 angestellt worden
sind.
*/

SELECT * FROM EMP WHERE
HIREDATE > TO_DATE('03.01.1981','DD.MM.YYYY') and HIREDATE < TO_DATE('16.04.1981','DD.MM.YYYY');

/*
Übung 004
---------

1. Ausgabe von TEAMNO der Teams, in denen nicht der Spieler mit der Nummer
27 Kapitän ist.
*/

SELECT * FROM TEAMS WHERE NOT(PLAYERNO = 27);

/*
2. Ausgabe von PLAYERNO, NAME und INITIALS der Spieler, die mindestens
ein Match gewonnen haben.
*/

SELECT DISTINCT(players.PLAYERNO), name, initials FROM PLAYERS
JOIN MATCHES on Players.playerno = matches.playerno
WHERE matches.WON > matches.LOST;

/*
3. Ausgabe von SpielerNr und Name der Spieler, die mindestens eine Strafe
erhalten haben.
*/

SELECT DISTINCT(pl.playerno), pl.name 
FROM PLAYERS pl
JOIN PENALTIES pe on pe.playerno = pl.playerno;

/*
4. Ausgabe von SpielerNr und Name der Spieler, die mindestens eine Strafe
über 50.- erhalten haben.
*/

SELECT DISTINCT(pl.playerno), pl.name 
FROM PLAYERS pl
JOIN PENALTIES pe on pe.playerno = pl.playerno
WHERE pe.amount > 50;

/*
5. Ausgabe von SpielerNr und Name der Spieler, die im selben Jahr wie R. Parmenter
geboren sind.
*/

SELECT *
FROM PLAYERS
WHERE YEAR_OF_BIRTH in (
    SELECT YEAR_OF_BIRTH FROM PLAYERS WHERE PLAYERNO = 6 )
;
/*
6. Ausgabe von SpielerNr und Name des ältesten Spielers aus Stratford
*/

SELECT * FROM PLAYERS WHERE YEAR_OF_BIRTH in ( SELECT min(YEAR_OF_BIRTH) FROM PLAYERS WHERE TOWN = 'Stratford' );

/*
7. Gesucht sind alle Abteilungen, die keine Mitarbeiter beschäftigen.
*/

SELECT * FROM DEPT
LEFT JOIN EMP on emp.deptno = dept.deptno
WHERE emp.deptno is null;

/*
8. Gesucht sind alle Mitarbeiter, die den gleichen Job wie JONES haben
*/

SELECT * FROM EMP WHERE JOB in ( SELECT JOB FROM EMP WHERE EMPNO = 7566 ) and not(EMPNO = 7566);

/*
9. Anzeigen aller Mitarbeiter, die mehr verdienen als irgendein Mitarbeiter aus
Abteilung 30
*/

SELECT * FROM EMP WHERE SAL+nvl(COMM,0) > ( SELECT min(sal) FROM EMP WHERE DEPTNO = 30 );

/*
10.Anzeigen aller Mitarbeiter, die mehr verdienen als jeder Mitarbeiter aus Abteilung 30
*/

SELECT * FROM EMP WHERE SAL+nvl(comm,0) > ( SELECT max(sal+nvl(comm,0)) FROM EMP WHERE DEPTNO = 30 );

/*
11.Anzeigen aller Mitarbeiter aus Abteilung 10, deren Job von keinem Mitarbeiter
aus Abteilung 30 ausgeübt wird
*/

SELECT * FROM EMP WHERE DEPTNO = 10 and JOB not in ( SELECT distinct(job) FROM EMP WHERE DEPTNO = 30 );

/*
12.Gesucht sind die Mitarbeiterdaten (EMPNO, ENAME, JOB, SAL) des Mitarbeiters
mit dem höchsten Gehalt
*/

SELECT * FROM EMP WHERE SAL in ( SELECT max(sal+nvl(comm,0)) FROM EMP );

/*
Übung 005
---------

1. Anzahl der Neuzugänge pro Jahr
*/

SELECT YEAR_JOINED, count(*) FROM PLAYERS
group by YEAR_JOINED;

/*
2. Anzahl und durchschnittliche Höhe der Strafen pro Spieler
*/

SELECT PLAYERNO, avg(amount), count(*) FROM PENALTIES
group by PLAYERNO;

/*
3. Anzahl der Strafen für die Jahre vor 1983
*/

SELECT count(*) FROM PENALTIES WHERE to_char(PEN_DATE,'YYYY') < 2003;

/*
4. In welchen Städten leben mehr als 4 Spieler
*/

SELECT TOWN, count(*) FROM PLAYERS
GROUP BY TOWN
HAVING count(*) > 4;

/*
5. PLAYERNO derjenigen Spieler, deren Strafensumme über 150 liegt
*/

SELECT PLAYERNO, sum(amount) FROM PENALTIES
group by playerno
having sum(amount) > 150;

/*
6. NAME und INITIALS derjenigen Spieler, die mehr als eine Strafe erhalten haben
*/
SELECT * FROM PLAYERS WHERE PLAYERNO in ( SELECT playerno FROM PENALTIES
group by playerno
having count(*) > 1 );


/*
7. In welchen Jahren gab es genau 2 Strafen
*/

SELECT to_char(PEN_DATE,'YYYY') Jahren FROM PENALTIES
group by to_char(PEN_DATE,'YYYY')
having count(*) = 2;

/*
8. NAME und INITIALS der Spieler, die 2 oder mehr Strafen über $40 erhalten haben
*/

SELECT * FROM PLAYERS WHERE PLAYERNO in ( SELECT playerno FROM PENALTIES WHERE AMOUNT > 40
group by playerno
having count(*) > 1 );

/*
9. NAME und INITIALS des Spielers mit der höchsten Strafensumme
*/

SELECT max(amount) FROM ( SELECT playerno, sum(amount) amount FROM PENALTIES
group by playerno );

SELECT playerno FROM PENALTIES
group by playerno
having sum(amount) in ( SELECT max(amount) FROM ( SELECT playerno, sum(amount) amount FROM PENALTIES
group by playerno ));

SELECT * FROM PLAYERS WHERE PLAYERNO in ( SELECT playerno FROM PENALTIES
group by playerno
having sum(amount) in ( SELECT max(amount) FROM ( SELECT playerno, sum(amount) amount FROM PENALTIES
group by playerno )));



/*
10. In welchem Jahr gab es die meisten Strafen und wie viele waren es
*/


/*
11.PLAYERNO, TEAMNO, WON - LOST sortiert nach letzterem
*/


/*
12.Ausgabe aller Mitarbeiter aus Abteilung 30 geordnet nach ihrem Gehalt beginnend
mit dem höchsten Gehalt
*/


/*
13.Ausgabe aller Mitarbeiter geordnet nach Job und innerhalb des Jobs nach
ihrem Gehalt
*/


/*
14.Ausgabe aller Mitarbeiter geordnet nach ihrem Anstellungsjahr absteigend
und innerhalb des Jahres nach ihrem Namen
*/


/*
15.Ausgabe aller Verkäufer in absteigender Reihenfolge bezüglich dem Verhältnis
Provision zu Gehalt
*/


/*
16.Ausgabe des Durchschnittsgehalts zu jeder Abteilungsnummer
*/


/*
17.Berechne die durchschnittlichen Jahresgehälter derjenigen Jobs, die von
mehr als 2 Mitarbeitern ausgeführt werden
*/


/*
18.Ausgabe aller Abteilungsnummern mit mindestens 2 Büroangestellten
*/

