-- Rule: rule_ins_ruolo_e_solo_o_giocatore_o_arbitro ON public.iscrizioni_eventi

-- DROP Rule IF EXISTS rule_ins_ruolo_e_solo_o_giocatore_o_arbitro ON public.iscrizioni_eventi;

CREATE OR REPLACE RULE rule_ins_ruolo_e_solo_o_giocatore_o_arbitro AS
    ON INSERT TO public.iscrizioni_eventi
    WHERE (((new.ruolo)::text <> 'giocatore'::text) AND (((new.ruolo)::text <> 'arbitro'::text) AND ((new.ruolo)::text = NULL::text)))
    DO INSTEAD NOTHING;

COMMENT ON RULE rule_ins_ruolo_e_solo_o_giocatore_o_arbitro ON public.iscrizioni_eventi IS 'iscriversi	 agli	 eventi	
sportivi ... in	qualità di	giocatore	o	di	arbitro';