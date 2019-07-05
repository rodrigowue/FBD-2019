
CREATE OR REPLACE procedure aumenta_fatura(dindin money)
AS $$
declare numeroFaturas integer;
declare valorunitario money;
BEGIN
	select count(*) into numeroFaturas from fatura;
	valorunitario := dindin/numeroFaturas;
    update fatura
	set VALOR = VALOR + valorunitario;
END ;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION check_conta()
    RETURNS TRIGGER
    SET SCHEMA 'public'
    LANGUAGE plpgsql
    AS $$
    BEGIN
    IF LENGTH(NEW.NICKNAME) = 0 THEN
        RAISE EXCEPTION 'Login name must not be empty.';
    END IF;
 	IF LENGTH(NEW.EMAIL) = 0 THEN
        RAISE EXCEPTION 'Email must not be empty.';
    END IF;
    IF POSITION(' ' IN NEW.NICKNAME) > 0 THEN
        RAISE EXCEPTION 'Login name must not include white space.';
    END IF;
   	IF POSITION(' ' IN NEW.EMAIL) > 0 THEN
        RAISE EXCEPTION 'Email must not include white space.';
    END IF;
    RETURN NEW;
    END;
    $$;

CREATE TRIGGER check_conta 
    BEFORE INSERT ON conta
    FOR EACH ROW EXECUTE PROCEDURE check_conta();

