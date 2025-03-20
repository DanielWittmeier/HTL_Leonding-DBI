/*
3. Übung
21.10.2024
*/

/*
Übung 1
Tabelle erstellen
Erstellen Sie eine Tabelle PERSONEN mit folgenden Attributen
PERSONEN_ID NUMBER(4) NOT NULL
NNAME VARCHAR2(25)
VNAME VARCHAR(20)
*/
create table PERSONEN (
    PERSONEN_ID NUMBER(4) NOT NULL,
    NNAME VARCHAR2(25),
    VNAME VARCHAR(20)
);

/*
Werte einfügen
*/
INSERT INTO PERSONEN VALUES (1, 'Mustermann', 'Max');
INSERT INTO PERSONEN VALUES (2, 'Musterfrau', 'Mimi');
INSERT INTO PERSONEN VALUES (3, 'Mustermann', 'Matthias');
--INSERT INTO PERSONEN VALUES (99999, 'Musterfrau', 'Maria');
commit;

/*
Spalten hinzufügen und ändern
Hinzufügen der Spalte
GEBURTSDATUM DATE
Ändern von NNAME auf VARCHAR2 (30)
*/

ALTER TABLE PERSONEN
ADD GEBURTSDATUM DATE;

ALTER TABLE PERSONEN
MODIFY NNAME VARCHAR2(30);

ALTER TABLE PERSONEN
DROP COLUMN VNAME; -- Spalte Löschen

SELECT * FROM PERSONEN;

delete from personen where personen_id = 2; --Löscht alle Sätze in der in der Spalte personen_id = 1 ist

DROP TABLE PERSONEN;
commit;

-- ÜBUNG 2
/*
2. Einfache Ausgabe 1
Ausgabe aller Abteilungen (für DNAME Spaltenüberschrift ABTEILUNGSNAME).
*/
select * from dept;
select DNAME from dept;
select DNAME as ABTEILUNGSNAME from dept;

/*
3. Datumsausgabe
Ausgabe von EMPNO, ENAME und HIREDATE (Format DD. Month YYYY) zu jedem Angestellten.
*/
select * from emp;
select empno, ename, hiredate from emp;
select empno, ename, to_char(hiredate, 'DD. Month YYYY') as hiredate from emp;
select empno, ename, to_char(hiredate, 'YYYY-MM-DD') as hiredate from emp;

--Exkurs
-- nur jene die am 17. Dezember 1980 ( 1980-12-17 ) angestellt wurden
select empno, ename, to_char(hiredate, 'YYYY-MM-DD') as hiredate from emp
where HIREDATE = to_date('1980-12-17', 'YYYY-MM-DD');


/*
4. Datumsausgabe
Ausgabe von ENAME und Anzahl der Tage seit Eintritt in die
Firma (Spaltenüberschrift TAGE) zu jedem Angestellten.
*/
select to_char(SYSDATE, 'YYYY-MM-DD HH:mi:ss') from dual;

select * from emp;

select 
ename, 
to_char(hiredate, 'YYYY-MM-DD') as HIREDATE, 
to_char(SYSDATE, 'YYYY-MM-DD HH:mi:ss') as "SYSDATE", 
TRUNC(SYSDATE-HIREDATE) as TAGE from emp;


/*
5. Einfache Ausgabe 2
Ausgabe der Jobs (je Job nur 1 Ausgabe).
*/

select job from emp;
select distinct job from emp; -- distinct schmeißt mehfrache raus

 -- Exkurs
select distinct job, deptno from emp; -- hierbei schmeißt er alle mehrfachen Zeilen raus

/*
6. MinMax-Ausgabe
Ausgabe des minimalen, maximalen und durchschnittlichen Gehalts.
*/
select * from emp;
select sal from emp;

select min(sal) from emp; -- Zeigt kleinsten sal ( eine Zeile, auch wenn es mehr kleinste gibt )

SELECT 
    min(sal) as MinSal, -- as ist nur Optional
    max(sal) as MaxSal, 
    avg(sal) as AvgSal,
    TRUNC(avg(sal), 4) as AvgSalTrunc, -- TRUNC kann auch Strings abschneiden, rundet nie
    ROUND(avg(sal), 4) as AvgSalRound, -- Rundet die Zahl ab
    Count(sal) as CountSal,
    count(comm) as CountComm,
    Count(*) as CounstStar,
    sum(Sal) as SumSal,
    sum(sal) / count(sal) AVgSal2
FROM emp; -- min wie oben beschrieben, max für maximal und avg der Durchschnitt

/*
7. Zählen 1
Statement zur Ermittlung von „Wie viele Angestellte gibt es?“.
*/

select count(*) from emp;

/*
8. Zählen 2
Statement zur Ermittlung von „Wie viele unterschiedliche Jobs gibt es?“.
*/

select count(distinct job) from emp;


