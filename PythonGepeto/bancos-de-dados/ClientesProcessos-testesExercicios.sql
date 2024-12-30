USE ClientesProcessos;

SELECT * FROM Clientes;

SELECT * FROM Processos;

DELETE FROM Clientes;

INSERT INTO Clientes(Nome, Idade, Cidade)
VALUES
('Gabriel', 26, 'São Paulo'),
('Ana', 25, 'Rio de Janeiro'),
('Lucas', 30, 'Belo Horizonte'),
('Fernanda', 28, 'Curitiba'),
('Carlos', 35, 'Porto Alegre'),
('Juliana', 22, 'Salvador'),
('Patrícia', 27, 'Recife');

INSERT INTO Processos (ClienteID, Descricao, DataAbertura, Status)
VALUES
(4, 'Processo de cobrança de dívida', '2023-02-15', 'Em andamento'),
(4, 'Ação trabalhista', '2023-03-22', 'Concluído'),
(5, 'Consultoria jurídica', '2023-04-10', 'Concluído'),
(6, 'Litígio comercial', '2023-06-01', 'Em andamento'),
(7, 'Divórcio litigioso', '2023-07-20', 'Em andamento'),
(7, 'Processo de herança', '2023-08-14', 'Concluído'),
(8, 'Processo de indenização', '2023-09-02', 'Em andamento'),
(9, 'Ação de despejo', '2023-10-12', 'Concluído'),
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
--Seleciona todos os processos e exibe os clientes responsáveis por cada um deles
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
--(SE UM CLIENTE TEM MAIS DE UM PROCESSO, TODOS SERÃO EXIBIDOS EM UMA LINHA SOMENTE)
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
--Seleciona os processos que já foram concluídos e com data superior à 2023-01-01
SELECT
	p.Status,
	p.DataAbertura,
	c.Nome
FROM
	Processos p
JOIN
	Clientes c ON p.ClienteID = c.ClienteID
WHERE 
	p.Status = 'Concluído' AND p.DataAbertura > '2023-01-01';

--**************************************************************************************************
--Mesma consulta do código acima porém usando uma subconsulta 
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
            p.Status = 'Concluído' AND p.DataAbertura > '2023-01-01'
    );
