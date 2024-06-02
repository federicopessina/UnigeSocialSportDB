CREATE TABLE partite (
    id_partita INT PRIMARY KEY,
    id_torneo INT,
    id_squadra1 INT,
    id_squadra2 INT,
    data_partita TIMESTAMP,
    FOREIGN KEY (id_torneo) REFERENCES tornei(id_torneo)
);
