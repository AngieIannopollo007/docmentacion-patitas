# Diccionario de datos de PATITAS

Generado desde una base vacía creada por backend/base.js de la copia revisada. No se abrió la base personal. PK: clave primaria. FK: clave foránea. Un campo INTEGER que representa un booleano conserva 0/1. Las fechas de negocio son TEXT ISO y sesiones.vence es tiempo en milisegundos. Las fotos son TEXT con Data URL; no son BLOB.

## adopciones

| Campo | Tipo SQLite | Clave o referencia | Admite NULL | Valor predeterminado |
| --- | --- | --- | --- | --- |
| id | INTEGER | PK  | No | Sin valor predeterminado |
| solicitud_id | INTEGER | FK a solicitudes.id | No | Sin valor predeterminado |
| mascota_id | INTEGER | FK a mascotas.id | No | Sin valor predeterminado |
| adoptante_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| responsable_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| seguimiento | TEXT |  | No | '' |
| fecha | TEXT |  | No | strftime('%Y-%m-%dT%H:%M:%fZ','now') |

## correos

| Campo | Tipo SQLite | Clave o referencia | Admite NULL | Valor predeterminado |
| --- | --- | --- | --- | --- |
| id | INTEGER | PK  | No | Sin valor predeterminado |
| usuario_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| destinatario | TEXT |  | No | Sin valor predeterminado |
| asunto | TEXT |  | No | Sin valor predeterminado |
| cuerpo | TEXT |  | No | Sin valor predeterminado |
| estado | TEXT |  | No | 'local' |
| intentos | INTEGER |  | No | 0 |
| error | TEXT |  | No | '' |
| creado | TEXT |  | No | strftime('%Y-%m-%dT%H:%M:%fZ','now') |

## donaciones

| Campo | Tipo SQLite | Clave o referencia | Admite NULL | Valor predeterminado |
| --- | --- | --- | --- | --- |
| id | INTEGER | PK  | No | Sin valor predeterminado |
| donante_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| destinatario_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| tipo | TEXT |  | No | Sin valor predeterminado |
| descripcion | TEXT |  | No | Sin valor predeterminado |
| centavos | INTEGER |  | No | 0 |
| estado | TEXT |  | No | 'pendiente' |
| puntos | INTEGER |  | No | 0 |
| creado | TEXT |  | No | strftime('%Y-%m-%dT%H:%M:%fZ','now') |

## mascotas

| Campo | Tipo SQLite | Clave o referencia | Admite NULL | Valor predeterminado |
| --- | --- | --- | --- | --- |
| id | INTEGER | PK  | No | Sin valor predeterminado |
| responsable_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| nombre | TEXT |  | No | Sin valor predeterminado |
| especie | TEXT |  | No | Sin valor predeterminado |
| raza | TEXT |  | No | '' |
| edad_meses | INTEGER |  | No | Sin valor predeterminado |
| sexo | TEXT |  | No | Sin valor predeterminado |
| tamano | TEXT |  | No | Sin valor predeterminado |
| descripcion | TEXT |  | No | Sin valor predeterminado |
| salud | TEXT |  | No | '' |
| foto | TEXT |  | No | '' |
| estado | TEXT |  | No | 'disponible' |
| creado | TEXT |  | No | strftime('%Y-%m-%dT%H:%M:%fZ','now') |
| foto_extra | TEXT |  | No | '' |

## mensajes

| Campo | Tipo SQLite | Clave o referencia | Admite NULL | Valor predeterminado |
| --- | --- | --- | --- | --- |
| id | INTEGER | PK  | No | Sin valor predeterminado |
| emisor_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| receptor_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| cuerpo | TEXT |  | No | Sin valor predeterminado |
| creado | TEXT |  | No | strftime('%Y-%m-%dT%H:%M:%fZ','now') |

## notificaciones

| Campo | Tipo SQLite | Clave o referencia | Admite NULL | Valor predeterminado |
| --- | --- | --- | --- | --- |
| id | INTEGER | PK  | No | Sin valor predeterminado |
| usuario_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| asunto | TEXT |  | No | Sin valor predeterminado |
| cuerpo | TEXT |  | No | Sin valor predeterminado |
| tipo | TEXT |  | No | Sin valor predeterminado |
| referencia | INTEGER |  | Sí | Sin valor predeterminado |
| leida | INTEGER |  | No | 0 |
| correo_id | INTEGER | FK a correos.id | Sí | Sin valor predeterminado |
| creado | TEXT |  | No | strftime('%Y-%m-%dT%H:%M:%fZ','now') |
| mensaje_id | INTEGER | FK a mensajes.id | Sí | Sin valor predeterminado |

