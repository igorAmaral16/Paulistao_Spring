CREATE DATABASE trabalho1
GO
USE trabalho1
GO
CREATE TABLE times(
codigo_time			INT				NOT NULL,
nome_time			VARCHAR(100)	NOT NULL,
cidade				VARCHAR(50)		NOT NULL,
estadio				VARCHAR(50)		NOT NULL,
materialEsportivo	VARCHAR(50)		NOT NULL,
PRIMARY KEY(codigo_time)
)

CREATE TABLE grupos(
grupo				CHAR(1)	CHECK(grupo = 'A' OR grupo = 'B' OR grupo = 'C' OR grupo = 'D')		NOT NULL,
codigo_time			INT				NOT NULL,
FOREIGN KEY(codigo_time) REFERENCES times(codigo_time),
PRIMARY KEY(grupo, codigo_time)
)
GO
CREATE TABLE jogos(
codigo_jogo			INT		IDENTITY	NOT NULL,
codigo_timeA		INT		NOT NULL,
codigo_timeB		INT		NOT NULL,
gols_timeA			INT		NULL,
gols_timeB			INT		NULL,
data_jogo			DATE	NULL,
FOREIGN KEY(codigo_timeA) REFERENCES times(codigo_time),
FOREIGN KEY(codigo_timeB) REFERENCES times(codigo_time),
PRIMARY KEY(codigo_jogo)
)
GO
INSERT INTO times VALUES
(1,'Água Santa','Diadema','Distrital do Inamar','Karilu'),
(2,'Botafogo-SP','Ribeirão Preto','Santa Cruz',' Volt Sport'),
(3,'Corinthians','São Paulo','Neo Quimica Arena','Nike'),
(4,'Ferrroviária','Araraquara','Fonte Luminosa','Lupo'),
(5,'Guarani','Campinas','Brinco de Ouro','Kappa'),
(6,'Inter de Limeira','Limeira','Limeirão','Alluri Sports'),
(7,'Ituano','Itu','Novelli Junior','Kanxa'),
(8,'Mirassol','Mirassol','Jósé Maria de Campos Maia','Super Bolla'),
(9,'Novorizontino','Novo Horizonte','Jorge Irmael de Biasi','Physicus'),
(10,'Palmeiras','São Paulo','Allianz Parque','Puma'),
(11,'Ponte Preta','Campinas','Moisés Lucarelli','1900(Marca Própria)'),
(12,'Red Bulll Bragantino','Bragança Paulista','Nabi Abi Chedid','Nike'),
(13,'Santo André','Santo André',' Bruno José Daniel','Icone Sports'),
(14,'Santos','Santos','Vila Belmiro','Umbro'),
(15,'São Bernardo','São Bernardo do Campo','Primeiro de Maio','Magnum Group'),
(16,'São Paulo','São Paulo','Morumbi','Adidas')


SELECT * FROM times
SELECT * FROM grupos

CREATE PROCEDURE sp_gerar_grupo
AS
	DELETE grupos

DECLARE		@times		INT,
			@cont		INT,
			@cod_grupo	INT

	SET @cont = 1
	SET @times = 16

	IF (@cont = 1)
	BEGIN
		INSERT INTO grupos VALUES 
		('A',3),
		('B',10),
		('C',14),
		('D',16)
	END

	--colocando o restante dos times nos grupos enquanto cont for menor ou igual a times
	WHILE (@cont <= @times)
	BEGIN 
		--criar um id random de 1 a 4 para a criação de grupos aleatórios toda vez que o while for iniciado
		SET @cod_grupo = CAST(RAND()*(4) + 1 AS INT)

		--verificando os times grandes
		--caso seja um dos times grandes, cont receberá +1 e vai adicionar outro time no lugar
		IF (@cont != 3 AND @cont != 10 AND @cont != 14 AND @cont != 16)
		BEGIN
			IF @cod_grupo = 1 
			BEGIN
				IF (SELECT COUNT(*) FROM grupos WHERE grupo = 'A') < 4
				BEGIN
					INSERT INTO grupos VALUES (UPPER('a'), @cont)

					SET @cont = @cont + 1
					CONTINUE
				END
			END
			IF @cod_grupo = 2 
			BEGIN
				IF (SELECT COUNT(*) FROM grupos WHERE grupo = 'B') < 4
				BEGIN
					INSERT INTO grupos VALUES (UPPER('b'), @cont)

					SET @cont = @cont + 1
					CONTINUE
				END
			END
			IF @cod_grupo = 3 
				IF (SELECT COUNT(*) FROM grupos WHERE grupo = 'C') < 4
				BEGIN
					INSERT INTO grupos VALUES (UPPER('c'), @cont)

					SET @cont = @cont + 1
					CONTINUE
				END
			IF @cod_grupo = 4 
			BEGIN
				IF (SELECT COUNT(*) FROM grupos WHERE grupo = 'D') < 4
				BEGIN
					INSERT INTO grupos VALUES (UPPER('d'), @cont)

					SET @cont = @cont + 1
					CONTINUE
				END
			END
		END
		ELSE
		BEGIN
			
			SET @cont = @cont + 1
		END 
	END

	EXEC sp_gerar_grupo
	SELECT * FROM grupos ORDER BY grupo
	----------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_criaJogos (@grupo VARCHAR(2))
