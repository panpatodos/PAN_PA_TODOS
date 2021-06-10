create database Pan_Pa_Todos;
 use Pan_Pa_Todos;

create table categorias (
Categoria varchar(11) not null,
primary key(Categoria)
);

create table Productos (
Cod_Prod varchar(15) not null,
Desc_Prod varchar(20) not null,
Cant_Prod int not null, 
Valor_Prod int not null,
F_Venc varchar(15) null,
categorias_Categoria varchar(11) not null,
primary key(Cod_Prod, categorias_Categoria)
);

create table Trabajadores_has_Productos (
Trabajadores_Num_Documento int not null,
Trabajadores_Tipo_Documento_t_Doc varchar(6) not null,
Trabajadores_Roles_Cod_Rol varchar(10) not null,
Productos_Cod_Prod varchar(15) not null,
Productos_categorias_Categoria varchar(11) not null,
primary key(Trabajadores_Num_Documento,Trabajadores_Tipo_Documento_t_Doc,
Trabajadores_Roles_Cod_Rol,Productos_Cod_Prod,Productos_categorias_Categoria)
);

create table Trabajadores (
Num_Documento int not null,
P_Nombre varchar(15) not null,
S_Nombre varchar(15) null,
P_Apellido varchar(15) not null,
S_Apellido varchar(15) null,
Password varchar(20) not null,
Email varchar(25) null,
Num_Tel int not null,
Tipo_Documento_t_Doc varchar(6) not null,
Roles_Cod_Rol varchar(10),
primary key(Num_Documento,Tipo_Documento_t_Doc,Roles_Cod_Rol)
);

create table Tipo_Documento(
t_Doc varchar(6) not null,
Des_tDoc varchar(25) not null,
primary key(t_Doc)
);

create table Roles(
Cod_Rol varchar(10) not null,
Des_Rol varchar(20) null,
primary key(Cod_Rol) 
);

alter table Productos add
constraint FKPK_Productos_Categoria
foreign key (categorias_Categoria)
references categorias (Categoria);

alter table Trabajadores add
constraint FKPK_Trabajadores_Tipo_Documento
foreign key (Tipo_Documento_t_Doc)
references Tipo_Documento (t_Doc);

alter table Trabajadores add
constraint FKPK_Trabajadores_Roles
foreign key (Roles_Cod_Rol)
references Roles (Cod_Rol);

alter table Trabajadores_has_Productos add
constraint FKPK_Trabajadores_has_Productos_Trabajadores
foreign key (Trabajadores_Num_Documento, Trabajadores_Tipo_Documento_t_Doc, Trabajadores_Roles_Cod_Rol)
references Trabajadores (Num_Documento, Tipo_Documento_t_Doc, Roles_Cod_Rol);

alter table Trabajadores_has_Productos add
constraint FKPK_Trabajadores_has_Productos_Productos_
foreign key (Productos_Cod_Prod, Productos_categorias_Categoria)
references Productos (Cod_Prod, categorias_Categoria);


--Inserciones de categorias 
insert into categorias
values ('Panes');

insert into categorias
values ('Postres');

insert into categorias
values ('Bebidas');

insert into categorias
values ('Paquetes');
--Inserciones de Productos 

--insercion de panes
insert into Productos
values ('Pan_R','Pan Rollo','70','300','No tiene','Panes');

insert into Productos
values ('Pan_B','Pan Blandito','70', '300','No tiene','Panes');

insert into Productos
values ('Pan_O','Pan Ojaldrado','70','300','No tiene','Panes');

insert into Productos
values ('Pan_Q','Pan de Queso','70'	,'2000','No tiene','Panes');

--Insercion de postres
insert into Productos
values ('Pos_M','Merengon','20','4500','No tiene','Postres');

insert into Productos
values ('Pos_Mar','Postre Maracuya','20','3500','No tiene','Postres');

insert into Productos
values ('Pos_TL','Tres Leches','20','3500','No tiene','Postres');

insert into Productos
values ('Pos_FCC','Fresas con Crema','20','2500','No tiene','Postres');

--inserciones de bebidas
insert into Productos
values ('Be_CoCa','Coca-Cola 360ml','50','2000','1/06/2022','Bebidas');

insert into Productos
values ('Be_ManPo','Manzana-Postobon 360ml','50','1500','2/06/2022','Bebidas');

insert into Productos
values ('Be_AC','Agua Cielo','50','1000','3/06/2022','Bebidas');

insert into Productos
values ('Be_JuHit','Jugos Hit','50','2500','4/06/2022','Bebidas');

--inserciones de paquetes
insert into Productos
values ('Pa_PP','Papas Pollo','30','1600','18/03/2022','Paquetes');

insert into Productos
values ('Pa_Chee','Cheetos','30','1000','18/03/2022','Paquetes');

insert into Productos
values ('Pa_Do','Doritos','30','1800','18/03/2022','Paquetes');

insert into Productos
values ('Pa_TR','Todo rico','30','1800','18/03/2022','Paquetes');

--inserciones tipo-documento
insert into Tipo_Documento
values ('CC','Cedula de Ciudadania');

--inserciones Roles 
insert into Roles
values ('R_P','Panadero');

insert into Roles
values ('R_E','Empleado');

--inserciones trabajadores

--preguntar por que no deja poner el numeor que es y pone ese aleatoriamente, y tambien por que pasa esto con los dos ultimos con su numeoro  de identificacion 
insert into Trabajadores
values('1009834567','Jose','Manuel','Cordoba','Vergara','JMCV100','jmanuel10@hotmail.com','3103875674','CC','R_P');

insert into Trabajadores
values('1013456514','Tania','Gineth','Hernandez','Moreno','TGHM101','taniaghm@hotmail.com','3124532367','CC','R_E');

