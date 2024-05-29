-- Rule: ins_utente_e_premium ON public.tornei

-- DROP Rule IF EXISTS ins_utente_e_premium ON public.tornei;

CREATE OR REPLACE RULE ins_utente_e_premium AS
    ON INSERT TO public.tornei
    WHERE (NOT (EXISTS ( SELECT 1
           FROM utenti
          WHERE (((utenti."[studenti]_username")::text = (new."[utenti]_username")::text) AND (utenti.e_premium = true)))))
    DO INSTEAD NOTHING;

COMMENT ON RULE ins_utente_e_premium ON public.tornei IS 'La piattaforma consente inoltre agli utenti	premium di organizzare tornei';