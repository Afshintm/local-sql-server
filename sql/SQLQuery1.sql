select p.* from person p 
Join person Moms on Moms.Id = p.Mom


select moms.Id, moms.name,p.name,p.age from 
(Select * from person where Id in (select mom from person)) as moms
Left JOIN(Select * from person where Id in (select dad from person)) as dads
JOIN person p on p.mom = moms.id
Group by moms.Id , moms.name,p.name,p.age




Select * from person where Id in (select dad from person) as dads


Select distinct parents.Id,parents.Name from person parents 
JOIN Person p on parents.Id = p.mom or parents.Id = p.dad 

Select * from person parents 
JOIN Person p on parents.Id = p.mom or parents.Id = p.dad 


select Parents.Id, Parents.name,p.name,p.age from 
(Select distinct parents.Id,parents.Name from person parents 
JOIN Person p1 on parents.Id = p1.mom or parents.Id = p1.dad 
) as Parents
JOIN person p on p.mom = Parents.id or p.dad = Parents.id
Group by Parents.Id, Parents.name,p.name,p.age


select Parents.Id, Parents.youngestChild, p3.name from 
(
	Select parents1.Id,min(p2.age) as youngestChild  from person parents1 
	JOIN Person p2 on parents1.Id = p2.mom or parents1.Id = p2.dad 
	Group by parents1.Id
) as Parents
JOIN person p on p.mom = Parents.id or p.dad = Parents.id
JOIN person p3 on p3.id = Parents.id
Group by Parents.Id,Parents.youngestChild , p3.name


Select parents.Id,parents.name,min(children.age) as youngestChild  from person parents 
JOIN Person children on parents.Id = children.mom or parents.Id = children.dad 
Group by parents.Id,parents.name


Select parents.Id,parents.name,children.age as youngestChild  from person parents 
JOIN Person children on parents.Id = children.mom or parents.Id = children.dad 
Group by parents.Id,parents.name,children.age

--CREATE TABLE people (
--  id INTEGER NOT NULL PRIMARY KEY,
--  motherId INTEGER REFERENCES people(id),
--  fatherId INTEGER REFERENCES people(id),
--  name VARCHAR(30) NOT NULL,
--  age INTEGER NOT NULL
--);

--INSERT INTO people(id, motherId, fatherId, name, age) VALUES(1, NULL, NULL, 'Adam', 50);
--INSERT INTO people(id, motherId, fatherId, name, age) VALUES(2, NULL, NULL, 'Eve', 50);
--INSERT INTO people(id, motherId, fatherId, name, age) VALUES(3, 2, 1, 'Cain', 30);
--INSERT INTO people(id, motherId, fatherId, name, age) VALUES(4, 2, 1, 'Seth', 20);

Select parents.Id, parents.name,min(children.age) as youngestChild  from people parents 
JOIN people children on parents.id = children.motherId or parents.id = children.fatherId
Group by parents.id,parents.name

