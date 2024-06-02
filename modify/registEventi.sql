CREATE OR REPLACE FUNCTION register_event(user_id INT, evento_id INT, ruolo VARCHAR) RETURNS VOID AS $$
BEGIN
    INSERT INTO Iscrizioni_Eventi (user_id, evento_id, data_iscrizione, ruolo, stato)
    VALUES (user_id, evento_id, CURRENT_DATE, ruolo, 'PENDING');
END;
$$ LANGUAGE plpgsql;

-- Trigger per aggiornare eventi
CREATE OR REPLACE FUNCTION update_event_status() RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) FROM Iscrizioni_Eventi WHERE evento_id = NEW.evento_id AND stato = 'CONFERMATO') >= 
       (SELECT numero_giocatori FROM Categorie WHERE categoria_id = (SELECT categoria_id FROM Eventi WHERE evento_id = NEW.evento_id)) THEN
        UPDATE Eventi SET stato = 'CHIUSO' WHERE evento_id = NEW.evento_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_event_status
AFTER INSERT OR UPDATE ON Iscrizioni_Eventi
FOR EACH ROW EXECUTE FUNCTION update_event_status();
