<h1>Business Intelligence: trabalhando com Data Warehouse</h1>
<p><strong>A grande arte do BI é transformar dados em informação.</strong></p>
<p>Data Warehouse significa armazém de dados.</p>
<ul>
	<li>Integração de diversas fontes de dados.</li>
	<li>Implementação das regras de negócio.</li>
	<li>Limpeza de dados.</li>
	<li>Análise ao longo do tempo.</li>
</ul>
<h3>Como projetar um Data Warehouse:</h3>
<ol>
	<li><em>"O que quero analisar?"</em> Que tipo de informação eu preciso ter. Chamamos de Indicador / Medida ou Variável.</li>
	<li><em>"Como quero analisar?"</em> Qual maneira quero visualizar aquela informação. Chamamos de Dimensão.</li>
</ol>
<p>Com as perguntas finalizadas, temos as dimensões definidas assim como os indicadores. Faremos um documento chamado <strong>Matriz Dimensão X Indicador</strong>, que registrará o resultado das entrevistas.</p>
<h3>Matriz Dimensão X Indicador:</h3>
<ul>
	<li>Nas linhas:
		<ul>
			<li>Indicador: <em>"O que quero analisar?"</em> (VENDAS, CUSTOS, LUCROS, etc).</li>
		</ul>
	</li>
	<li>Nas colunas:
		<ul>
			<li>Dimensão: "Como quero analisar?" (CLIENTE, EMPRESA, TEMPO, etc).</li>
		</ul>
	</li>
</ul>
<p>Marcar cruzamentos que fazem sentido entre Indicadores e Dimensão. Esses cruzamentos serão as tabelas de fato.</p>
<p>Tabelas do Data Warehouse se dividem em dois grandes grupos de tabela: <strong>Tabela Dimensão</strong> e <strong>Tabela Fatos</strong>.</p>
<h3>Tabela de Fato:</h3>
<ul>
	<li>Grava uma ocorrência.</li>
	<li>O conjunto dos indicadores que possuem os mesmos cruzamentos resultarão em tabelas chamadas "Tabelas de Fato".</li>
	<li>Agrupar os indicadores e dimensões que têm cruzamento e colocar em uma tabela. As dimensões serão as chaves primárias da tabela de fato.</li>
</ul>
<h3>Detalhes de uma dimensão:</h3>
	<ul>
		<li>Todos os relacionamentos de entidades que se relacionam entre si, chamamos de dimensão.</li>
		<li>Dentro do ramo de relacionamento de entidades, há algumas que possuem uma sequência de relacionamentos única. Esse grupo de entidades dentro da dimensão, chamamos de hierarquia.</li>
		<li>Dentro da hierarquia, temos uma entidade básica que chamamos de nível, e a ele podem estar associados atributos.</li>
	</ul>
	<h3>Relação entre as entidades da dimensão:</h3>
	<ul>
		<li><em>"Qual a relação entre estas entidades?"</em> Podemos ter relação de 1:1, 1:N e N:M.</li>
		<li>Colocaremos as dimensões em uma matriz, repetindo as dimensões nas linhas e colunas e iremos verificar a relação entre elas. </li>
		<li>Tudo que for 1:N faz uma ligação.</li>
		<li>O grupo de entidades que se formar depois das ligações serão chamadas de dimensão.</li>
	</ul>
	<p>Sempre a dimensão vai começar no nivel mais baixo de todos.</p>
	<p>Modelo Estrela (<strong>Star Schemas</strong>):</p>
	<ul>
		<li>Modelo Desnormalizado.</li>
	</ul>
	<p>Modelo Floco de Neve (<strong>Snow Flake Schema</strong>):</p>
	<ul>
		<li>Modelo Normalizado.</li>
	</ul>
	<h2>Dimensões Irregulares:</h2>
	<ul>
		<li>Dimensões que podem apresentar buracos nas tabelas.</li>
		<li>Podemos pegar uma informação anterior e repetir na tabela.</li>
	</ul>
	<h3>Tabela Pai/Filho:</h3>
	<ul>
		<li>Criaremos uma tabela com duas colunas, uma chamada <strong>FILHO</strong> e a outra <strong>PAI</strong>.</li>
		<li>Na coluna <strong>FILHO</strong> colocar sempre o elemento da dimensão e no campo <strong>PAI</strong> colocar o elemente a cima da linha da tabela.</li>
	</ul>
	<h3>Atributos de esquerda, direita e de nível:</h3>
	<ul>
		<li>Existem alguns atributos que são muito importantes e que nós devemos representar na tabela pai/filho para facilitar a navegação dentro da dimensão. Esses atributos são reconhecidos como de esquerda, direita e de nível.</li>
		<li>Os atributos de esquerda e direita são inteiros que identificam cada membro da dimensão que estão abaixo do nível em que este membro se encontra. Os atributos de nível identifica quantos níveis abaixo da hierarquia o membro da dimensão está localizado.</li>
		<li>Estes atributos tem como função auxiliar na localização de membros da dimensão.</li>
	</ul>

<strong>O uso de dimensões irregulares é comum em situações em que não sabemos quantos níveis teremos e nem como serão as relações entre os seus membros.</strong>

<h3>Dimensão Tempo:</h3>
<ul>
	<li>Dimensão tempo é uma dimensão obrigatória.</li>
	<li>Granularidade e Periodicidade:
		<ul>
			<li>Granularidade: é o nível de detalhamento ou nível que os dados estão resumidos no banco de dados.</li>
			<li>Periodicidade: é o tempo que as informações serão atualizadas no Data Warehouse.</li>
		</ul>
	</li>
	<li>Podemos representar a dimensão tempo da mesma maneira que as outras dimensões:
		<ul>
			<li>Modelo Estrela.</li>
			<li>Modelo Floco de Neve.</li>
			<li>Tabela Pai/Filho.</li>
		</ul>
	</li>
	<li>Se tiver dimensões com granularidades diferentes, deve-se criar tabela de fato diferentes.</li>
</ul>

<h3>Extract, Transform, Load - ETL:</h3>
<ul>
	<li>Limpeza de dados.</li>
	<li>LOOKUP: Criar códigos sequencial numérico.</li>
	<li>UNION(DISTINCT).</li>
	<li>Funções de transformação de dados.</li>
	<li>Funções de datas.</li>
	<li>Funções de strings.</li>
	<li>Funções numéricas.</li>
	<li>ODS(Operational Data Storage).</li>
</ul>

<h3>Performance de um Data Warehouse:</h3>
<p>Para melhor performance de visualização de dados dentro de um Data Warehouse utilizamos o OLAPs (ONLINE ANALYTICAL PROCESS).</p>

<h2>Variações do BI:</h2>
<ul>
	<li>Data mining.</li>
	<li>Balance Scorecard.</li>
	<li>Big Data.</li>
</ul>
