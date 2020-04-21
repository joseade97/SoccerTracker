USE progra5

GO
set dateformat mdy
go
CREATE TABLE [Cantones](
	[id_canton] [int]  NOT NULL IDENTITY (1, 1),
	[id_provincia] [int]NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[usuario_creacion] [varchar](50) NULL CONSTRAINT [DF__Canton__usuarioC__1B29CEB6]  DEFAULT (suser_name()),
	[fecha_creacion] [datetime] NULL CONSTRAINT [DF__Canton__fechaCre__1C1DF2EF]  DEFAULT (getdate()),
	[usuario_modificacion] [varchar](50) NULL CONSTRAINT [DF__Canton__usuarioM__1D121728]  DEFAULT (suser_name()),
	[fecha_ult_mod] [datetime] NULL CONSTRAINT [DF__Canton__fechaMod__1E063B61]  DEFAULT (getdate()),
	[vc_estado] [varchar](3) NULL CONSTRAINT [DF__Canton__vc_Estad__1EFA5F9A]  DEFAULT ('A'),
	[id_canton_inec] [int] NOT NULL,
 CONSTRAINT [PK_Canton] PRIMARY KEY CLUSTERED 
(
	[id_canton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
go

SET ANSI_PADDING OFF
GO
/****** Object:  Table [Distritos]    Script Date: 14/10/2016 07:00:33 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Distritos](
	[id_distrito] [int] NOT NULL IDENTITY (1, 1),
	[id_canton] [int] NULL,
	[nombre] [varchar](100) NOT NULL,
	[usuario_creacion] [varchar](50) NULL CONSTRAINT [DF__Distrito__usuari__2B60367F]  DEFAULT (suser_name()),
	[fecha_creacion] [datetime] NULL CONSTRAINT [DF__Distrito__fechaC__2C545AB8]  DEFAULT (getdate()),
	[usuario_modificacion] [varchar](50) NULL CONSTRAINT [DF__Distrito__usuari__2D487EF1]  DEFAULT (suser_name()),
	[fecha_ult_mod] [datetime] NULL CONSTRAINT [DF__Distrito__fechaM__2E3CA32A]  DEFAULT (getdate()),
	[vc_estado] [varchar](3) NULL CONSTRAINT [DF__Distrito__vc_Est__2F30C763]  DEFAULT ('A'),
	[id_distrito_inec] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Provincias]    Script Date: 14/10/2016 07:00:33 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Provincias](
	[id_canton] [int] NOT NULL IDENTITY (1, 1),
	[nombre] [varchar](100) NOT NULL,
	[usuario_creacion] [varchar](50) NULL CONSTRAINT [DF__Provincia__usuar__1388ACEE]  DEFAULT (suser_name()),
	[fecha_creacion] [datetime] NULL CONSTRAINT [DF__Provincia__fecha__147CD127]  DEFAULT (getdate()),
	[usuario_modificacion] [varchar](50) NULL CONSTRAINT [DF__Provincia__usuar__1570F560]  DEFAULT (suser_name()),
	[fecha_ult_mod] [datetime] NULL CONSTRAINT [DF__Provincia__fecha__16651999]  DEFAULT (getdate()),
	[vc_estado] [varchar](3) NULL CONSTRAINT [DF__Provincia__vc_Es__17593DD2]  DEFAULT ('A')
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Index [id_distrito_pk]    Script Date: 14/10/2016 07:00:33 p.m. ******/
ALTER TABLE [Distritos] ADD  CONSTRAINT [id_distrito_pk] PRIMARY KEY NONCLUSTERED 
(
	[id_distrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [id_provincia_pk]    Script Date: 14/10/2016 07:00:33 p.m. ******/
ALTER TABLE [Provincias] ADD  CONSTRAINT [id_provincia_pk] PRIMARY KEY NONCLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Cantones]  WITH CHECK ADD  CONSTRAINT [Canton_ref_Provincia] FOREIGN KEY([id_provincia])
REFERENCES [Provincias] ([id_provincia])
GO
ALTER TABLE [Cantones] CHECK CONSTRAINT [Canton_ref_Provincia]
GO
ALTER TABLE [Distritos]  WITH CHECK ADD  CONSTRAINT [Distrito_ref_Canton] FOREIGN KEY([id_canton])
REFERENCES [Cantones] ([id_canton])
GO
ALTER TABLE [Distritos] CHECK CONSTRAINT [Distrito_ref_Canton]
GO
ALTER TABLE [Cantones]  WITH NOCHECK ADD  CONSTRAINT [Canton_Estado_CkC] CHECK  (([vc_estado] IS NULL OR ([vc_estado]='I' OR [vc_estado]='A')))
GO
ALTER TABLE [Cantones] NOCHECK CONSTRAINT [Canton_Estado_CkC]
GO
ALTER TABLE [Cantones]  WITH NOCHECK ADD  CONSTRAINT [CKC_vc_estado_CANTON] CHECK  (([vc_estado] IS NULL OR ([vc_estado]='I' OR [vc_estado]='A')))
GO
ALTER TABLE [Cantones] NOCHECK CONSTRAINT [CKC_vc_estado_CANTON]
GO
ALTER TABLE [Distritos]  WITH CHECK ADD  CONSTRAINT [CKC_vc_estado_DISTRITO] CHECK  (([vc_estado] IS NULL OR ([vc_estado]='I' OR [vc_estado]='A')))
GO
ALTER TABLE [Distritos] CHECK CONSTRAINT [CKC_vc_estado_DISTRITO]
GO
ALTER TABLE [Provincias]  WITH CHECK ADD  CONSTRAINT [CKC_vc_estado_PROVINCI] CHECK  (([vc_estado] IS NULL OR ([vc_estado]='I' OR [vc_estado]='A')))
GO
ALTER TABLE [Provincias] CHECK CONSTRAINT [CKC_vc_estado_PROVINCI]
GO

SET IDENTITY_INSERT dbo.Provincias ON
GO

INSERT [Provincias] ([id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado]) VALUES (1, N'SAN JOSE', N'sa', CAST(N'2014-05-23 14:35:40.990' AS DateTime), N'sa', CAST(N'2014-05-23 14:35:40.990' AS DateTime), N'A')
GO
INSERT [Provincias] ([id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado]) VALUES (2, N'ALAJUELA', N'sa', CAST(N'2014-05-23 14:35:44.320' AS DateTime), N'sa', CAST(N'2014-05-23 14:35:44.320' AS DateTime), N'A')
GO
INSERT [Provincias] ([id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado]) VALUES (3, N'CARTAGO', N'sa', CAST(N'2014-05-23 14:35:46.380' AS DateTime), N'sa', CAST(N'2014-05-23 14:35:46.380' AS DateTime), N'A')
GO
INSERT [Provincias] ([id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado]) VALUES (4, N'HEREDIA', N'sa', CAST(N'2014-05-23 14:35:49.277' AS DateTime), N'sa', CAST(N'2014-05-23 14:35:49.277' AS DateTime), N'A')
GO
INSERT [Provincias] ([id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado]) VALUES (5, N'GUANACASTE', N'sa', CAST(N'2014-05-23 14:35:53.840' AS DateTime), N'sa', CAST(N'2014-05-23 14:35:53.840' AS DateTime), N'A')
GO
INSERT [Provincias] ([id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado]) VALUES (6, N'PUNTARENAS', N'sa', CAST(N'2014-05-23 14:35:56.367' AS DateTime), N'sa', CAST(N'2014-05-23 14:35:56.367' AS DateTime), N'A')
GO
INSERT [Provincias] ([id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado]) VALUES (7, N'LIMON', N'sa', CAST(N'2014-05-23 14:35:59.307' AS DateTime), N'sa', CAST(N'2014-05-23 14:35:59.307' AS DateTime), N'A')
GO
SET IDENTITY_INSERT dbo.Provincias OFF
GO

SET IDENTITY_INSERT dbo.Cantones ON
GO

INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (1, 1, N'SAN JOSE', N'sa', CAST(N'2014-06-17 11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.320' AS DateTime), N'A', 101)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (2, 1, N'ESCAZU', N'sa', CAST(N'2014-06-17 11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.320' AS DateTime), N'A', 102)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (3, 1, N'DESAMPARADOS', N'sa', CAST(N'2014-06-17 11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.320' AS DateTime), N'A', 103)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (4, 1, N'PURISCAL', N'sa', CAST(N'2014-06-17 11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.320' AS DateTime), N'A', 104)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (5, 1, N'TARRAZU', N'sa', CAST(N'2014-06-17 11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.320' AS DateTime), N'A', 105)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (6, 1, N'ASERRI', N'sa', CAST(N'2014-06-17 11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.323' AS DateTime), N'A', 106)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (7, 1, N'MORA', N'sa', CAST(N'2014-06-17 11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.323' AS DateTime), N'A', 107)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (8, 1, N'GOICOECHEA', N'sa', CAST(N'2014-06-17 11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.323' AS DateTime), N'A', 108)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (9, 1, N'SANTA ANA', N'sa', CAST(N'2014-06-17 11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.323' AS DateTime), N'A', 109)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (10, 1, N'ALAJUELITA', N'sa', CAST(N'2014-06-17 11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.323' AS DateTime), N'A', 110)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (11, 1, N'VAZQUEZ DE CORONADO', N'sa', CAST(N'2014-06-17 11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.323' AS DateTime), N'A', 111)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (12, 1, N'ACOSTA', N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'A', 112)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (13, 1, N'TIBAS', N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'A', 113)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (14, 1, N'MORAVIA', N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'A', 114)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (15, 1, N'MONTES DE OCA', N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'A', 115)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (16, 1, N'TURRUBARES', N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'A', 116)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (17, 1, N'DOTA', N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'A', 117)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (18, 1, N'CURRIDABAT', N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.327' AS DateTime), N'A', 118)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (19, 1, N'PEREZ ZELEDON', N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'A', 119)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (20, 1, N'LEON CORTES', N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'A', 120)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (21, 2, N'ALAJUELA', N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'A', 201)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (22, 2, N'SAN RAMON', N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'A', 202)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (23, 2, N'GRECIA', N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'A', 203)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (24, 2, N'SAN MATEO', N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'A', 204)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (25, 2, N'ATENAS', N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'A', 205)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (26, 2, N'NARANJO', N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.330' AS DateTime), N'A', 206)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (27, 2, N'PALMARES', N'sa', CAST(N'2014-06-17 11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.333' AS DateTime), N'A', 207)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (28, 2, N'POAS', N'sa', CAST(N'2014-06-17 11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.333' AS DateTime), N'A', 208)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (29, 2, N'OROTINA', N'sa', CAST(N'2014-06-17 11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.333' AS DateTime), N'A', 209)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (30, 2, N'SAN CARLOS', N'sa', CAST(N'2014-06-17 11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.333' AS DateTime), N'A', 210)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (31, 2, N'ALFARO RUIZ', N'sa', CAST(N'2014-06-17 11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.333' AS DateTime), N'A', 211)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (32, 2, N'VALVERDE VEGA', N'sa', CAST(N'2014-06-17 11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.333' AS DateTime), N'A', 212)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (33, 2, N'UPALA', N'sa', CAST(N'2014-06-17 11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.337' AS DateTime), N'A', 213)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (34, 2, N'LOS CHILES', N'sa', CAST(N'2014-06-17 11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.337' AS DateTime), N'A', 214)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (35, 2, N'GUATUSO', N'sa', CAST(N'2014-06-17 11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.337' AS DateTime), N'A', 215)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (36, 3, N'CARTAGO', N'sa', CAST(N'2014-06-17 11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.337' AS DateTime), N'A', 301)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (37, 3, N'PARAISO', N'sa', CAST(N'2014-06-17 11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.337' AS DateTime), N'A', 302)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (38, 3, N'LA UNION', N'sa', CAST(N'2014-06-17 11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.337' AS DateTime), N'A', 303)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (39, 3, N'JIMENEZ', N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'A', 304)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (40, 3, N'TURRIALBA', N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'A', 305)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (41, 3, N'ALVARADO', N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'A', 306)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (42, 3, N'OREAMUNO', N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'A', 307)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (43, 3, N'EL GUARCO', N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'A', 308)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (44, 4, N'HEREDIA', N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'A', 401)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (45, 4, N'BARVA', N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'A', 402)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (46, 4, N'SANTO DOMINGO', N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.340' AS DateTime), N'A', 403)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (47, 4, N'SANTA BARBARA', N'sa', CAST(N'2014-06-17 11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.343' AS DateTime), N'A', 404)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (48, 4, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.343' AS DateTime), N'A', 405)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (49, 4, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17 11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.343' AS DateTime), N'A', 406)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (50, 4, N'BELEN', N'sa', CAST(N'2014-06-17 11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.343' AS DateTime), N'A', 407)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (51, 4, N'FLORES', N'sa', CAST(N'2014-06-17 11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.343' AS DateTime), N'A', 408)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (52, 4, N'SAN PABLO', N'sa', CAST(N'2014-06-17 11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.343' AS DateTime), N'A', 409)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (53, 4, N'SARAPIQUI', N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'A', 410)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (54, 5, N'LIBERIA', N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'A', 501)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (55, 5, N'NICOYA', N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'A', 502)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (56, 5, N'SANTA CRUZ', N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'A', 503)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (57, 5, N'BAGACES', N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'A', 504)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (58, 5, N'CARRILLO', N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'A', 505)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (59, 5, N'CAÑAS', N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.347' AS DateTime), N'A', 506)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (60, 5, N'ABANGARES', N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'A', 507)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (61, 5, N'TILARAN', N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'A', 508)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (62, 5, N'NANDAYURE', N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'A', 509)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (63, 5, N'LA CRUZ', N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'A', 510)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (64, 5, N'HOJANCHA', N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'A', 511)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (65, 6, N'PUNTARENAS', N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'A', 601)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (66, 6, N'ESPARZA', N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.350' AS DateTime), N'A', 602)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (67, 6, N'BUENOS AIRES', N'sa', CAST(N'2014-06-17 11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.353' AS DateTime), N'A', 603)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (68, 6, N'MONTES DE ORO', N'sa', CAST(N'2014-06-17 11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.353' AS DateTime), N'A', 604)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (69, 6, N'OSA', N'sa', CAST(N'2014-06-17 11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.353' AS DateTime), N'A', 605)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (70, 6, N'AGUIRRE', N'sa', CAST(N'2014-06-17 11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.353' AS DateTime), N'A', 606)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (71, 6, N'GOLFITO', N'sa', CAST(N'2014-06-17 11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.353' AS DateTime), N'A', 607)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (72, 6, N'COTO BRUS', N'sa', CAST(N'2014-06-17 11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.357' AS DateTime), N'A', 608)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (73, 6, N'PARRITA', N'sa', CAST(N'2014-06-17 11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.357' AS DateTime), N'A', 609)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (74, 6, N'CORREDORES', N'sa', CAST(N'2014-06-17 11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.357' AS DateTime), N'A', 610)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (75, 6, N'GARABITO', N'sa', CAST(N'2014-06-17 11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.357' AS DateTime), N'A', 611)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (76, 7, N'LIMON', N'sa', CAST(N'2014-06-17 11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.357' AS DateTime), N'A', 701)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (77, 7, N'POCOCI', N'sa', CAST(N'2014-06-17 11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.357' AS DateTime), N'A', 702)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (78, 7, N'SIQUIRRES', N'sa', CAST(N'2014-06-17 11:38:27.360' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.360' AS DateTime), N'A', 703)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (79, 7, N'TALAMANCA', N'sa', CAST(N'2014-06-17 11:38:27.360' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.360' AS DateTime), N'A', 704)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (80, 7, N'MATINA', N'sa', CAST(N'2014-06-17 11:38:27.360' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.360' AS DateTime), N'A', 705)
GO
INSERT [Cantones] ([id_canton], [id_provincia], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_canton_inec]) VALUES (81, 7, N'GUACIMO', N'sa', CAST(N'2014-06-17 11:38:27.360' AS DateTime), N'sa', CAST(N'2014-06-17 11:38:27.360' AS DateTime), N'A', 706)
GO
SET IDENTITY_INSERT dbo.Cantones OFF
GO
SET IDENTITY_INSERT dbo.Distritos ON
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (1, 1, N'EL CARMEN', N'sa', CAST(N'2014-06-17 11:39:58.377' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.377' AS DateTime), N'A', 10101)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (2, 1, N'MERCED', N'sa', CAST(N'2014-06-17 11:39:58.377' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.377' AS DateTime), N'A', 10102)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (3, 1, N'HOSPITAL', N'sa', CAST(N'2014-06-17 11:39:58.377' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.377' AS DateTime), N'A', 10103)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (4, 1, N'CATEDRAL', N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'A', 10104)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (5, 1, N'ZAPOTE', N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'A', 10105)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (6, 1, N'SAN FRANCISCO DE DOS RIOS', N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'A', 10106)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (7, 1, N'URUCA', N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'A', 10107)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (8, 1, N'MATA REDONDA', N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'A', 10108)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (9, 1, N'PAVAS', N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'A', 10109)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (10, 1, N'HATILLO', N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'A', 10110)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (11, 2, N'ESCAZU', N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'A', 10201)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (12, 2, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'A', 10202)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (13, 2, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.380' AS DateTime), N'A', 10203)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (14, 3, N'DESAMPARADOS', N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'A', 10301)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (15, 3, N'SAN MIGUEL', N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'A', 10302)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (16, 3, N'SAN JUAN DE DIOS', N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'A', 10303)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (17, 3, N'SAN RAFAEL ARRIBA', N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'A', 10304)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (18, 3, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'A', 10305)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (19, 3, N'FRAILES', N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'A', 10306)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (20, 3, N'PATARRA', N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'A', 10307)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (21, 3, N'SAN CRISTOBAL', N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.383' AS DateTime), N'A', 10308)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (22, 3, N'ROSARIO', N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'A', 10309)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (23, 3, N'DAMAS', N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'A', 10310)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (24, 3, N'SAN RAFAEL ABAJO', N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'A', 10311)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (25, 3, N'GRAVILIAS', N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'A', 10312)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (26, 3, N'LOS GUIDO', N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'A', 10313)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (27, 4, N'SANTIAGO', N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'A', 10401)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (28, 4, N'MERCEDES SUR', N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.387' AS DateTime), N'A', 10402)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (29, 4, N'BARBACOAS', N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'A', 10403)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (30, 4, N'GRIFO ALTO', N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'A', 10404)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (31, 4, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'A', 10405)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (32, 4, N'CANDELARITA', N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'A', 10406)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (33, 4, N'DESAMPARADITOS', N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'A', 10407)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (34, 4, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'A', 10408)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (35, 4, N'CHIRES', N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.390' AS DateTime), N'A', 10409)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (36, 5, N'SAN MARCOS', N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'A', 10501)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (37, 5, N'SAN LORENZO', N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'A', 10502)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (38, 5, N'SAN CARLOS', N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'A', 10503)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (39, 6, N'ASERRI', N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'A', 10601)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (40, 6, N'TARBACA', N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'A', 10602)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (41, 6, N'VUELTA DE JORCO', N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'A', 10603)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (42, 6, N'SAN GABRIEL', N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.393' AS DateTime), N'A', 10604)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (43, 6, N'LEGUA', N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'A', 10605)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (44, 6, N'MONTERREY', N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'A', 10606)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (45, 6, N'SALITRILLOS', N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'A', 10607)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (46, 7, N'COLON', N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'A', 10701)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (47, 7, N'GUAYABO', N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'A', 10702)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (48, 7, N'TABARCIA', N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'A', 10703)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (49, 7, N'PIEDRAS NEGRAS', N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.397' AS DateTime), N'A', 10704)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (50, 7, N'PICAGRES', N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'A', 10705)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (51, 8, N'GUADALUPE', N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'A', 10801)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (52, 8, N'SAN FRANCISCO', N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'A', 10802)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (53, 8, N'CALLE BLANCOS', N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'A', 10803)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (54, 8, N'MATA DE PLATANO', N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'A', 10804)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (55, 8, N'IPIS', N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'A', 10805)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (56, 8, N'RANCHO REDONDO', N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'A', 10806)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (57, 8, N'PURRAL', N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'A', 10807)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (58, 9, N'SANTA ANA', N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.400' AS DateTime), N'A', 10901)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (59, 9, N'SALITRAL', N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'A', 10902)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (60, 9, N'POZOS', N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'A', 10903)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (61, 9, N'URUCA', N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'A', 10904)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (62, 9, N'PIEDADES', N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'A', 10905)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (63, 9, N'BRASIL', N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'A', 10906)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (64, 10, N'ALAJUELITA', N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'A', 11001)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (65, 10, N'SAN JOSECITO', N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'A', 11002)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (66, 10, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.403' AS DateTime), N'A', 11003)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (67, 10, N'CONCEPCION', N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'A', 11004)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (68, 10, N'SAN FELIPE', N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'A', 11005)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (69, 11, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'A', 11101)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (70, 11, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'A', 11102)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (71, 11, N'DULCE NOMBRE DE JESUS', N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'A', 11103)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (72, 11, N'PATALILLO', N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'A', 11104)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (73, 11, N'CASCAJAL', N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.407' AS DateTime), N'A', 11105)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (74, 12, N'SAN IGNACIO', N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'A', 11201)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (75, 12, N'GUAITIL', N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'A', 11202)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (76, 12, N'PALMICHAL', N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'A', 11203)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (77, 12, N'CANGREJAL', N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'A', 11204)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (78, 12, N'SABANILLAS', N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'A', 11205)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (79, 13, N'SAN JUAN', N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'A', 11301)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (80, 13, N'CINCO ESQUINAS', N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'A', 11302)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (81, 13, N'ANSELMO LLORENTE', N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'A', 11303)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (82, 13, N'LEON XIII', N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.410' AS DateTime), N'A', 11304)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (83, 13, N'COLIMA', N'sa', CAST(N'2014-06-17 11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.413' AS DateTime), N'A', 11305)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (84, 14, N'SAN VICENTE', N'sa', CAST(N'2014-06-17 11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.413' AS DateTime), N'A', 11401)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (85, 14, N'SAN JERONIMO', N'sa', CAST(N'2014-06-17 11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.413' AS DateTime), N'A', 11402)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (86, 14, N'LA TRINIDAD', N'sa', CAST(N'2014-06-17 11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.413' AS DateTime), N'A', 11403)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (87, 15, N'SAN PEDRO', N'sa', CAST(N'2014-06-17 11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.413' AS DateTime), N'A', 11501)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (88, 15, N'SABANILLA', N'sa', CAST(N'2014-06-17 11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.413' AS DateTime), N'A', 11502)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (89, 15, N'MERCEDES', N'sa', CAST(N'2014-06-17 11:39:58.417' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.417' AS DateTime), N'A', 11503)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (90, 15, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'A', 11504)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (91, 16, N'SAN PABLO', N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'A', 11601)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (92, 16, N'SAN PEDRO', N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'A', 11602)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (93, 16, N'SAN JUAN DE MATA', N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'A', 11603)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (94, 16, N'SAN LUIS', N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'A', 11604)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (95, 16, N'CARARA', N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'A', 11605)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (96, 17, N'SANTA MARIA', N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'A', 11701)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (97, 17, N'JARDIN', N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.420' AS DateTime), N'A', 11702)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (98, 17, N'COPEY', N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'A', 11703)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (99, 18, N'CURRIDABAT', N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'A', 11801)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (100, 18, N'GRANADILLA', N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'A', 11802)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (101, 18, N'SANCHEZ', N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'A', 11803)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (102, 18, N'TIRRASES', N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'A', 11804)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (103, 19, N'SAN ISIDRO DEL GENERAL', N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'A', 11901)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (104, 19, N'EL GENERAL', N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.423' AS DateTime), N'A', 11902)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (105, 19, N'DANIEL FLORES', N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'A', 11903)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (106, 19, N'RIVAS', N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'A', 11904)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (107, 19, N'SAN PEDRO', N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'A', 11905)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (108, 19, N'PLATANARES', N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'A', 11906)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (109, 19, N'PEJIBAYE', N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'A', 11907)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (110, 19, N'CAJON', N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'A', 11908)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (111, 19, N'BARU', N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.427' AS DateTime), N'A', 11909)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (112, 19, N'RIO NUEVO', N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'A', 11910)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (113, 19, N'PARAMO', N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'A', 11911)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (114, 20, N'SAN PABLO', N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'A', 12001)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (115, 20, N'SAN ANDRES', N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'A', 12002)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (116, 20, N'LLANO BONITO', N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'A', 12003)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (117, 20, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'A', 12004)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (118, 20, N'SANTA CRUZ', N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'A', 12005)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (119, 20, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'A', 12006)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (120, 21, N'ALAJUELA', N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'A', 20101)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (121, 21, N'SAN JOSE', N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.430' AS DateTime), N'A', 20102)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (122, 21, N'CARRIZAL', N'sa', CAST(N'2014-06-17 11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.433' AS DateTime), N'A', 20103)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (123, 21, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17 11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.433' AS DateTime), N'A', 20104)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (124, 21, N'GUACIMA', N'sa', CAST(N'2014-06-17 11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.433' AS DateTime), N'A', 20105)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (125, 21, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17 11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.433' AS DateTime), N'A', 20106)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (126, 21, N'SABANILLA', N'sa', CAST(N'2014-06-17 11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.433' AS DateTime), N'A', 20107)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (127, 21, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.433' AS DateTime), N'A', 20108)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (128, 21, N'RIO SEGUNDO', N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'A', 20109)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (129, 21, N'DESAMPARADOS', N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'A', 20110)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (130, 21, N'TURRUCARES', N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'A', 20111)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (131, 21, N'TAMBOR', N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'A', 20112)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (132, 21, N'GARITA', N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'A', 20113)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (133, 21, N'SARAPIQUI', N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'A', 20114)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (134, 22, N'SAN RAMON', N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'A', 20201)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (135, 22, N'SANTIAGO', N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.437' AS DateTime), N'A', 20202)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (136, 22, N'SAN JUAN', N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'A', 20203)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (137, 22, N'PIEDADES NORTE', N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'A', 20204)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (138, 22, N'PIEDADES SUR', N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'A', 20205)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (139, 22, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'A', 20206)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (140, 22, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'A', 20207)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (141, 22, N'ANGELES', N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'A', 20208)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (142, 22, N'ALFARO', N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'A', 20209)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (143, 22, N'VOLIO', N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'A', 20210)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (144, 22, N'CONCEPCION', N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'A', 20211)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (145, 22, N'ZAPOTAL', N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.440' AS DateTime), N'A', 20212)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (146, 22, N'PEÑAS BLANCAS', N'sa', CAST(N'2014-06-17 11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.443' AS DateTime), N'A', 20213)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (147, 23, N'GRECIA', N'sa', CAST(N'2014-06-17 11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.443' AS DateTime), N'A', 20301)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (148, 23, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17 11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.443' AS DateTime), N'A', 20302)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (149, 23, N'SAN JOSE', N'sa', CAST(N'2014-06-17 11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.443' AS DateTime), N'A', 20303)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (150, 23, N'SAN ROQUE', N'sa', CAST(N'2014-06-17 11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.443' AS DateTime), N'A', 20304)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (151, 23, N'TACARES', N'sa', CAST(N'2014-06-17 11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.443' AS DateTime), N'A', 20305)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (152, 23, N'RIO CUARTO', N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'A', 20306)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (153, 23, N'PUENTE DE PIEDRA', N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'A', 20307)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (154, 23, N'BOLIVAR', N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'A', 20308)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (155, 24, N'SAN MATEO', N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'A', 20401)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (156, 24, N'DESMONTE', N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'A', 20402)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (157, 24, N'JESUS MARIA', N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'A', 20403)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (158, 25, N'ATENAS', N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.447' AS DateTime), N'A', 20501)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (159, 25, N'JESUS', N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'A', 20502)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (160, 25, N'MERCEDES', N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'A', 20503)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (161, 25, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'A', 20504)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (162, 25, N'CONCEPCION', N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'A', 20505)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (163, 25, N'SAN JOSE', N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'A', 20506)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (164, 25, N'SANTA EULALIA', N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'A', 20507)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (165, 25, N'ESCOBAL', N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'A', 20508)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (166, 26, N'NARANJO', N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'A', 20601)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (167, 26, N'SAN MIGUEL', N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'A', 20602)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (168, 26, N'SAN JOSE', N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.450' AS DateTime), N'A', 20603)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (169, 26, N'CIRRI SUR', N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'A', 20604)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (170, 26, N'SAN JERONIMO', N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'A', 20605)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (171, 26, N'SAN JUAN', N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'A', 20606)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (172, 26, N'EL ROSARIO', N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'A', 20607)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (173, 26, N'PALMITOS', N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'A', 20608)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (174, 27, N'PALMARES', N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'A', 20701)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (175, 27, N'ZARAGOZA', N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.453' AS DateTime), N'A', 20702)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (176, 27, N'BUENOS AIRES', N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'A', 20703)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (177, 27, N'SANTIAGO', N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'A', 20704)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (178, 27, N'CANDELARIA', N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'A', 20705)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (179, 27, N'ESQUIPULAS', N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'A', 20706)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (180, 27, N'LA GRANJA', N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'A', 20707)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (181, 28, N'SAN PEDRO', N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'A', 20801)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (182, 28, N'SAN JUAN', N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.457' AS DateTime), N'A', 20802)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (183, 28, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'A', 20803)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (184, 28, N'CARRILLOS', N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'A', 20804)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (185, 28, N'SABANA REDONDA', N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'A', 20805)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (186, 29, N'OROTINA', N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'A', 20901)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (187, 29, N'EL MASTATE', N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'A', 20902)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (188, 29, N'HACIENDA VIEJA', N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'A', 20903)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (189, 29, N'COYOLAR', N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'A', 20904)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (190, 29, N'LA CEIBA', N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'A', 20905)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (191, 30, N'QUESADA', N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.460' AS DateTime), N'A', 21001)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (192, 30, N'FLORENCIA', N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'A', 21002)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (193, 30, N'BUENAVISTA', N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'A', 21003)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (194, 30, N'AGUAS ZARCAS', N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'A', 21004)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (195, 30, N'VENECIA', N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'A', 21005)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (196, 30, N'PITAL', N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'A', 21006)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (197, 30, N'LA FORTUNA', N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'A', 21007)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (198, 30, N'LA TIGRA', N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.463' AS DateTime), N'A', 21008)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (199, 30, N'LA PALMERA', N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'A', 21009)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (200, 30, N'VENADO', N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'A', 21010)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (201, 30, N'CUTRIS', N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'A', 21011)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (202, 30, N'MONTERREY', N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'A', 21012)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (203, 30, N'POCOSOL', N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'A', 21013)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (204, 31, N'ZARCERO', N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'A', 21101)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (205, 31, N'LAGUNA', N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'A', 21102)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (206, 31, N'TAPEZCO', N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.467' AS DateTime), N'A', 21103)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (207, 31, N'GUADALUPE', N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'A', 21104)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (208, 31, N'PALMIRA', N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'A', 21105)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (209, 31, N'ZAPOTE', N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'A', 21106)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (210, 31, N'BRISAS', N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'A', 21107)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (211, 32, N'SARCHI NORTE', N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'A', 21201)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (212, 32, N'SARCHI SUR', N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'A', 21202)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (213, 32, N'TORO AMARILLO', N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'A', 21203)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (214, 32, N'SAN PEDRO', N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'A', 21204)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (215, 32, N'RODRIGUEZ', N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'A', 21205)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (216, 33, N'UPALA', N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.470' AS DateTime), N'A', 21301)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (217, 33, N'AGUAS CLARAS', N'sa', CAST(N'2014-06-17 11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.473' AS DateTime), N'A', 21302)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (218, 33, N'SAN JOSE O PIZOTE', N'sa', CAST(N'2014-06-17 11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.473' AS DateTime), N'A', 21303)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (219, 33, N'BIJAGUA', N'sa', CAST(N'2014-06-17 11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.473' AS DateTime), N'A', 21304)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (220, 33, N'DELICIAS', N'sa', CAST(N'2014-06-17 11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.473' AS DateTime), N'A', 21305)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (221, 33, N'DOS RIOS', N'sa', CAST(N'2014-06-17 11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.473' AS DateTime), N'A', 21306)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (222, 33, N'YOLILLAL', N'sa', CAST(N'2014-06-17 11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.473' AS DateTime), N'A', 21307)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (223, 34, N'LOS CHILES', N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'A', 21401)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (224, 34, N'CAÑO NEGRO', N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'A', 21402)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (225, 34, N'EL AMPARO', N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'A', 21403)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (226, 34, N'SAN JORGE', N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'A', 21404)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (227, 35, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'A', 21501)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (228, 35, N'BUENAVISTA', N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'A', 21502)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (229, 35, N'COTE', N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.477' AS DateTime), N'A', 21503)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (230, 35, N'KATIRA', N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'A', 21504)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (231, 36, N'ORIENTAL', N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'A', 30101)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (232, 36, N'OCCIDENTAL', N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'A', 30102)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (233, 36, N'CARMEN', N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'A', 30103)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (234, 36, N'SAN NICOLAS', N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'A', 30104)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (235, 36, N'AGUACALIENTE O SAN FRANCISCO', N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'A', 30105)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (236, 36, N'GUADALUPE O ARENILLA', N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'A', 30106)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (237, 36, N'CORRALILLO', N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'A', 30107)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (238, 36, N'TIERRA BLANCA', N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'A', 30108)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (239, 36, N'DULCE NOMBRE', N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.480' AS DateTime), N'A', 30109)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (240, 36, N'LLANO GRANDE', N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'A', 30110)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (241, 36, N'QUEBRADILLAS', N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'A', 30111)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (242, 37, N'PARAISO', N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'A', 30201)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (243, 37, N'SANTIAGO', N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'A', 30202)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (244, 37, N'OROSI', N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'A', 30203)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (245, 37, N'CACHI', N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'A', 30204)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (246, 37, N'LLANOS DE SANTA LUCIA', N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'A', 30205)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (247, 38, N'TRES RIOS', N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.483' AS DateTime), N'A', 30301)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (248, 38, N'SAN DIEGO', N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'A', 30302)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (249, 38, N'SAN JUAN', N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'A', 30303)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (250, 38, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'A', 30304)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (251, 38, N'CONCEPCION', N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'A', 30305)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (252, 38, N'DULCE NOMBRE', N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'A', 30306)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (253, 38, N'SAN RAMON', N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'A', 30307)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (254, 38, N'RIO AZUL', N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.487' AS DateTime), N'A', 30308)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (255, 39, N'JUAN VIÑAS', N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'A', 30401)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (256, 39, N'TUCURRIQUE', N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'A', 30402)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (257, 39, N'PEJIBAYE', N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'A', 30403)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (258, 40, N'TURRIALBA', N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'A', 30501)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (259, 40, N'LA SUIZA', N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'A', 30502)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (260, 40, N'PERALTA', N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'A', 30503)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (261, 40, N'SANTA CRUZ', N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'A', 30504)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (262, 40, N'SANTA TERESITA', N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'A', 30505)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (263, 40, N'PAVONES', N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.490' AS DateTime), N'A', 30506)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (264, 40, N'TUIS', N'sa', CAST(N'2014-06-17 11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.493' AS DateTime), N'A', 30507)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (265, 40, N'TAYUTIC', N'sa', CAST(N'2014-06-17 11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.493' AS DateTime), N'A', 30508)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (266, 40, N'SANTA ROSA', N'sa', CAST(N'2014-06-17 11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.493' AS DateTime), N'A', 30509)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (267, 40, N'TRES EQUIS', N'sa', CAST(N'2014-06-17 11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.493' AS DateTime), N'A', 30510)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (268, 40, N'LA ISABEL', N'sa', CAST(N'2014-06-17 11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.493' AS DateTime), N'A', 30511)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (269, 40, N'CHIRRIPO', N'sa', CAST(N'2014-06-17 11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.493' AS DateTime), N'A', 30512)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (270, 41, N'PACAYAS', N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'A', 30601)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (271, 41, N'CERVANTES', N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'A', 30602)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (272, 41, N'CAPELLADES', N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'A', 30603)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (273, 42, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'A', 30701)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (274, 42, N'COT', N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'A', 30702)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (275, 42, N'POTRERO CERRADO', N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'A', 30703)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (276, 42, N'CIPRESES', N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.497' AS DateTime), N'A', 30704)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (277, 42, N'SANTA ROSA', N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'A', 30705)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (278, 43, N'EL TEJAR', N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'A', 30801)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (279, 43, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'A', 30802)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (280, 43, N'TOBOSI', N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'A', 30803)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (281, 43, N'PATIO DE AGUA', N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'A', 30804)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (282, 44, N'HEREDIA', N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'A', 40101)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (283, 44, N'MERCEDES', N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'A', 40102)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (284, 44, N'SAN FRANCISCO', N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'A', 40103)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (285, 44, N'ULLOA', N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'A', 40104)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (286, 44, N'VARABLANCA', N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.500' AS DateTime), N'A', 40105)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (287, 45, N'BARVA', N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'A', 40201)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (288, 45, N'SAN PEDRO', N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'A', 40202)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (289, 45, N'SAN PABLO', N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'A', 40203)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (290, 45, N'SAN ROQUE', N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'A', 40204)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (291, 45, N'SANTA LUCIA', N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'A', 40205)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (292, 45, N'SAN JOSE DE LA MONTAÑA', N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'A', 40206)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (293, 46, N'SANTO DOMINGO', N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.503' AS DateTime), N'A', 40301)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (294, 46, N'SAN VICENTE', N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'A', 40302)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (295, 46, N'SAN MIGUEL', N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'A', 40303)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (296, 46, N'PARACITO', N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'A', 40304)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (297, 46, N'SANTO TOMAS', N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'A', 40305)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (298, 46, N'SANTA ROSA', N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'A', 40306)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (299, 46, N'TURES', N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'A', 40307)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (300, 46, N'PARA', N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.507' AS DateTime), N'A', 40308)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (301, 47, N'SANTA BARBARA', N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'A', 40401)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (302, 47, N'SAN PEDRO', N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'A', 40402)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (303, 47, N'SAN JUAN', N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'A', 40403)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (304, 47, N'JESUS', N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'A', 40404)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (305, 47, N'SANTO DOMINGO', N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'A', 40405)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (306, 47, N'PURABA', N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'A', 40406)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (307, 48, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'A', 40501)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (308, 48, N'SAN JOSECITO', N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'A', 40502)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (309, 48, N'SANTIAGO', N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'A', 40503)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (310, 48, N'ANGELES', N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.510' AS DateTime), N'A', 40504)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (311, 48, N'CONCEPCION', N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'A', 405005)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (312, 49, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'A', 406010)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (313, 49, N'SAN JOSE', N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'A', 40602)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (314, 49, N'CONCEPCION', N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'A', 40603)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (315, 49, N'SAN FRANCISCO', N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'A', 40604)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (316, 50, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'A', 40701)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (317, 50, N'LA RIBERA', N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.513' AS DateTime), N'A', 40702)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (318, 50, N'LA ASUNCION', N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'A', 40703)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (319, 51, N'SAN JOAQUIN', N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'A', 40801)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (320, 51, N'BARRANTES', N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'A', 40802)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (321, 51, N'LLORENTE', N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'A', 40803)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (322, 52, N'SAN PABLO', N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'A', 40901)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (323, 52, N'RINCON DE SABANILLA', N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'A', 40902)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (324, 53, N'PUERTO VIEJO', N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.517' AS DateTime), N'A', 41001)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (325, 53, N'LA VIRGEN', N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'A', 41002)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (326, 53, N'LAS HORQUETAS', N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'A', 41003)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (327, 53, N'LLANURAS DEL GASPAR', N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'A', 41004)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (328, 53, N'CUREÑA', N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'A', 41005)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (329, 54, N'LIBERIA', N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'A', 50101)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (330, 54, N'CAÑAS DULCES', N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'A', 50102)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (331, 54, N'MAYORGA', N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'A', 50103)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (332, 54, N'NACASCOLO', N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'A', 50104)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (333, 54, N'CURUBANDE', N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.520' AS DateTime), N'A', 50105)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (334, 55, N'NICOYA', N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'A', 50201)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (335, 55, N'MANSION', N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'A', 50202)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (336, 55, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'A', 50203)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (337, 55, N'QUEBRADA HONDA', N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'A', 50204)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (338, 55, N'SAMARA', N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'A', 50205)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (339, 55, N'NOSARA', N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'A', 50206)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (340, 55, N'BELEN DE NOSARITA', N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'A', 50207)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (341, 56, N'SANTA CRUZ', N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.523' AS DateTime), N'A', 50301)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (342, 56, N'BOLSON', N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'A', 50302)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (343, 56, N'VEINTISIETE DE ABRIL', N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'A', 50303)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (344, 56, N'TEMPATE', N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'A', 50304)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (345, 56, N'CARTAGENA', N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'A', 50305)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (346, 56, N'CUAJINIQUIL', N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'A', 50306)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (347, 56, N'DIRIA', N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'A', 50307)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (348, 56, N'CABO VELAS', N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.527' AS DateTime), N'A', 50308)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (349, 56, N'TAMARINDO', N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'A', 50309)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (350, 57, N'BAGACES', N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'A', 50401)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (351, 57, N'LA FORTUNA', N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'A', 50402)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (352, 57, N'MOGOTE', N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'A', 50403)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (353, 57, N'RIO NARANJO', N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'A', 50404)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (354, 58, N'FILADELFIA', N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'A', 50501)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (355, 58, N'PALMIRA', N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'A', 50502)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (356, 58, N'SARDINAL', N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'A', 50503)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (357, 58, N'BELEN', N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'A', 50504)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (358, 59, N'CAÑAS', N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.530' AS DateTime), N'A', 50601)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (359, 59, N'PALMIRA', N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'A', 50602)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (360, 59, N'SAN MIGUEL', N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'A', 50603)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (361, 59, N'BEBEDERO', N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'A', 50604)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (362, 59, N'POROZAL', N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'A', 50605)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (363, 60, N'LAS JUNTAS', N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'A', 50701)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (364, 60, N'SIERRA', N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'A', 50702)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (365, 60, N'SAN JUAN', N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.533' AS DateTime), N'A', 50703)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (366, 60, N'COLORADO', N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'A', 50704)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (367, 61, N'TILARAN', N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'A', 50801)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (368, 61, N'QUEBRADA GRANDE', N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'A', 50802)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (369, 61, N'TRONADORA', N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'A', 50803)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (370, 61, N'SANTA ROSA', N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'A', 50804)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (371, 61, N'LIBANO', N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'A', 50805)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (372, 61, N'TIERRAS MORENAS', N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.537' AS DateTime), N'A', 50806)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (373, 61, N'ARENAL', N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'A', 50807)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (374, 62, N'CARMONA', N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'A', 50901)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (375, 62, N'SANTA RITA', N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'A', 50902)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (376, 62, N'ZAPOTAL', N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'A', 50903)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (377, 62, N'SAN PABLO', N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'A', 50904)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (378, 62, N'PORVENIR', N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'A', 50905)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (379, 62, N'BEJUCO', N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'A', 50906)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (380, 63, N'LA CRUZ', N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'A', 51001)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (381, 63, N'SANTA CECILIA', N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.540' AS DateTime), N'A', 51002)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (382, 63, N'LA GARITA', N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'A', 51003)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (383, 63, N'SANTA ELENA', N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'A', 51004)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (384, 64, N'HOJANCHA', N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'A', 51101)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (385, 64, N'MONTE ROMO', N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'A', 51102)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (386, 64, N'PUERTO CARRILLO', N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'A', 51103)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (387, 64, N'HUACAS', N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'A', 51104)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (388, 65, N'PUNTARENAS', N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.543' AS DateTime), N'A', 60101)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (389, 65, N'PITAHAYA', N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'A', 60102)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (390, 65, N'CHOMES', N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'A', 60103)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (391, 65, N'LEPANTO', N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'A', 60104)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (392, 65, N'PAQUERA', N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'A', 60105)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (393, 65, N'MANZANILLO', N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'A', 60106)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (394, 65, N'GUACIMAL', N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'A', 60107)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (395, 65, N'BARRANCA', N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.547' AS DateTime), N'A', 60108)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (396, 65, N'MONTE VERDE', N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'A', 60109)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (397, 65, N'ISLA DEL COCO', N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'A', 60110)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (398, 65, N'COBANO', N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'A', 60111)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (399, 65, N'CHACARITA', N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'A', 60112)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (400, 65, N'CHIRA', N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'A', 60113)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (401, 65, N'ACAPULCO', N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'A', 60114)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (402, 65, N'EL ROBLE', N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'A', 60115)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (403, 65, N'ARANCIBIA', N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'A', 60116)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (404, 66, N'ESPIRITU SANTO', N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'A', 60201)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (476, 33, N'CANALETE', N'SA', CAST(N'2015-11-02 11:10:33.637' AS DateTime), N'SA', CAST(N'2015-11-02 11:10:33.637' AS DateTime), N'A', 21308)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (477, 66, N'CALDERA', N'SA', CAST(N'2015-11-02 11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02 11:10:33.640' AS DateTime), N'A', 60206)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (478, 69, N'BAHIA DRAKE', N'SA', CAST(N'2015-11-02 11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02 11:10:33.640' AS DateTime), N'A', 60606)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (479, 72, N'GUTIERREZ BROWN', N'SA', CAST(N'2015-11-02 11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02 11:10:33.640' AS DateTime), N'A', 60806)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (480, 77, N'LA COLONIA', N'SA', CAST(N'2015-11-02 11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02 11:10:33.640' AS DateTime), N'A', 70207)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (481, 7, N'QUITIRRISÍ', N'SA', CAST(N'2015-11-02 11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02 11:10:33.640' AS DateTime), N'A', 10707)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (405, 66, N'SAN JUAN GRANDE', N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.550' AS DateTime), N'A', 60202)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (406, 66, N'MACACONA', N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'A', 60203)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (407, 66, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'A', 60204)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (408, 66, N'SAN JERONIMO', N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'A', 60205)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (409, 67, N'BUENOS AIRES', N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'A', 60301)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (410, 67, N'VOLCAN', N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'A', 60302)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (411, 67, N'POTRERO GRANDE', N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'A', 60303)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (412, 67, N'BORUCA', N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.553' AS DateTime), N'A', 60304)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (413, 67, N'PILAS', N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'A', 60305)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (414, 67, N'COLINAS', N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'A', 60306)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (415, 67, N'CHANGUENA', N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'A', 60307)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (416, 67, N'BIOLLEY', N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'A', 60308)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (417, 67, N'BRUNKA', N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'A', 60309)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (418, 68, N'MIRAMAR', N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'A', 60401)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (419, 68, N'LA UNION', N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.557' AS DateTime), N'A', 60402)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (420, 68, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'A', 60403)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (421, 69, N'PUERTO CORTES', N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'A', 60501)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (422, 69, N'PALMAR', N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'A', 60502)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (423, 69, N'SIERPE', N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'A', 60503)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (424, 69, N'BAHIA BALLENA', N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'A', 60504)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (425, 69, N'PIEDRAS BLANCAS', N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'A', 60505)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (426, 70, N'QUEPOS', N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'A', 60601)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (427, 70, N'SAVEGRE', N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'A', 60602)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (428, 70, N'NARANJITO', N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'A', 60603)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (429, 71, N'GOLFITO', N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.560' AS DateTime), N'A', 60701)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (430, 71, N'PUERTO JIMENEZ', N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'A', 60702)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (431, 71, N'GUAYCARA', N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'A', 60703)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (432, 71, N'PAVON', N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'A', 60704)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (433, 72, N'SAN VITO', N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'A', 60801)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (434, 72, N'SABALITO', N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'A', 60802)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (435, 72, N'AGUABUENA', N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'A', 60803)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (436, 72, N'LIMONCITO', N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'A', 60804)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (437, 72, N'PITTIER', N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.563' AS DateTime), N'A', 60805)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (438, 73, N'PARRITA', N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'A', 60901)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (439, 74, N'CORREDOR', N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'A', 61010)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (440, 74, N'LA CUESTA', N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'A', 61002)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (441, 74, N'CANOAS', N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'A', 61003)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (442, 74, N'LAUREL', N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'A', 61004)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (443, 75, N'JACÓ', N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'A', 61101)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (444, 75, N'TARCOLES', N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.567' AS DateTime), N'A', 61102)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (445, 76, N'LIMON', N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'A', 70101)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (446, 76, N'VALLE DE LA ESTRELLA', N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'A', 70102)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (447, 76, N'RIO BLANCO', N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'A', 70103)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (448, 76, N'MATAMA', N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'A', 70104)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (449, 77, N'GUAPILES', N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'A', 70201)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (450, 77, N'JIMENEZ', N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'A', 70202)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (451, 77, N'RITA', N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'A', 70203)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (452, 77, N'ROXANA', N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'A', 70204)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (453, 77, N'CARIARI', N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.570' AS DateTime), N'A', 70205)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (454, 77, N'COLORADO', N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'A', 70206)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (455, 78, N'SIQUIRRES', N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'A', 70301)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (456, 78, N'PACUARITO', N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'A', 70302)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (457, 78, N'FLORIDA', N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'A', 70303)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (458, 78, N'GERMANIA', N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'A', 70304)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (459, 78, N'EL CAIRO', N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'A', 70305)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (460, 78, N'LA ALEGRIA', N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'A', 70306)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (461, 79, N'BRATSI', N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.573' AS DateTime), N'A', 70401)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (462, 79, N'SIXAOLA', N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'A', 70402)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (463, 79, N'CAHUITA', N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'A', 70403)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (464, 79, N'TELIRE', N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'A', 70404)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (465, 80, N'MATINA', N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'A', 70501)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (466, 80, N'BATAN', N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'A', 70502)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (467, 80, N'CARRANDI', N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'A', 70503)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (468, 81, N'GUACIMO', N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.577' AS DateTime), N'A', 70601)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (469, 81, N'MERCEDES', N'sa', CAST(N'2014-06-17 11:39:58.580' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.580' AS DateTime), N'A', 70602)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (470, 81, N'POCORA', N'sa', CAST(N'2014-06-17 11:39:58.580' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.580' AS DateTime), N'A', 70603)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (471, 81, N'RIO JIMENEZ', N'sa', CAST(N'2014-06-17 11:39:58.580' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.580' AS DateTime), N'A', 70604)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (472, 81, N'DUACARI', N'sa', CAST(N'2014-06-17 11:39:58.580' AS DateTime), N'sa', CAST(N'2014-06-17 11:39:58.580' AS DateTime), N'A', 70605)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (473, 1, N'SAN SEBASTIAN', N'ARESEP\valverderf', CAST(N'2015-07-29 12:31:52.267' AS DateTime), N'ARESEP\valverderf', CAST(N'2015-07-29 12:31:52.267' AS DateTime), N'A', 10111)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (474, 7, N'JARIS', N'SA', CAST(N'2015-10-29 15:10:44.377' AS DateTime), N'SA', CAST(N'2015-10-29 15:10:44.377' AS DateTime), N'A', 10706)
GO
INSERT [Distritos] ([id_distrito], [id_canton], [nombre], [usuario_creacion], [fecha_creacion], [usuario_modificacion], [fecha_ult_mod], [vc_estado], [id_distrito_inec]) VALUES (475, 24, N'LABRADOR', N'SA', CAST(N'2015-10-29 15:10:44.377' AS DateTime), N'SA', CAST(N'2015-10-29 15:10:44.377' AS DateTime), N'A', 20404)
GO

SET IDENTITY_INSERT dbo.Distritos OFF
GO

/***************************************PROCEDIMIENTOS ALMACENADOS*****************************************/

-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Inserta un registro en la tabla de cantones>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertaCanton]
	-- Add the parameters for the stored procedure here
		  @id_provincia int,          
          @nombre varchar(100),          
          @id_canton_inec int          
AS
BEGIN
	INSERT INTO [dbo].Cantones
           ([id_provincia]           
           ,[nombre]
           ,[id_canton_inec])
     VALUES
           (@id_provincia,		    
            @nombre,
            @id_canton_inec)

END
GO
-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Elimina un registro en la tabla de cantones>
-- =============================================
CREATE PROCEDURE [dbo].[sp_EliminaCanton]
	-- Add the parameters for the stored procedure here
		  @id_canton int
AS
BEGIN
	DELETE FROM Cantones
	WHERE [id_canton]=@id_canton
END

GO
-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Modifica un registro en la tabla de cantones>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ModificaCanton]
	-- Add the parameters for the stored procedure here
		  @id_canton int,
		  @id_provincia int,          
          @nombre varchar(100),          
          @id_canton_inec int 
