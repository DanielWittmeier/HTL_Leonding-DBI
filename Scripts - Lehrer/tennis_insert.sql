delete from players;

insert into players values
 (6,'Parmenter','R',1984,'M',1997,'Haseltine Lane',
  '80','1234KK','Stratford','070-476537','8467');
insert into players values
 (44,'Baker','E',1983,'M',2000,'Lewis Street',
  '23','4444LJ','Inglewood','070-368753','1124');
insert into players values
 (83,'Hope','PK',1976,'M',2002,'Magdalena Road',
  '16A','1812UP','Stratford','070-353548','1608');
insert into players values
 (2,'Everett','R',1968,'M',1995,'Stoney Road',
  '43','3575NH','Stratford','070-237893','2411');
insert into players values
 (27,'Collins','DD',1984,'F',2003,'Long Drive',
  '804','8457DK','Eltham','079-234857','2513');
insert into players values
 (104,'Moorman','D',1990,'F',2004,'Stout Street',
  '65','9437AO','Eltham','079-987571','7060');
insert into players values
 (7,'Wise','GWS',1983,'M',2001,'Edgecombe Way',
  '39','9758VB','Stratford','070-347689',NULL);
insert into players values
 (57,'Brown','M',1991,'M',2005,'Edgecombe Way',
  '16','4377CB','Stratford','070-473458','6409');
insert into players values
 (39,'Bishop','D',1976,'M',2000,'Eaton Square',
  '78','9629CD','Stratford','070-393435',NULL);
insert into players values
 (112,'Bailey','IP',1983,'F',2004,'Vixen Road',
  '8','6392LK','Plymouth','010-548745','1319');
insert into players values
 (8,'Newcastle','B',1982,'F',2000,'Station Road',
  '4','6584RQ','Inglewood','070-458458','2983');
insert into players values
 (100,'Parmenter','P',1983,'M',1999,'Haseltine Lane',
  '80','1234KK','Stratford','070-494593','6524');
insert into players values
 (28,'Collins','C',1983,'F',1999,'Old Main Road',
  '10','1294QK','Midhurst','071-659599',NULL);
insert into players values
 (95,'Miller','P',1983,'M',1992,'High Street',
  '33A','5746OP','Douglas','070-867564',NULL);

delete from teams;

insert into teams values (1,6,'first');
insert into teams values (2,27,'second');

delete from matches;

insert into matches values (1,1,6,3,1);
insert into matches values (2,1,6,2,3);
insert into matches values (3,1,6,3,0);
insert into matches values (4,1,44,3,2);
insert into matches values (5,1,83,0,3);
insert into matches values (6,1,2,1,3);
insert into matches values (7,1,57,3,0);
insert into matches values (8,1,8,0,3);
insert into matches values (9,2,27,3,2);
insert into matches values (10,2,104,3,2);
insert into matches values (11,2,112,2,3);
insert into matches values (12,2,112,1,3);
insert into matches values (13,2,8,0,3);

delete from penalties;

insert into penalties values (1,6,TO_DATE('08/12/2000','DD/MM/YYYY'),100.0);
insert into penalties values (2,44,TO_DATE('05/05/2001','DD/MM/YYYY'),75.0);
insert into penalties values (3,27,TO_DATE('10/09/2003','DD/MM/YYYY'),100.0);
insert into penalties values (4,104,TO_DATE('08/12/2004','DD/MM/YYYY'),50.0);
insert into penalties values (5,44,TO_DATE('08/12/2000','DD/MM/YYYY'),25.0);
insert into penalties values (6,8,TO_DATE('08/12/2000','DD/MM/YYYY'),25.0);
insert into penalties values (7,44,TO_DATE('30/12/2002','DD/MM/YYYY'),30.0);
insert into penalties values (8,27,TO_DATE('12/11/2004','DD/MM/YYYY'),75.0);
commit;