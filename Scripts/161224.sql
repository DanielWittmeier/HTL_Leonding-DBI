select *
from emp
join dept on dept.deptno = emp.deptno;

alter table emp
drop constraint EMP_FOREIGN_KEY; -- Verbindung l�schen

alter table emp
add constraint UQ_EMP_NAME unique(ENAME); -- Verbindung hinzuf�gen