CREATE TABLE banche (
    ban_id INTEGER NOT NULL,
    PRIMARY KEY (ban_id)
);

CREATE TABLE corrieri (
    cor_id INTEGER NOT NULL,
    PRIMARY KEY (cor_id)
);

CREATE TABLE zone (
    zon_id INTEGER NOT NULL,
    PRIMARY KEY (zon_id)
);

CREATE TABLE lingue (
    lin_id INTEGER NOT NULL,
    PRIMARY KEY (lin_id)
);

CREATE TABLE condizioni (
    con_id INTEGER NOT NULL,
    PRIMARY KEY (con_id)
);

CREATE TABLE montaggi (
    mon_id INTEGER NOT NULL,
    PRIMARY KEY (mon_id)
);

CREATE TABLE sconti (
    sco_id INTEGER NOT NULL,
    PRIMARY KEY (sco_id)
);

CREATE TABLE tabelle (
    tab_id INTEGER NOT NULL,
    PRIMARY KEY (tab_id)
);

CREATE TABLE tipi_capitolo (
    tcp_id INTEGER NOT NULL,
    PRIMARY KEY (tcp_id)
);

CREATE TABLE tipi_causale (
    tca_id INTEGER NOT NULL,
    PRIMARY KEY (tca_id)
);

CREATE TABLE tipi_cliente (
    tcl_id INTEGER NOT NULL,
    PRIMARY KEY (tcl_id)
);

CREATE TABLE tipi_contropartita (
    tco_id INTEGER NOT NULL,
    PRIMARY KEY (tco_id)
);

CREATE TABLE tipi_documento (
    tdo_id INTEGER NOT NULL,
    PRIMARY KEY (tdo_id)
);

CREATE TABLE tipi_garanzia (
    tga_id INTEGER NOT NULL,
    PRIMARY KEY (tga_id)
);

CREATE TABLE tipi_imballo (
    tim_id INTEGER NOT NULL,
    PRIMARY KEY (tim_id)
);

CREATE TABLE tipi_impianto (
    tip_id INTEGER NOT NULL,
    PRIMARY KEY (tip_id)
);

CREATE TABLE tipi_merceologia (
    tme_id INTEGER NOT NULL,
    PRIMARY KEY (tme_id)
);

CREATE TABLE tipi_norme_elettriche (
    tne_id INTEGER NOT NULL,
    PRIMARY KEY (tne_id)
);

CREATE TABLE tipi_operatore (
    top_id INTEGER NOT NULL,
    PRIMARY KEY (top_id)
);

CREATE TABLE tipi_operatore_logico (
    tol_id INTEGER NOT NULL,
    PRIMARY KEY (tol_id)
);

CREATE TABLE tipi_pagamento (
    tpg_id INTEGER NOT NULL,
    PRIMARY KEY (tpg_id)
);

CREATE TABLE tipi_percentuale_agente (
    tpa_id INTEGER NOT NULL,
    PRIMARY KEY (tpa_id)
);

CREATE TABLE tipi_prodotto (
    tpo_id INTEGER NOT NULL,
    PRIMARY KEY (tpo_id)
);

CREATE TABLE tipi_proprieta (
    tpr_id INTEGER NOT NULL,
    PRIMARY KEY (tpr_id)
);

CREATE TABLE tipi_resa (
    tre_id INTEGER NOT NULL,
    PRIMARY KEY (tre_id)
);

CREATE TABLE tipi_stato_offerta (
    tso_id INTEGER NOT NULL,
    PRIMARY KEY (tso_id)
);

CREATE TABLE tipi_utente (
    tut_id INTEGER NOT NULL,
    PRIMARY KEY (tut_id)
);

CREATE TABLE tipi_valuta (
    tva_id INTEGER NOT NULL,
    PRIMARY KEY (tva_id)
);

CREATE TABLE tipi_vendita (
    tve_id INTEGER NOT NULL,
    PRIMARY KEY (tve_id)
);

