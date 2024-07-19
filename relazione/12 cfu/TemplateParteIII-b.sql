--- Progetto BD 23-24 (12CFU)
--- Numero gruppo : 58
--- Nomi e matricole componenti : 
---     Moustapha Dabbous - S5111327
---     Federico Pessina - S4190198
---     Lavinia Melas - S6525147

--- PARTE III 
/* il file deve essere file SQL ... cio formato solo testo e apribili ed eseguibili in pgAdmin */






/*************************************************************************************************************************************************************************/ 
--1f. Popolamento in the large
/*************************************************************************************************************************************************************************/ 

-- Popolamento della tabella utenti
INSERT INTO public.utenti ("[studenti]_username", e_premium, password)
VALUES 
    ('studente1', true, 'password1'),
    ('studente2', false, 'password2'),
    ('studente3', true, 'password3');

-- Popolamento della tabella studenti
INSERT INTO public.studenti (username, nome, cognome, anno_di_nascita, luogo_di_nascita, foto, telefono, matricola, "[corsi_di_studio]_nome")
VALUES 
    ('studente1', 'Nome1', 'Cognome1', 1995, 'Città1', NULL, '1234567890', 'MATRICOLA1', 'Ingegneria Informatica'),
    ('studente2', 'Nome2', 'Cognome2', 1996, 'Città2', NULL, '0987654321', 'MATRICOLA2', 'Matematica'),
    ('studente3', 'Nome3', 'Cognome3', 1997, 'Città3', NULL, '1122334455', 'MATRICOLA3', 'Fisica');

-- Popolamento della tabella eventi
INSERT INTO public.eventi (id, data_di_svolgimento, e_aperto, numero_massimo_iscritti, data_limite_disiscrizione, data_limite_iscrizione, "[sport]_categoria", "[utenti]_username", "[impianti]_nome")
VALUES 
    ('E1', '2024-06-15', true, 10, '2024-06-10', '2024-06-13', 'calcio', 'studente1', 'Stadio Luigi Ferraris'),
    ('E2', '2024-06-20', true, 12, '2024-06-15', '2024-06-18', 'basket', 'studente2', 'PalaDiamante'),
    ('E3', '2024-06-25', false, 8, '2024-06-20', '2024-06-23', 'volley', 'studente3', 'PalaCoge');

-- Popolamento della tabella iscrizioni_eventi
INSERT INTO public.iscrizioni_eventi (data, ruolo, "[utenti]_username", "[stato_eventi]_stato", "[eventi]_id", "[esito_iscrizioni]_esito")
VALUES 
    (CURRENT_DATE, 'giocatore', 'studente1', 'CONFERMATO', 'E1', 'OK'),
    (CURRENT_DATE, 'arbitro', 'studente2', 'RIFIUTATO', 'E2', 'NO SHOW'),
   

/* inserire qui i comandi SQL per il popolamento 'in the large' delle relazioni coinvolte nel carico di lavoro  */
