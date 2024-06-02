-- Rule: rule_upd_valutazione_compresa_0_10 ON public.valutazione_prestazioni

-- DROP Rule IF EXISTS rule_upd_valutazione_compresa_0_10 ON public.valutazione_prestazioni;

CREATE OR REPLACE RULE rule_upd_valutazione_compresa_0_10 AS
    ON UPDATE TO public.valutazione_prestazioni
    WHERE ((new.valutazione < (0)::numeric) OR (new.valutazione > (10)::numeric))
    DO INSTEAD NOTHING;
