-- Rule: ins_stato_e_chiuso_impossibile_nuove_iscrizioni ON public.iscrizioni_eventi

-- DROP Rule IF EXISTS ins_stato_e_chiuso_impossibile_nuove_iscrizioni ON public.iscrizioni_eventi;

CREATE OR REPLACE RULE ins_stato_e_chiuso_impossibile_nuove_iscrizioni AS
    ON INSERT TO public.iscrizioni_eventi
    WHERE (( SELECT eventi.e_aperto
           FROM eventi
          WHERE ((eventi.id)::text = (new."[eventi]_id")::text)) = false)
    DO NOTHING;

COMMENT ON RULE ins_stato_e_chiuso_impossibile_nuove_iscrizioni ON public.iscrizioni_eventi IS 'Lo stato	di un evento sportivo diventa CHIUSO quando si raggiunge un numero di giocatori	pari a quello previsto dalla categoria (la	presenza dell’arbitro è opzionale); in tal caso,	non	è più possibile effettuare iscrizioni all’evento.';