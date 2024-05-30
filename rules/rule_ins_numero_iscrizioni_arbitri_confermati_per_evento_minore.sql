-- Rule: rule_ins_numero_iscrizioni_arbitri_confermati_per_evento_minore ON public.iscrizioni_eventi

-- DROP Rule IF EXISTS rule_ins_numero_iscrizioni_arbitri_confermati_per_evento_minore ON public.iscrizioni_eventi;

CREATE OR REPLACE RULE rule_ins_numero_iscrizioni_arbitri_confermati_per_evento_minore AS
    ON INSERT TO public.iscrizioni_eventi
    WHERE (( SELECT count(iscrizioni_eventi."[eventi]_id") AS count
           FROM iscrizioni_eventi
          WHERE (((iscrizioni_eventi.ruolo)::text = 'arbitro'::text) AND ((iscrizioni_eventi."[stato_eventi]_stato")::text = 'confermato'::text))
          GROUP BY iscrizioni_eventi."[eventi]_id") >= 1)
    DO INSTEAD NOTHING;

COMMENT ON RULE rule_ins_numero_iscrizioni_arbitri_confermati_per_evento_minore ON public.iscrizioni_eventi IS '	 Il	numero	
totale	di	utenti	arbitri CONFERMATI	non	può essere	maggiore	di	1	per	un	dato	evento';