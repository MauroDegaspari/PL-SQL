-- MV SISTEMAS
-- CURSO: SQL-
-- PROGRAMA: MULTIPLIKA UMV
-- FACILITADOR: JOÃO FERRAZ
-- COLABORADOR: MAURO DEGASPARI
-- EQUIPE: SUPRIMENTOS
-- DATA DE REFERÊNCIA: 05/2021

-- 08 37:00

                                      -- DESAFIOS --

-- 1 – Criar uma View podendo usar sub-select para retornar as colunas Código do Usuário,
--  Código do produto, nome do produto, nome da espécie, utilizando a configuração de usuário por classificação de estoque
-- (dbamv.usuário_espécie). Lembrando que nessa tabela o código do usuário e a espécie são obrigatórios, mas se forem preenchidas as
--  colunas classe, sub-classe e produto a configuração fica mais restrita.
             SELECT * FROM produto;
             SELECT * FROM especie;
             SELECT * FROM dbamv.usuarios_especie;
             SELECT * FROM ALL_CONSTRAINTS WHERE table_name LIKE 'produto';


            CREATE OR REPLACE VIEW DBAMV.Vdic_CODIGO_USUARIO
              AS SELECT ue.cd_usuario, p.cd_produto, p.ds_produto, e.ds_especie
                 FROM dbamv.usuarios_especie ue, dbamv.especie e, dbamv.produto p
                 WHERE p.cd_especie = ue.cd_especie;

             SELECT * FROM DBAMV.Vdic_CODIGO_USUARIO ;


--  2 – Criar uma tabela de cópia de produtos e criar um script de merge mantendo a cópia atualizada.

        CREATE TABLE DBAMV.PRODUTO_COPIA (
                                          cd_produto NUMBER,
                                          ds_produto VARCHAR2(255),
                                          qt_produto NUMBER,
                                          dt_cadastro DATE
            );

         SELECT * FROM PRODUTO_COPIA;

            SELECT * FROM produto;
          SELECT cd_produto, ds_produto
          FROM dbamv.produto
          WHERE ds_produto LIKE 'CA%' ;


         MERGE INTO DBAMV.PRODUTO_COPIA copia
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
        SELECT * FROM dbamv.est_pro;
        SELECT * FROM dbamv.produto;
        SELECT * FROM dbamv.tip_presc;

        SELECT e.cd_estoque, p.cd_produto, p.ds_produto, SUM(e.qt_estoque_atual)
        FROM dbamv.est_pro e,
             dbamv.produto p

        WHERE sn_mestre ='N';

            NOT IN
            NOT EXISTS





-- 4 – Inserir uma nova fábrica na tabela DBAMV.FABRICA, inserir novos carros, inserir todos
--     acessórios já existentes para os novos carros usando um sub-select.

--AULA VIDEO SQL 1 20210405

            CREATE TABLE DBAMV.FABRICA(CD_FABRICA     NUMBER NOT NULL,
                                       NM_FABRICA     VARCHAR2(100),
                                       DT_CADASTRO    DATE DEFAULT SYSDATE NOT NULL,
                                       DT_DESATIVACAO DATE,
                                       SN_ATIVA       VARCHAR2(1) DEFAULT 'S' NOT NULL );

          SELECT * FROM dbamv.fabrica;
          SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME LIKE 'FABRICA';
          ALTER TABLE DBAMV.FABRICA ADD CONSTRAINT CNT_FABRICA_CD_FABR_PK PRIMARY KEY(CD_FABRICA);
          ALTER TABLE DBAMV.FABRICA ADD CONSTRAINT CNT_FABRICA_SN_ATIVA_CK CHECK(SN_ATIVA IN('S','N'));
          CREATE SEQUENCE dbamv.seq_fabrica INCREMENT BY 1 START WITH 1 MAXVALUE 999999999999 NOCACHE NOCYCLE; -- criação de sequece

            SELECT dbamv.seq_fabrica.NEXTVAL
            FROM dual;

            SELECT * FROM user_sequences WHERE sequence_name LIKE 'seq_fabrica';
            SELECT Max(cd_fabrica) FROM dbamv.fabrica;
            ALTER TABLE dbamv.fabrica ADD


            SELECT * FROM dbamv.fabrica;


