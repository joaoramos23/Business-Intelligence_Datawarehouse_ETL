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
PRINT N'A operação de refatoração Renomear com chave 6971d7fc-3268-48e4-8033-ad33cc91ee0a foi ignorada; o elemento [dbo].[Dim_marca].[Id] (SqlSimpleColumn) não será renomeado para Cod_Marca';


GO
PRINT N'A operação de refatoração Renomear com chave fc34facb-2570-4cda-879b-ba90995a9240 foi ignorada; o elemento [dbo].[Dim_Categoria].[Id] (SqlSimpleColumn) não será renomeado para Cod_Categoria';


GO
PRINT N'A operação de refatoração Renomear com chave 816a148e-2b4b-4a55-993a-680c4d048bd6 foi ignorada; o elemento [dbo].[Dim_Marca].[Id] (SqlSimpleColumn) não será renomeado para Cod_Marca';


GO
PRINT N'A operação de refatoração Renomear com chave 47c9459d-86fa-4cdc-af74-5f1be8f5f54e foi ignorada; o elemento [dbo].[Dim_Produto].[Id] (SqlSimpleColumn) não será renomeado para Cod_Produto';


GO
PRINT N'A operação de refatoração Renomear com chave 4d37550f-4cca-4b48-89e9-f6a68bb8155e foi ignorada; o elemento [dbo].[Dim_Produto].[Atr_] (SqlSimpleColumn) não será renomeado para Atr_Sabor';


GO
PRINT N'Criando Tabela [dbo].[Dim_Categoria]...';


GO
CREATE TABLE [dbo].[Dim_Categoria] (
    [Cod_Categoria]  NVARCHAR (50)  NOT NULL,
    [Desc_Categoria] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([Cod_Categoria] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Dim_Marca]...';


GO
CREATE TABLE [dbo].[Dim_Marca] (
    [Cod_Marca]     NVARCHAR (50)  NOT NULL,
    [Desc_Marca]    NVARCHAR (200) NULL,
    [Cod_Categoria] NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Cod_Marca] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Dim_Produto]...';


GO
CREATE TABLE [dbo].[Dim_Produto] (
    [Cod_Produto]  NVARCHAR (50)  NOT NULL,
    [Desc_Produto] NVARCHAR (200) NULL,
    [Atr_Tamanho]  NVARCHAR (200) NULL,
    [Atr_Sabor]    NVARCHAR (200) NULL,
    [Cod_Marca]    NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Cod_Produto] ASC)
);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Marca_Dim_Categoria]...';


GO
ALTER TABLE [dbo].[Dim_Marca] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Marca_Dim_Categoria] FOREIGN KEY ([Cod_Categoria]) REFERENCES [dbo].[Dim_Categoria] ([Cod_Categoria]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Produto_Dim_Marca]...';


GO
ALTER TABLE [dbo].[Dim_Produto] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Produto_Dim_Marca] FOREIGN KEY ([Cod_Marca]) REFERENCES [dbo].[Dim_Marca] ([Cod_Marca]);


GO
-- Etapa de refatoração para atualizar o servidor de destino com logs de transação implantados
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fc34facb-2570-4cda-879b-ba90995a9240')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fc34facb-2570-4cda-879b-ba90995a9240')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6971d7fc-3268-48e4-8033-ad33cc91ee0a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6971d7fc-3268-48e4-8033-ad33cc91ee0a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '816a148e-2b4b-4a55-993a-680c4d048bd6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('816a148e-2b4b-4a55-993a-680c4d048bd6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '47c9459d-86fa-4cdc-af74-5f1be8f5f54e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('47c9459d-86fa-4cdc-af74-5f1be8f5f54e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4d37550f-4cca-4b48-89e9-f6a68bb8155e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4d37550f-4cca-4b48-89e9-f6a68bb8155e')

GO

GO
PRINT N'Verificando os dados existentes em restrições recém-criadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Dim_Marca] WITH CHECK CHECK CONSTRAINT [FK_Dim_Marca_Dim_Categoria];

ALTER TABLE [dbo].[Dim_Produto] WITH CHECK CHECK CONSTRAINT [FK_Dim_Produto_Dim_Marca];


GO
PRINT N'Atualização concluída.';


GO
