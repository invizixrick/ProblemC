USE [ProblemC]
GO

/****** Object:  Table [dbo].[Policies]    Script Date: 02/24/2018 09:23:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Policies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PetOwnerId] [int] NOT NULL,
	[PolicyNumber] [char](13) NOT NULL,
	[PolicyStartDate] [datetime] NOT NULL,
	[PolicyEndDate] [datetime] NULL,
 CONSTRAINT [PK_Policies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Policies]  WITH CHECK ADD  CONSTRAINT [FK_Policies_PetOwners] FOREIGN KEY([PetOwnerId])
REFERENCES [dbo].[PetOwners] ([Id])
GO

ALTER TABLE [dbo].[Policies] CHECK CONSTRAINT [FK_Policies_PetOwners]
GO

ALTER TABLE [dbo].[Policies] ADD  CONSTRAINT [DF_Policies_PolicyNumber]  DEFAULT ('0000000000000') FOR [PolicyNumber]
GO

ALTER TABLE [dbo].[Policies] ADD  CONSTRAINT [DF_Policies_PolicyStartDate]  DEFAULT (getdate()) FOR [PolicyStartDate]
GO

