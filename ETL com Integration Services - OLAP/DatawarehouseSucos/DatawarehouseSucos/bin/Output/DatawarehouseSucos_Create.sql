/*
Script de implantação para DatawarehouseSucos

Este código foi gerado por uma ferramenta.
As alterações feitas nesse arquivo poderão causar comportamento incorreto e serão perdidas se
o código for gerado novamente.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DatawarehouseSucos"
:setvar DefaultFilePrefix "DatawarehouseSucos"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Criando o banco de dados $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)] COLLATE SQL_Latin1_General_CP1_CI_AS
GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'As configurações de banco de dados não podem ser modificadas. Você deve ser um SysAdmin para aplicar essas configurações.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'As configurações de banco de dados não podem ser modificadas. Você deve ser um SysAdmin para aplicar essas configurações.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


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
PRINT N'Criando Tabela [dbo].[Dim_Tempo]...';


GO
CREATE TABLE [dbo].[Dim_Tempo] (
    [Cod_Dia]            NVARCHAR (50) NOT NULL,
    [Data]               DATE          NULL,
    [Cod_Semana]         INT           NULL,
    [Nome_Dia_Semana]    NVARCHAR (50) NULL,
    [Cod_Mes]            INT           NULL,
    [Nome_Mes]           NVARCHAR (50) NULL,
    [Cod_Mes_Ano]        NVARCHAR (50) NULL,
    [Nome_Mes_Ano]       NVARCHAR (50) NULL,
    [Cod_Trimestre]      INT           NULL,
    [Nome_Trimestre]     NVARCHAR (50) NULL,
    [Cod_Trimestre_Ano]  NVARCHAR (50) NULL,
    [Nome_Trimestre_Ano] NVARCHAR (50) NULL,
    [Cod_Semestre]       INT           NULL,
    [Nome_Semestre]      NVARCHAR (50) NULL,
    [Cod_Semestre_Ano]   NVARCHAR (50) NULL,
    [Nome_Semestre_Ano]  NVARCHAR (50) NULL,
    [Ano]                NVARCHAR (50) NULL,
    [Tipo_DIa]           NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Cod_Dia] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Dim_Organizacional]...';


GO
CREATE TABLE [dbo].[Dim_Organizacional] (
    [Cod_Filho]  NVARCHAR (50)  NOT NULL,
    [Desc_Filho] NVARCHAR (200) NULL,
    [Cod_Pai]    NVARCHAR (50)  NULL,
    [Esquerda]   INT            NULL,
    [Direita]    INT            NULL,
    [Nivel]      INT            NULL,
    PRIMARY KEY CLUSTERED ([Cod_Filho] ASC)
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
PRINT N'Criando Tabela [dbo].[Dim_Categoria]...';


GO
CREATE TABLE [dbo].[Dim_Categoria] (
    [Cod_Categoria]  NVARCHAR (50)  NOT NULL,
    [Desc_Categoria] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([Cod_Categoria] ASC)
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
PRINT N'Criando Tabela [dbo].[Dim_Fabrica]...';


GO
CREATE TABLE [dbo].[Dim_Fabrica] (
    [Cod_Fabrica] NVARCHAR (50)  NOT NULL,
    [Des_Fabrica] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([Cod_Fabrica] ASC)
);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_005_Dim_Produto]...';


GO
ALTER TABLE [dbo].[Fato_005]
    ADD CONSTRAINT [FK_Fato_005_Dim_Produto] FOREIGN KEY ([Cod_Produto]) REFERENCES [dbo].[Dim_Produto] ([Cod_Produto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_005_Dim_Fabrica]...';


GO
ALTER TABLE [dbo].[Fato_005]
    ADD CONSTRAINT [FK_Fato_005_Dim_Fabrica] FOREIGN KEY ([Cod_Fabrica]) REFERENCES [dbo].[Dim_Fabrica] ([Cod_Fabrica]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_005_Dim_Dia]...';


GO
ALTER TABLE [dbo].[Fato_005]
    ADD CONSTRAINT [FK_Fato_005_Dim_Dia] FOREIGN KEY ([Cod_Dia]) REFERENCES [dbo].[Dim_Tempo] ([Cod_Dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_003_Dim_Fabrica]...';


GO
ALTER TABLE [dbo].[Fato_003]
    ADD CONSTRAINT [FK_Fato_003_Dim_Fabrica] FOREIGN KEY ([Cod_Fabrica]) REFERENCES [dbo].[Dim_Fabrica] ([Cod_Fabrica]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_003_Dim_Dia]...';


GO
ALTER TABLE [dbo].[Fato_003]
    ADD CONSTRAINT [FK_Fato_003_Dim_Dia] FOREIGN KEY ([Cod_Dia]) REFERENCES [dbo].[Dim_Tempo] ([Cod_Dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_004_Dim_Cliente]...';


GO
ALTER TABLE [dbo].[Fato_004]
    ADD CONSTRAINT [FK_Fato_004_Dim_Cliente] FOREIGN KEY ([Cod_Cliente]) REFERENCES [dbo].[Dim_Cliente] ([Cod_Cliente]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_004_Dim_Produto]...';


GO
ALTER TABLE [dbo].[Fato_004]
    ADD CONSTRAINT [FK_Fato_004_Dim_Produto] FOREIGN KEY ([Cod_Produto]) REFERENCES [dbo].[Dim_Produto] ([Cod_Produto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_004_Dim_Organizacional]...';


GO
ALTER TABLE [dbo].[Fato_004]
    ADD CONSTRAINT [FK_Fato_004_Dim_Organizacional] FOREIGN KEY ([Cod_Organizacional]) REFERENCES [dbo].[Dim_Organizacional] ([Cod_Filho]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_004_Dim_Dia]...';


GO
ALTER TABLE [dbo].[Fato_004]
    ADD CONSTRAINT [FK_Fato_004_Dim_Dia] FOREIGN KEY ([Cod_Dia]) REFERENCES [dbo].[Dim_Tempo] ([Cod_Dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_002_Dim_Cliente]...';


GO
ALTER TABLE [dbo].[Fato_002]
    ADD CONSTRAINT [FK_Fato_002_Dim_Cliente] FOREIGN KEY ([Cod_Cliente]) REFERENCES [dbo].[Dim_Cliente] ([Cod_Cliente]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_002_Dim_Produto]...';


GO
ALTER TABLE [dbo].[Fato_002]
    ADD CONSTRAINT [FK_Fato_002_Dim_Produto] FOREIGN KEY ([Cod_Produto]) REFERENCES [dbo].[Dim_Produto] ([Cod_Produto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_002_Dim_Fabrica]...';


GO
ALTER TABLE [dbo].[Fato_002]
    ADD CONSTRAINT [FK_Fato_002_Dim_Fabrica] FOREIGN KEY ([Cod_Fabrica]) REFERENCES [dbo].[Dim_Fabrica] ([Cod_Fabrica]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_002_Dim_Dia]...';


GO
ALTER TABLE [dbo].[Fato_002]
    ADD CONSTRAINT [FK_Fato_002_Dim_Dia] FOREIGN KEY ([Cod_Dia]) REFERENCES [dbo].[Dim_Tempo] ([Cod_Dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_001_Dim_Cliente]...';


GO
ALTER TABLE [dbo].[Fato_001]
    ADD CONSTRAINT [FK_Fato_001_Dim_Cliente] FOREIGN KEY ([Cod_Cliente]) REFERENCES [dbo].[Dim_Cliente] ([Cod_Cliente]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_001_Dim_Produto]...';


GO
ALTER TABLE [dbo].[Fato_001]
    ADD CONSTRAINT [FK_Fato_001_Dim_Produto] FOREIGN KEY ([Cod_Produto]) REFERENCES [dbo].[Dim_Produto] ([Cod_Produto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_001_Dim_Organizacional]...';


GO
ALTER TABLE [dbo].[Fato_001]
    ADD CONSTRAINT [FK_Fato_001_Dim_Organizacional] FOREIGN KEY ([Cod_Organizacional]) REFERENCES [dbo].[Dim_Organizacional] ([Cod_Filho]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_001_Dim_Fabrica]...';


GO
ALTER TABLE [dbo].[Fato_001]
    ADD CONSTRAINT [FK_Fato_001_Dim_Fabrica] FOREIGN KEY ([Cod_Fabrica]) REFERENCES [dbo].[Dim_Fabrica] ([Cod_Fabrica]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato_001_Dim_Dia]...';


GO
ALTER TABLE [dbo].[Fato_001]
    ADD CONSTRAINT [FK_Fato_001_Dim_Dia] FOREIGN KEY ([Cod_Dia]) REFERENCES [dbo].[Dim_Tempo] ([Cod_Dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Organizacional_Dim_Organizacional]...';


GO
ALTER TABLE [dbo].[Dim_Organizacional]
    ADD CONSTRAINT [FK_Dim_Organizacional_Dim_Organizacional] FOREIGN KEY ([Cod_Pai]) REFERENCES [dbo].[Dim_Organizacional] ([Cod_Filho]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Marca_Dim_Categoria]...';


GO
ALTER TABLE [dbo].[Dim_Marca]
    ADD CONSTRAINT [FK_Dim_Marca_Dim_Categoria] FOREIGN KEY ([Cod_Categoria]) REFERENCES [dbo].[Dim_Categoria] ([Cod_Categoria]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Produto_Dim_Marca]...';


GO
ALTER TABLE [dbo].[Dim_Produto]
    ADD CONSTRAINT [FK_Dim_Produto_Dim_Marca] FOREIGN KEY ([Cod_Marca]) REFERENCES [dbo].[Dim_Marca] ([Cod_Marca]);


GO
-- Etapa de refatoração para atualizar o servidor de destino com logs de transação implantados

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0cf963dd-de7e-4bc9-9def-360fce2e87fc')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0cf963dd-de7e-4bc9-9def-360fce2e87fc')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'cc4da4d5-481e-4728-adfe-4dfd2278d158')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('cc4da4d5-481e-4728-adfe-4dfd2278d158')
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
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'af372f40-1b46-4c92-b14f-88e02ef8661a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('af372f40-1b46-4c92-b14f-88e02ef8661a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1c6c42ac-0455-4faa-b66c-0f5eb220cc83')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1c6c42ac-0455-4faa-b66c-0f5eb220cc83')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e4128d6c-5dfd-44a6-87e3-df7b0c90a6a4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e4128d6c-5dfd-44a6-87e3-df7b0c90a6a4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '544c59e9-0cd7-482c-8640-de40e83cc859')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('544c59e9-0cd7-482c-8640-de40e83cc859')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2500f16d-5d82-4623-a3d1-c48ec0d7bba2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2500f16d-5d82-4623-a3d1-c48ec0d7bba2')

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET MULTI_USER 
    WITH ROLLBACK IMMEDIATE;


GO
PRINT N'Atualização concluída.';


GO
