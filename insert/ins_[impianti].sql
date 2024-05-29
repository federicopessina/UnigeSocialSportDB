INSERT INTO public.impianti (
    via, telefono, email, coordinate, nome, id)
VALUES 
    ('Via V Maggio, 8', '0101234567', 'info@stadiolugi.com', ARRAY[44.404965, 8.944393]::numeric[], 'Stadio Luigi Ferraris', 1),
    ('Corso De Stefanis, 62', '0107654321', 'contact@paladiamante.com', ARRAY[44.422625, 8.939473]::numeric[], 'PalaDiamante', 2),
    ('Piazzale Atleti Azzurri d’Italia, 1', '0101122334', 'support@palacoge.com', ARRAY[44.439772, 8.956169]::numeric[], 'PalaCoge', 3),
    ('Via Don Giovanni Verità, 7', '0102233445', 'info@stadioacquaticogenova.com', ARRAY[44.393399, 8.967992]::numeric[], 'Stadio Acquatico di Genova', 4),
    ('Via delle Campanule, 19', '0103344556', 'admin@palafiumara.com', ARRAY[44.430692, 8.897282]::numeric[], 'PalaFiumara', 5);
