-- trigger_disiscrizione.sql
CREATE OR REPLACE FUNCTION verifica_disponibilita_discrizione() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.data < NEW.data_limite_disiscrizione THEN
        RAISE EXCEPTION 'Non è possibile disiscriversi dopo il limite di tempo indicato';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_disiscrizione
BEFORE DELETE OR UPDATE ON public.iscrizioni_eventi
FOR EACH ROW
EXECUTE FUNCTION verifica_disponibilita_discrizione();
