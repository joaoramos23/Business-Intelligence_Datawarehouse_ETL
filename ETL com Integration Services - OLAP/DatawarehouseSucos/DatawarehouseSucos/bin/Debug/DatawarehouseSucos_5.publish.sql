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
PRINT N'A operação de refatoração Renomear com chave e4128d6c-5dfd-44a6-87e3-df7b0c90a6a4, 544c59e9-0cd7-482c-8640-de40e83cc859 foi ignorada; o elemento [dbo].[Fato_001].[Id] (SqlSimpleColumn) não será renomeado para Cod_Cliente';


GO
PRINT N'A operação de refatoração Renomear com chave 2500f16d-5d82-4623-a3d1-c48ec0d7bba2 foi ignorada; o elemento [dbo].[FK_Fato_001_Dim_cliente] (SqlForeignKeyConstraint) não será renomeado para [FK_Fato_001_Dim_Cliente]';


GO
PRINT N'Criando Tabela [dbo].[Fato_001]...';


GO
CREATE TABLE [dbo].[Fato_001] (
    [Cod_Cliente]        NVARCHAR (50) NOT NULL,
    [Cod_Produto]        NVARCHAR (50) NOT NULL,
    [Cod_Organizacional] NVARCHAR (50) NOT NULL,
    [Cod_Fabrica]        NVARCHAR (50) NOT NULL,
    [Cod_Dia]            NVARCHAR (50) NOT NULL,
    [Faturamento]        FLOAT (53)    NULL,
    [Imposto]            FLOAT (53)    NULL,
    [Custo_Variavel]     FLOAT (53)    NULL,
    [Quantidade_Vendida] FLOAT (53)    NULL,
    [Unidade_Vendida]    FLOAT (53)    NULL,
    PRIMARY KEY CLUSTERED ([Cod_Dia] ASC, [Cod_Cliente] ASC, [Cod_Produto] ASC, [Cod_Organizacional] ASC, [Cod_Fabrica] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Fato_002]...';


GO
CREATE TABLE [dbo].[Fato_002] (
    [Cod_Cliente] NVARCHAR (50) NOT NULL,
    [Cod_Produto] NVARCHAR (50) NOT NULL,
    [Cod_Fabrica] NVARCHAR (50) NOT NULL,
    [Cod_Dia]     NVARCHAR (50) NOT NULL,
    [Frete]       FLOAT (53)    NULL,
    PRIMARY KEY CLUSTERED ([Cod_Dia] ASC, [Cod_Cliente] ASC, [Cod_Produto] ASC, [Cod_Fabrica] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Fato_003]...';


GO
CREATE TABLE [dbo].[Fato_003] (
    [Cod_Fabrica] NVARCHAR (50) NOT NULL,
    [Cod_Dia]     NVARCHAR (50) NOT NULL,
    [Custo_Fixo]  FLOAT (53)    NULL,
    PRIMARY KEY CLUSTERED ([Cod_Dia] ASC, [Cod_Fabrica] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Fato_004]...';


GO
CREATE TABLE [dbo].[Fato_004] (
    [Cod_Cliente]        NVARCHAR (50) NOT NULL,
    [Cod_Produto]        NVARCHAR (50) NOT NULL,
    [Cod_Organizacional] NVARCHAR (50) NOT NULL,
    [Cod_Dia]            NVARCHAR (50) NOT NULL,
    [Meta_Faturamento]   FLOAT (53)    NULL,
    PRIMARY KEY CLUSTERED ([Cod_Dia] ASC, [Cod_Cliente] ASC, [Cod_Produto] ASC, [Cod_Organizacional] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Fato_005]...';


GO
CREATE TABLE [dbo].[Fato_005] (
    [Cod_Produto] NVARCHAR (50) NOT NULL,
    [Cod_Fabrica] NVARCHAR (50) NOT NULL,
    [Cod_Dia]     NVARCHAR (50) NOT NULL,
    [Meta_Custo]  FLOAT (53)    NULL,
    PRIMARY KEY CLUSTERED ([Cod_Dia] ASC, [Cod_Produto] ASC, [Cod_Fabrica] ASC)
);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_001_Dim_Cliente]...';


GO
ALTER TABLE [dbo].[Fato_001] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_001_Dim_Cliente] FOREIGN KEY ([Cod_Cliente]) REFERENCES [dbo].[Dim_Cliente] ([Cod_Cliente]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_001_Dim_Produto]...';


GO
ALTER TABLE [dbo].[Fato_001] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_001_Dim_Produto] FOREIGN KEY ([Cod_Produto]) REFERENCES [dbo].[Dim_Produto] ([Cod_Produto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_001_Dim_Organizacional]...';


GO
ALTER TABLE [dbo].[Fato_001] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_001_Dim_Organizacional] FOREIGN KEY ([Cod_Organizacional]) REFERENCES [dbo].[Dim_Organizacional] ([Cod_Filho]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_001_Dim_Fabrica]...';


GO
ALTER TABLE [dbo].[Fato_001] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_001_Dim_Fabrica] FOREIGN KEY ([Cod_Fabrica]) REFERENCES [dbo].[Dim_Fabrica] ([Cod_Fabrica]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_001_Dim_Dia]...';


