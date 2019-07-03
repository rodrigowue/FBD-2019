CREATE PROCEDURE aumenta_fatura()
LANGUAGE plpgsql    
AS $$
BEGIN
	set VALOR = VALOR;	
END;
$$;

CREATE TRIGGER compensa_valor
    AFTER DELETE ON fatura
    FOR EACH ROW
    EXECUTE PROCEDURE aumenta_fatura();

