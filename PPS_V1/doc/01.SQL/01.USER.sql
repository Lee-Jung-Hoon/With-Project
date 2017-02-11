/************************************************************************************
 * 
 * V.1 USER 생성 스크립트
 * 
 ************************************************************************************/

--CREATE TABLESPACE TB_DAT
--DATAFILE 'C:\app\ijhoo\oradata\orcl\tablespace\tb_dat01.dbf' 
--SIZE 500M AUTOEXTEND ON; 

--CREATE TABLESPACE TB_LOB
--DATAFILE 'C:\app\ijhoo\oradata\orcl\tablespace\tb_lob01.dbf' 
--SIZE 500M AUTOEXTEND ON; 

--CREATE TABLESPACE TB_IDX
--DATAFILE 'C:\app\ijhoo\oradata\orcl\tablespace\tb_idx01.dbf' 
--SIZE 50M AUTOEXTEND ON;

--CREATE TEMPORARY TABLESPACE TB_TMP
--TEMPFILE 'C:\app\ijhoo\oradata\orcl\tablespace\tb_tmp01.dbf' 
--SIZE 50M AUTOEXTEND ON;

CREATE USER PPS_DB
IDENTIFIED BY PPS123
DEFAULT TABLESPACE TB_DAT
TEMPORARY TABLESPACE TB_TMP
QUOTA UNLIMITED ON TB_DAT
QUOTA UNLIMITED ON TB_LOB
QUOTA UNLIMITED ON TB_IDX;

GRANT connect, resource TO PPS_DB;