GO
ALTER TABLE [dbo].[Fato_001] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_001_Dim_Dia] FOREIGN KEY ([Cod_Dia]) REFERENCES [dbo].[Dim_Tempo] ([Cod_Dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_002_Dim_Cliente]...';


GO
ALTER TABLE [dbo].[Fato_002] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_002_Dim_Cliente] FOREIGN KEY ([Cod_Cliente]) REFERENCES [dbo].[Dim_Cliente] ([Cod_Cliente]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_002_Dim_Produto]...';


GO
ALTER TABLE [dbo].[Fato_002] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_002_Dim_Produto] FOREIGN KEY ([Cod_Produto]) REFERENCES [dbo].[Dim_Produto] ([Cod_Produto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_002_Dim_Fabrica]...';


GO
ALTER TABLE [dbo].[Fato_002] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_002_Dim_Fabrica] FOREIGN KEY ([Cod_Fabrica]) REFERENCES [dbo].[Dim_Fabrica] ([Cod_Fabrica]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_002_Dim_Dia]...';


GO
ALTER TABLE [dbo].[Fato_002] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_002_Dim_Dia] FOREIGN KEY ([Cod_Dia]) REFERENCES [dbo].[Dim_Tempo] ([Cod_Dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_003_Dim_Fabrica]...';


GO
ALTER TABLE [dbo].[Fato_003] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_003_Dim_Fabrica] FOREIGN KEY ([Cod_Fabrica]) REFERENCES [dbo].[Dim_Fabrica] ([Cod_Fabrica]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_003_Dim_Dia]...';


GO
ALTER TABLE [dbo].[Fato_003] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_003_Dim_Dia] FOREIGN KEY ([Cod_Dia]) REFERENCES [dbo].[Dim_Tempo] ([Cod_Dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_004_Dim_Cliente]...';


GO
ALTER TABLE [dbo].[Fato_004] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_004_Dim_Cliente] FOREIGN KEY ([Cod_Cliente]) REFERENCES [dbo].[Dim_Cliente] ([Cod_Cliente]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_004_Dim_Produto]...';


GO
ALTER TABLE [dbo].[Fato_004] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_004_Dim_Produto] FOREIGN KEY ([Cod_Produto]) REFERENCES [dbo].[Dim_Produto] ([Cod_Produto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_004_Dim_Organizacional]...';


GO
ALTER TABLE [dbo].[Fato_004] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_004_Dim_Organizacional] FOREIGN KEY ([Cod_Organizacional]) REFERENCES [dbo].[Dim_Organizacional] ([Cod_Filho]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_004_Dim_Dia]...';


