SELECT * FROM public.iscrizioni_eventi ie
WHERE NOT EXISTS (SELECT 1 FROM public.eventi e WHERE e.id = ie."[eventi]_id");
