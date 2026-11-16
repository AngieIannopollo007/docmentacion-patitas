# Requerimientos del sistema PATITAS

## Alcance y convenciones

Este documento describe la versión local revisada. RF identifica un requerimiento funcional; RNF, uno no funcional; RN, una regla de negocio. «Implementado» significa que existe en el código; la aceptación se apoya en pruebas concretas, no en una garantía de ausencia de errores.

## Requerimientos funcionales

| ID | Requerimiento y aceptación observable |
| --- | --- |
| RF01 | Registrar adoptantes, refugios o particulares con nombre, email único, ciudad, contraseña de 10 a 128 caracteres y foto. El registro válido crea una sesión; el público no puede elegir admin. |
| RF02 | Iniciar y cerrar sesión. Las API de comunidad rechazan una petición sin sesión válida; la sesión caduca en siete días. |
| RF03 | Actualizar el propio perfil y conservar privados teléfono y dirección. El contacto público es un campo separado y voluntario. |
| RF04 | Permitir solo a refugios y particulares publicar mascotas con foto principal, datos y descripción. Una segunda imagen es opcional. |
| RF05 | Editar y retirar solo publicaciones propias. Retirar archiva la mascota y cierra solicitudes pendientes, sin borrar el historial. |
| RF06 | Consultar mascotas disponibles, buscar por nombre o ciudad y filtrar por especie. Se muestran 24 por página. |
| RF07 | Ver el perfil del responsable con mascotas disponibles y reseñas visibles. El perfil de un adoptante tiene acceso restringido. |
| RF08 | Registrar una solicitud privada con mascota, nombre, edad, email, teléfono, dirección, vivienda, motivo y compromiso. Rechazar duplicados activos para la misma persona y mascota. |
| RF09 | Permitir al responsable pasar solicitudes activas a revisión, aprobación o rechazo. El solicitante puede cancelar antes de su resolución. |
| RF10 | Aprobar de forma atómica: registrar una adopción, marcar la mascota como adoptada y rechazar otras solicitudes activas para ella. |
| RF11 | Consultar la planilla de adopciones de las que el usuario participa. Solo el responsable modifica las notas; el adoptante puede consultarlas. |
| RF12 | Descargar la planilla visible como CSV con protección básica de celdas que podrían interpretarse como fórmulas. |
| RF13 | Registrar donaciones de dinero, alimentos, medicamentos, accesorios u otros. El registro no efectúa un pago. |
| RF14 | Confirmar o rechazar la recepción solo desde la cuenta destinataria; cancelar solo desde el donante mientras siga pendiente. |
| RF15 | Calcular PATITAS como cinco de bienvenida más diez por donación confirmada; impedir doble confirmación y auto-donación. |
| RF16 | Escribir reseñas de una a cinco estrellas, una por autor y experiencia, entre participantes de una adopción o donación completada. |
| RF17 | Reportar reseñas y permitir a administración ocultarlas o conservarlas al resolver el reporte. |
| RF18 | Mantener chats privados separados por interlocutor, con historial paginado y sin acceso a mensajes ajenos. Administración puede conversar sin leer salas de terceros. |
| RF19 | Mostrar avisos propios, contador de no leídas y acciones de lectura persistente. El chat marca leídos solo mensajes ya mostrados. |
| RF20 | Consultar avisos y chat activo cada cinco segundos con la pestaña visible, conservando el texto que se escribe. |
| RF21 | Guardar notificaciones y poner en cola emails de solicitudes, mensajes, donaciones y reseñas importantes. Sin Gmail el estado es local; no se afirma envío real. |
| RF22 | Permitir reintentar correos locales o fallidos del propio usuario cuando Gmail esté configurado, sin reenviar automáticamente lo ya enviado. |
| RF23 | Conservar registros en SQLite y migrar una base anterior sin borrar su información ni duplicar el regalo inicial. |

## Reglas de negocio

RN01. Los tipos públicos de registro son adoptante, refugio y particular; el formulario no crea administradores ni permite elevar el rol mediante edición de perfil.

RN02. El adoptante debe informar una edad entera de 18 a 120 años y aceptar el compromiso. Estas son reglas educativas del proyecto, no una afirmación sobre requisitos legales de adopción.

RN03. La mascota debe existir y estar disponible. No se admite una solicitud activa repetida. Una cuenta publicadora necesita una foto de perfil para publicar.

RN04. Una mascota tiene como máximo una adopción registrada. Una aprobación no se revierte desde la interfaz de esta versión.

RN05. Donante y destinatario deben ser distintos. La recepción confirmada otorga diez puntos una vez. Los puntos no deciden adopciones ni certifican identidad.

RN06. Las reseñas requieren una experiencia registrada y completada. Los reportes no ocultan automáticamente el comentario: interviene administración.

RN07. Las fotos nuevas admiten JPG, PNG o WebP de hasta 512000 bytes por imagen. Las comprobaciones de formato no equivalen a identificar a quien aparece en la foto.

RN08. Las ilustraciones de cuentas demo se conservan como excepción identificada del ejemplo. Una cuenta real no puede elegirlas como sustituto de una foto nueva.

## Requerimientos no funcionales

| ID | Requisito actual y límite |
| --- | --- |
| RNF01 | Ejecutar con Node.js 24 o superior, navegador moderno y sin instalar dependencias externas de la aplicación. |
| RNF02 | Escuchar en 127.0.0.1 y aceptar hosts localhost o 127.0.0.1. El despliegue público no forma parte de esta versión. |
| RNF03 | Proteger claves con scrypt y sal; no devolverlas al navegador; guardar tokens de sesión como hash. |
| RNF04 | Usar cookie HttpOnly y SameSite Strict y comprobar token CSRF en operaciones de cambio autenticadas. |
| RNF05 | Validar datos en el servidor, usar parámetros SQL y comprobar pertenencia antes de acceder a registros privados. |
| RNF06 | Limitar JSON a 1500000 bytes, imágenes a 512000 bytes, textos según su campo e intentos de acceso a 40 por IP en 15 minutos. |
| RNF07 | Presentar interfaz adaptable a computadora y celular con etiquetas de formulario y mensajes de error. No existe certificación formal de accesibilidad. |
| RNF08 | Entregar fuentes, esquema, instrucciones y pruebas reproducibles para la continuidad del proyecto. |
| RNF09 | Conservar transacciones consistentes de aprobación y donaciones. SQLite local no aporta por sí solo alta disponibilidad o escalado horizontal. |

## Fuera de alcance y aceptación pendiente

No se exige ni se implementa pago automático, verificación de identidad o refugios, recuperación de contraseña, entrega de email garantizada, notificación push, auditoría inmutable o infraestructura pública. Para incorporar estas funciones deberán acordarse requisitos nuevos y probarlos.

La matriz de pruebas vincula estos requisitos con 30 casos automatizados. La prueba manual completa con Gmail real, usuarios de un refugio y diferentes navegadores permanece pendiente de una ejecución documentada por sus responsables.
