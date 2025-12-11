/*==============================================================*/
/* Nom de SGBD :  MySQL 4.0                                     */
/* Date de création :  2025/12/11 16:42:41                      */
/*==============================================================*/


drop table if exists FOURNIR;

drop table if exists FOURNISSEUR;

drop table if exists PRODUIT;

/*==============================================================*/
/* Table : FOURNIR                                              */
/*==============================================================*/
create table FOURNIR
(
   CODEPROD                       varchar(10)                    not null,
   NUMF                           int                            not null,
   primary key (CODEPROD, NUMF)
)
type = InnoDB;

/*==============================================================*/
/* Index : "FOURNIR_FK"                                            */
/*==============================================================*/
create index FOURNIR_FK
(
   CODEPROD
);
/*==============================================================*/
/* Index : "FOURNIR2_FK"                                            */
/*==============================================================*/
create index FOURNIR2_FK
(
   NUMF
);

/*==============================================================*/
/* Table : FOURNISSEUR                                          */
/*==============================================================*/
create table FOURNISSEUR
(
   NUMF                           int                            not null,
   NOMF                           text,
   ADRESSEF                       text,
   primary key (NUMF)
)
type = InnoDB;

/*==============================================================*/
/* Table : PRODUIT                                              */
/*==============================================================*/
create table PRODUIT
(
   CODEPROD                       varchar(10)                    not null,
   DESIGPROD                      text,
   PRIXUNIT                       decimal,
   primary key (CODEPROD)
)
type = InnoDB;

alter table FOURNIR add constraint FK_FOURNIR foreign key (CODEPROD)
      references PRODUIT (CODEPROD) on delete restrict on update restrict;

alter table FOURNIR add constraint FK_FOURNIR2 foreign key (NUMF)
      references FOURNISSEUR (NUMF) on delete restrict on update restrict;