CREATE TABLE banche_sedi (
    bse_id INTEGER NOT NULL,
    bse_banca INTEGER,
    PRIMARY KEY (bse_id),
    FOREIGN KEY (bse_banca) REFERENCES banche (ban_id)
);

CREATE TABLE nazioni (
    naz_id INTEGER NOT NULL,
    naz_norma_elettrica INTEGER,
    naz_contropartita INTEGER,
    PRIMARY KEY (naz_id),
    FOREIGN KEY (naz_norma_elettrica) REFERENCES tipi_norme_elettriche (tne_id),
    FOREIGN KEY (naz_contropartita) REFERENCES tipi_contropartita (tco_id)
);

CREATE TABLE utenti (
    ute_id INTEGER NOT NULL,
    ute_tipo INTEGER,
    ute_zona INTEGER,
    PRIMARY KEY (ute_id),
    FOREIGN KEY (ute_tipo) REFERENCES tipi_utente (tut_id),
    FOREIGN KEY (ute_zona) REFERENCES zone (zon_id)
);

CREATE TABLE condizioni_lingue (
    cln_id INTEGER NOT NULL,
    cln_condizione INTEGER,
    cln_lingua INTEGER,
    PRIMARY KEY (cln_id),
    FOREIGN KEY (cln_condizione) REFERENCES condizioni (con_id),
    FOREIGN KEY (cln_lingua) REFERENCES lingue (lin_id)
);

CREATE TABLE montaggi_operatori (
    mop_id INTEGER NOT NULL,
    mop_montaggio INTEGER,
    mop_tipo_operatore INTEGER,
    mop_nazione INTEGER,
    PRIMARY KEY (mop_id),
    FOREIGN KEY (mop_montaggio) REFERENCES montaggi (mon_id),
    FOREIGN KEY (mop_tipo_operatore) REFERENCES tipi_operatore (top_id),
    FOREIGN KEY (mop_nazione) REFERENCES nazioni (naz_id)
);

CREATE TABLE prodotti (
    pro_id INTEGER NOT NULL,
    pro_tipo INTEGER,
    pro_tipo_merceologia INTEGER,
    PRIMARY KEY (pro_id),
    FOREIGN KEY (pro_tipo) REFERENCES tipi_prodotto (tpo_id),
    FOREIGN KEY (pro_tipo_merceologia) REFERENCES tipi_merceologia (tme_id)
);

CREATE TABLE proprieta (
    prp_id INTEGER NOT NULL,
    prp_tipo INTEGER,
    PRIMARY KEY (prp_id),
    FOREIGN KEY (prp_tipo) REFERENCES tipi_proprieta (tpr_id)
);

CREATE TABLE feedback (
    fee_id INTEGER NOT NULL,
    fee_utente INTEGER,
    PRIMARY KEY (fee_id),
    FOREIGN KEY (fee_utente) REFERENCES utenti (ute_id)
);

CREATE TABLE notifiche (
    not_id INTEGER NOT NULL,
    not_utente INTEGER,
    PRIMARY KEY (not_id),
    FOREIGN KEY (not_utente) REFERENCES utenti (ute_id)
);

