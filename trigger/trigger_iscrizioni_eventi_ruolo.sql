-- trigger_iscrizioni_eventi_ruolo.sql
CREATE OR REPLACE FUNCTION verifica_ruolo_iscrizioni() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.ruolo NOT IN ('giocatore', 'arbitro') THEN
        RAISE EXCEPTION 'Il ruolo deve essere o giocatore o arbitro';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_iscrizioni_eventi_ruolo
BEFORE INSERT OR UPDATE ON public.iscrizioni_eventi
FOR EACH ROW
EXECUTE FUNCTION verifica_ruolo_iscrizioni();
