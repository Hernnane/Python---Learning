USE ClientesProcessos;

SELECT * FROM Clientes;

SELECT * FROM Processos;

DELETE FROM Clientes;

INSERT INTO Clientes(Nome, Idade, Cidade)
VALUES
('Gabriel', 26, 'S�o Paulo'),
('Ana', 25, 'Rio de Janeiro'),
('Lucas', 30, 'Belo Horizonte'),
('Fernanda', 28, 'Curitiba'),
('Carlos', 35, 'Porto Alegre'),
('Juliana', 22, 'Salvador'),
('Patr�cia', 27, 'Recife');

INSERT INTO Processos (ClienteID, Descricao, DataAbertura, Status)
VALUES
(4, 'Processo de cobran�a de d�vida', '2023-02-15', 'Em andamento'),
(4, 'A��o trabalhista', '2023-03-22', 'Conclu�do'),
(5, 'Consultoria jur�dica', '2023-04-10', 'Conclu�do'),
(6, 'Lit�gio comercial', '2023-06-01', 'Em andamento'),
(7, 'Div�rcio litigioso', '2023-07-20', 'Em andamento'),
(7, 'Processo de heran�a', '2023-08-14', 'Conclu�do'),
(8, 'Processo de indeniza��o', '2023-09-02', 'Em andamento'),
(9, 'A��o de despejo', '2023-10-12', 'Conclu�do'),
(10, 'Defesa criminal', '2023-11-05', 'Em andamento');

--**************************************************************************************************
--Seleciona todos os processos com status: Em andamento
SELECT 
	c.Nome,
	p.Descricao,
	p.DataAbertura,
	p.Status
FROM 
	Processos p
JOIN 
	Clientes c ON c.ClienteID = p.ClienteID
WHERE
	p.Status = 'Em andamento';

--**************************************************************************************************
--Seleciona todos os clientes e exibe os processos de cada um
--(UM PROCESSO POR LINHA - MESMO SE FOR DE UM MESMO CLIENTE)
SELECT 
	c.Nome,
	p.Descricao,
	p.DataAbertura,
	p.Status
FROM
	Clientes c
LEFT JOIN 
	Processos p ON c.ClienteID = p.ClienteID

--**************************************************************************************************
--Seleciona todos os processos e exibe os clientes respons�veis por cada um deles
--(UM POR LINHA)
SELECT 
	p.Descricao,
	p.DataAbertura,
	p.Status,
	c.Nome
FROM
	Clientes c
RIGHT JOIN 
	Processos p ON c.ClienteID = p.ClienteID

--**************************************************************************************************
--Seleciona os clientes que tem processo e agrupa os processos em uma mesma linha pra cada cliente 
--(SE UM CLIENTE TEM MAIS DE UM PROCESSO, TODOS SER�O EXIBIDOS EM UMA LINHA SOMENTE)
SELECT 
    c.Nome,
    STRING_AGG(p.Descricao, ', ') AS Processos,
    STRING_AGG(p.DataAbertura, ', ') AS DatasAbertura,
    STRING_AGG(p.Status, ', ') AS Status
FROM 
    Clientes c
LEFT JOIN 
    Processos p ON c.ClienteID = p.ClienteID
GROUP BY 
    c.Nome;

--**************************************************************************************************
--Seleciona os processos que j� foram conclu�dos e com data superior � 2023-01-01
SELECT
	p.Status,
	p.DataAbertura,
	c.Nome
FROM
	Processos p
JOIN
	Clientes c ON p.ClienteID = c.ClienteID
WHERE 
	p.Status = 'Conclu�do' AND p.DataAbertura > '2023-01-01';

--**************************************************************************************************
--Mesma consulta do c�digo acima por�m usando uma subconsulta 
--(CONSULTA DENTRO DA CONSULTA)
SELECT 
    c.Nome
FROM 
    Clientes c
WHERE 
    c.ClienteID IN (
        SELECT 
            p.ClienteID
        FROM 
            Processos p
        WHERE 
            p.Status = 'Conclu�do' AND p.DataAbertura > '2023-01-01'
    );
