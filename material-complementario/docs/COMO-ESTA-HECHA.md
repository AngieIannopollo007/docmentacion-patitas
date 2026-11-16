# Cómo está hecha PATITAS

## Una sola aplicación

El navegador muestra HTML y CSS. JavaScript dibuja las pantallas, responde a los botones y le pide datos al servidor. Node.js recibe esas peticiones, comprueba los permisos y guarda en SQLite. No se usa React para evitar un paso de compilación y mantener los archivos fáciles de ubicar, conforme al pedido actual de HTML, CSS y JavaScript.

Flujo: navegador → ruta del backend → servicio con reglas → base de datos. Las consultas están parametrizadas. La base solo se abre desde el backend; no se descarga ni se muestra públicamente.

## Entidades

| Tabla | Qué guarda y relaciones |
| --- | --- |
| usuarios | Perfil, tipo de cuenta y contraseña derivada; un usuario puede publicar muchas mascotas |
| sesiones | Sesiones con vencimiento y token guardado como hash |
| mascotas | Publicación y responsable; un responsable puede publicar muchas |
| solicitudes | Formulario privado, adoptante y mascota; una mascota puede recibir varias |
| adopciones | Solicitud aprobada, mascota, adoptante, responsable y notas; una sola adopción por mascota |
| donaciones | Donante, destinatario, tipo, importe en centavos, estado y puntos |
| resenas | Autor, destinatario y experiencia de adopción o donación |
| reportes | Reseña denunciada, autor del reporte, motivo y resolución |
| notificaciones | Avisos por usuario, lectura y vínculo con el email o mensaje de origen |
| mensajes | Texto, emisor y receptor de una conversación privada |
| correos | Notificaciones, destinatario y estado de entrega |

## Reglas que se eligieron para esta primera app

- Dos formas de participar: adoptar o dar en adopción (refugio/particular). El tipo se elige al registrar y no puede cambiarse desde el formulario de perfil.
- Solo los publicadores administran sus propias mascotas, solicitudes y notas.
- Los formularios completos y datos personales solo se muestran al solicitante y al responsable. Las notas de seguimiento también las ve el adoptante.
- Edad de solicitud: entero entre 18 y 120. Mascotas: edad en meses entre 0 y 600. Son reglas educativas configuradas en este proyecto, no exigencias legales.
- Aprobar una solicitud crea el registro de adopción y cierra las otras solicitudes activas de esa mascota, todo en una transacción.
- Cada cuenta tiene 5 PATITAS iniciales una sola vez. Una donación confirmada da 10 PATITAS, sin relación con su importe. No se pueden confirmar donaciones propias ni confirmarlas por segunda vez.
- Cada reseña requiere una experiencia completada, solo entre sus participantes y una por autor y experiencia. Un reporte lo resuelve la cuenta de moderación.
- Las publicaciones retiradas se archivan para no perder referencias. No hay borrado de historiales desde la interfaz.
- Contraseñas con scrypt, sal aleatoria y comparación de tiempo constante. Sesión en cookie HttpOnly, SameSite Strict, siete días, y token CSRF en operaciones de cambio.
- Validación en el servidor, límites de campos y tamaño de fotos, consultas parametrizadas, comprobación de permisos y protección de archivos privados. La cuenta administradora no se puede crear desde registro público.

## Correo y donaciones

Gmail funciona con configuración externa de la dueña de la cuenta. La cola distingue un aviso local de un mensaje aceptado por Gmail. El registro de solicitud se conserva aunque el envío falle.

Las donaciones son registros de colaboración y confirmación de recepción. No hay una pasarela de pagos ni verificación bancaria automática. Las reseñas y los puntos no equivalen a verificar identidad; puede existir abuso por acuerdos entre cuentas. La aprobación de adopciones sigue siendo decisión humana del responsable.

## Antes de publicar para personas reales

La app está ligada a 127.0.0.1 para uso local. Para Internet hacen falta hosting compatible con Node/SQLite persistente, HTTPS y cookies Secure, retirar cuentas demo, gestión real de moderadores, verificación de email, recuperación/cambio de contraseña, control de abuso en operaciones públicas, copias y migraciones. También debe definirse tratamiento y retención de los datos personales con quienes van a operar el servicio.

No hay falsas pantallas de pago ni envío simulado presentado como real. El código y los datos demo son nuevos; la idea de producto es la propuesta original de Angie.

La actualización agrega foto de perfil y de mascota obligatorias, segunda foto de mascota opcional, chats con historial paginado y un centro de avisos que se consulta cada cinco segundos. Las migraciones son aditivas y no borran registros anteriores. Ver ACTUALIZACION.md.
