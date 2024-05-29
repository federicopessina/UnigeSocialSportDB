-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.componenti_squadre
(
)
;

COMMENT ON TABLE public.componenti_squadre
    IS 'L’utente	creatore	può	inserire	direttamente	
gli	 utenti	 componenti	 o,	 alternativamente,	 un	 utente	 può	 candidarsi	 a	 partecipare	 a	 una	
squadra	in	formazione	(per	un	certo	ruolo),	con	il	meccanismo	descritto	sopra	per	gli	eventi.	
L’utente	premium	che	ha	registrato	la	squadra	accetta	o	rifiuta	la	candidatura.';

CREATE TABLE IF NOT EXISTS public.corsi_di_studio
(
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT corsi_di_studio_pkey PRIMARY KEY (nome)
);

CREATE TABLE IF NOT EXISTS public.esiti_eventi
(
    punti_prima_squadra integer NOT NULL,
    punti_seconda_squadra integer NOT NULL,
    "[eventi]_id" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT esiti_eventi_pkey PRIMARY KEY ("[eventi]_id")
);

COMMENT ON COLUMN public.esiti_eventi."[eventi]_id"
    IS 'È prevista la possibilità̀ di memorizzare l’esito di un evento sportivo. L’esito è immesso dall’utente organizzatore dell’evento stesso e contiene: il numero di goal/punti della prima squadra, il numero di goal/punti della seconda squadra, 
eventualmente il numero di goal/punti messi a segno da ciascun utente giocatore. ';

CREATE TABLE IF NOT EXISTS public.esito_iscrizioni
(
    esito character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT esito_iscrizioni_pkey PRIMARY KEY (esito)
);

COMMENT ON TABLE public.esito_iscrizioni
    IS 'I	giocatori	che	non	si	siano	presentati	ad	almeno	una partita per	cui	sono	registrati	tra le	ultime	20	(no	show),	o	che	abbiano	fatto	un	ritardo	nelle	ultime	10	partite,	o	che	abbiano	richiesto	una	sostituzione	nelle	ultime	10	partite	vengono	“indicati”	come	inaffidabili	(informazione	visibile	a	tutti	gli	utenti	premium).';

