
Base di dati a supporto di una piattaforma social “UniGE Social Sport”  per studenti dell’Università di Genova:

La piattaforma consente agli studenti di organizzare partite di sport di squadra (calcio, volley, basket, tennis, beach volley, beach soccer, cricket, TAG Rugby, Minigolf, etc.) presso le strutture del CUS Genova, di partecipare ad eventi sportivi, di interagire con altri utenti attraverso news e meccanismi di rating. La piattaforma gestisce gli eventi sportivi appartenenti a diverse categorie, tra cui ad esempio partite di sport di squadra, di diverse categorie .

Categoria:

Per ogni categoria, si vogliono memorizzare: il regolamento (campo di testo), il numero di giocatori e una foto esplicativa. 

Utente:

Ogni utente dispone di username (univoco) e password, nome, cognome, anno e luogo di nascita, foto, recapito telefonico, numero di matricola, e nome del Corso di Studi cui afferisce. Gli utenti possono appartenere a due tipologie: utenti premium o utenti semplici. Ogni utente della piattaforma ricade in una delle due tipologie sopra indicate. Un utente premium può organizzare un evento sportivo.
Gli utenti semplici non possono organizzare eventi sportivi.
È prevista la possibilità per gli utenti –sia premium che semplici- di iscriversi agli eventi sportivi in stato APERTO presenti sulla piattaforma, in qualità di giocatore o di arbitro.
La piattaforma consente inoltre agli utenti premium di organizzare tornei per le varie categorie .
Un utente premium può registrare una squadra.
L’utente creatore può inserire direttamente gli utenti componenti la squadra o, alternativamente, un utente può candidarsi a partecipare a una squadra in formazione (per un certo ruolo), con il meccanismo descritto sopra per gli eventi. L’utente premium che ha registrato la squadra accetta o rifiuta la candidatura.
Ogni utente –sia semplice che premium- che ha partecipato ad un evento può eventualmente valutare la prestazione degli altri utenti giocatori; la valutazione include la data, un punteggio (da 0 a 10), un eventuale commento. 
 
 Evento:
 
 Ogni evento dispone di un identificativo univoco, una data di svolgimento, uno stato (APERTO/CHIUSO), e appartiene a una delle categorie tra quelle gestite dalla piattaforma. Ogni evento sportivo si svolge all’interno di un impianto del CUS Genova.
 
 Impianto:
 
 Per ogni impianto, si vuole tenere traccia di: nome (univoco), via, numero di telefono, indirizzo email, coordinate (latitudine/longitudine).
 
 Iscrizione:
 
 Ogni iscrizione fa riferimento a un evento sportivo, è effettuata in una certa data, può specificare un ruolo e, una volta esaminata, è associata a uno stato (CONFERMATO/RIFIUTATO), a seconda che l’utente premium organizzatore dell’evento abbia approvato o meno la richiesta di iscrizione. 
 
 
 
 
 Il numero totale di utenti giocatori CONFERMATI per un certo evento sportivo non può eccedere il numero di partecipanti previsti dalla categoria cui afferisce l’evento. Il numero totale di utenti arbitri CONFERMATI non può essere maggiore di 1 per un dato evento. Lo stato di un evento sportivo diventa CHIUSO quando si raggiunge un numero di giocatori pari a quello previsto dalla categoria (la presenza dell’arbitro è opzionale); in tal caso, non è più possibile effettuare iscrizioni all’evento. Se non viene raggiunto in tempo utile il minimo numero di giocatori necessario a disputare l’evento, questo viene cancellato e gli utenti iscritti vengono avvisati. È possibile per un partecipante confermato disiscriversi entro un tempo limite indicato dall’organizzatore, dopo tale limite potrà solo indicare un sostituto che parteciperà al suo posto.
 
 
 Esito:
 
 Inoltre, è prevista la possibilità di memorizzare l’esito di un evento sportivo. L’esito è immesso dall’utente organizzatore dell’evento stesso e contiene: il numero di goal/punti della prima squadra, il numero di goal/punti della seconda squadra, eventualmente il numero di goal/punti messi a segno da ciascun utente giocatore. 
 
 Tornei:
 
 I tornei hanno una descrizione, eventuali sponsor e premi, eventuali restrizioni per la partecipazione. I tornei consistono in un certo numero di eventi e sono organizzati in accordo a diverse modalità (eliminazione diretta, gironi all’italiana, mista).
Nel caso di tornei a squadre, la piattaforma supporta la formazione delle squadre. 
L’utente organizzatore del torneo inserisce tutti gli eventi che lo compongono.
Nel caso di tornei la squadra è formata inizialmente e non sono possibili sostituzioni di giocatori per singoli eventi.

Squadra:

Una squadra va registrata, specificando nome, colore maglia, numero partecipanti minimo e massimo, descrizione e eventuali note. La formazione della squadra risulta conclusa quando l’utente ne cambia lo stato in definitiva o quando viene raggiunto il limite massimo di candidature accettate. 



 
 Livello:
 
Ogni utente-giocatore è caratterizzato, relativamente a un certo sport, da un livello.
Il livello è un punteggio che, da 0 a 100, indica il valore di un giocatore in relazione alle partite che ha disputato e i voti che ha ricevuto. Il calcolo è legato ad un algoritmo che, partendo da un livello medio pari a 60, lo modifica partita per partita in base a diversi parametri di riferimento (voti ricevuti, esito partita, affidabilità voti, ...). I giocatori che non si siano presentati ad almeno una partita per cui sono registrati tra le ultime 20 (no show), o che abbiano fatto un ritardo nelle ultime 10 partite, o che abbiano richiesto una sostituzione nelle ultime 10 partite vengono “indicati” come inaffidabili (informazione visibile a tutti gli utenti premium).
