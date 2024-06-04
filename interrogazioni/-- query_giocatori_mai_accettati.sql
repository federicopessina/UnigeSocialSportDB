
SELECT utenti."[studenti]_username"
FROM utenti
LEFT JOIN iscrizioni_eventi ON utenti."[studenti]_username" = iscrizioni_eventi."[utenti]_username"
WHERE iscrizioni_eventi.ruolo = 'giocatore'
GROUP BY utenti."[studenti]_username"
HAVING COUNT(CASE WHEN iscrizioni_eventi."[stato_eventi]_stato" = 'CONFERMATO' THEN 1 ELSE NULL END) = 0;