CREATE TABLE IF NOT EXISTS public.eventi
(
    data_di_svolgimento date NOT NULL,
    e_aperto boolean NOT NULL DEFAULT true,
    numero_massimo_iscritti integer NOT NULL,
    tempo_limite_disiscrizione timestamp without time zone NOT NULL,
    tempo_limite_iscrizione timestamp without time zone NOT NULL,
    "[sport]_categoria" character varying COLLATE pg_catalog."default" NOT NULL,
    id character varying COLLATE pg_catalog."default" NOT NULL,
    "[impianti]_id" character varying COLLATE pg_catalog."default" NOT NULL,
    "[utenti]_username" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT id_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE public.eventi
    IS 'Un utente premium può̀ organizzare un evento sportivo: 
ogni evento dispone di un identificativo univoco, 
una data di svolgimento, 
uno stato (APERTO/CHIUSO), 
e appartiene a una delle categorie tra quelle gestite dalla piattaforma. 

Ogni evento sportivo si svolge all’interno di un impianto del CUS Genova. 

Gli utenti semplici non possono organizzare eventi sportivi. ';

COMMENT ON COLUMN public.eventi.e_aperto
    IS 'Lo stato di un evento puo'' essere	(APERTO/CHIUSO)';

COMMENT ON COLUMN public.eventi.tempo_limite_disiscrizione
    IS 'È	possibile	per	un	partecipante	confermato	disiscriversi	entro	un	 tempo	
limite	 indicato	 dall’organizzatore,	 dopo	 tale	 limite	 potrà	 solo	 indicare	 un	 sostituto che 
parteciperà	al	suo	posto.';

COMMENT ON COLUMN public.eventi.id
    IS 'Identificativo univoco di un evento';

COMMENT ON COLUMN public.eventi."[impianti]_id"
    IS 'Ogni evento sportivo si svolge all’interno di	un impianto del	CUS Genova.';

COMMENT ON COLUMN public.eventi."[utenti]_username"
    IS 'Un utente premium può̀ organizzare un evento sportivo';

CREATE TABLE IF NOT EXISTS public.impianti
(
    via character varying COLLATE pg_catalog."default",
    telefono character varying COLLATE pg_catalog."default" NOT NULL,
    email character varying COLLATE pg_catalog."default" NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    id character varying COLLATE pg_catalog."default" NOT NULL,
    coordinate numeric(9, 6)[] NOT NULL,
    CONSTRAINT impianti_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE public.impianti
    IS 'Ogni evento sportivo si svolge all’interno di un impianto del CUS Genova.

Per ogni impianto, si vuole tenere traccia di: nome (univoco), via, numero di telefono, indirizzo e-mail, coordinate (latitudine/longitudine). ';

CREATE TABLE IF NOT EXISTS public.iscrizioni_eventi
(
    data date NOT NULL DEFAULT CURRENT_DATE,
    ruolo character varying COLLATE pg_catalog."default",
    stato character varying COLLATE pg_catalog."default",
    "[utenti]_username" character varying COLLATE pg_catalog."default" NOT NULL,
    "[stato_eventi]_stato" character varying COLLATE pg_catalog."default",
    "[eventi]_id" character varying COLLATE pg_catalog."default" NOT NULL,
    "[esito_iscrizioni]_esito" character varying COLLATE pg_catalog."default"
);

COMMENT ON TABLE public.iscrizioni_eventi
    IS 'È prevista la possibilità̀per gli utenti –sia premium che semplici- di iscriversi agli eventi sportivi in stato APERTO presenti sulla piattaforma, in qualità̀ di giocatore o di arbitro. 
Ogni iscrizione fa riferimento 
a un evento sportivo, 
è effettuata in una certa data, 
può specificare un ruolo 
e, una volta esaminata, è associata a uno stato (CONFERMATO/RIFIUTATO), a seconda che 
l’utente premium organizzatore dell’evento abbia approvato o meno la richiesta di iscrizione.';

COMMENT ON COLUMN public.iscrizioni_eventi.ruolo
    IS 'Un utente può candidarsi a partecipare a una squadra in formazione (per un certo ruolo), con il meccanismo per gli eventi.';

COMMENT ON COLUMN public.iscrizioni_eventi."[stato_eventi]_stato"
    IS 'È associata a uno stato (CONFERMATO/RIFIUTATO), a seconda che l’utente premium organizzatore dell’evento abbia approvato o meno la richiesta di iscrizione.';

COMMENT ON COLUMN public.iscrizioni_eventi."[esito_iscrizioni]_esito"
    IS 'I	giocatori	che	non	si	siano	presentati	ad	almeno	una partita per	cui	sono	registrati	tra le	ultime	20	(no	show),	o	che	abbiano	fatto	un	ritardo	nelle	ultime	10	partite,	o	che	abbiano	richiesto	una	sostituzione	nelle	ultime	10	partite	vengono	“indicati”	come	inaffidabili	(informazione	visibile	a	tutti	gli	utenti	premium).';

CREATE TABLE IF NOT EXISTS public.livelli
(
    "[utenti]_username" character varying COLLATE pg_catalog."default" NOT NULL,
    "[sport]_categoria" character varying COLLATE pg_catalog."default" NOT NULL,
    livello numeric NOT NULL,
    CONSTRAINT livelli_pkey PRIMARY KEY ("[utenti]_username", "[sport]_categoria")
);

COMMENT ON TABLE public.livelli
    IS 'Ogni utente-giocatore è caratterizzato, relativamente a un certo sport, da un livello. Il livello è un punteggio che, da 0 a 100, indica il valore di un giocatore in relazione alle partite che ha disputato e i voti che ha ricevuto. Il calcolo è legato ad un algoritmo che, partendo da un livello medio pari a 60, lo modifica partita per partita in base a diversi parametri di riferimento 
(voti ricevuti, esito partita, affidabilità voti, ...)';

CREATE TABLE IF NOT EXISTS public.modalita
(
    descrizione character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT modalita_pkey PRIMARY KEY (descrizione)
);

COMMENT ON TABLE public.modalita
    IS 'I tornei consistono in un certo numero di eventi e sono organizzati in accordo a diverse modalità (eliminazione diretta, gironi all’italiana, mista).';

CREATE TABLE IF NOT EXISTS public.sport
(
    categoria character varying COLLATE pg_catalog."default" NOT NULL,
    regolamento character varying COLLATE pg_catalog."default" NOT NULL,
    numero_di_giocatori numeric NOT NULL,
    foto bytea,
    CONSTRAINT sport_pkey PRIMARY KEY (categoria)
);

COMMENT ON TABLE public.sport
    IS 'Per ogni categoria, si vogliono memorizzare: il regolamento (campo di testo), il numero di giocatori e una foto esplicativa. 
';

CREATE TABLE IF NOT EXISTS public.squadre
(
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    colore character varying COLLATE pg_catalog."default" NOT NULL,
    descrizione character varying COLLATE pg_catalog."default" NOT NULL,
    note character varying[] COLLATE pg_catalog."default",
    e_definitiva boolean NOT NULL DEFAULT false,
    numero_partecipanti int4range NOT NULL,
    "[utenti]_username_organizzatore" character varying COLLATE pg_catalog."default",
    CONSTRAINT squadre_pkey PRIMARY KEY (nome)
);

COMMENT ON TABLE public.squadre
    IS 'La piattaforma supporta la formazione delle squadre. 
Un utente premium può registrare una squadra, specificando 
nome, 
colore maglia, 
numero partecipanti minimo e massimo, 
descrizione 
ed eventuali note. 

L’utente creatore può inserire direttamente gli utenti componenti o, 
alternativamente, un utente può candidarsi a partecipare a una squadra in formazione (per 
un certo ruolo), 
con il meccanismo descritto sopra per gli eventi. 

L’utente premium che ha registrato la squadra accetta o 
rifiuta la candidatura. 
La formazione della squadra risulta conclusa quando l’utente ne cambia lo stato in definitiva 
o quando viene raggiunto il limite massimo di candidature accettate. 

L’utente organizzatore del torneo inserisce tutti gli eventi che lo compongono. Nel caso di tornei la squadra è formata inizialmente e non sono possibili sostituzioni di giocatori per singoli 
eventi.';

CREATE TABLE IF NOT EXISTS public.stato_eventi
(
    stato character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT status_eventi_pkey PRIMARY KEY (stato)
);

COMMENT ON TABLE public.stato_eventi
    IS 'stato (CONFERMATO/RIFIUTATO)';

COMMENT ON COLUMN public.stato_eventi.stato
    IS 'stato (CONFERMATO/RIFIUTATO)';

CREATE TABLE IF NOT EXISTS public.studenti
(
    username character varying COLLATE pg_catalog."default" NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    cognome character varying COLLATE pg_catalog."default" NOT NULL,
    anno_di_nascita integer NOT NULL,
    luogo_di_nascita character varying COLLATE pg_catalog."default" NOT NULL,
    foto bytea,
    telefono character varying COLLATE pg_catalog."default" NOT NULL,
    matricola character varying COLLATE pg_catalog."default" NOT NULL,
    "[corsi_di_studio]_nome" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT studenti_pkey PRIMARY KEY (username)
);

COMMENT ON TABLE public.studenti
    IS 'Ogni utente dispone di username (univoco) e password, nome, cognome, anno e luogo di nascita, foto, recapito telefonico, numero di matricola, e nome del Corso di Studi cui afferisce. ';

COMMENT ON COLUMN public.studenti.telefono
    IS 'Recapito telefonico dello studente';

CREATE TABLE IF NOT EXISTS public.tornei
(
    id integer NOT NULL,
    sponsor character varying[] COLLATE pg_catalog."default",
    descrizione character varying COLLATE pg_catalog."default",
    restrizioni_partecipazione character varying[] COLLATE pg_catalog."default",
    "[utenti]_username" character varying COLLATE pg_catalog."default" NOT NULL,
    premi character varying[] COLLATE pg_catalog."default",
    "[eventi]_id" character varying COLLATE pg_catalog."default" NOT NULL,
    "[modalita]_descrizione" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tornei_pkey PRIMARY KEY (id, "[eventi]_id")
);

COMMENT ON COLUMN public.tornei."[utenti]_username"
    IS 'Utente premium organizzatore del torneo';

COMMENT ON COLUMN public.tornei."[eventi]_id"
    IS '	I	tornei	consistono	in un	certo	numero	di	eventi';

CREATE TABLE IF NOT EXISTS public.utenti
(
    "[studenti]_username" character varying COLLATE pg_catalog."default" NOT NULL,
    e_premium boolean NOT NULL DEFAULT false,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT utenti_pkey PRIMARY KEY ("[studenti]_username")
);

COMMENT ON TABLE public.utenti
    IS 'Rappresenta uno studente nella sua relazione rispetto all''applicazione UnigeSocialSport

Gli utenti possono appartenere a due tipologie: utenti premium o utenti semplici. Ogni utente della piattaforma ricade in una delle due tipologie sopra indicate.';

COMMENT ON COLUMN public.utenti.e_premium
    IS 'Gli utenti possono appartenere a due tipologie: 1. utenti premium
2. utenti semplici.	
Ogni utente della piattaforma	ricade in una delle	due	tipologie sopra indicate.';

ALTER TABLE IF EXISTS public.esiti_eventi
    ADD CONSTRAINT "esiti_eventi_[eventi]_id_fkey" FOREIGN KEY ("[eventi]_id")
    REFERENCES public.eventi (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS esiti_eventi_pkey
    ON public.esiti_eventi("[eventi]_id");


ALTER TABLE IF EXISTS public.eventi
    ADD CONSTRAINT "eventi_[impianti]_id_fkey" FOREIGN KEY ("[impianti]_id")
    REFERENCES public.impianti (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.eventi
    ADD CONSTRAINT "eventi_[sport]_categoria_fkey" FOREIGN KEY ("[sport]_categoria")
    REFERENCES public.sport (categoria) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.eventi
    ADD CONSTRAINT "eventi_[utenti]_username_fkey" FOREIGN KEY ("[utenti]_username")
    REFERENCES public.utenti ("[studenti]_username") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMENT ON CONSTRAINT "eventi_[utenti]_username_fkey" ON public.eventi
    IS 'Un utente premium può̀ organizzare un evento sportivo.';



ALTER TABLE IF EXISTS public.iscrizioni_eventi
    ADD CONSTRAINT "iscrizione_eventi_[stato_eventi]_stato_fkey" FOREIGN KEY ("[stato_eventi]_stato")
    REFERENCES public.stato_eventi (stato) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.studenti
    ADD CONSTRAINT "studenti_[corsi_di_studio]_nome_fkey" FOREIGN KEY ("[corsi_di_studio]_nome")
    REFERENCES public.corsi_di_studio (nome) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.tornei
    ADD CONSTRAINT "[eventi]_id_fkey" FOREIGN KEY ("[eventi]_id")
    REFERENCES public.eventi (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMENT ON CONSTRAINT "[eventi]_id_fkey" ON public.tornei
    IS 'Gli eventi registrati nei tornei devono essere inseriti nella tabella [eventi]';

CREATE INDEX IF NOT EXISTS "fki_[eventi]_id_fkey"
    ON public.tornei("[eventi]_id");


ALTER TABLE IF EXISTS public.tornei
    ADD CONSTRAINT "[modalita]_descrizione_fkey" FOREIGN KEY ("[modalita]_descrizione")
    REFERENCES public.modalita (descrizione) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMENT ON CONSTRAINT "[modalita]_descrizione_fkey" ON public.tornei
    IS 'Le modalita'' dei tornei registrati devono essere inserite nella tabella [modalita]';

CREATE INDEX IF NOT EXISTS "fki_[modalita]_descrizione_fkey"
    ON public.tornei("[modalita]_descrizione");


ALTER TABLE IF EXISTS public.utenti
    ADD CONSTRAINT "utenti_[studenti]_username_fkey" FOREIGN KEY ("[studenti]_username")
    REFERENCES public.studenti (username) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS utenti_pkey
    ON public.utenti("[studenti]_username");

END;