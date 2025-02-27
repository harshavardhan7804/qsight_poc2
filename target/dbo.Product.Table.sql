USE [CustomerSeven]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11-01-2025 00:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [uniqueidentifier] NOT NULL,
	[GlobalProductId] [uniqueidentifier] NULL,
	[ProductTypeId] [uniqueidentifier] NULL,
	[ManufacturerId] [uniqueidentifier] NOT NULL,
	[CatalogNumber] [nvarchar](50) NOT NULL,
	[CleanCatalogNumber] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[DescriptionAlias] [nvarchar](255) NOT NULL,
	[BrandName] [nvarchar](255) NOT NULL,
	[QuickReorderNumber] [nvarchar](50) NULL,
	[LongDescription] [nvarchar](1000) NULL,
	[UnitTypeId] [uniqueidentifier] NULL,
	[Size] [nvarchar](50) NULL,
	[Latex] [bit] NOT NULL,
	[Stock] [bit] NOT NULL,
	[Discontinued] [bit] NOT NULL,
	[UsageDesignation] [nchar](1) NULL,
	[CostCenter] [nvarchar](50) NULL,
	[RequireInspection] [bit] NOT NULL,
	[TranslatedTemperatureId] [uniqueidentifier] NULL,
	[ImplantTemperatureTypeId] [uniqueidentifier] NULL,
	[RequireLotNumber] [bit] NOT NULL,
	[RequireExpirationDate] [bit] NOT NULL,
	[RequireLocation] [bit] NOT NULL,
	[RequireRFIDTag] [bit] NOT NULL,
	[ShowFDAAlerts] [bit] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ImagePath] [nvarchar](1000) NULL,
	[IsContrast] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateLaseModified] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Product_CleanCatalogNumber]    Script Date: 11-01-2025 00:44:04 ******/
CREATE NONCLUSTERED INDEX [IX_Product_CleanCatalogNumber] ON [dbo].[Product]
(
	[CleanCatalogNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Product_DescriptionAlias]    Script Date: 11-01-2025 00:44:04 ******/
CREATE NONCLUSTERED INDEX [IX_Product_DescriptionAlias] ON [dbo].[Product]
(
	[DescriptionAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_ImplantTemperatureTypeId]    Script Date: 11-01-2025 00:44:04 ******/
CREATE NONCLUSTERED INDEX [IX_Product_ImplantTemperatureTypeId] ON [dbo].[Product]
(
	[ImplantTemperatureTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_ProductTypeId]    Script Date: 11-01-2025 00:44:04 ******/
CREATE NONCLUSTERED INDEX [IX_Product_ProductTypeId] ON [dbo].[Product]
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Product_QuickReorderNumber]    Script Date: 11-01-2025 00:44:04 ******/
CREATE NONCLUSTERED INDEX [IX_Product_QuickReorderNumber] ON [dbo].[Product]
(
	[QuickReorderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_TranslatedTemperatureId]    Script Date: 11-01-2025 00:44:04 ******/
CREATE NONCLUSTERED INDEX [IX_Product_TranslatedTemperatureId] ON [dbo].[Product]
(
	[TranslatedTemperatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_UnitTypeId]    Script Date: 11-01-2025 00:44:04 ******/
CREATE NONCLUSTERED INDEX [IX_Product_UnitTypeId] ON [dbo].[Product]
(
	[UnitTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_UserId]    Script Date: 11-01-2025 00:44:04 ******/
CREATE NONCLUSTERED INDEX [IX_Product_UserId] ON [dbo].[Product]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQIX_Product_ManufactuerId_CatalogNumber]    Script Date: 11-01-2025 00:44:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQIX_Product_ManufactuerId_CatalogNumber] ON [dbo].[Product]
(
	[ManufacturerId] ASC,
	[CatalogNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ProductId]  DEFAULT (newid()) FOR [ProductId]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Latex]  DEFAULT ((0)) FOR [Latex]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Stock]  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_RequireInspection]  DEFAULT ((0)) FOR [RequireInspection]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_RequireLotNumber]  DEFAULT ((0)) FOR [RequireLotNumber]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_RequireExpirationDate]  DEFAULT ((0)) FOR [RequireExpirationDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_RequireLocation]  DEFAULT ((0)) FOR [RequireLocation]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_RequireRFIDTag]  DEFAULT ((0)) FOR [RequireRFIDTag]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ShowFDAAlerts]  DEFAULT ((0)) FOR [ShowFDAAlerts]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsContrast]  DEFAULT ((0)) FOR [IsContrast]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_DateLaseModified]  DEFAULT (getdate()) FOR [DateLaseModified]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ImplantTemperatureType] FOREIGN KEY([ImplantTemperatureTypeId])
REFERENCES [dbo].[ImplantTemperatureType] ([ImplantTemperatureTypeId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ImplantTemperatureType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturer] ([ManufacturerId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([ProductTypeId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_TranslatedTemperature] FOREIGN KEY([TranslatedTemperatureId])
REFERENCES [dbo].[TranslatedTemperature] ([TranslatedTemperatureId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_TranslatedTemperature]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_UnitType] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[UnitType] ([UnitTypeId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_UnitType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_Product_Designation] CHECK  ((([UsageDesignation]='S' OR [UsageDesignation] IS NULL) AND ([TranslatedTemperatureId] IS NULL AND [ImplantTemperatureTypeId] IS NULL) OR [UsageDesignation]='I'))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_Product_Designation]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_Product_IsContrast_TrueForSupplyOnly] CHECK  ((([IsContrast]=(1) OR [IsContrast]=(0)) AND [UsageDesignation]='S' OR [IsContrast]=(0) AND [UsageDesignation]='I'))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_Product_IsContrast_TrueForSupplyOnly]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_Product_RequireInspection] CHECK  ((([UsageDesignation]='S' OR [UsageDesignation] IS NULL) AND [RequireInspection]=(0) OR [UsageDesignation]='I'))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_Product_RequireInspection]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Product entity defines the customer specific products.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product'
GO
