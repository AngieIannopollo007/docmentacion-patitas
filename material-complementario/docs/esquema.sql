-- Esquema actualizado. La app crea y migra desde backend/base.js.

CREATE TABLE adopciones (
      id INTEGER PRIMARY KEY, solicitud_id INTEGER UNIQUE NOT NULL REFERENCES solicitudes(id),
      mascota_id INTEGER UNIQUE NOT NULL REFERENCES mascotas(id),
      adoptante_id INTEGER NOT NULL REFERENCES usuarios(id), responsable_id INTEGER NOT NULL REFERENCES usuarios(id),
      seguimiento TEXT NOT NULL DEFAULT '', fecha TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now'))
    );

CREATE TABLE correos (
      id INTEGER PRIMARY KEY, usuario_id INTEGER NOT NULL REFERENCES usuarios(id),
      destinatario TEXT NOT NULL, asunto TEXT NOT NULL, cuerpo TEXT NOT NULL,
      estado TEXT NOT NULL DEFAULT 'local' CHECK(estado IN('local','pendiente','enviando','enviado','error')),
      intentos INTEGER NOT NULL DEFAULT 0, error TEXT NOT NULL DEFAULT '',
      creado TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now'))
    );

CREATE TABLE donaciones (
      id INTEGER PRIMARY KEY, donante_id INTEGER NOT NULL REFERENCES usuarios(id),
      destinatario_id INTEGER NOT NULL REFERENCES usuarios(id), tipo TEXT NOT NULL CHECK(tipo IN ('Dinero','Alimentos','Medicamentos','Accesorios','Otros')),
      descripcion TEXT NOT NULL, centavos INTEGER NOT NULL DEFAULT 0 CHECK(centavos>=0),
      estado TEXT NOT NULL DEFAULT 'pendiente' CHECK(estado IN ('pendiente','confirmada','rechazada','cancelada')),
      puntos INTEGER NOT NULL DEFAULT 0 CHECK(puntos IN (0,10)),
      creado TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now'))
    );

CREATE TABLE mascotas (
      id INTEGER PRIMARY KEY, responsable_id INTEGER NOT NULL REFERENCES usuarios(id),
      nombre TEXT NOT NULL, especie TEXT NOT NULL CHECK(especie IN ('Perro','Gato','Otro')),
      raza TEXT NOT NULL DEFAULT '', edad_meses INTEGER NOT NULL CHECK(edad_meses BETWEEN 0 AND 600),
      sexo TEXT NOT NULL CHECK(sexo IN ('Hembra','Macho','Sin informar')),
      tamano TEXT NOT NULL CHECK(tamano IN ('Pequeño','Mediano','Grande')),
      descripcion TEXT NOT NULL, salud TEXT NOT NULL DEFAULT '', foto TEXT NOT NULL DEFAULT '',
      estado TEXT NOT NULL DEFAULT 'disponible' CHECK(estado IN ('disponible','adoptada','archivada')),
      creado TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now'))
    , foto_extra TEXT NOT NULL DEFAULT '');

CREATE TABLE mensajes (
      id INTEGER PRIMARY KEY, emisor_id INTEGER NOT NULL REFERENCES usuarios(id),
      receptor_id INTEGER NOT NULL REFERENCES usuarios(id), cuerpo TEXT NOT NULL,
      creado TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now'))
    );

CREATE TABLE notificaciones (
      id INTEGER PRIMARY KEY, usuario_id INTEGER NOT NULL REFERENCES usuarios(id),
      asunto TEXT NOT NULL, cuerpo TEXT NOT NULL, tipo TEXT NOT NULL,
      referencia INTEGER, leida INTEGER NOT NULL DEFAULT 0 CHECK(leida IN(0,1)),
      correo_id INTEGER REFERENCES correos(id),
      creado TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now'))
    , mensaje_id INTEGER REFERENCES mensajes(id));

