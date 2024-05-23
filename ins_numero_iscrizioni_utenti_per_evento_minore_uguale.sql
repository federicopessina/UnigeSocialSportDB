-- Rule: ins_numero_iscrizioni_utenti_per_evento_minore_uguale_a_1 ON public.iscrizioni_eventi

-- DROP Rule IF EXISTS ins_numero_iscrizioni_utenti_per_evento_minore_uguale_a_1 ON public.iscrizioni_eventi;

CREATE OR REPLACE RULE ins_numero_iscrizioni_utenti_per_evento_minore_uguale_a_1 AS
    ON INSERT TO public.iscrizioni_eventi
    WHERE (( SELECT count(iscrizioni_eventi."[eventi]_id") AS count
           FROM iscrizioni_eventi
          GROUP BY iscrizioni_eventi."[eventi]_id", iscrizioni_eventi."[utenti]_username") > 1)
    DO NOTHING;

COMMENT ON RULE ins_numero_iscrizioni_utenti_per_evento_minore_uguale_a_1 ON public.iscrizioni_eventi IS '	 Il	numero	
totale	di	utenti	arbitri CONFERMATI	non	può essere	maggiore	di	1	per	un	dato	evento';