GO
ALTER TABLE [dbo].[Fato_004] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_004_Dim_Dia] FOREIGN KEY ([Cod_Dia]) REFERENCES [dbo].[Dim_Tempo] ([Cod_Dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_005_Dim_Produto]...';


GO
ALTER TABLE [dbo].[Fato_005] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_005_Dim_Produto] FOREIGN KEY ([Cod_Produto]) REFERENCES [dbo].[Dim_Produto] ([Cod_Produto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_005_Dim_Fabrica]...';


GO
ALTER TABLE [dbo].[Fato_005] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_005_Dim_Fabrica] FOREIGN KEY ([Cod_Fabrica]) REFERENCES [dbo].[Dim_Fabrica] ([Cod_Fabrica]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_005_Dim_Dia]...';


GO
ALTER TABLE [dbo].[Fato_005] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato_005_Dim_Dia] FOREIGN KEY ([Cod_Dia]) REFERENCES [dbo].[Dim_Tempo] ([Cod_Dia]);


GO
-- Etapa de refatoração para atualizar o servidor de destino com logs de transação implantados
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e4128d6c-5dfd-44a6-87e3-df7b0c90a6a4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e4128d6c-5dfd-44a6-87e3-df7b0c90a6a4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '544c59e9-0cd7-482c-8640-de40e83cc859')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('544c59e9-0cd7-482c-8640-de40e83cc859')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2500f16d-5d82-4623-a3d1-c48ec0d7bba2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2500f16d-5d82-4623-a3d1-c48ec0d7bba2')

GO

GO
PRINT N'Verificando os dados existentes em restrições recém-criadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Fato_001] WITH CHECK CHECK CONSTRAINT [FK_Fato_001_Dim_Cliente];

ALTER TABLE [dbo].[Fato_001] WITH CHECK CHECK CONSTRAINT [FK_Fato_001_Dim_Produto];

ALTER TABLE [dbo].[Fato_001] WITH CHECK CHECK CONSTRAINT [FK_Fato_001_Dim_Organizacional];

ALTER TABLE [dbo].[Fato_001] WITH CHECK CHECK CONSTRAINT [FK_Fato_001_Dim_Fabrica];

ALTER TABLE [dbo].[Fato_001] WITH CHECK CHECK CONSTRAINT [FK_Fato_001_Dim_Dia];

ALTER TABLE [dbo].[Fato_002] WITH CHECK CHECK CONSTRAINT [FK_Fato_002_Dim_Cliente];

ALTER TABLE [dbo].[Fato_002] WITH CHECK CHECK CONSTRAINT [FK_Fato_002_Dim_Produto];

ALTER TABLE [dbo].[Fato_002] WITH CHECK CHECK CONSTRAINT [FK_Fato_002_Dim_Fabrica];

ALTER TABLE [dbo].[Fato_002] WITH CHECK CHECK CONSTRAINT [FK_Fato_002_Dim_Dia];

ALTER TABLE [dbo].[Fato_003] WITH CHECK CHECK CONSTRAINT [FK_Fato_003_Dim_Fabrica];

ALTER TABLE [dbo].[Fato_003] WITH CHECK CHECK CONSTRAINT [FK_Fato_003_Dim_Dia];

ALTER TABLE [dbo].[Fato_004] WITH CHECK CHECK CONSTRAINT [FK_Fato_004_Dim_Cliente];

ALTER TABLE [dbo].[Fato_004] WITH CHECK CHECK CONSTRAINT [FK_Fato_004_Dim_Produto];

ALTER TABLE [dbo].[Fato_004] WITH CHECK CHECK CONSTRAINT [FK_Fato_004_Dim_Organizacional];

ALTER TABLE [dbo].[Fato_004] WITH CHECK CHECK CONSTRAINT [FK_Fato_004_Dim_Dia];

ALTER TABLE [dbo].[Fato_005] WITH CHECK CHECK CONSTRAINT [FK_Fato_005_Dim_Produto];

ALTER TABLE [dbo].[Fato_005] WITH CHECK CHECK CONSTRAINT [FK_Fato_005_Dim_Fabrica];

ALTER TABLE [dbo].[Fato_005] WITH CHECK CHECK CONSTRAINT [FK_Fato_005_Dim_Dia];


GO
PRINT N'Atualização concluída.';


GO
