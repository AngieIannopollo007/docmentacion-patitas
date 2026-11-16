# Manual de administración de PATITAS

## Responsabilidades y alcance

Este manual distingue dos responsabilidades. La administración funcional utiliza el rol admin para moderar comentarios y conversar en soporte. El operador técnico administra archivos, configuración y respaldos. Tener rol admin dentro de la app no permite automáticamente publicar mascotas, revisar cualquier formulario o leer chats de terceros.

La versión educativa no incluye una consola completa de altas, bajas, bloqueo de usuarios o asignación de roles. Esas capacidades no deben suponerse por el nombre de la cuenta.

## Acceder a moderación

En una base de demostración se puede ingresar con admin@patitas.test y la contraseña Patitas2026!, o elegir Moderación en las cuentas de ejemplo. Luego se abre Mi espacio → Moderación.

La cuenta demo tiene una contraseña conocida y no debe utilizarse para operar una publicación real en Internet. Desactivar DEMO evita la creación inicial de cuentas en una base vacía, pero no borra cuentas que ya fueron creadas. La provisión segura de administradores reales es una tarea pendiente de implementación, no un cambio que se haga desde el registro público.

## Revisar reportes

1. Abrir Moderación y leer el comentario denunciado, la puntuación y el motivo del reporte.
2. Evaluar si contiene datos privados, insultos, amenazas u otro contenido que contradiga las normas acordadas para la comunidad.
3. Elegir Ocultar reseña si corresponde retirarla del perfil, o Conservar y resolver si no hay fundamento para ocultarla.
4. Comprobar que el reporte ya no figure como pendiente.

Ocultar cambia la visibilidad de la reseña; no borra su fila. La consulta de promedio y cantidad del perfil excluye las ocultas. Resolver un reporte no necesariamente resuelve otros reportes sobre la misma reseña: cada registro debe revisarse.

La interfaz actual no incluye restauración de reseñas ocultas, apelación, historial completo de decisiones o registro del moderador que actuó. Si se requiere ese proceso, debe diseñarse y probarse antes de adoptarlo como práctica institucional.

## Criterio humano propuesto

Se propone priorizar reportes con exposición de datos personales o amenazas, leer la experiencia sin juzgar por cantidad de PATITAS y aplicar un criterio consistente. Las reglas concretas de convivencia y apelación deben ser aprobadas por quienes operen el servicio; no existe todavía una política institucional validada.

La administración no debe copiar formularios o chats privados en reseñas ni solicitar contraseñas. Las PATITAS y fotografías no reemplazan una verificación de identidad ni una evaluación de adopción.

## Chats de soporte

Administración puede iniciar una conversación con otro usuario o recibir mensajes dirigidos a ella. En Chats privados se selecciona el interlocutor y se responde en esa sala. El permiso de soporte no habilita inspeccionar una conversación entre un refugio y un adoptante que no incluyó a administración.

No hay un botón general de búsqueda de personas para soporte: se abre una conversación desde los perfiles o interlocutores disponibles. La API valida el destinatario y siempre filtra el historial por el par de participantes.

## Notificaciones y correo

La campana muestra avisos propios y su lectura. Correos permite comprobar si una notificación quedó local o fue puesta en cola. Los mensajes de correo se envían desde la cuenta configurada del sistema, pero al destinatario almacenado en el usuario correspondiente.

Una falla de Gmail no debe interpretarse como pérdida automática de la solicitud. Primero se consulta el registro dentro de la app. Una confirmación SMTP no prueba lectura ni entrega en la bandeja principal. El administrador funcional no cambia las credenciales del remitente desde la interfaz.

## Operación diaria propuesta

Al comenzar, comprobar acceso y revisar reportes pendientes. Durante el uso, responder consultas de soporte y registrar incidentes sin copiar información privada innecesaria. Al cerrar una etapa de trabajo, confirmar con el operador técnico que existe un respaldo y que no se subió .env o datos/ al repositorio público.

La cuenta admin no puede confirmar en nombre de cualquier refugio que recibió una donación. Esa decisión sigue perteneciendo al destinatario. Tampoco aprueba solicitudes ajenas mediante el panel administrativo.

## Incidentes y escalamiento

Si una sala no se abre, anotar la cuenta usada, la acción y el mensaje de error sin compartir contraseña. Si un reporte no cambia de estado, actualizar y confirmar si otro operador ya intervino. Si aparecen datos inesperados o un permiso incorrecto, suspender el uso de ese recorrido y reportarlo al equipo técnico con un ejemplo ficticio reproducible.

Si se expuso una contraseña de aplicación de Gmail, su dueña debe revocarla y configurar otra; no se debe enviar por correo ni dejarla en un reporte. Ante pérdida de datos, el operador técnico restaura una copia verificada en un entorno separado antes de sustituir la base habitual.

## Entrega a otra camada

Documentar qué cuenta de demostración existe, cuáles son los incidentes abiertos y qué decisiones de moderación faltan definir. No entregar una base real con domicilios y conversaciones dentro del ZIP de código. Las credenciales privadas y los respaldos deben tener un canal de custodia diferente del repositorio educativo.