CREATE TABLE reportes (
      id INTEGER PRIMARY KEY, resena_id INTEGER NOT NULL REFERENCES resenas(id),
      autor_id INTEGER NOT NULL REFERENCES usuarios(id), motivo TEXT NOT NULL,
      estado TEXT NOT NULL DEFAULT 'pendiente' CHECK(estado IN('pendiente','resuelto')),
      UNIQUE(resena_id,autor_id)
    );

CREATE TABLE resenas (
      id INTEGER PRIMARY KEY, autor_id INTEGER NOT NULL REFERENCES usuarios(id),
      destinatario_id INTEGER NOT NULL REFERENCES usuarios(id), adopcion_id INTEGER REFERENCES adopciones(id),
      donacion_id INTEGER REFERENCES donaciones(id), puntuacion INTEGER NOT NULL CHECK(puntuacion BETWEEN 1 AND 5),
      comentario TEXT NOT NULL, oculta INTEGER NOT NULL DEFAULT 0 CHECK(oculta IN(0,1)),
      creado TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now')),
      CHECK((adopcion_id IS NOT NULL) != (donacion_id IS NOT NULL))
    );

CREATE TABLE sesiones (
      token TEXT PRIMARY KEY, usuario_id INTEGER NOT NULL REFERENCES usuarios(id),
      csrf TEXT NOT NULL, vence INTEGER NOT NULL
    );

CREATE TABLE solicitudes (
      id INTEGER PRIMARY KEY, mascota_id INTEGER NOT NULL REFERENCES mascotas(id),
      adoptante_id INTEGER NOT NULL REFERENCES usuarios(id), nombre TEXT NOT NULL,
      edad INTEGER NOT NULL CHECK(edad BETWEEN 18 AND 120), email TEXT NOT NULL,
      telefono TEXT NOT NULL, direccion TEXT NOT NULL, vivienda TEXT NOT NULL,
      motivo TEXT NOT NULL, compromiso INTEGER NOT NULL CHECK(compromiso=1),
      estado TEXT NOT NULL DEFAULT 'pendiente' CHECK(estado IN ('pendiente','en_revision','aprobada','rechazada','cancelada')),
      observaciones TEXT NOT NULL DEFAULT '',
      creado TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now'))
    );

CREATE TABLE usuarios (
      id INTEGER PRIMARY KEY, nombre TEXT NOT NULL, email TEXT UNIQUE NOT NULL,
      clave TEXT NOT NULL, tipo TEXT NOT NULL CHECK(tipo IN ('adoptante','refugio','particular','admin')),
      ciudad TEXT NOT NULL DEFAULT '', descripcion TEXT NOT NULL DEFAULT '',
      telefono TEXT NOT NULL DEFAULT '', direccion TEXT NOT NULL DEFAULT '',
      alias_donacion TEXT NOT NULL DEFAULT '', contacto_publico TEXT NOT NULL DEFAULT '',
      creado TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now'))
    , foto TEXT NOT NULL DEFAULT '', bienvenida INTEGER NOT NULL DEFAULT 5 CHECK(bienvenida=5));

CREATE UNIQUE INDEX aviso_correo ON notificaciones(correo_id) WHERE correo_id IS NOT NULL;

CREATE INDEX avisos_usuario ON notificaciones(usuario_id,id);

CREATE INDEX mascotas_responsable ON mascotas(responsable_id);

CREATE INDEX mensajes_receptor ON mensajes(receptor_id,id);

CREATE UNIQUE INDEX resena_adopcion ON resenas(autor_id,adopcion_id) WHERE adopcion_id IS NOT NULL;

CREATE UNIQUE INDEX resena_donacion ON resenas(autor_id,donacion_id) WHERE donacion_id IS NOT NULL;

CREATE UNIQUE INDEX solicitud_activa ON solicitudes(mascota_id,adoptante_id)
      WHERE estado IN ('pendiente','en_revision','aprobada');

CREATE INDEX solicitudes_adoptante ON solicitudes(adoptante_id);