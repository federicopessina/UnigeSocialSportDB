-- trigger_verifica_disponibilita_impianto.sql
CREATE OR REPLACE FUNCTION verifica_disponibilita_impianto() RETURNS TRIGGER AS $$
DECLARE
    impianto_disponibile BOOLEAN;
BEGIN
    SELECT NOT EXISTS (
        SELECT 1 FROM public.eventi
        WHERE "[impianti]_nome" = NEW."[impianti]_nome"
        AND data_di_svolgimento = NEW.data_di_svolgimento
    ) INTO impianto_disponibile;

    IF impianto_disponibile THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Impianto % non è disponibile in data %', NEW."[impianti]_nome", NEW.data_di_svolgimento;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verifica_disponibilita_impianto
BEFORE INSERT OR UPDATE ON public.eventi
FOR EACH ROW
EXECUTE FUNCTION verifica_disponibilita_impianto();
