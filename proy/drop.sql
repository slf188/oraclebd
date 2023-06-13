drop trigger TDB_CONGRESO
/

drop trigger TUB_CONGRESO
/

drop trigger TDB_DESCRIPTOR
/

drop trigger TUB_DESCRIPTOR
/

drop trigger TIB_DESCRIPTOR_LINEA
/

drop trigger TUB_DESCRIPTOR_LINEA
/

drop trigger TDB_INVESTIGACION
/

drop trigger TUB_INVESTIGACION
/

drop trigger TDB_LINEA_INVESTIGACION
/

drop trigger TIB_LINEA_INVESTIGACION
/

drop trigger TUB_LINEA_INVESTIGACION
/

drop trigger TDB_PROFESOR
/

drop trigger TIB_PROFESOR
/

drop trigger TUB_PROFESOR
/

drop trigger TIB_PROFESOR_INVESTIGACION
/

drop trigger TUB_PROFESOR_INVESTIGACION
/

drop trigger TIB_PROFESOR_LINEA
/

drop trigger TUB_PROFESOR_LINEA
/

drop trigger TIB_PROFESOR_PUBLICACION
/

drop trigger TUB_PROFESOR_PUBLICACION
/

drop trigger TDB_PUBLICACION
/

drop trigger TIB_PUBLICACION
/

drop trigger TUB_PUBLICACION
/

drop trigger TIB_PUBLICACION_CONGRESO
/

drop trigger TUB_PUBLICACION_CONGRESO
/

drop trigger TIB_PUBLICACION_REVISTA
/

drop trigger TUB_PUBLICACION_REVISTA
/

drop trigger TDB_REVISTA
/

drop trigger TUB_REVISTA
/

drop table CONGRESO cascade constraints
/

drop table DESCRIPTOR cascade constraints
/

drop index DESCRIPTOR_ESTA_DESCRIPTOR_LIN
/

drop index LINEA_ABARCA_DESCRIPTOR_LINEA_
/

drop table DESCRIPTOR_LINEA cascade constraints
/

drop table INVESTIGACION cascade constraints
/

drop index PUBLICACION_INCLUYE_LINEA_INVE
/

drop table LINEA_INVESTIGACION cascade constraints
/

drop index PROFESOR_SUPERVISA_PROFESOR_FK
/

drop table PROFESOR cascade constraints
/

drop index INVESTIGACION_TIENE_PROFESOR_I
/

drop index PROFESOR_TIENE_PROFESOR_INVEST
/

drop table PROFESOR_INVESTIGACION cascade constraints
/

drop index LINEA_ESTA_PROFESOR_LINEA_FK
/

drop index PROFESOR_DISPONE_PROFESOR_LINE
/

drop table PROFESOR_LINEA cascade constraints
/

drop index PUBLICACION_ESTA_PUBLICACION_P
/

drop index PROFESOR_EFECTUA_PROFESOR_PUBL
/

drop table PROFESOR_PUBLICACION cascade constraints
/

drop index INVESTIGACION_CONTIENE_PUBLICA
/

drop table PUBLICACION cascade constraints
/

drop index CONGRESO_REALIZA_PUBLICACION_C
/

drop index PUBLICACION_POSEE_PUBLICACION_
/

drop table PUBLICACION_CONGRESO cascade constraints
/

drop index REVISTA_HACE_PUBLICACION_REVIS
/

drop index PUBLICACION_TIENE_PUBLICACION_
/

drop table PUBLICACION_REVISTA cascade constraints
/

drop table REVISTA cascade constraints
/