AS
BEGIN
	UPDATE Cantones
	SET [id_provincia]=@id_provincia,
	[nombre]=@nombre,
	[id_canton_inec]=@id_canton_inec
	WHERE [id_canton]=@id_canton
END

GO

-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Retorna los registros de la tabla de provincias tomando en cuenta la columna nombre>
-- =============================================

CREATE PROCEDURE [dbo].[sp_RetornaProvincias]
@nombre [varchar](50)= NULL,
@id_provincia int=NULL
AS
	
SELECT  id_provincia, nombre, usuario_creacion, fecha_creacion, usuario_modificacion, fecha_ult_mod, vc_estado
FROM Provincias
WHERE [nombre] like (case when @nombre is null then '%%' else '%'+@nombre+'%' end)
AND id_provincia=(case when @id_provincia is null then id_provincia else @id_provincia end)
go
-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Retorna los registros de la tabla de Cantones tomando en cuenta la columna nombre y id_provincia>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaCantones]
@nombre [varchar](50)= NULL,
@id_provincia int= NULL
AS
	
SELECT  tCant.id_canton,tCant.id_provincia, tCant.nombre,tProv.nombre 'Provincia', tCant.usuario_creacion, tCant.fecha_creacion, tCant.usuario_modificacion, tCant.fecha_ult_mod, tCant.vc_estado,tCant.id_canton_inec
FROM Cantones tCant inner join Provincias tProv on tCant.id_provincia=tProv.id_provincia
WHERE tCant.[id_provincia] = (case when @id_provincia is null then tCant.id_provincia else @id_provincia end)
and tCant.[nombre] like (case when @nombre is null then '%%' else '%'+@nombre+'%' end)

