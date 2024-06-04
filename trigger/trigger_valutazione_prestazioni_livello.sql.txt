-- trigger_valutazione_prestazioni_livello.sql
CREATE OR REPLACE FUNCTION verifica_valutazione_prestazioni() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.valutazione < 0 OR NEW.valutazione > 10 THEN
        RAISE EXCEPTION 'La valutazione deve essere compresa tra 0 e 10';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_valutazione_prestazioni_livello
BEFORE INSERT OR UPDATE ON public.valutazione_prestazioni
FOR EACH ROW
EXECUTE FUNCTION verifica_valutazione_prestazioni();
