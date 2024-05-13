/*
Created: 10/05/2024
Modified: 13/05/2024
Model: ProyectoFinBD
Database: MS SQL Server 2019
*/


-- Create tables section -------------------------------------------------

-- Table Organizador

CREATE TABLE [Organizador]
(
 [ID_Organizador] Int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 [Direccion] Varchar(50) NOT NULL,
 [Nombre] Varchar(100) NOT NULL,
 [Telefono] Int NOT NULL,
 [Emile] Varchar(50) NULL,
 [ID_Evento] Int NULL
)
go

-- Create indexes for table Organizador

CREATE INDEX [IX_Relationship2] ON [Organizador] ([ID_Evento])
go

-- Add keys for table Organizador

ALTER TABLE [Organizador] ADD CONSTRAINT [PK_Organizador] PRIMARY KEY ([ID_Organizador])
go

-- Table Salon

CREATE TABLE [Salon]
(
 [ID_Salon] Int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 [Capacidad] Int NOT NULL,
 [Estado] Varchar(50) NOT NULL,
 [Nombre] Varchar(30) NOT NULL
)
go

-- Add keys for table Salon

ALTER TABLE [Salon] ADD CONSTRAINT [PK_Salon] PRIMARY KEY ([ID_Salon])
go

-- Table Tipo Salon

CREATE TABLE [Tipo Salon]
(
 [SalonID] Int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 [Nombre] Varchar(30) NOT NULL,
 [ID_Evento] Int NULL,
 [ID_Salon] Int NULL
)
go

-- Create indexes for table Tipo Salon

CREATE INDEX [IX_Relationship5] ON [Tipo Salon] ([ID_Evento])
go

CREATE INDEX [IX_Relationship6] ON [Tipo Salon] ([ID_Salon])
go

-- Add keys for table Tipo Salon

ALTER TABLE [Tipo Salon] ADD CONSTRAINT [PK_Tipo Salon] PRIMARY KEY ([SalonID])
go

-- Table Evento

CREATE TABLE [Evento]
(
 [ID_Evento] Int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 [Fecha] Datetime NOT NULL,
 [HoraInicio] Time NOT NULL,
 [Hora Fin] Time NOT NULL,
 [Costo] Money NOT NULL,
 [Tipo Evento] Varchar(30) NOT NULL,
 [Servicio] Char(2) NULL,
 [No. Asistentes] Int NOT NULL,
 [ID_Cliente] Int NULL
)
go

-- Create indexes for table Evento

CREATE INDEX [IX_Relationship4] ON [Evento] ([ID_Cliente])
go

-- Add keys for table Evento

ALTER TABLE [Evento] ADD CONSTRAINT [PK_Evento] PRIMARY KEY ([ID_Evento])
go

-- Table Cliente

CREATE TABLE [Cliente]
(
 [ID_Cliente] Int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 [Nombre] Varchar(50) NOT NULL,
 [Telefono] Int NOT NULL,
 [Emile] Varchar(100) NULL
)
go

-- Add keys for table Cliente

ALTER TABLE [Cliente] ADD CONSTRAINT [PK_Cliente] PRIMARY KEY ([ID_Cliente])
go

-- Table Servicio

CREATE TABLE [Servicio]
(
 [Tipo] Varchar(30) NOT NULL,
 [ID_Servicio] Int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 [Cantidad] Int NOT NULL,
 [ID_Evento] Int NULL
)
go

-- Create indexes for table Servicio

CREATE INDEX [IX_Relationship3] ON [Servicio] ([ID_Evento])
go

-- Add keys for table Servicio

ALTER TABLE [Servicio] ADD CONSTRAINT [PK_Servicio] PRIMARY KEY ([ID_Servicio])
go

-- Table Inventario

CREATE TABLE [Inventario]
(
 [ID_Inventario] Int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 [Tipo] Varchar(30) NOT NULL,
 [Total] Int NOT NULL,
 [Disponibilidad] Int NOT NULL,
 [ID_Servicio] Int NULL
)
go

-- Create indexes for table Inventario

CREATE INDEX [IX_Relationship7] ON [Inventario] ([ID_Servicio])
go

-- Add keys for table Inventario

ALTER TABLE [Inventario] ADD CONSTRAINT [PK_Inventario] PRIMARY KEY ([ID_Inventario])
go

-- Table Roll

CREATE TABLE [Roll]
(
 [ID_Roll] Int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 [Usuario] Varchar(50) NOT NULL,
 [Password] Varchar(30) NOT NULL,
 [Tipo] Varchar(30) NOT NULL,
 [ID_Usuario] Int NULL,
 [Nombre] Varchar(50) NOT NULL
)
go

-- Create indexes for table Roll

CREATE INDEX [IX_Relationship8] ON [Roll] ([ID_Usuario])
go

-- Add keys for table Roll

ALTER TABLE [Roll] ADD CONSTRAINT [PK_Roll] PRIMARY KEY ([ID_Roll])
go

-- Table Usuario

CREATE TABLE [Usuario]
(
 [ID_Usuario] Int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 [Nombre] Varchar(30) NOT NULL,
 [Telefono] Varchar(8) NOT NULL,
 [Estado] Varchar(10) NOT NULL
)
go

-- Add keys for table Usuario

ALTER TABLE [Usuario] ADD CONSTRAINT [PK_Usuario] PRIMARY KEY ([ID_Usuario])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Organizador] ADD CONSTRAINT [Relationship2] FOREIGN KEY ([ID_Evento]) REFERENCES [Evento] ([ID_Evento]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Servicio] ADD CONSTRAINT [Relationship3] FOREIGN KEY ([ID_Evento]) REFERENCES [Evento] ([ID_Evento]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Evento] ADD CONSTRAINT [Relationship4] FOREIGN KEY ([ID_Cliente]) REFERENCES [Cliente] ([ID_Cliente]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Tipo Salon] ADD CONSTRAINT [Relationship5] FOREIGN KEY ([ID_Evento]) REFERENCES [Evento] ([ID_Evento]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Tipo Salon] ADD CONSTRAINT [Relationship6] FOREIGN KEY ([ID_Salon]) REFERENCES [Salon] ([ID_Salon]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Inventario] ADD CONSTRAINT [Relationship7] FOREIGN KEY ([ID_Servicio]) REFERENCES [Servicio] ([ID_Servicio]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Roll] ADD CONSTRAINT [Relationship8] FOREIGN KEY ([ID_Usuario]) REFERENCES [Usuario] ([ID_Usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




