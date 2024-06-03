# Relazione

## 1. Requisiti ristrutturati 

Base di dati a supporto di una piattaforma social “UniGE Social Sport”  per studenti dell’Università di Genova:

La piattaforma consente agli studenti di organizzare partite di sport di squadra (calcio, volley, basket, tennis, beach volley, beach soccer, cricket, TAG Rugby, Minigolf, etc.) presso le strutture del CUS Genova, di partecipare ad eventi sportivi, di interagire con altri utenti attraverso news e meccanismi di rating. La piattaforma gestisce gli eventi sportivi appartenenti a diverse categorie, tra cui ad esempio partite di sport di squadra, di diverse categorie .

### Convezioni generali
- La convenzione [tabella]_colonna viene utlizzata per indicare le foreign key.
- La convenzione rule_[tabella]_<funzionalità della regola> viene utilizzata per salvare i file contenenti le regole per le operazioni di inserimento, cancellazione, modifica.

### Funzionalità

#### Categoria

Per ogni categoria (di sport), si vogliono memorizzare: 
1. il regolamento (campo di testo)
2. il numero di giocatori
3. una foto esplicativa. NOTA Abbiamo utilizzato il campo foto come opzionale
NOTA: non specifichiamo se uno sport è di squadra o meno poichè abbiamo è esplicativa la colonna numero di giorcatori.


#### Utente

Ogni utente dispone di 
1. username (univoco)
2. password
3. nome
4. cognome
5. anno di nascita
6. luogo di nascita
7. foto NOTA Abbiamo utilizzato il campo foto come opzionale
8. recapito telefonico
9. numero di matricola
10. nome del Corso di Studi cui afferisce. 

Gli utenti possono appartenere a due tipologie ed ogni utente ricade in una di queste: 
1. utenti premium : che può organizzare un evento sportivo.
2. utenti semplici : che non possono organizzare eventi sportivi

NOTA: abbiamo separato le informazioni anagrafiche sugli studenti e le informazioni relative agli utenti all'interno del nostro programma.
      Abbiamo attuato questa logica per non appesantire eccessivamente le query.




#### Eventi

Ogni evento dispone di un 
1. identificativo univoco
2. una data di svolgimento
3. uno stato (APERTO/CHIUSO)
4. appartiene a una delle categorie tra quelle gestite dalla piattaforma. 

Ogni evento sportivo si svolge all’interno di un impianto del CUS Genova.

Nota: la gestione degli inserimenti sulla tabella eventi è gestita dagli utenti con ruolo e_premium.


#### Impianti

Per ogni impianto, si vuole tenere traccia di: 
1. nome (univoco)
2. via dove questo impianto si trova
3. numero di telefono relativo all'impianto
4. indirizzo email relativo all'impianto 
5. coordinate (latitudine/longitudine) di posizione dell'impianto

#### Iscrizioni ad eventi

È prevista la possibilità per gli utenti – sia premium che semplici - di iscriversi agli eventi sportivi.

Ogni iscrizione fa riferimento a un evento sportivo
Ogni iscrizione ha:
1. una data in cui è stata effettuata
2. può specificare un ruolo
3. una volta esaminata, è associata ad uno stato:
    - CONFERMATO: se l’utente premium organizzatore dell’evento ha approvato la richiesta di iscrizione
    - RIFIUTATO: se l'utente premium organizzatore dell'evento ha rifiutato la richiesta di iscrizione

Per registrarsi ad un evento, questo evento dev'essere in stato APERTO.
Ci si può registrare ad un evento in qualità di (uno dei due):
1. giocatore
2. arbitro.

La piattaforma consente inoltre agli utenti premium di organizzare tornei per le varie categorie.

Un utente premium può registrare una squadra.

La registrazione di un utente ad una squadra può avvenire in uno dei seguenti modi:
1. l’utente creatore può inserire direttamente gli utenti componenti la squadra 
2. un utente può candidarsi a partecipare a una squadra in formazione (per un certo ruolo), con il meccanismo descritto sopra per gli eventi. 