insert into Trabajadores
values('1234398712','Anderson','','Hernandez','Moreno','AHM1234','andersom123@hotmail.com','3214567844','CC','R_E');

insert into Trabajadores
values('6764593232','Yolanda','','Moreno','Chala','YMC6784','yolamorenoc@gmail.com','3133089654','CC','R_E');

insert into Trabajadores
values('1001098654','Jeferson','','Hernandez','Moreno','JHM6549','jefresonhermo@gmial.com','4665465455','CC','R_E'); 
    --('6549734788')                                                                       '3013214562'


--inseerciones Trabajadores_has_Productos
--insercion Jose
insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pan_R','Panes');

insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pan_B','Panes');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pan_O','Panes');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pan_Q','Panes');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pos_M','Postres');



insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pos_M','Postres');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pos_Mar','Postres');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pos_TL','Postres');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pos_FCC','Postres');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Be_CoCa','Bebidas');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Be_ManPo','Bebidas');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Be_AC','Bebidas');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Be_JuHit','Bebidas');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pa_PP','Paquetes');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pa_Chee','Paquetes');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pa_Do','Paquetes');


insert into Trabajadores_has_Productos
values('1009834567','CC','R_P','Pa_TR','Paquetes');


--inserciones Tania


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pan_R','Panes');

insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pan_B','Panes');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pan_O','Panes');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pan_Q','Panes');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pos_M','Postres');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pos_M','Postres');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pos_Mar','Postres');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pos_TL','Postres');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pos_FCC','Postres');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Be_CoCa','Bebidas');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Be_ManPo','Bebidas');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Be_AC','Bebidas');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Be_JuHit','Bebidas');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pa_PP','Paquetes');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pa_Chee','Paquetes');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pa_Do','Paquetes');


insert into Trabajadores_has_Productos
values('1013456514','CC','R_E','Pa_TR','Paquetes');


--inserciones de Anderson

insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pan_R','Panes');

insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pan_B','Panes');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pan_O','Panes');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pan_Q','Panes');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pos_M','Postres');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pos_M','Postres');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pos_Mar','Postres');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pos_TL','Postres');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pos_FCC','Postres');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Be_CoCa','Bebidas');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Be_ManPo','Bebidas');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Be_AC','Bebidas');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Be_JuHit','Bebidas');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pa_PP','Paquetes');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pa_Chee','Paquetes');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pa_Do','Paquetes');


insert into Trabajadores_has_Productos
values('1234398712','CC','R_E','Pa_TR','Paquetes');


--inserciones de Yolanda


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pan_R','Panes');

insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pan_B','Panes');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pan_O','Panes');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pan_Q','Panes');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pos_M','Postres');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pos_M','Postres');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pos_Mar','Postres');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pos_TL','Postres');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pos_FCC','Postres');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Be_CoCa','Bebidas');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Be_ManPo','Bebidas');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Be_AC','Bebidas');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Be_JuHit','Bebidas');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pa_PP','Paquetes');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pa_Chee','Paquetes');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pa_Do','Paquetes');


insert into Trabajadores_has_Productos
values('6764593232','CC','R_E','Pa_TR','Paquetes');

--inserciones de Jeferson


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pan_R','Panes');

insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pan_B','Panes');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pan_O','Panes');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pan_Q','Panes');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pos_M','Postres');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pos_M','Postres');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pos_Mar','Postres');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pos_TL','Postres');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pos_FCC','Postres');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Be_CoCa','Bebidas');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Be_ManPo','Bebidas');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Be_AC','Bebidas');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Be_JuHit','Bebidas');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pa_PP','Paquetes');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pa_Chee','Paquetes');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pa_Do','Paquetes');


insert into Trabajadores_has_Productos
values('1001098654','CC','R_E','Pa_TR','Paquetes');

--Consultas 
select * from categorias;
select * from Productos;
select * from Trabajadores_has_Productos;
select * from Trabajadores;
select * from Tipo_Documento;
select * from Roles;

select P_Nombre
from Trabajadores
where P_nombre like 'Y%';

select P_Nombre
from Trabajadores
where P_nombre like 'J%';

select Cod_Prod, Desc_Prod, Valor_Prod
from Productos
where categorias_Categoria = 'Panes';

select Cod_Prod, Desc_Prod, Valor_Prod
from Productos
where categorias_Categoria = 'Panes' or categorias_Categoria = 'Paquetes';

select Cod_Prod, Desc_Prod, Valor_Prod, categorias_Categoria
from Productos
where Valor_Prod >='1500' and categorias_Categoria = 'Paquetes';

select Num_Documento, P_Nombre, P_Apellido, Email, Roles_Cod_Rol
from Trabajadores
where Roles_Cod_Rol = 'R_P';

--Uso de Joins

select Cod_Rol, Des_Rol, Num_Documento, P_nombre, P_Apellido
from Roles
join Trabajadores on Roles_Cod_Rol=Cod_Rol
where Cod_Rol = 'R_P';

select t_Doc, Des_tDoc, Num_Documento, P_Nombre, P_Apellido, Num_Tel
from Tipo_Documento
join Trabajadores on Tipo_Documento_t_Doc=t_Doc;

select Cod_Prod, Desc_Prod, Cant_Prod, Valor_Prod, Categoria
from Productos
join categorias on categorias_Categoria=Categoria;


select t_Doc, Des_tDoc, Num_Documento, P_Nombre, P_Apellido, Password, Email, Num_Tel, Cod_Rol, Des_Rol
from Tipo_Documento
join Trabajadores on Tipo_Documento_t_Doc=t_Doc
join Roles on Roles_Cod_Rol=Cod_Rol
where Cod_Rol = 'R_E';