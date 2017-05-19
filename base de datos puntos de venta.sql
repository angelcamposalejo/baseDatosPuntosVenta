create database software_puntos_venta;
use software_puntos_venta;
CREATE TABLE punto_de_venta (
    id_punto_de_venta INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    punto_venta VARCHAR(60) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    activo BOOL NOT NULL
);
CREATE TABLE usuarios (
    id_usuario INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    posicion VARCHAR(50) NOT NULL,
    password_usuario VARCHAR(20) NOT NULL,
    activo BOOL NOT NULL
);
CREATE TABLE categorias (
    id_categorias INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    categoria VARCHAR(50) NOT NULL,
    activo BOOL NOT NULL
);
CREATE TABLE marca (
    id_marca INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    activo BOOL NOT NULL
);
CREATE TABLE carriers (
    id_carrier INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    carrier VARCHAR(50) NOT NULL
);
CREATE TABLE articulos (
    id_articulo INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_categoria INT(10) NOT NULL,
    descripcion VARCHAR(60) NOT NULL,
    activo BOOL NOT NULL,
    FOREIGN KEY (id_categoria)
        REFERENCES categorias (id_categorias)
);
CREATE TABLE caja (
    id_caja INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_punto_de_venta INT(10) NOT NULL,
    saldo DOUBLE,
    activo BOOL NOT NULL,
    FOREIGN KEY (id_punto_de_venta)
        REFERENCES punto_de_venta (id_punto_de_venta)
);
CREATE TABLE accesorios (
    id_accesorio INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_articulo INT(10) NOT NULL,
    descripcion VARCHAR(60) NOT NULL,
    costo_unitario DOUBLE,
    activo BOOL NOT NULL,
    FOREIGN KEY (id_articulo)
        REFERENCES articulos (id_articulo)
);
CREATE TABLE modelo (
    id_modelo INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_marca INT(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    activo BOOL NOT NULL,
    FOREIGN KEY (id_marca)
        REFERENCES marca (id_marca)
);
CREATE TABLE ventas (
    folio INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_punto_de_venta INT(10) NOT NULL,
    id_usuario INT(10) NOT NULL,
    id_caja INT(10) NOT NULL,
    fecha DATETIME NOT NULL,
    total DOUBLE NOT NULL,
    FOREIGN KEY (id_punto_de_venta)
        REFERENCES punto_de_venta (id_punto_de_venta),
    FOREIGN KEY (id_usuario)
        REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_caja)
        REFERENCES caja (id_caja)
);
CREATE TABLE cantidad (
    id_cantidad INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_punto_de_venta INT(10) NOT NULL,
    id_articulo INT(10) NOT NULL,
    cantidad INT(10) NOT NULL,
    activo BOOL NOT NULL,
    FOREIGN KEY (id_punto_de_venta)
        REFERENCES punto_de_venta (id_punto_de_venta),
    FOREIGN KEY (id_articulo)
        REFERENCES articulos (id_articulo)
);
CREATE TABLE chips (
    id_chips INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_articulo INT(10) NOT NULL,
    id_carrier INT(10) NOT NULL,
    descripcion VARCHAR(60) NOT NULL,
    precio_unitario DOUBLE,
    activo BOOL NOT NULL,
    FOREIGN KEY (id_articulo)
        REFERENCES articulos (id_articulo),
    FOREIGN KEY (id_carrier)
        REFERENCES carriers (id_carrier)
);
CREATE TABLE equipos (
    id_equipos INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_articulo INT(10) NOT NULL,
    id_modelo INT(10) NOT NULL,
    id_marca INT(10) NOT NULL,
    precio_unitario DOUBLE NOT NULL,
    color VARCHAR(50),
    activo BOOL NOT NULL,
    FOREIGN KEY (id_articulo)
        REFERENCES articulos (id_articulo),
    FOREIGN KEY (id_modelo)
        REFERENCES modelo (id_modelo),
    FOREIGN KEY (id_marca)
        REFERENCES marca (id_marca)
);
CREATE TABLE detalle_venta (
    id_detalle_venta INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    folio INT(10) NOT NULL,
    id_punto_de_venta INT(10) NOT NULL,
    id_caja INT(10) NOT NULL,
    id_articulo INT(10) NOT NULL,
    fecha DATETIME,
    cantidad INT(20) NOT NULL,
    precio_unitario DOUBLE,
    FOREIGN KEY (folio)
        REFERENCES ventas (folio),
    FOREIGN KEY (id_punto_de_venta)
        REFERENCES punto_de_venta (id_punto_de_venta),
    FOREIGN KEY (id_caja)
        REFERENCES caja (id_caja),
    FOREIGN KEY (id_articulo)
        REFERENCES articulos (id_articulo)
);