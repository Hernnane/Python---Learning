USE ClientesDB;

CREATE TABLE Clientes(
	ClienteID INT IDENTITY(1,1) PRIMARY KEY,
	Nome NVARCHAR(50) NOT NULL,
	Idade INT NOT NULL,
	Cidade NVARCHAR(50) NOT NULL
);

INSERT INTO Clientes (Nome, Idade, Cidade)
VALUES 
('Maria Silva', 30, 'São Paulo'),
('João Pereira', 25, 'Rio de Janeiro'),
('Ana Costa', 35, 'Belo Horizonte');

SELECT * FROM Clientes;