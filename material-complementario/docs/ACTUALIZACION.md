# Correcciones de notificaciones, chats, fotos y bienvenida

## Cómo actualizar sin perder tus datos

1. Cerrá el servidor anterior con Ctrl+C en la ventana donde ejecutaste PATITAS. Cerrar solo la pestaña del navegador no lo detiene.
2. Como respaldo, copiá tu carpeta PATITAS a otro lugar con la app cerrada.
3. Extraé el nuevo ZIP en una carpeta temporal. Copiá su contenido dentro de tu carpeta PATITAS habitual y aceptá reemplazar los archivos del programa.
4. **Conservá tu carpeta datos y tu archivo .env. No los borres.** El ZIP no los incluye y no tenés que reemplazarlos.
5. Abrí de nuevo ABRIR PATITAS.cmd y recargá el navegador. Al iniciar se actualiza la base existente sin borrar sus registros.

Si preferís empezar desde cero para probar, podés extraerlo en una carpeta nueva: tendrá una base nueva, sin el historial de la carpeta anterior.

## Centro de notificaciones

El botón de campana está en la parte superior. También se puede abrir Mi espacio → Notificaciones. Muestra avisos de mensajes, solicitudes, cambios de adopción, donaciones y reseñas, con contador de no leídas. Podés abrir cada aviso o marcar todos como leídos.

Se consulta cada cinco segundos mientras la pestaña está visible. Al volver a la pestaña se actualiza de nuevo. No son notificaciones push del sistema operativo y no aparecen si cerraste la app. La lectura se guarda en la base, por lo que no reaparecen como nuevas al refrescar.

## Chat separado con cada persona

Desde un perfil, «Enviar mensaje» abre una sala privada con esa cuenta. Mi espacio → Chats privados muestra la lista de conversaciones. Elegir Huellitas muestra solo mensajes entre vos y Huellitas; elegir Sofía muestra únicamente esa otra conversación. Nadie de un tercer perfil puede consultar una conversación ajena.

Los mensajes nuevos se consultan cada cinco segundos sin reemplazar el cuadro en el que escribís. El historial inicial muestra los últimos cien y permite cargar anteriores. Los mensajes se marcan como leídos hasta el último que se mostró, evitando marcar por accidente uno que llegó después.

## Correos de novedades importantes

Con Gmail configurado se ponen en cola emails por:

- Nueva solicitud: el responsable recibe el formulario con nombre, edad, correo, teléfono, dirección, vivienda, motivo y compromiso.
- Cambio o cancelación de una solicitud, incluida la adopción de una mascota solicitada por otra persona.
- Nueva donación: se avisa al destinatario. Si se confirma, rechaza o cancela, se avisa a la otra parte.
- Nuevo mensaje: se avisa a su receptor e indica que debe responder desde el chat de PATITAS.
- Nueva reseña: se avisa a la persona que la recibió.

Sin Gmail los avisos igualmente aparecen en el centro y los emails quedan como «local». La pestaña Correos separa los estados de envío del centro de notificaciones. Configurar Gmail sigue requiriendo tu contraseña de aplicación privada; no se realizó un envío real con tu cuenta durante esta actualización.

## 5 PATITAS de bienvenida

Cada cuenta comienza con cinco PATITAS, una sola vez, y suma diez por cada donación confirmada. Ejemplo: 5 al registrarse y 15 después de la primera donación recibida y confirmada.

Al actualizar una base anterior también se reconoce el regalo una sola vez por cuenta; se conserva como un valor fijo y no se vuelve a sumar en cada inicio. No se modifica desde el cliente. Las PATITAS no verifican identidad ni aptitud para adoptar.

## Fotos obligatorias

Al registrarse se exige una foto de perfil. Publicar una mascota exige una foto principal y admite una segunda opcional. Se permiten JPG, PNG y WebP de hasta 500 KB por imagen, con comprobaciones en el navegador y en el servidor.

Las cuentas reales existentes sin foto pueden iniciar sesión para completarla en Mi perfil; no pueden publicar una mascota nueva sin hacerlo. Las ilustraciones identificadas como DEMO se mantienen solo para las cuentas y mascotas ficticias del ejemplo. Las subidas nuevas no pueden usar una ilustración demo como sustituto.

La foto es un elemento visual del perfil, **no una verificación documental de identidad**. Esta versión no realiza reconocimiento facial ni comprueba que una fotografía pertenezca a la persona.

## Adopción

En Conoceme se muestran la ficha y los botones «Quiero adoptar» y «Ver perfil responsable» cuando corresponde. Quiero adoptar abre el formulario privado. La app registra la solicitud y crea el aviso al responsable; el email completo se envía cuando Gmail está configurado y acepta el mensaje.

## Chat con administración corregido

Ahora refugios, adoptantes y particulares pueden abrir y responder a administración. Administración puede iniciar una conversación de soporte, pero no puede leer conversaciones entre otros usuarios. Si una sala no puede abrirse, se conserva la lista para elegir otra. Para aplicar esta corrección reemplazá los archivos del programa y reiniciá el servidor; no alcanza con recargar la pestaña si el servidor anterior sigue encendido.
