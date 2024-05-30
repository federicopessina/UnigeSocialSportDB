-- Rule: rule_ins_organizzatore_e_premium ON public.squadre

-- DROP Rule IF EXISTS rule_ins_organizzatore_e_premium ON public.squadre;

CREATE OR REPLACE RULE rule_ins_organizzatore_e_premium AS
    ON INSERT TO public.squadre
    WHERE (NOT (EXISTS ( SELECT 1
           FROM utenti
          WHERE (((utenti."[studenti]_username")::text = (new."[utenti]_username_organizzatore")::text) AND (utenti.e_premium = true)))))
    DO INSTEAD NOTHING;
