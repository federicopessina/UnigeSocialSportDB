-- Selezionare tutti gli eventi e includere il numero di iscritti
SELECT 
    e.id,
    e.nome,
    (SELECT COUNT(*) FROM iscrizioni_eventi ie WHERE ie.eventi_id = e.id) AS numero_iscritti
FROM 
    eventi e;

-- Trovare gli utenti che non hanno partecipato a 0 evento
SELECT 
    u.id,
    u.nome,
    u.cognome
FROM 
    utenti u
WHERE 
    NOT EXISTS (SELECT 1 FROM iscrizioni_eventi ie WHERE ie.utenti_id = u.id);
