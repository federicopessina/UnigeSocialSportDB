--- Progetto BD 23-24 (12 CFU)
--- Numero gruppo
--- Nomi e matricole componenti


--- PARTE III 
/* il file deve essere file SQL ... cioè formato solo testo e apribili ed eseguibili in pgAdmin */


/*************************************************************************************************************************************************************************/ 
--1b. Schema per popolamento in the large
/*************************************************************************************************************************************************************************/ 

/* per ogni relazione R coinvolta nel carico di lavoro, inserire qui i comandi SQL per creare una nuova relazione R_CL con schema equivalente a R ma senza vincoli di chiave primaria, secondaria o esterna e con eventuali attributi dummy */

-- Creazione delle tabelle senza vincoli
CREATE TABLE IF NOT EXISTS public.utenti_CL (
    "[studenti]_username" character varying,
    e_premium boolean DEFAULT false,
    password character varying,
    dummy_col character varying
);

CREATE TABLE IF NOT EXISTS public.studenti_CL (
    username character varying,
    nome character varying,
    cognome character varying,
    anno_di_nascita integer,
    luogo_di_nascita character varying,
    foto bytea,
    telefono character varying,
    matricola character varying,
    "[corsi_di_studio]_nome" character varying,
    dummy_col character varying
);

CREATE TABLE IF NOT EXISTS public.eventi_CL (
    data_di_svolgimento date,
    e_aperto boolean DEFAULT true,
    numero_massimo_iscritti integer,
    data_limite_disiscrizione timestamp without time zone,
    data_limite_iscrizione timestamp without time zone,
    "[sport]_categoria" character varying,
    id character varying,
    "[utenti]_username" character varying,
    "[impianti]_nome" character varying,
    dummy_col character varying
);

CREATE TABLE IF NOT EXISTS public.iscrizioni_eventi_CL (
    data date DEFAULT CURRENT_DATE,
    ruolo character varying,
    "[utenti]_username" character varying,
    "[stato_eventi]_stato" character varying,
    "[eventi]_id" character varying,
    "[esito_iscrizioni]_esito" character varying,
    dummy_col character varying
);

/* Aggiungere qui la creazione di altre tabelle CL necessarie */


/*************************************************************************************************************************************************************************/
--1c. Carico di lavoro
/*************************************************************************************************************************************************************************/ 

/*************************************************************************************************************************************************************************/ 
/* Q1: Query con singola selezione e nessun join */
/*************************************************************************************************************************************************************************/ 

-- Selezionare tutti gli utenti premium
EXPLAIN ANALYZE
SELECT * FROM public.utenti_CL WHERE e_premium = true;

/*************************************************************************************************************************************************************************/ 
/* Q2: Query con condizione di selezione complessa e nessun join */
/*************************************************************************************************************************************************************************/ 

-- Selezionare gli studenti nati tra il 1990 e il 2000 e con corso di studi "Ingegneria Informatica"
EXPLAIN ANALYZE
SELECT * FROM public.studenti_CL 
WHERE anno_di_nascita BETWEEN 1990 AND 2000 
AND "[corsi_di_studio]_nome" = 'Ingegneria Informatica';

/*************************************************************************************************************************************************************************/ 
/* Q3: Query con almeno un join e almeno una condizione di selezione */
/*************************************************************************************************************************************************************************/ 

-- Selezionare eventi e il loro organizzatore premium
EXPLAIN ANALYZE
SELECT e.id, e.data_di_svolgimento, u."[studenti]_username"
FROM public.eventi_CL e
JOIN public.utenti_CL u ON e."[utenti]_username" = u."[studenti]_username"
WHERE u.e_premium = true;

/*************************************************************************************************************************************************************************/
--1e. Schema fisico
/*************************************************************************************************************************************************************************/ 

/* inserire qui i comandi SQL per cancellare tutti gli indici già esistenti per le tabelle coinvolte nel carico di lavoro */

-- Cancellazione degli indici esistenti
DROP INDEX IF EXISTS utenti_idx;
DROP INDEX IF EXISTS studenti_idx;
DROP INDEX IF EXISTS eventi_idx;
DROP INDEX IF EXISTS iscrizioni_eventi_idx;

/* inserire qui i comandi SQL per la creazione dello schema fisico della base di dati in accordo al risultato della fase di progettazione fisica per il carico di lavoro. */

-- Creazione degli indici per migliorare le performance
CREATE INDEX utenti_premium_idx ON public.utenti_CL (e_premium);
CREATE INDEX studenti_nascita_idx ON public.studenti_CL (anno_di_nascita);
CREATE INDEX eventi_id_idx ON public.eventi_CL (id);
CREATE INDEX iscrizioni_eventi_id_idx ON public.iscrizioni_eventi_CL ("[eventi]_id");


/*************************************************************************************************************************************************************************/ 
--2. Controllo dell'accesso 
/*************************************************************************************************************************************************************************/ 

/* inserire qui i comandi SQL per la definizione della politica di controllo dell'accesso della base di dati  (definizione ruoli, gerarchia, definizione utenti, assegnazione privilegi) in modo che, dopo l'esecuzione di questi comandi, 
le operazioni corrispondenti ai privilegi delegati ai ruoli e agli utenti sia correttamente eseguibili. */

-- Creazione dei ruoli
CREATE ROLE amministratore;
CREATE ROLE utente_premium;
CREATE ROLE gestore_impianto;
CREATE ROLE utente_semplice;

-- Gerarchia dei ruoli
GRANT utente_premium TO amministratore;
GRANT gestore_impianto TO amministratore;
GRANT utente_semplice TO utente_premium;

-- Assegnazione dei privilegi ai ruoli
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO amministratore;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO utente_premium;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO utente_semplice;

-- Privilegi specifici per gestore_impianto
GRANT SELECT, UPDATE ON public.impianti TO gestore_impianto;

-- Assegnazione dei ruoli agli utenti
GRANT amministratore TO amministratore_utente;
GRANT utente_premium TO utente_premium_utente;
GRANT gestore_impianto TO gestore_impianto_utente;
GRANT utente_semplice TO utente_semplice_utente;

-- Creazione della funzione per assegnare i ruoli
CREATE OR REPLACE FUNCTION assegna_ruolo() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.e_premium = true THEN
        EXECUTE format('GRANT utente_premium TO %I', NEW."[studenti]_username");
    ELSE
        EXECUTE format('GRANT utente_semplice TO %I', NEW."[studenti]_username");
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Creazione del trigger per chiamare la funzione dopo l'inserimento in utenti
CREATE TRIGGER trigger_assegna_ruolo
AFTER INSERT ON public.utenti
FOR EACH ROW
EXECUTE FUNCTION assegna_ruolo();
