USE [PE]
GO
/****** Object:  Table [dbo].[physical_feature]    Script Date: 06/03/2015 05:59:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[physical_feature](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[result] [varchar](50) NULL,
	[operator] [varchar](50) NULL,
	[compare_man] [varchar](50) NULL,
	[compare_woman] [varchar](50) NULL,
 CONSTRAINT [PK_physical_feathre] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[office]    Script Date: 06/03/2015 05:59:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[office](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[office_name] [varchar](20) NULL,
	[office_number] [varchar](10) NULL,
	[office_type] [bit] NULL,
 CONSTRAINT [PK__office__3213E83F0AD2A005] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[groupReservation]    Script Date: 06/03/2015 05:59:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[groupReservation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[groupName] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[leaderName] [varchar](20) NULL,
	[leaderPhoneNumber] [varchar](20) NULL,
	[group_number] [int] NULL,
	[combo_id] [int] NULL,
	[combo_discount] [int] NULL,
	[allCount] [varchar](20) NULL,
	[reservation_date] [date] NULL,
	[time] [datetime] NULL,
	[physical_examination] [text] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_groupReservation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[examination_project]    Script Date: 06/03/2015 05:59:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[examination_project](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_name] [varchar](20) NULL,
	[office_id] [int] NULL,
	[price] [varchar](50) NULL,
	[combo_price] [varchar](50) NULL,
	[physical_feature_id] [varchar](50) NULL,
 CONSTRAINT [PK__examinat__3213E83F07020F21] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_examination_project] UNIQUE NONCLUSTERED 
(
	[project_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[conclusion]    Script Date: 06/03/2015 05:59:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[conclusion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[conclusion] [varchar](150) NULL,
	[explain_disease] [varchar](150) NULL,
	[suggestion] [varchar](150) NULL,
 CONSTRAINT [PK_conclusion_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[combo]    Script Date: 06/03/2015 05:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[combo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[combo_name] [varchar](20) NULL,
	[combo_items] [text] NULL,
	[combo_price] [varchar](20) NULL,
 CONSTRAINT [IX_combo] UNIQUE NONCLUSTERED 
(
	[combo_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 06/03/2015 05:59:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reservation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](10) NULL,
	[birthday] [varchar](50) NULL,
	[address] [varchar](500) NULL,
	[idCard] [varchar](50) NULL,
	[marriage] [varchar](50) NULL,
	[nationa] [varchar](50) NULL,
	[sex] [varchar](50) NULL,
	[phone_number] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[reservation_date] [varchar](50) NULL,
	[combo] [varchar](50) NULL,
	[totalAmount] [varchar](50) NULL,
	[physical_examination] [text] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__reservat__3213E83F1A14E395] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06/03/2015 05:59:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[id] [varchar](10) NOT NULL,
	[name] [varchar](10) NULL,
	[password] [varchar](20) NULL,
	[position] [varchar](20) NULL,
	[office_id] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registration]    Script Date: 06/03/2015 05:59:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[birthday] [varchar](50) NULL,
	[address] [varchar](500) NULL,
	[idCard] [varchar](50) NULL,
	[marriage] [varchar](50) NULL,
	[nationa] [varchar](50) NULL,
	[sex] [varchar](50) NULL,
	[phone_number] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[reservation_date] [varchar](50) NULL,
	[combo] [varchar](50) NULL,
	[physical_examination] [text] NULL,
	[comments] [varchar](1000) NULL,
	[group_id] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__registra__3213E83F1DE57479] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_groupReservation_time]    Script Date: 06/03/2015 05:59:21 ******/
ALTER TABLE [dbo].[groupReservation] ADD  CONSTRAINT [DF_groupReservation_time]  DEFAULT (getdate()) FOR [time]
GO
/****** Object:  Default [DF_groupReservation_status]    Script Date: 06/03/2015 05:59:21 ******/
ALTER TABLE [dbo].[groupReservation] ADD  CONSTRAINT [DF_groupReservation_status]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF_registration_status]    Script Date: 06/03/2015 05:59:21 ******/
ALTER TABLE [dbo].[registration] ADD  CONSTRAINT [DF_registration_status]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF_reservation_status]    Script Date: 06/03/2015 05:59:21 ******/
ALTER TABLE [dbo].[reservation] ADD  CONSTRAINT [DF_reservation_status]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  ForeignKey [FK_registration_groupReservation]    Script Date: 06/03/2015 05:59:21 ******/
ALTER TABLE [dbo].[registration]  WITH CHECK ADD  CONSTRAINT [FK_registration_groupReservation] FOREIGN KEY([group_id])
REFERENCES [dbo].[groupReservation] ([id])
GO
ALTER TABLE [dbo].[registration] CHECK CONSTRAINT [FK_registration_groupReservation]
GO
/****** Object:  ForeignKey [FK_Users_Users]    Script Date: 06/03/2015 05:59:21 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([office_id])
REFERENCES [dbo].[office] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
