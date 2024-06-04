-- FUNCTION: public.verifica_iscrizioni_confermate()

-- DROP FUNCTION IF EXISTS public.verifica_iscrizioni_confermate();

CREATE OR REPLACE FUNCTION public.verifica_iscrizioni_confermate()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
    num_giocatori INT;
    num_arbitri INT;
    max_giocatori INT;
BEGIN
   
    SELECT numero_di_giocatori INTO max_giocatori
    FROM sport
    WHERE categoria = (SELECT "[sport]_categoria" FROM eventi WHERE id = NEW."[eventi]_id");

    SELECT COUNT(*) INTO num_giocatori
    FROM iscrizioni_eventi
    WHERE "[eventi]_id" = NEW."[eventi]_id"
      AND ruolo = 'giocatore'
      AND "[stato_eventi]_stato" = 'CONFERMATO';

    SELECT COUNT(*) INTO num_arbitri
    FROM iscrizioni_eventi
    WHERE "[eventi]_id" = NEW."[eventi]_id"
      AND ruolo = 'arbitro'
      AND "[stato_eventi]_stato" = 'CONFERMATO';

    IF num_giocatori >= max_giocatori THEN
        UPDATE eventi SET e_aperto = false WHERE id = NEW."[eventi]_id";
    END IF;

    IF num_arbitri > 1 THEN
        RAISE EXCEPTION 'Non è possibile avere più di un arbitro confermato per evento';
    END IF;

    IF num_giocatori >= max_giocatori THEN
        UPDATE eventi SET e_aperto = false WHERE id = NEW."[eventi]_id";
    END IF;

    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.verifica_iscrizioni_confermate()
    OWNER TO postgres;
