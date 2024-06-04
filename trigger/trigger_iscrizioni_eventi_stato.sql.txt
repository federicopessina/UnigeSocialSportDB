-- trigger_iscrizioni_eventi_stato.sql
CREATE OR REPLACE FUNCTION verifica_stato_iscrizioni() RETURNS TRIGGER AS $$
BEGIN
    IF NEW."[stato_eventi]_stato" = 'CHIUSO' THEN
        RAISE EXCEPTION 'Impossibile iscriversi a eventi chiusi';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_iscrizioni_eventi_stato
BEFORE INSERT OR UPDATE ON public.iscrizioni_eventi
FOR EACH ROW
EXECUTE FUNCTION verifica_stato_iscrizioni();