-- 5 -  Crie uma consulta na ultima consolidação (dbamv.c_conest) , somando valor final de estoque, agrupando por estoque,
--     e mostrando o percentual do saldo final de cada estoque. O único filtro da consulta deve ser o Código da empresa.

            SELECT cd_produto,
                  (vl_estoque_final+vl_estoque_final) vl_final,
                 Round(vl_estoque_final+vl_estoque_final)/vl_estoque_final*100 vl_percentual
            FROM dbamv.c_conest
            WHERE cd_ano = 2021
            AND cd_mes = 4
            ORDER BY cd_ano DESC, cd_mes desc;




-- 6 – Criar a atualização da coluna do saldo da tabela dbam.lot_pro usando a função dbamv.fnc_mges_saldo_anterior_lote (essa função retorna
--      o saldo calulado do lote, pra o saldo atual user com parametro a função de data e hora atual). O filtro deve ser
--      o estoque e produto. Lembrando que a função retorna o saldo na unidade padrão e a lot_pro guarda o saldo na unidade de referencia.

          SELECT * --Count(qt_estoque_atual) saldo_atual
          FROM dbamv.lot_pro
          WHERE  dt_validade = Trunc(SYSDATE-2);


         -- dbamv.fnc_mges_saldo_anterior_lote

          SELECT *
          FROM dbamv.fnc_mges_saldo_anterior_lote
          WHERE ;

-- 7 – Faça uma consulta usando como parametro a função sysdate e utilizando as funções de data retorne o primeiro dia do ano, primeiro dia
--     do ano seguinte,  primeiro dia do mês, ultimo dia do mês, quantidade de dias do ano até a data atual.

          SELECT SYSDATE AGORA,
                Trunc(SYSDATE, 'YEAR') FIRST_DAY_YEAr,
                Trunc(SYSDATE, 'YEAR') FIRST_DAY_YEAR,
                Trunc(SYSDATE, 'MONTH') FIRST_DAY_MOUTH,
                LAST_DAY(SYSDATE) LAST_DAY_MOUTH
          FROM DUAL;

-- 8 – Crie uma consulta para retirar descrição do produto os textos (MESTRE), (M) e MESTRE, para produtos que não são mestres.

          SELECT cd_produto,ds_produto
          FROM dbamv.produto
          WHERE sn_mestre = 'N'
          AND InStr(ds_produto, 'MESTRE')= 0
          AND InStr(ds_produto, '(MESTRE)')= 0
          AND InStr(ds_produto, '(M)')= 0;



-- 9 – Crie uma consulta que torne a descrição do produto, o tipo (sn_mestre – retornar a palavra NORMAL, MESTRE ou OUTROS)
--     e a quantidade de repetições. Só retornar os produto que tem mais de uma ocorrência, ou seja os produtos duplicados.

    SELECT * FROM dbamv.produto;

      SELECT ds_produto,
             Nvl(to_char(cd_produto_tem), 'Produto vazio') teste_text,
             Decode(sn_mestre, 'S','mestre','N','normal', 'outros') consulta_forma_decode,
             CASE sn_mestre WHEN 'S' THEN 'Mestre'
                            WHEN 'N' THEN 'NORMAL'
                            ELSE 'OUTROS'
                            END forma_consulta_mestre

      FROM dbamv.produto;

-- 10 -  Coloque no nosso grupo do treinamento no Teams um trecho de código novo que você aprendeu ou que achou mais
--       interessante durante o curso.

SELECT * FROM dbamv.produto;

SELECT p.cd_especie, p.ds_produto, Count(cd_produto) qtd_produto
FROM dbamv.produto p, dbamv.especie e
WHERE p.cd_especie = e.cd_especie
GROUP BY p.cd_especie, p.ds_produto
ORDER BY p.cd_especie;
-- WHERE dt_validade BETWEEN To_Date('01/06/2021', 'dd/mm/yyyy') AND  To_Date('30/06/2021','dd/mm/yyyy');
