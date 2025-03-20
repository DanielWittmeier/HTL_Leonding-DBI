/* 
1. Übung
Am 7. Oktober 2024
*/

-- "*" alle Spalten der Tabelle
SELECT * FROM EMP;

-- Nur die Spalten empno und ename anzeigen
SELECT empno, ename FROM EMP;

-- empno als MITARBEITERNUMMER anzeigen
SELECT empno as MitarbbeiterNummer FROM EMP;

-- empno als MitarbeiterNummer anzeigen
SELECT empno as "MitarbeiterNummer" FROM EMP;

-- alle Zeilen und Spalten aus der DEPT Tabelle
SELECT * FROM DEPT;

-- alle Spalten aus EMP; Nur jene aus Abteilung 10 (DEPTNO)
SELECT * FROM EMP WHERE deptno = 10;

-- alle Spalten aus DEPT; Nur jene Zeilen aus Abteilung 10 (DEPTNO)
SELECT * FROM DEPT WHERE deptno = 10;

-- alle Spalten aus DEPT; Nur jene Zeilen aus "New York" (LOC)
SELECT * FROM DEPT WHERE loc = 'NEW YORK';

-- Alle Sätze aus EMP mit zugehöriger Info aus DEPT
SELECT * 
FROM EMP 
CROSS JOIN dept -- Kartesisches Produkt
WHERE emp.deptno = dept.deptno;

-- Alle Sätze aus EMP mit zugehöriger Info aus DEPT; Nur jene Zeilen aus "NEW YORK" (LOC)
SELECT * 
FROM EMP 
CROSS JOIN dept -- Kartesisches Produkt
WHERE emp.deptno = dept.deptno AND dept.loc = 'NEW YORK';

-- Alle Sätze aus EMP mit zugehöriger Info aus DEPT; Nur jene Zeilen aus "NEW YORK" (LOC) // Andere Schreibweise ( Bevorzugt )
SELECT * 
FROM EMP 
JOIN dept ON emp.deptno = dept.deptno -- Kartesisches Produkt -> INNER JOIN
WHERE dept.loc = 'NEW YORK';

--
SELECT * FROM EMP
WHERE comm is null;
