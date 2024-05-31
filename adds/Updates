
CREATE OR REPLACE FUNCTION update_affidabilita() RETURNS TRIGGER AS $$
BEGIN
   IF (NEW."[esito_iscrizioni]_esito" = 'NO_SHOW' OR NEW."[esito_iscrizioni]_esito" = 'RITARDO' OR NEW."[esito_iscrizioni]_esito" = 'SOSTITUZIONE') THEN
      UPDATE public.affidabilita_utenti SET e_affidabile = false WHERE "[utenti]_username" = NEW."[utenti]_username";
   END IF;
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_affidabilita
AFTER INSERT OR UPDATE ON public.iscrizioni_eventi
FOR EACH ROW
EXECUTE FUNCTION update_affidabilita();