CREATE TABLE clienti (
    cli_id INTEGER NOT NULL,
    cli_banca_sede INTEGER,
    cli_corriere INTEGER,
    cli_nazione INTEGER,
    cli_tipo INTEGER,
    cli_imballo INTEGER,
    cli_tipo_resa INTEGER,
    cli_riferimento_esterno INTEGER,
    cli_riferimento_interno INTEGER,
    cli_zona INTEGER,
    cli_cliente_padre INTEGER,
    cli_tipo_valuta INTEGER,
    PRIMARY KEY (cli_id),
    FOREIGN KEY (cli_banca_sede) REFERENCES banche_sedi (bse_id),
    FOREIGN KEY (cli_corriere) REFERENCES corrieri (cor_id),
    FOREIGN KEY (cli_nazione) REFERENCES nazioni (naz_id),
    FOREIGN KEY (cli_tipo) REFERENCES tipi_cliente (tcl_id),
    FOREIGN KEY (cli_imballo) REFERENCES tipi_imballo (tim_id),
    FOREIGN KEY (cli_tipo_resa) REFERENCES tipi_resa (tre_id),
    FOREIGN KEY (cli_riferimento_esterno) REFERENCES utenti (ute_id),
    FOREIGN KEY (cli_riferimento_interno) REFERENCES utenti (ute_id),
    FOREIGN KEY (cli_zona) REFERENCES zone (zon_id),
    FOREIGN KEY (cli_cliente_padre) REFERENCES clienti (cli_id),
    FOREIGN KEY (cli_tipo_valuta) REFERENCES tipi_valuta (tva_id)
);

CREATE TABLE proprieta_valori (
    pva_id INTEGER NOT NULL,
    pva_proprieta INTEGER,
    PRIMARY KEY (pva_id),
    FOREIGN KEY (pva_proprieta) REFERENCES proprieta (prp_id)
);

CREATE TABLE prodotti_composizioni (
    pco_id INTEGER NOT NULL,
    pco_padre INTEGER,
    pco_figlio INTEGER,
    PRIMARY KEY (pco_id),
    FOREIGN KEY (pco_padre) REFERENCES prodotti (pro_id),
    FOREIGN KEY (pco_figlio) REFERENCES prodotti (pro_id)
);

CREATE TABLE prodotti_lingue (
    pli_id INTEGER NOT NULL,
    pli_prodotto INTEGER,
    pli_lingua INTEGER,
    PRIMARY KEY (pli_id),
    FOREIGN KEY (pli_prodotto) REFERENCES prodotti (pro_id),
    FOREIGN KEY (pli_lingua) REFERENCES lingue (lin_id)
);

CREATE TABLE prodotti_proprieta (
    ppr_id INTEGER NOT NULL,
    ppr_prodotto INTEGER,
    ppr_proprieta INTEGER,
    PRIMARY KEY (ppr_id),
    FOREIGN KEY (ppr_prodotto) REFERENCES prodotti (pro_id),
    FOREIGN KEY (ppr_proprieta) REFERENCES proprieta (prp_id)
);

CREATE TABLE clienti_destinazioni (
    cde_id INTEGER NOT NULL,
    cde_cliente INTEGER NOT NULL,
    cde_tipo INTEGER,
    cde_zona INTEGER NOT NULL,
    cde_nazione INTEGER NOT NULL,
    cde_norma_elettrica INTEGER NOT NULL,
    PRIMARY KEY (cde_id),
    FOREIGN KEY (cde_cliente) REFERENCES clienti (cli_id),
    FOREIGN KEY (cde_nazione) REFERENCES nazioni (naz_id),
    FOREIGN KEY (cde_tipo) REFERENCES tipi_cliente (tcl_id),
    FOREIGN KEY (cde_norma_elettrica) REFERENCES tipi_norme_elettriche (tne_id),
    FOREIGN KEY (cde_zona) REFERENCES zone (zon_id)
);

CREATE TABLE regole (
    reg_id INTEGER NOT NULL,
    reg_prodotto_composizione INTEGER,
    reg_proprieta INTEGER,
    reg_operatore_logico INTEGER,
    PRIMARY KEY (reg_id),
    FOREIGN KEY (reg_prodotto_composizione) REFERENCES prodotti_composizioni (pco_id),
    FOREIGN KEY (reg_proprieta) REFERENCES proprieta (prp_id),
    FOREIGN KEY (reg_operatore_logico) REFERENCES tipi_operatore_logico (tol_id)
);