AS
	
	DECLARE @a AS TABLE (
				id		INT IDENTITY,
				CodigoA INT
				)
	DECLARE @b AS TABLE (
				id		INT IDENTITY,
				CodigoB INT
				)
	DECLARE @datas AS TABLE(
				dias DATE
				)

	INSERT INTO @a 
	SELECT codigo_time AS CodigoA 
	FROM grupos 
	WHERE grupo = SUBSTRING(@grupo,1,1)

	INSERT INTO @b 
	SELECT codigo_time AS CodigoB 
	FROM grupos 
	WHERE grupo = SUBSTRING(@grupo,2,1)

		INSERT INTO jogos
		SELECT DISTINCT timeA.CodigoA, timeB.CodigoB, NULL, NULL, NULL
		FROM @a timeA, @b timeB
		WHERE timeA.CodigoA <> timeB.CodigoB

	--procedure que gerar os jogos com as datas
CREATE PROC sp_GerarJogos
AS
	TRUNCATE TABLE jogos
	DECLARE @cont	INT,
			@vetor_grupos	CHAR(2)

	DECLARE @id				INT,
			@data			DATE,
			@data_inicial	DATE

	SET @cont = 1
	SET @id = 1
	SET @data_inicial = '2023-01-14'

	WHILE @cont <= 6
	BEGIN
		SET @vetor_grupos = 
		CASE 
			WHEN @cont = 1 THEN 'AB'
			WHEN @cont = 2 THEN 'CD'
			WHEN @cont = 3 THEN 'AC'
			WHEN @cont = 4 THEN 'BC'
			WHEN @cont = 5 THEN 'AD'
			WHEN @cont = 6 THEN 'BD'
		END

		SET @cont = @cont + 1

		EXEC sp_criaJogos @vetor_grupos
	END

	WHILE @id <= 96
	BEGIN
		SET @data =
			CASE
				WHEN @id IN ( 1,  6, 11, 16, 17, 22, 27, 32) THEN DATEADD(DAY,0,@data_inicial) 
				WHEN @id IN ( 2,  7, 12, 13, 18, 23, 28, 29) THEN DATEADD(DAY,3,@data_inicial)   
				WHEN @id IN ( 3,  8,  9, 14, 19, 24, 25, 30) THEN DATEADD(DAY,7,@data_inicial)
				WHEN @id IN ( 4,  5, 10, 15, 20, 21, 26, 31) THEN DATEADD(DAY,10,@data_inicial)
				WHEN @id IN (33, 38, 43, 48, 49, 54, 59, 64) THEN DATEADD(DAY,14,@data_inicial) 
				WHEN @id IN (34, 39, 44, 45, 50, 55, 60, 61) THEN DATEADD(DAY,17,@data_inicial) 
				WHEN @id IN (35, 40, 41, 46, 51, 56, 57, 62) THEN DATEADD(DAY,20,@data_inicial) 
				WHEN @id IN (36, 37, 42, 47, 52, 53, 58, 63) THEN DATEADD(DAY,24,@data_inicial)
				WHEN @id IN (65, 70, 75, 80, 81, 86, 91, 96) THEN DATEADD(DAY,27,@data_inicial)
				WHEN @id IN (66, 71, 76, 77, 82, 87, 92, 93) THEN DATEADD(DAY,30,@data_inicial)
				WHEN @id IN (67, 72, 73, 78, 83, 88, 89, 94) THEN DATEADD(DAY,34,@data_inicial)
				WHEN @id IN (68, 69, 74, 79, 84, 85, 90, 95) THEN DATEADD(DAY,37,@data_inicial) 
			END
				UPDATE jogos
				SET data_jogo = @data
				WHERE codigo_jogo = @id
			
				SET @id = @id + 1
		END
	
EXEC sp_GerarJogos
SELECT * FROM jogos ORDER BY data_jogo ASC

CREATE VIEW jogosGerados AS
SELECT j.codigo_jogo, tA.nome_time AS timeA, tB.nome_time AS timeB, j.gols_timeA, j.gols_timeB, j.data_jogo
FROM times tA, times tB, jogos j
WHERE tA.codigo_time = j.codigo_timeA
AND tB.codigo_time = j.codigo_timeB

SELECT timeA, gols_timeA, timeB, gols_timeB, data_jogo FROM jogosGerados WHERE data_jogo = '14/01/2023'
SELECT timeA, timeB FROM jogosGerados

--------------------------------------------------------------------------------------------------------------------------------

--COMEÇO DA AV 2

