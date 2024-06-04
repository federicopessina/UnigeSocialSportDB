-- trigger_aggiorna_livello_utente.sql
CREATE OR REPLACE FUNCTION aggiorna_livello_utente() RETURNS TRIGGER AS $$
BEGIN
    UPDATE public.livelli
    SET livello = NEW.livello
    WHERE "[utenti]_username" = NEW."[utenti]_username"
      AND "[sport]_categoria" = NEW."[sport]_categoria";
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_aggiorna_livello_utente
AFTER INSERT OR UPDATE ON public.valutazione_prestazioni
FOR EACH ROW
EXECUTE FUNCTION aggiorna_livello_utente();
