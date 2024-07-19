-- crea_indici_performance.sql


CREATE INDEX idx_eventi_data_di_svolgimento ON public.eventi(data_di_svolgimento);
CREATE INDEX idx_iscrizioni_eventi_utenti ON public.iscrizioni_eventi("[utenti]_username");
CREATE INDEX idx_studenti_corsi_di_studio ON public.studenti("[corsi_di_studio]_nome");


EXPLAIN ANALYZE
SELECT * FROM public.eventi
WHERE data_di_svolgimento BETWEEN '2024-06-01' AND '2024-06-30';


EXPLAIN ANALYZE
SELECT * FROM public.eventi
WHERE data_di_svolgimento BETWEEN '2024-06-01' AND '2024-06-30';
