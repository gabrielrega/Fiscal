# Análise Fiscal

Funções para análise de dados fiscais do Brasil

## gasto_federal(ano=2017, completo = TRUE, categoria="")

Retorna a tabela de gastos federais, por função, para aquele ano, a partir de 2013. O valor padrão é 2017.
Caso queira retirar da função encargos os gastos com refinanciamento de dívida, usar a opção "completo = FALSE". O padrão é "TRUE".
Caso queira receber os dados de uma categoria específica, inserir ao final como string, o padrão é "".

## bcb(serie=24363)

Retorna a série pedida da base de dados do Banco Central do Brasil, formatada. 
Retorna por padrão o câmbio real x dólar.
