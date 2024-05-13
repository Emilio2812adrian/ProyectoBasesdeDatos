USE [CConvenciones]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 13/05/2024 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID_Cliente] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Emile] [varchar](100) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 13/05/2024 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[ID_Evento] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[Hora Fin] [time](7) NOT NULL,
	[Costo] [money] NOT NULL,
	[Tipo Evento] [varchar](30) NOT NULL,
	[Servicio] [char](2) NULL,
	[No. Asistentes] [int] NOT NULL,
	[ID_Cliente] [int] NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[ID_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 13/05/2024 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[ID_Inventario] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Tipo] [varchar](30) NOT NULL,
	[Total] [int] NOT NULL,
	[Disponibilidad] [int] NOT NULL,
	[ID_Servicio] [int] NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[ID_Inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizador]    Script Date: 13/05/2024 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizador](
	[ID_Organizador] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Emile] [varchar](50) NULL,
	[ID_Evento] [int] NULL,
 CONSTRAINT [PK_Organizador] PRIMARY KEY CLUSTERED 
(
	[ID_Organizador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roll]    Script Date: 13/05/2024 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roll](
	[ID_Roll] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[Tipo] [varchar](30) NOT NULL,
	[ID_Usuario] [int] NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roll] PRIMARY KEY CLUSTERED 
(
	[ID_Roll] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salon]    Script Date: 13/05/2024 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salon](
	[ID_Salon] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Capacidad] [int] NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Salon] PRIMARY KEY CLUSTERED 
(
	[ID_Salon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 13/05/2024 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[Tipo] [varchar](30) NOT NULL,
	[ID_Servicio] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Cantidad] [int] NOT NULL,
	[ID_Evento] [int] NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[ID_Servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo Salon]    Script Date: 13/05/2024 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo Salon](
	[SalonID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[ID_Evento] [int] NULL,
	[ID_Salon] [int] NULL,
 CONSTRAINT [PK_Tipo Salon] PRIMARY KEY CLUSTERED 
(
	[SalonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 13/05/2024 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID_Usuario] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Telefono] [varchar](8) NOT NULL,
	[Estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [Relationship4] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Cliente] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [Relationship4]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [Relationship7] FOREIGN KEY([ID_Servicio])
REFERENCES [dbo].[Servicio] ([ID_Servicio])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [Relationship7]
GO
ALTER TABLE [dbo].[Organizador]  WITH CHECK ADD  CONSTRAINT [Relationship2] FOREIGN KEY([ID_Evento])
REFERENCES [dbo].[Evento] ([ID_Evento])
GO
ALTER TABLE [dbo].[Organizador] CHECK CONSTRAINT [Relationship2]
GO
ALTER TABLE [dbo].[Roll]  WITH CHECK ADD  CONSTRAINT [Relationship8] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuario] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Roll] CHECK CONSTRAINT [Relationship8]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [Relationship3] FOREIGN KEY([ID_Evento])
REFERENCES [dbo].[Evento] ([ID_Evento])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [Relationship3]
GO
ALTER TABLE [dbo].[Tipo Salon]  WITH CHECK ADD  CONSTRAINT [Relationship5] FOREIGN KEY([ID_Evento])
REFERENCES [dbo].[Evento] ([ID_Evento])
GO
ALTER TABLE [dbo].[Tipo Salon] CHECK CONSTRAINT [Relationship5]
GO
ALTER TABLE [dbo].[Tipo Salon]  WITH CHECK ADD  CONSTRAINT [Relationship6] FOREIGN KEY([ID_Salon])
REFERENCES [dbo].[Salon] ([ID_Salon])
GO
ALTER TABLE [dbo].[Tipo Salon] CHECK CONSTRAINT [Relationship6]
GO
