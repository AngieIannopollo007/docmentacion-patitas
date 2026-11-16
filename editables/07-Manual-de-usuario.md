# Manual de usuario de PATITAS

## Para quién es este manual

Este manual está dirigido a adoptantes, refugios y rescatistas particulares. Explica cómo usar la versión local. Las cuentas y mascotas de ejemplo son ficticias. Una solicitud no garantiza una adopción y una donación registrada no realiza un pago.

## Abrir y cerrar la app

Primero se extrae el ZIP completo. Dentro de PATITAS se abre ABRIR PATITAS.cmd y se conserva esa ventana abierta. En el navegador se ingresa a http://127.0.0.1:3000. Solo hace falta Node.js 24 o superior; el archivo de base se crea automáticamente.

Si alguien ya inició el servidor, no hay que abrir otro en el mismo puerto. Para detenerlo se presiona Ctrl+C en su ventana. Cerrar la pestaña del navegador no detiene el programa.

## Crear una cuenta

1. Elegir Crear cuenta.
2. Completar nombre o nombre del refugio, ciudad y correo.
3. Elegir adoptante, refugio o particular/rescatista según el uso.
4. Adjuntar una foto de perfil JPG, PNG o WebP de hasta 500 KB.
5. Escribir una contraseña de 10 a 128 caracteres y enviar el formulario.

El registro correcto inicia sesión y reconoce cinco PATITAS de bienvenida una sola vez. La foto ayuda a reconocer visualmente el perfil, pero no comprueba identidad. El tipo de cuenta no se cambia desde Mi perfil.

## Iniciar sesión y probar ejemplos

Ingresar con correo y contraseña. También se puede desplegar la sección de cuentas de ejemplo en el inicio. Las cuatro cuentas utilizan Patitas2026!:

| Uso | Correo de ejemplo |
| --- | --- |
| Adoptante Ana | ana@patitas.test |
| Refugio Huellitas | refugio@patitas.test |
| Rescatista Sofía | sofia@patitas.test |
| Moderación | admin@patitas.test |

Los correos .test no son buzones reales. Las cuentas demo solo aparecen cuando se inicializa una base vacía con la opción de demo activa. En una cuenta propia deben usarse los datos elegidos al registrarse.

La sesión puede mantenerse hasta siete días. En una computadora compartida se debe pulsar Salir al terminar. Si la sesión venció, hay que ingresar de nuevo; el historial guardado permanece.

## Buscar y conocer una mascota

En Encontrá tu compañero se muestran las disponibles. Se puede buscar por nombre o ciudad, elegir especie y pulsar Buscar. Conoceme abre la ficha con edad en meses, sexo, tamaño, historia, salud informada y responsable. Ver perfil responsable abre sus datos públicos, mascotas y reseñas.

Los datos de salud son información publicada por el responsable; no sustituyen una evaluación veterinaria. Una mascota adoptada o retirada deja de aparecer entre las disponibles.

## Enviar una solicitud

Solo una cuenta adoptante ve Quiero adoptar para una mascota disponible. Se completa nombre, edad, correo, teléfono, domicilio, vivienda, motivo y compromiso de cuidado. El formulario explica que esos datos se compartirán con el responsable para gestionar la solicitud.

Al enviarlo, la app valida y guarda. El responsable recibe un aviso y, si Gmail está configurado, el formulario se prepara para su envío por email. Si el correo está local o falla, la solicitud igualmente queda registrada. Mi espacio → Mis solicitudes permite consultar su estado y observaciones.

Mientras esté pendiente o en revisión, el solicitante puede cancelar. No se puede mantener una solicitud activa duplicada para la misma mascota. Si se cancela o rechaza y la mascota sigue disponible, puede enviarse otra nueva.

## Publicar y administrar mascotas

Las cuentas refugio y particular entran en Mi espacio → Mis mascotas → Publicar mascota. Completan nombre, especie, raza opcional, edad en meses, sexo, tamaño, descripción y salud informada. La foto principal es obligatoria; se permite una segunda opcional, ambas de hasta 500 KB.

Editar permite modificar una publicación propia no adoptada. Si no se selecciona otra imagen, se conserva la actual. Retirar publicación la archiva y cierra solicitudes activas; no elimina la historia. Una mascota adoptada no puede editarse mediante ese formulario.

