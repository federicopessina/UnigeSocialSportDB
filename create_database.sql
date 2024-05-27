-- Database: UnigeSocialSportDB

-- DROP DATABASE IF EXISTS "UnigeSocialSportDB";

CREATE DATABASE "UnigeSocialSportDB"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE "UnigeSocialSportDB"
    IS 'Database per permettere agli studenti di organizzare partite di sport di squadra presso le strutture del CUS Genova, di partecipare ad eventi sportivi, di interagire con altri utenti attraverso news e meccanismi di rating.';