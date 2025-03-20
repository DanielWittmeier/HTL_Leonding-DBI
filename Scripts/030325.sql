-- 2025-03-03

select *
from emp l1
join emp l2 on l2.empno = l1.mgr
join emp l3 on l3.empno = l2.mgr
;

with EmpCTE as (
select *
from emp l1
join emp l2 on l2.empno = l1.mgr
join emp l3 on l3.empno = l2.mgr
)
select * from EmpCTE;

select * from (
select *
from emp l1
join emp l2 on l2.empno = l1.mgr
join emp l3 on l3.empno = l2.mgr
);


with EmpCTE as (
select *
from emp l1
join emp l2 on l2.empno = l1.mgr
join emp l3 on l3.empno = l2.mgr
)
select * from EmpCTE;


select * from emp
where mgr is null;


WITH EmpCTE ( empno, ename, mgr, lvl, path ) AS (
select empno, ename, mgr, 1 as lvl, ename as path from emp
where mgr is null
union all
select emp.empno, emp.ename, emp.mgr, empcte.lvl + 1 as lvl, EmpCTE.path || '->' || emp.ename
from emp
join EmpCTE on empCTE.empno = emp.mgr
)
select * from empcte;

/*
ÜBUNG 8
*/

/*
2. Anzeigen der gesamten Hierarchie derjenigen Teile, aus denen P3 und P9
bestehen
*/

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
    
/*
3. An welcher Hierarchiestufe wird P12 in P1 verwendet
*/

