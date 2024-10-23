## Projeto Bank Customer Churn

## Descrição

- [ProjetoChurn](https://app.powerbi.com/view?r=eyJrIjoiN2NiMTkwYTAtOWUwNi00Zjk0LWE2MTItZGFiNTI1MjQwNTA3IiwidCI6ImRmY2E2YzQyLWM0NjktNDg1Ny05NDk5LWViN2YzNjczZjY4NCJ9): Este projeto realiza uma análise do churn (cancelamento de clientes) de uma empresa, identificando os principais fatores que levam ao cancelamento e propondo estratégias de retenção.

# Dashboard de Bank Customer Churn

Clique na imagem para visualizar o dashboard interativo no Power BI:


[![ProjetoGame](https://github.com/arthurffc8/Bank_customer_churn/blob/main/FotoProjeto.png)](https://app.powerbi.com/view?r=eyJrIjoiN2NiMTkwYTAtOWUwNi00Zjk0LWE2MTItZGFiNTI1MjQwNTA3IiwidCI6ImRmY2E2YzQyLWM0NjktNDg1Ny05NDk5LWViN2YzNjczZjY4NCJ9)



## Estrutura do Projeto

- **Customer_Churn_Records.csv**: Arquivo original com as informações sobre os clientes.
- **Customer_Churn_Records_reduced.csv**: Arquivo csv após as manipulações feitas em SQL.
- **QueryBankCustomer.sql**: Arquivo SQL.
- **projeto_churn.pbix**: Dashboard com as vizualizaçõesem Power BI.
-  
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

- **Credito de Pontuação**: É possível perceber que clientes com crédito muito baixo (abaixo de 400) tendem a cancelar o serviço. No entanto, acima desse valor, há uma tendência de estabilização na taxa de churn, mantendo uma variação semelhante, inclusive entre clientes com crédito mais alto.
- **Influência da Idade**: É possível identificar um aumento na taxa de cancelamento entre clientes acima de 40 anos, com um pico até os 55 anos, seguido por uma diminuição após essa faixa etária.
- **Tempo de serviço**: A partir deste gráfico, podemos concluir que os clientes costumam permanecer, em média, 7 anos utilizando os serviços do banco. Após esse período, taxa de cancelamento volta a aumentar.


 ## Dicas Adicionais 

 - **Filtro por país**: Filtrando por país, percebemos uma forte tendência de cancelamento por parte dos clientes alemães, com uma taxa de churn em média duas vezes maior que a dos clientes franceses e espanhóis.
 - **Filtro por saldo e salário**: Podemos usar os filtros para analisar a taxa de churn em relação a diferentes saldos e salários. Diferente do que se imaginava, esses fatores não têm um impacto tão significativo na taxa de cancelamento.
 


