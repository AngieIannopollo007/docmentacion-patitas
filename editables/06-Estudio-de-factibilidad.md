# Estudio de factibilidad de PATITAS

## Objeto y alcance

Se evalúa si la versión educativa local puede utilizarse y mantenerse como base para prácticas profesionales. No se evalúa una operación comercial con usuarios reales ni se presentan cotizaciones, estudios legales o resultados de campo inexistentes.

## Factibilidad técnica

La solución es técnicamente viable para demostraciones y trabajo local: requiere Node.js 24 o superior, un navegador moderno y permisos de escritura para crear su archivo SQLite. No necesita instalar un servidor de base de datos ni paquetes externos de la aplicación. Las pruebas automatizadas vuelven a crear entornos temporales, lo que facilita reproducir fallos.

El backend y la interfaz están concentrados en pocos archivos y utilizan un lenguaje principal, JavaScript. Esto reduce herramientas iniciales, aunque el tamaño de public/app.js y backend/servicios.js demanda explicación y futuras divisiones por módulos. SQLite síncrono y las fotos guardadas como texto Base64 son sencillos para este alcance, pero pueden aumentar bloqueo, memoria y tamaño de respuestas si el volumen crece.

La viabilidad de publicación pública es condicionada: requiere HTTPS, configuración de cookies, infraestructura persistente, copias, controles de abuso y una estrategia de concurrencia. Una prueba local aprobada no valida automáticamente ese escenario.

## Factibilidad operativa

Los roles y los recorridos permiten representar tareas habituales: publicar, revisar, contactar, confirmar y seguir adopciones. Sin embargo, un refugio real debe aceptar el flujo y asignar quién revisa solicitudes y confirma recepciones. Un equipo técnico debe ocuparse de respaldos, actualizaciones y problemas de correo.

Se recomienda una prueba piloto con datos ficticios y una organización voluntaria antes de usar datos personales. La aceptación operativa debe observar si encuentran las acciones, comprenden los estados y pueden resolver una solicitud sin ayuda permanente. Este piloto todavía no se documentó como realizado.

## Factibilidad económica

Para el prototipo se aprovechan una computadora y una conexión existentes. El proyecto no incorpora una dependencia de pago de la aplicación ni una pasarela que genere comisiones dentro del código. Eso no implica costo total cero: existen tiempo de aprendizaje y desarrollo, electricidad, conectividad, soporte y respaldo.

| Recurso | Situación local | Para una etapa pública |
| --- | --- | --- |
| Computadora y navegador | Se utiliza equipamiento disponible | Revisar capacidad de operación y soporte |
| Servidor y base | Se ejecutan en la computadora | Cotizar alojamiento compatible y persistencia |
| Correo | Depende de una cuenta configurada | Evaluar límites, entregabilidad y servicio adecuado |
| Desarrollo y documentación | Esfuerzo estimado de 120 horas en el cronograma propuesto | Reestimar por alcance y equipo |
| Mantenimiento | Responsabilidad del equipo educativo | Asignar responsable y presupuesto continuo |

No se indican importes monetarios porque no se solicitaron cotizaciones ni se definió infraestructura. La decisión de invertir debe basarse en presupuestos actuales y necesidades verificadas.

## Factibilidad de calendario

Un ciclo de ocho semanas y 120 horas es una estimación de planificación para desarrollar o continuar el alcance educativo. Debe ajustarse a conocimientos y disponibilidad. Los principales factores externos son la configuración de Gmail, la coordinación con refugios y la preparación para un despliegue real.

## Factibilidad de gestión y protección de datos

El sistema trata domicilios, teléfonos, correos y conversaciones. Antes de una operación real deben definirse consentimiento, propósito de uso, retención, acceso, eliminación y tratamiento de incidentes. La app no automatiza todos esos procesos ni constituye una evaluación de cumplimiento legal.

La existencia de foto o PATITAS no verifica identidad ni antecedentes. Para operar públicamente se necesita un procedimiento humano de evaluación de adoptantes y refugios y administración de cuentas. Una próxima etapa deberá revisar los requisitos normativos aplicables con asesoramiento adecuado; este documento no afirma que ya se cumplan.

## Riesgos y tratamiento propuesto

| Riesgo | Consecuencia | Tratamiento y responsable propuesto |
| --- | --- | --- |
| Borrado o daño del archivo de base | Pérdida de historial | Respaldos con app cerrada y prueba de restauración por operador técnico |
| Contraseñas demo en una publicación real | Acceso indebido | Retirar demo y definir alta segura de administración antes de desplegar |
| Datos de contacto falsos | Solicitudes o correos a destinatario incorrecto | Verificación de buzón y proceso humano en una etapa siguiente |
| Confundir donación registrada con pago | Reclamos y puntos sin recepción real | Mensajes claros y confirmación humana del destinatario |
| Correo rechazado o ambiguo | La persona no recibe el aviso | Mantener centro local, estados y reintento controlado |
| Crecimiento de imágenes e historial | Mayor tiempo y tamaño de respuesta | Medir carga, separar almacenamiento de imágenes y paginar paneles |
| Rotación de estudiantes | Pérdida de conocimiento | Mantener manual técnico, DER, pruebas y registro de cambios |

## Conclusión

La versión es factible como prototipo educativo local y base de aprendizaje. Su uso público es viable solo de manera condicionada a completar la preparación técnica y operativa pendiente. La recomendación es conservar esta versión reproducible y validar primero un piloto, sin prometer operación masiva a partir de sus pruebas locales.
