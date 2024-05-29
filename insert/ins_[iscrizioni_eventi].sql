INSERT INTO public.iscrizioni_eventi (
    data, ruolo, stato, "[utenti]_username", "[stato_eventi]_stato", "[eventi]_id", "[esito_iscrizioni]_esito")
VALUES 
    ('2024-06-15', 'arbitro', 'CONFERMATO', 'jdoe1', 'CONFERMATO', 1, 'da verificare'),
    ('2024-06-20', 'giocatore', 'RIFIUTATO', 'asmith1', 'RIFIUTATO', 2, 'no show'),
    ('2024-06-25', 'arbitro', 'CONFERMATO', 'bwhite1', 'CONFERMATO', 3, 'ritardo'),
    ('2024-07-01', 'giocatore', 'CONFERMATO', 'clark1', 'CONFERMATO', 4, 'sostituzione'),
    ('2024-07-05', 'arbitro', 'RIFIUTATO', 'ddavis1', 'RIFIUTATO', 5, 'da verificare');
