# Formulación del proyecto PATITAS

## Identificación y propósito

PATITAS es una aplicación web que conecta personas que desean adoptar mascotas con refugios, organizaciones y rescatistas particulares. Su propósito es organizar publicaciones, solicitudes, adopciones y colaboraciones en un mismo sistema, con acceso privado a la información de cada participante.

La idea de producto corresponde a Angie. La versión documentada fue desarrollada desde cero con asistencia de inteligencia artificial. La documentación describe el código revisado el 15 de noviembre de 2026, identificado en el inventario de fuentes adjunto. No atribuye a la estudiante implementaciones manuales que no realizó ni presenta el prototipo como un servicio público ya operativo.

## Situación problemática

La idea parte de una dificultad frecuente en el trabajo de rescate: la información puede quedar dispersa entre publicaciones, conversaciones y planillas. Esto dificulta conocer qué mascota sigue disponible, quién solicitó adoptarla, qué contacto corresponde a cada adopción y qué colaboraciones fueron recibidas.

Esta descripción es la hipótesis que fundamenta el proyecto. No se realizó una encuesta formal ni se dispone de estadísticas que midan el problema en refugios reales. La validación con organizaciones será una tarea de una siguiente etapa.

## Objetivo general

Desarrollar y documentar una aplicación web local que centralice la gestión de adopciones responsables y la colaboración con refugios y rescatistas, conservando los datos y separando el acceso según los participantes de cada operación.

## Objetivos específicos

- Permitir crear una cuenta, iniciar sesión y distinguir adoptantes, refugios y particulares.
- Publicar mascotas con información y fotografías y consultar su disponibilidad.
- Registrar solicitudes privadas con los datos y condiciones informados por quien desea adoptar.
- Resolver solicitudes y generar una planilla de adopciones y seguimiento.
- Mantener conversaciones privadas separadas por interlocutor.
- Registrar donaciones y reconocer su recepción mediante puntos PATITAS.
- Mostrar notificaciones y preparar correos para los eventos importantes.
- Permitir reseñas basadas en experiencias registradas y su reporte para moderación.
- Conservar código, modelo de datos, manuales y evidencia de pruebas para que otro equipo pueda continuar.

## Destinatarios y actores

Los adoptantes buscan una mascota y completan formularios. Los refugios y particulares publican y administran sus propios animales y solicitudes. Los usuarios de la comunidad pueden colaborar mediante donaciones. Administración revisa reportes de reseñas y participa en sus propios chats de soporte; no tiene una bandeja que permita leer conversaciones ajenas.

## Alcance implementado

La aplicación funciona en una computadora con Node.js 24 o superior. El navegador muestra HTML, CSS y JavaScript; el servidor guarda información en SQLite. El registro exige una foto de perfil y otorga cinco PATITAS de bienvenida. Cada mascota nueva requiere una fotografía principal y admite otra opcional.

El catálogo tiene búsqueda por nombre o ciudad y filtro por especie. Un adoptante envía una solicitud; el responsable puede revisarla, rechazarla o aprobarla. Al aprobar se crea una adopción, se marca la mascota como adoptada y se cierran otras solicitudes activas para ese animal. La planilla se puede descargar como CSV.

El chat y el centro de notificaciones se consultan automáticamente cada cinco segundos mientras la pestaña está visible. Los avisos importantes se conservan y, cuando Gmail está configurado, se ponen en cola de envío.

## Exclusiones y límites

La aplicación no procesa tarjetas, transferencias ni pagos. Una donación es un registro cuya recepción confirma el destinatario. Las PATITAS reconocen colaboración y no determinan automáticamente si alguien puede adoptar. La foto de perfil no es una verificación documental de identidad.

No se implementaron recuperación de contraseñas, verificación del correo, verificación institucional de refugios, notificaciones push del sistema ni publicación en Internet. Gmail requiere una configuración privada externa. Las pruebas de correo utilizan simulaciones y no acreditan una entrega real desde la cuenta de la usuaria.

## Entregables y aceptación

Los entregables son el código, las instrucciones de inicio, el esquema de datos, el DER, los documentos de requerimientos y diseño, los manuales, la explicación pedagógica y los registros de prueba. La aceptación técnica inicial requiere ejecutar la aplicación sin instalar una base externa y aprobar las pruebas automatizadas disponibles.

La evaluación del uso real requiere además probar el flujo con personas de un refugio, completar la configuración de correo y definir responsables de operación y privacidad. Esas verificaciones no se sustituyen con una demostración técnica.

## Continuidad por próximas camadas

Cada nuevo equipo debe registrar la versión recibida, ejecutar sus pruebas antes de cambiarla y actualizar requisitos, DER y manuales cuando modifique comportamientos. Los datos privados y el archivo .env no deben formar parte de la entrega pública. La documentación debe permitir distinguir lo que ya funciona de los desarrollos futuros.
