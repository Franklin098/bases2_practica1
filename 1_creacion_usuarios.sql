
----------->>>>>>>>------------ CREACION BASICA DE ROLES Y USUARIOS ---------->>>>>--------------

CREATE TABLESPACE CINE_TABLE_SPACE DATAFILE 'CINE_DTF.TBS'
SIZE 26214400 AUTOEXTEND ON NEXT 1048576 MAXSIZE 52428800;


ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- Creando Usuarios

CREATE USER USUARIO_COMPLETO IDENTIFIED BY "tiger"
DEFAULT TABLESPACE "CINE_TABLE_SPACE";


CREATE USER USUARIO_LECTURA IDENTIFIED BY "tiger"
DEFAULT TABLESPACE "CINE_TABLE_SPACE";


CREATE USER USUARIO_MODIFICACION IDENTIFIED BY "tiger"
DEFAULT TABLESPACE "CINE_TABLE_SPACE";

-- Creando Roles

CREATE ROLE ROL_COMPLETO;

GRANT CREATE SESSION, ALTER SESSION, CREATE TABLE, CREATE USER TO ROL_COMPLETO;

GRANT ROL_COMPLETO TO USUARIO_COMPLETO;




CREATE ROLE ROL_LECTURA;

GRANT CREATE SESSION, ALTER SESSION TO ROL_LECTURA;

GRANT ROL_LECTURA TO USUARIO_LECTURA;



CREATE ROLE ROL_MODIFICACION;

GRANT CREATE SESSION, ALTER SESSION TO ROL_MODIFICACION;

GRANT ROL_MODIFICACION TO USUARIO_MODIFICACION;


-- Los permisos para leer o modificar tablas se hacen en el script de creacion de tablas












