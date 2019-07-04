--==================================
--Rodrigo N. Wuerdig e Astelio Weber
------------------------------------
--FBD 2019/1
--==================================

insert into diretor values('AR0','Anthony Russo','US');
insert into diretor values('JR0','Joe Russo','US');
insert into diretor values('ING','Ingmar Bergman','SW');
insert into diretor values('SSS','Shinsuke Sato','JP');
insert into diretor values('RBL','Rob Letterman','US');
insert into diretor values('FMB','Fernando Meirelles','BR');

insert into ator values('JSM','Justice Smith','US');
insert into ator values('RRM','Ryan Reynolds','US');
insert into ator values('LBM','Lucas Black','US');
insert into ator values('SKM','Sung Kang','US');
insert into ator values('NKM','Nathalie Kelley','PR');
insert into ator values('ABR','Alice Braga','BR');


insert into genero values('Comedia');
insert into genero values('Acao');
insert into genero values('Documentario');
insert into genero values('Terror');
insert into genero values('Suspense');
insert into genero values('Drama');
insert into genero values('Aventura');
insert into genero values('Fantasia');

insert into estudio values('Universal Pictures','US');
insert into estudio values('Warner Bros.','US');
insert into estudio values('20th Century Fox','US');
insert into estudio values('Paramount Pictures','US');
insert into estudio values('Marvel Studios','US');
insert into estudio values('AB Svensk Filmindustri','SW');
insert into estudio values('Globo Filmes','BR');
insert into estudio values('Netflix','US');


insert into conta values('joaozinho@bol.com.br','eugostodesorvete','jao_pokemon_2000','0');
insert into conta values('mariazinha@yahoo.com.br','rebeldes1995','zinha23','0');
insert into conta values('carlosrockandroll@terra.com.br','senha','alucard','0');
insert into conta values('fausto@bol.com.br','selenagomez','olokinho','0');
insert into conta values('pericles@exalta.com.br','billieeilish','superM4ssiv3St4r','0');

insert into perfil values('joao','1');
insert into perfil values('maria','0');
insert into perfil values('carlos','1');
insert into perfil values('Fausto Silva','0');
insert into perfil values('Selena Gomez','0');
insert into perfil values('Periclao','0');

insert into midia values('Vingadores Ultimato','2019','thanos morre','0');
insert into midia values('Velozes e Furiosos Desafio em Porto Alegre','2020','Os motoristas do D43 e T10 entram em uma disputa nunca vista antes pelas ruas da capital gaucha','21');
insert into midia values('Seventh Seal','1957','Um cara joga xadrez com a morte e morre','0');	
insert into midia values('Detetive Pikachu','2019','Um jovem descontente investiga a morte de seu pai com um rato eletrico','21');
insert into midia values('Bleach','2019','um jovem que ve gente morta','5');

insert into filmes values('Vingadores Ultimato','2019','thanos morre','0','server_do_cleber/vigadores_acabo.mp4','server_do_cleber/prev_ving_acabo.mp4','03:02:06');
insert into filmes values('Velozes e Furiosos Desafio em Porto Alegre','2020','Os motoristas do D43 e T10 entram em uma disputa nunca vista antes pelas ruas da capital gaucha','21','server_do_cleber/tokyodrift.mp4','server_do_cleber/prev_drift.mp4','01:45:01');
insert into filmes values('Seventh Seal','1957','Um cara joga xadrez com a morte e morre','0','baiadospirata/setimo_selo.mp4','baiadospirata/prev_seventh_seal.mp4','01:36:06');
insert into filmes values('Detetive Pikachu','2019','Um jovem descontente investiga a morte de seu pai com um rato eletrico','21','baiadospirata/detetive_pikachu.mp4','baiadospirata/prev_pikachu.mp4','02:02:03');
insert into filmes values('Bleach','2019','um jovem que ve gente morta','5','baiadospirata/bleach_live_action.mp4','server_do_cleber/prev_bleach.mp4','01:52:01');

insert into series values('GoT','2019','um jovem que ve gente morta','5','1');
insert into series values('Paradas Sinistras','2019','um jovem que ve gente morta','5','1');
insert into series values('Chernobyl','2019','um jovem que ve gente morta','5','1');
insert into series values('Lost','2019','um jovem que ve gente morta','5','1');

insert into fatura values('2019','10','99.99');
insert into fatura values('2019','12','96.29');
insert into fatura values('2020','03','97.63');
insert into fatura values('2021','02','89.99');
insert into fatura values('2020','11','99.97');

insert into favoritos values('Vingadores Ultimato');
insert into favoritos values('Velozes e Furiosos Desafio em Porto Alegre');
insert into favoritos values('Seventh Seal');
insert into favoritos values('Detetive Pikachu');
insert into favoritos values('Bleach');

insert into vale_presente values('HUFIAU','9');
insert into vale_presente values('21iuHF','7');
insert into vale_presente values('ASJDHG','3');
insert into vale_presente values('KNSABD','12');
insert into vale_presente values('89SSAD','4');

