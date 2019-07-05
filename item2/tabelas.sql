--==================================
--Rodrigo N. Wuerdig e Astelio Weber
------------------------------------
--FBD 2019/1
--==================================
drop view if exists lancamentos;
drop trigger IF EXISTS check_conta on conta;
drop procedure IF EXISTS aumenta_fatura; 
drop table if exists classifica;
drop table if exists possui;
drop table if exists cobranca;
drop table if exists favoritou;
drop table if exists contem;
drop table if exists compoe;
drop table if exists dirige;
drop table if exists atua;
drop table if exists lanca;
drop table if exists assiste;
drop table if exists diretor;
drop table if exists ator;
drop table if exists genero;
drop table if exists estudio;
drop table if exists conta;
drop table if exists perfil;
drop table if exists filmes;
drop table if exists series;
drop table if exists midia;
drop table if exists fatura;
drop table if exists favoritos;
drop table if exists vale_presente;
drop table if exists cartao;
drop table if exists temporada;
drop table if exists episodio;


create table diretor (
	IDd				char(3) 	not null,
	NOMED 			varchar(60) not null,
	NACIONALIDADE	char(2) 	not null,
	primary key(IDd));


create table ator (
	IDa				char(3) 	not null,
	NOME_ATOR		varchar(60) not null,
	NACIONALIDADE	char(2) 	not null,
	primary key(IDa));


create table genero (
	NOME_GENERO 	varchar(20) not null,
	primary key(NOME_GENERO));


create table estudio (
	NOME_ESTUDIO 	varchar(60) not null,
	PAIS 	char(2) not null,
	primary key(NOME_ESTUDIO));

---------------------------------------------------------------
---------------------------------------------------------------

create table conta (
	EMAIL			text not null,
	SENHA_DIGEST	text not null,
	NICKNAME 		varchar(60) not null,
	ATIVO 			boolean not null,
	primary key(EMAIL));


create table perfil (
	NOME_PERFIL 			varchar(60) not null,
	KIDS			boolean not null,
	primary key(NOME_PERFIL));


create table midia (
	NOME_MIDIA		varchar(60) not null,
	ANO				integer not null,
	SINOPSE 		text	not null,
	CLASSIFICACAO 	integer not null,
	primary key(NOME_MIDIA));

create table filmes (
	STREAMING_POINTER text not null,
	PREVIAF text not null,
	DURACAOF time not null,
	primary key(NOME_MIDIA)
	)INHERITS(midia);

create table series (
	CONCLUIDA boolean not null,
	primary key(NOME_MIDIA)	
	)INHERITS(midia);

---------------------------------------------------------------

create table favoritos (
	TITULO	varchar(60) not null,
	primary key(TITULO));

---------------------------------------------------------------
---------------------------------------------------------------

create table fatura (
	ANO_FATURA integer not null,
	MES_FATURA integer not null,
	VALOR money not null,
	primary key(ANO_FATURA,MES_FATURA));


create table vale_presente (
	COD_VALE_PRESENTE char(6) not null,
	MESES_RESTANTES   integer not null,
	primary key(COD_VALE_PRESENTE));

create table cartao (
	COD_CARTAO 	char(6) not null,
	NUM_CARTAO 	char(16) not null,
	CVV 		char(3) not null,
	VALIDADE 	date not null,
	CPF 		bigint not null,
	TITULAR 	varchar(60) not null,
	primary key(COD_CARTAO));
-------------------------------------------

create table temporada(
	IDt 			integer not null,
	ANO 			integer not null,
	RESUMO			text not null,
	PREVIAT 		text not null,
	QNT_EPISODIOS 	integer not null,
	primary key(IDt));


create table episodio(
	IDe				integer not null,
	DURACAOE		time not null,
	SINOPSEE		text not null,
	STREAMING_POINTER text not null,
	primary key(IDe));

--=================================================
--Relacionamentos n-m
--=================================================
create table dirige
(IDd			char(3) 	not null,
NOME_MIDIA		varchar(60) not null,
EPISODIOS		char(3),
primary key(NOME_MIDIA, IDd),
foreign key (IDd) references diretor,
foreign key (NOME_MIDIA) references midia);

create table atua
(IDa			char(3) not null,
NOME_MIDIA		varchar(60) not null,
EPISODIOS		char(3),
primary key(NOME_MIDIA, IDa),
foreign key (IDa) references ator,
foreign key (NOME_MIDIA) references midia);

create table lanca
(NOME_ESTUDIO 	varchar(60) not null,
NOME_MIDIA		varchar(60) not null,
DATA date not null,
primary key(NOME_MIDIA, NOME_ESTUDIO),
foreign key (NOME_ESTUDIO) references estudio,
foreign key (NOME_MIDIA) references midia);

create table assiste
(NOME_PERFIL 	varchar(60) not null,
NOME_MIDIA		varchar(60) not null,
DATA date not null,
TEMPO_ASSISTIDO time not null,
primary key (NOME_PERFIL,DATA,NOME_MIDIA),
foreign key (NOME_PERFIL) references perfil,
foreign key (NOME_MIDIA) references midia);


--=================================================
--Relacionamentos não n-m
--=================================================

create table classifica (
NOME_MIDIA		varchar(60) not null,
NOME_GENERO 	varchar(20) not null,
primary key(NOME_MIDIA,NOME_GENERO),
foreign key(NOME_GENERO) references genero,
foreign key(NOME_MIDIA) references midia);

create table possui(
NOME_PERFIL 	varchar(60) not null,
EMAIL			text not null,
primary key(NOME_PERFIL,EMAIL),
foreign key(EMAIL) references conta,
foreign key(NOME_PERFIL) references perfil);

create table cobranca(
ANO_FATURA 		integer not null,
MES_FATURA 		integer not null,
EMAIL			text not null,
primary key(ANO_FATURA,MES_FATURA,EMAIL),
foreign key(ANO_FATURA,MES_FATURA) references fatura,
foreign key(EMAIL) references conta);

create table favoritou(
TITULO			varchar(60) not null,
NOME_PERFIL 	varchar(60) not null,
primary key(TITULO,NOME_PERFIL),
foreign key(TITULO) references favoritos,
foreign key(NOME_PERFIL) references perfil);

create table contem(
NOME_MIDIA		varchar(60) not null,
IDt 			integer not null,
primary key(NOME_MIDIA,IDt),
foreign key(NOME_MIDIA) references series,
foreign key(IDt) references temporada);

create table compoe(
IDt 			integer not null,
IDe 			integer not null,
primary key(IDt,IDe),
foreign key(IDt) references temporada,
foreign key(IDe) references episodio);


