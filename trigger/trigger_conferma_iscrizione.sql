-- trigger_conferma_iscrizione.sql
CREATE OR REPLACE FUNCTION conferma_iscrizione() RETURNS TRIGGER AS $$
DECLARE
    num_giocatori INT;
    num_arbitri INT;
BEGIN
    SELECT COUNT(*) INTO num_giocatori
    FROM public.iscrizioni_eventi
    WHERE "[eventi]_id" = NEW."[eventi]_id"
      AND ruolo = 'giocatore'
      AND "[stato_eventi]_stato" = 'CONFERMATO';

    SELECT COUNT(*) INTO num_arbitri
    FROM public.iscrizioni_eventi
    WHERE "[eventi]_id" = NEW."[eventi]_id"
      AND ruolo = 'arbitro'
      AND "[stato_eventi]_stato" = 'CONFERMATO';

    IF num_giocatori >= (SELECT numero_massimo_iscritti FROM public.eventi WHERE id = NEW."[eventi]_id") THEN
        UPDATE public.eventi SET e_aperto = false WHERE id = NEW."[eventi]_id";
    END IF;

    IF num_arbitri > 1 THEN
        RAISE EXCEPTION 'Non è possibile avere più di un arbitro per evento';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_conferma_iscrizione
AFTER INSERT OR UPDATE ON public.iscrizioni_eventi
FOR EACH ROW
EXECUTE FUNCTION conferma_iscrizione();
