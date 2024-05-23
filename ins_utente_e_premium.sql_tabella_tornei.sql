-- Rule: ins_utente_e_premium ON public.tornei

-- DROP Rule IF EXISTS ins_utente_e_premium ON public.tornei;

CREATE OR REPLACE RULE ins_utente_e_premium AS
    ON INSERT TO public.tornei
    WHERE (( SELECT utenti.e_premium
           FROM utenti
          WHERE ((new."[utenti]_username")::text = (utenti."[studenti]_username")::text)) = false)
    DO NOTHING;

COMMENT ON RULE ins_utente_e_premium ON public.tornei IS 'La	piattaforma	consente	inoltre	agli	utenti	premium	di	organizzare	tornei';