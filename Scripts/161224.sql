select *
from emp
join dept on dept.deptno = emp.deptno;

alter table emp
drop constraint EMP_FOREIGN_KEY; -- Verbindung löschen

alter table emp
add constraint UQ_EMP_NAME unique(ENAME); -- Verbindung hinzufügen