## reportes

| Campo | Tipo SQLite | Clave o referencia | Admite NULL | Valor predeterminado |
| --- | --- | --- | --- | --- |
| id | INTEGER | PK  | No | Sin valor predeterminado |
| resena_id | INTEGER | FK a resenas.id | No | Sin valor predeterminado |
| autor_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| motivo | TEXT |  | No | Sin valor predeterminado |
| estado | TEXT |  | No | 'pendiente' |

## resenas

| Campo | Tipo SQLite | Clave o referencia | Admite NULL | Valor predeterminado |
| --- | --- | --- | --- | --- |
| id | INTEGER | PK  | No | Sin valor predeterminado |
| autor_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| destinatario_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| adopcion_id | INTEGER | FK a adopciones.id | Sí | Sin valor predeterminado |
| donacion_id | INTEGER | FK a donaciones.id | Sí | Sin valor predeterminado |
| puntuacion | INTEGER |  | No | Sin valor predeterminado |
| comentario | TEXT |  | No | Sin valor predeterminado |
| oculta | INTEGER |  | No | 0 |
| creado | TEXT |  | No | strftime('%Y-%m-%dT%H:%M:%fZ','now') |

## sesiones

| Campo | Tipo SQLite | Clave o referencia | Admite NULL | Valor predeterminado |
| --- | --- | --- | --- | --- |
| token | TEXT | PK  | No | Sin valor predeterminado |
| usuario_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| csrf | TEXT |  | No | Sin valor predeterminado |
| vence | INTEGER |  | No | Sin valor predeterminado |

## solicitudes

| Campo | Tipo SQLite | Clave o referencia | Admite NULL | Valor predeterminado |
| --- | --- | --- | --- | --- |
| id | INTEGER | PK  | No | Sin valor predeterminado |
| mascota_id | INTEGER | FK a mascotas.id | No | Sin valor predeterminado |
| adoptante_id | INTEGER | FK a usuarios.id | No | Sin valor predeterminado |
| nombre | TEXT |  | No | Sin valor predeterminado |
| edad | INTEGER |  | No | Sin valor predeterminado |
| email | TEXT |  | No | Sin valor predeterminado |
| telefono | TEXT |  | No | Sin valor predeterminado |
| direccion | TEXT |  | No | Sin valor predeterminado |
| vivienda | TEXT |  | No | Sin valor predeterminado |
| motivo | TEXT |  | No | Sin valor predeterminado |
| compromiso | INTEGER |  | No | Sin valor predeterminado |
| estado | TEXT |  | No | 'pendiente' |
| observaciones | TEXT |  | No | '' |
| creado | TEXT |  | No | strftime('%Y-%m-%dT%H:%M:%fZ','now') |

## usuarios

| Campo | Tipo SQLite | Clave o referencia | Admite NULL | Valor predeterminado |
| --- | --- | --- | --- | --- |
| id | INTEGER | PK  | No | Sin valor predeterminado |
| nombre | TEXT |  | No | Sin valor predeterminado |
| email | TEXT |  | No | Sin valor predeterminado |
| clave | TEXT |  | No | Sin valor predeterminado |
| tipo | TEXT |  | No | Sin valor predeterminado |
| ciudad | TEXT |  | No | '' |
| descripcion | TEXT |  | No | '' |
| telefono | TEXT |  | No | '' |
| direccion | TEXT |  | No | '' |
| alias_donacion | TEXT |  | No | '' |
| contacto_publico | TEXT |  | No | '' |
| creado | TEXT |  | No | strftime('%Y-%m-%dT%H:%M:%fZ','now') |
| foto | TEXT |  | No | '' |
| bienvenida | INTEGER |  | No | 5 |

## Reglas que no se deducen solo del tipo

El email es único. Las adopciones tienen solicitud y mascota únicas. Las solicitudes activas y reseñas usan índices únicos parciales. En resenas se exige exactamente una experiencia de adopción o donación. bienvenida vale 5. Cada donación admite puntos 0 o 10, pero su correspondencia con el estado se decide en el servicio. notificaciones.referencia es una referencia lógica según tipo, sin FK única a una entidad. No se definieron borrados en cascada.
