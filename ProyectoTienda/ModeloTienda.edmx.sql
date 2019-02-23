
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/24/2019 00:17:08
-- Generated from EDMX file: C:\Users\Tomas\Desktop\Organizador\NET\ProyectoTienda\ProyectoTienda\ProyectoTienda\ModeloTienda.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Tienda];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ClientePedido]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pedidos] DROP CONSTRAINT [FK_ClientePedido];
GO
IF OBJECT_ID(N'[dbo].[FK_PedidoArticulo_Articulos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PedidoArticulo] DROP CONSTRAINT [FK_PedidoArticulo_Articulos];
GO
IF OBJECT_ID(N'[dbo].[FK_PedidoArticulo_Pedidos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PedidoArticulo] DROP CONSTRAINT [FK_PedidoArticulo_Pedidos];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Articulos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Articulos];
GO
IF OBJECT_ID(N'[dbo].[Clientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clientes];
GO
IF OBJECT_ID(N'[dbo].[Pedidos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pedidos];
GO
IF OBJECT_ID(N'[dbo].[PedidoArticulo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PedidoArticulo];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Articulos'
CREATE TABLE [dbo].[Articulos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [stock] int  NOT NULL,
    [precio] float  NOT NULL
);
GO

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nombre] varchar(50)  NULL,
    [apellidos] varchar(150)  NULL,
    [direccion] varchar(350)  NULL,
    [email] varchar(50)  NULL
);
GO

-- Creating table 'Pedidos'
CREATE TABLE [dbo].[Pedidos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [fecha_registro] datetime  NOT NULL,
    [Cliente_Id] int  NOT NULL
);
GO

-- Creating table 'PedidoArticulo'
CREATE TABLE [dbo].[PedidoArticulo] (
    [Articulos_Id] int  NOT NULL,
    [Pedidos_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Articulos'
ALTER TABLE [dbo].[Articulos]
ADD CONSTRAINT [PK_Articulos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [PK_Pedidos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Articulos_Id], [Pedidos_Id] in table 'PedidoArticulo'
ALTER TABLE [dbo].[PedidoArticulo]
ADD CONSTRAINT [PK_PedidoArticulo]
    PRIMARY KEY CLUSTERED ([Articulos_Id], [Pedidos_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Cliente_Id] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [FK_ClientePedido]
    FOREIGN KEY ([Cliente_Id])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientePedido'
CREATE INDEX [IX_FK_ClientePedido]
ON [dbo].[Pedidos]
    ([Cliente_Id]);
GO

-- Creating foreign key on [Articulos_Id] in table 'PedidoArticulo'
ALTER TABLE [dbo].[PedidoArticulo]
ADD CONSTRAINT [FK_PedidoArticulo_Articulos]
    FOREIGN KEY ([Articulos_Id])
    REFERENCES [dbo].[Articulos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Pedidos_Id] in table 'PedidoArticulo'
ALTER TABLE [dbo].[PedidoArticulo]
ADD CONSTRAINT [FK_PedidoArticulo_Pedidos]
    FOREIGN KEY ([Pedidos_Id])
    REFERENCES [dbo].[Pedidos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoArticulo_Pedidos'
CREATE INDEX [IX_FK_PedidoArticulo_Pedidos]
ON [dbo].[PedidoArticulo]
    ([Pedidos_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------