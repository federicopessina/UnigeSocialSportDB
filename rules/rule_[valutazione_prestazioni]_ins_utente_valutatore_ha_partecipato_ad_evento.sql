-- Rule: rule_ins_utente_valutatore_ha_partecipato_ad_evento ON public.valutazione_prestazioni

-- DROP Rule IF EXISTS rule_ins_utente_valutatore_ha_partecipato_ad_evento ON public.valutazione_prestazioni;

CREATE OR REPLACE RULE rule_ins_utente_valutatore_ha_partecipato_ad_evento AS
    ON INSERT TO public.valutazione_prestazioni
    WHERE (NOT (EXISTS ( SELECT 1
           FROM iscrizioni_eventi
          WHERE (((iscrizioni_eventi."[utenti]_username")::text = (new."[utenti]_username_valutatore")::text) AND ((iscrizioni_eventi."[eventi]_id")::text = (new."[eventi]_id")::text) AND ((iscrizioni_eventi."[esito_iscrizioni]_esito")::text = 'confermato'::text)))))
    DO INSTEAD NOTHING;
