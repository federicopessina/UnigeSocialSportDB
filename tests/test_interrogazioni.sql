SELECT * FROM utenti WHERE e_premium = true;
SELECT * FROM eventi WHERE data_di_svolgimento BETWEEN '2024-06-01' AND '2024-06-30';
SELECT studenti.nome, studenti.cognome, eventi.data_di_svolgimento
FROM studenti
JOIN iscrizioni_eventi ON studenti.username = iscrizioni_eventi."[utenti]_username"
JOIN eventi ON iscrizioni_eventi."[eventi]_id" = eventi.id
WHERE eventi."[sport]_categoria" = 'calcio';
