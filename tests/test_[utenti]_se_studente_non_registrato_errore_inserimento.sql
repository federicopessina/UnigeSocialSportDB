-- test per la fkey "studenti_username"
INSERT INTO public.utenti(
	"[studenti]_username", e_premium, password)
	VALUES ('studente non presente', true, 'password');
