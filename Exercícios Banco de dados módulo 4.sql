-- Exercícios JOIN

-- create table
create table alunos (
  id int(11) primary key auto_increment,
  nome varchar(255) not null,
  nascimento date
);


create table turmas (
  id int(11) primary key auto_increment,
  nome varchar(255) not null,
  turno enum('manha', 'tarde', 'noite')
);

create table aluno_turma (
  id int(11) primary key auto_increment,
  aluno_id int(11) not null,
  turma_id int(11) not null,
	foreign key (aluno_id) references alunos(id),
	foreign key (turma_id) references turmas(id)
);


insert into alunos (nome, nascimento) values ('André Neves', '2000-01-08');
insert into alunos (nome, nascimento) values ('Henrique Silva', '2001-03-10');
insert into alunos (nome, nascimento) values ('Everton Moraes', '2002-07-05');
insert into alunos (nome, nascimento) values ('Luciano Francisco', '2004-08-12');
insert into alunos (nome, nascimento) values ('Evelin Souza', '2001-03-23');
insert into alunos (nome, nascimento) values ('Nathalia Andrade', '2002-12-28');
insert into alunos (nome, nascimento) values ('Julia Santos', '2003-02-12');

insert into turmas (nome, turno) values ('Manhã A', 'manha');
insert into turmas (nome, turno) values ('Manhã B', 'manha');
insert into turmas (nome, turno) values ('Tarde A', 'tarde');
insert into turmas (nome, turno) values ('Tarde B', 'tarde');
insert into turmas (nome, turno) values ('Noite A', 'noite');
insert into turmas (nome, turno) values ('Noite B', 'noite');

insert into aluno_turma (aluno_id, turma_id) values (1, 6);
insert into aluno_turma (aluno_id, turma_id) values (2, 5);
insert into aluno_turma (aluno_id, turma_id) values (3, 4);
insert into aluno_turma (aluno_id, turma_id) values (4, 3);
insert into aluno_turma (aluno_id, turma_id) values (5, 2);
insert into aluno_turma (aluno_id, turma_id) values (6, 1);
insert into aluno_turma (aluno_id, turma_id) values (7, 6);
insert into aluno_turma (aluno_id, turma_id) values (1, 5);
insert into aluno_turma (aluno_id, turma_id) values (2, 4);
insert into aluno_turma (aluno_id, turma_id) values (3, 3);
insert into aluno_turma (aluno_id, turma_id) values (4, 2);
insert into aluno_turma (aluno_id, turma_id) values (5, 1);	

-- Resolução
-- 1) Retornar todos os alunos do turno 'noite'
SELECT
a.nome,
turmas.turno,
turmas.nome
FROM alunos a
inner join aluno_turma on aluno_turma.aluno_id = a.id
inner join turmas on turmas.id = aluno_turma.turma_id
where turmas.turno = 'noite';

-- 2) Retornar todos os alunos da turma 'Tarde A'
SELECT
a.nome,
turmas.nome
FROM alunos a
inner join aluno_turma on aluno_turma.aluno_id = a.id
inner join turmas on turmas.id = aluno_turma.turma_id
where turmas.nome = 'Tarde A';


-- 3) Retornar as turmas do aluno 'André Neves'
SELECT
a.nome,
turmas.turno,
turmas.nome
FROM alunos a
inner join aluno_turma on aluno_turma.aluno_id = a.id
inner join turmas on turmas.id = aluno_turma.turma_id
where a.nome = 'André Neves';


-- 4) Retornar todas as turmas dos alunos que tenham nascido depois de 2001
SELECT
distinct turmas.nome
FROM alunos a
inner join aluno_turma on aluno_turma.aluno_id = a.id
inner join turmas on turmas.id = aluno_turma.turma_id
where a.nascimento > '2001';


-- Parte 2 

-- BDIIIA11 - exercícios

DROP DATABASE bd3;
CREATE DATABASE bd3;

USE bd3;

-- create table
CREATE TABLE clientes (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cpf varchar(20) NOT NULL,
  nome varchar(200) NOT NULL,
  cidade varchar(200) NOT NULL,
  email varchar(200) NOT NULL
);

