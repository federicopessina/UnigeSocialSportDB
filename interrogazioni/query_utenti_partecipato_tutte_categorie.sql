SELECT utenti."[studenti]_username"
FROM utenti
JOIN iscrizioni_eventi ON utenti."[studenti]_username" = iscrizioni_eventi."[utenti]_username"
JOIN eventi ON iscrizioni_eventi."[eventi]_id" = eventi.id
GROUP BY utenti."[studenti]_username"
HAVING COUNT(DISTINCT eventi