insert into cartao values('ASHnui','122341234','111','01/10/2021','05555592055','Pericles');
insert into cartao values('ASGJFl','772111234','222','01/06/2022','86655592055','Fausto Silva');
insert into cartao values('ASJFMK','667722214','333','01/09/2027','65555597757','Marlene');
insert into cartao values('ASHSS2','122341666','777','01/12/2024','15955599959','Sergio');
insert into cartao values('AJIBF2','663414934','666','01/01/2021','15555592055','Robertson');

insert into temporada values('666','2019','como tudo foi pelos ares em chernobyl','prev_chern.mp4','5');
insert into temporada values('777','2009','Uns cara caem em uma ilha deserta','prev_lost01.mp4','7');
insert into temporada values('778','2009','Tem uma fumaca na ilha que desaparece com as pessoas','prev_lost02.mp4','6');
insert into temporada values('779','2010','Se nao apertar o botao todo mundo morre da ilha ','prev_lost03.mp4','7');
insert into temporada values('780','2011','Ta todo mundo morto ','prev_lost06.mp4','7');

insert into episodio values('666','01:35:02','Ferrou geral, pegou fogo no reator nuclear' , 'chernobyls01e01.mp4');
insert into episodio values('999','01:30:00','Ferrou mais ainda, os cara sao pilantra.', 'chernobyls01e01.mp4');
insert into episodio values('777','00:52:06','A menina tem altos poder da radiacao que ele tomou na cabeca', 'paradas_sinistras01e01.mp4');
insert into episodio values('555','00:55:01','O Jon Snow e muito perdido', 'gots06e04.mp4');
insert into episodio values('111','01:35:02','O cara faz drift para fazer teleentrega de tofu eba a agua', 'initialds01e01.mp4');

--=================================================
--Relacionamentos n-m
--=================================================

insert into dirige values('AR0','Vingadores Ultimato');
insert into dirige values('JR0','Vingadores Ultimato');
insert into dirige values('ING','Seventh Seal');
insert into dirige values('SSS','Detetive Pikachu');
insert into dirige values('RBL','Bleach');

insert into atua values('JSM','Detetive Pikachu');
insert into atua values('RRM','Detetive Pikachu');
insert into atua values('LBM','Velozes e Furiosos Desafio em Porto Alegre');
insert into atua values('SKM','Velozes e Furiosos Desafio em Porto Alegre');
insert into atua values('NKM','Velozes e Furiosos Desafio em Porto Alegre');

insert into lanca values('Warner Bros.','Detetive Pikachu','05/05/2019');
insert into lanca values('Globo Filmes','Velozes e Furiosos Desafio em Porto Alegre','05/05/2020');
insert into lanca values('Marvel Studios','Vingadores Ultimato','05/05/2019');
insert into lanca values('AB Svensk Filmindustri','Seventh Seal','05/05/1957');
insert into lanca values('Netflix','Bleach','05/05/2019');


insert into assiste values('joao','Bleach','15/05/2019','00:10:20');
insert into assiste values('maria','Bleach','15/05/2019','00:10:20');
insert into assiste values('carlos','Bleach','15/05/2019','00:10:20');
insert into assiste values('Fausto Silva','Bleach','15/05/2019','00:10:20');
insert into assiste values('Periclao','Bleach','15/05/2019','00:10:20');
insert into assiste values('Periclao','Detetive Pikachu','15/05/2019','00:50:20');

--=================================================
--Relacionamentos não n-m
--=================================================

insert into classifica values('Vingadores Ultimato','Fantasia');
insert into classifica values('Velozes e Furiosos Desafio em Porto Alegre','Acao');
insert into classifica values('Seventh Seal','Drama');
insert into classifica values('Seventh Seal','Fantasia');
insert into classifica values('Detetive Pikachu','Acao');
insert into classifica values('Detetive Pikachu','Aventura');
insert into classifica values('Bleach','Acao');
insert into classifica values('Bleach','Fantasia');
insert into classifica values('Bleach','Aventura');


insert into possui values('joao','joaozinho@bol.com.br');
insert into possui values('maria','mariazinha@yahoo.com.br');
insert into possui values('carlos','carlosrockandroll@terra.com.br');
insert into possui values('Fausto Silva','fausto@bol.com.br');
insert into possui values('Selena Gomez','fausto@bol.com.br');
insert into possui values('Periclao','pericles@exalta.com.br');

insert into cobranca values('2019','10','joaozinho@bol.com.br');
insert into cobranca values('2019','12','mariazinha@yahoo.com.br');
insert into cobranca values('2020','03','carlosrockandroll@terra.com.br');
insert into cobranca values('2021','02','fausto@bol.com.br');
insert into cobranca values('2020','11','pericles@exalta.com.br');

insert into favoritou values('Vingadores Ultimato','joao');
insert into favoritou values('Seventh Seal','joao');
insert into favoritou values('Vingadores Ultimato','maria');
insert into favoritou values('Seventh Seal','carlos');
insert into favoritou values('Seventh Seal','Fausto Silva');
insert into favoritou values('Seventh Seal','Selena Gomez');

insert into contem values('Chernobyl','666');
insert into contem values('Lost','777');
insert into contem values('Lost','778');
insert into contem values('Lost','779');
insert into contem values('Lost','780');


insert into compoe values('666','666');
insert into compoe values('666','999');
insert into compoe values('777','777');
insert into compoe values('777','555');
insert into compoe values('777','111');


