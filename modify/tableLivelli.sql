CREATE TABLE Livelli (
    livello_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Utenti(user_id),
    sport_id INT REFERENCES Sport(sport_id),
    livello INT CHECK (livello BETWEEN 0 AND 100) DEFAULT 60
);
