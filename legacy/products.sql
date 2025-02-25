CREATE TABLE [dbo].[products] (
    [row_id]                   INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [product_id]               VARCHAR (50)  NOT NULL,
    [product_type_id]          INT           CONSTRAINT [DF_products_product_type_id] DEFAULT (69) NOT NULL,
    [manufacturer_id]          INT           NOT NULL,
    [description]              VARCHAR (255) NULL,
    [nickname]                 VARCHAR (150) NULL,
    [brand_name]               VARCHAR (255) CONSTRAINT [DF_products_brand_name] DEFAULT ('N/A') NULL,
    [catalog_no]               VARCHAR (50)  NOT NULL,
    [clean_catalog_no]         VARCHAR (50)  NULL,
    [quick_reorder_number]     VARCHAR (50)  NULL,
    [ecri_category_code]       INT           NULL,
    [expiration_algorithm]     VARCHAR (255) NULL,
    [hyperlink]                VARCHAR (255) NULL,
    [photo_or_graphic]         IMAGE         NULL,
    [unit_of_measure]          VARCHAR (4)   CONSTRAINT [DF_products_unit_of_measure] DEFAULT ('EA') NULL,
    [qty_of_eaches_in_uom]     INT           CONSTRAINT [DF_products_qty_of_eaches_in_uom] DEFAULT (1) NOT NULL,
    [upn_qualifier]            VARCHAR (4)   NULL,
    [list_price]               MONEY         NULL,
    [updated]                  DATETIME      NULL,
    [stock_or_non_stock]       VARCHAR (4)   NULL,
    [detailed_product_type_id] INT           NULL,
    [original_manufacturer_id] INT           NULL,
    [product_billing_code_id]  INT           NULL,
    [long_description]         VARCHAR (255) NULL,
    [unit_type_id]             INT           NULL,
    [date_created]             DATETIME      CONSTRAINT [DF_products_date_created] DEFAULT (getdate()) NULL,
    [user_id]                  INT           NULL,
    [alt_id_1]                 AS            (left([product_id],(len([product_id]) - 1))),
    [alt_id_2]                 AS            (left([product_id],(len([product_id]) - 2))),
    [alt_id_3]                 AS            (substring([product_id],2,(len([product_id]) - 2))),
    [alt_id_4]                 AS            (substring([product_id],2,(len([product_id]) - 3))),
    [primary_usage_id]         INT           NULL,
    [discontinued]             BIT           DEFAULT ((0)) NOT NULL,
    [discontinued_date]        DATETIME      DEFAULT (getdate()) NULL,
    [discontinued_by_user_id]  INT           NULL,
    [last_modified_date]       DATETIME      DEFAULT (getdate()) NOT NULL,
    [size]                     VARCHAR (50)  NULL,
    [gtin]                     VARCHAR (50)  NULL,
    [latex]                    BIT           NULL,
    CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED ([product_id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [CK_products] CHECK ([qty_of_eaches_in_uom] > 0),
    CONSTRAINT [FK_products_manufacturers] FOREIGN KEY ([manufacturer_id]) REFERENCES [dbo].[manufacturers] ([manufacturer_id]),
    CONSTRAINT [FK_products_product_billing_codes] FOREIGN KEY ([product_billing_code_id]) REFERENCES [dbo].[product_billing_codes] ([product_billing_code_id]) NOT FOR REPLICATION,
    CONSTRAINT [FK_products_product_types] FOREIGN KEY ([product_type_id]) REFERENCES [dbo].[product_types] ([product_type_id]),
    CONSTRAINT [FK_products_unit_types] FOREIGN KEY ([unit_type_id]) REFERENCES [dbo].[unit_types] ([unit_type_id]) NOT FOR REPLICATION,
    CONSTRAINT [FK_products_users] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([user_id]) NOT FOR REPLICATION,
    CONSTRAINT [FK_products_users_1] FOREIGN KEY ([discontinued_by_user_id]) REFERENCES [dbo].[users] ([user_id]) NOT FOR REPLICATION
);


GO
ALTER TABLE [dbo].[products] NOCHECK CONSTRAINT [FK_products_product_billing_codes];


GO
ALTER TABLE [dbo].[products] NOCHECK CONSTRAINT [FK_products_unit_types];


GO
ALTER TABLE [dbo].[products] NOCHECK CONSTRAINT [FK_products_users];


GO
ALTER TABLE [dbo].[products] NOCHECK CONSTRAINT [FK_products_users_1];


GO

CREATE NONCLUSTERED INDEX [products37]
    ON [dbo].[products]([product_id] ASC, [qty_of_eaches_in_uom] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [IX_prim_usage]
    ON [dbo].[products]([product_id] ASC, [manufacturer_id] ASC, [catalog_no] ASC, [primary_usage_id] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [ix_alt_id_2]
    ON [dbo].[products]([alt_id_2] ASC, [product_id] ASC, [manufacturer_id] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products62]
    ON [dbo].[products]([product_id] ASC, [manufacturer_id] ASC, [product_type_id] ASC, [description] ASC, [brand_name] ASC, [catalog_no] ASC, [clean_catalog_no] ASC, [quick_reorder_number] ASC, [qty_of_eaches_in_uom] ASC)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products21]
    ON [dbo].[products]([manufacturer_id] ASC, [catalog_no] ASC, [unit_of_measure] ASC, [qty_of_eaches_in_uom] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products4]
    ON [dbo].[products]([catalog_no] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [ix_alt_id_4_covering]
    ON [dbo].[products]([alt_id_4] ASC, [manufacturer_id] ASC, [unit_of_measure] ASC, [qty_of_eaches_in_uom] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [ix_alt_id_1]
    ON [dbo].[products]([product_id] ASC, [manufacturer_id] ASC, [alt_id_1] ASC, [alt_id_2] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [IX_products_id_mfg_id_type_id]
    ON [dbo].[products]([product_id] ASC, [manufacturer_id] ASC, [product_type_id] ASC)
    INCLUDE([row_id], [description], [catalog_no])
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [_dta_index_products_5_127391573__K2_K5_K3_1_6_9_11_16_17]
    ON [dbo].[products]([product_id] ASC, [manufacturer_id] ASC, [product_type_id] ASC)
    INCLUDE([row_id], [description], [catalog_no], [quick_reorder_number], [unit_of_measure], [qty_of_eaches_in_uom])
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [IX_quick_reorder_number_UOM_qty_of_eaches]
    ON [dbo].[products]([quick_reorder_number] ASC, [product_id] ASC, [unit_of_measure] ASC, [qty_of_eaches_in_uom] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products22]
    ON [dbo].[products]([catalog_no] ASC, [manufacturer_id] ASC, [product_id] ASC, [product_type_id] ASC, [description] ASC, [brand_name] ASC, [unit_of_measure] ASC, [qty_of_eaches_in_uom] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [_dta_index_products_6_127391573__K2_K5_K3]
    ON [dbo].[products]([product_id] ASC, [manufacturer_id] ASC, [product_type_id] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products15]
    ON [dbo].[products]([manufacturer_id] ASC, [product_type_id] ASC, [product_id] ASC, [brand_name] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [_dta_index_products_6_127391573__K16_K17_K2_K9_K10_K11]
    ON [dbo].[products]([unit_of_measure] ASC, [qty_of_eaches_in_uom] ASC, [product_id] ASC, [catalog_no] ASC, [clean_catalog_no] ASC, [quick_reorder_number] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [ix_alt_id_3_covering]
    ON [dbo].[products]([alt_id_3] ASC, [manufacturer_id] ASC, [unit_of_measure] ASC, [qty_of_eaches_in_uom] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products11]
    ON [dbo].[products]([product_type_id] ASC, [manufacturer_id] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [IX_quick_reorder_number]
    ON [dbo].[products]([quick_reorder_number] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [IX_Product_Search_Covering]
    ON [dbo].[products]([product_type_id] ASC, [qty_of_eaches_in_uom] ASC, [quick_reorder_number] ASC, [clean_catalog_no] ASC, [manufacturer_id] ASC, [brand_name] ASC, [product_id] ASC, [description] ASC, [catalog_no] ASC)
    INCLUDE([unit_of_measure]);


GO

CREATE NONCLUSTERED INDEX [IX_pid_qty]
    ON [dbo].[products]([product_id] ASC, [qty_of_eaches_in_uom] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products20]
    ON [dbo].[products]([clean_catalog_no] ASC, [product_id] ASC, [manufacturer_id] ASC, [catalog_no] ASC, [quick_reorder_number] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [IX_products_encounter_search_covering]
    ON [dbo].[products]([product_billing_code_id] ASC, [manufacturer_id] ASC, [product_id] ASC, [description] ASC, [catalog_no] ASC, [brand_name] ASC)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [IX_pid_mfr_cat_no]
    ON [dbo].[products]([product_id] ASC, [manufacturer_id] ASC, [catalog_no] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products43]
    ON [dbo].[products]([manufacturer_id] ASC, [catalog_no] ASC, [product_id] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products35]
    ON [dbo].[products]([product_id] ASC, [product_type_id] ASC, [manufacturer_id] ASC, [catalog_no] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [ix_alt_id_4]
    ON [dbo].[products]([alt_id_4] ASC, [product_id] ASC, [manufacturer_id] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products116]
    ON [dbo].[products]([manufacturer_id] ASC, [catalog_no] ASC)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [ix_alt_id_2_covering]
    ON [dbo].[products]([alt_id_2] ASC, [manufacturer_id] ASC, [unit_of_measure] ASC, [qty_of_eaches_in_uom] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [IX_products__brand_name_brand_name]
    ON [dbo].[products]([brand_name] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_mfr_catalog_brand]
    ON [dbo].[products]([manufacturer_id] ASC, [catalog_no] ASC, [brand_name] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_row_id]
    ON [dbo].[products]([row_id] ASC);


GO

CREATE NONCLUSTERED INDEX [products19]
    ON [dbo].[products]([product_id] ASC, [manufacturer_id] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products3]
    ON [dbo].[products]([product_id] ASC, [product_type_id] ASC, [manufacturer_id] ASC, [brand_name] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [IX_qty_of_eaches]
    ON [dbo].[products]([qty_of_eaches_in_uom] ASC, [product_id] ASC, [manufacturer_id] ASC, [catalog_no] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [ix_alt_id_1b]
    ON [dbo].[products]([alt_id_1] ASC, [product_id] ASC, [manufacturer_id] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [IX_p_product_type_id]
    ON [dbo].[products]([product_type_id] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products8]
    ON [dbo].[products]([product_id] ASC, [product_type_id] ASC, [manufacturer_id] ASC, [brand_name] ASC, [description] ASC, [catalog_no] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [ix_alt_id_3]
    ON [dbo].[products]([alt_id_3] ASC, [product_id] ASC, [manufacturer_id] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [_dta_index_products_5_127391573__K1_K9_K11_K8_K2_K6_K16_K17_3_5_24]
    ON [dbo].[products]([row_id] ASC, [catalog_no] ASC, [quick_reorder_number] ASC, [brand_name] ASC, [product_id] ASC, [description] ASC, [unit_of_measure] ASC, [qty_of_eaches_in_uom] ASC)
    INCLUDE([product_type_id], [manufacturer_id], [product_billing_code_id])
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products28]
    ON [dbo].[products]([product_id] ASC, [manufacturer_id] ASC, [qty_of_eaches_in_uom] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products44]
    ON [dbo].[products]([catalog_no] ASC, [manufacturer_id] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [IX_products_150]
    ON [dbo].[products]([qty_of_eaches_in_uom] ASC, [unit_of_measure] ASC, [clean_catalog_no] ASC, [product_id] ASC, [manufacturer_id] ASC)
    INCLUDE([catalog_no]) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_products_manufacturer_id]
    ON [dbo].[products]([manufacturer_id] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [products18]
    ON [dbo].[products]([clean_catalog_no] ASC, [product_id] ASC, [manufacturer_id] ASC, [quick_reorder_number] ASC) WITH (FILLFACTOR = 90)
    ON [PRODUCT_INDEXES];


GO

CREATE NONCLUSTERED INDEX [ix_alt_id_1_covering]
    ON [dbo].[products]([alt_id_1] ASC, [manufacturer_id] ASC, [unit_of_measure] ASC, [qty_of_eaches_in_uom] ASC) WITH (FILLFACTOR = 80)
    ON [PRODUCT_INDEXES];


GO

CREATE STATISTICS [_dta_stat_127391573_10_2_9]
    ON [dbo].[products]([clean_catalog_no], [product_id], [catalog_no]);


GO

CREATE STATISTICS [_dta_stat_127391573_2_9_16]
    ON [dbo].[products]([product_id], [catalog_no], [unit_of_measure]);


GO

CREATE STATISTICS [_dta_stat_127391573_2_3_9]
    ON [dbo].[products]([product_id], [product_type_id], [catalog_no]);


GO

CREATE STATISTICS [_dta_stat_127391573_17_11_10_5_8_2_6]
    ON [dbo].[products]([qty_of_eaches_in_uom], [quick_reorder_number], [clean_catalog_no], [manufacturer_id], [brand_name], [product_id], [description]);


GO

CREATE STATISTICS [_dta_stat_127391573_5_9_17_11]
    ON [dbo].[products]([manufacturer_id], [catalog_no], [qty_of_eaches_in_uom], [quick_reorder_number]);


GO

CREATE STATISTICS [_dta_stat_127391573_8_9_6]
    ON [dbo].[products]([brand_name], [catalog_no], [description]);


GO

CREATE STATISTICS [_dta_stat_127391573_2_5_9_8]
    ON [dbo].[products]([product_id], [manufacturer_id], [catalog_no], [brand_name]);


GO

CREATE STATISTICS [_dta_stat_127391573_9_16_17_2_10]
    ON [dbo].[products]([catalog_no], [unit_of_measure], [qty_of_eaches_in_uom], [product_id], [clean_catalog_no]);


GO

CREATE STATISTICS [_dta_stat_127391573_11_2_9_10_16_17]
    ON [dbo].[products]([quick_reorder_number], [product_id], [catalog_no], [clean_catalog_no], [unit_of_measure], [qty_of_eaches_in_uom]);


GO

CREATE STATISTICS [_dta_stat_127391573_9_5_8_3_17_11_10_2]
    ON [dbo].[products]([catalog_no], [manufacturer_id], [brand_name], [product_type_id], [qty_of_eaches_in_uom], [quick_reorder_number], [clean_catalog_no], [product_id]);


GO

CREATE STATISTICS [_dta_stat_127391573_9_10_11_16_17]
    ON [dbo].[products]([catalog_no], [clean_catalog_no], [quick_reorder_number], [unit_of_measure], [qty_of_eaches_in_uom]);


GO

CREATE STATISTICS [_dta_stat_127391573_5_8_2]
    ON [dbo].[products]([manufacturer_id], [brand_name], [product_id]);


GO

CREATE STATISTICS [_dta_stat_127391573_5_3_8]
    ON [dbo].[products]([manufacturer_id], [product_type_id], [brand_name]);


GO

CREATE STATISTICS [_dta_stat_127391573_2_5_9_3_24_1_11_8_6_16_17]
    ON [dbo].[products]([product_id], [manufacturer_id], [catalog_no], [product_type_id], [product_billing_code_id], [row_id], [quick_reorder_number], [brand_name], [description], [unit_of_measure], [qty_of_eaches_in_uom]);


GO

CREATE STATISTICS [_dta_stat_127391573_10_2_5_3_9_8]
    ON [dbo].[products]([clean_catalog_no], [product_id], [manufacturer_id], [product_type_id], [catalog_no], [brand_name]);


GO

CREATE STATISTICS [_dta_stat_127391573_5_9_3]
    ON [dbo].[products]([manufacturer_id], [catalog_no], [product_type_id]);


GO

CREATE STATISTICS [_dta_stat_127391573_2_16_17_9_10]
    ON [dbo].[products]([product_id], [unit_of_measure], [qty_of_eaches_in_uom], [catalog_no], [clean_catalog_no]);


GO

CREATE STATISTICS [_dta_stat_127391573_11_2_5_3_9_8_6]
    ON [dbo].[products]([quick_reorder_number], [product_id], [manufacturer_id], [product_type_id], [catalog_no], [brand_name], [description]);


GO

CREATE STATISTICS [_dta_stat_127391573_6_9_8_5]
    ON [dbo].[products]([description], [catalog_no], [brand_name], [manufacturer_id]);


GO

CREATE STATISTICS [_dta_stat_127391573_6_9_8_24_5_2]
    ON [dbo].[products]([description], [catalog_no], [brand_name], [product_billing_code_id], [manufacturer_id], [product_id]);


GO

CREATE STATISTICS [_dta_stat_127391573_5_2_17_16]
    ON [dbo].[products]([manufacturer_id], [product_id], [qty_of_eaches_in_uom], [unit_of_measure]);


GO

CREATE STATISTICS [_dta_stat_127391573_9_5_3_8]
    ON [dbo].[products]([catalog_no], [manufacturer_id], [product_type_id], [brand_name]);


GO

CREATE STATISTICS [_dta_stat_127391573_2_5_9_11_6_8]
    ON [dbo].[products]([product_id], [manufacturer_id], [catalog_no], [quick_reorder_number], [description], [brand_name]);


GO

CREATE STATISTICS [_dta_stat_127391573_24_6_9]
    ON [dbo].[products]([product_billing_code_id], [description], [catalog_no]);


GO

CREATE STATISTICS [_dta_stat_127391573_9_6_2]
    ON [dbo].[products]([catalog_no], [description], [product_id]);


GO

CREATE STATISTICS [_dta_stat_127391573_9_17_11_10_5_8_2_6]
    ON [dbo].[products]([catalog_no], [qty_of_eaches_in_uom], [quick_reorder_number], [clean_catalog_no], [manufacturer_id], [brand_name], [product_id], [description]);


GO

CREATE STATISTICS [_dta_stat_127391573_3_8_9]
    ON [dbo].[products]([product_type_id], [brand_name], [catalog_no]);


GO

CREATE STATISTICS [_dta_stat_127391573_9_17_5]
    ON [dbo].[products]([catalog_no], [qty_of_eaches_in_uom], [manufacturer_id]);


GO

CREATE STATISTICS [_dta_stat_127391573_2_6_9_8_24]
    ON [dbo].[products]([product_id], [description], [catalog_no], [brand_name], [product_billing_code_id]);


GO

CREATE STATISTICS [_dta_stat_127391573_2_10_5_17]
    ON [dbo].[products]([product_id], [clean_catalog_no], [manufacturer_id], [qty_of_eaches_in_uom]);


GO

CREATE STATISTICS [_dta_stat_127391573_5_17_11]
    ON [dbo].[products]([manufacturer_id], [qty_of_eaches_in_uom], [quick_reorder_number]);


GO

CREATE STATISTICS [_dta_stat_127391573_5_6_9]
    ON [dbo].[products]([manufacturer_id], [description], [catalog_no]);


GO

CREATE STATISTICS [_dta_stat_127391573_8_24_5_2_6]
    ON [dbo].[products]([brand_name], [product_billing_code_id], [manufacturer_id], [product_id], [description]);


GO

CREATE STATISTICS [_dta_stat_127391573_5_17_16_10]
    ON [dbo].[products]([manufacturer_id], [qty_of_eaches_in_uom], [unit_of_measure], [clean_catalog_no]);


GO

CREATE STATISTICS [_dta_stat_127391573_8_6_9_10_11_2_17]
    ON [dbo].[products]([brand_name], [description], [catalog_no], [clean_catalog_no], [quick_reorder_number], [product_id], [qty_of_eaches_in_uom]);


GO

CREATE STATISTICS [_dta_stat_127391573_16_2_9_10]
    ON [dbo].[products]([unit_of_measure], [product_id], [catalog_no], [clean_catalog_no]);


GO

CREATE STATISTICS [_dta_stat_127391573_2_17_9_10_11]
    ON [dbo].[products]([product_id], [qty_of_eaches_in_uom], [catalog_no], [clean_catalog_no], [quick_reorder_number]);


GO

CREATE STATISTICS [_dta_stat_127391573_2_17_11_10_5]
    ON [dbo].[products]([product_id], [qty_of_eaches_in_uom], [quick_reorder_number], [clean_catalog_no], [manufacturer_id]);


GO

CREATE STATISTICS [_dta_stat_127391573_2_24_5_9]
    ON [dbo].[products]([product_id], [product_billing_code_id], [manufacturer_id], [catalog_no]);


GO

CREATE STATISTICS [_dta_stat_127391573_9_2]
    ON [dbo].[products]([catalog_no], [product_id]);


GO

CREATE TRIGGER products_ins_upd ON dbo.products 
FOR INSERT, UPDATE
AS
BEGIN
    /* fabricate a value for clean_catalog_no from catalog_no, but
       eliminate all "non-alphanumeric" characters and spaces */

    /* local variables */
    DECLARE @clean_catalog_no VARCHAR(50)
    DECLARE @catalog_no       VARCHAR(50)
    DECLARE @product_id       VARCHAR(50)

    IF UPDATE (CATALOG_NO)
    BEGIN
        IF @@ROWCOUNT = 1
        BEGIN
            SELECT @catalog_no = catalog_no from inserted
            SELECT @product_id = product_id from inserted

            EXEC AlphaNumericOnly @catalog_no, @clean_catalog_no OUTPUT

            UPDATE products SET clean_catalog_no = @clean_catalog_no
            WHERE product_id = @product_id
        END
        ELSE
        BEGIN
            DECLARE insupd_cur CURSOR FOR
            SELECT products.catalog_no, products.product_id
            FROM products
            WHERE products.product_id IN (SELECT product_id FROM inserted)
            FOR READ ONLY

            OPEN insupd_cur
            FETCH NEXT FROM insupd_cur INTO @catalog_no, @product_id 

            WHILE @@FETCH_STATUS = 0
            BEGIN
                EXEC AlphaNumericOnly @catalog_no, @clean_catalog_no OUTPUT

                UPDATE products SET clean_catalog_no = @clean_catalog_no
                WHERE product_id = @product_id

                FETCH NEXT FROM insupd_cur INTO @catalog_no, @product_id
            END
            CLOSE insupd_cur
            DEALLOCATE insupd_cur
        END

    END

END

GO


CREATE TRIGGER [dbo].[trgDELProducts] ON [dbo].[products] 
FOR DELETE 
AS
BEGIN

	/* product id */
	INSERT INTO product_history (
		row_id,
		product_id,
		field_name,
		old_value,
		new_value,
		change_type,
		date_changed,
		changed_by)
	SELECT
		d.row_id,
		d.product_id,
		'product_id',
		convert(varchar(100),d.product_id),
		null,
		'delete',
		getdate(),
		SYSTEM_USER
	FROM
		deleted d 

	/* manufacturer id */
	INSERT INTO product_history (
		row_id,
		product_id,
		field_name,
		old_value,
		new_value,
		change_type,
		date_changed,
		changed_by)
	SELECT
		d.row_id,
		d.product_id,
		'manufacturer_id',
		convert(varchar(100),d.manufacturer_id),
		null,
		'delete',
		getdate(),
		SYSTEM_USER
	FROM
		deleted d 

	/* catalog_no */
	INSERT INTO product_history (
		row_id,
		product_id,
		field_name,
		old_value,
		new_value,
		change_type,
		date_changed,
		changed_by)
	SELECT
		d.row_id,
		d.product_id,
		'catalog_no',
		convert(varchar(100),d.catalog_no),
		null,
		'delete',
		getdate(),
		SYSTEM_USER
	FROM
		deleted d 

	/* unit of measure */
	INSERT INTO product_history (
		row_id,
		product_id,
		field_name,
		old_value,
		new_value,
		change_type,
		date_changed,
		changed_by)
	SELECT
		d.row_id,
		d.product_id,
		'unit_of_measure',
		convert(varchar(100),d.unit_of_measure),
		null,
		'delete',
		getdate(),
		SYSTEM_USER
	FROM
		deleted d 

	/* qty of eaches */
	INSERT INTO product_history (
		row_id,
		product_id,
		field_name,
		old_value,
		new_value,
		change_type,
		date_changed,
		changed_by)
	SELECT
		d.row_id,
		d.product_id,
		'qty_of_eaches_in_uom',
		convert(varchar(100),d.qty_of_eaches_in_uom),
		null,
		'delete',
		getdate(),
		SYSTEM_USER
	FROM
		deleted d 

END

GO


CREATE TRIGGER [dbo].[trgUPDProducts] ON [dbo].[products]
FOR UPDATE
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE
		p
	SET
		p.last_modified_date = GETDATE()
	FROM
		dbo.products p
		INNER JOIN inserted i
			ON p.row_id = i.row_id

    -- Only create history if old and new values are different

    /* product_id */
    IF UPDATE(product_id) BEGIN

        INSERT INTO product_history (
            row_id,
            product_id,
            field_name,
            old_value,
            new_value,
            change_type,
            date_changed,
            changed_by)
        SELECT
            i.row_id,
            i.product_id,
            'product_id',
            convert(varchar(100),d.product_id),
            convert(varchar(100),i.product_id),
            'update',
            getdate(),
            SYSTEM_USER
        FROM
            inserted i INNER JOIN deleted d
            ON i.product_id = d.product_id
        WHERE
            d.product_id COLLATE SQL_Latin1_General_CP1_CS_AS != i.product_id COLLATE SQL_Latin1_General_CP1_CS_AS
    END

    /* manufacturer_id */
    IF UPDATE(manufacturer_id) BEGIN

        INSERT INTO product_history (
            row_id,
            product_id,
            field_name,
            old_value,
            new_value,
            change_type,
            date_changed,
            changed_by)
        SELECT
            i.row_id,
            i.product_id,
            'manufacturer_id',
            convert(varchar(100),d.manufacturer_id),
            convert(varchar(100),i.manufacturer_id),
            'update',
            getdate(),
            SYSTEM_USER
        FROM
            inserted i INNER JOIN deleted d
            ON i.product_id = d.product_id
        WHERE
            d.manufacturer_id != i.manufacturer_id
    END

    /* catalog number */
    IF UPDATE(catalog_no) BEGIN

        INSERT INTO product_history (
            row_id,
            product_id,
            field_name,
            old_value,
            new_value,
            change_type,
            date_changed,
            changed_by)
        SELECT
            i.row_id,
            i.product_id,
            'catalog_no',
            convert(varchar(100),d.catalog_no),
            convert(varchar(100),i.catalog_no),
            'update',
            getdate(),
            SYSTEM_USER
        FROM
            inserted i INNER JOIN deleted d
            ON i.product_id = d.product_id
        WHERE
            d.catalog_no COLLATE SQL_Latin1_General_CP1_CS_AS != i.catalog_no COLLATE SQL_Latin1_General_CP1_CS_AS
    END

    /* unit of measure */
    IF UPDATE(unit_of_measure) BEGIN

        INSERT INTO product_history (
            row_id,
            product_id,
            field_name,
            old_value,
            new_value,
            change_type,
            date_changed,
            changed_by)
        SELECT
            i.row_id,
            i.product_id,
            'unit_of_measure',
            convert(varchar(100),d.unit_of_measure),
            convert(varchar(100),i.unit_of_measure),
            'update',
            getdate(),
            SYSTEM_USER
        FROM
            inserted i INNER JOIN deleted d
            ON i.product_id = d.product_id
        WHERE
            d.unit_of_measure COLLATE SQL_Latin1_General_CP1_CS_AS != i.unit_of_measure COLLATE SQL_Latin1_General_CP1_CS_AS
    END

    /* qyt of eaches */
    IF UPDATE(qty_of_eaches_in_uom) BEGIN

        INSERT INTO product_history (
            row_id,
            product_id,
            field_name,
            old_value,
            new_value,
            change_type,
            date_changed,
            changed_by)
        SELECT
            i.row_id,
            i.product_id,
            'qty_of_eaches_in_uom',
            convert(varchar(100),d.qty_of_eaches_in_uom),
            convert(varchar(100),i.qty_of_eaches_in_uom),
            'update',
            getdate(),
            SYSTEM_USER
        FROM
            inserted i INNER JOIN deleted d
            ON i.product_id = d.product_id
        WHERE
            d.qty_of_eaches_in_uom != i.qty_of_eaches_in_uom
    END

    /* brand name */
    IF UPDATE(brand_name) BEGIN

        INSERT INTO product_history (
            row_id,
            product_id,
            field_name,
            old_value,
            new_value,
            change_type,
            date_changed,
            changed_by)
        SELECT
            i.row_id,
            i.product_id,
            'brand_name',
            convert(varchar(100),d.brand_name),
            convert(varchar(100),i.brand_name),
            'update',
            getdate(),
            SYSTEM_USER
        FROM
            inserted i INNER JOIN deleted d
            ON i.product_id = d.product_id
        WHERE
            d.brand_name COLLATE SQL_Latin1_General_CP1_CS_AS != i.brand_name COLLATE SQL_Latin1_General_CP1_CS_AS
    END

END

GO




CREATE TRIGGER [dbo].[trgUPDProductsONtppsi] ON [dbo].[products] 
FOR UPDATE 
AS
BEGIN

/* manufacturer_id */
IF UPDATE(manufacturer_id) BEGIN

	UPDATE dbo.targeted_pi_product_set_items  
	SET
		manufacturer_id = i.manufacturer_id
	FROM dbo.targeted_pi_product_set_items tppsi
		INNER JOIN deleted d ON tppsi.manufacturer_id = d.manufacturer_id AND tppsi.product_type_id = d.product_type_id AND tppsi.catalog_no = d.catalog_no
		INNER JOIN inserted i ON i.product_id = d.product_id 	 
	WHERE
			(tppsi.manufacturer_id IS NOT NULL) 
		AND (tppsi.product_type_id IS NOT NULL) 
		AND (tppsi.brand_name IS NOT NULL) 
		AND (tppsi.catalog_no IS NOT NULL)
END

/* product_id */
IF UPDATE(product_type_id) BEGIN

	UPDATE dbo.targeted_pi_product_set_items  
	SET
		product_type_id = i.product_type_id
	FROM dbo.targeted_pi_product_set_items tppsi
		INNER JOIN deleted d ON tppsi.manufacturer_id = d.manufacturer_id AND tppsi.product_type_id = d.product_type_id AND tppsi.catalog_no = d.catalog_no
		INNER JOIN inserted i ON i.product_id = d.product_id 	 
	WHERE
			(tppsi.manufacturer_id IS NOT NULL) 
		AND (tppsi.product_type_id IS NOT NULL) 
		AND (tppsi.brand_name IS NOT NULL) 
		AND (tppsi.catalog_no IS NOT NULL)
END

/* catalog number */
IF UPDATE(catalog_no) BEGIN

	UPDATE dbo.targeted_pi_product_set_items  
	SET
		catalog_no = i.catalog_no
	FROM dbo.targeted_pi_product_set_items tppsi
		INNER JOIN deleted d ON tppsi.manufacturer_id = d.manufacturer_id AND tppsi.product_type_id = d.product_type_id AND tppsi.catalog_no = d.catalog_no
		INNER JOIN inserted i ON i.product_id = d.product_id 	 
	WHERE
			(tppsi.manufacturer_id IS NOT NULL) 
		AND (tppsi.product_type_id IS NOT NULL) 
		AND (tppsi.brand_name IS NOT NULL) 
		AND (tppsi.catalog_no IS NOT NULL)
END


END

GO



CREATE TRIGGER [dbo].[products_upd_par_lev] ON [dbo].[products]
FOR UPDATE
AS
BEGIN

/* UPDATES the manufacturer_id and catalog_no in the par_levels and cost_center_assignments tables. */

--IF @@NESTLEVEL > 1 RETURN --prevent recursion

/* if the catalog_no or manufacturer has changed */

    /* local variables */
    IF UPDATE (catalog_no) OR UPDATE(manufacturer_id) BEGIN

	DECLARE @iHolderID INT
	DECLARE @iHolderTypeID INT
	DECLARE @chOldCatalogNo VARCHAR(50)
	DECLARE @iOldManufacturerId INT
	DECLARE @chNewCatalogNo VARCHAR(50)
	DECLARE @iNewManufacturerId INT
	DECLARE @chUOM VARCHAR(4)
	DECLARE @iqtyofeaches INT

	DECLARE upd_cur CURSOR LOCAL FOR

		SELECT DISTINCT
			inserted.catalog_no AS new_catalog_no,
			inserted.manufacturer_id AS new_manufacturer_id,
			deleted.catalog_no AS old_catalog_no,
			deleted.manufacturer_id AS old_manufacturer_id,
			inserted.unit_of_measure as new_uom,
			inserted.qty_of_eaches_in_uom as new_qty
		FROM 
			inserted
			INNER JOIN deleted ON inserted.row_id = deleted.row_id

	OPEN upd_cur

        FETCH NEXT FROM upd_cur INTO @chNewCatalogNo, @iNewManufacturerID, @chOldCatalogNo, @iOldManufacturerID, @chUOM, @iqtyofeaches

	WHILE @@FETCH_STATUS = 0 BEGIN

	        IF @chNewCatalogNo = @chOldCatalogNo AND @iNewManufacturerID = @iOldManufacturerID BEGIN
			--nothing to do
	        FETCH NEXT FROM upd_cur INTO @chNewCatalogNo, @iNewManufacturerID, @chOldCatalogNo, @iOldManufacturerID, @chUOM, @iqtyofeaches
			PRINT 'new cat=' + @chNewCatalogNo + ' new mfg id=' + convert(varchar(20),@iNewManufacturerID) + ' old cat=' + @chOldCatalogNo + ' old mfg=' + convert(varchar(20),@iOldManufacturerID)

			CONTINUE
		END


		--walk par_levels in a cursor for each holder/holder_type having the old catalog_no and manufacturer_id
		DECLARE par_cur CURSOR LOCAL FOR
	
			SELECT DISTINCT
				holder_id,
				holder_type_id
			FROM
				par_levels
			WHERE
				catalog_no = @chOldCatalogNo AND
				manufacturer_id = @iOldManufacturerID

		OPEN par_cur
			
		FETCH NEXT FROM par_cur INTO @iHolderID, @iHolderTypeID	

		WHILE @@FETCH_STATUS = 0 BEGIN
			
			--we've determined that this holder_id HAS the OLD catalog_no and manufacturer_id
			--now, determine whether the holder also has the NEW catalog_no and manufacturer_id
			--if so, DELETE the old one and keep the new one
			IF EXISTS(
				SELECT *
				FROM
					par_levels pl
				WHERE
					pl.catalog_no = @chNewCatalogNo AND
					pl.manufacturer_id = @iNewManufacturerID AND
					pl.holder_id = @iHolderID AND
					pl.holder_type_id = @iHolderTypeID)
			BEGIN
				--this holder has the old cat/mfgr AND the new, 
				--so DELETE THE OLD one (we want to keep only the new, 
				--plus we would violate the constraint by creating a duplicate record)
				DELETE FROM
					par_levels
				WHERE
					catalog_no = @chOldCatalogNo AND
					manufacturer_id = @iOldManufacturerID AND
					holder_id = @iHolderID AND
					holder_type_id = @iHolderTypeID

				FETCH NEXT FROM par_cur INTO @iHolderID, @iHolderTypeID	
				
				CONTINUE
			END
			
			--ok, we now know that:
			--1. This holder/type has the old catalog_no and manufacturer_id in par_levels
			--2. The old catalog_no and manufacturer_id are not the same as the new catalog_no and manufacturer_id 
			--3. There is no row in par_levels for this holder matching the new catalog_no and manufacturer_id
			
			--so, update the (old) par_levels.catalog_no and par_levels.manufacturer_id (to the new) for this holder_id
			UPDATE
				par_levels
			SET
				catalog_no = @chNewCatalogNo,
				manufacturer_id = @iNewManufacturerID
			WHERE
				catalog_no = @chOldCatalogNo AND
				manufacturer_id = @iOldManufacturerID AND
				holder_id = @iHolderID AND
				holder_type_id = @iHolderTypeID

	
			FETCH NEXT FROM par_cur INTO @iHolderID, @iHolderTypeID	
		END		

		CLOSE par_cur
		DEALLOCATE par_cur

		--================================
		--<UPDATE COST CENTERS>
		--================================
		--walk par_levels in a cursor for each holder/holder_type having the old catalog_no and manufacturer_id
		DECLARE cc_cur CURSOR LOCAL FOR
	
			SELECT DISTINCT
				department_id
			FROM
				cost_center_assignments
			WHERE
				catalog_no = @chOldCatalogNo AND
				manufacturer_id = @iOldManufacturerID

		OPEN cc_cur
			
		FETCH NEXT FROM cc_cur INTO @iHolderID	

		WHILE @@FETCH_STATUS = 0 BEGIN
			
			--we've determined that this department HAS the OLD catalog_no and manufacturer_id
			--now, determine whether the holder also has the NEW catalog_no and manufacturer_id
			--if so, DELETE the old one and keep the new one
			IF EXISTS(
				SELECT *
				FROM
					cost_center_assignments cc
				WHERE
					cc.catalog_no = @chNewCatalogNo AND
					cc.manufacturer_id = @iNewManufacturerID AND
					cc.department_id = @iHolderID)
			BEGIN
				--this holder has the old cat/mfgr AND the new, 
				--so DELETE THE OLD one (we want to keep only the new, 
				--plus we would violate the constraint by creating a duplicate record)
				DELETE FROM
					cost_center_assignments
				WHERE
					catalog_no = @chOldCatalogNo AND
					manufacturer_id = @iOldManufacturerID AND
					department_id = @iHolderID

				FETCH NEXT FROM cc_cur INTO @iHolderID
				
				CONTINUE
			END
			
			--ok, we now know that:
			--1. This holder/type has the old catalog_no and manufacturer_id in cost_center_assignments
			--2. The old catalog_no and manufacturer_id are not the same as the new catalog_no and manufacturer_id 
			--3. There is no row in cost_center_assignments for this department matching the new catalog_no and manufacturer_id
			
			--so, update the (old) cost_center_assignments.catalog_no and cost_center_assignments.manufacturer_id (to the new) for this department_id
			UPDATE
				cost_center_assignments
			SET
				catalog_no = @chNewCatalogNo,
				manufacturer_id = @iNewManufacturerID
			WHERE
				catalog_no = @chOldCatalogNo AND
				manufacturer_id = @iOldManufacturerID AND
				department_id = @iHolderID
	
			FETCH NEXT FROM cc_cur INTO @iHolderID
		END		

		CLOSE cc_cur
		DEALLOCATE cc_cur

		--================================
		--</UPDATE COST CENTERS>
		--===============================

		--11/13/06
		--================================
		--<UPDATE MIN_ORDER_QTY>
		--================================
		--walk par_levels in a cursor for each holder/holder_type having the old catalog_no and manufacturer_id
		DECLARE mq_cur CURSOR LOCAL FOR
	
			SELECT DISTINCT
				department_id
			FROM
				min_order_qty
			WHERE
				catalog_no = @chOldCatalogNo AND
				manufacturer_id = @iOldManufacturerID --AND
				--min_order_unit = @chUOM AND
				--qty_of_eaches_in_mou = @iqtyofeaches

		OPEN mq_cur
			
		FETCH NEXT FROM mq_cur INTO @iHolderID	

		WHILE @@FETCH_STATUS = 0 BEGIN
			
			--we've determined that this department HAS the OLD catalog_no and manufacturer_id
			--now, determine whether the holder also has the NEW catalog_no and manufacturer_id
			--if so, DELETE the old one and keep the new one
			IF EXISTS(
				SELECT *
				FROM
					min_order_qty mq
				WHERE
					mq.catalog_no = @chNewCatalogNo AND
					mq.manufacturer_id = @iNewManufacturerID AND
					mq.department_id = @iHolderID --AND
					--mq.min_order_unit = @chUOM AND
					--mq.qty_of_eaches_in_mou = @iqtyofeaches
			)
			BEGIN
				--this holder has the old cat/mfgr AND the new, 
				--so DELETE THE OLD one (we want to keep only the new, 
				--plus we would violate the constraint by creating a duplicate record)
				DELETE FROM
					min_order_qty
				WHERE
					catalog_no = @chOldCatalogNo AND
					manufacturer_id = @iOldManufacturerID AND
					department_id = @iHolderID --AND
					--min_order_unit = @chUOM AND
					--qty_of_eaches_in_mou = @iqtyofeaches

				FETCH NEXT FROM mq_cur INTO @iHolderID
				
				CONTINUE
			END
			
			--ok, we now know that:
			--1. This holder/type has the old catalog_no and manufacturer_id in min_order_qty
			--2. The old catalog_no and manufacturer_id are not the same as the new catalog_no and manufacturer_id 
			--3. There is no row in min_order_qty for this department matching the new catalog_no and manufacturer_id
			
			--so, update the (old) min_order_qty.catalog_no and min_order_qty.manufacturer_id (to the new) for this department_id
			UPDATE
				min_order_qty
			SET
				catalog_no = @chNewCatalogNo,
				manufacturer_id = @iNewManufacturerID
			WHERE
				catalog_no = @chOldCatalogNo AND
				manufacturer_id = @iOldManufacturerID AND
				department_id = @iHolderID --AND
				--min_order_unit = @chUOM AND
				--qty_of_eaches_in_mou = @iqtyofeaches
	
			FETCH NEXT FROM mq_cur INTO @iHolderID
		END		

		CLOSE mq_cur
		DEALLOCATE mq_cur

		--================================
		--</UPDATE MIN_ORDER_QTY>
		--===============================

		--================================
		--<UPDATE PRODUCT TABLE GAPS>
		--================================
		--walk par_levels in a cursor for each holder/holder_type having the old catalog_no and manufacturer_id
		DECLARE pg_cur CURSOR LOCAL FOR
	
			SELECT DISTINCT
				holder_id
			FROM
				product_table_gaps
			WHERE
				catalog_no = @chOldCatalogNo AND
				manufacturer_id = @iOldManufacturerID

		OPEN pg_cur
			
		FETCH NEXT FROM pg_cur INTO @iHolderID	

		WHILE @@FETCH_STATUS = 0 BEGIN
			
			--we've determined that this department HAS the OLD catalog_no and manufacturer_id
			--now, determine whether the holder also has the NEW catalog_no and manufacturer_id
			--if so, DELETE the old one and keep the new one
			IF EXISTS(
				SELECT *
				FROM
					product_table_gaps pg
				WHERE
					pg.catalog_no = @chNewCatalogNo AND
					pg.manufacturer_id = @iNewManufacturerID AND
					pg.holder_id = @iHolderID)
			BEGIN
				--this holder has the old cat/mfgr AND the new, 
				--so DELETE THE OLD one (we want to keep only the new, 
				--plus we would violate the constraint by creating a duplicate record)
				DELETE FROM
					product_table_gaps
				WHERE
					catalog_no = @chOldCatalogNo AND
					manufacturer_id = @iOldManufacturerID AND
					holder_id = @iHolderID

				FETCH NEXT FROM pg_cur INTO @iHolderID
				
				CONTINUE
			END
			
			--ok, we now know that:
			--1. This holder/type has the old catalog_no and manufacturer_id in product_table_gaps
			--2. The old catalog_no and manufacturer_id are not the same as the new catalog_no and manufacturer_id 
			--3. There is no row in product_table_gaps for this department matching the new catalog_no and manufacturer_id
			
			--so, update the (old) cost_center_assignments.catalog_no and cost_center_assignments.manufacturer_id (to the new) for this department_id
			UPDATE
				product_table_gaps
			SET
				catalog_no = @chNewCatalogNo,
				manufacturer_id = @iNewManufacturerID
			WHERE
				catalog_no = @chOldCatalogNo AND
				manufacturer_id = @iOldManufacturerID AND
				holder_id = @iHolderID
	
			FETCH NEXT FROM pg_cur INTO @iHolderID
		END		

		CLOSE pg_cur
		DEALLOCATE pg_cur

		--================================
		--</UPDATE PRODUCT TABLE GAPS>
		--===============================


		--1-10-2005
		--================================
		--<UPDATE  PAR_LEVEL_CHANGE_HISTORY>
		--================================
		UPDATE
			par_level_change_history
		SET
			catalog_no = @chNewCatalogNo,
			manufacturer_id = @iNewManufacturerID
		WHERE
			catalog_no = @chOldCatalogNo AND
			manufacturer_id = @iOldManufacturerID
	
		--================================
		--</UPDATE  PAR_LEVEL_CHANGE_HISTORY>
		--================================
	       FETCH NEXT FROM upd_cur INTO @chNewCatalogNo, @iNewManufacturerID, @chOldCatalogNo, @iOldManufacturerID, @chUOM, @iqtyofeaches
	END

	CLOSE upd_cur
	DEALLOCATE upd_cur

    END

END

GO


CREATE TRIGGER [dbo].[trgINSProducts] ON [dbo].[products] 
FOR INSERT
AS

BEGIN

/* product id */
IF UPDATE(product_id) 

	BEGIN
		INSERT INTO product_history (
			row_id,
			product_id,
			field_name,
			old_value,
			new_value,
			change_type,
			date_changed,
			changed_by)
		SELECT
			i.row_id,
			i.product_id,
			'product_id',
			null,
			convert(varchar(100),i.product_id),
			'insert',
			getdate(),
			SYSTEM_USER
		FROM
			inserted i 
	END

/* Manufacturer */
IF UPDATE(manufacturer_id) 

	BEGIN
		INSERT INTO product_history (
			row_id,
			product_id,
			field_name,
			old_value,
			new_value,
			change_type,
			date_changed,
			changed_by)
		SELECT
			i.row_id,
			i.product_id,
			'manufacturer_id',
			null,
			convert(varchar(100),i.manufacturer_id),
			'insert',
			getdate(),
			SYSTEM_USER
		FROM
			inserted i 
	END


/* Catalog Number */
IF UPDATE(catalog_no) 

	BEGIN
		INSERT INTO product_history (
			row_id,
			product_id,
			field_name,
			old_value,
			new_value,
			change_type,
			date_changed,
			changed_by)
		SELECT
			i.row_id,
			i.product_id,
			'catalog_no',
			null,
			convert(varchar(100),i.catalog_no),
			'insert',
			getdate(),
			SYSTEM_USER
		FROM
			inserted i 
	END

/* Unit of Measure */
IF UPDATE(unit_of_measure) 

	BEGIN
		INSERT INTO product_history (
			row_id,
			product_id,
			field_name,
			old_value,
			new_value,
			change_type,
			date_changed,
			changed_by)
		SELECT
			i.row_id,
			i.product_id,
			'unit_of_measure',
			null,
			convert(varchar(100),i.unit_of_measure),
			'insert',
			getdate(),
			SYSTEM_USER
		FROM
			inserted i 
	END

/* Qty of Eaches */
IF UPDATE(qty_of_eaches_in_UOM) 

	BEGIN
		INSERT INTO product_history (
			row_id,
			product_id,
			field_name,
			old_value,
			new_value,
			change_type,
			date_changed,
			changed_by)
		SELECT
			i.row_id,
			i.product_id,
			'qty_of_eaches_in_UOM',
			null,
			convert(varchar(100),i.qty_of_eaches_in_UOM),
			'insert',
			getdate(),
			SYSTEM_USER
		FROM
			inserted i 
	END

END

GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'user_id of the user who created the record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'products', @level2type = N'COLUMN', @level2name = N'user_id';


GO

