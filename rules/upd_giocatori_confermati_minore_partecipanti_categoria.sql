-- Rule: upd_giocatori_confermati_minore_partecipanti_categoria ON public.iscrizioni_eventi

-- DROP Rule IF EXISTS upd_giocatori_confermati_minore_partecipanti_categoria ON public.iscrizioni_eventi;

CREATE OR REPLACE RULE upd_giocatori_confermati_minore_partecipanti_categoria AS
    ON UPDATE TO public.iscrizioni_eventi
    WHERE (( SELECT sport.numero_di_giocatori
           FROM sport
          WHERE ((sport.categoria)::text = (( SELECT eventi."[sport]_categoria"
                   FROM eventi
                  WHERE ((eventi.id)::text = (new."[eventi]_id")::text)))::text)) < (( SELECT count(iscrizioni_eventi."[utenti]_username") AS count
           FROM iscrizioni_eventi
          WHERE ((iscrizioni_eventi."[stato_eventi]_stato")::text = 'confermato'::text)
          GROUP BY new."[eventi]_id"))::numeric)
    DO INSTEAD NOTHING;

COMMENT ON RULE upd_giocatori_confermati_minore_partecipanti_categoria ON public.iscrizioni_eventi IS 'Il	 numero	 totale	 di	 utenti	 giocatori	 CONFERMATI	 per	 un	 certo	 evento	 sportivo non può
eccedere	il	numero	di	partecipanti	previsti	dalla	categoria	cui	afferisce	l’evento';