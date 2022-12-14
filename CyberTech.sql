USE [master]
GO
/****** Object:  Database [CyberTech]    Script Date: 10/12/2022 12:18:49 ******/
CREATE DATABASE [CyberTech]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CyberTech', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CyberTech.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CyberTech_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CyberTech_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CyberTech] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CyberTech].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CyberTech] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CyberTech] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CyberTech] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CyberTech] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CyberTech] SET ARITHABORT OFF 
GO
ALTER DATABASE [CyberTech] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CyberTech] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CyberTech] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CyberTech] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CyberTech] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CyberTech] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CyberTech] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CyberTech] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CyberTech] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CyberTech] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CyberTech] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CyberTech] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CyberTech] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CyberTech] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CyberTech] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CyberTech] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CyberTech] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CyberTech] SET RECOVERY FULL 
GO
ALTER DATABASE [CyberTech] SET  MULTI_USER 
GO
ALTER DATABASE [CyberTech] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CyberTech] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CyberTech] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CyberTech] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CyberTech] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CyberTech] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CyberTech', N'ON'
GO
ALTER DATABASE [CyberTech] SET QUERY_STORE = OFF
GO
USE [CyberTech]
GO
/****** Object:  User [jordyNode]    Script Date: 10/12/2022 12:18:49 ******/
CREATE USER [jordyNode] FOR LOGIN [jordyNode] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [jordyNode]
GO
ALTER ROLE [db_datareader] ADD MEMBER [jordyNode]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [jordyNode]
GO
/****** Object:  Table [dbo].[TbCliente]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[telefono] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TbCliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbCobro_Cliente]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCobro_Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCustomer] [int] NOT NULL,
	[idTarifa] [int] NOT NULL,
	[IdTipoCobro] [int] NOT NULL,
	[totalVolumen] [decimal](11, 2) NULL,
	[totalMonto] [decimal](11, 2) NULL,
 CONSTRAINT [PK_TbCobro_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbServicio]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbServicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[servicio] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TbServicio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbServicio_Cobro]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbServicio_Cobro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCobro] [int] NOT NULL,
	[idServicio] [int] NOT NULL,
	[volumen] [decimal](11, 2) NOT NULL,
 CONSTRAINT [PK_TbServicio_Cobro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbTarifa]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbTarifa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tarifa] [decimal](11, 2) NOT NULL,
	[estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_TbTarifa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbType_Cobro]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbType_Cobro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cobro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TbType_Cobro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TbServicio] ON 

INSERT [dbo].[TbServicio] ([id], [servicio]) VALUES (1, N'SR1')
INSERT [dbo].[TbServicio] ([id], [servicio]) VALUES (2, N'SR2')
INSERT [dbo].[TbServicio] ([id], [servicio]) VALUES (3, N'SR3')
INSERT [dbo].[TbServicio] ([id], [servicio]) VALUES (4, N'SR4')
INSERT [dbo].[TbServicio] ([id], [servicio]) VALUES (5, N'SR5')
SET IDENTITY_INSERT [dbo].[TbServicio] OFF
GO
SET IDENTITY_INSERT [dbo].[TbTarifa] ON 

INSERT [dbo].[TbTarifa] ([id], [tarifa], [estado]) VALUES (1, CAST(2.52 AS Decimal(11, 2)), 1)
INSERT [dbo].[TbTarifa] ([id], [tarifa], [estado]) VALUES (2, CAST(3.52 AS Decimal(11, 2)), 0)
INSERT [dbo].[TbTarifa] ([id], [tarifa], [estado]) VALUES (3, CAST(4.52 AS Decimal(11, 2)), 0)
SET IDENTITY_INSERT [dbo].[TbTarifa] OFF
GO
SET IDENTITY_INSERT [dbo].[TbType_Cobro] ON 

INSERT [dbo].[TbType_Cobro] ([id], [cobro]) VALUES (1, N'Volumetrico')
INSERT [dbo].[TbType_Cobro] ([id], [cobro]) VALUES (2, N'Diferenciado')
SET IDENTITY_INSERT [dbo].[TbType_Cobro] OFF
GO
ALTER TABLE [dbo].[TbCobro_Cliente]  WITH CHECK ADD  CONSTRAINT [FkTbCobroCliente_TbTypeCobro] FOREIGN KEY([IdTipoCobro])
REFERENCES [dbo].[TbType_Cobro] ([id])
GO
ALTER TABLE [dbo].[TbCobro_Cliente] CHECK CONSTRAINT [FkTbCobroCliente_TbTypeCobro]
GO
ALTER TABLE [dbo].[TbCobro_Cliente]  WITH CHECK ADD  CONSTRAINT [FkTbCobroClienteTbCliente] FOREIGN KEY([idCustomer])
REFERENCES [dbo].[TbCliente] ([id])
GO
ALTER TABLE [dbo].[TbCobro_Cliente] CHECK CONSTRAINT [FkTbCobroClienteTbCliente]
GO
ALTER TABLE [dbo].[TbCobro_Cliente]  WITH CHECK ADD  CONSTRAINT [FkTbCobroClienteTbTarifa] FOREIGN KEY([idTarifa])
REFERENCES [dbo].[TbTarifa] ([id])
GO
ALTER TABLE [dbo].[TbCobro_Cliente] CHECK CONSTRAINT [FkTbCobroClienteTbTarifa]
GO
ALTER TABLE [dbo].[TbServicio_Cobro]  WITH CHECK ADD  CONSTRAINT [FkTbServicioCobroTbCobroCliente] FOREIGN KEY([idCobro])
REFERENCES [dbo].[TbCobro_Cliente] ([id])
GO
ALTER TABLE [dbo].[TbServicio_Cobro] CHECK CONSTRAINT [FkTbServicioCobroTbCobroCliente]
GO
ALTER TABLE [dbo].[TbServicio_Cobro]  WITH CHECK ADD  CONSTRAINT [FkTbServicioCobroTbServicio] FOREIGN KEY([idServicio])
REFERENCES [dbo].[TbServicio] ([id])
GO
ALTER TABLE [dbo].[TbServicio_Cobro] CHECK CONSTRAINT [FkTbServicioCobroTbServicio]
GO
/****** Object:  StoredProcedure [dbo].[SpCreateClient]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jordy
-- Create date: 9/12/2022
-- Description:	Procedimiento almacenado para 
-- crear Clientes
-- =============================================
CREATE PROCEDURE [dbo].[SpCreateClient]
	-- Add the parameters for the stored procedure here
	@correo varchar(50),
	@telefono varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TbCliente (correo,telefono) values (@correo,@telefono)
END
GO
/****** Object:  StoredProcedure [dbo].[SpCreatePaymentServices]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jordy
-- Create date: 9/12/2022
-- Description:	Procedimiento almacenado para 
-- crear Clientes
-- =============================================
CREATE PROCEDURE [dbo].[SpCreatePaymentServices]
	-- Add the parameters for the stored procedure here id idcobro idServicio volumen

	@idcobro int,
	@idServicio int,
	@volumen decimal(11,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TbServicio_Cobro (idCobro,idServicio,volumen) values (@idcobro,@idServicio,@volumen)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetClients]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jordy
-- Create date: 9/12/2022
-- Description:	Procedimiento almacenado para obtener los clientes
-- =============================================
CREATE PROCEDURE [dbo].[spGetClients] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id,correo,telefono FROM TbCliente
END
GO
/****** Object:  StoredProcedure [dbo].[SpGetPaymentServiceById]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jordy
-- Create date: 10/12/2022
-- Description:	Procedimiento almacenado que consulta los Cobros
-- con los Servicios de un cliente en especifico
-- =============================================
CREATE PROCEDURE [dbo].[SpGetPaymentServiceById]
	-- Add the parameters for the stored procedure here
	@idCliente int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Sc.volumen,Cc.totalMonto,Cc.totalVolumen FROM TbCobro_Cliente Cc
	inner join TbServicio_Cobro Sc on sc.idCobro=Cc.id
	WHERE Cc.idCustomer=@idCliente
END
GO
/****** Object:  StoredProcedure [dbo].[spGetServices]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jordy
-- Create date: <9/12/2022
-- Description:	Procedimiento almacenado para obtener los servicios
-- =============================================
CREATE PROCEDURE [dbo].[spGetServices] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id,servicio FROM TbServicio
END
GO
/****** Object:  Trigger [dbo].[TrRegitroCobroCliente]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jordy
-- Create date: 9/12/2022
-- Description:	Trigger que registra datos en la taba TbCobroCliente al crear un usuario
-- =============================================
CREATE TRIGGER [dbo].[TrRegitroCobroCliente]
   ON   [dbo].[TbCliente]
   AFTER  INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 DECLARE @IdCustomer int, @IdTarifa int

	SELECT @IdTarifa=id FROM TbTarifa WHERE estado =1

	SELECT @IdCustomer = i.id From inserted i

	INSERT Into TbCobro_Cliente (idCustomer,idTarifa,IdTipoCobro) values (@IdCustomer, @IdTarifa,1)
	INSERT Into TbCobro_Cliente (idCustomer,idTarifa,IdTipoCobro) values (@IdCustomer, @IdTarifa,2)


   

END
GO
ALTER TABLE [dbo].[TbCliente] ENABLE TRIGGER [TrRegitroCobroCliente]
GO
/****** Object:  Trigger [dbo].[TrServicioCobro]    Script Date: 10/12/2022 12:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =======================================================
-- Author:		Jordy
-- Create date: 9/12/2022
-- Description:	Trigger que al crear un servicio_cobro,
-- acutaliza el volumen total del servicio_cobro
-- ======================================================
CREATE TRIGGER [dbo].[TrServicioCobro]
   ON  [dbo].[TbServicio_Cobro]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @IdCobro int, @tarifa decimal(11,2), @volumen decimal(11,2), @volumenActual decimal(11,2)

	SELECT @IdCobro = i.idCobro, @volumen=i.volumen from inserted i;
	SELECT @tarifa = tarifa FROM TbTarifa WHERE estado = 1;
	SELECT @volumenActual=totalVolumen from TbCobro_Cliente where id=@IdCobro

	UPDATE TbCobro_Cliente set totalVolumen=(@volumen+@volumenActual),totalMonto=(@tarifa*@volumen) WHERE id = @IdCobro
END
GO
ALTER TABLE [dbo].[TbServicio_Cobro] ENABLE TRIGGER [TrServicioCobro]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave foranea entre la tabla TbType_Cobro en el campo id y la tabla TbCobro_Cliente por el campo IdTarifa
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbCobro_Cliente', @level2type=N'CONSTRAINT',@level2name=N'FkTbCobroCliente_TbTypeCobro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave foranea entre el campo id de la tabla TbCliente con la tabala TbCobro_Cliente por el campo idCustomer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbCobro_Cliente', @level2type=N'CONSTRAINT',@level2name=N'FkTbCobroClienteTbCliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave foranea entre la tabla TbTarifa por el campo Id y la tabla TbCobroCliente por el campo IdTarifa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbCobro_Cliente', @level2type=N'CONSTRAINT',@level2name=N'FkTbCobroClienteTbTarifa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbCobro_Cliente por el campo Id y la tabla TbServicioCobro por el campo IdCobro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbServicio_Cobro', @level2type=N'CONSTRAINT',@level2name=N'FkTbServicioCobroTbCobroCliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave foranea entre las tablas TbServicio por el campo Id y la tabla TbServicio_Cobro por el campo idServicio.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbServicio_Cobro', @level2type=N'CONSTRAINT',@level2name=N'FkTbServicioCobroTbServicio'
GO
USE [master]
GO
ALTER DATABASE [CyberTech] SET  READ_WRITE 
GO
