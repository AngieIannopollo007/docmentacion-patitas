# Análisis del sistema PATITAS

## Visión del sistema

PATITAS organiza tres procesos relacionados: encontrar un hogar, colaborar con quienes rescatan y sostener referencias de la comunidad. El sistema conserva datos, pero la entrevista y la decisión de adopción pertenecen al responsable humano.

La información de partida proviene de la idea de la estudiante y del código revisado. No se atribuyen entrevistas o relevamientos externos que no se realizaron.

## Actores y permisos

| Actor | Operaciones permitidas | Restricciones principales |
| --- | --- | --- |
| Visitante | Ver inicio y crear cuenta o ingresar | No consulta API de comunidad sin sesión |
| Adoptante | Explorar, solicitar, cancelar solicitudes activas, colaborar, conversar y reseñar experiencias propias | No publica ni administra mascotas ajenas |
| Refugio o particular | Publicar y editar sus mascotas, resolver solicitudes propias, seguir adopciones y confirmar lo recibido | No ve planillas o formularios de otros responsables |
| Administración | Resolver reportes de reseñas y participar en chats de soporte propios | No tiene acceso general a formularios y chats de terceros |
| Operador técnico | Iniciar, respaldar, configurar y mantener archivos del servicio | Es una responsabilidad operativa externa a los roles de la interfaz |

La autorización se aplica en el backend. Ocultar un botón no constituye por sí solo un control de seguridad.

## Caso de uso de adopción

Precondiciones: cuenta adoptante con sesión vigente y mascota disponible. La persona abre Conoceme, consulta la ficha y el responsable, elige Quiero adoptar y completa el formulario. El servidor valida datos, detecta solicitudes repetidas, guarda la solicitud y crea el aviso para el responsable.

El responsable abre Solicitudes recibidas, evalúa el formulario y puede dejar observaciones. Si aprueba, el sistema registra la adopción y cambia la disponibilidad dentro de una sola transacción. Si alguna operación falla, se revierte el conjunto. El resultado es un registro consultable en la planilla.

Excepciones: edad inválida, compromiso no aceptado, mascota inexistente, no disponible o solicitud activa repetida. La app informa el error sin crear una adopción parcial. Fallar el correo no borra una solicitud ya guardada.

## Caso de uso de colaboración

Un usuario distinto del destinatario entra al perfil de un refugio o particular y registra la ayuda. El destinatario recibe un aviso, coordina por chat y confirma solo cuando recibe la colaboración. La confirmación concede diez PATITAS y cambia el estado en una operación controlada. Una segunda confirmación se rechaza.

Una transferencia no se verifica automáticamente. Este proceso representa una confirmación declarada por el destinatario; por eso no debe presentarse como comprobante bancario ni garantía de conducta.

## Caso de uso de comunicación

Un usuario abre un chat desde un perfil o una experiencia. El servidor determina si puede contactar al destinatario y obtiene únicamente mensajes entre los dos identificadores. El centro de avisos notifica los recibidos. Abrir un chat marca leídos hasta el último mensaje mostrado y no un mensaje que haya llegado después.

Administración puede iniciar y recibir conversaciones de soporte. Ese permiso no modifica el filtro que protege chats entre otras dos personas.

## Caso de uso de reseña y moderación

Después de una adopción o donación completada, cada participante puede calificar a la otra parte. La aplicación obtiene el destinatario a partir de la experiencia, en lugar de confiar en un identificador elegido arbitrariamente por el formulario. Un usuario puede reportar una reseña visible. Administración revisa el motivo y decide ocultar o conservar el comentario.

El mecanismo demuestra una relación registrada, no que los relatos sean verdaderos. Evitar acuerdos entre cuentas o suplantaciones requiere controles futuros adicionales.

## Estados y transiciones

| Objeto | Transiciones admitidas |
| --- | --- |
| Mascota | disponible a adoptada por aprobación; disponible a archivada por retiro |
| Solicitud | pendiente a en_revision, aprobada, rechazada o cancelada; en_revision a esos estados de resolución |
| Donación | pendiente a confirmada, rechazada o cancelada |
| Reseña | visible a oculta por moderación; no se implementó restauración desde la pantalla |
| Reporte | pendiente a resuelto |
| Notificación | no leída a leída |
| Correo | local a pendiente por reintento configurado; pendiente a enviando; enviando a enviado o error; error a pendiente por reintento |

No se diseñaron cambios de estado arbitrarios desde la interfaz. Un rechazo o una cancelación permiten una solicitud nueva si la mascota continúa disponible, pero no reabren el registro anterior.

## Datos públicos y privados

Nombre, ciudad, historia, foto, contacto público y alias de donación pueden mostrarse a la comunidad autenticada según el perfil. Email de cuenta, teléfono y dirección privados no se incluyen en la consulta pública de un perfil. El formulario de adopción conserva una fotografía de los datos informados en ese momento y solo se muestra al solicitante y al responsable.

Los mensajes corresponden a sus participantes. Los correos y avisos corresponden a su usuario destinatario. Las notas de seguimiento las modifica el responsable y las puede leer el adoptante de esa adopción.

## Necesidades de evolución

El crecimiento demanda identificar responsables reales de moderación, verificar buzones y cuentas, definir retención de datos, ampliar filtros y paginación y preparar el despliegue. Estas necesidades se registran como próximas etapas, no como funcionalidades ya terminadas.
