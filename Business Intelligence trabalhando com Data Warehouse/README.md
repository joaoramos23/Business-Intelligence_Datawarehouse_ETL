<h1>Business Intelligence: trabalhando com Data Warehouse</h1>

A grande arte do BI é transformar dados em informação.


Data Warehouse significa armazem de dados.

- Integração de diversas fontes de dados.
- Implementação das regras de negócio.
- Limpeza de dados.
- Análise ao longo do tempo.


Como projetar um Data Warehouse:

- "O que quero analisar?" Que tipo de informação eu preciso ter. Chamamos de Indicador / Medida ou Variavel.

- "Como quero analisar?" Qual maneira quero vizualisar aquela informação. Chamamos de Dimensão.


Com as perguntas finalizadas, temos as dimensões definidas assim como os indicadores. Faremos um documento chamado <strong>Matriz Dimensão X Indicador</strong>, que registrará o resultado das entrevistas.

Matriz Dimensão X Indicador:

- Nas linhas:
	- Indicador: Qual informação quero ver (VENDAS, CUSTOS, LUCROS, etc).

- Nas colunas:
	- Dimensão: Como quero ver a informação (CLIENTE, EMPRESA, TEMPO, etc).  

Marcar cruzamentos que fazem sentido entre Indicadores e Dimensão.

Tabelas do Data Warehouse se divide em dois grandes grupos de tabela: <strong>Tabela Dimensão</strong> e <strong>Tabela Fatos</strong>.

Tabela de Fato: 

- Ela grava uma ocorrencia.
- O conjunto dos indicadores que possuem os mesmo cruzamentos resultarão em tabelas chamadas "Tabelas de Fato".
- Agrupar os indicadores e dimensões que tem cruzamento e colocar em uma tabela. As dimensões serão as chaves primarias da tabela de fato. 


Detalhes de uma dimensão:

- Todos os relacionamentos de entidades que se relacionam entre si, chamamos de dimensão.
- Dentro do ramo de relacionamento de entidades, há algumas que possuem uma sequência de relacionamentos única. Esse grupo de entidades dentro da dimensão, chamamos de hierarquia.
- Dentro da hierarquia temos uma entidade básica que chamamos de nível, e a ele podem estar associados atributos.

Relação entre as entidades da dimensão:

- "Qual a relação entre estas entidades?" Podemos ter relação de 1:1, 1:N e N:M.
- Colocaremos as dimensões em uma matriz, repetindo as dimensões nas linhas e colunas e iremos verificar a relação entre elas. 
- Tudo que for 1:N faz uma ligação.
- O grupo de entidades que se formar depois das ligações serão chamadas de dimensão.

Sempre a dimensão vai começar no nivel mais baixo de todos.


Modelo Estrela (Star Schemas):
- Modelo Desnormalizado.

Modelo Floco de Neve (Snow Flake Schema):
- Modelo Normalizado.


<h2>Dimensões Irregulares:</h2>

- Dimensões que podem apresentar buracos nas tabelas.
- Podemos pegar uma informação anterior e repetir na tabela.

Tabela Pai/Filho:

- Criaremos uma tabela com duas colunas, uma chamada <strong>FILHO</strong> e a outra <strong>PAI</strong>.
- Na coluna <strong>FILHO</strong> colocar sempre o elemento da dimensão e no campo <strong>PAI</strong> colocar o elemente a cima da linha da tabela.

Atributos de esquerda, direita e de nível:

- Existem alguns atributos que são muito importantes e que nós devemos representar na tabela pai/filho para facilitar a navegação dentro da dimensão. Esses atributos são reconhecidos como de esquerda, direita e de nível.
- Os atributos de esquerda e direita são inteiros que identificam cada membro da dimensão que estão abaixo do nível em que este membro se encontra. Os atributos de nível identifica quantos níveis abaixo da hierarquia o membro da dimensão está localizado.
- Estes atributos tem como função auxiliar na localização de membros da dimensão.

<strong>O uso de dimensões irregulares é comum em situações em que não sabemos quantos níveis teremos e nem como serão as relações entre os seus membros.</strong>

Dimensão Tempo: 

- Dimensão tempo é uma dimensão obrigatoria.
- Granularidade e Periodicidade:
	- Granularidade: é o nível de detalhamento ou nível que os dados estão resumidos no banco de dados.
	- Periodicidade: é o tempo que as informações serão atualizadas no Data Warehouse.

- Podemos representar a dimensão tempo da mesma maneira que as outras dimensões:
	- Modelo Estrela.
	- Modelo Floco de Neve.
	- Tabela Pai/Filho.

Se tiver dimensões com granularidades diferentes, deve-se criar tabela de fato diferentes.


<h2>Extract, Transform, Load - ETL:</h2>
- Limpeza de dados.
- LOOKUP: Criar codigos sequencial numerico.
- UNION(DISTINCT).
- Funções de transformação de dados.
- Funções de datas.
- Funções de strings.
- Funções numéricas.
- ODS(Operational Data Storage).


- Performace de um Data Warehouse:
	- Para melhor performace de visualização de dados dentro de um Data Warehouse utilizamos o OLAPs 	(ONLINE ANALYTICAL PROCESS).


- Variações do BI:
	- Data minning
	- Balance Scorecard
	- Big Data