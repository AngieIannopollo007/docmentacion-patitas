# Matriz de pruebas y trazabilidad de PATITAS

Resultado de la ejecución documentada el 15 de noviembre de 2026. Los nombres corresponden a test/app.test.js y se contrastaron con la salida TAP. Un test puede contener varias comprobaciones. Los requisitos sin cobertura automática directa requieren los casos manuales del plan, en particular exportación CSV y aceptación visual completa.

| Caso | Test y comportamiento evaluado | Requisitos principales | Resultado |
| --- | --- | --- | --- |
| T01 | primero login: ningún dato de la comunidad sin sesión | RF02 | Aprobado |
| T02 | registro, sesión persistida y cierre efectivo | RF01 RF02 RNF03 | Aprobado |
| T03 | login incorrecto, correo duplicado y rol admin no registrable | RF01 RF02 | Aprobado |
| T04 | CSRF: rechaza token falso y origen ajeno | RNF04 | Aprobado |
| T05 | publicación, edición y retiro: solo su responsable | RF04 RF05 | Aprobado |
| T06 | formularios inválidos, límite de edad y mascota inexistente | RF08 RN02 | Aprobado |
| T07 | privacidad: solicitudes y datos de contacto no pasan a otro refugio | RF03 RF08 RNF05 | Aprobado |
| T08 | aprobación: genera planilla, rechaza otras solicitudes y evita doble adopción | RF09 RF10 RF11 | Aprobado |
| T09 | cancelación: solo el solicitante, antes de resolver | RF09 | Aprobado |
| T10 | donación: puntos solo al confirmar, una sola vez, sin auto-donación | RF13 RF14 RF15 | Aprobado |
| T11 | reseñas requieren experiencia, no se duplican y pueden moderarse | RF16 RF17 | Aprobado |
| T12 | mensajes privados: contacto con refugio y respuesta, sin filtración | RF18 | Aprobado |
| T13 | correo sin configurar: queda local y privado, nunca dice enviado | RF21 | Aprobado |
| T14 | cola Gmail: éxito, error recuperable y sin reenvío al procesar de nuevo | RF21 RF22 | Aprobado |
| T15 | SMTP: diálogo TLS simulado, MIME base64 y aceptación final | RF21 | Aprobado |
| T16 | persistencia real después de cerrar y reabrir el archivo SQLite | RF23 | Aprobado |
| T17 | archivos privados no disponibles, CSP presente y login estático accesible | RNF02 RNF05 | Aprobado |
| T18 | perfil editable: ignora escalada de rol y conserva contacto privado | RF03 RN01 | Aprobado |
| T19 | fotos: acepta imagen data limitada y rechaza SVG subido o URL ejecutable | RF04 RN07 | Aprobado |
| T20 | calificación tras adopción en ambos sentidos, sin duplicar | RF16 | Aprobado |
| T21 | HTTP: errores de JSON y de tipo, sin cambios en datos | RNF06 | Aprobado |
| T22 | sesiones vencidas no habilitan acceso aunque exista la cookie | RF02 | Aprobado |
| T23 | registro con foto obligatoria y 5 PATITAS de bienvenida una sola vez | RF01 RF15 | Aprobado |
| T24 | mascota: una foto obligatoria y segunda opcional, conservadas al editar | RF04 | Aprobado |
| T25 | chat individual: cada sala solo contiene mensajes entre sus dos participantes | RF18 | Aprobado |
| T26 | notificaciones privadas: contador, lectura persistente y sin marcar mensajes aún no mostrados | RF19 | Aprobado |
| T27 | historial del chat paginado: permite recuperar mensajes anteriores sin mezclarlos | RF18 | Aprobado |
| T28 | avisos y emails importantes: donación, confirmación y mensaje llegan a su destinatario | RF13 RF14 RF18 RF21 | Aprobado |
| T29 | actualización de una base anterior: conserva datos y no duplica bienvenida ni avisos | RF23 | Aprobado |
| T30 | chat con administración: refugio responde al admin desde la sala y el aviso | RF18 | Aprobado |

Los 30 tests pasaron. RF06, RF07, RF12, RF20 y algunas transiciones no tienen comprobación exhaustiva automatizada; no se infiere cobertura completa a partir de los tests relacionados. Gmail real, uso en dispositivos, accesibilidad formal, respaldo operativo y carga requieren pruebas adicionales.
