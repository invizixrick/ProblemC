USE [ProblemC]
GO

/****** Object:  Table [dbo].[Pets]    Script Date: 02/24/2018 09:23:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PetOwnerId] [int] NULL,
	[BreedId] [int] NULL,
	[Name] [nvarchar](40) NULL,
	[DateOfBirth] [date] NULL,
 CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Breed] FOREIGN KEY([BreedId])
REFERENCES [dbo].[Breeds] ([Id])
GO

ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Pet_Breed]
GO

ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Pet_PetOwner] FOREIGN KEY([PetOwnerId])
REFERENCES [dbo].[PetOwners] ([Id])
GO

ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Pet_PetOwner]
GO