CREATE TABLE documenti (
    doc_id INTEGER NOT NULL,
    doc_documento_padre INTEGER,
    doc_autore INTEGER,
    doc_cliente INTEGER,
    doc_utilizzatore INTEGER,
    doc_cliente_destinazione INTEGER,
    doc_corriere INTEGER,
    doc_stato INTEGER,
    doc_montaggio INTEGER,
    doc_tipo_documento INTEGER,
    doc_tipo_impianto INTEGER,
    doc_tipo_imballo INTEGER,
    doc_tipo_resa INTEGER,
    doc_tipo_vendita INTEGER,
    doc_commerciale_riferimento INTEGER,
    doc_causale INTEGER,
    doc_banca_sede INTEGER,
    PRIMARY KEY (doc_id),
    FOREIGN KEY (doc_documento_padre) REFERENCES documenti (doc_id),
    FOREIGN KEY (doc_autore) REFERENCES utenti (ute_id),
    FOREIGN KEY (doc_cliente) REFERENCES clienti (cli_id),
    FOREIGN KEY (doc_utilizzatore) REFERENCES clienti (cli_id),
    FOREIGN KEY (doc_cliente_destinazione) REFERENCES clienti_destinazioni (cde_id),
    FOREIGN KEY (doc_corriere) REFERENCES corrieri (cor_id),
    FOREIGN KEY (doc_stato) REFERENCES tipi_stato_offerta (tso_id),
    FOREIGN KEY (doc_montaggio) REFERENCES montaggi (mon_id),
    FOREIGN KEY (doc_tipo_documento) REFERENCES tipi_documento (tdo_id),
    FOREIGN KEY (doc_tipo_impianto) REFERENCES tipi_impianto (tip_id),
    FOREIGN KEY (doc_tipo_imballo) REFERENCES tipi_imballo (tim_id),
    FOREIGN KEY (doc_tipo_resa) REFERENCES tipi_resa (tre_id),
    FOREIGN KEY (doc_tipo_vendita) REFERENCES tipi_vendita (tve_id),
    FOREIGN KEY (doc_commerciale_riferimento) REFERENCES utenti (ute_id),
    FOREIGN KEY (doc_causale) REFERENCES tipi_causale (tca_id),
    FOREIGN KEY (doc_banca_sede) REFERENCES banche_sedi (bse_id)
);

CREATE TABLE documenti_lingue (
    dli_id INTEGER NOT NULL,
    dli_documento INTEGER NOT NULL,
    dli_lingua_contratto INTEGER,
    dli_lingua_documenti_interni INTEGER,
    dli_lingua_manuale INTEGER,
    dli_lingua_centraline INTEGER,
    dli_lingua_supervisore INTEGER,
    dli_lingua_etichette INTEGER,
    PRIMARY KEY (dli_id),
    FOREIGN KEY (dli_documento) REFERENCES documenti (doc_id),
    FOREIGN KEY (dli_lingua_contratto) REFERENCES lingue (lin_id),
    FOREIGN KEY (dli_lingua_documenti_interni) REFERENCES lingue (lin_id),
    FOREIGN KEY (dli_lingua_manuale) REFERENCES lingue (lin_id),
    FOREIGN KEY (dli_lingua_centraline) REFERENCES lingue (lin_id),
    FOREIGN KEY (dli_lingua_supervisore) REFERENCES lingue (lin_id),
    FOREIGN KEY (dli_lingua_etichette) REFERENCES lingue (lin_id)
);

CREATE TABLE documenti_righe (
    dri_id INTEGER NOT NULL,
    dri_documento INTEGER,
    dri_prodotto INTEGER,
    dri_tipo_capitolo INTEGER,
    PRIMARY KEY (dri_id),
    FOREIGN KEY (dri_documento) REFERENCES documenti (doc_id),
    FOREIGN KEY (dri_prodotto) REFERENCES prodotti (pro_id),
    FOREIGN KEY (dri_tipo_capitolo) REFERENCES tipi_capitolo (tcp_id)
);