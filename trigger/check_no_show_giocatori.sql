-- FUNCTION: public.check_no_show_players()

-- DROP FUNCTION IF EXISTS public.check_no_show_players();

CREATE OR REPLACE FUNCTION public.check_no_show_players()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    -- Update the e_affidabile status to false if no show in the last 20 events
    UPDATE public.affidabilita_utenti
    SET e_affidabile = false
    WHERE "[utenti]_username" = NEW."[utenti]_username"
      AND (
        SELECT COUNT(*)
        FROM public.iscrizioni_eventi
        WHERE "[utenti]_username" = NEW."[utenti]_username"
          AND "[esito_iscrizioni]_esito" = 'no show'
        ) >= 1; -- Check if there's at least one 'no show' in the last 20 events

    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.check_no_show_players()
    OWNER TO postgres;
CREATE TRIGGER trg_check_no_show_players
    AFTER INSERT OR UPDATE ON public.iscrizioni_eventi
    FOR EACH ROW
    EXECUTE FUNCTION public.check_no_show_players();
