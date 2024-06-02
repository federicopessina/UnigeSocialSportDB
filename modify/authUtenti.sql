CREATE TABLE ruoli (
    id_ruolo INT PRIMARY KEY,
    nome_ruolo VARCHAR(50)
);

CREATE TABLE ruoli_utenti (
    id_utente INT,
    id_ruolo INT,
    FOREIGN KEY (id_utente) REFERENCES utenti(id_utente),
    FOREIGN KEY (id_ruolo) REFERENCES ruoli(id_ruolo)
);