go

-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Retorna los registros de la tabla de Cantones tomando en cuenta la columna id_canton>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaCantonesid_canton]
@id_canton int
AS
	
SELECT  tCant.id_canton,tCant.id_provincia, tCant.nombre,tProv.nombre 'Provincia', tCant.usuario_creacion, tCant.fecha_creacion, tCant.usuario_modificacion, tCant.fecha_ult_mod, tCant.vc_estado,tCant.id_canton_inec
FROM Cantones tCant inner join Provincias tProv on tCant.id_provincia=tProv.id_provincia
WHERE [id_canton] = @id_canton

go
-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Retorna los registros de la tabla de Distritos tomando en cuenta la columna nombre y id_canton>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaDistritos]
@nombre [varchar](50)= NULL,
@id_canton int= NULL
AS
	
SELECT   tDist.id_distrito,tCant.id_canton, tDist.nombre,tCant.nombre 'Canton', tDist.usuario_creacion, tDist.fecha_creacion, tDist.usuario_modificacion, tCant.fecha_ult_mod, tCant.vc_estado,tDist.id_distrito_inec
FROM Distritos tDist inner join Cantones tCant on tDist.id_canton=tCant.id_canton
WHERE tDist.[id_canton] = (case when @id_canton is null then tCant.[id_canton] else @id_canton end)
and tDist.[nombre] like (case when @nombre is null then '%%' else '%'+@nombre+'%' end)

go