/*
OM de L'epsic

beau temps

le 8.1.2013
*/



DROP DATABASE IF EXISTS La_beaute_inutile_1;
CREATE DATABASE IF NOT EXISTS La_beaute_inutile_1;
USE La_beaute_inutile_1;

create table T_digits
(
  i int not null primary key
);

insert into T_digits values (0), (1), (2), (3), (4), (5), (6), (7), (8), (9);



SELECT @compteur:=0;
drop table if exists T_bidon_increment_om;
create table T_bidon_increment_om
  select @compteur:=@compteur+1 AS compteur, now() as heure, (les.i * 10 * rand() *300),hex(@compteur) as Hexa_om, char(hex(@compteur)) as lecaractere
    from T_digits AS les
      cross join T_digits AS moins
	  cross join T_digits as dunmetre95
	  /*
	  cross join T_digits sont
	  cross join T_digits inutileau
	  cross join T_digits mod105
	  */
    where @compteur <7000000;
SELECT COUNT(*) FROM T_bidon_increment_om;