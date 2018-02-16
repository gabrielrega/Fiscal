# Análise Fiscal

Funções para análise de dados fiscais do Brasil

## gasto_federal(ano=2017, completo = TRUE, categoria="")

Retorna a tabela de gastos federais, por função, para aquele ano, a partir de 2013. O valor padrão é 2017.
Caso queira retirar da função encargos os gastos com refinanciamento de dívida, usar a opção "completo = FALSE". O padrão é "TRUE".
Caso queira receber os dados de uma categoria específica, inserir ao final como string, o padrão é "". As categorias são:

04 - Administração
20 - Agricultura
08 - Assistência Social
19 - Ciência e Tecnologia
23 - Comércio e Serviços
24 - Comunicações
13 - Cultura
05 - Defesa Nacional
27 - Desporto e Lazer
14 - Direitos da Cidadania
12 - Educação
28 - Encargos Especiais
25 - Energia
03 - Essencial à Justiça
18 - Gestão Ambiental
16 - Habitação
22 - Indústria
02 - Judiciária
01 - Legislativa
21 - Organização Agrária
09 - Previdência Social
07 - Relações Exteriores
17 - Saneamento
10 - Saúde
06 - Segurança Pública
11 - Trabalho
26 - Transporte
15 - Urbanismo

## bcb(serie=24363)

Retorna a série pedida da base de dados do Banco Central do Brasil, formatada. 
Retorna por padrão o câmbio real x dólar.

## prefixo()

Cria um string com a data e hora formatada "%Y%M%D_%HH%MM" de forma a ser usada como parte do nome de um arquivo salvo.

## prefixo2()

Cria um string com a data formatada "%Y%M%D" de forma a ser usada como parte do nome de um arquivo salvo.
