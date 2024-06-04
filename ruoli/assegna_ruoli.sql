GRANT utente_premium TO amministratore;
GRANT gestore_impianto TO amministratore;
GRANT utente_semplice TO utente_premium;

-- Assegnare privilegi ai ruoli
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO amministratore;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO utente_premium;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO utente_semplice;

-- Assegnare privilegi specifici a gestore_impianto
GRANT SELECT, UPDATE ON public.impianti TO gestore_impianto;

-- Assegnare ruoli agli utenti
GRANT amministratore TO amministratore_utente;
GRANT utente_premium TO utente_premium_utente;
GRANT gestore_impianto TO gestore_impianto_utente;
GRANT utente_semplice TO utente_semplice_utente;
