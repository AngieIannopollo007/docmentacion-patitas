# Configurar Gmail sin compartir tu contraseña

PATITAS está preparada para usar **iannopolloangeline@gmail.com** como remitente. Podés cambiar esa dirección antes de configurarla.

## Lo que vas a necesitar

Una contraseña de aplicación de Google. No es tu contraseña habitual. Google requiere verificación en dos pasos y puede no ofrecer esta opción en cuentas educativas, laborales o con algunas configuraciones de seguridad.

1. Desde tu cuenta de Google, revisá la [guía oficial de contraseñas de aplicación](https://support.google.com/accounts/answer/185833?hl=es).
2. Si tu cuenta lo permite, generá una contraseña de aplicación para PATITAS.
3. **No la pegues en el chat ni en el código.** Guardala únicamente en el archivo privado del siguiente paso. Si no aparece la opción, no desactives protecciones: primero revisá la ayuda oficial.

## Completar el archivo privado

1. En la carpeta PATITAS, copiá `.env.example` y renombrá la copia como **`.env`**. En el Explorador activá «Extensiones de nombre de archivo» para evitar que quede como .env.txt.
2. Abrí `.env` con el Bloc de notas o VS Code.
3. Conservá tu dirección en GMAIL_USER y pegá la contraseña de aplicación después de GMAIL_APP_PASSWORD=.

```text
PORT=3000
GMAIL_USER=iannopolloangeline@gmail.com
GMAIL_APP_PASSWORD=COMPLETAR_SOLO_EN_TU_COMPUTADORA
DEMO=1
```

La línea de ejemplo anterior es un marcador, no una contraseña válida. Si todavía no tenés la contraseña, dejá el valor vacío; no copies el marcador.

4. Guardá, detené PATITAS con Ctrl+C y volvé a abrir ABRIR PATITAS.cmd.
5. La ventana del servidor debe indicar que Gmail está configurado. Eso confirma que hay configuración, no que Gmail la haya aceptado.

La conexión usa smtp.gmail.com con TLS directo y puerto 465. No se desactiva la validación del certificado. Las claves nunca se muestran en las respuestas de la app.

## Probar un correo de verdad

Las cuentas de ejemplo terminan en `.test` y **no son buzones de correo reales**. Para probar recepción:

1. Creá una cuenta de refugio con un correo real al que tengas acceso y publicá una mascota de prueba.
2. Desde una cuenta adoptante enviá la solicitud de esa mascota usando solo datos ficticios.
3. Volvé a la cuenta del refugio y mirá Mi espacio → Correos.
4. Buscá el correo en su bandeja de entrada y en spam.

La solicitud se guarda antes de intentar el correo. El servidor revisa pendientes cada cinco segundos. Los estados son:

| Estado | Qué significa |
| --- | --- |
| local | Falta configuración; no se intentó enviar |
| pendiente | Está en cola |
| enviando | Se está contactando con Gmail |
| enviado | Gmail aceptó el mensaje; no garantiza entrega en la bandeja principal |
| error | No se pudo confirmar el envío; revisá antes de reintentar |

Después de configurar Gmail, las notificaciones locales no se envían automáticamente para evitar envíos inesperados: el destinatario puede usar «Enviar / reintentar email» desde la app. Si se interrumpió un envío, revisá tu correo antes de reintentarlo porque puede haber sido aceptado aunque no se haya guardado la confirmación.

Los formularios de adopción contienen datos personales y se envían al responsable. Informá a quien completa la solicitud y evitá usar datos reales en pruebas. El usuario del refugio debe registrar correctamente su correo: esta versión no verifica la propiedad del buzón.

## Qué no subir a GitHub

Nunca subas `.env` ni `datos/`. Ya están en .gitignore. `.env.example` tiene solo una dirección y campos vacíos, por eso puede acompañar al código.

Si alguna vez compartiste la contraseña de aplicación, revocala desde Google. Si cambiaste tu contraseña de Google, puede ser necesario generar una contraseña de aplicación nueva, según la [documentación oficial](https://support.google.com/accounts/answer/185833?hl=es).

No se realizó un envío real con esta cuenta durante el desarrollo; se probó el diálogo SMTP con un servidor simulado y los estados de la cola con un transporte de prueba.

Los mensajes, donaciones, solicitudes, cambios y reseñas importantes también generan email. El centro de Notificaciones es independiente del estado de correo y se actualiza automáticamente cada cinco segundos.
