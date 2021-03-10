use ViacaoBD;

create table Empresa
(
	id int not null primary key,
	Nome varchar(50) not null,
	Site_empr varchar(50), 
);

create table End_Transp
(
	id_End int not null primary key,
	Logradouro varchar(50) not null,
	Bairro varchar(50) not null,
	Numero int not null,
	Complemento varchar(10),
	Localidade varchar(50) not null,
	UF char(2) not null,
	CEP char(8) not null,

	constraint fk_end_emp foreign key(id_End) references Empresa(id), 

);

create table Telefone_empr
(
	id_Fone int not null primary key,
	Numero char(9) not null,

	constraint fk_Fone_emp foreign key(id_Fone) references Empresa(id),
);

create table Linha
(
	id_Linha int not null primary key,
	id_emp int not null,
	Nome varchar(50) not null,
	
	constraint fk_linha_emp foreign key(id_Linha) references Empresa(id),
);

create table Dias
(
	id_Dia int not null primary key,
	Dia varchar(10) not null,
);

create table Horarios
(
	id_Hr int not null primary key,
	Horario time not null,
);

create table Quadro_horarios_Dias
(
	id_Quadro int not null primary key,
	Linha int not null,
	Hr int not null,
	DiaSemana int not null
	
	constraint fk_Hr foreign key(Hr) references Horarios(id_Hr),
	constraint fk_Dia foreign key(DiaSemana) references Dias(id_Dia),
	constraint fk_Linha foreign key(Linha) references Linha(id_Linha),
);

create table Itinerario
(
	id_Itinerario int not null primary key,
	Sentido varchar(50) not null,

	constraint fk_Itinerario_linha foreign key(id_Itinerario) references Linha(id_Linha),
);

create table Logradouro
(
	id_Logradouro int not null primary key,
	Nome varchar(50) not null,
);

create table LogradouroItinerario
(
	id_Itin int not null,
	id_Logr int not null,

	constraint fk_id_Itin foreign key(id_Itin) references Itinerario(id_Itinerario),
	constraint fk_id_Logr foreign key(id_Logr) references Logradouro(id_Logradouro),
);

insert into Empresa values (1, 'Viação Paraty', 'www.vparty.com.br')
insert into End_Transp values (1, 'Av Otto Hermani Muller', 'Jardim Tramoio', '10', 'nenhum', 'Araraquara', 'SP', '14800630');
insert into Empresa values(2, 'Empresa Cruz', 'www.empresacruz.com.br');
insert into End_Transp values (2, 'Rua 17', 'Jardim Nova America', '6', 'nenhum', 'Araraquara', 'SP', '14800320');

insert into Linha (id_Linha, id_emp, Nome)values (1, 1, 'Aguas do Paiol');
insert into Linha (id_Linha, id_emp, Nome)values (2, 2, 'Jd. Iguatemi');

insert into Itinerario (id_Itinerario, Sentido) values (1, 'Aguas do Paiol / Terminal');
insert into Itinerario (id_Itinerario, Sentido) values (2, 'Terminal / Jd. Iguatemi');

insert into Logradouro (id_Logradouro, Nome) values(1,'Av. Augusto Bernardi');
insert into Logradouro (id_Logradouro, Nome) values(2,'Rua Lino Morgante');
insert into Logradouro (id_Logradouro, Nome) values(3,'Rua Renato Maximiliano');
insert into Logradouro (id_Logradouro, Nome) values(4,'Av. Miguel Pocce');
insert into Logradouro (id_Logradouro, Nome) values(5,'Av. José Barbanti Neto');
insert into Logradouro (id_Logradouro, Nome) values(6,'Av. Antônio Honório Real');
insert into Logradouro (id_Logradouro, Nome) values(7,'Av. Prof° Gustavo Fleury Charmillot');
insert into Logradouro (id_Logradouro, Nome) values(8,'Rua Bento Machado Ramalho');
insert into Logradouro (id_Logradouro, Nome) values(9,'Rua Prof. Virgilio Abranches Quintão');
insert into Logradouro (id_Logradouro, Nome) values(10,'Rua Carlos Gomes');
insert into Logradouro (id_Logradouro, Nome) values(11,'Av. Padre Francisco Sales Culturato');
insert into Logradouro (id_Logradouro, Nome) values(12,'Rua São Bento');
insert into Logradouro (id_Logradouro, Nome) values(13,'Av. Portugal');

insert into Logradouro (id_Logradouro, Nome) values(14,'R. Antônio Prado');
insert into Logradouro (id_Logradouro, Nome) values(15,'Av. Padre José de Anchieta');
insert into Logradouro (id_Logradouro, Nome) values(16,'Av. Engº. Camilo Dinucci');
insert into Logradouro (id_Logradouro, Nome) values(17,'Av. Roberto de Jesus Afonso');
insert into Logradouro (id_Logradouro, Nome) values(18,' Av. Rafael Medina, rua Savério Lia Rolfsen');
insert into Logradouro (id_Logradouro, Nome) values(19,'Av. Jorge Miguel Saba');
insert into Logradouro (id_Logradouro, Nome) values(20,'Rua Romão Boner');
insert into Logradouro (id_Logradouro, Nome) values(21,'Av. Miguel Bucalen');
insert into Logradouro (id_Logradouro, Nome) values(22,'R. Pedro José Laroca');
insert into Logradouro (id_Logradouro, Nome) values(23,'Av. Badia Miguel Saba');

