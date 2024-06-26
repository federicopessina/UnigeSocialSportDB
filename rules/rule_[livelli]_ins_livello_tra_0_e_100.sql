-- Rule: rule_ins_livello_tra_0_e_100 ON public.livelli

-- DROP Rule IF EXISTS rule_ins_livello_tra_0_e_100 ON public.livelli;

CREATE OR REPLACE RULE rule_ins_livello_tra_0_e_100 AS
    ON INSERT TO public.livelli
    WHERE ((new.livello < (0)::numeric) OR (new.livello > (100)::numeric))
    DO NOTHING;

COMMENT ON RULE rule_ins_livello_tra_0_e_100 ON public.livelli IS 'Il livello è un	punteggio che, da 0 a	100';