# Plan y resultados de pruebas de PATITAS

## Objetivo

Comprobar que los recorridos principales conservan datos, respetan permisos y manejan los conflictos previstos. La referencia es la copia del proyecto indicada por la estudiante. Se volvió a ejecutar la suite para esta documentación; no se reutilizó una cifra de una versión anterior sin comprobarla.

## Alcance, entorno y estrategia

Se utilizó Windows y Node.js v24.22.1 con node:test y node:assert/strict. Las pruebas construyen la aplicación con SQLite en memoria o en archivos temporales y abren servidores HTTP en puertos locales de prueba. No usan la base de datos personal ni las credenciales Gmail del usuario.

La estrategia combina comprobaciones de reglas, integración HTTP, consultas de SQLite y pruebas simuladas de correo. Se evalúan servicios mediante la API y también en recorridos directos de persistencia; la mayoría de los casos son integraciones, no tests unitarios puros.

El criterio de entrada es disponer del código y Node compatible. El de salida inicial es que todos los casos automatizados terminen sin fallos, registrar el resultado y declarar verificaciones pendientes. Un test aprobado no demuestra ausencia de cualquier defecto ni capacidad para carga masiva.

## Ejecución verificada

Se ejecutó node --test --test-reporter=tap sobre test/app.test.js el 15 de noviembre de 2026. El resultado fue 30 tests, 30 aprobados, cero fallos, cero omitidos y cero cancelados. La duración observada fue 5162.8643 ms. La salida íntegra acompaña la entrega en evidencia/pruebas-verificadas.tap.

No se cambió el código para documentarlo ni se abrieron datos reales. La ubicación y los hashes de las fuentes quedan en el inventario de evidencia.

## Matriz de resultados

La tabla detallada adjunta enumera T01 a T30, el propósito, los requisitos relacionados, el resultado observado y la referencia al nombre real del test. «Aprobado» se asigna solo a casos presentes en la salida TAP.

Los grupos cubiertos son: acceso y sesión; privacidad y permisos; publicación y fotos; solicitud y aprobación; donación y puntos; reseñas y moderación; chats y lectura; persistencia y migración; archivos privados; y cola/transporte simulado de correo.

## Casos límite y negativos

Se incluyen edad mínima y menor de edad, valores de tipo incorrecto, email inválido, compromiso no aceptado, mascota inexistente, duplicación de solicitud, segunda confirmación de donación, intento de auto-donación, rol administrador enviado desde un registro público, sesión vencida, token CSRF falso, origen ajeno, imagen no admitida y JSON mal formado.

También se prueba que una sala muestra solo mensajes entre sus participantes, que leer un chat no marque mensajes posteriores al último mostrado y que el historial paginado recupere 105 mensajes sin mezcla. La regresión de admin reproduce el recorrido de recibir, abrir y responder sin extender acceso a conversaciones de terceros.

## Pruebas manuales planificadas y pendientes

| ID | Procedimiento propuesto | Resultado esperado | Estado de esta entrega |
| --- | --- | --- | --- |
| M01 | Ejecutar acceso, perfil y formulario en Chrome y Edge con teclado | Completar tareas sin bloqueo y con etiquetas claras | Pendiente de ejecución comparativa documentada |
| M02 | Probar celular real y diferentes tamaños | Sin controles inaccesibles o pérdida de contenido | Pendiente en dispositivos reales |
| M03 | Configurar Gmail autorizado, enviar datos ficticios y revisar entrada/spam | Recibir el aviso y comprobar sus datos | Pendiente; no se utilizaron credenciales reales |
| M04 | Confirmar una entrega ficticia en dos cuentas | Puntos y estados coherentes en interfaz | Recorrido existente; nueva aceptación manual formal pendiente |
| M05 | Descargar CSV y abrirlo en Excel | Columnas legibles y contenido privado correcto | Pendiente con la herramienta del destinatario |
| M06 | Respaldar y restaurar una base ficticia con la app cerrada | Recuperar cuentas y registros | Pendiente de simulacro operativo |
| M07 | Prueba piloto con responsable de refugio | Comprender tareas, estados y consentimiento | Pendiente; no hubo validación de campo |
| M08 | Carga y concurrencia representativas | Medir tiempos y recursos para una capacidad acordada | Pendiente; no hay objetivo de carga validado |

No se presentan estas verificaciones como realizadas. Las revisiones de navegador de etapas anteriores no reemplazan un acta de aceptación actual con usuarios y dispositivos reales.

## Tratamiento de fallos

Registrar versión, caso, datos ficticios usados, pasos, resultado esperado y observado. Reproducir antes de corregir, agregar una prueba de regresión cuando corresponda y volver a ejecutar los casos afectados. No editar la expectativa para ocultar un fallo.

Si falla el correo, comprobar si la solicitud está guardada antes de repetir el envío. Si falla una migración o se sospecha pérdida de datos, conservar el archivo original y diagnosticar sobre una copia, no sobre el único historial disponible.

## Conclusión y límites

Los 30 casos automatizados disponibles aprobaron en el entorno observado. El resultado respalda los comportamientos cubiertos, pero no certifica seguridad exhaustiva, conformidad legal, accesibilidad formal, entrega real de Gmail o escalabilidad pública. La próxima etapa debe completar las pruebas manuales y de operación indicadas y actualizar esta evidencia después de cualquier cambio.

