INSERT INTO public.tornei (
    id, sponsor, descrizione, restrizioni_partecipazione, "[utenti]_username", premi, "[eventi]_id", "[modalita]_descrizione")
VALUES 
    (1, ARRAY['Sponsor A'], 'Torneo Calcio e Volley', ARRAY['Over 18'], 'jdoe1', ARRAY['Coppa', 'Medaglie'], 1, 'eliminazione diretta'),
    (1, ARRAY['Sponsor A'], 'Torneo Calcio e Volley', ARRAY['Over 18'], 'jdoe1', ARRAY['Coppa', 'Medaglie'], 2, 'eliminazione diretta'),
    
    (2, ARRAY['Sponsor B'], 'Torneo Basket e Tennis', ARRAY['Solo Membri'], 'bwhite1', ARRAY['Trofeo', 'Premio in denaro'], 3, 'gironi all’italiana'),
    (2, ARRAY['Sponsor B'], 'Torneo Basket e Tennis', ARRAY['Solo Membri'], 'bwhite1', ARRAY['Trofeo', 'Premio in denaro'], 4, 'gironi all’italiana'),
    
    (3, ARRAY['Sponsor C'], 'Torneo Beach Volley, Beach Soccer e Cricket', ARRAY['Aperto a tutti'], 'fthomas1', ARRAY['Medaglie', 'Gadget'], 5, 'mista'),
    (3, ARRAY['Sponsor C'], 'Torneo Beach Volley, Beach Soccer e Cricket', ARRAY['Aperto a tutti'], 'fthomas1', ARRAY['Medaglie', 'Gadget'], 6, 'mista'),
    (3, ARRAY['Sponsor C'], 'Torneo Beach Volley, Beach Soccer e Cricket', ARRAY['Aperto a tutti'], 'fthomas1', ARRAY['Medaglie', 'Gadget'], 7, 'mista');
