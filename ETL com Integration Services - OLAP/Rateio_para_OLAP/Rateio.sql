/****** Script do comando SelectTopNRows de SSMS  ******/

SELECT X.[Cod_Cliente]
      ,X.[Cod_Produto]
      ,X.[Cod_Organizacional]
      ,X.[Cod_Fabrica]
      ,X.[Cod_Dia]
      ,X.[Faturamento]
      ,X.[Imposto]
      ,X.[Custo_Variavel]
      ,X.[Quantidade_Vendida]
      ,X.[Unidade_Vendida]
	  ,(X.[Quantidade_Vendida]/Y.[Quantdade_Vendida_002]) * Y.[FRETE] AS [Frete Rateio]
	  ,(X.[Quantidade_Vendida]/W.[Quantdade_Vendida_003]) * W.[Custo_Fixo] AS [Custo Fixo Rateio]
	  ,(X.[Quantidade_Vendida]/Z.[Quantdade_Vendida_004]) * Z.[Meta_Faturamento] AS [Meta Faturamento Rateio]
	  ,(X.[Quantidade_Vendida]/K.[Quantdade_Vendida_005]) * K.[Meta_Custo] AS [Meta Custo Rateio]
  FROM [DW_SUCOS].[dbo].[Fato_001] X
  INNER JOIN (
SELECT A.[Cod_Cliente]
      ,A.[Cod_Produto]
      ,A.[Cod_Fabrica]
      ,A.[Cod_Dia]
      ,A.[Frete]
	  , B.[Quantdade_Vendida_002]
  FROM [DW_SUCOS].[dbo].[Fato_002] A
  INNER JOIN (
SELECT [Cod_Cliente]
      ,[Cod_Produto]
      ,[Cod_Fabrica]
      ,[Cod_Dia]
      ,SUM([Quantidade_Vendida]) AS Quantdade_Vendida_002
  FROM [DW_SUCOS].[dbo].[Fato_001]
  GROUP BY [Cod_Cliente]
      ,[Cod_Produto]
      ,[Cod_Fabrica]
      ,[Cod_Dia]) B
	  ON A.[Cod_Cliente] = B.[Cod_Cliente] AND A.[Cod_Produto] = B.[Cod_Produto]
	  AND A.[Cod_Fabrica] = B.[Cod_Fabrica] AND A.[Cod_Dia] = B.[Cod_Dia] ) Y
	  ON X.[Cod_Cliente] = Y.[Cod_Cliente] AND X.[Cod_Produto] = Y.[Cod_Produto]
	  AND X.[Cod_Fabrica] = Y.[Cod_Fabrica] AND X.[Cod_Dia] = Y.[Cod_Dia]
INNER JOIN (
  SELECT A.[Cod_Fabrica]
      ,A.[Cod_Dia]
      ,A.[Custo_Fixo]
	  , B.[Quantdade_Vendida_003]
  FROM [DW_SUCOS].[dbo].[Fato_003] A
  INNER JOIN (
   SELECT [Cod_Fabrica]
      ,[Cod_Dia]
      ,SUM([Quantidade_Vendida]) AS Quantdade_Vendida_003
  FROM [DW_SUCOS].[dbo].[Fato_001]
  GROUP BY [Cod_Fabrica]
      ,[Cod_Dia]) B
	  ON A.[Cod_Fabrica] = B.[Cod_Fabrica] AND A.[Cod_Dia] = B.[Cod_Dia] ) W
	  ON X.[Cod_Fabrica] = W.[Cod_Fabrica] AND X.[Cod_Dia] = W.[Cod_Dia]
inner join (
	  SELECT A.[Cod_Cliente]
      ,A.[Cod_Produto]
      ,A.[Cod_Organizacional]
      ,A.[Cod_Dia]
      ,A.[Meta_Faturamento]
	  ,B.[Quantdade_Vendida_004]
  FROM [DW_SUCOS].[dbo].[Fato_004] A
  INNER JOIN (
  	  SELECT [Cod_Cliente]
      ,[Cod_Produto]
      ,[Cod_Organizacional]
      ,[Cod_Dia]
      ,SUM([Quantidade_Vendida]) AS Quantdade_Vendida_004
  FROM [DW_SUCOS].[dbo].[Fato_001]
  GROUP BY [Cod_Cliente]
      ,[Cod_Produto]
      ,[Cod_Organizacional]
      ,[Cod_Dia]) B ON 
   A.[Cod_Cliente] = B.[Cod_Cliente] AND A.[Cod_Produto] = B.[Cod_Produto]
	  AND A.[Cod_Dia] = B.[Cod_Dia] ) Z
	  ON X.[Cod_Cliente] = Z.[Cod_Cliente] AND X.[Cod_Produto] = Z.[Cod_Produto]
	  AND X.[Cod_Dia] = Z.[Cod_Dia]
INNER JOIN (
	  SELECT A.[Cod_Produto]
      ,A.[Cod_Fabrica]
      ,A.[Cod_Dia]
      ,A.[Meta_Custo]
	  ,B.[Quantdade_Vendida_005]
  FROM [DW_SUCOS].[dbo].[Fato_005] A
  INNER JOIN (
	  SELECT [Cod_Produto]
      ,[Cod_Fabrica]
      ,[Cod_Dia]
      ,SUM([Quantidade_Vendida]) AS Quantdade_Vendida_005
  FROM [DW_SUCOS].[dbo].[Fato_001]
  GROUP BY [Cod_Produto]
      ,[Cod_Fabrica]
      ,[Cod_Dia]) B
	  ON 	A.[Cod_Produto] = B.[Cod_Produto]
	  AND A.[Cod_Fabrica] = B.[Cod_Fabrica] AND A.[Cod_Dia] = B.[Cod_Dia] ) K
ON X.[Cod_Produto] = K.[Cod_Produto]
	  AND X.[Cod_Fabrica] = K.[Cod_Fabrica] AND X.[Cod_Dia] = K.[Cod_Dia]