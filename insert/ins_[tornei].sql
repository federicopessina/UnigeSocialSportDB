INSERT INTO public.tornei (
    id, sponsor, descrizione, restrizioni_partecipazione, "[utenti]_username", premi, "[eventi]_id", "[modalita]_descrizione")
VALUES 
    (1, ARRAY['Sponsor A'], 'Torneo Descrizione 1', ARRAY['Over 18'], 'jdoe1', ARRAY['Coppa', 'Medaglie'], 1, 'eliminazione diretta'),
    (1, ARRAY['Sponsor A'], 'Torneo Descrizione 2', ARRAY['Over 18'], 'jdoe1', ARRAY['Coppa', 'Medaglie'], 11, 'eliminazione diretta'),
    
    (2, ARRAY['Sponsor B'], 'Torneo Descrizione 2', ARRAY['Solo Membri'], 'bwhite1', ARRAY['Trofeo', 'Premio in denaro'], 3, 'gironi all’italiana'),
    (2, ARRAY['Sponsor B'], 'Torneo Descrizione 3', ARRAY['Solo Membri'], 'bwhite1', ARRAY['Trofeo', 'Premio in denaro'], 5, 'gironi all’italiana'),
    
    (3, ARRAY['Sponsor C'], 'Torneo Descrizione 4, Beach Soccer e Cricket', ARRAY['Aperto a tutti'], 'fthomas1', ARRAY['Medaglie', 'Gadget'], 5, 'mista'),
    (3, ARRAY['Sponsor C'], 'Torneo Descrizione 4, Beach Soccer e Cricket', ARRAY['Aperto a tutti'], 'fthomas1', ARRAY['Medaglie', 'Gadget'], 9, 'mista'),
    (3, ARRAY['Sponsor C'], 'Torneo Descrizione 5, Beach Soccer e Cricket', ARRAY['Aperto a tutti'], 'fthomas1', ARRAY['Medaglie', 'Gadget'], 7, 'mista');
