CREATE table auto2 (
ID number (4) PRIMARY KEY,
rendszam varchar2(6),
Tipus varchar2(30),
Szin varchar2(20),
Kor number(3),
Ar number(10),
Muszaki_erv date
);

desc auto2;

begin
insert into auto2 values(1,'ABC123', 'Opel Corsa','Piros', 6, 3200000,TO_DATE('05.08.2024','DD-MM-YYYY'));
insert into auto2 values(2,'QWC456', 'Suzuki Alto','Kék', 15, 15000000,TO_DATE('03.12.2024','DD-MM-YYYY'));
insert into auto2 values(3,'BMQ479', 'Skoda Scala','Fehér', 1, 6800000,TO_DATE('10.06.2024','DD-MM-YYYY'));
insert into auto2 values(4,'XQC328', 'Opel Astra','Fekete', 3, 160000,TO_DATE('08.05.2024','DD-MM-YYYY'));
insert into auto2 values(5,'HAB295', 'Ford Focus','Sárga', 4, 453000,TO_DATE('05.12.2024','DD-MM-YYYY'));
insert into auto2 values(6,'CIG474', 'Skoda karoq','Kék', 2, 700000,TO_DATE('25.11.2024','DD-MM-YYYY'));
insert into auto2 values(7,'KLR285', 'Suzuki Dwift','Piros', 8, 810000,TO_DATE('05.09.2024','DD-MM-YYYY'));
END;
select * from auto2;

select sysdate from dual;

create or replace procedure atlag as 
b Auto2.ar%type;
begin
select avg(Ar) into b from auto2;
DBMS_OUTPUT.PUT_LINE(b);
end;
/
begin
atlag;
end;
/

create or replace procedure atlag as
x auto2.ar%type;
xpm varchar(30);
begin
select avg(ar) into x from auto2;
xpm := TO_CHAR(x, '9G999G999G999');
xpm := LTRIM(replace(xpm, ',', ' '));
DBMS_output.put_line('Eredmény:' ||xpm||' HUF');
end;
begin
atlag;
end;

create procedure Négyzet (a in number, b out number) is 
begin
b := a*a;
end;

declare 
a int := 10;
b int;
begin 
Négyzet(a,b);
dbms_output.put_line(b);
end;

create or replace function rendszamSzin(rszbe in char) return char as 
b auto2.SZIN%type;
begin
select Szin into b from auto2 where rendszam = rszbe;
return b;
end;

select rendszamSzin('ABC123') from dual;
declare 
b char(40)
begin
b := RendszamSzin('ABC123');
end;


create or replace procedure ujrekord (idbe in number , rszbe in char,tipbe in char, szinbe in char, korbe in number, arbe in number, muszbe in date) is
begin
insert into auto2 values ( idbe, rszbe, tipbe, szinbe, korbe, arbe, muszbe);
end;

select * from auto2;
begin 
ujrekord (8)





create or replace procedure automodosit ( idbe in number, szinbe in char) is
begin
update auto2 set szin = szinbe where id = idbe);
end;

begin
automodosit(id, 'Grafit szürke');
end;
 select * from auto2;

create or replace procedure autotorol ( idbe in number) is 
begin
delete auto2 where id = idbe;
end;




