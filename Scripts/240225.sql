/* COMMON TABLE EXPRESSION
"with clause"
*/

SELECT * FROM EMP;

SELECT *
FROM emp mitarbeiter
JOIN emp boss on boss.empno = mitarbeiter.mgr;

WITH EmpCTE  (empno, ename, mgr, lvl, path) AS (
SELECT
    empno,
    ename,
    mgr,
        1 lvl,
        ename as path
FROM
    emp
    WHERE mgr is null
    
    UNION ALL
    SELECT
        emp.empno,
        emp.ename,
        emp.mgr,
        EmpCTE.lvl + 1 lvl,
        EmpCTE.path || '->' || emp.ename
    FROM
        emp
        JOIN EmpCTE ON EmpCTE.empno = emp.mgr
)
SELECT * FROM EmpCTE;

-- Alle Untergebenen (alle Levels) von "JONES"
WITH EmpCTE  (empno, ename, mgr, lvl, path) AS (
SELECT
    empno,
    ename,
    mgr,
        1 lvl,
        ename as path
FROM
    emp
   WHERE mgr is null
 
    UNION ALL
    SELECT
        emp.empno,
        emp.ename,
        emp.mgr,
        EmpCTE.lvl + 1 lvl,
        EmpCTE.path || '->' || emp.ename
    FROM
        emp
        JOIN EmpCTE ON EmpCTE.empno = emp.mgr
)
SELECT * FROM EmpCTE
WHERE path LIKE '%JONES%';

-- Alle Untergebenen (alle Levels) von "JONES" without JONES
WITH EmpCTE  (empno, ename, mgr, lvl, path) AS (
SELECT
    empno,
    ename,
    mgr,
        1 lvl,
        ename as path
FROM
    emp
   WHERE mgr is null
 
    UNION ALL
    SELECT
        emp.empno,
        emp.ename,
        emp.mgr,
        EmpCTE.lvl + 1 lvl,
        EmpCTE.path || '->' || emp.ename
    FROM
        emp
        JOIN EmpCTE ON EmpCTE.empno = emp.mgr
)
SELECT * FROM EmpCTE
WHERE path LIKE '%JONES_%';


-- Alle Untergebenen (alle Levels) von "JONES" die direkt untergebenen nicht
WITH EmpCTE  (empno, ename, mgr, lvl, path) AS (
SELECT
    empno,
    ename,
    mgr,
        1 lvl,
        ename as path
FROM
    emp
   WHERE mgr is null
 
    UNION ALL
    SELECT
        emp.empno,
        emp.ename,
        emp.mgr,
        EmpCTE.lvl + 1 lvl,
        EmpCTE.path || '->' || emp.ename
    FROM
        emp
        JOIN EmpCTE ON EmpCTE.empno = emp.mgr
)
SELECT * FROM EmpCTE
WHERE path LIKE '%JONES%'
and lvl >= (select lvl from EmpCTE WHERE ename='JONES') + 2;



WITH SUMPARTCTE ( CountNumber, Result)
AS  (
--Anker
SELECT 1 AS CountNumber, 1 AS Result FROM DUAL
UNION ALL
-- Rekursion
SELECT CountNumber + 1, Result + CountNumber + 1
FROM SumPartCTE
WHERE CountNumber+1 <= 10
)
SELECT * FROM SumPartCTE;



--- Suche starten bei ADAMS ( nicht: KING)

WITH EmpCTE  (empno, ename, mgr, lvl, path) AS (
SELECT
    empno,
    ename,
    mgr,
        1 lvl,
        ename as path
FROM
    emp
WHERE ename = 'ADAMS'
UNION ALL

SELECT
    emp.empno,
    emp.ename,
    emp.mgr,
        empcte.lvl + 1 lvl,
        empcte.path || '<-' || emp.ename as path
        
FROM
    emp
JOIN EmpCTE on empcte.mgr = emp.empno

)
SELECT * FROM EmpCTE;




SELECT * FROM PARTS;

WITH PartCTE (SUB, SUPER, PRICE) AS (
SELECT
    sub, super, price
    FROM parts
    WHERE super in ('P3','P9')
    
UNION ALL
SELECT parts.sub, parts.super, parts.price
FROM parts
JOIN PartCTE ON partcte.sub=parts.super
    )
    SELECT * FROM PartCTE;




