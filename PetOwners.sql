USE [ProblemC]
GO

/****** Object:  Table [dbo].[PetOwners]    Script Date: 02/24/2018 09:23:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PetOwners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Address] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nchar](2) NULL,
	[Zip] [nvarchar](20) NULL,
 CONSTRAINT [PK_PetOwner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PetOwners]  WITH CHECK ADD  CONSTRAINT [FK_PetOwner_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO

ALTER TABLE [dbo].[PetOwners] CHECK CONSTRAINT [FK_PetOwner_Country]
GO

