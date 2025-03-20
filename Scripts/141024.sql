/*
2. Übung
14.10.24

*/

SELECT * FROM EMP
WHERE COMM IS NOT NULL; -- NOT ist ein Schlüsselwort

-- Alle Sätze aus EMP mit zugehöriger Info aus DEPT; Nur jene Zeilen aus "NEW YORK" (LOC) // Andere Schreibweise ( Bevorzugt )
SELECT * 
FROM EMP 
INNER JOIN dept ON emp.deptno = dept.deptno -- Kartesisches Produkt -> INNER JOIN ( INNER ist nur Optional -> Default Wert
WHERE dept.loc = 'NEW YORK';

SELECT DISTINCT DEPTNO FROM EMP; -- Durch Distinct nur Unterschiedliche Werte

-- OUTER JOIN:
SELECT * FROM DEPT LEFT OUTER JOIN EMP ON DEPT.DEPTNO = EMP.DEPTNO; -- LEFT OUTER JOIN  GIBT ES auch mit RIGHT ( Aber weniger Sinnvoll )

SELECT * FROM EMP RIGHT OUTER JOIN DEPT ON DEPT.DEPTNO = EMP.DEPTNO; -- RIGHT OUTER JOIN

SELECT * FROM EMP FULL OUTER JOIN DEPT ON DEPT.DEPTNO = EMP.DEPTNO; -- Zeigt alle möglichen Datensätze



CREATE TABLE Blue ( 
    ID number (1,0),
    ABC CHAR (1 BYTE)
    );
    
CREATE TABLE Red (
    ID number (1,0),
    XYZ CHAR (1)
    );
    
SELECT * FROM BLUE;
SELECT * FROM RED;
    
INSERT INTO Blue VALUES(1, 'A');
INSERT INTO Blue VALUES(2, 'B');

INSERT INTO Red VALUES(2, 'X');
INSERT INTO Red VALUES(3, 'Y');
COMMIT;

SELECT * FROM BLUE;
SELECT * FROM RED;
-- JOIN

SELECT * FROM blue JOIN red ON blue.ID = red.ID;

SELECT * FROM blue LEFT OUTER JOIN red ON blue.ID = red.ID;
