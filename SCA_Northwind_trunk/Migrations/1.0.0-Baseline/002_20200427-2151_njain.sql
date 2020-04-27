-- <Migration ID="44dab6c9-353a-46e1-88f9-35904d120e41" />
GO

PRINT N'Altering [dbo].[Customers]'
GO
ALTER TABLE [dbo].[Customers] ALTER COLUMN [Address] [varchar] (100) NULL
GO
PRINT N'Altering [dbo].[Categories]'
GO
ALTER TABLE [dbo].[Categories] ADD
[CategoryType] [nvarchar] (50) NULL,
[MainCategory] [int] NOT NULL CONSTRAINT [DF__Categorie__MainC__75A278F5] DEFAULT ((0)),
[testCol] [nvarchar] (10) NULL,
[testCol1] [nvarchar] (10) NULL,
[testCol2] [nvarchar] (10) NULL,
[testCol3] [nvarchar] (10) NULL,
[testCol4] [nvarchar] (10) NULL,
[testCol5] [nvarchar] (10) NULL,
[testCol6] [nvarchar] (10) NULL,
[testCol7] [nvarchar] (10) NULL,
[testCol8] [nvarchar] (10) NULL,
[testCol9] [nvarchar] (10) NULL
GO
