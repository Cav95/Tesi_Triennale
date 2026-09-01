# Di seguito i dati interni alle tabelle di lookup :

## tipo_capitolo (da riempire a runtime)
|tcp_id|tcp_descrizione|
|-------|-----------|
|NULL| NULL |

## tipi_causali
|tca_id|tca_sigla|tca_descrizione|
|-------|-----------|-----------|
|1| VSS | VENDITA|
|2| VAC | MERCE IN VISIONE|
|3| RIT| RITIRO MERCE DA CLIENTE|
|4| GAR | MERCE IN GARANZIA|
|5| COMP| COMPONENTI|




## tipi_cliente
|tcl_id|tcl_descrizione|
|-------|-----------------|
|1| INTERMEDIARIO|
|2| FINALE|

## tipi_contropartita
|tco_id|tco_descrizione|
|-------|-----------------|
|1| ITALIA|
|2| EUROPA|
|3| EXTRA_UE|

## tipi_contratto
|tdo_id| tdo_descrizione | 
|------|-----------|
|1| offerta|
|2| ordine|
|3| tecnica|
|4| stima|

## tipi_imballo
|tim_id| tim_descrizione |
|------|------------------|
|1|SCATOLA VIA AEREA|
|2|SCATOLA VIA DHL/UPS/FEDEX|
|3|PER SPED VIA TERRA GROUPAGE|
|4|SCATOLA PER EXECUTIVE/TRACO|
|5|PER SPEDIZIONE CON NOSTRO MEZZO|
|6|PER SPEDIZIONE CON MEZZI DEL CLIENTE|
|7|PER SPEDIZIONE VIA MARE GROUPAGE|
|8|PER SPEDIZIONE VIA MARE CONTAINER COMPLETO|
|9|PER SPEDIZIONE POSTE ITALIANE|
|10|RAGGRUPPARE CON COMMESSA|
|11|PER SPEDIZIONE FERROVIA|
|12|RAGGRUPPARE CON R/A|
|13|PER SPEDIZIONE CON CORRIERE|
|14|PER SPEDIZIONE VIA TERRA|
|15|MERCE GIA A DESTINO|
|16|NESSUNO|

## tipo_impianto (da riempire)
|tip_id|tip_descrizione|
|-------|-----------|
|NULL| NULL |

## tipo_merceologia (riepempita come da tabella excel)
|tip_id|tip_descrizione|
|-------|-----------|
|####| #### |


## tipo_operatore
|top_id|top_descrizione|
|-------|-----------|
|1| STANDARD |
|2| SPECIALIZZATO |
|3| PROGRAMMATORE |
|4| SUPERVISORE |


## tipo_pagamento
|tpa_id|tpa_descrizione|
|-------|-----------|
|1| rb a 60 gg dalla fattura |
|2| ab a ricevimento della merce |
|3| 30% acconto all'ordine - 40% a merce pronta - 30% 60 gg da data fattura |
|4| vedi condizioni |
|5| 30% ordine - 50% avviso merce pronta - 20% 90 gg data fattura| 
|6| ricevuta bancaria 30/60/90/120 gg|
|7| 25 % + iva all'ordine - 35 % +iva totale alla consegna - 40 % con n° 2 rb mensili consecutive a 60-90 gg data fattura|

## tipi_percentuale_agente
|tpa_id| tpa_descrizione | 
|-------|-----------|
|1|15+10 LISTINO A 1000|
|2|15+10 LISTINO A 1100|
|3|15+10 LISTINO AL 1050|
|4|10% NETTO MERCE|
|5|8% NETTO MERCE|
|6|5% NETTO MERCE|

## tipi_proprietà
|tpr_id| tpr_descrizione | 
|-------|-----------|
|1|meccaniche|
|2|elettriche|
|3|pneumatiche|
|4|normativo|
|5|produzione|
|6|trasporto|


## tipi_resa

|tre_id|tre_sigla| tre_descrizione | 
|-------|-----------|------------------|
|1|EXW | EX WORKS - INCOTERMS 2020	|
|2|FCA | FORLI' - FREE CARRIER - INCOTERMS 2020|
|3|FOB | FREE ON BOARD - INCOTERMS 2020|
|4|CFR | COST AND FREIGHT - INCOTERMS 2020|
|5|CIF | COST INSURANCE AND FREIGHT -INCOTERMS 2020|
|6|CPT | CARRIEGE PAID TO - INCOTERMS 2020|
|7|CIP | CARRIEGE AND INSURANCE PAID TO-INCOTERMS2020|
|8|DAP | DELIVERY AT PLACE with charge on the invoice|
|9|DDP | DELIVERY DUTY PAID - INCOTERMS 2020|

## tipi_stato_offerta
|tso_id| tso_descrizione | 
|-------|-----------|
|1|preventivo|
|2|in approvazione|
|3|approvato|
|4|in verifica tecnica|
|5|in progettazione|
|6|in realizzazione|
|7|spedito|
|8|montato|
|9|sospeso|

## tipi_utente

|tut_id| tut_descrizione | 
|-------|------------------|
|1|admin|
|2|commerciale vendite|
|3|commerciale ricambi|
|4|agente|
|5|project manager|
|6|visualizzatore|

## tipo_utilizzo_impianto (da riempire)
|tui_id|tui_descrizione|
|-------|-----------|
|NULL| NULL |

## tipi_vendita
|tve_id|tve_descrizione|
|-------|-----------|
|1| RICAMBI |
|2| AMPLIAMENTO |
|3| COMPONENTI |
|4| SOSTITUZIONI |
|5| MODIFICA IMPIANTO| 
|6| RIPARAZIONE|
|7| COMPLETAMENTO IMPIANTO|
|8| NOLEGGIO|
|9| FIERE|
|10| MANUTENZIONE|
|11| MAGAZZINO|
|12| MANODOPERA|
|13| AGGIUNTA COMPONENTI|
|14| RITIRO MERCE|
|15| IMPIANTO|
