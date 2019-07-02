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
--==================================


--a.b> retorna o nickname da conta que paga a maior fatura
select NICKNAME from conta natural join cobranca natural join fatura 
group by VALOR, NICKNAME
having VALOR = (select max(VALOR)from fatura);


--a.b> Retorna nome do diretor do filme mais antigo
select distinct NOMED from diretor
where IDd in (select distinct IDd
			 from dirige natural join midia
			 group by ANO, IDd
			 having ANO = (select min(ANO) from midia));


--c.> Contas que não tem perfil KIDS
select distinct NICKNAME
from conta c1
Where not exists (select * 
	From possui natural join perfil
	Where EMAIL = c1.EMAIL and
 	NOME_PERFIL IN (select distinct NOME_PERFIL
	From possui natural join perfil
	Where KIDS = '1'));


--> Retorna email e numero de caracteres da senha de usuarios com senha fraca (senha<8)
select EMAIL, SENHA_DIGEST from conta
group by EMAIL
having 8 > CHAR_LENGTH(SENHA_DIGEST);


--> Titulo mais favoritado
select max(distinct TITULO) from favoritos;

--> Retorna o numero de temporadas de Cada Serie
select distinct(NOME_MIDIA), count(IDt) from series natural join contem group by NOME_MIDIA;



--==================================
--Item2.b)Definir uma visãoútil a seu universo de discurso. Desenvolver duas consultasigualmente úteis que utilizem
--==================================

--> Visao util ao universo de discurso
Create view lancamentos AS select * from midia
group by NOME_MIDIA, ANO, SINOPSE, CLASSIFICACAO
having ANO > '2018';

--> Consulta 1 - Utilizando a view de lancamentos
select distinct NOME_MIDIA,CLASSIFICACAO from lancamentos group by NOME_MIDIA, CLASSIFICACAO having CLASSIFICACAO > '18';

--> Consulta 2 - Utilizando a view de lancamentos
select distinct(NOME_ATOR), NOME_MIDIA from ator natural join atua natural join lancamentos;