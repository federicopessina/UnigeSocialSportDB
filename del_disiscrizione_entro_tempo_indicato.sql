-- Rule: del_disicrizione_entro_tempo_indicato ON public.iscrizioni_eventi

-- DROP Rule IF EXISTS del_disicrizione_entro_tempo_indicato ON public.iscrizioni_eventi;

CREATE OR REPLACE RULE del_disicrizione_entro_tempo_indicato AS
    ON DELETE TO public.iscrizioni_eventi
    WHERE (1 > 2)
    DO NOTHING;

COMMENT ON RULE del_disicrizione_entro_tempo_indicato ON public.iscrizioni_eventi IS '	È	possibile	per	un	partecipante	confermato	disiscriversi	entro	un	 tempo	
limite	 indicato	 dall’organizzatore,	 dopo	 tale	 limite	 potrà	 solo	 indicare	 un	 sostituto che	
parteciperà	al	suo	posto.';