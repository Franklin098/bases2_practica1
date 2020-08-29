

CREATE TABLE cine (
    id_cine       INTEGER NOT NULL,
    nombre_cine   VARCHAR2(60) NOT NULL
);

ALTER TABLE cine ADD CONSTRAINT cine_pk PRIMARY KEY ( id_cine );

CREATE TABLE clasificacion (
    id_clasificacion   INTEGER NOT NULL,
    clasificacion      VARCHAR2(40) NOT NULL
);

ALTER TABLE clasificacion ADD CONSTRAINT clasificacion_pk PRIMARY KEY ( id_clasificacion );

CREATE TABLE formato (
    id_formato   INTEGER NOT NULL,
    formato      VARCHAR2(40) NOT NULL
);

ALTER TABLE formato ADD CONSTRAINT formato_pk PRIMARY KEY ( id_formato );

CREATE TABLE funcion (
    numero_sala         INTEGER NOT NULL,
    id_pelicula         INTEGER NOT NULL,
    fecha_hora_inicio   DATE NOT NULL,
    fecha_hora_fin      DATE NOT NULL
);

ALTER TABLE funcion
    ADD CONSTRAINT funcion_pk PRIMARY KEY ( fecha_hora_inicio,
                                            numero_sala,
                                            id_pelicula );

CREATE TABLE genero (
    id_genero   INTEGER NOT NULL,
    genero      VARCHAR2(40) NOT NULL
);

ALTER TABLE genero ADD CONSTRAINT genero_pk PRIMARY KEY ( id_genero );

CREATE TABLE idioma (
    id_idioma   INTEGER NOT NULL,
    idioma      VARCHAR2(40) NOT NULL
);

ALTER TABLE idioma ADD CONSTRAINT idioma_pk PRIMARY KEY ( id_idioma );

CREATE TABLE pais (
    id_pais   INTEGER NOT NULL,
    pais      VARCHAR2(50) NOT NULL
);

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id_pais );

CREATE TABLE pelicula (
    id_pelicula        INTEGER NOT NULL,
    nombre             VARCHAR2(100) NOT NULL,
    id_clasificacion   INTEGER NOT NULL,
    id_genero          INTEGER NOT NULL,
    id_productora      INTEGER NOT NULL,
    id_idioma          INTEGER NOT NULL,
    subtitulada        CHAR(1) NOT NULL,
    duracion_minutos   INTEGER NOT NULL,
    anio_produccion    DATE NOT NULL,
    resumen_corto      VARCHAR2(400 CHAR) NOT NULL
);

ALTER TABLE pelicula ADD CONSTRAINT pelicula_pk PRIMARY KEY ( id_pelicula );

