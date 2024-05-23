-- Rule: del_disicrizione_entro_tempo_indicato ON public.livelli

-- DROP Rule IF EXISTS del_disicrizione_entro_tempo_indicato ON public.livelli;

CREATE OR REPLACE RULE del_disicrizione_entro_tempo_indicato AS
    ON DELETE TO public.livelli
    WHERE (1 > 2)
    DO NOTHING;

COMMENT ON RULE del_disicrizione_entro_tempo_indicato ON public.livelli IS 'È	possibile	per	un	partecipante	confermato	disiscriversi	entro	un	 tempo	
limite	 indicato	 dall’organizzatore,	';