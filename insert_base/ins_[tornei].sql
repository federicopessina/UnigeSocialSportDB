INSERT INTO public.tornei (
    id, sponsor, descrizione, restrizioni_partecipazione, "[utenti]_username", premi, "[eventi]_id", "[modalita]_descrizione")
VALUES 
    -- Primo torneo con due eventi
    (1, ARRAY['Nike', 'Adidas'], 'Torneo di Calcio e Volley', ARRAY['over 18'], 'jdoe1', ARRAY['Coppa', 'Medaglie'], 1, 'gironi all’italiana'),
    (1, ARRAY['Nike', 'Adidas'], 'Torneo di Calcio e Volley', ARRAY['over 18'], 'jdoe1', ARRAY['Coppa', 'Medaglie'], 2, 'gironi all’italiana'),
    
    -- Secondo torneo con due eventi
    (2, ARRAY['Puma'], 'Torneo di Basket e Tennis', ARRAY['under 25'], 'bwhite1', ARRAY['Trofeo', 'Medaglie'], 3, 'eliminazione diretta'),
    (2, ARRAY['Puma'], 'Torneo di Basket e Tennis', ARRAY['under 25'], 'bwhite1', ARRAY['Trofeo', 'Medaglie'], 4, 'eliminazione diretta'),

    -- Terzo torneo con tre eventi
    (3, ARRAY['Reebok'], 'Torneo Multisport', ARRAY['amatori'], 'clark1', ARRAY['Medaglie', 'Buoni acquisto'], 5, 'mista'),
    (3, ARRAY['Reebok'], 'Torneo Multisport', ARRAY['amatori'], 'clark1', ARRAY['Medaglie', 'Buoni acquisto'], 6, 'mista'),
    (3, ARRAY['Reebok'], 'Torneo Multisport', ARRAY['amatori'], 'clark1', ARRAY['Medaglie', 'Buoni acquisto'], 7, 'mista');
