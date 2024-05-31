INSERT INTO public.utenti (email, username, password, nome, cognome, "[stati_utenti]_stato") VALUES ('test@example.com', 'testuser', 'password', 'Test', 'User', 'ATTIVO');
SELECT * FROM public.utenti WHERE username = 'testuser';
