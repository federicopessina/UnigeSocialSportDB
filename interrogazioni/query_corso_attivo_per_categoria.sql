SELECT eventi."[sport]_categoria", studenti."[corsi_di_studio]_nome", COUNT(*) AS partecipazioni
FROM eventi
JOIN iscrizioni_eventi ON eventi.id = iscrizioni_eventi."[eventi]_id"
JOIN studenti ON iscrizioni_eventi."[utenti]_username" = studenti.username
GROUP BY eventi."[sport]_categoria", studenti."[corsi_di_studio]_nome"
ORDER BY eventi."[sport]_categoria", partecipazioni DESC;
