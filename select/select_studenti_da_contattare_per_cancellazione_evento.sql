SELECT studenti.username, studenti.telefono
FROM studenti
INNER JOIN 
(
    SELECT "[utenti]_username"
    FROM iscrizioni_eventi
    WHERE "[eventi]_id" = '1' -- NOTA: [eventi]_id dell'evento cancellato
) AS subquery
ON studenti.username = subquery."[utenti]_username";
