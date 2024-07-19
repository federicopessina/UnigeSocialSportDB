# Politiche di Controllo dell'Accesso e Ruoli

## Ruoli e Privilegi

### Amministratore
- Accesso completo al database.
- Privilegi: TUTTI I PRIVILEGI sul database.

### Utente Premium
- Può leggere, inserire e aggiornare dati.
- Privilegi: SELECT, INSERT, UPDATE su tutte le tabelle; EXECUTE su tutte le funzioni.

### Gestore Impianto
- Gestisce gli impianti e ha accesso in lettura a tutti i dati.
- Privilegi: SELECT, INSERT, UPDATE sulla tabella `impianti`; SELECT su tutte le tabelle.

### Utente Semplice
- Accesso in sola lettura a tutti i dati.
- Privilegi: SELECT su tutte le tabelle.

## Assegnazione dei Ruoli

- `admin_user`: Amministratore
- `premium_user`: Utente Premium
- `impianto_user`: Gestore Impianto
- `simple_user`: Utente Semplice

## Comandi SQL

I seguenti comandi SQL definiscono e assegnano i ruoli:

```sql
-- Definizione dei ruoli
CREATE ROLE amministratore;
CREATE ROLE utente_premium;
CREATE ROLE gestore_impianto;
CREATE ROLE utente_semplice;

-- Assegnazione dei privilegi ai ruoli

-- Privilegi del ruolo Amministratore
GRANT ALL PRIVILEGES ON DATABASE "UnigeSocialSportDB" TO amministratore;

-- Privilegi del ruolo Utente Premium
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO utente_premium;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO utente_premium;

-- Privilegi del ruolo Gestore Impianto
GRANT SELECT, INSERT, UPDATE ON public.impianti TO gestore_impianto;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO gestore_impianto;

-- Privilegi del ruolo Utente Semplice
GRANT SELECT ON ALL TABLES IN SCHEMA public TO utente_semplice;

-- Assegnazione dei ruoli agli utenti
GRANT amministratore TO admin_user;
GRANT utente_premium TO premium_user;
GRANT gestore_impianto TO impianto_user;
GRANT utente_semplice TO simple_user;
