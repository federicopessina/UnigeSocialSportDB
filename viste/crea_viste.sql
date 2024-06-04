CREATE OR REPLACE VIEW public.programma AS
SELECT
    impianti.nome AS impianto,
    EXTRACT(MONTH FROM eventi.data_di_svolgimento) AS mese,
    COUNT(DISTINCT tornei.id) AS numero_tornei,
    COUNT(eventi.id) AS numero_eventi,
    COUNT(DISTINCT iscrizioni_eventi."[utenti]_username") AS numero_partecipanti,
    COUNT(DISTINCT studenti."[corsi_di_studio]_nome") AS corsi_di_studio,
    SUM(eventi.numero_massimo_iscritti) AS durata_totale,
    (SUM(eventi.numero_massimo_iscritti) / (30 * 24 * 60)) * 100 AS percentuale_utilizzo
FROM
    public.eventi
    LEFT JOIN public.impianti ON eventi."[impianti]_nome" = impianti.nome
    LEFT JOIN public.tornei ON eventi.id = tornei."[eventi]_id"
    LEFT JOIN public.iscrizioni_eventi ON eventi.id = iscrizioni_eventi."[eventi]_id"
    LEFT JOIN public.studenti ON iscrizioni_eventi."[utenti]_username" = studenti.username
GROUP BY
    impianti.nome, EXTRACT(MONTH FROM eventi.data_di_svolgimento);