--TRIGGER PARA INSERT DELETE E UPDATE DOS TIMES
CREATE TRIGGER t_nAoInsDelUpTimes ON times
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
	ROLLBACK TRANSACTION

	RAISERROR('Não é possível alterar a tabela TIMES.',16,1)
END

--TRIGGER PARA INSERT DELETE E UPDATE DOS GRUPOS
CREATE TRIGGER t_nAoInsDelUpGrupos ON grupos
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
	ROLLBACK TRANSACTION

	RAISERROR('Não é possível alterar a tabela GRUPOS.',16,1)
END

--TRIGGER PARA INSERT E DELETE DOS JOGOS
CREATE TRIGGER t_nAoInsDelUpJogos ON jogos
AFTER INSERT, DELETE
AS
BEGIN
	ROLLBACK TRANSACTION

	RAISERROR('Não é possível alterar a tabela JOGOS.',16,1)
END

CREATE PROCEDURE p_atualizaJogo(@id_jogo INT, @gols_time1 INT, @gols_time2 INT)
AS
BEGIN

    UPDATE jogos
    SET gols_timeA = @gols_time1, gols_timeB = @gols_time2
    WHERE codigo_jogo = @id_jogo
    
	RAISERROR('Jogo Atualizado com sucesso',16,1)

END

EXEC p_atualizaJogo 1, 3, 5

select * from jogosGerados where data_jogo = '2023-01-14'

CREATE FUNCTION fn_estGrupo(@grupo CHAR(1))
RETURNS TABLE
AS
RETURN 
(
    SELECT TOP 100 PERCENT 
        t.nome_time,
        SUM(CASE WHEN j.gols_timeA IS NOT NULL AND j.gols_timeB IS NOT NULL THEN 1 ELSE 0 END) AS num_jogos_disputados,
        SUM(CASE WHEN j.gols_timeA > j.gols_timeB THEN 1 ELSE 0 END) AS vitorias,
        SUM(CASE WHEN j.gols_timeA = j.gols_timeB THEN 1 ELSE 0 END) AS empates,
        SUM(CASE WHEN j.gols_timeA < j.gols_timeB THEN 1 ELSE 0 END) AS derrotas,
        SUM(j.gols_timeA) AS gols_marcados,
        SUM(j.gols_timeB) AS gols_sofridos,
        SUM(j.gols_timeA) - SUM(j.gols_timeB) AS saldo_gols,
        SUM(CASE WHEN j.gols_timeA > j.gols_timeB THEN 3 WHEN j.gols_timeA = j.gols_timeB THEN 1 ELSE 0 END) AS pontos
    FROM grupos g
    INNER JOIN times t ON t.codigo_time = g.codigo_time
    LEFT JOIN jogos j ON (j.codigo_timeA = t.codigo_time OR j.codigo_timeB = t.codigo_time)
        AND j.data_jogo <= GETDATE()
    WHERE g.grupo = @grupo 
    GROUP BY t.nome_time
    ORDER BY pontos DESC, vitorias DESC, gols_marcados DESC, saldo_gols DESC
)

SELECT * FROM dbo.fn_estGrupo('B')

CREATE FUNCTION fn_classificacaoGeral(@grupo CHAR(1))
RETURNS TABLE
AS
RETURN 
(
    SELECT TOP 100 PERCENT
        t.nome_time,
        SUM(CASE WHEN j.gols_timeA IS NOT NULL AND j.gols_timeB IS NOT NULL THEN 1 ELSE 0 END) AS num_jogos_disputados,
        SUM(CASE WHEN j.gols_timeA > j.gols_timeB THEN 1 ELSE 0 END) AS vitorias,
        SUM(CASE WHEN j.gols_timeA = j.gols_timeB THEN 1 ELSE 0 END) AS empates,
        SUM(CASE WHEN j.gols_timeA < j.gols_timeB THEN 1 ELSE 0 END) AS derrotas,
        SUM(j.gols_timeA) AS gols_marcados,
        SUM(j.gols_timeB) AS gols_sofridos,
        SUM(j.gols_timeA) - SUM(j.gols_timeB) AS saldo_gols,
        SUM(CASE WHEN j.gols_timeA > j.gols_timeB THEN 3 WHEN j.gols_timeA = j.gols_timeB THEN 1 ELSE 0 END) AS pontos
    FROM grupos g
    INNER JOIN times t ON t.codigo_time = g.codigo_time
    LEFT JOIN jogos j ON (j.codigo_timeA = t.codigo_time OR j.codigo_timeB = t.codigo_time)
        AND j.data_jogo <= GETDATE()
    GROUP BY t.nome_time
    ORDER BY pontos DESC, vitorias DESC, gols_marcados DESC, saldo_gols DESC
)

SELECT * FROM dbo.fn_classificacaoGeral('X')

CREATE FUNCTION fn_quartasFinais (@grupo CHAR(1))
RETURNS VARCHAR(100)
AS
BEGIN

RETURN @grupo
END

SELECT * FROM fn_quartasFinais('A')




