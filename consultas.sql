--==================================
--Rodrigo N. Wuerdig e Astelio Weber
------------------------------------
--FBD 2019/1
--==================================
--Item2.a)Definir um conjunto de 6 consultas úteisao seu UdD, sendo que cada umadelas deve envolver no mínimo 3 tabelas. 
--Os requisitos quantitativos são:
--	a.No mínimo uma delas deve necessitarser respondida com a cláusula group by
--
--	b.No mínimo duas delas deve necessitarser respondida com subconsulta;
--
--	c.No  mínimo  uma  delas  (diferente  da  consulta  acima)  deve necessitardo  operador  NOT  EXISTS  para responder 
--	questões do tipo TODOS ou NENHUM que <referencia>
--
--	d.Sua  base  de  dados  deve  estar  populada  de  forma  a  retornar  resultados  para  todas  consultas.
--	Recomenda-se que as instâncias sejam pensadas para testar se as consultas estão corretas, abrangendo vários resultados.
--
--	e.As consultas devem ser significativamente distintas entre si. Será considerada a utilidadee diversidadedas consultas.


-- > retorna o nickname da conta que paga a maior fatura
select NICKNAME from conta natural join cobranca natural join fatura 
group by VALOR, NICKNAME
having VALOR = (select max(VALOR)from fatura);

--> Retorna email e numero de caracteres da senha de usuarios com senha fraca (senha<8)
select EMAIL, SENHA_DIGEST from conta
group by EMAIL
having 8 > CHAR_LENGTH(SENHA_DIGEST);

--> Titulo mais favoritado
select max(distinct TITULO) from favoritos;