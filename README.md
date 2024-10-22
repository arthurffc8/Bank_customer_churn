## Projeto Bank Customer Churn

## Descrição

- [ProjetoGames](https://app.powerbi.com/view?r=eyJrIjoiMjhkNzc0NTgtY2QwZS00MWE2LWI3ZTMtNGU1NjBlYzU4MTVlIiwidCI6ImRmY2E2YzQyLWM0NjktNDg1Ny05NDk5LWViN2YzNjczZjY4NCJ9): Este projeto realiza uma análise das vendas de jogos por plataforma, ano, gênero e região (Estados Unidos, Europa resto do mundo). Utiliza dados de vendas globais e busca encontrar insights sobre os gêneros e plataformas mais populares em diferentes mercados.


# Dashboard de Vendas de Jogos

Clique na imagem para visualizar o dashboard interativo no Power BI:


[![ProjetoGame](https://github.com/arthurffc8/Bank_customer_churn/blob/main/FotoProjeto.png)](https://app.powerbi.com/view?r=eyJrIjoiN2NiMTkwYTAtOWUwNi00Zjk0LWE2MTItZGFiNTI1MjQwNTA3IiwidCI6ImRmY2E2YzQyLWM0NjktNDg1Ny05NDk5LWViN2YzNjczZjY4NCJ9)



## Estrutura do Projeto

- **vgsales**: Contém o arquivo de dados com as vendas de jogos.

## Ferramentas Utilizadas

- **Excel**: Para manipulação básica dos dados e tabelas.
- **SQL**: Para extração, tratamento e modelagem dos dados.
- **Power Query**: Utilizado para completar a modelagem dos dados.
- **Power BI**: Utilizado para criação das medidas, de dashboards interativos e visualizações avançadas.

`QueryBankCustomer.sql`
```sql
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
```

## Principais Insights

- **Jogos mais vendidos pelo mundo**: Um ranking coms os jogos e franquias mais vendidos pelo mundo.
- **% De Jogos Vendidos por região**: Ilustra a proporção de vendas do Jogo/Franquia entre EUA/Europa/Resto do mundo.
- **Top 5 Plataformas por região**: Ilustra a as plataformas mais vendidas entre EUA/Europa/Resto do mundo.
- **Jogos Lançados Por ano**: Mostra a quantidade de Jogo/Franquia lançada por ano, nota-se um crescimento nas criações de jogos na segunda metade da década de 00.


 ## Dicas Adicionais 

 - **Filtros**: É possível utilizar o filtro para obter insights específicos para algum Jogo, Plataforma ou Gênero.