L’utente premium che ha registrato la squadra accetta o rifiuta la candidatura alal squadra stessa.

Il numero totale di utenti giocatori CONFERMATI per un certo evento sportivo non può eccedere il numero di partecipanti previsti dalla categoria cui afferisce l’evento. 

Il numero totale di utenti arbitri CONFERMATI non può essere maggiore di 1 per un dato evento.

Lo stato di un evento sportivo diventa CHIUSO quando si raggiunge un numero di giocatori pari a quello previsto dalla categoria (NOTA la presenza dell’arbitro è opzionale)

Se si è raggiunto il numero massimo di utenti registrabili ad un evento allora non è più possibile effettuare iscrizioni all’evento. 

Se non viene raggiunto in tempo utile il minimo numero di giocatori necessario a disputare l’evento, questo viene cancellato e gli utenti iscritti vengono avvisati.
NOTA:gli utenti vengono avvisati tramite un servizio di avvisi attraverso messaggi.

È possibile per un partecipante confermato disiscriversi entro un tempo limite indicato dall’organizzatore, dopo tale limite potrà solo indicare un sostituto che parteciperà al suo posto.

#### Valutazione prestazione utenti
Ogni utente – sia semplice che premium - che ha partecipato ad un evento può eventualmente valutare la prestazione degli altri utenti giocatori; 
La valutazione include 
1. la data
2. un punteggio (da 0 a 10)
3. un eventuale commento. 
 
NOTA Non confondere lo stato dell'evento con lo stato dell'iscrizione.
 
#### Esito

Inoltre, è prevista la possibilità di memorizzare l’esito di un evento sportivo. L’esito è immesso dall’utente organizzatore dell’evento stesso e contiene: il numero di goal/punti della prima squadra, il numero di goal/punti della seconda squadra, eventualmente il numero di goal/punti messi a segno da ciascun utente giocatore. 
 
#### Tornei

I tornei hanno una descrizione, eventuali sponsor e premi, eventuali restrizioni per la partecipazione. I tornei consistono in un certo numero di eventi e sono organizzati in accordo a diverse modalità (eliminazione diretta, gironi all’italiana, mista).
Nel caso di tornei a squadre, la piattaforma supporta la formazione delle squadre. 
L’utente organizzatore del torneo inserisce tutti gli eventi che lo compongono.
Nel caso di tornei la squadra è formata inizialmente e non sono possibili sostituzioni di giocatori per singoli eventi.

#### Squadra

Una squadra va registrata, specificando 
1. nome
2. colore maglia
3. numero di partecipanti minimo
4. numero di partecipanti massimo
5. descrizione della squadra
6. eventuali note. 

La formazione della squadra risulta conclusa quando l’utente ne cambia lo stato in definitiva o quando viene raggiunto il limite massimo di candidature accettate. 

#### Livello

Ogni utente-giocatore è caratterizzato, relativamente a un certo sport, da un livello.
Il livello è un punteggio che, da 0 a 100, indica il valore di un giocatore in relazione alle partite che ha disputato e i voti che ha ricevuto. 

Il calcolo è legato ad un algoritmo che, partendo da un livello medio pari a 60, lo modifica partita per partita in base a diversi parametri di riferimento (voti ricevuti, esito partita, affidabilità voti, ...).

TODO Descrizione dell'algorirmo

#### Affidabilità
Se uno dei giocatori verifica anche solo una delle seguenti caratteristiche: 
1. non si siano presentati ad almeno una partita per cui sono registrati tra le ultime 20 (no show)
2. abbiano fatto un ritardo nelle ultime 10 partite
3. abbiano richiesto una sostituzione nelle ultime 10 partite 
allora vengono “indicati” come inaffidabil.
L'informazione sull'infaffidabilità degli utenti è visibile a tutti gli utenti premium.

## 2. Progetto Concettuale 

### Schema Entity Relationship

### Dizionario Dati

### Vincoli non esprimibili nel diagramma

## 3. Progetto LOGico

### SCHEMA ER RISTRUTTURATO

TODO Inserire schema ER generato con pgadmin
