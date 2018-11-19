create database Empresa;

use Empresa;
create schema RRHH;
create schema Compras;
create schema Ventas;

create table RRHH.tipoUsuario(
id_tipo int(11) primary key,
nomTipo varchar(45),
Config boolean,
AddMesa boolean,
ConfigPre boolean,
ModifPro boolean
);
create table RRHH.Usuarios(
idUser int primary key  auto_increment,
Usuario varchar(45) ,
pwdUser varchar(45),
Correo varchar(45),
nomUser varchar(45),
apeUser varchar(60),
last_Sesion varchar(30),
time_SignIn varchar(30),
id_tipo int(11) ,
foreign key (id_tipo) references RRHH.tipoUsuario(id_tipo)
);
create table Ventas.NumMesa(
idMesa int(11) primary key auto_increment,
numMesa int(11),
numSillas int(11) default 4
);
create table Ventas.TipoMesa(
idTipo int(11) primary key auto_increment,
nomTipo varchar(40),
numMesa int(11),
foreign key(numMesa) references Ventas.NumMesa(idMesa)
);
create table Ventas.TipoProductos(
idTipo_Pro int(11) primary key,
nomTip_pro varchar(45)
);
create table Ventas.Productos(
idPro int(11) primary key auto_increment,
CodPro varchar(45),
nomPro varchar(45),
stock int(11),
precio double,
foreign key(idPro) references Ventas.TipoProductos(idTipo_Pro)
);
create table Ventas.menu(
idMenu int(11) primary key,
nomMenu varchar(45),
foreign key (idMenu) references Ventas.TipoProductos(idTipo_Pro)
);
create table Ventas.Bebidas(
idBebida int(11) primary key,
nomBebida varchar(45),
foreign key (idBebida) references Ventas.TipoProductos(idTipo_Pro)
);
create table Ventas.Extras(
idExtras int(11) primary key,
nomExtras varchar(45),
foreign key (idExtras) references Ventas.TipoProductos(idTipo_Pro)
);
create table Ventas.Clientes(
idCliente int(11) primary key auto_increment,
CodCli varchar(45),
dniCli int(8) ,
nomCli varchar(45),
apeCli varchar(65),
telefono int(9),
numMesa int(11) ,
foreign key (numMesa) references Ventas.NumMesa(idMesa)
);
create table Ventas.Platillos(
idVentaMenu int(11) primary key auto_increment,
numVenta varchar(45),
nomExtras varchar(45),
cant int(11) default 1,
idCli int(11),
tipo int(11),
foreign key (tipo) references Ventas.Productos(idPro),
foreign key (idCli) references Ventas.Clientes(idCliente)
);

drop table Ventas.TipoMesa;
drop table Ventas.nummesa;
drop table Ventas.Productos;
drop table Ventas.Clientes;
drop table Ventas.Platillos;

select*from RRHH.tipoUsuario;
select*from RRHH.Usuarios;
select*from Ventas.NumMesa;
select*from Ventas.TipoMesa;
select*from Ventas.TipoProductos;
select*from Ventas.Productos;
select*from Ventas.Clientes;
select*from  Ventas.tiposMenu;


select*from Ventas.Platillos;
#select*from tb_Usuario where Usuario = ? and pwdUser= ?
#drop database tb_Usuario

#por defecto
insert into RRHH.tipoUsuario values(0,'Usuario',false,false,false,false);
insert into RRHH.tipoUsuario values(2,'Administrador',false,false,false,false);

insert into Ventas.TipoProductos values(0,'Menú');
insert into Ventas.TipoProductos values(1,'Bebidas');
insert into Ventas.TipoProductos values(2,'Extras');

insert into Ventas.TipoMesa(nomTipo) values('libre');
insert into Ventas.TipoMesa(nomTipo) values('Disponible');
insert into Ventas.TipoMesa(nomTipo) values('Completo');
insert into Ventas.NumMesa values(0,20,default);
#por defecto
select numMesa from Ventas.NumMesa;


a



#insert into tb_Usuario (usuario,pwdUser) values('admin','admin')



DELIMITER $$;
CREATE PROCEDURE Sign_in(usr varchar(45), pws char(45))
BEGIN
select * from Usuario
 where usuario = usr and pwdUser = pws;
END $$
DELIMITER ;

