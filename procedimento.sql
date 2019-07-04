drop procedure aumenta_fatura; 
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

drop trigger compensa_valor on fatura;

CREATE TRIGGER compensa_valor
    BEFORE DELETE ON fatura
	REFERENCING OLD ROW AS N 
	CALL aumenta_fatura(N.VALOR);