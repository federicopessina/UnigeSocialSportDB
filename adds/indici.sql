CREATE INDEX idx_eventi_sport_categoria ON public.eventi("[sport]_categoria");
CREATE INDEX idx_eventi_utenti_username ON public.eventi("[utenti]_username");
CREATE INDEX idx_eventi_impianti_nome ON public.eventi("[impianti]_nome");
CREATE INDEX idx_iscrizioni_eventi_utenti_username ON public.iscrizioni_eventi("[utenti]_username");
CREATE INDEX idx_iscrizioni_eventi_eventi_id ON public.iscrizioni_eventi("[eventi]_id");
CREATE INDEX idx_livelli_utenti_username ON public.livelli("[utenti]_username");
CREATE INDEX idx_livelli_sport_categoria ON public.livelli("[sport]_categoria");
CREATE INDEX idx_voti_utenti_username ON public.voti("[utenti]_username");
CREATE INDEX idx_voti_eventi_id ON public.voti("[eventi]_id");