## Revisar solicitudes y seguir adopciones

El responsable abre Solicitudes recibidas y Ver formulario y observaciones. Puede contactar a la persona y elegir Revisar/resolver. Las opciones son continuar en revisión, aprobar y registrar adopción, o rechazar. Las observaciones se comparten con el adoptante.

Antes de aprobar, la organización debe realizar su evaluación humana. Al aprobar se genera automáticamente una fila de la Planilla de seguimiento y se cierra la disponibilidad de esa mascota. La acción también resuelve otras solicitudes activas de la misma mascota. Esta versión no incluye una opción de deshacer una adopción aprobada.

En la planilla se consultan nombre, contacto, domicilio, fecha y notas. Solo el responsable guarda notas, pero el adoptante puede leerlas. Descargar planilla CSV crea un archivo para Excel; contiene datos privados y se debe guardar en un lugar autorizado.

## Colaborar con una donación

Desde el perfil de un refugio o particular se elige Donar. Se consulta su alias o sus instrucciones, si los publicó, y se completa tipo, descripción y monto cuando corresponde. Registrar colaboración no cobra tarjetas ni mueve dinero.

La entrega o transferencia se coordina con el destinatario. La cuenta que recibe abre Donaciones y confirma únicamente si la recibió. Una confirmación otorga diez PATITAS al donante: pasa de cinco a quince con su primera donación confirmada. La misma donación no suma dos veces. Si no se recibió, el destinatario puede rechazarla; el donante puede cancelarla mientras siga pendiente.

## Usar chats privados

Enviar mensaje desde un perfil, una solicitud o una donación abre una sala con esa persona. En Mi espacio → Chats privados se elige un interlocutor de la lista. Los mensajes de Huellitas no aparecen dentro de la sala de Sofía.

Se escribe en el cuadro y se pulsa Enviar mensaje. La sala se actualiza cada cinco segundos mientras la pestaña esté visible. Para ver historia previa se usa Ver mensajes anteriores. Al abrir una sala se marca como leído solo lo ya mostrado. Los mensajes a administración también se responden desde su propia sala; administración no puede leer conversaciones entre otras dos cuentas.

## Consultar notificaciones y correos

La campana abre el centro de notificaciones. El número indica avisos sin leer. Se actualiza cada cinco segundos mientras la app está visible. Abrir un aviso puede llevar al chat o a la sección correspondiente. Marcar todas como leídas guarda esa decisión.

La pestaña Correos muestra el estado del email asociado: local, pendiente, enviando, enviado o error. Local significa que no se intentó enviar por falta de configuración. Enviado significa que Gmail lo aceptó, no que la persona lo leyó. Si está permitido reintentar, primero se debe comprobar si ya llegó, para evitar duplicados en casos ambiguos.

## Calificar y reportar

Una adopción registrada o donación confirmada habilita Dejar reseña o Calificar. Se seleccionan de una a cinco estrellas y se escribe una experiencia respetuosa, sin domicilios u otros datos privados. Solo se permite una por autor y experiencia.

En un perfil se puede Reportar una reseña con un motivo. El reporte lo analiza administración; no se elimina automáticamente por recibir una denuncia. Las reseñas y las PATITAS no garantizan que una persona sea apta para adoptar.

## Editar el perfil y resolver dificultades

Mi perfil permite cambiar nombre, ciudad, foto, descripción y datos privados. El contacto público y el alias se completan solo si se quieren compartir. No se permite cambiar el rol, los puntos ni el email de acceso mediante ese formulario.

Si no conecta, verificar que el servidor siga abierto. Si el puerto está ocupado, cerrar la otra ejecución. Si la foto no se acepta, revisar formato y tamaño. Si un formulario señala un conflicto, actualizar y comprobar el estado de la mascota o donación. Si falla una operación, no repetirla muchas veces sin revisar si se registró.

Las cuentas no tienen recuperación de contraseña automatizada. Ante un problema de acceso real debe intervenir el responsable técnico siguiendo un procedimiento acordado; no se deben editar claves manualmente dentro de la base ni compartir credenciales por chat.
