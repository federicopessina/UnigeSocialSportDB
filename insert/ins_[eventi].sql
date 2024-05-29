INSERT INTO public.eventi (
    data_di_svolgimento, e_aperto, numero_massimo_iscritti, tempo_limite_disiscrizione, tempo_limite_iscrizione, "[sport]_categoria", id, "[utenti]_username", "[impianti]_nome")
VALUES 
    ('2024-06-15', true, 50, '2024-06-10', '2024-06-13', 'calcio', 1, 'jdoe1', 'Stadio Luigi Ferraris'),
    ('2024-06-20', true, 40, '2024-06-15', '2024-06-18', 'volley', 2, 'asmith1', 'PalaDiamante'),
    ('2024-06-25', true, 30, '2024-06-20', '2024-06-23', 'basket', 3, 'bwhite1', 'PalaCoge'),
    ('2024-07-01', true, 20, '2024-06-26', '2024-06-29', 'tennis', 4, 'clark1', 'Stadio Acquatico di Genova'),
    ('2024-07-05', true, 10, '2024-07-01', '2024-07-04', 'beach volley', 5, 'ddavis1', 'PalaFiumara'),
    ('2024-07-10', true, 15, '2024-07-05', '2024-07-08', 'beach soccer', 6, 'emiller1', 'Stadio Luigi Ferraris'),
    ('2024-07-15', true, 25, '2024-07-10', '2024-07-13', 'cricket', 7, 'fthomas1', 'PalaDiamante'),
    ('2024-07-20', true, 12, '2024-07-15', '2024-07-18', 'TAG Rugby', 8, 'gjones1', 'PalaCoge'),
    ('2024-07-25', true, 8, '2024-07-20', '2024-07-23', 'Minigolf', 9, 'hlee1', 'Stadio Acquatico di Genova'),
    ('2024-07-30', true, 18, '2024-07-25', '2024-07-28', 'calcio', 10, 'ikim1', 'PalaFiumara'),
    ('2024-08-01', false, 50, '2024-07-25', '2024-07-28', 'volley', 11, 'jdoe1', 'Stadio Luigi Ferraris'),
    ('2024-08-05', false, 30, '2024-07-30', '2024-08-02', 'tennis', 12, 'asmith1', 'PalaDiamante');
