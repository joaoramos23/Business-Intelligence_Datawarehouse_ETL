/*
Script de implantação para DW_SUCOS

Este código foi gerado por uma ferramenta.
As alterações feitas nesse arquivo poderão causar comportamento incorreto e serão perdidas se
o código for gerado novamente.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DW_SUCOS"
:setvar DefaultFilePrefix "DW_SUCOS"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detecta o modo SQLCMD e desabilita a execução do script se o modo SQLCMD não tiver suporte.
Para reabilitar o script após habilitar o modo SQLCMD, execute o comando a seguir:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'O modo SQLCMD deve ser habilitado para executar esse script com êxito.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'A operação de refatoração Renomear com chave cc4da4d5-481e-4728-adfe-4dfd2278d158 foi ignorada; o elemento [dbo].[Dim_Cliente].[Id] (SqlSimpleColumn) não será renomeado para Cod_Cliente';


GO
PRINT N'Criando Tabela [dbo].[Dim_Cliente]...';


GO
CREATE TABLE [dbo].[Dim_Cliente] (
    [Cod_Cliente]   NVARCHAR (50)  NOT NULL,
    [Desc_Cliente]  NVARCHAR (200) NULL,
    [Cod_Cidade]    NVARCHAR (50)  NULL,
    [Desc_Cidade]   NVARCHAR (200) NULL,
    [Cod_Estado]    NVARCHAR (50)  NULL,
    [Desc_Estado]   NVARCHAR (200) NULL,
    [Cod_Regiao]    NVARCHAR (50)  NULL,
    [Desc_Regiao]   NVARCHAR (200) NULL,
    [Cod_Segmento]  NVARCHAR (50)  NULL,
    [Desc_Segmento] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([Cod_Cliente] ASC)
);


GO
-- Etapa de refatoração para atualizar o servidor de destino com logs de transação implantados
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'cc4da4d5-481e-4728-adfe-4dfd2278d158')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('cc4da4d5-481e-4728-adfe-4dfd2278d158')

GO

GO
PRINT N'Atualização concluída.';


GO
