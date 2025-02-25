CREATE TABLE [dbo].[unit_types] (
    [unit_type_id]        INT          IDENTITY (6, 1) NOT FOR REPLICATION NOT NULL,
    [unit_type]           VARCHAR (50) NULL,
    [measurement_type_id] INT          NULL,
    [last_modified_date]  DATETIME     DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_unit_types] PRIMARY KEY NONCLUSTERED ([unit_type_id] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE NONCLUSTERED INDEX [IX_ut_unit_type_id]
    ON [dbo].[unit_types]([unit_type_id] ASC) WITH (FILLFACTOR = 90);


GO


CREATE TRIGGER [dbo].[trgUPDUnitTypes] 
	ON unit_types 
FOR UPDATE 
AS

SET NOCOUNT ON

	UPDATE 
		ut
	SET
		ut.last_modified_date = GETDATE()
	FROM
		dbo.unit_types ut
		INNER JOIN inserted i
			ON ut.unit_type_id = i.unit_type_id

GO