select * from Logradouro;

insert into Dias (id_Dia, Dia) values (1, 'Dom/Fer');
insert into Dias (id_Dia, Dia) values (2, 'Segunda');
insert into Dias (id_Dia, Dia) values (3, 'Terça');
insert into Dias (id_Dia, Dia) values (4, 'Quarta');
insert into Dias (id_Dia, Dia) values (5, 'Quinta');
insert into Dias (id_Dia, Dia) values (6, 'Sexta');
insert into Dias (id_Dia, Dia) values (7, 'Sabado');

select * from Dias;

insert into Horarios (id_Hr, Horario) values (1,'05:05');
insert into Horarios (id_Hr, Horario) values (2,'05:00');
insert into Horarios (id_Hr, Horario) values (3,'05:15');
insert into Horarios (id_Hr, Horario) values (4,'05:33');

select * from Horarios;

insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (1,1,1,1);
insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (2,1,2,2);
insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (3,1,2,3);
insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (4,1,2,4);
insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (5,1,2,5);
insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (6,1,2,7);

insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (7,2,4,1);
insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (8,2,3,2);
insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (9,2,3,3);
insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (10,2,3,4);
insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (11,2,3,5);
insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (12,2,3,6);
insert into Quadro_horarios_Dias (id_Quadro, Linha, Hr,DiaSemana) values (13,2,3,7);

select * from Quadro_horarios_Dias;

insert into LogradouroItinerario (id_Itin, id_Logr) values (1,1);
insert into LogradouroItinerario (id_Itin, id_Logr) values (1,2);
insert into LogradouroItinerario (id_Itin, id_Logr) values (1,3);
insert into LogradouroItinerario (id_Itin, id_Logr) values (1,4);
insert into LogradouroItinerario (id_Itin, id_Logr) values (1,5);
insert into LogradouroItinerario (id_Itin, id_Logr) values (1,6);
insert into LogradouroItinerario (id_Itin, id_Logr) values (1,7);
insert into LogradouroItinerario (id_Itin, id_Logr) values (1,8);
insert into LogradouroItinerario (id_Itin, id_Logr) values (1,9);
insert into LogradouroItinerario (id_Itin, id_Logr) values (1,10);
insert into LogradouroItinerario (id_Itin, id_Logr) values (1,11);
insert into LogradouroItinerario (id_Itin, id_Logr) values (1,12);
insert into LogradouroItinerario (id_Itin, id_Logr) values (1,13);

insert into LogradouroItinerario (id_Itin, id_Logr) values (2,13);
insert into LogradouroItinerario (id_Itin, id_Logr) values (2,14);
insert into LogradouroItinerario (id_Itin, id_Logr) values (2,15);
insert into LogradouroItinerario (id_Itin, id_Logr) values (2,16);
insert into LogradouroItinerario (id_Itin, id_Logr) values (2,17);
insert into LogradouroItinerario (id_Itin, id_Logr) values (2,18);
insert into LogradouroItinerario (id_Itin, id_Logr) values (2,19);
insert into LogradouroItinerario (id_Itin, id_Logr) values (2,20);
insert into LogradouroItinerario (id_Itin, id_Logr) values (2,21);
insert into LogradouroItinerario (id_Itin, id_Logr) values (2,22);
insert into LogradouroItinerario (id_Itin, id_Logr) values (2,23);

select * from LogradouroItinerario;

--Seleciona linha qua a empresa possui

select Linha.Nome as 'Linha' from Linha join Empresa 
on Linha.id_emp=Empresa.id where  Empresa.Nome =  'Viação Paraty';

--Seleciona o Itinerario de uma linha

select Logradouro.Nome as 'Itinerario' 
from Logradouro 
join LogradouroItinerario on id_Logr = id_Logradouro
join Itinerario on  id_Itinerario = id_Itin
join Linha on id_Linha = id_Itinerario
where Linha.Nome = 'Aguas do Paiol';

--Seleciona quadro de horarios

select H.Horario as 'Horario' , D.Dia as 'Dia da Semana'
from Horarios H
join Quadro_horarios_Dias Qhr on Qhr.Hr = H.id_Hr
join Dias D on Qhr.DiaSemana = D.id_Dia
join Linha on id_Linha = Qhr.Linha
where Linha.Nome = 'Jd. Iguatemi';

--Obtem as linhas que passam em um determinado logradouro

select E.Nome as 'Empresas' 
from Empresa E 
join Linha L on L.id_emp = E.id
join Itinerario I on  I.id_Itinerario = L.id_Linha
join LogradouroItinerario Lo on Lo.id_Itin = I.id_Itinerario
join Logradouro Lg on Lg.id_Logradouro = Lo.id_Logr 
where Lg.Nome = 'Av. Augusto Bernardi';