CREATE TABLE solicitacoes (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome varchar(80) NOT NULL,
  data timestamp NOT NULL,
  cliente_id int(11) NOT NULL,
  CONSTRAINT FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- insert clientes
insert into clientes (cpf, nome, cidade, email) values ('123456789', 'André', 'Rio de Janeiro', 'andr@andr.com.br');
insert into clientes (cpf, nome, cidade, email) values ('234567891', 'Bruno', 'Rio de Janeiro', 'bruno@andr.com.br');
insert into clientes (cpf, nome, cidade, email) values ('345678912', 'David', 'Arraial do Cabo', 'david@andr.com.br');

-- insert solicitacoes
insert into solicitacoes (nome, data, cliente_id) values ('Mouse com defeito', NOW(), 1);
insert into solicitacoes (nome, data, cliente_id) values ('Erro na senha', NOW(), 1);
insert into solicitacoes (nome, data, cliente_id) values ('Teclado com tecla ruim', NOW(), 1);
insert into solicitacoes (nome, data, cliente_id) values ('Senha fora da validade', NOW(), 2);
insert into solicitacoes (nome, data, cliente_id) values ('Monitor com defeito', NOW(), 2);
insert into solicitacoes (nome, data, cliente_id) values ('Sumiu meu mouse', NOW(), 3);

-- Resolução

-- Criação do banco
CREATE DATABASE bd4;

USE bd4;

-- create table
CREATE TABLE clientes (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cpf varchar(20) NOT NULL,
  nome varchar(200) NOT NULL,
  cidade varchar(200) NOT NULL,
  email varchar(200) NOT NULL
);

CREATE TABLE solicitacoes (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome varchar(80) NOT NULL,
  data timestamp NOT NULL,
  cliente_id int(11) NOT NULL,
  CONSTRAINT FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- insert clientes
insert into clientes (cpf, nome, cidade, email) values ('123456789', 'André', 'Rio de Janeiro', 'andr@andr.com.br');
insert into clientes (cpf, nome, cidade, email) values ('234567891', 'Bruno', 'Rio de Janeiro', 'bruno@andr.com.br');
insert into clientes (cpf, nome, cidade, email) values ('345678912', 'David', 'Arraial do Cabo', 'david@andr.com.br');

-- insert solicitacoes
insert into solicitacoes (nome, data, cliente_id) values ('Mouse com defeito', NOW(), 1);
insert into solicitacoes (nome, data, cliente_id) values ('Erro na senha', NOW(), 1);
insert into solicitacoes (nome, data, cliente_id) values ('Teclado com tecla ruim', NOW(), 1);
insert into solicitacoes (nome, data, cliente_id) values ('Senha fora da validade', NOW(), 2);
insert into solicitacoes (nome, data, cliente_id) values ('Monitor com defeito', NOW(), 2);
insert into solicitacoes (nome, data, cliente_id) values ('Sumiu meu mouse', NOW(), 3);


-- 1) Crie um relatório que possua a quantidade de solicitações por usuários
-- O relatório deve conter os seguintes campos: nome do cliente, quantidade de solicitacoes
select 
	clientes.nome as cliente
	, count(solicitacoes.id) as solicitações_realizadas
from clientes
inner join solicitacoes on solicitacoes.cliente_id = clientes.id
group by clientes.nome;


-- 2) Crie o relatório acima ordenando em ordem decrescente de solicitações
select 
	clientes.nome
	, count(solicitacoes.id) as solicitacoes_feitas
from clientes
inner join solicitacoes on solicitacoes.cliente_id = clientes.id
group by clientes.nome
order by count(solicitacoes.id) DESC;


-- 3) Quantos clientes o sistema tem por cidade
select 
	cidade
    ,count(id) as clientes
from clientes
group by cidade;


-- 4) Relatório de solicitações por cidade
select 
	clientes.cidade as cidade
	,count(solicitacoes.id) as solicitacoes_feitas
from clientes
inner join solicitacoes on solicitacoes.cliente_id = clientes.id
group by clientes.cidade;


-- 5) Relatório com todos os clientes que fizeram mais de uma solicitação
select 
	clientes.nome
    ,count(solicitacoes.id) as solicitacoes
from clientes
inner join solicitacoes on solicitacoes.cliente_id = clientes.id
group by clientes.nome
having count(solicitacoes.id) > 1;