USE ClientesProcessos;

SELECT * FROM Clientes;

SELECT * FROM Processos;

--***************************************************************************--
-- Contar o número de processos com status 'Em andamento' para cada cliente. --
SELECT 
	c.Nome AS NomeDoCliente,
	COUNT(p.ProcessoID) AS QuantidadeTotalDeProcessos
FROM
	Clientes c
LEFT JOIN
	Processos p ON c.ClienteID = p.ClienteID
WHERE 
	p.Status = 'Em andamento'
GROUP BY
	c.Nome;

--***********************************************************************--
-- Calcular a média de idade dos clientes que têm processos 'Concluídos' --
SELECT 
    AVG(c.Idade) AS MediaDeIdade
FROM 
    Clientes c
JOIN 
    Processos p ON c.ClienteID = p.ClienteID
WHERE 
    p.Status = 'Concluído';

--*****************************************************************--
--Obter a data mais recente de abertura de processos 'Em andamento'--
--(AQUI PRECISOU DE SUB CONSULTA)--
SELECT
	p.Descricao,
	p.DataAbertura
FROM 
	Processos p
WHERE 
	p.Status = 'Em andamento'
	AND p.DataAbertura = (
		SELECT
			MAX(p2.DataAbertura)
		FROM
			Processos p2
		WHERE
			p2.Status = 'Em andamento'
	);

--*****************************************************************--
--Filtrar clientes que têm mais de 3 processos com status 'Em andamento'--]
--(AQUI PRECISOU USAR HAVING)--
SELECT
	c.Nome AS Cliente
FROM 
	Clientes c
JOIN 
	Processos p ON c.ClienteID = p.ClienteID
WHERE 
	p.Status = 'Em andamento'
GROUP BY
	c.Nome
HAVING 
	COUNT(p.ProcessoID) >= 3;

--Adicionando um processo pra poder aparecer um resultado na consulta acima--
INSERT INTO Processos (ClienteID, Descricao, DataAbertura, Status)
VALUES
(4, 'Litígio comercial', '2023-12-29', 'Em andamento');
