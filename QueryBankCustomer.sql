-- Verificando a estrutura do dataset
DESCRIBE bank_customer_churn.customer_churn_records;

-- Consultando 10 registros
SELECT * FROM bank_customer_churn.customer_churn_records LIMIT 10;

-- Verificando a contagem de clientes que saíram (Exited = 1)
SELECT Exited, COUNT(*) 
FROM bank_customer_churn.customer_churn_records
GROUP BY Exited;

-- Saíram 2038 clientes

-- Verificando valores nulos nas colunas mais importantes

SELECT * 
FROM bank_customer_churn.customer_churn_records
WHERE CreditScore IS NULL 
OR Age IS NULL 
OR Balance IS NULL;

-- Traduzindo as colunas para o português 

ALTER TABLE bank_customer_churn.customer_churn_records
    CHANGE RowNumber NumeroLinha INT,
    CHANGE CustomerId IdCliente INT,
    CHANGE Surname Sobrenome TEXT,
    CHANGE CreditScore PontuacaoCredito INT,
    CHANGE Geography Geografia TEXT,
    CHANGE Gender Genero TEXT,
    CHANGE Age Idade INT,
    CHANGE Tenure TempoCliente INT,
    CHANGE Balance Saldo DOUBLE,
    CHANGE NumOfProducts NumeroProdutos INT,
    CHANGE HasCrCard PossuiCartaoCredito INT,
    CHANGE IsActiveMember MembroAtivo INT,
    CHANGE EstimatedSalary SalarioEstimado DOUBLE,
	CHANGE Saiu StatusCliente INT,
    CHANGE Reclama AbriuReclamacao INT,
    CHANGE `Satisfaction Score` PontuacaoSatisfacao INT,
    CHANGE `Card Type` TipoCartao TEXT,
    CHANGE `Point Earned` PontosGanhos INT;
    
 -- Removendo as colunas menos importante para análise
 
 ALTER TABLE bank_customer_churn.customer_churn_records
    DROP COLUMN NumeroLinha,
    DROP COLUMN IdCliente,
    DROP COLUMN Sobrenome,
    DROP COLUMN TipoCartao;
    
-- Exportando para o arquivo com as alerações feitas
  
select * from bank_customer_churn.customer_churn_records;


