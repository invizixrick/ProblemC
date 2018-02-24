USE [ProblemC]
GO

/****** Object:  Table [dbo].[PolicyPets]    Script Date: 02/24/2018 09:24:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PolicyPets](
	[PetId] [int] NOT NULL,
	[PolicyId] [int] NOT NULL,
 CONSTRAINT [PK_PolicyPets] PRIMARY KEY CLUSTERED 
(
	[PetId] ASC,
	[PolicyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PolicyPets]  WITH CHECK ADD  CONSTRAINT [FK_PolicyPets_Pets] FOREIGN KEY([PetId])
REFERENCES [dbo].[Pets] ([Id])
GO

ALTER TABLE [dbo].[PolicyPets] CHECK CONSTRAINT [FK_PolicyPets_Pets]
GO

ALTER TABLE [dbo].[PolicyPets]  WITH CHECK ADD  CONSTRAINT [FK_PolicyPets_Policies] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policies] ([Id])
GO

ALTER TABLE [dbo].[PolicyPets] CHECK CONSTRAINT [FK_PolicyPets_Policies]
GO

