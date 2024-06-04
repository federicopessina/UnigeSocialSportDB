-- FUNCTION: public.assegna_ruolo()

-- DROP FUNCTION IF EXISTS public.assegna_ruolo();

CREATE OR REPLACE FUNCTION public.assegna_ruolo()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    IF NEW.e_premium = true THEN
        EXECUTE format('GRANT utente_premium TO %I', NEW."[studenti]_username");
    ELSE
        EXECUTE format('GRANT utente_semplice TO %I', NEW."[studenti]_username");
    END IF;
    RETURN NEW;
END;
$BODY$;
CREATE OR REPLACE FUNCTION assegna_ruolo() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.e_premium = true THEN
        EXECUTE format('GRANT utente_premium TO %I', NEW."[studenti]_username");
    ELSE
        EXECUTE format('GRANT utente_semplice TO %I', NEW."[studenti]_username");
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trigger_assegna_ruolo
AFTER INSERT ON public.utenti
FOR EACH ROW
EXECUTE FUNCTION assegna_ruolo();

ALTER FUNCTION public.assegna_ruolo()
    OWNER TO postgres;
