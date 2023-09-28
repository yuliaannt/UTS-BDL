/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     23/10/2022 20:31:15                          */
/*==============================================================*/


/*==============================================================*/
/* Table: BARANG                                                */
/*==============================================================*/
create table BARANG
(
   ID_BARANG            char(10) not null  comment '',
   NM_BARANG            varchar(20) not null  comment '',
   HARGA_BARANG         int  comment '',
   STOK_BARANG          int  comment '',
   JENIS_BARANG         varchar(15)  comment '',
   MERK_BARANG          varchar(15)  comment '',
   JML_BARANG           int  comment '',
   primary key (ID_BARANG)
);

/*==============================================================*/
/* Table: KASIR                                                 */
/*==============================================================*/
create table KASIR
(
   ID_KASIR             char(10) not null  comment '',
   NM_KASIR             varchar(15) not null  comment '',
   JENKEL_KASIR         varchar(15)  comment '',
   NOTELP_KASIR         varchar(30)  comment '',
   ALAMAT_KASIR         varchar(50)  comment '',
   EMAIL_KASIR          varchar(30) not null  comment '',
   primary key (ID_KASIR)
);

/*==============================================================*/
/* Table: MEMILIH                                               */
/*==============================================================*/
create table MEMILIH
(
   ID_PEMBELI           char(6) not null  comment '',
   ID_PENJUALAN         char(10) not null  comment '',
   ID_BARANG            char(10) not null  comment '',
   primary key (ID_PEMBELI, ID_PENJUALAN, ID_BARANG)
);

/*==============================================================*/
/* Table: PEGAWAI                                               */
/*==============================================================*/
create table PEGAWAI
(
   ID_PEGAWAI           char(10) not null  comment '',
   NM_PEGAWAI           varchar(15) not null  comment '',
   NOTELP_PEGAWAI       varchar(15)  comment '',
   ALAMAT_PEGAWAI       varchar(50)  comment '',
   EMAIL_PEGAWAI        varchar(30) not null  comment '',
   primary key (ID_PEGAWAI)
);

/*==============================================================*/
/* Table: PEMBAYARAN                                            */
/*==============================================================*/
create table PEMBAYARAN
(
   ID_PEM               char(10) not null  comment '',
   JENIS_PEM            char(10)  comment '',
   TOTAL_PEM            int  comment '',
   TGL_PEM              datetime not null  comment '',
   primary key (ID_PEM)
);

/*==============================================================*/
/* Table: PEMBELI                                               */
/*==============================================================*/
create table PEMBELI
(
   ID_PEMBELI           char(6) not null  comment '',
   NM_PEMBELI           varchar(30) not null  comment '',
   NOTELP_PEMBELI       varchar(15)  comment '',
   ALAMAT_PEMBELI       varchar(50)  comment '',
   primary key (ID_PEMBELI)
);

/*==============================================================*/
/* Table: PENJUALAN                                             */
/*==============================================================*/
create table PENJUALAN
(
   ID_PEMBELI           char(6) not null  comment '',
   ID_PENJUALAN         char(10) not null  comment '',
   ID_KASIR             char(10)  comment '',
   ID_PEM               char(10) not null  comment '',
   TGL_PENJUALAN        datetime not null  comment '',
   TOTAL_PENJUALAN      int  comment '',
   primary key (ID_PEMBELI, ID_PENJUALAN)
);

/*==============================================================*/
/* Table: PENYEDIAAN                                            */
/*==============================================================*/
create table PENYEDIAAN
(
   ID_SUPPLIER          char(6) not null  comment '',
   ID_PENYEDIAAN        char(10) not null  comment '',
   ID_PEM               char(10)  comment '',
   ID_PEGAWAI           char(10)  comment '',
   TGL_PENYEDIAAN       datetime not null  comment '',
   TOTAL_HARGA          int  comment '',
   primary key (ID_SUPPLIER, ID_PENYEDIAAN)
);

/*==============================================================*/
/* Table: PRODUK                                                */
/*==============================================================*/
create table PRODUK
(
   ID_PRODUK            char(10) not null  comment '',
   ID_SUPPLIER          char(6)  comment '',
   ID_PENYEDIAAN        char(10)  comment '',
   NM_PRODUK            varchar(30) not null  comment '',
   HARGA_PRODUK         int  comment '',
   STOK_PRODUK          int  comment '',
   JENIS_PRODUK         varchar(15)  comment '',
   MERK_PRODUK          varchar(15)  comment '',
   TGLEXPIRED_PRODUK    datetime  comment '',
   SATUAN_PRODUK        varchar(10)  comment '',
   primary key (ID_PRODUK)
);

/*==============================================================*/
/* Table: SUPPLIER                                              */
/*==============================================================*/
create table SUPPLIER
(
   ID_SUPPLIER          char(6) not null  comment '',
   NM_SUPPLIER          varchar(30) not null  comment '',
   NOTELP_SUPPLIER      varchar(15)  comment '',
   ALAMAT_SUPPLIER      varchar(50)  comment '',
   primary key (ID_SUPPLIER)
);

alter table MEMILIH add constraint FK_MEMILIH_MEMILIH_PENJUALA foreign key (ID_PEMBELI, ID_PENJUALAN)
      references PENJUALAN (ID_PEMBELI, ID_PENJUALAN) on delete restrict on update restrict;

alter table MEMILIH add constraint FK_MEMILIH_MEMILIH2_BARANG foreign key (ID_BARANG)
      references BARANG (ID_BARANG) on delete restrict on update restrict;

alter table PENJUALAN add constraint FK_PENJUALA_MELAYANI_KASIR foreign key (ID_KASIR)
      references KASIR (ID_KASIR) on delete restrict on update restrict;

alter table PENJUALAN add constraint FK_PENJUALA_MEMBAYAR_PEMBAYAR foreign key (ID_PEM)
      references PEMBAYARAN (ID_PEM) on delete restrict on update restrict;

alter table PENJUALAN add constraint FK_PENJUALA_MEMBELI_PEMBELI foreign key (ID_PEMBELI)
      references PEMBELI (ID_PEMBELI) on delete restrict on update restrict;

alter table PENYEDIAAN add constraint FK_PENYEDIA_MEMBERI_PEMBAYAR foreign key (ID_PEM)
      references PEMBAYARAN (ID_PEM) on delete restrict on update restrict;

alter table PENYEDIAAN add constraint FK_PENYEDIA_MEMESAN_PEGAWAI foreign key (ID_PEGAWAI)
      references PEGAWAI (ID_PEGAWAI) on delete restrict on update restrict;

alter table PENYEDIAAN add constraint FK_PENYEDIA_MENYEDIAK_SUPPLIER foreign key (ID_SUPPLIER)
      references SUPPLIER (ID_SUPPLIER) on delete restrict on update restrict;

alter table PRODUK add constraint FK_PRODUK_MEMASOK_PENYEDIA foreign key (ID_SUPPLIER, ID_PENYEDIAAN)
      references PENYEDIAAN (ID_SUPPLIER, ID_PENYEDIAAN) on delete restrict on update restrict;

