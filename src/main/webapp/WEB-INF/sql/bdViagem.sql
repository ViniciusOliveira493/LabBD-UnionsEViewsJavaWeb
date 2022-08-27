CREATE DATABASE bdViagem
GO
USE bdViagem
CREATE TABLE tbMotorista(
	codigo						INTEGER				NOT NULL
	, nome						VARCHAR(80)			NOT NULL
	, naturalidade				VARCHAR(50)			NOT NULL
	PRIMARY KEY (codigo)
); 
CREATE TABLE tbOnibus(
	placa						CHAR(7)				NOT NULL
	, marca						VARCHAR(40)			NOT NULL
	, ano						INTEGER				NOT NULL
	, descricao					VARCHAR(90)			NOT NULL
	PRIMARY KEY (placa)
);
CREATE TABLE tbViagem(
	codigo						INTEGER				NOT NULL
	, onibusPlaca				CHAR(7)				NOT NULL
	, motoristaCodigo			INTEGER				NOT NULL
	, horaSaida					INTEGER				NOT NULL	CHECK(horaSaida >= 0)
	, horaChegada				INTEGER				NOT NULL	CHECK(horaChegada >= 0)
	, partida					VARCHAR(50)			NOT NULL
	, destino					VARCHAR(50)			NOT NULL
);

--===============================================================================================
--1) Criar um Union das tabelas Motorista e ônibus, com as colunas ID (Código e Placa) e Nome (Nome e Marca)															
SELECT 
	CAST(m.codigo AS varchar(12)) AS 'id'
	, m.nome AS 'nome'
	, 'MOTORISTA' AS tipo
FROM tbMotorista AS m
UNION
SELECT 
	o.placa AS 'id'
	, o.marca AS 'nome'
	, 'ÔNIBUS' AS tipo
FROM tbOnibus AS o

--2) Criar uma View (Chamada v_motorista_onibus) do Union acima															
CREATE VIEW v_motorista_onibus
AS
SELECT 
	CAST(m.codigo AS varchar(12)) AS 'id'
	, m.nome AS 'nome'
	, 'MOTORISTA' AS tipo
FROM tbMotorista AS m
UNION
SELECT 
	o.placa AS 'id'
	, o.marca AS 'nome'
	, 'ÔNIBUS' AS tipo
FROM tbOnibus AS o

SELECT * from v_motorista_onibus
--3) Criar uma View (Chamada v_descricao_onibus) que mostre o Código da Viagem, o Nome do motorista, a placa do ônibus (Formato XXX-0000), a Marca do 
--ônibus, o Ano do ônibus e a descrição do onibus
CREATE VIEW v_descricao_onibus
AS
SELECT 
	v.codigo AS 'codViagem'
	, m.nome AS 'nomeMotorista'
	, SUBSTRING(o.placa,1,3) + '-' + SUBSTRING(o.placa,4,4) AS 'placaOnibus'
	, o.marca AS 'marcaOnibus'
	, o.ano AS 'anoOnibus'
	, o.descricao AS 'descOnibus'
FROM tbViagem AS v
	INNER JOIN tbMotorista AS m
		ON m.codigo = v.motoristaCodigo
	INNER JOIN tbOnibus AS o
		ON o.placa = v.onibusPlaca

SELECT * from v_descricao_onibus
--4) Criar uma View (Chamada v_descricao_viagem) que mostre o Código da viagem, a placa do ônibus(Formato XXX-0000), a 
--Hora da Saída da viagem (Formato HH:00), a Hora da Chegada da viagem (Formato HH:00), partida e destino
CREATE VIEW v_descricao_viagem
AS
SELECT 
	v.codigo AS 'codViagem'
	, SUBSTRING(o.placa,1,3) + '-' + SUBSTRING(o.placa,4,4) AS 'placaOnibus'
	, CAST(v.horaSaida AS VARCHAR(2)) + ':00' AS 'saida'
	, CAST(v.horaChegada AS VARCHAR(2)) + ':00' AS 'chegada'
	, v.partida AS 'partida'
	, v.destino AS 'destino'
FROM tbViagem AS v
	INNER JOIN tbOnibus AS o
		ON v.onibusPlaca = o.placa

SELECT * from v_descricao_viagem