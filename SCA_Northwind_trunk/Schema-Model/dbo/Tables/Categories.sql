CREATE TABLE [dbo].[Categories]
(
[CategoryID] [int] NOT NULL IDENTITY(1, 1),
[CategoryName] [nvarchar] (15) NOT NULL,
[Description] [ntext] NULL,
[Picture] [image] NULL,
[CategoryType] [nvarchar] (50) NULL,
[MainCategory] [int] NOT NULL CONSTRAINT [DF__Categorie__MainC__75A278F5] DEFAULT ((0)),
[testCol] [nvarchar] (10) NULL,
[testCol1] [nvarchar] (10) NULL,
[testCol2] [nvarchar] (10) NULL,
[testCol3] [nvarchar] (10) NULL,
[testCol4] [nvarchar] (10) NULL,
[testCol5] [nvarchar] (10) NULL,
[testCol6] [nvarchar] (10) NULL
)
GO
ALTER TABLE [dbo].[Categories] ADD CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED  ([CategoryID])
GO
CREATE NONCLUSTERED INDEX [CategoryName] ON [dbo].[Categories] ([CategoryName])
GO
