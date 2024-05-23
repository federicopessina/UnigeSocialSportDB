-- Rule: ins_utente_e_premium ON public.eventi

-- DROP Rule IF EXISTS ins_utente_e_premium ON public.eventi;

CREATE OR REPLACE RULE ins_utente_e_premium AS
    ON INSERT TO public.eventi
    WHERE (( SELECT utenti.e_premium
           FROM utenti
          WHERE ((utenti."[studenti]_username")::text = (new."[utenti]_username")::text)
          ORDER BY utenti."[studenti]_username"
         LIMIT 1) = true)
    DO NOTHING;

COMMENT ON RULE ins_utente_e_premium ON public.eventi IS 'Un utente premium può̀ organizzare un evento sportivo.Gli utenti semplici non possono organizzare eventi sportivi.';