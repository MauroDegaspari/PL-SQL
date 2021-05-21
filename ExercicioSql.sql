-- MV SISTEMAS
-- CURSO: SQL-
-- PROGRAMA: MULTIPLIKA UMV
-- FACILITADOR: JOÃO FERRAZ
-- COLABORADOR: MAURO DEGASPARI
-- EQUIPE: SUPRIMENTOS
-- DATA DE REFERÊNCIA: 05/2021

                                      -- DESAFIOS --

-- 1 – Criar uma View podendo usar sub-select para retornar as colunas Código do Usuário,
--  Código do produto, nome do produto, nome da espécie, utilizando a configuração de usuário por classificação de estoque
-- (dbamv.usuário_espécie). Lembrando que nessa tabela o código do usuário e a espécie são obrigatórios, mas se forem preenchidas as
--  colunas classe, sub-classe e produto a configuração fica mais restrita.

            SELECT * FROM dbamv.usuarios_especie;                     CREATE OR REPLACE VIEW v_codigoUsuario  AS
            SELECT
            FROM
            WHERE;

--  2 – Criar uma tabela de cópia de produtos e criar um script de merge mantendo a cópia atualizada.

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





-- 3 – Criar uma consulta de saldo (dbamv.est_pro) de produtos (dbamv.produto) da espécie medicamentos, que não estão na tabela
--     de item de prescrição (dbamv.tip_presc). Deve exibir nessa lista o código e nome do estoque, código e nome do produto, o código
--     e o nome do mestre na mesma linha, a unidade padrão de acordo com a função e o saldo atual.
--     Para os produtos que não tem mestre informar na descrição o texto ‘MESTRE NÃO INFORMADO’.

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



-- 4 – Inserir uma nova fábrica na tabela DBAMV.FABRICA, inserir novos carros, inserir todos
--     acessórios já existentes para os novos carros usando um sub-select.

            CREATE TABLE DBAMV.FABRICA(CD_FABRICA     NUMBER(12) NOT NULL,
                                       NM_FABRICA     VARCHAR2(100) NOT NULL,
                                       DT_CADASTRO    DATE DEFAULT SYSDATE NOT NULL,
                                       DT_DESATIVACAO DATE,
                                       SN_ATIVA       VARCHAR2(1) DEFAULT 'S' NOT NULL );0

            SELECT * FROM dbamv.fabrica;


-- 5 -  Crie uma consulta na ultima consolidação (dbamv.c_conest) , somando valor final de estoque, agrupando por estoque,
--     e mostrando o percentual do saldo final de cada estoque. O único filtro da consulta deve ser o Código da empresa.

  SELECT * FROM dbamv.c_conest
   WHERE cd_ano = 2021
    AND cd_mes = 4
   ORDER BY cd_ano DESC, cd_mes desc;


-- 6 – Criar a atualização da coluna do saldo da tabela dbam.lot_pro usando a função dbamv.fnc_mges_saldo_anterior_lote (essa função retorna
--      o saldo calulado do lote, pra o saldo atual user com parametro a função de data e hora atual). O filtro deve ser
--      o estoque e produto. Lembrando que a função retorna o saldo na unidade padrão e a lot_pro guarda o saldo na unidade de referencia.


-- 7 – Faça uma consulta usando como parametro a função sysdate e utilizando as funções de data retorne o primeiro dia do ano, primeiro dia
--     do ano seguinte,  primeiro dia do mês, ultimo dia do mês, quantidade de dias do ano até a data atual.

-- 8 – Crie uma consulta para retirar descrição do produto os textos (MESTRE), (M) e MESTRE, para produtos que não são mestres.

-- 9 – Crie uma consulta que torne a descrição do produto, o tipo (sn_mestre – retornar a palavra NORMAL, MESTRE ou OUTROS)
--     e a quantidade de repetições. Só retornar os produto que tem mais de uma ocorrência, ou seja os produtos duplicados.
SELECT * FROM
dbamv.produto;

-- 10 -  Coloque no nosso grupo do treinamento no Teams um trecho de código novo que você aprendeu ou que achou mais
--       interessante durante o curso.