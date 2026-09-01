# Entity-Relationship Diagram

```mermaid
erDiagram

    erDiagram

    %% ===== BANCHE E SEDI =====
    BANCHE ||--o{ BANCHE_SEDI : ha_sedi
    BANCHE_SEDI |o--o{ CLIENTI : banca_appoggio
    BANCHE_SEDI ||--o{ DOCUMENTI : appoggio_bancario
    
    %% ===== CLIENTI (Core) =====
    ZONE ||--o{ CLIENTI : appartiene_zona
    NAZIONI ||--o{ CLIENTI : risiede_nazione
    NAZIONI ||--o{ TIPI_CONTROPARTITA : associata_a
    TIPI_CLIENTE ||--o{ CLIENTI : e_di_tipo
    CLIENTI ||--|| CLIENTI : cliente_padre
    UTENTI |o--o{ CLIENTI : riferimento_interno
    UTENTI |o--o{ CLIENTI : riferimento_esterno
    CLIENTI ||--o{ CLIENTI_DESTINAZIONI : ha_destinazioni
    CLIENTI_DESTINAZIONI ||--o{ DOCUMENTI : spedito_a
    
    %% ===== UTENTI =====
    TIPI_UTENTE ||--o{ UTENTI : categorizza
    TIPI_PERCENTUALE_AGENTE ||--o{ UTENTI : assegna_percentuale
    UTENTI ||--o{ FEEDBACK : invia
    UTENTI ||--o{ NOTIFICHE : riceve
    
    %% ===== PRODOTTI =====
    TIPI_MERCEOLOGIA ||--o{ PRODOTTI : categoria
    PRODOTTI ||--o{ PRODOTTI_LINGUE : ha_traduzioni
    LINGUE ||--o{ PRODOTTI_LINGUE : lingua
    PRODOTTI ||--o{ PRODOTTI_PROPRIETA : possiede
    PROPRIETA ||--o{ PRODOTTI_PROPRIETA : assegnata
    TIPI_PROPRIETA ||--o{ PROPRIETA : categorizza
    PRODOTTI ||--o{ DOCUMENTI_RIGHE : riferito_a
    
    %% ===== CONDIZIONI E LINGUE =====
    LINGUE ||--o{ CONDIZIONI_LINGUE : traduce_condizioni
    LINGUE ||--o{ DOCUMENTI_LINGUE : traduce_documenti
    LINGUE ||--o{ DOCUMENTI : lingua_manuale
    
    %% ===== DOCUMENTI (Core) =====
    DOCUMENTI ||--|| DOCUMENTI : documento_padre
    CLIENTI ||--o{ DOCUMENTI : genera
    CORRIERI ||--o{ DOCUMENTI : tramite_corriere
    TIPI_DOCUMENTO ||--o{ DOCUMENTI : tipo_doc
    TIPI_STATO_OFFERTA ||--o{ DOCUMENTI : in_stato
    TIPI_VENDITA ||--o{ DOCUMENTI : venduto_come
    TIPI_IMBALLO ||--o{ DOCUMENTI : spedito_con
    TIPI_CAUSALE ||--o{ DOCUMENTI : catalogato_come
    TIPI_IMPIANTO ||--o{ DOCUMENTI : impianto_tipo
    
    %% ===== DOCUMENTI_RIGHE =====
    DOCUMENTI ||--o{ DOCUMENTI_RIGHE : contiene_righe
    DOCUMENTI_RIGHE ||--o{ TIPI_CAPITOLO : riferito_a
    
    %% ===== MONTAGGI =====
    DOCUMENTI ||--o{ MONTAGGI : offerta_associata
    MONTAGGI ||--o{ MONTAGGI_OPERATORI : include_operatori
    TIPI_OPERATORE ||--o{ MONTAGGI_OPERATORI : con_ruolo
    NAZIONI ||--o{ MONTAGGI_OPERATORI : da_nazione

    %% --- DEFINIZIONE TABELLE E COLONNE PRINCIPALI ---

    BANCHE {
        int ban_id PK
        nvarchar ban_sigla
        nvarchar ban_nome
        nvarchar ban_abi
        nvarchar ban_note
    }

    BANCHE_SEDI {
        int bse_id PK
        int bse_banca FK
        nvarchar bse_agenzia
        nvarchar bse_cab
        nvarchar bse_conto_corrente
        nvarchar bse_iban
        bit bse_flag_cepi
        nvarchar bse_note
    }

    CLIENTI {
        int cli_id PK
        nvarchar cli_codice_adhoc
        nvarchar cli_contatto
        nvarchar cli_posizione
        nvarchar cli_indirizzo
        nvarchar cli_citta
        int cli_zona FK
        int cli_nazione FK
        int cli_banca_sede FK
        float cli_sconto
        int cli_tipo FK
        int cli_cliente_padre FK
        bit cli_flag_rischio_cliente
        nvarchar cli_short_name
        nvarchar cli_note
    }

    CLIENTI_DESTINAZIONI {
        int cde_id PK
        int cde_cliente FK
        int cde_tipo
        nvarchar cde_descrizione
        nvarchar cde_indirizzo
        int cde_monofase
        int cde_trifase
        int cde_frequenza
        nvarchar cde_zona
    }

    CONDIZIONI {
        int con_id PK
        nvarchar con_descrizione
    }

    CONDIZIONI_LINGUE {
        int cln_id PK
        int cln_condizione FK
        int cln_lingua FK
        nvarchar cln_descrizione
        nvarchar cln_note
    }



    CONVERSIONE_VALUTA {
        int cva_id PK
        float cva_euro
        float cva_dollaro
        float cva_rublo
        float cva_sterlina
    }

    CORRIERI {
        int cor_id PK
        nvarchar con_sigla
        nvarchar con_nome
        nvarchar con_condizioni_consegna
    }

    DOCUMENTI {
        int doc_id PK
        int doc_cliente FK
        int doc_documento_padre FK
        int doc_banca_sede FK
        int doc_destinazione FK
        int doc_corriere FK
        int doc_tipo FK
        int doc_stato FK
        int doc_tipo_resa FK
        int doc_tipo_vendita FK
        int doc_tipo_imballo FK
        int doc_tipo_impianto FK
        int doc_tipo_causale FK
        int doc_lingua_manuale FK
        datetime doc_data
        nvarchar doc_commerciale_riferimento
        nvarchar doc_note
    }

    DOCUMENTI_LINGUE {
        int dli_id PK
        int dli_lingua FK
        nvarchar dli_documento
        nvarchar dli_segue
        nvarchar dli_costi_trasporto
    }

    DOCUMENTI_RIGHE {
        int dri_id PK
        int dri_documento FK
        nvarchar dri_prodotto FK
        int dri_posizione
        float dri_prezzo_unitario
        float dri_quantita
        int dri_causale
        nvarchar dri_tipo_capitolo FK
        nvarchar dri_note
    }

    FEEDBACK {
        int fee_id PK
        int fee_utente FK
        nvarchar fee_descrizione
        nvarchar fee_stacktrace
    }

    LINGUE {
        int lin_id PK
        nvarchar lin_descrizione
        nvarchar lin_note
    }

    MONTAGGI {
        int mon_id PK
        int mon_offerta FK
        float mon_trasporto
        float mon_ripartizione
        int mon_percentuale_impianto
        float mon_valore
    }

    MONTAGGI_OPERATORI {
        int mop_id PK
        int mop_montaggio FK
        int mop_tipo_operatore FK
        int mop_nazione FK
        int mop_giorni
        float mop_costo
    }

    NAZIONI {
        int naz_id PK
        nvarchar naz_nazione
        nvarchar naz_sigla
        int naz_contropartita FK
    }

    NOTIFICHE {
        int not_id PK
        int not_utente FK
        nvarchar not_descrizione
        bit not_flag_vista
        datetime not_mostra_il
    }

    PRODOTTI {
        int pro_id PK
        int pro_tipo_merceologia FK
        nvarchar pro_nome
        float pro_prezzo
        bit pro_flag_blocca_prezzo
        float pro_costo_quadro
        bit pro_flag_obsoleto
        nvarchar pro_note
    }

    PRODOTTI_LINGUE {
        int pli_id PK
        int pli_prodotto FK
        int pli_lingua FK
        nvarchar pli_nome
        nvarchar pli_descrizione_manuale
    }

    PRODOTTI_PROPRIETA {
        int ppr_id PK
        int ppr_prodotto FK
        int ppr_proprieta FK
        nvarchar ppr_valore
    }

    PROPRIETA {
        int prp_id PK
        int prp_tipo FK
        nvarchar prp_nome
        nvarchar prp_note
    }

    SCONTI {
        int sco_id PK
        nvarchar sco_descrizione
        int sco_importo
    }

    TABELLE {
        int tab_id PK
        nvarchar tab_tabella
        nvarchar tab_descrizione
        int tab_livello_lettura
        int tab_livello_modifica
    }

    TIPI_CAPITOLO {
        int tpc_id PK
        nvarchar tpc_descrizione
        bit tpc_flag_opzionale
    }

    TIPI_CAUSALE {
        int tca_id PK
        nvarchar tca_sigla
        nvarchar tca_descrizione
    }

    TIPI_CLIENTE {
        int tcl_id PK
        nvarchar tcl_descrizione
    }

    TIPI_CONTROPARTITA {
        int tco_id PK
        nvarchar tco_descrizione
    }

    TIPI_DOCUMENTO {
        int tdo_id PK
        nvarchar tdo_descrizione
        int tdo_ordine
    }

    TIPI_IMBALLO {
        int tim_id PK
        nvarchar tim_descrizione
    }

    TIPI_IMPIANTO {
        int tip_id PK
        nvarchar tip_descrizione
    }

    TIPI_MERCEOLOGIA {
        int mer_id PK
        nvarchar mer_descrizione
        nvarchar mer_nota
    }

    TIPI_OPERATORE {
        int top_id PK
        nvarchar top_descrizione
    }

    TIPI_PAGAMENTO {
        int tpa_id PK
        nvarchar tpa_descrizione
    }

    TIPI_PERCENTUALE_AGENTE {
        int tpa_id PK
        nvarchar tpa_descrizione
    }

    TIPI_PROPRIETA {
        int tpr_id PK
        nvarchar tpr_descrizione
    }

    TIPI_RESA {
        int tre_id PK
        nvarchar tre_sigla
        nvarchar tre_descrizione
    }

    TIPI_STATO_OFFERTA {
        int tso_id PK
        nvarchar tso_descrizione
        int tso_ordine
    }

    TIPI_UTENTE {
        int tut_id PK
        nvarchar tut_descrizione
    }


    TIPI_VENDITA {
        int tve_id PK
        nvarchar tve_descrizione
    }

    UTENTI {
        int ute_id PK
        int ute_tipo FK
        int ute_tipo_percetuali_agente FK
        nvarchar ute_username
        nvarchar ute_password
        nvarchar ute_nome
        nvarchar ute_cognome
        nvarchar ute_email
    }

    ZONE {
        int zon_id PK
        nvarchar zon_descrizione
        nvarchar zon_sigla
    }
```