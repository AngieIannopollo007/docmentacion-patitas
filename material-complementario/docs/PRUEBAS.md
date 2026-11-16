# Verificación de PATITAS

## Resultado real

Se ejecutó `node --test --test-reporter=tap` en Windows con Node.js v24.22.1.

**30 tests, 30 aprobados, cero fallos, cero omitidos.** Duración de la ejecución final: 4945.7681 ms. Las duraciones pueden variar. La salida original está en reportes/pruebas.tap.

## Qué se comprobó automáticamente

1. La comunidad requiere iniciar sesión.
2. Registro, contraseña protegida, cookie de sesión y cierre.
3. Login incorrecto, email duplicado e imposibilidad de registrarse como administrador.
4. Rechazo de token de formulario falso y origen web ajeno.
5. Publicación, edición y retiro solo por el responsable.
6. Validación de solicitud, mínimo 18 años, mascota existente y prevención de duplicados activos.
7. Privacidad de formularios y datos de contacto frente a otros refugios.
8. Aprobación con planilla, cierre de otras solicitudes y prevención de doble adopción.
9. Cancelación solo por el solicitante antes de resolver.
10. Donación con puntos únicamente al confirmar, sin repetición ni auto-donación.
11. Reseñas ligadas a experiencia confirmada, sin duplicados, reporte y moderación.
12. Mensajes privados y respuestas sin filtración a otro usuario.
13. Correo sin configurar guardado como local, no enviado.
14. Cola Gmail con transporte simulado: envío aceptado, error, reintento y ausencia de reenvío automático.
15. Diálogo SMTP con conexión TLS simulada, cuerpo MIME base64 y aceptación final.
16. Persistencia en un archivo SQLite al cerrar y reabrir.
17. Bloqueo de .env, base y código del backend por HTTP; recursos públicos disponibles.
18. Actualización de perfil sin elevar el rol ni exponer teléfono o dirección privados.
19. Formatos de foto admitidos y rechazo de SVG subido, URL externa o ejecutable.
20. Reseñas de adopción en ambos sentidos sin duplicación.
21. JSON mal formado y tipo de contenido incorrecto.
22. Caducidad de sesiones.
23. Foto de perfil obligatoria y bienvenida de cinco puntos sin repetición.
24. Foto principal de mascota obligatoria y segunda opcional.
25. Salas individuales: solo mensajes entre los dos participantes.
26. Notificaciones privadas, lectura persistente y protección de mensajes aún no mostrados.
27. Historial paginado que recupera 105 mensajes sin duplicarlos ni mezclarlos.
28. Email y aviso para donaciones, confirmación y mensajes, con destinatario correcto.
29. Migración de una base anterior sin pérdida de registros ni duplicación de avisos o regalo.
30. Chat con administración: recibir, abrir desde aviso, responder y marcar leído, sin mostrar la conversación a un tercero.

Las pruebas usan peticiones HTTP reales a puertos locales temporales y SQLite en memoria o archivos temporales. No usan la base habitual del usuario y no realizan correos reales, transferencias ni cobros.

## Revisión de la actualización en navegador

En una base temporal separada de la base habitual se comprobó: botón de campana visible, cinco PATITAS al ingresar, apertura de chat desde el perfil, envío de mensajes a Huellitas y a Sofía, y cambio entre salas sin mostrar mensajes de la otra conversación. Se observó que el campo de escritura permanecía disponible con su borrador durante la revisión. La verificación del contador y la lectura de avisos, el envío de emails y las migraciones se respalda además con las pruebas automáticas; no se afirma entrega real en Gmail. La pestaña de prueba se cerró antes de guardar una nueva captura.

## Revisión anterior de la base de la aplicación

Se revisó la app en el navegador integrado con cuentas demo y datos ficticios. Se completaron estas acciones:

- Inicio de sesión como adoptante y refugio, y cierre de sesión.
- Catálogo y ficha de una mascota.
- Envío de una solicitud, confirmación visible y consulta del panel.
- Aprobación desde el refugio y aparición de datos en la planilla.
- Publicación de una mascota ficticia desde el formulario.
- Registro de una donación de alimentos y confirmación desde el refugio, mostrando 10 PATITAS otorgadas.
- Catálogo en escritorio (1280 × 900) y vista de celular (390 × 844 solicitados; ancho DOM observado 375 px). En la vista móvil el ancho del documento y su contenido fueron ambos 375 px: no hubo desborde horizontal global.

La captura en reportes/pantalla-catalogo.jpg corresponde a esa revisión y muestra datos de prueba. El ZIP no incluye la base usada durante la revisión; al abrirlo en una carpeta nueva se crean las tres mascotas demo originales disponibles.

## Lo que no se comprobó con un servicio real

- No se envió email desde iannopolloangeline@gmail.com: falta la contraseña de aplicación que completará su dueña. El éxito de la simulación no demuestra aceptación por Google ni entrega al destinatario real.
- No se realizaron pagos. La app organiza donaciones y confirma recepción manual, sin procesar tarjetas o transferencias.
- No se verificaron identidades, refugios o hechos narrados en reseñas. El mecanismo limita reseñas a experiencias registradas, pero no elimina acuerdos abusivos entre cuentas.
- No es una auditoría de seguridad exhaustiva ni una prueba de carga o de todos los navegadores. Es una aplicación educativa local con pruebas de sus recorridos y permisos principales.

## Repetir

Abrí una terminal en PATITAS y ejecutá `node --test`. Debe permitirse la conexión local del servidor de prueba. Para el recorrido manual, iniciá `node servidor.js` y abrí http://127.0.0.1:3000. Usá los datos de ejemplo del README.

## Corrección del chat con admin

Se reprodujo el fallo reportado: la prueba específica falló antes del cambio con 404 al abrir el chat de administración. El validador excluía al destinatario admin, aunque esa cuenta podía escribir a un refugio. Se habilitaron conversaciones de soporte en ambos sentidos sin cambiar la consulta que restringe el historial a sus dos participantes. La salida de reproducción está en reportes/regresion-admin-antes.tap. Después, la suite completa pasó sus 30 tests. Además, un error al abrir una sala conserva la lista de chats, en vez de sustituir todo el panel por un error. No se modificaron los mensajes reales del usuario.
