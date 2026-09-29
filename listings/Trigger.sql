CREATE   TRIGGER trg_prodotti_update
ON [dbo].[prodotti]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[prodotti_backup] (
        [pro_id], [pro_descrizione], [pro_codice], [pro_prezzo], 
        [pro_potenza_installata], [pro_aria_compressa], [pro_peso_a_vuoto], 
        [pro_volume], [pro_flag_ricambio], [pro_flag_obsoleto], 
        [pro_tipo], [pro_tipo_merceologia], [pro_note], 
        [synced_on], [creation_date], [creation_user], 
        [last_edit_date], [last_edit_user], [deleted]
    )
    SELECT 
        [pro_id], [pro_descrizione], [pro_codice], [pro_prezzo], 
        [pro_potenza_installata], [pro_aria_compressa], [pro_peso_a_vuoto], 
        [pro_volume], [pro_flag_ricambio], [pro_flag_obsoleto], 
        [pro_tipo], [pro_tipo_merceologia], [pro_note], 
        [synced_on], [creation_date], [creation_user], 
        [last_edit_date], [last_edit_user], [deleted]
    FROM deleted;
END;