CREATE TABLE persona (
    id_persona   INTEGER NOT NULL,
    nombre       VARCHAR2(50) NOT NULL,
    apellido     VARCHAR2(50) NOT NULL,
    id_pais      INTEGER NOT NULL
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( id_persona );

CREATE TABLE persona_pelicula (
    id_pelicula        INTEGER NOT NULL,
    id_persona         INTEGER NOT NULL,
    id_rol             INTEGER NOT NULL,
    nombre_personaje   VARCHAR2(50) NOT NULL
);

ALTER TABLE persona_pelicula
    ADD CONSTRAINT persona_pelicula_pk PRIMARY KEY ( id_pelicula,
                                                     id_persona,
                                                     id_rol );

CREATE TABLE productora (
    id_productora       INTEGER NOT NULL,
    nombre_productora   VARCHAR2(60) NOT NULL
);

ALTER TABLE productora ADD CONSTRAINT productora_pk PRIMARY KEY ( id_productora );

CREATE TABLE rol (
    id_rol   INTEGER NOT NULL,
    rol      VARCHAR2(40) NOT NULL
);

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( id_rol );

CREATE TABLE sala (
    numero_sala    INTEGER NOT NULL,
    id_cine        INTEGER NOT NULL,
    id_ubicacion   INTEGER NOT NULL,
    id_formato     INTEGER NOT NULL,
    capacidad      INTEGER NOT NULL
);

ALTER TABLE sala ADD CONSTRAINT sala_pk PRIMARY KEY ( numero_sala );

CREATE TABLE ubicacion (
    id_ubicacion   INTEGER NOT NULL,
    ubicacion      VARCHAR2(40) NOT NULL
);

ALTER TABLE ubicacion ADD CONSTRAINT ubicacion_pk PRIMARY KEY ( id_ubicacion );

ALTER TABLE funcion
    ADD CONSTRAINT funcion_pelicula_fk FOREIGN KEY ( id_pelicula )
        REFERENCES pelicula ( id_pelicula );

ALTER TABLE funcion
    ADD CONSTRAINT funcion_sala_fk FOREIGN KEY ( numero_sala )
        REFERENCES sala ( numero_sala );

ALTER TABLE pelicula
    ADD CONSTRAINT pelicula_clasificacion_fk FOREIGN KEY ( id_clasificacion )
        REFERENCES clasificacion ( id_clasificacion );

ALTER TABLE pelicula
    ADD CONSTRAINT pelicula_genero_fk FOREIGN KEY ( id_genero )
        REFERENCES genero ( id_genero );

ALTER TABLE pelicula
    ADD CONSTRAINT pelicula_idioma_fk FOREIGN KEY ( id_idioma )
        REFERENCES idioma ( id_idioma );

ALTER TABLE pelicula
    ADD CONSTRAINT pelicula_productora_fk FOREIGN KEY ( id_productora )
        REFERENCES productora ( id_productora );

ALTER TABLE persona
    ADD CONSTRAINT persona_pais_fk FOREIGN KEY ( id_pais )
        REFERENCES pais ( id_pais );

ALTER TABLE persona_pelicula
    ADD CONSTRAINT persona_pelicula_pelicula_fk FOREIGN KEY ( id_pelicula )
        REFERENCES pelicula ( id_pelicula );

ALTER TABLE persona_pelicula
    ADD CONSTRAINT persona_pelicula_persona_fk FOREIGN KEY ( id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE persona_pelicula
    ADD CONSTRAINT persona_pelicula_rol_fk FOREIGN KEY ( id_rol )
        REFERENCES rol ( id_rol );

ALTER TABLE sala
    ADD CONSTRAINT sala_cine_fk FOREIGN KEY ( id_cine )
        REFERENCES cine ( id_cine );

ALTER TABLE sala
    ADD CONSTRAINT sala_formato_fk FOREIGN KEY ( id_formato )
        REFERENCES formato ( id_formato );

ALTER TABLE sala
    ADD CONSTRAINT sala_ubicacion_fk FOREIGN KEY ( id_ubicacion )
        REFERENCES ubicacion ( id_ubicacion );




------------------->>>>>>>>>>>>>>> Dando Permisas de Tablas a Roles >>>>>>>>>>>>>>>---------------------


GRANT SELECT, INSERT, UPDATE , DELETE ON Ubicacion TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Formato TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Sala TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Cine TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Funcion TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Clasificacion TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Genero TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Productora TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Idioma TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Pelicula TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Rol TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Persona_Pelicula TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Persona TO ROL_COMPLETO;
GRANT SELECT, INSERT, UPDATE , DELETE ON Pais TO ROL_COMPLETO;

GRANT SELECT, INSERT, UPDATE , DELETE ON Ubicacion TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Formato TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Sala TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Cine TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Funcion TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Clasificacion TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Genero TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Productora TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Idioma TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Pelicula TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Rol TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Persona_Pelicula TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Persona TO ROL_MODIFICACION;
GRANT SELECT, INSERT, UPDATE , DELETE ON Pais TO ROL_MODIFICACION;


GRANT SELECT ON Ubicacion TO ROL_LECTURA;
GRANT SELECT ON Formato TO ROL_LECTURA;
GRANT SELECT ON Sala TO ROL_LECTURA;
GRANT SELECT ON Cine TO ROL_LECTURA;
GRANT SELECT ON Funcion TO ROL_LECTURA;
GRANT SELECT ON Clasificacion TO ROL_LECTURA;
GRANT SELECT ON Genero TO ROL_LECTURA;
GRANT SELECT ON Productora TO ROL_LECTURA;
GRANT SELECT ON Idioma TO ROL_LECTURA;
GRANT SELECT ON Pelicula TO ROL_LECTURA;
GRANT SELECT ON Rol TO ROL_LECTURA;
GRANT SELECT ON Persona_Pelicula TO ROL_LECTURA;
GRANT SELECT ON Persona TO ROL_LECTURA;
GRANT SELECT ON Pais TO ROL_LECTURA;










