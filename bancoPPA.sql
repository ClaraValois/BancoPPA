create schema sistema_almoxarifado;
use sistema_almoxarifado;

 create table Area_depar(
 id_area integer auto_increment primary key,
 nome_Dep varchar (40)
 );
CREATE TABLE Servidor ( 
 id_Servidor integer auto_increment primary key,
 Nome varchar(40),  
 tel integer,  
 tipo integer,  
 email varchar (80),  
id_area integer not null,
foreign key (id_area)  references Area_depar (id_area)); 

CREATE TABLE Requisicao( 
 status varchar(10),  
 id_req integer auto_increment primary key, 
 dataReq date,  
 id_Servidor integer not null,
 foreign key (id_Servidor) references Servidor (id_Servidor)
); 


CREATE TABLE Modelo ( 
 id_modelo integer auto_increment primary key,  
 descricao varchar(30)); 

CREATE TABLE Marca( 
 descricao  integer,  
 id_marca integer auto_increment primary key); 
 
 CREATE TABLE ValorProduto ( 
 id_valor integer auto_increment primary key,
 lote integer,  
 ValorLote float); 

CREATE TABLE TipoProduto 
(  id_tipo integer auto_increment primary key,  
 descricao varchar (30)); 

create table Produto( id_Prod INT PRIMARY KEY,  
 quantDisp integer,  
 Nome varchar(30),  
 id_marca integer not null,  
 id_modelo integer not null,  
 id_valor integer not null,
 id_tipo integer not null,
 
foreign key  (id_marca ) references Marca(id_marca ),
 foreign key  (id_modelo) references Modelo (id_modelo),
 foreign key  (id_valor) references ValorProduto(id_valor),
  foreign key  ( id_tipo) references TipoProduto( id_tipo)
); 
CREATE TABLE itemReq ( 
 quantSol integer not null,  
 id_req integer not null,  
 id_Prod integer not null, 
 foreign key (id_req) references Requisicao (id_req),
 foreign key (id_Prod) references Produto( id_Prod)
); 

CREATE TABLE NF 
( 
 id_nf integer auto_increment primary key,
 num_serie integer,  
 fornecedor varchar(25),  
 CNPJ integer  
); 
 
CREATE TABLE Entrada ( 
 qtd integer,  
 id_entrada integer auto_increment primary key,
 id_Prod integer not null,  
 id_nf integer not null,
 foreign key (id_nf) references NF(id_nf),
 foreign key (id_Prod) references Produto (id_Prod)
 ); 
 
 alter table Servidor add column id_chefia integer ;
 alter table Servidor add constraint foreign key (id_chefia) references Servidor (id_Servidor);

create table usuarios(
    id_user integer auto_increment primary key,
    nome VARCHAR(140),
    email VARCHAR(140) not null,
    senha VARCHAR(16)
);