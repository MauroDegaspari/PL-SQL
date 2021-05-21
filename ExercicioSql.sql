-- MV SISTEMAS
-- CURSO: SQL-
-- PROGRAMA: MULTIPLIKA UMV
-- FACILITADOR: JO�O FERRAZ
-- COLABORADOR: MAURO DEGASPARI
-- EQUIPE: SUPRIMENTOS
-- DATA DE REFER�NCIA: 05/2021

                                      -- DESAFIOS --

-- 1 � Criar uma View podendo usar sub-select para retornar as colunas C�digo do Usu�rio,
--  C�digo do produto, nome do produto, nome da esp�cie, utilizando a configura��o de usu�rio por classifica��o de estoque
-- (dbamv.usu�rio_esp�cie). Lembrando que nessa tabela o c�digo do usu�rio e a esp�cie s�o obrigat�rios, mas se forem preenchidas as
--  colunas classe, sub-classe e produto a configura��o fica mais restrita.

            SELECT * FROM dbamv.usuarios_especie;                     CREATE OR REPLACE VIEW v_codigoUsuario  AS
            SELECT
            FROM
            WHERE;

--  2 � Criar uma tabela de c�pia de produtos e criar um script de merge mantendo a c�pia atualizada.

        CREATE TABLE t_produtoCopia (
          cd_produto NUMBER,
          ds_produto VARCHAR2(255),
          qt_produto NUMBER,
          dt_cadastro DATE
            );

            SELECT * FROM produto;
            SELECT * FROM t_produtoCopia;

            SELECT * FROM t_produtoCopia;


         MERGE INTO dbamv.t_produtoCopia copia
          USING  dbamv.produto original
          ON     (copia.cd_produto = original.cd_produto)
          WHEN MATCHED THEN
                UPDATE SET
                copia.ds_produto = original.ds_produto,
                copia.qt_produto = original.qt_estoque_atual,
                copia.dt_cadastro = original.dt_cadastro
          WHEN NOT MATCHED THEN
                   INSERT (cd_produto, ds_produto, qt_produto, dt_cadastro)
                   VALUES(original.cd_produto, original.ds_produto, original.qt_estoque_atual, original.dt_cadastro);





-- 3 � Criar uma consulta de saldo (dbamv.est_pro) de produtos (dbamv.produto) da esp�cie medicamentos, que n�o est�o na tabela
--     de item de prescri��o (dbamv.tip_presc). Deve exibir nessa lista o c�digo e nome do estoque, c�digo e nome do produto, o c�digo
--     e o nome do mestre na mesma linha, a unidade padr�o de acordo com a fun��o e o saldo atual.
--     Para os produtos que n�o tem mestre informar na descri��o o texto �MESTRE N�O INFORMADO�.

        SELECT e.cd_estoque,p.cd_produto, p.ds_produto
        FROM dbamv.est_pro e,
             dbamv.produto p;
        WHERE

            NOT IN
            NOT EXISTS

        SELECT * FROM dbamv.tip_presc;

        SELECT e.cd_estoque, p.cd_produto, p.ds_produto
        FROM dbamv.est_pro e, dbamv.produto p, dbamv.tip_presc t
        WHERE;



-- 4 � Inserir uma nova f�brica na tabela DBAMV.FABRICA, inserir novos carros, inserir todos
--     acess�rios j� existentes para os novos carros usando um sub-select.

            CREATE TABLE DBAMV.FABRICA(CD_FABRICA     NUMBER(12) NOT NULL,
                                       NM_FABRICA     VARCHAR2(100) NOT NULL,
                                       DT_CADASTRO    DATE DEFAULT SYSDATE NOT NULL,
                                       DT_DESATIVACAO DATE,
                                       SN_ATIVA       VARCHAR2(1) DEFAULT 'S' NOT NULL );0

            SELECT * FROM dbamv.fabrica;


-- 5 -  Crie uma consulta na ultima consolida��o (dbamv.c_conest) , somando valor final de estoque, agrupando por estoque,
--     e mostrando o percentual do saldo final de cada estoque. O �nico filtro da consulta deve ser o C�digo da empresa.

  SELECT * FROM dbamv.c_conest
   WHERE cd_ano = 2021
    AND cd_mes = 4
   ORDER BY cd_ano DESC, cd_mes desc;


-- 6 � Criar a atualiza��o da coluna do saldo da tabela dbam.lot_pro usando a fun��o dbamv.fnc_mges_saldo_anterior_lote (essa fun��o retorna
--      o saldo calulado do lote, pra o saldo atual user com parametro a fun��o de data e hora atual). O filtro deve ser
--      o estoque e produto. Lembrando que a fun��o retorna o saldo na unidade padr�o e a lot_pro guarda o saldo na unidade de referencia.


-- 7 � Fa�a uma consulta usando como parametro a fun��o sysdate e utilizando as fun��es de data retorne o primeiro dia do ano, primeiro dia
--     do ano seguinte,  primeiro dia do m�s, ultimo dia do m�s, quantidade de dias do ano at� a data atual.

-- 8 � Crie uma consulta para retirar descri��o do produto os textos (MESTRE), (M) e MESTRE, para produtos que n�o s�o mestres.

-- 9 � Crie uma consulta que torne a descri��o do produto, o tipo (sn_mestre � retornar a palavra NORMAL, MESTRE ou OUTROS)
--     e a quantidade de repeti��es. S� retornar os produto que tem mais de uma ocorr�ncia, ou seja os produtos duplicados.
SELECT * FROM
dbamv.produto;

-- 10 -  Coloque no nosso grupo do treinamento no Teams um trecho de c�digo novo que voc� aprendeu ou que achou mais
--       interessante durante o curso.