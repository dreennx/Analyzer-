--[[
   Roblox Public Profile Analyzer  v3.9.1
   ---------------------------------------------------------------
   Cambios en v3.9.1 (sobre v3.9.0) — ANIMACIONES:
     • NUEVO escáner de análisis "NX Flow": sustituye la banda/haz que
       barría la pantalla. Minimalista — TRES servidores en fila que
       representan el flujo del análisis: Request -> Processing ->
       Complete, con una línea entre cada par y un paquete de datos que
       viaja de uno al siguiente. La información del perfil aparece SOLO
       DESPUÉS de que la animación se desvanece (nunca encima de ella).
       Cubre solo el área de contenido y es casi opaca, así no se ve nada
       por debajo. Vive en su propio módulo (_G.NXScan), separado de la
       lógica del analizador: el único vínculo es _G.NXScan.finish(cb).
       Todo TweenService, sin RenderStepped propio.
     • Transición entre secciones y aparición de la info con "smoosh"
       (deslizamiento + micro pop con rebote).
     • La ventana hace un pequeño smoosh al arrastrarla (se encoge un
       pelín al agarrarla y rebota al soltar).
     • Micro-feedback de pulsación en los botones (se hunden un pelín).
       Deliberadamente sutil.
   ---------------------------------------------------------------
   Cambios en v3.9.0 (sobre v3.8.3):

     INTERFAZ — menos ruido, nada de errores en pantalla
     • RETIRADA la tarjeta "Verificación" de la pestaña Perfil. Lo que
       aportaba (estado de la cuenta, insignia verificada, coincidencia
       de nombres y nombres previos) NO se pierde: se movió a la nueva
       pestaña Huella, que es su sitio natural, junto al resto de
       comprobaciones. Deja de haber dos sitios diciendo lo mismo.
     • LA INTERFAZ YA NO MUESTRA ERRORES. Un fallo de API, un executor
       sin portapapeles o una respuesta corrupta se muestran como "No
       disponible", no como un error con su causa técnica. La distinción
       que SÍ se conserva, porque es información real, es la de "No
       encontrado" (la fuente respondió y el dato no está) frente a "No
       disponible" (la fuente no respondió).
     • RETIRADO el estilo terminal "Kali" entero: la tarjeta de Ajustes,
       la capa de fuente monoespaciada y el tema de color "kali". Quien
       lo tuviera guardado como tema arranca en "tor" sin perder nada.
     • RETIRADOS los emojis de la interfaz (83 en 72 textos). Se
       conservan los glifos que hacen un trabajo: la marca de
       verificación, los triángulos de plegar/desplegar, las viñetas y
       las flechas.
     • RETIRADO el botón "Enviar solicitud de amistad" de la pestaña
       Perfil, con su función y la comprobación de estado que lo
       alimentaba.
     • MODO AVANZADO (Ajustes). Apagado por defecto: la pestaña Análisis
       enseña las puntuaciones y poco más. Encendido, añade los
       desgloses ponderados, las notas metodológicas y la sección de
       recolección profunda de la pestaña Huella. Se aplica al perfil
       que ya tengas en pantalla, sin re-analizar.

     NUEVO — pestaña "Huella": OSINT sobre el ecosistema de Roblox
     • Traducción de tres herramientas clásicas a lo que Roblox SÍ
       expone públicamente:
       - Sherlock (¿dónde existe esta identidad?) -> presencia en
         DevForum, experiencias publicadas, grupos que dirige, items en
         el catálogo e inventario público, cada uno con su enlace.
       - Maigret (recolección profunda) -> cifras totales en vez de las
         muestras de 10 de la pestaña Items. Solo en modo avanzado.
       - Holehe (¿en qué servicios está esta cuenta?) -> Roblox no
         expone el correo de NADIE, así que se traduce a estado de la
         cuenta cruzando dos fuentes independientes.
     • Carga PEREZOSA: la pestaña no gasta ni una petición hasta que la
       abres, y no repite nada si el perfil no cambió.
     • Botón "Copiar informe": vuelca a texto todo lo resuelto.
     • Rolimon's aparece como "No verificable desde el script" y no como
       un fallo: su API pública se retiró y eso no es un error nuestro.

     ARREGLOS DE FONDO
     • FIX (colores que no cuadraban): la resolución de color de los
       tags estaba DUPLICADA con dos paletas distintas (red, blue, cyan,
       gold, yellow, purple, black y white no coincidían), así que el
       MISMO tag salía de un color en el chip del perfil y de otro sobre
       la cabeza. Ahora hay un solo kit (_G.NXTagKit) del que leen las
       tres capas, y también un solo sitio donde se descarta la corona.
     • FIX (media configuración): había DOS URLs para el MISMO tags.json
       ("/refs/heads/main/" y "/main/"), así que cambiar de rama o de
       repositorio arreglaba la mitad del script y dejaba la otra mitad
       apuntando al sitio viejo. Ahora todo sale de _G.NXTagRepo.
     • Descargar y parsear JSON estaba reescrito CUATRO veces, cada copia
       con su propio criterio sobre qué es un fallo. Ahora es _G.NXJson.
     • Fuera los sondeos con task.wait: el chip del perfil daba hasta 60
       vueltas de 0.1 s esperando a que cargara un JSON. Los dos backends
       avisan cuando terminan (_G.NXV2.onReady / alCargarLegacy).
     • isLicensed() era un `return true` fijo, así que licenses.json y
       showLicenseDenied() estaban muertos sin que se notara. Ahora
       comprueba de verdad, sigue siendo fail-open (si el archivo no
       carga o no declara "_enforce": true, pasa todo el mundo) y admite
       caducidad por usuario.
     • El 'store' de NX V2 tapaba al 'store' de preferencias del chunk
       raíz. Renombrado a 'cache'.
   ---------------------------------------------------------------
   Cambios en v3.8.3 (fixes visuales de UI, sobre v3.8.2):
     • TABS: el texto ahora es SIEMPRE blanco. El tab activo va en blanco
       pleno y los inactivos en el mismo blanco pero atenuado
       (TextTransparency), así se lee todo igual de claro y se distingue
       cuál está activo. Guarda de luminancia: si el fondo del tab fuera
       muy claro (el tema "negro" tiene accent blanco, "claro" tiene
       neutral claro) el texto cae a onAccent para no quedar invisible.
       Además el bloque del tab inactivo es más suave (menos saturado).
     • IDENTIDAD SIN DUPLICAR: UserId, Username y Display Name se mostraban
       DOS veces (como filas del perfil arriba y otra vez dentro del panel
       " Identidad"). Se quitaron del panel, que pasa a llamarse
       " Verificación" y se queda SOLO con lo que aporta análisis
       (coincidencia de nombres, estado de la cuenta, verificado cruzado y
       nombres previos). La identidad queda en UNA sola sección: las filas
       del perfil, con la etiqueta a la izquierda y el valor a la derecha.
       También se retiró la fila "Antigüedad" del panel (era idéntica a
       "Edad de cuenta" de arriba).
     • MENOS INTENSIDAD: el borde neón (PRISM) es más transparente y
       calmado, y el contorno del panel más suave. Mismo estilo, menos
       saturación. (Los acentos de cada tema NO se tocaron para no romper
       los contrastes ya afinados.)
   ---------------------------------------------------------------
   Cambios en v3.8.2 (fixes UI, sobre v3.8.1):
     • RETIRADO el menú de sugerencias del buscador. Caía a y=72 y las
       tabs están a y=78, así que TAPABA la barra de pestañas y no se
       podía cambiar de vista con el buscador enfocado. Buscar sigue
       funcionando: escribir + Enter o pulsar "Analizar".
     • FIX: la barra de pestañas era transparente y el contenido con
       scroll se veía POR DEBAJO (el toggle "Activado" atravesándola).
       Ahora tiene fondo sólido (color de tema).
     • FIX: "Estadísticas" se cortaba a "stadística" con la fuente
       mono. Los tabs pasan a AUTO-ANCHO (crecen con el texto + 14 px
       de aire a cada lado) y quedan bloqueados en Gotham vía atributo
       NXfLock (el skin Kali ya lo respeta).
   ---------------------------------------------------------------
   Cambios en v3.8.1 (limpieza de UI, sobre v3.8.0):
     • RETIRADO el barrido CRT permanente (animación que corría todo
       el tiempo en el menú). La única animación tipo escáner que
       queda es la de búsqueda, que ya se enciende solo al analizar.
     • RETIRADOS los corchetes HUD de las esquinas (cajas de adorno).
     • RETIRADO el logo NX de la esquina superior derecha. Los
       controles de ventana pasan a esa esquina y el título recupera
       el ancho: cabecera más limpia y equilibrada.
     • ARREGLADA la fila del link del perfil: el link va ahora en una
       fila entera arriba (siempre visible y completo) y Abrir Perfil /
       Copiar link en una segunda fila a mitades. Ya no se montan entre
       sí ni el texto se sale al achicar la ventana.
     • RETIRADA la barra de terminal inferior (duplicaba la línea de
       estado y quitaba alto). El tema Kali + la fuente mono mantienen
       el aire de terminal. Contenido más alto.
     • RETIRADO el botón Reportar de la fila del link. Nota: Roblox NO
       expone ninguna API para abrir su menú nativo de reporte desde un
       script/executor, así que un botón "nativo" es imposible.
     • Redacción del historial de nombres: en vez de "no existe", dice
       que Roblox "no lo hace público / no disponible".
   ---------------------------------------------------------------
   Cambios en v3.8.0 (sobre v3.7.0):
     • NUEVO: COPIAR LA DESCRIPCIÓN de la cuenta. Dos sitios:
       - Tarjeta "Descripción" de la pestaña Perfil: la cabecera ahora
         lleva el contador de caracteres y un botón "Copiar". Copia el
         texto COMPLETO aunque en pantalla esté plegado ("Mostrar
         más"), porque copia la cadena original, no lo que se ve.
         Si la cuenta no tiene descripción, el botón queda apagado y
         lo dice en la barra de estado en vez de copiar "Sin
         descripción" como si fuera un dato.
       - Mini-perfil (el que abre "Analizar →" en un amigo): junto a
         "Copiar usuario" hay ahora "Copiar descripción". La bio llega
         asíncrona, así que el botón avisa si aún no hay nada.
     • NUEVO: TEMA "KALI" — la terminal de Kali Linux. Fondo casi
       negro azulado, acento azul dragón y verde fósforo para los
       estados correctos. Primero en el selector de Ajustes.
     • NUEVO: BARRA DE TERMINAL abajo del panel. Prompt de dos líneas
       igual que el zsh de Kali (┌──(nx@analyzer)-[ruta] / └─$), con
       el comando tecleándose letra a letra, cursor parpadeante y la
       salida real de la herramienta (espeja statusLabel y la colorea:
       verde ok, rojo error). Los ángulos del prompt van DIBUJADOS con
       frames, no como texto: los caracteres de caja salen como
       cuadros vacíos en varias fuentes de Roblox.
     • NUEVO: capa "NX KALI SKIN" — marco HUD en las esquinas del área
       de datos, barrido CRT y TIPOGRAFÍA MONO en todo el panel.
       Se enciende y apaga desde Ajustes › " Estilo terminal (Kali)"
       y la fuente es reversible (cada etiqueta recuerda la suya).
     • FIX: el Frame principal no tenía nombre, así que la Lista de
       Jugadores nunca encontraba "UtilityPanel.main" y se anclaba
       siempre en su posición de reserva. Ahora se llama "main".
   ---------------------------------------------------------------
   Cambios en v3.7.0 (sobre v3.6.1):
     • NUEVO:  REPORTAR USUARIO. Tercer botón en la fila del link del
       perfil. Abre un panel con 9 SECCIONES (exploits/trampas, audio
       y micrófono, avatar inapropiado, chat de texto, acoso, estafa,
       suplantación, contenido adulto y datos personales) y 3
       plantillas por sección (27 en total). La descripción se genera
       ya rellena con @usuario, Display Name, UserId, experiencia,
       PlaceId, JobId y fecha UTC, y es EDITABLE antes de usarla.
       "Abrir reporte de Roblox" copia el texto y abre
       roblox.com/report-abuse con el usuario preseleccionado usando
       la cadena openURL de siempre (navegador nativo → open_url del
       executor → puerto 9222 → portapapeles).
       LÍMITE HONESTO: Roblox no tiene API para abrir su menú interno
       de reporte ni para enviar reportes desde un script. Esto te
       lleva al formulario con todo listo; el envío lo haces tú.
     • NUEVO:  PANEL DE IDENTIDAD en la pestaña Perfil. Reúne
       UserId, @usuario, Display Name, si coinciden (y por qué
       importa: el Display Name se repite entre cuentas, el @usuario
       no), estado de la cuenta cruzando DOS fuentes, insignia de
       verificado (y avisa si las dos fuentes se contradicen en vez de
       elegir una por ti), antigüedad y nº de nombres previos.
       Dice explícitamente que el historial de DISPLAY NAMES no lo
       publica Roblox, para que no parezca que falló algo.
     • NUEVO: detección de CUENTAS BORRADAS vía user-profile-api
       (apis.roblox.com), el endpoint que usa hoy la web de Roblox.
       Responde sin sesión y en lote. Antes una cuenta borrada no se
       distinguía de una normal. Si el endpoint no responde, se dice
       "no comprobable": un fallo de API no es un veredicto.
     • NUEVO: CACHÉ E HISTORIAL DE BÚSQUEDA. /users/search es el
       endpoint más rate-limited (429 con facilidad), así que las
       sugerencias se cachean 120 s: borrar una letra y volver a
       escribirla ya no gasta petición. Además el buscador vacío
       ofrece los últimos 12 perfiles analizados, recordados entre
       sesiones en el mismo archivo de guardado que el tema.
     • La ventana va POR ENCIMA DE CUALQUIER UI DEL JUEGO
       (ScreenGui.DisplayOrder muy alto + re-imposición event-based si
       aparece otro ScreenGui más alto). La Lista de Jugadores va uno
       por debajo, para que al solaparse mande la ventana principal.
       Lo que esto NO puede hacer: la CoreGui de Roblox (barra
       superior, chat, menú de escape) siempre queda por encima de
       PlayerGui, y mover el panel ahí exige gethui()/CoreGui, donde
       los botones dejan de responder.
     • FIX (peticiones duplicadas): el Panel de Identidad y la tarjeta
       "Historial de nombres" piden el mismo dato y se dibujan a la
       vez, así que lanzaban DOS getNameHistory por perfil contra
       username-history, que es justo el endpoint que más se queja.
       Ahora comparten una sola petición en vuelo (mismo patrón que
       withRAP).

   Cambios en v3.6.1 (sobre v3.6.0) — COMPATIBILIDAD con los cambios
   que Roblox y Rolimon's hicieron en sus APIs. Los 4 se comprobaron
   con peticiones reales el 2026-07-26, no de memoria:

     • FIX GRAVE (búsqueda muerta): Roblox ahora VALIDA el parámetro
       `limit` de /v1/users/search y solo acepta 10, 25, 50 o 100.
       Cualquier otro valor responde 400 "Allowed values: ...". El
       script pedía limit=1 (fallback de getUserIdByName), limit=5
       (sugerencias del buscador) y limit=12 (búsqueda global de la
       Lista de Jugadores): las TRES estaban rotas, o sea que no
       salían sugerencias ni resultados globales en absoluto. Ahora
       se piden valores legales (10 / 25) y se recorta en el cliente.
       De paso, el fallback ya no mira solo data[1]: recorre los
       resultados buscando la coincidencia EXACTA (con 10 resultados
       el primero no tiene por qué ser el que pediste), y "hay
       resultados pero ninguno coincide" ya se reporta como
       not_found en vez de como api_error.
     • FIX (juegos creados siempre vacíos): games.roblox.com/v2 bajó
       su tope de página a 50 ("Allowed values: 10, 25, 50"), y
       countPaged pedía 100 por defecto -> 400 -> el contador salía
       nil -> NX Shields lo marcaba como dato ausente -> el análisis
       bajaba a "parcial" sin que pasara nada malo de verdad.
     • FIX (items sin nombre ni precio): catalog.roblox.com/v1/
       catalog/items/details ahora exige X-CSRF-TOKEN; con apiPost
       devolvía 403 "XSRF token invalid", así que los items del
       avatar salían sin nombre y el precio total era siempre 0.
       Pasa a usar postAuth, que ya hacía el ciclo 403 -> token ->
       reintento (la función ya existía en el archivo, no se usaba
       aquí).
     • FIX (mensaje que mentía): Rolimon's RETIRÓ su endpoint
       /playerapi/player/<id> (404 "This endpoint has moved") y su
       reemplazo está tras Cloudflare y exige una clave que se pide
       en su Discord. El RAP ya no es obtenible desde aquí. Antes la
       tarjeta decía "tu executor la bloquea", lo cual ya es FALSO y
       mandaba a buscar el problema donde no está. Ahora getRAP
       devuelve (nil, motivo) y la tarjeta explica la causa real.
       No se inventa ningún número: la Influencia simplemente se
       queda con su cálculo sin RAP, como ya hacía.

   Cambios en v3.6.0 (sobre v3.5.0):
     • NUEVO:  NX SHIELDS — capa de verificación REAL (nada decorativo).
       Icono de escudo en la cabecera (estilo extensión de Chrome/Brave) con
       punto de estado // derivado del resultado de las comprobaciones,
       y panel desplegable con switches deslizantes estilo móvil.
       Dos protecciones, ambas con efecto medible:
       - API Validation: intercepta apiGet/apiPost y clasifica cada respuesta
         (JSON roto, {errors:[...]} de Roblox, HTTP >=400, cuerpo vacío, tipo
         inesperado). Lo que no es íntegro se BLOQUEA en vez de llegar a la UI.
       - Data Validation: valida cada campo con su regla real (formato de
         username de Roblox, UserId entero positivo, fecha ISO no futura ni
         anterior a 2004, contadores no negativos, avatar usable, entradas de
         grupos/badges bien formadas). Lo corrupto no se muestra como válido.
       Al ENCENDER un switch se ejecuta una verificación de verdad (GET real
       contra users.roblox.com / revalidación del perfil cargado) y el estado
       final depende de su resultado; la animación dura lo que dura el proceso.
       Estados por análisis: loading · verified · partial · incomplete · error.
     • FIX GRAVE (desinformación): las heurísticas puntuaban datos AUSENTES
       como ceros reales (toNum(nil) = 0). Si la API de amigos/badges/grupos
       fallaba, una cuenta normal salía con "Riesgo ALT alto" inventado. Ahora,
       si faltan 2+ pilares (o la edad de cuenta), NX Shields BLOQUEA el
       cálculo y lo dice, en vez de publicar un número falso.
     • FIX GRAVE (perfil fantasma): gatherData solo hacía `if not profile`. Una
       respuesta de error de Roblox ({errors}) ES una tabla, así que pasaba:
       Username nil y created nil → 0 días de antigüedad → riesgo ALT máximo
       sobre un usuario inexistente. Ahora el perfil base se valida y se rechaza.
     • FIX GRAVE (cuelgue permanente): `analyzing` solo volvía a false en las
       rutas felices. Cualquier error dentro del task.spawn mataba la corrutina
       y dejaba la herramienta SIN poder analizar nada en toda la sesión. Ahora
       el flujo va en pcall y `analyzing` se libera siempre. Además se arregló
       su disparador más probable: `s.data[1].name:lower()` reventaba cuando la
       API devolvía una entrada sin 'name'.
     • FIX: rawGet hacía `return nil` ANTES de probar el fallback game:HttpGet,
       así que el fallback estaba muerto. Ahora se usa de verdad.
     • FIX rendimiento: la tarjeta de RAP y el recálculo de Influencia lanzaban
       getRAP() a la vez con la caché aún vacía = DOS peticiones a Rolimon's por
       render (y el render se repite en cada cambio de tema). Ahora comparten
       una sola petición en vuelo.
     • FIX: la caché de perfiles no caducaba nunca, así que "Listo (caché)"
       mostraba la presencia (dato en vivo) congelada indefinidamente. TTL 180 s.
     • Ajustes: los botones Activado/Desactivado son ahora switches NX
       deslizantes (mismo componente que el panel del escudo, sincronizados),
       se añadió la tarjeta  NX Shields y se retiró la tarjeta  Intro de
       inicio (la intro sigue disponible por _G.NXIntro.play()).

   Cambios en v3.5.0 (sobre v3.4.0):
     • NUEVO: NX Broadcast (Avisos remotos). Ahora TÚ (el autor) puedes
       enviar mensajes / warnings a CUALQUIERA que ejecute el script, en
       vivo, editando un JSON público en GitHub (mismo método que NX Tags).
       Cuando haces commit al messages.json, a los pocos segundos le aparece
       un toast premium (glass/neon que respeta el tema y las animaciones)
       a todos los que tengan el script abierto. Tipos info/warn/error/
       success (color por tipo), duración configurable, barra de cuenta
       atrás con pausa al pasar el cursor, y dedupe por id ("once" = se
       muestra una sola vez por persona, recordado entre sesiones). Soporta
       segmentar por UserId ("targets") o enviar a todos. Imágenes opcionales
       (campo "image": rbxassetid); si no hay imagen válida, usa emoji por
       tipo. Pruebas sin tocar GitHub: _G.NXBroadcast.test() / .refresh() /
       .clearSeen(). Repo sugerido: github.com/dreennx/nx-messages
       Falla en silencio: si el JSON no carga, no rompe nada.
     • NX Broadcast · estilo POPUP DE ROBLOX: un mensaje con "style":"roblox"
       (o "type":"roblox") muestra un modal centrado idéntico al "Error al
       unirse" de Roblox (título, divisor, cuerpo, botón "Salir", "(Código de
       error: N)" vía "errorCode"). Cosmético: solo en la pantalla del que
       ejecuta, no banea de verdad. _G.NXBroadcast.testBan().
     • NX Broadcast · BLOQUEO CON TIEMPO administrable: un mensaje con
       "lockMinutes"/"lockSeconds"/"lock" muestra el popup Y cierra la
       herramienta por ese tiempo. Se persiste en NX_lock.json + _G, así que
       re-ejecutar el script NO lo salta (vuelve a salir el popup con el
       tiempo restante). Se aplica UNA vez por id. Liberar antes: mensaje con
       "unlock":true o _G.NXBroadcast.unlock(). Pruebas: .testLock(30) /
       .lock(secs) / .unlock() / .lockStatus().

   Cambios en v3.4.0 (sobre v3.3.0):
     • INTEGRACIÓN NX Head Tags (Fase 1 · coexistencia segura). El módulo
       "NX Head Tag System V2" (BillboardGui de roles sobre las cabezas) se
       pega VERBATIM al final de este archivo, en su propio bloque do...end
       (solo expone el global _G.NXHeadTags). No se modifica su lógica.
       Este Analyzer NO toca sus internos: solo lo enciende/apaga por su
       API pública (_G.NXHeadTags.SetEnabled) desde un toggle en Ajustes.
       - Nuevo: preferencia persistente store.headTags (on/off), recordada
         entre sesiones en el mismo archivo de guardado.
       - Nuevo: tarjeta " NX Head Tags" en la pestaña Ajustes con un
         botón Activado/Desactivado que respeta el tema en vivo.
       - Al cargar, si dejaste los tags apagados, se paran sin tocar su
         código. Si el módulo no está presente, el Analyzer corre igual.
       (Fase 2 futura: capa NX Core + TagSource + chip de tag leído vía
        GetTag dentro de la tarjeta de perfil. Aquí NO se incluye.)

   Cambios en v3.2.5 (sobre v3.2.4):
     • NUEVO: NX Tags. Sistema de etiquetas personalizadas que lee un JSON
       público (UserId -> { tag, color, icon }) desde GitHub. Si el UserId
       analizado está en el JSON, muestra una insignia de color con icono +
       texto debajo del avatar en la pestaña Perfil; si no está, no muestra
       nada. El JSON se descarga UNA vez al iniciar y se cachea (lookup
       instantáneo). Soporta colores por nombre (cyan, red, gold...) o hex
       "#RRGGBB". Falla en silencio si el JSON no carga: no rompe nada.
       Repo: github.com/dreennx/nx-tags

   Cambios en v3.2.4 (sobre v3.2.3):
     • Verificación completa de la solicitud de actualización. Ya estaban
       implementados y se confirmaron: (1) visor 3D ELIMINADO (el visor de
       avatar es 2D puro, sin ViewportFrame/cámara/modelo); (2) solicitud
       de amistad con token CSRF, verificación previa de estado, botón de
       un solo uso y estados de color (disponible/enviando/enviada/error);
       (3) modelo de Riesgo ALT ponderado (Antigüedad 25, Actividad 25,
       Red social 20, Perfil 15, Verificación 10, Historial 5) con bandas
       0-20/21-40/41-60/61-80/81-100; (4) barras de análisis animadas con %.
     • MEJORA de transparencia del análisis: la tarjeta de Riesgo ALT ahora
       añade una explicación contextual según el nivel, lista los factores
       con ✓, y muestra el DESGLOSE ponderado (riesgo por área con su peso).
     • Datos verificados (endpoints oficiales): Username, Display Name,
       Amigos, Seguidores, Siguiendo, Edad de cuenta, Avatar, Descripción,
       IDs, grupos, badges, favoritos y juegos creados.

   Cambios en v3.2.3 (sobre v3.2.2):
     • FIX nombres de la lista de amigos: la API de amigos a veces no
       devuelve name/displayName (datos parciales sin sesión) y salían
       vacíos. Ahora se resuelven en lote con el endpoint de usuarios
       (IDs -> nombres). Antes salía solo "@".
     • La lista de amigos YA NO es una pestaña aparte. Ahora la fila
       "Amigos" de Estadísticas es un BOTÓN desplegable: se abre hacia
       abajo con animación suave (y se cierra al volver a pulsar).
     • Al pulsar "Analizar →" en un amigo se abre una TARJETA modal
       vertical con animación (escala + fade): avatar de cuerpo entero,
       Display Name, @usuario con botón de copiar, descripción, nº de
       amigos y edad de cuenta, + botón "Análisis completo".
     • Buscador: el placeholder vuelve a ser solo "Usuario o ID" (antes
       traía una URL larga que se salía del cuadro). Textos con recorte
       para que nada se desborde de la UI.

   Cambios en v3.2.2 (sobre v3.2.1):
     • NUEVA pestaña "Amigos" — Explorador de redes. Lista navegable de
       Amigos / Seguidores / Siguiendo del perfil analizado. Cada usuario
       es una tarjeta clickeable (avatar + nombre + "Analizar →") que
       SALTA a analizar a esa persona, así puedes ir de cuenta en cuenta.
       Seguidores/Siguiendo se cargan de 100 en 100 con botón "Cargar más"
       (la API los pagina); los Amigos vienen todos de una. Carga perezosa:
       solo pide datos al abrir la pestaña, y se resetea al cambiar de
       perfil. Avatares vía rbxthumb (sin peticiones HTTP, cargan solos).

   Cambios en v3.2.1 (sobre v3.2.0):
     • Controles estilo macOS / Tor: los tres "circulitos" (rojo,
       amarillo, verde) arriba a la izquierda de la cabecera, en lugar
       de los botones X y "—". Rojo = cerrar, amarillo = ocultar
       (sigue funcionando con [RightShift]), verde = maximizar/restaurar
       (~90% de pantalla). El símbolo de cada uno aparece al pasar el
       cursor por encima, como en el navegador en Mac.

   Cambios en v3.2.0 (sobre v3.1.1):
     • NUEVO TEMA "tor": estilo Tor Browser, fondo oscuro con tinte
       morado y acento violeta (el morado de Tor). Se elige en la
       pestaña Ajustes como los demás y se aplica al instante.
     • UI estilo navegador: el buscador ahora parece una barra de
       direcciones (forma de píldora, candado  a la izquierda y texto
       tipo URL), y la cabecera tiene botón minimizar "—" además del de
       cerrar, como los controles de ventana de un navegador.
     • MODO DISCRETO: tecla rápida [RightShift] que oculta/muestra TODA
       la interfaz al instante sin cerrarla ni perder el análisis. El
       botón "—" también oculta (se recupera con la tecla). Además el
       ScreenGui usa un nombre neutro ("UtilityPanel") para no delatar
       qué hace el script en el árbol de instancias.

   Cambios en v3.1.1 (sobre v3.1.0):
     • "Copiar TXT" ahora SIEMPRE incluye los nombres anteriores.
       Antes solo los añadía si ya habías abierto la pestaña Perfil
       (que es la que llenaba la caché). Ahora, si la caché está vacía,
       el botón pide el historial bajo demanda (getNameHistory) y luego
       copia. Reusa la caché si ya existe, así que no re-pide la API.
       Además, si no hay nombres anteriores escribe "ninguno", y si la
       API falla escribe "no disponible" (antes omitía la línea).
     • "Copiar JSON" igualado: pide el historial bajo demanda, añade el
       campo NombresAnteriores y ya NO vuelca los campos de caché internos
       (los "_itemsCached", "_namesCached", etc.) en el JSON exportado.

   Cambios en v3.1.0 (sobre v3.0.0):
     • REINCORPORADO: Historial de nombres en la pestaña Perfil
       (usa la API username-history; ya estaba la función getNameHistory
       sin usar, ahora se vuelve a renderizar). Con caché por-sección:
       no re-pide la API al cambiar de tema/re-render.
     • FIX color de Estado: el color de la fila "Estado" ahora se
       re-deriva del TIPO de presencia en cada render (presenceColorFor),
       en vez de quedar congelado con el color del tema anterior.
       Antes, al cambiar de tema en vivo, el color del Estado no se
       actualizaba; ahora sí.
     • INFO corregida (suscripción): comentario afinado con datos reales.
       Roblox Plus sustituyó a Premium para NUEVAS suscripciones el
       30/04/2026; el bonus de Robux extra de Premium se quitó el
       30/05/2026; el badge de Premium del perfil se retiró (lo reemplazó
       el badge de Plus). Quienes ya tenían Premium conservan su plan.
       La API no distingue limpiamente Premium de Plus -> se reporta junto.

   Base previa (intacta, de v3.0.0):
     • Suscripción (Premium/Plus), panel redimensionable, descripción
       expandible, copiar ID, estado/actividad, unirse al servidor,
       enviar solicitud de amistad, precio del avatar, visor de personaje
       3D/2D, análisis (confianza, influencia, alt, actividad, amigos en
       común), items/grupos/badges/RAP, tema en vivo.
--]]

-- ====================== SERVICIOS ======================
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ====================== PERSISTENCIA (archivo) ======================
-- Si el executor tiene sistema de archivos, guardamos el tema elegido.
-- (Nombres de archivo inlineados: NO gastar locals de raíz — el chunk roza el
--  límite de 200 registros de Luau por el módulo de head tags del final.)
local hasFS = (type(writefile) == "function")
	and (type(readfile) == "function")
	and (type(isfile) == "function")

-- DEFAULT de primera vez: tema "tor" (morado) + intro retirada.
-- (Nota: en cliente/executor NO existe DataStore — eso es solo servidor;
--  la persistencia correcta es por archivo, que es lo que hacemos aquí.)
local store = { theme = "tor", headTags = true, animations = true, ownTag = true, introEnabled = true, introSeen = false, advanced = false }

-- Guardado ROBUSTO: escribe el archivo principal + una COPIA DE RESPALDO
-- (.bak.json). Si el principal se corrompe, loadStore() recupera del backup.
-- Falla en silencio si el executor no tiene sistema de archivos.
local function saveStore()
	if not hasFS then return end
	pcall(function()
		local json = HttpService:JSONEncode(store)
		writefile("ProfileAnalyzer_data.json", json)
		writefile("ProfileAnalyzer_data.bak.json", json)
	end)
end

local function loadStore()
	if not hasFS then return end
	pcall(function()
		local raw
		if isfile("ProfileAnalyzer_data.json") then raw = readfile("ProfileAnalyzer_data.json") end
		local ok, decoded = pcall(function() return HttpService:JSONDecode(raw) end)
		-- principal vacío/corrupto → intenta el respaldo
		if (not ok or type(decoded) ~= "table") and isfile("ProfileAnalyzer_data.bak.json") then
			ok, decoded = pcall(function() return HttpService:JSONDecode(readfile("ProfileAnalyzer_data.bak.json")) end)
		end
		if ok and type(decoded) == "table" then
			-- Mezcla GENÉRICA: cualquier clave guardada pisa el default. Así las
			-- futuras configuraciones se persisten solas sin tocar este loader.
			for k, v in pairs(decoded) do store[k] = v end
		end
	end)
end
loadStore()


-- ====================== TEMAS ======================
-- 'onAccent' = texto que va ENCIMA del acento (debe contrastar con él).
local THEMES = {
	negro = {
		bg=Color3.fromRGB(12,12,12), card=Color3.fromRGB(22,22,22), input=Color3.fromRGB(22,22,22),
		link=Color3.fromRGB(12,12,12), neutral=Color3.fromRGB(28,28,28), border=Color3.fromRGB(45,45,45),
		accent=Color3.fromRGB(255,255,255), onAccent=Color3.fromRGB(12,12,12),
		good=Color3.fromRGB(120,220,150), warn=Color3.fromRGB(220,170,90), bad=Color3.fromRGB(220,90,90),
		text=Color3.fromRGB(230,230,230), subtext=Color3.fromRGB(120,120,120),
		modalBg=Color3.fromRGB(18,18,18), modalStep=Color3.fromRGB(12,12,12),
	},
	azul = {
		bg=Color3.fromRGB(15,21,38), card=Color3.fromRGB(26,34,58), input=Color3.fromRGB(20,27,48),
		link=Color3.fromRGB(17,23,42), neutral=Color3.fromRGB(38,48,80), border=Color3.fromRGB(50,62,95),
		accent=Color3.fromRGB(0,170,255), onAccent=Color3.fromRGB(255,255,255),
		good=Color3.fromRGB(60,180,100), warn=Color3.fromRGB(255,170,60), bad=Color3.fromRGB(255,100,100),
		text=Color3.fromRGB(255,255,255), subtext=Color3.fromRGB(190,190,200),
		modalBg=Color3.fromRGB(18,24,44), modalStep=Color3.fromRGB(13,18,34),
	},
	verde = {
		bg=Color3.fromRGB(10,18,12), card=Color3.fromRGB(18,30,22), input=Color3.fromRGB(16,26,19),
		link=Color3.fromRGB(10,18,12), neutral=Color3.fromRGB(26,40,30), border=Color3.fromRGB(40,60,46),
		accent=Color3.fromRGB(60,220,130), onAccent=Color3.fromRGB(8,16,10),
		good=Color3.fromRGB(120,220,150), warn=Color3.fromRGB(230,190,90), bad=Color3.fromRGB(230,100,100),
		text=Color3.fromRGB(225,235,228), subtext=Color3.fromRGB(120,140,128),
		modalBg=Color3.fromRGB(14,24,18), modalStep=Color3.fromRGB(10,18,12),
	},
	-- Tema estilo Tor Browser: fondo oscuro con tinte morado y acento violeta
	-- (el morado #7D4698 de Tor, aclarado para que resalte sobre el fondo).
	tor = {
		bg=Color3.fromRGB(20,15,28), card=Color3.fromRGB(31,23,43), input=Color3.fromRGB(26,19,38),
		link=Color3.fromRGB(20,15,28), neutral=Color3.fromRGB(42,31,58), border=Color3.fromRGB(60,45,82),
		accent=Color3.fromRGB(160,100,210), onAccent=Color3.fromRGB(255,255,255),
		good=Color3.fromRGB(120,220,150), warn=Color3.fromRGB(230,180,90), bad=Color3.fromRGB(225,95,95),
		text=Color3.fromRGB(235,230,242), subtext=Color3.fromRGB(150,135,168),
		modalBg=Color3.fromRGB(26,20,38), modalStep=Color3.fromRGB(18,14,26),
	},
	-- Carmesí: negro con tinte rojo y acento rojo intenso.
	rojo = {
		bg=Color3.fromRGB(20,11,13), card=Color3.fromRGB(34,18,21), input=Color3.fromRGB(28,15,18),
		link=Color3.fromRGB(20,11,13), neutral=Color3.fromRGB(46,24,28), border=Color3.fromRGB(70,36,42),
		accent=Color3.fromRGB(240,72,82), onAccent=Color3.fromRGB(255,255,255),
		good=Color3.fromRGB(120,220,150), warn=Color3.fromRGB(230,180,90), bad=Color3.fromRGB(255,90,90),
		text=Color3.fromRGB(240,228,230), subtext=Color3.fromRGB(165,135,140),
		modalBg=Color3.fromRGB(28,16,19), modalStep=Color3.fromRGB(18,10,12),
	},
	-- Amatista: violeta brillante sobre fondo morado oscuro.
	morado = {
		bg=Color3.fromRGB(16,12,26), card=Color3.fromRGB(26,20,44), input=Color3.fromRGB(22,16,38),
		link=Color3.fromRGB(16,12,26), neutral=Color3.fromRGB(38,28,62), border=Color3.fromRGB(58,44,92),
		accent=Color3.fromRGB(170,110,255), onAccent=Color3.fromRGB(255,255,255),
		good=Color3.fromRGB(120,220,150), warn=Color3.fromRGB(230,180,90), bad=Color3.fromRGB(235,95,95),
		text=Color3.fromRGB(232,226,245), subtext=Color3.fromRGB(150,138,175),
		modalBg=Color3.fromRGB(22,16,40), modalStep=Color3.fromRGB(14,10,24),
	},
	-- Aqua: cian/teal eléctrico sobre negro verdoso.
	cyan = {
		bg=Color3.fromRGB(8,18,20), card=Color3.fromRGB(14,30,33), input=Color3.fromRGB(12,26,29),
		link=Color3.fromRGB(8,18,20), neutral=Color3.fromRGB(22,42,46), border=Color3.fromRGB(34,62,68),
		accent=Color3.fromRGB(0,220,210), onAccent=Color3.fromRGB(6,18,18),
		good=Color3.fromRGB(120,220,150), warn=Color3.fromRGB(230,180,90), bad=Color3.fromRGB(235,95,95),
		text=Color3.fromRGB(224,238,238), subtext=Color3.fromRGB(120,150,150),
		modalBg=Color3.fromRGB(12,26,28), modalStep=Color3.fromRGB(8,18,20),
	},
	-- Rosa: rosa neón sobre fondo oscuro.
	rosa = {
		bg=Color3.fromRGB(22,12,18), card=Color3.fromRGB(36,20,30), input=Color3.fromRGB(30,16,25),
		link=Color3.fromRGB(22,12,18), neutral=Color3.fromRGB(48,26,40), border=Color3.fromRGB(72,40,60),
		accent=Color3.fromRGB(255,110,190), onAccent=Color3.fromRGB(28,10,20),
		good=Color3.fromRGB(120,220,150), warn=Color3.fromRGB(230,180,90), bad=Color3.fromRGB(235,95,95),
		text=Color3.fromRGB(245,228,238), subtext=Color3.fromRGB(170,135,155),
		modalBg=Color3.fromRGB(30,16,26), modalStep=Color3.fromRGB(20,10,16),
	},
	-- Ámbar: naranja cálido sobre fondo marrón oscuro.
	naranja = {
		bg=Color3.fromRGB(22,15,8), card=Color3.fromRGB(36,25,14), input=Color3.fromRGB(30,20,11),
		link=Color3.fromRGB(22,15,8), neutral=Color3.fromRGB(48,33,18), border=Color3.fromRGB(72,50,28),
		accent=Color3.fromRGB(255,150,50), onAccent=Color3.fromRGB(28,16,6),
		good=Color3.fromRGB(120,220,150), warn=Color3.fromRGB(230,180,90), bad=Color3.fromRGB(235,95,95),
		text=Color3.fromRGB(244,234,222), subtext=Color3.fromRGB(168,148,124),
		modalBg=Color3.fromRGB(30,21,11), modalStep=Color3.fromRGB(20,14,8),
	},
	-- Claro: modo claro limpio (acento azul). Contraste alto para texto.
	claro = {
		bg=Color3.fromRGB(238,240,244), card=Color3.fromRGB(255,255,255), input=Color3.fromRGB(248,249,251),
		link=Color3.fromRGB(238,240,244), neutral=Color3.fromRGB(228,231,237), border=Color3.fromRGB(205,210,220),
		accent=Color3.fromRGB(35,110,240), onAccent=Color3.fromRGB(255,255,255),
		good=Color3.fromRGB(40,160,90), warn=Color3.fromRGB(205,135,30), bad=Color3.fromRGB(220,70,70),
		text=Color3.fromRGB(22,26,34), subtext=Color3.fromRGB(95,105,120),
		modalBg=Color3.fromRGB(255,255,255), modalStep=Color3.fromRGB(238,240,244),
	},
}

-- C arranca con el tema guardado. El tema se aplica EN VIVO.
local C = {}
local function applyTheme(name)
	local t = THEMES[name] or THEMES.negro
	for k, v in pairs(t) do C[k] = v end
end
-- El tema "kali" se retiró junto con el estilo terminal. Las instalaciones que
-- lo tuvieran guardado caen a "tor" para no arrancar sin un tema válido.
if store.theme == "kali" then store.theme = "tor" end
applyTheme(store.theme)

-- ====================== SISTEMA DE TEMA EN VIVO ======================
-- Cada elemento se registra con su "rol" de color. Al cambiar de tema,
-- repaint() recorre el registro y actualiza todo al instante (sin reabrir).
local roleMap = {}
local function themed(inst, prop, role)
	local entry = { inst = inst, prop = prop, role = role }
	table.insert(roleMap, entry)
	-- Cuando la instancia se destruye, su slot queda en nil.
	-- repaint() ya ignora entries con inst == nil (via pcall), así no hay leak.
	pcall(function()
		inst.Destroying:Connect(function() entry.inst = nil end)
	end)
	pcall(function() inst[prop] = C[role] end)
	return inst
end

local repaintExtra = {}  -- funciones extra a llamar en cada repaint (casos especiales)
local function onRepaint(fn) table.insert(repaintExtra, fn) end

local function repaint()
	-- Compacta el registro EN SITIO: descarta los entries cuya instancia ya se
	-- destruyó (inst == nil, lo pone el Destroying de themed()). Antes se
	-- quedaban para siempre y repaint() recorría miles de entries muertos en
	-- sesiones largas (cada cambio de perfil recrea toda la UI).
	local n = 0
	for i = 1, #roleMap do
		local e = roleMap[i]
		if e.inst then
			n = n + 1
			roleMap[n] = e
			pcall(function() e.inst[e.prop] = C[e.role] end)
		end
	end
	for i = #roleMap, n + 1, -1 do roleMap[i] = nil end
	for _, fn in ipairs(repaintExtra) do pcall(fn) end
end

local rerenderCurrent  -- forward: re-pinta las pestañas de contenido con el tema nuevo
local function setTheme(name)
	applyTheme(name)
	store.theme = name
	saveStore()
	repaint()
	if rerenderCurrent then pcall(rerenderCurrent) end
end

-- ====================== PUENTE DE TEMA (lo consume la Lista de Jugadores) ======================
-- Expone la tabla de colores VIVA (C se muta en sitio, así que esta referencia
-- siempre tiene el tema actual) + un registrador de repaint. La lista de
-- jugadores se cuelga de aquí para sincronizar sus colores en vivo: cuando
-- cambias el tema en Ajustes, repaint() llama también a sus callbacks.
_G.NXTheme = {
	C = C,                         -- tabla viva de colores (no reasignar, se muta)
	onRepaint = onRepaint,         -- onRepaint(fn) → fn se llama en cada cambio de tema
	themed = themed,               -- themed(inst, prop, role) por si quiere usarlo
	getTheme = function() return store.theme end,
}

-- ====================== DETECCIÓN DE EXECUTOR ======================
local function detectExecutor()
	if identifyexecutor then
		local ok, name = pcall(identifyexecutor)
		if ok and type(name) == "string" and name ~= "" then return name end
	end
	if getexecutorname then
		local ok, name = pcall(getexecutorname)
		if ok and type(name) == "string" and name ~= "" then return name end
	end
	if rawget(_G, "xeno") then return "Xeno" end
	if rawget(_G, "Synapse") or rawget(_G, "syn") then return "Synapse X" end
	if rawget(_G, "KRNL_LOADED") or rawget(_G, "krnl") then return "KRNL" end
	if rawget(_G, "fluxus") then return "Fluxus" end
	if rawget(_G, "hydrogen") then return "Hydrogen" end
	if rawget(_G, "wave") then return "Wave" end
	if rawget(_G, "velocity") then return "Velocity" end
	if rawget(_G, "Solara") then return "Solara" end
	if rawget(_G, "PROTOSMASHER_LOADED") then return "ProtoSmasher" end
	if rawget(_G, "Sirhurt") then return "SirHurt" end
	if rawget(_G, "SCRIPTWARE_LOADED") then return "Script-Ware" end
	if rawget(_G, "request") or rawget(_G, "http_request") then return "executor desconocido" end
	return "tu executor"
end

local EXECUTOR_NAME = detectExecutor()

-- ====================== LIMPIAR INSTANCIAS ANTERIORES ======================
-- Nombre neutro para el ScreenGui: no delata qué hace el script si alguien
-- mira el árbol de instancias. Constante (no aleatorio) para poder limpiar
-- la instancia anterior al recargar.
-- "UtilityPanel" inlineado (no gastar local de raíz por el límite de 200).
for _, child in ipairs(playerGui:GetChildren()) do
	if child:IsA("ScreenGui") and child.Name == "UtilityPanel" then
		child:Destroy()
	end
end

--  INSTANCIA ÚNICA · anti-lag por ACUMULACIÓN al re-ejecutar 
-- Al volver a ejecutar el script SIN salir del juego, los bucles de la sesión
-- anterior seguían VIVOS y se SUMABAN a los nuevos. El más caro, con diferencia:
-- el RenderStepped de NX Head Tags, que recorre CADA jugador y anima un
-- BillboardGui por cabeza. Dos o tres re-ejecuciones = dos o tres loops +
-- billboards duplicados sobre todas las cabezas → caída de FPS grave y creciente.
-- (El HUD y el panel se autolimpian al destruir "UtilityPanel" de arriba; Head
--  Tags NO, porque su renderConn es un upvalue del chunk viejo que nadie
--  desconectaba.) Aquí matamos la sesión previa de tags antes de montar la nueva.
pcall(function()
	if _G.NXHeadTags and _G.NXHeadTags.Stop then _G.NXHeadTags.Stop() end
end)
-- Cinturón y tirantes: barrer billboards huérfanos (si un Stop previo no llegó a
-- limpiarlos, p. ej. una ejecución que falló a medias) y una Lista anterior. El
-- do...end libera sus registros al cerrar (no gasta locals de raíz).
do
	local o = playerGui:FindFirstChild("NXHeadTags")
	if o then o:Destroy() end
	o = playerGui:FindFirstChild("ListaJugadoresModerna")
	if o then o:Destroy() end
end

-- ====================== HTTP ROBUSTO ======================
local httpRequest = (syn and syn.request) or http_request or request or (http and http.request)
local clipboard = setclipboard or (syn and syn.write_clipboard) or toclipboard or function() end

-- FIX: antes, si httpRequest fallaba se hacía `return nil` ANTES de probar el
-- fallback game:HttpGet, así que el fallback estaba muerto. Ahora se intenta
-- siempre que el primer método no traiga cuerpo. Un cuerpo VACÍO cuenta como
-- fallo (no como "respuesta válida sin datos").
local function rawGet(url)
	local body, statusCode
	if httpRequest then
		local ok, res = pcall(httpRequest, { Url = url, Method = "GET" })
		if ok and res then
			body = res.Body
			statusCode = res.StatusCode
		end
	end
	if body == nil or body == "" then
		local ok, res = pcall(function() return game:HttpGet(url) end)
		-- HttpGet lanza error si el status no es 2xx: si llegó aquí con cuerpo,
		-- la petición fue correcta (el status previo, si lo había, ya no aplica).
		if ok and type(res) == "string" and res ~= "" then body, statusCode = res, 200 end
	end
	if body == nil or body == "" then return nil, statusCode or "connection_failure" end
	return body, statusCode
end

local function apiGet(url)
	local body, status = rawGet(url)
	if not body then return nil, status end
	local ok, decoded = pcall(function() return HttpService:JSONDecode(body) end)
	return ok and decoded or nil, status
end

local function apiPost(url, payload)
	if not httpRequest then return nil, "no_http_request" end
	local ok, res = pcall(httpRequest, {
		Url = url,
		Method = "POST",
		Headers = { ["Content-Type"] = "application/json" },
		Body = HttpService:JSONEncode(payload),
	})
	if ok and res and res.Body then
		local ok2, decoded = pcall(function() return HttpService:JSONDecode(res.Body) end)
		return ok2 and decoded or nil, res.StatusCode
	end
	return nil, (ok and res and res.StatusCode) or "connection_failure"
end

-- POST autenticado con token CSRF (X-CSRF-TOKEN). Los endpoints que MODIFICAN
-- algo (p. ej. enviar solicitud de amistad) lo exigen: el primer POST devuelve
-- 403 con el token en la cabecera, y se reintenta con él. Devuelve:
--   body (tabla o nil), statusCode (número o string), errorsList (tabla)
local cachedCsrf = nil
local function postAuth(url, payload)
	if not httpRequest then return nil, "no_http_request", nil end
	local function doReq(token)
		local headers = { ["Content-Type"] = "application/json" }
		if token then headers["X-CSRF-TOKEN"] = token end
		local ok, res = pcall(httpRequest, {
			Url = url, Method = "POST", Headers = headers,
			Body = HttpService:JSONEncode(payload or {}),
		})
		if not ok or not res then return nil end
		return res
	end
	local res = doReq(cachedCsrf)
	-- 403 => token inválido/ausente: lo tomamos de la cabecera y reintentamos
	if res and tonumber(res.StatusCode) == 403 then
		local h = res.Headers or {}
		local token = h["x-csrf-token"] or h["X-CSRF-TOKEN"] or h["X-Csrf-Token"]
		if token then
			cachedCsrf = token
			res = doReq(token)
		end
	end
	if not res then return nil, "connection_failure", nil end
	local body
	if res.Body and res.Body ~= "" then
		local ok2, dec = pcall(function() return HttpService:JSONDecode(res.Body) end)
		body = ok2 and dec or nil
	end
	local errs = (type(body) == "table" and body.errors) or nil
	return body, res.StatusCode, errs
end

-- ====================== NX TAGS (etiquetas personalizadas) ======================
-- Lee un JSON público (UserId -> { tag, color, icon }) desde GitHub y lo cachea.
-- Se descarga UNA sola vez al cargar el script; el lookup luego es instantáneo.
-- Si el JSON no carga o el usuario no está, simplemente no se muestra tag.
-- Estructura esperada:  { "8396392068": { "tag": "NX OWNER", "color": "cyan", "icon": "" } }
-- (URL inlineada abajo en loadNXTags: no gastar un local de raíz.)
-- ORIGEN ÚNICO del repositorio de tags. Antes había DOS URLs distintas para
-- el MISMO tags.json ("/refs/heads/main/" aquí y "/main/" en los head tags),
-- así que cambiar de rama o de repo arreglaba la mitad del script y dejaba la
-- otra mitad apuntando al sitio viejo, sin ningún aviso.
_G.NXTagRepo = {
	base = "https://raw.githubusercontent.com/dreennx/nx-tags/refs/heads/main/",
}
_G.NXTagRepo.tags = _G.NXTagRepo.base .. "tags.json"

-- Descarga + parseo de JSON en UN solo sitio. Antes esto estaba reescrito
-- cuatro veces (aquí suelto, en NX Core, en NX V2 y en los head tags), cada
-- copia con su propio criterio sobre qué es un fallo. Devuelve:
--   tabla, códigoHTTP   si el cuerpo llegó y era un objeto JSON
--   nil,   códigoHTTP   en cualquier otro caso (sin cuerpo, JSON roto, no-tabla)
-- Nunca lanza: el que llama decide qué hacer con el nil.
_G.NXJson = function(url)
	local body, status = rawGet(url)
	if not body then return nil, tonumber(status) or status end
	local ok, t = pcall(function() return HttpService:JSONDecode(body) end)
	if not ok or type(t) ~= "table" then return nil, tonumber(status) or status end
	return t, tonumber(status) or status
end

local nxTags = nil           -- nil = aún no cargado; tabla = listo (puede estar vacía)
local nxLoading = false
local nxTagsListos = {}      -- callbacks a los que avisar cuando termine la carga

local function loadNXTags()
	if nxTags ~= nil or nxLoading then return end
	nxLoading = true
	task.spawn(function()
		nxTags = _G.NXJson(_G.NXTagRepo.tags) or {}   -- nunca nil: evita reintentos infinitos
		nxLoading = false
		-- Aviso a quien esté esperando (el chip del perfil), en vez de obligarle
		-- a sondear con task.wait.
		local pendientes = nxTagsListos
		nxTagsListos = {}
		for _, fn in ipairs(pendientes) do task.spawn(fn) end
	end)
end

-- ── KIT DE TAGS · una sola implementación ──────────────────────────────────
-- Antes esto vivía por triplicado: aquí, dentro de NX V2 y otra vez dentro de
-- los head tags, y con DOS paletas distintas. Consecuencia real: el mismo tag
-- podía salir de un color en el chip del perfil y de otro sobre la cabeza.
-- Ahora hay un solo sitio donde se decide color, imagen y corona.
_G.NXTagKit = {
	-- Asset de la corona que se descarta venga por donde venga (imagen o emoji).
	CORONA_ASSET = "98710143344488",
	-- Unión de las dos paletas que existían. Donde discrepaban (red, blue, cyan,
	-- gold, yellow, purple, black, white) mandan estos valores, que son los que
	-- ya estaban ajustados para contrastar sobre las tarjetas del panel.
	COLORES = {
		cyan = Color3.fromRGB(0, 229, 255),  red = Color3.fromRGB(255, 76, 76),
		green = Color3.fromRGB(80, 220, 120), blue = Color3.fromRGB(80, 150, 255),
		yellow = Color3.fromRGB(255, 214, 64), orange = Color3.fromRGB(255, 150, 40),
		purple = Color3.fromRGB(180, 110, 255), pink = Color3.fromRGB(255, 110, 200),
		white = Color3.fromRGB(245, 245, 245), gold = Color3.fromRGB(255, 196, 64),
		gray = Color3.fromRGB(170, 170, 170), grey = Color3.fromRGB(170, 170, 170),
		black = Color3.fromRGB(30, 30, 30),
		magenta = Color3.fromRGB(255, 0, 200), teal = Color3.fromRGB(0, 200, 180),
		silver = Color3.fromRGB(200, 200, 210), lime = Color3.fromRGB(160, 255, 80),
	},
}

-- Campo de color del JSON -> Color3. Acepta un Color3 ya hecho, una tabla
-- {r,g,b} (0-1 o 0-255), un nombre conocido o un hex "#RRGGBB".
-- 'porDefecto' deja que cada capa tenga su propio fallback sin duplicar nada.
function _G.NXTagKit.color(value, porDefecto)
	porDefecto = porDefecto or _G.NXTagKit.COLORES.cyan
	if typeof(value) == "Color3" then return value end
	if type(value) == "table" then
		local r = value[1] or value.r or value.R
		local g = value[2] or value.g or value.G
		local b = value[3] or value.b or value.B
		if r and g and b then
			if r <= 1 and g <= 1 and b <= 1 then return Color3.new(r, g, b) end
			return Color3.fromRGB(r, g, b)
		end
		return porDefecto
	end
	if type(value) == "string" then
		local s = value:lower():gsub("%s", "")
		local c = _G.NXTagKit.COLORES[s]
		if c then return c end
		local hex = s:match("^#?(%x%x%x%x%x%x)$")
		if hex then
			return Color3.fromRGB(tonumber(hex:sub(1, 2), 16),
				tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16))
		end
	end
	return porDefecto
end

-- Campo de imagen -> "rbxassetid://N" usable, o nil si no hay imagen válida.
function _G.NXTagKit.imagen(v)
	if v == nil then return nil end
	if type(v) == "number" then v = "rbxassetid://" .. v end
	v = tostring(v)
	if v == "" or v == "rbxassetid://0" then return nil end
	local d = v:match("^(%d+)$")
	if d then v = "rbxassetid://" .. d end
	if not (v:match("^rbxassetid://%d+$") or v:match("^rbxthumb") or v:match("^http")) then
		return nil
	end
	if v:find(_G.NXTagKit.CORONA_ASSET, 1, true) then return nil end   -- corona fuera
	return v
end

-- Quita la corona de un icono de texto venga del JSON que venga.
function _G.NXTagKit.icono(v)
	return (tostring(v or ""):gsub("\u{1F451}", ""))
end

-- Suscripción a "el JSON legacy ya cargó". Si ya está cargado se llama en el
-- siguiente frame, para que quien la use no tenga dos caminos distintos.
-- (Va aquí y no junto a loadNXTags porque allí _G.NXTagKit todavía no existe.)
function _G.NXTagKit.alCargarLegacy(fn)
	if nxTags ~= nil then task.defer(fn) else table.insert(nxTagsListos, fn) end
end

local function nxColor(name)
	return _G.NXTagKit.color(name)
end

-- Devuelve { tag, icon, color(Color3) } para un userId, o nil si no tiene tag.
local function getNXTag(userId)
	if type(nxTags) ~= "table" then return nil end
	local entry = nxTags[tostring(userId)]
	if type(entry) ~= "table" then return nil end
	local tagText = entry.tag or entry.text or ""
	if tagText == "" and (entry.icon == nil or entry.icon == "") then return nil end
	local _icon = _G.NXTagKit.icono(entry.icon)
	return { tag = tagText, icon = _icon, color = nxColor(entry.color) }
end

loadNXTags()      -- precarga al iniciar (no bloquea: corre en segundo plano)

-- ===================== NX V2 · capa de datos /v2/ (ADITIVA, reversible) =====================
-- Autocontenido en do...end: NO añade locals permanentes al chunk principal
-- (evita el límite de 200 locals de Luau). Expone _G.NXV2 / _G.NXAsset /
-- _G.NXResolve y reasigna el local getNXTag a un dispatcher (v2 -> legacy).
-- Reversible: _G.NXV2.setEnabled(false) vuelve a legacy; borrar el bloque revierte.
do
	-- Si una instancia anterior del script sigue viva (re-ejecución), corta su
	-- bucle de refresco: usaba `while true` y no moría nunca, así que cada
	-- re-ejecución dejaba un loop HTTP inmortal más acumulándose.
	if _G.NXV2 and _G.NXV2.stop then pcall(_G.NXV2.stop) end
	local NX_V2 = { enabled = true, images = false }   -- images OFF: assets aún no válidos
	local alive = true
	local BASE  = _G.NXTagRepo.base .. "v2/"
	local TTL, RETRY = 300, 15

	-- NXData: fetch + cache + dedup + retry + refresh
	-- 'cache' y no 'store': el chunk raíz ya tiene un 'store' que es el archivo
	-- de preferencias, y dos cosas distintas con el mismo nombre invitan a un
	-- accidente en cuanto alguien edite este bloque.
	local cache, at, inflight = {}, {}, {}
	local avisarSiListo   -- declarada antes de fetch(), que la usa
	local function fetch(f, force)
		if inflight[f] then return end
		if not force and cache[f] and (os.clock() - (at[f] or 0)) < TTL then return end
		inflight[f] = true
		task.spawn(function()
			local t = _G.NXJson(BASE .. f)
			if t then cache[f], at[f] = t, os.clock() end
			inflight[f] = nil
			avisarSiListo()
		end)
	end
	local function dget(f) return cache[f] end

	-- Aviso de "ya están los dos JSON". Sustituye a los sondeos con task.wait
	-- que había repartidos (el chip del perfil daba hasta 60 vueltas de 0.1 s).
	local listos = {}
	function avisarSiListo()
		if not (cache["roles.json"] and cache["tags.json"]) then return end
		local pendientes = listos
		listos = {}
		for _, fn in ipairs(pendientes) do task.spawn(fn) end
	end
	local function alCargar(fn)
		if cache["roles.json"] and cache["tags.json"] then task.defer(fn)
		else table.insert(listos, fn) end
	end
	task.spawn(function()
		while alive do
			if NX_V2.enabled then
				for _, f in ipairs({ "roles.json", "tags.json" }) do
					if not cache[f] then fetch(f)
					elseif (os.clock() - (at[f] or 0)) >= TTL then fetch(f, true) end
				end
			end
			task.wait(RETRY)
		end
	end)
	fetch("roles.json"); fetch("tags.json")

	-- ImageResolver: normaliza + valida (PreloadAsync) + cachea
	local CP, icache = game:GetService("ContentProvider"), {}
	local imgNormalize = _G.NXTagKit.imagen
	local function imgPreload(v)
		local id = imgNormalize(v); if not id or icache[id] then return end
		icache[id] = "pending"
		task.spawn(function()
			local i = Instance.new("ImageLabel"); i.Image = id
			icache[id] = pcall(function() CP:PreloadAsync({ i }) end) and "ok" or "bad"
			i:Destroy()
		end)
	end
	local function imgUsable(v) local id = imgNormalize(v); return id ~= nil and icache[id] ~= "bad" end

	-- Catálogo de assets (fallback hardcodeado si v2 no cargó)
	local ASSET_FALLBACK = {
		graphic_ui = "rbxassetid://96973325922644", settings = "rbxassetid://131435728006094",
		youtube = "rbxassetid://3117561276", discord = "rbxassetid://74340827915824",
		copy_link = "rbxassetid://15416627598",
	}
	local function nxAsset(key)
		local r = dget("roles.json")
		return (r and r._assets and r._assets[key]) or ASSET_FALLBACK[key]
	end

	-- TagRegistry: rol por nombre (con aliases)
	local function normRole(s) s = tostring(s or ""):gsub("%s+", " "); return string.upper(s:match("^%s*(.-)%s*$") or s) end
	local function roleDef(tagName)
		local r = dget("roles.json"); if not r then return nil end
		local k = normRole(tagName)
		if r._aliases and r._aliases[k] then k = normRole(r._aliases[k]) end
		return r[k]
	end

	-- TagResolver: userId -> entry visual (color = Color3 vía nxColor)
	local function resolveV2(userId)
		if not NX_V2.enabled then return nil end
		local tags = dget("tags.json"); if not tags then return nil end
		local raw = tags[tostring(userId)]; if type(raw) ~= "table" then return nil end
		local role = roleDef(raw.tag) or {}
		local img = nil
		if NX_V2.images then                                 -- imágenes gateadas en Fase 1
			img = imgNormalize(raw.iconImage) or imgNormalize(nxAsset(raw.iconAsset))
			   or imgNormalize(role.iconImage) or imgNormalize(nxAsset(role.iconAsset))
			if img then imgPreload(img) end
		end
		local tagText = raw.tag or ""
		local icon = _G.NXTagKit.icono(raw.icon or role.icon)
		if tagText == "" and icon == "" and not img then return nil end
		return {
			tag = tagText, discordRole = raw.discordRole or role.discordRole,
			icon = icon, iconImage = img,
			color = nxColor(raw.color or role.color),
			animation = string.lower(tostring(raw.animation or role.animation or "gradient")),
			priority = tonumber(raw.priority) or tonumber(role.priority) or 0,
		}
	end

	-- API global (chip, head tag y capa UI). No añade locals al chunk principal.
	_G.NXV2 = {
		enabled = true, images = false,
		resolve = resolveV2, role = roleDef, asset = nxAsset,
		image = { normalize = imgNormalize, preload = imgPreload, usable = imgUsable },
		data = { get = dget, ensure = fetch },
		pending = function() return not (dget("roles.json") and dget("tags.json")) end,
		onReady = alCargar,   -- onReady(fn): fn se llama cuando estén los dos JSON

		setEnabled = function(on) NX_V2.enabled = on and true or false; _G.NXV2.enabled = NX_V2.enabled end,
		setImages = function(on) NX_V2.images = on and true or false; _G.NXV2.images = NX_V2.images end,
		stop = function() alive = false end,   -- corta el bucle de refresco (cleanup / re-ejecución)
	}
	_G.NXAsset = nxAsset
	_G.NXResolve = resolveV2

	-- Dispatcher: v2 primero, legacy de fallback. NO toca el cuerpo de getNXTag.
	local getNXTag_legacy = getNXTag
	getNXTag = function(userId)
		if NX_V2.enabled then local v = resolveV2(userId); if v then return v end end
		return getNXTag_legacy(userId)
	end

	-- Cuando v2 termine de cargar por primera vez, refresca los head tags para
	-- que apliquen v2 sin esperar al refresh de 5 min.
	alCargar(function()
		if _G.NXHeadTags and _G.NXHeadTags.Refresh then
			pcall(_G.NXHeadTags.Refresh)
		end
	end)
end
-- ===========================================================================================

-- ====================== NX CORE  v1.0.0 ======================
-- Sistema centralizado de administración remota (GitHub, solo lectura).
-- Descarga licenses.json / warnings.json / permissions.json en paralelo.
-- Fail-safe: si un archivo no carga, el sistema continúa (fail-open).
-- API pública (todo asíncrono via onReady):
--   isLicensed / getWarning / getPermissions / isAdmin / can /
--   countOf / countTags / logEvent (stub) / getData / getVersion.
-- logEvent() es un no-op hasta que se conecte un backend en v3.5+.
-- ================================================================
local NXCore = (function()
	local NX_BASE    = _G.NXTagRepo.base
	local NX_VERSION = "3.4.0"

	local state = {
		licenses    = {},
		warnings    = {},
		permissions = {},
		ready       = false,
		loadedAt    = 0,
		failed      = {},   -- { licenses=true, warnings=true, permissions=true }
	}

	local readyCbs = {}

	-- Descarga y parsea un JSON usando rawGet() (ya definida en el script).
	local function fetchJSON(filename)
		return _G.NXJson(NX_BASE .. filename)
	end

	local function fireReady()
		state.ready    = true
		state.loadedAt = os.time()
		for _, fn in ipairs(readyCbs) do pcall(fn) end
		readyCbs = {}
	end

	-- Descarga los 3 archivos en paralelo; fireReady cuando terminan los 3.
	do
		local pending = 3
		local function dec()
			pending = pending - 1
			if pending <= 0 then fireReady() end
		end
		task.spawn(function()
			local d = fetchJSON("licenses.json")
			if d then state.licenses = d else state.failed.licenses = true end
			dec()
		end)
		task.spawn(function()
			local d = fetchJSON("warnings.json")
			if d then state.warnings = d else state.failed.warnings = true end
			dec()
		end)
		task.spawn(function()
			local d = fetchJSON("permissions.json")
			if d then state.permissions = d else state.failed.permissions = true end
			dec()
		end)
	end

	-- ── API pública ──────────────────────────────────────────────────────────

	local api = {}

	-- Registra un callback para cuando los 3 JSONs terminen de cargar.
	-- Si ya están listos, lo ejecuta en el siguiente frame (task.defer).
	function api.onReady(fn)
		if state.ready then task.defer(fn)
		else table.insert(readyCbs, fn) end
	end

	-- Licencias. FAIL-OPEN por diseño: si el archivo no cargó, o si no declara
	-- "_enforce": true, pasa todo el mundo. Un fallo de red no puede dejar a
	-- nadie fuera de su propia herramienta.
	-- (Antes el cuerpo era un `return true` fijo, así que licenses.json y
	--  showLicenseDenied() estaban muertos sin que se notara desde fuera.)
	function api.isLicensed(userId)
		if not state.ready or state.failed.licenses then return true end
		if state.licenses._enforce ~= true then return true end
		local e = state.licenses[tostring(userId)]
		if e == nil or e == false then return false end
		if type(e) == "table" and e.expires then
			local hasta = tonumber(e.expires)
			if hasta and os.time() > hasta then return false end
		end
		return true
	end

	-- Advertencia del usuario ({ level, message }) o nil si no tiene.
	function api.getWarning(userId)
		if not state.ready then return nil end
		local w = state.warnings[tostring(userId)]
		return (type(w) == "table") and w or nil
	end

	-- Tabla de permisos del usuario ({}) si no existe o si aún no cargó.
	function api.getPermissions(userId)
		if not state.ready then return {} end
		local p = state.permissions[tostring(userId)]
		return (type(p) == "table") and p or {}
	end

	function api.isAdmin(userId)
		return api.getPermissions(userId).admin == true
	end

	function api.can(userId, perm)
		return api.getPermissions(userId)[perm] == true
	end

	-- Cuenta entradas en state.licenses / state.warnings / state.permissions.
	function api.countOf(key)
		local n = 0
		for _ in pairs(state[key] or {}) do n = n + 1 end
		return n
	end

	-- Cuenta los tags cargados del JSON de NX Tags (nxTags del scope padre).
	function api.countTags()
		if type(nxTags) ~= "table" then return 0 end
		local n = 0
		for _ in pairs(nxTags) do n = n + 1 end
		return n
	end

	-- Acceso al estado interno (solo lectura; para el panel admin).
	function api.getData() return state end
	function api.getVersion() return NX_VERSION end

	-- Stub de log — arquitectura lista, implementación pendiente.
	-- En v3.5+ reemplazar el cuerpo con la llamada HTTP al backend elegido.
	-- Formato: { userId, username, version, timestamp, event, ...data }
	-- Ejemplo: NXCore.logEvent("analyze", { targetId = 12345678 })
	function api.logEvent(_eventType, _data) end

	return api
end)()

-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║   NX SHIELDS · núcleo de verificación (v1.0)                        ║
-- ╠══════════════════════════════════════════════════════════════════════╣
-- ║  NO es decorativo. Dos protecciones REALES, cada una con efecto        ║
-- ║  medible en el comportamiento del sistema:                             ║
-- ║                                                                        ║
-- ║  • API Validation  → intercepta apiGet/apiPost. Clasifica cada         ║
-- ║    respuesta (JSON roto, {errors:[...]} de Roblox, HTTP >=400, cuerpo  ║
-- ║    vacío, tipo inesperado) y BLOQUEA la que no sea íntegra en vez de   ║
-- ║    dejar que llegue a la UI. OFF = el cuerpo pasa tal cual.            ║
-- ║                                                                        ║
-- ║  • Data Validation → valida cada CAMPO con su regla real (formato de   ║
-- ║    username de Roblox, UserId entero positivo, fecha ISO no futura,    ║
-- ║    contadores no negativos, avatar con URL usable, entradas de         ║
-- ║    grupos/badges/items bien formadas). Lo que no pasa NO se muestra    ║
-- ║    como válido, y los análisis heurísticos se BLOQUEAN si faltan       ║
-- ║    pilares (antes un fallo de API se puntuaba como "0 amigos" y        ║
-- ║    disparaba un Riesgo ALT falso).                                     ║
-- ║                                                                        ║
-- ║  Estados: loading · verified · partial · incomplete · error.           ║
-- ║  Todo derivado del resultado real de las comprobaciones.               ║
-- ║  Va en do...end: un solo local de raíz (límite de 200 de Luau).        ║
-- ╚══════════════════════════════════════════════════════════════════════╝
local Shield
do
	-- Preferencias persistidas (el merge genérico de loadStore ya las recoge).
	if store.shieldAPI  == nil then store.shieldAPI  = true end
	if store.shieldData == nil then store.shieldData = true end

	local S = {
		flags  = { api = store.shieldAPI ~= false, data = store.shieldData ~= false },
		run    = nil,   -- registro de integridad del análisis en curso
		stats  = { checks = 0, blocked = 0, fields = 0, rejected = 0 },
		last   = nil,   -- último motivo de bloqueo (texto humano)
		busy   = nil,   -- "api" | "data" mientras corre una autoverificación
		TTL    = 180,   -- caducidad de la caché de perfiles (s). Aquí para no
		                -- gastar un local de raíz (límite de 200 de Luau).
	}

	-- ── Notificación de cambios (la consume la UI: escudo, panel y Ajustes) ──
	local listeners = {}
	function S.onChange(fn) table.insert(listeners, fn) end
	local function emit()
		for _, fn in ipairs(listeners) do pcall(fn) end
	end
	S.emit = emit

	-- ── VALIDADORES DE CAMPO ────────────────────────────────────────────────
	-- Cada uno devuelve el valor saneado, o nil si NO es válido. Reglas reales,
	-- no comprobaciones de "no está vacío".
	S.valid = {}

	-- UserId: entero positivo dentro del rango plausible de Roblox.
	function S.valid.userId(v)
		local n = tonumber(v)
		if not n then return nil end
		if n <= 0 or n ~= math.floor(n) or n > 1e13 then return nil end
		return n
	end

	-- Username de Roblox: 3-20 caracteres, [A-Za-z0-9_], máximo UN guion bajo,
	-- y nunca al principio ni al final.
	function S.valid.username(v)
		if type(v) ~= "string" then return nil end
		if #v < 3 or #v > 20 then return nil end
		if v:match("[^%w_]") then return nil end
		local _, guiones = v:gsub("_", "")
		if guiones > 1 then return nil end
		if v:sub(1, 1) == "_" or v:sub(-1) == "_" then return nil end
		return v
	end

	-- Display Name: 3-20 visibles (Roblox permite Unicode, así que solo se
	-- comprueba longitud en bytes con margen y que no venga vacío).
	function S.valid.displayName(v)
		if type(v) ~= "string" then return nil end
		if #v < 1 or #v > 60 then return nil end
		return v
	end

	-- Contador: número entero >= 0, o el formato "N+" que devuelve countPaged.
	function S.valid.count(v)
		if type(v) == "number" then
			if v < 0 or v ~= math.floor(v) or v > 1e9 then return nil end
			return v
		end
		if type(v) == "string" then
			local n = v:match("^(%d+)%+?$")
			if n and tonumber(n) then return v end
		end
		return nil
	end

	-- Imagen/avatar: string con esquema usable. "rbxassetid://0" es el fallback
	-- de fallo de getAvatar, así que NO cuenta como avatar válido.
	function S.valid.image(v)
		if type(v) ~= "string" or v == "" or v == "rbxassetid://0" then return nil end
		if v:match("^rbxassetid://%d+$") or v:match("^rbxthumb") or v:match("^https?://") then
			return v
		end
		return nil
	end

	-- Fecha ISO: parseable, rango de calendario correcto, no anterior a 2004
	-- (Roblox nació en 2006) y NO futura.
	function S.valid.isoDate(v)
		if type(v) ~= "string" then return nil end
		local y, m, d = v:match("^(%d%d%d%d)-(%d%d)-(%d%d)")
		if not y then return nil end
		y, m, d = tonumber(y), tonumber(m), tonumber(d)
		if m < 1 or m > 12 or d < 1 or d > 31 then return nil end
		if y < 2004 then return nil end
		local t = os.time{ year = y, month = m, day = d }
		if t > os.time() + 86400 then return nil end   -- 1 día de margen por zonas horarias
		return v
	end

	-- Texto libre (descripción): string dentro de un tamaño razonable.
	function S.valid.text(v, max)
		if type(v) ~= "string" then return nil end
		if #v > (max or 4000) then return nil end
		return v
	end

	-- Lista de entradas con forma esperada. Devuelve la lista FILTRADA y cuántas
	-- entradas corruptas se descartaron (no se muestran como si fueran válidas).
	function S.valid.list(t, shapeFn)
		if type(t) ~= "table" then return nil, 0 end
		local out, dropped = {}, 0
		for _, entry in ipairs(t) do
			if shapeFn(entry) then out[#out + 1] = entry else dropped = dropped + 1 end
		end
		return out, dropped
	end

	-- Formas concretas usadas por las tarjetas de la pestaña Items.
	S.shape = {}
	function S.shape.group(g)
		return type(g) == "table" and type(g.name) == "string" and g.name ~= ""
			and type(g.role) == "string" and g.role ~= ""
	end
	function S.shape.badge(b)
		return type(b) == "table" and type(b.name) == "string" and b.name ~= ""
	end
	function S.shape.item(it)
		return type(it) == "table" and S.valid.userId(it.id) ~= nil
	end

	-- ── INSPECTOR DE RESPUESTAS HTTP ────────────────────────────────────────
	-- Clasifica un cuerpo ya decodificado. Devuelve (cuerpoLimpio, motivoFallo).
	function S.inspect(decoded, status, jsonOk)
		S.stats.checks = S.stats.checks + 1
		local code = tonumber(status)
		if decoded == nil then
			if jsonOk == false then return nil, "JSON inválido" end
			return nil, code and ("HTTP " .. code) or "sin respuesta"
		end
		if type(decoded) ~= "table" then return nil, "formato inesperado" end
		-- Roblox responde los errores como { errors = { { code, message } } }.
		if type(decoded.errors) == "table" and decoded.errors[1] then
			local e = decoded.errors[1]
			local msg = (type(e) == "table" and (e.message or e.code)) or "?"
			return nil, "API: " .. tostring(msg)
		end
		if code and code >= 400 then return nil, "HTTP " .. code end
		return decoded, nil
	end

	-- ── INTERCEPTOR: reasigna los locals apiGet/apiPost ──────────────────────
	-- Mismo patrón que el dispatcher de NX V2: los consumidores capturan la
	-- VARIABLE local, así que reasignarla aquí afecta a todas las llamadas
	-- posteriores sin tocar ni una línea de los fetchers existentes.
	local rawApiPost = apiPost

	apiGet = function(url)
		local raw, status = rawGet(url)
		local decoded, jsonOk = nil, true
		if raw ~= nil then
			local ok, d = pcall(function() return HttpService:JSONDecode(raw) end)
			jsonOk = ok
			decoded = ok and d or nil
		end
		if not S.flags.api then
			-- Protección OFF: se devuelve lo recibido sin capa de verificación.
			return decoded, status
		end
		local clean, err = S.inspect(decoded, status, jsonOk)
		if err then
			S.stats.blocked = S.stats.blocked + 1
			S.last = err
			return nil, status
		end
		return clean, status
	end

	apiPost = function(url, payload)
		local body, status = rawApiPost(url, payload)
		if not S.flags.api then return body, status end
		local clean, err = S.inspect(body, status, true)
		if err then
			S.stats.blocked = S.stats.blocked + 1
			S.last = err
			return nil, status
		end
		return clean, status
	end

	-- ── REGISTRO DE INTEGRIDAD POR ANÁLISIS ─────────────────────────────────
	-- Campos que, si faltan, hacen que los análisis heurísticos NO sean fiables.
	local PILARES  = { Friends = true, Badges = true, Groups = true, CreatedGames = true }
	-- Campos sin los cuales el perfil entero no es de fiar.
	local CRITICOS = { UserId = true, Username = true, Created = true }

	function S.begin(userId)
		S.run = {
			userId  = userId,
			fields  = {},   -- campo -> { status, detail }
			order   = {},
			state   = "loading",
			counts  = { ok = 0, missing = 0, invalid = 0 },
			started = os.clock(),
		}
		emit()
		return S.run
	end

	-- status: "ok" | "missing" (la API no lo dio) | "invalid" (llegó, pero corrupto)
	function S.mark(field, status, detail)
		local r = S.run
		if not r then return end
		if r.fields[field] == nil then r.order[#r.order + 1] = field end
		r.fields[field] = { status = status, detail = detail }
		r.counts[status] = (r.counts[status] or 0) + 1
		S.stats.fields = S.stats.fields + 1
		if status ~= "ok" then S.stats.rejected = S.stats.rejected + 1 end
	end

	-- Valida un valor y lo registra de una vez. Devuelve el valor saneado, o nil.
	-- Con Data Validation OFF devuelve el valor CRUDO (sin filtrar) a propósito.
	function S.check(field, value, validator)
		if not S.flags.data then
			S.mark(field, value == nil and "missing" or "ok")
			return value
		end
		if value == nil then
			S.mark(field, "missing", "la API no devolvió el dato")
			return nil
		end
		local clean = validator(value)
		if clean == nil then
			S.mark(field, "invalid", "no pasó la validación de formato")
			return nil
		end
		S.mark(field, "ok")
		return clean
	end

	-- Cierra el registro y deriva el estado REAL del análisis.
	function S.finish()
		local r = S.run
		if not r then return "error" end
		local faltanCriticos, faltanPilares = 0, 0
		for field, info in pairs(r.fields) do
			if info.status ~= "ok" then
				if CRITICOS[field] then faltanCriticos = faltanCriticos + 1 end
				if PILARES[field]  then faltanPilares  = faltanPilares  + 1 end
			end
		end
		r.criticos, r.pilares = faltanCriticos, faltanPilares
		if faltanCriticos > 0 then
			r.state = (r.counts.invalid > 0) and "error" or "incomplete"
		elseif r.counts.invalid > 0 then
			r.state = "error"
		elseif r.counts.missing > 0 then
			r.state = "partial"
		else
			r.state = "verified"
		end
		r.elapsed = os.clock() - r.started
		emit()
		return r.state
	end

	-- ¿Se pueden calcular los análisis heurísticos con lo que hay?
	-- Con validación ON, faltando 2+ pilares el resultado sería basura
	-- (toNum(nil) = 0 → "cuenta fantasma" → Riesgo ALT falso). Se bloquea.
	function S.scoresFiables(data)
		if not S.flags.data then return true, nil end
		local r = (data and data._integrity) or S.run
		if not r then return true, nil end
		local faltan = {}
		for field in pairs(PILARES) do
			local info = r.fields[field]
			if info and info.status ~= "ok" then faltan[#faltan + 1] = field end
		end
		table.sort(faltan)
		-- La ANTIGÜEDAD pesa un 25% en el modelo de Riesgo ALT y es la que más
		-- distorsiona: sin fecha válida, formatAge devuelve 0 días y la cuenta
		-- parece recién creada. Si falta, no se puntúa aunque los pilares estén.
		local created = r.fields.Created
		if created and created.status ~= "ok" then
			table.insert(faltan, 1, "Created (edad de cuenta)")
			return false, faltan
		end
		if #faltan >= 2 then
			return false, faltan
		end
		return true, faltan
	end

	-- Lista legible de lo que falló (la usa el panel y la tarjeta de integridad).
	function S.problemas(data)
		local r = (data and data._integrity) or S.run
		local out = {}
		if not r then return out end
		for _, field in ipairs(r.order) do
			local info = r.fields[field]
			if info and info.status ~= "ok" then
				out[#out + 1] = field .. ": " .. (info.detail or info.status)
			end
		end
		return out
	end

	-- ── ESTADO GLOBAL DEL ESCUDO ( /  / ) ──────────────────────────────
	-- Derivado, nunca decorativo:
	--   error   → alguna validación falló de verdad en el último análisis
	--   partial → hay protecciones apagadas, o faltaron datos no críticos
	--   ok      → todo encendido y el último análisis pasó limpio
	function S.estado()
		if S.busy then return "loading" end
		local r = S.run
		if r and (r.state == "error") then return "error" end
		if not (S.flags.api and S.flags.data) then return "partial" end
		if r and (r.state == "partial" or r.state == "incomplete") then return "partial" end
		if r and r.state == "loading" then return "loading" end
		return "ok"
	end

	-- ── AUTOVERIFICACIÓN REAL (la que anima el escudo al encender) ───────────
	-- API: pide un usuario conocido y comprueba que la RESPUESTA tenga la forma
	-- documentada. Si Roblox/tu red fallan, el escudo se pone en rojo de verdad.
	function S.selfTestAPI()
		local body, status = rawGet("https://users.roblox.com/v1/users/1")
		local ok, decoded = false, nil
		if body then ok, decoded = pcall(function() return HttpService:JSONDecode(body) end) end
		local clean, err = S.inspect(ok and decoded or nil, status, ok)
		if err then return false, err end
		if type(clean.id) ~= "number" or type(clean.name) ~= "string" or clean.created == nil then
			return false, "la respuesta no tiene la estructura esperada"
		end
		if not S.valid.isoDate(clean.created) then
			return false, "fecha de creación inválida en la respuesta"
		end
		return true, "estructura y tipos verificados"
	end

	-- DATOS: re-valida el perfil que está cargado ahora mismo con los
	-- validadores reales. Sin perfil cargado, valida el del propio jugador.
	function S.selfTestData(data)
		local pass, total = 0, 0
		local function probar(v, fn) total = total + 1; if fn(v) ~= nil then pass = pass + 1 end end
		if data then
			probar(data.UserId,      S.valid.userId)
			probar(data.Username,    S.valid.username)
			probar(data.DisplayName, S.valid.displayName)
			probar(data.AvatarUrl,   S.valid.image)
			probar(data.Created,     S.valid.isoDate)
		else
			-- Sin perfil cargado: se valida la cuenta propia. El thumbnail se pide
			-- aquí directo (getAvatar se define más abajo en el archivo y todavía
			-- no es visible desde este bloque).
			probar(player.UserId, S.valid.userId)
			probar(player.Name,   S.valid.username)
			local okT, thumb = pcall(function()
				return Players:GetUserThumbnailAsync(player.UserId,
					Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
			end)
			probar(okT and thumb or nil, S.valid.image)
		end
		if pass == total then return true, pass .. "/" .. total .. " campos válidos" end
		return false, (total - pass) .. " de " .. total .. " campos no pasaron"
	end

	-- ── TOGGLES (efecto real + persistencia) ────────────────────────────────
	-- onDone(ok, detalle) se llama tras la verificación REAL, no antes.
	function S.setFlag(which, on, onDone)
		S.flags[which] = on and true or false
		if which == "api"  then store.shieldAPI  = S.flags.api  end
		if which == "data" then store.shieldData = S.flags.data end
		pcall(saveStore)
		emit()
		if not on then
			if onDone then onDone(true, "protección desactivada") end
			emit()
			return
		end
		-- Al ACTIVAR: se ejecuta la comprobación de verdad y el estado final
		-- depende de su resultado (por eso la animación tarda lo que tarda).
		S.busy = which
		emit()
		task.spawn(function()
			local ok, detalle
			if which == "api" then ok, detalle = S.selfTestAPI()
			else ok, detalle = S.selfTestData(S.currentData and S.currentData()) end
			S.busy = nil
			S.lastTest = S.lastTest or {}
			S.lastTest[which] = { ok = ok, detalle = detalle, at = os.time() }
			if not ok then S.last = detalle end
			emit()
			if onDone then onDone(ok, detalle) end
		end)
	end

	Shield = S
	_G.NXShields = S
end

-- ====================== HELPERS DE DATOS ======================
local function countPaged(url, limit)
	limit = limit or 100
	local data = apiGet(url .. (url:find("%?") and "&" or "?") .. "limit=" .. limit)
	if not data or not data.data then return nil end
	local n = #data.data
	if data.nextPageCursor and data.nextPageCursor ~= "" then return n .. "+" end
	return n
end

local function simpleCount(url, key)
	local data = apiGet(url)
	if data and data[key] ~= nil then return data[key] end
	return nil
end

-- Convierte valores tipo 12, "12", "100+" o nil a número (para heurísticas)
local function toNum(v)
	if v == nil then return 0 end
	local s = tostring(v):gsub("%+", "")
	return tonumber(s) or 0
end

-- ====================== BÚSQUEDA ROBUSTA ======================
-- (MAX_RETRIES = 2 se inlinea a propósito: NO gastar un local de raíz. El
--  chunk principal roza el límite de 200 registros de Luau por el módulo de
--  head tags pegado al final.)
local function getUserIdByName(name)
	for attempt = 1, 3 do   -- 2 reintentos + intento inicial
		local data, status = apiPost("https://users.roblox.com/v1/usernames/users", {
			usernames = { name }, excludeBannedUsers = false,
		})
		if data and data.data and data.data[1] then
			return data.data[1].id, data.data[1].name, nil
		end
		if status == 200 and data then return nil, nil, "not_found" end
		if attempt <= 2 then task.wait(1) end
	end

	for attempt = 1, 3 do
		-- FIX (2026-07-26): Roblox ahora VALIDA el parámetro `limit` de /users/search
		-- y solo acepta 10, 25, 50 o 100. Con "&limit=1" devolvía
		--   400 {"message":"Allowed values: 10, 25, 50, 100","field":"limit"}
		-- así que este fallback entero estaba MUERTO. Se pide el mínimo legal (10)
		-- y se recorre la lista buscando la coincidencia exacta (antes solo se
		-- miraba data[1], que con 10 resultados ya no tiene por qué ser el bueno).
		local s, status = apiGet("https://users.roblox.com/v1/users/search?keyword="
			.. HttpService:UrlEncode(name) .. "&limit=10")
		if s and s.data then
			if s.data[1] then
				-- La API a veces devuelve entradas SIN 'name' (datos parciales).
				-- Antes, `s.data[1].name:lower()` lanzaba error aquí dentro del
				-- task.spawn de analyze() y dejaba `analyzing` en true PARA SIEMPRE
				-- (la herramienta no volvía a analizar nada en toda la sesión).
				local objetivo = name:lower()
				for _, hit in ipairs(s.data) do
					if type(hit.name) == "string" and type(hit.id) == "number"
						and hit.name:lower() == objetivo then
						return hit.id, hit.name, nil
					end
				end
				-- Hubo resultados pero ninguno es el nombre pedido: no existe ese
				-- usuario exacto (no es un fallo de la API).
				return nil, nil, "not_found"
			else
				return nil, nil, "not_found"
			end
		elseif status == 200 then
			return nil, nil, "not_found"
		end
		if attempt <= 2 then task.wait(1) end
	end
	return nil, nil, "api_error"
end

local avatarCache = {}
local avatarCacheOrder = {}
local function getAvatar(userId)
	if avatarCache[userId] then return avatarCache[userId] end
	local ok, thumb = pcall(function()
		return Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	end)
	local img = (ok and thumb ~= "" and thumb) or "rbxassetid://0"
	-- Evicción FIFO: sin tope, en sesiones largas (Explorador de amigos saltando
	-- de cuenta en cuenta) se acumulan cientos de thumbnails sin liberarse nunca.
	-- El string ya guardado en data.AvatarUrl sigue válido aunque se desaloje.
	avatarCacheOrder[#avatarCacheOrder + 1] = userId
	if #avatarCacheOrder > 60 then   -- tope inlineado (no gastar local de raíz)
		local oldest = table.remove(avatarCacheOrder, 1)
		if oldest ~= userId then avatarCache[oldest] = nil end
	end
	avatarCache[userId] = img
	return img
end

-- Devuelve 4 valores: fechaISO, etiquetaTexto, díasNumérico, añosNumérico.
-- Los DOS números evitan re-parsear el texto luego (causa del bug histórico
-- de "0 días": la 'í' de "días" es UTF-8 de 2 bytes y rompía [ií]).
local function formatAge(isoCreated)
	if not isoCreated then return nil, nil, 0, 0 end
	local y, m, d = isoCreated:match("(%d+)-(%d+)-(%d+)")
	if not y then return isoCreated:sub(1,10), nil, 0, 0 end
	local created = os.time{ year = tonumber(y), month = tonumber(m), day = tonumber(d) }
	local days = math.floor((os.time() - created) / 86400)
	if days < 0 then days = 0 end
	local years = days / 365.25
	local label = string.format("%d días (~%.1f años)", days, years)
	return isoCreated:sub(1,10), label, days, years
end

-- ====================== SUSCRIPCIÓN (Premium / Plus) ======================
-- INFO (v3.1.0, verificada): Roblox Plus sustituyó a Premium para NUEVAS
-- suscripciones el 30/04/2026; el bonus del 10% en compras extra de Robux
-- de Premium se quitó el 30/05/2026; el badge de Premium del perfil se
-- retiró (lo reemplazó el badge de Plus). Quienes ya tenían Premium
-- conservan su plan. Para OTROS usuarios ya no es detectable por el perfil
-- (no hay badge confirmable) -> "Solo visible en cuenta propia". Para TU
-- propia cuenta se lee MembershipType, pero la API no distingue limpiamente
-- Premium de Plus, por eso se reporta junto como "Premium / Plus".
local function getSubscription(userId)
	if userId ~= player.UserId then
		return "Solo visible en cuenta propia"
	end
	local mt = player.MembershipType
	if mt == Enum.MembershipType.None then
		return "Ninguna (cuenta gratis)"
	elseif mt == Enum.MembershipType.Premium then
		return "Premium / Plus"
	else
		return tostring(mt.Name)
	end
end

-- ====================== ESTADO / PRESENCIA ======================
-- 0 Offline · 1 Online (web/app) · 2 InGame · 3 InStudio
-- Devuelve: texto, color, placeId, gameId(jobId), tipo
local function getPresence(userId)
	local pres = apiPost("https://presence.roblox.com/v1/presence/users", { userIds = { userId } })
	if not pres or not pres.userPresences or not pres.userPresences[1] then
		return "No disponible", C.subtext, nil, nil, 0
	end
	local p = pres.userPresences[1]
	local t = p.userPresenceType
	local loc = (p.lastLocation and p.lastLocation ~= "" and p.lastLocation) or nil
	local placeId = p.placeId or p.rootPlaceId
	local gameId = p.gameId
	if t == 2 then
		return "Jugando" .. (loc and (": " .. loc) or ""), C.good, placeId, gameId, t
	elseif t == 3 then
		return "En Studio", C.warn, nil, nil, t
	elseif t == 1 then
		return "Online" .. (loc and (" (" .. loc .. ")") or " (web/app)"), C.good, nil, nil, t
	else
		return "Offline", C.subtext, nil, nil, t
	end
end

-- Color de presencia derivado del TIPO (no del color del tema viejo). Así,
-- al cambiar de tema EN VIVO, el color del Estado se re-deriva correcto en
-- cada render en vez de quedarse congelado con el tema anterior.
local function presenceColorFor(t)
	if t == 2 or t == 1 then return C.good
	elseif t == 3 then return C.warn
	else return C.subtext end
end

-- ====================== ITEMS EQUIPADOS (avatar actual) + PRECIO ======================
-- Devuelve: lista de { id, name, price } y el precio TOTAL del avatar.
-- price viene del catálogo (lowestPrice para limiteds, price para normales).
-- Si un item es gratis o sin precio, cuenta como 0.
local function getWornItems(userId)
	local data = apiGet("https://avatar.roblox.com/v1/users/" .. userId .. "/currently-wearing")
	if not data or not data.assetIds then return nil, nil end
	local items = {}
	for _, id in ipairs(data.assetIds) do
		table.insert(items, { id = id, name = nil, price = nil })
	end
	local total = 0
	-- pedir nombres + precios en lote (catálogo). Si falla, quedan solo los IDs.
	if #items > 0 then
		local ids = {}
		for _, it in ipairs(items) do table.insert(ids, { itemType = "Asset", id = it.id }) end
		-- FIX (2026-07-26): este endpoint ahora exige X-CSRF-TOKEN. Con apiPost
		-- (que no lo maneja) devolvía 403 {"message":"XSRF token invalid"}, así
		-- que los items salían sin NOMBRE y sin PRECIO, y el precio total del
		-- avatar era siempre 0. postAuth ya hace el 403 -> toma el token de la
		-- cabecera -> reintenta, que es exactamente lo que pide el endpoint.
		local resp = postAuth("https://catalog.roblox.com/v1/catalog/items/details", { items = ids })
		if resp and resp.data then
			local byId = {}
			for _, d in ipairs(resp.data) do byId[d.id] = d end
			for _, it in ipairs(items) do
				local d = byId[it.id]
				if d then
					it.name = d.name
					-- precio: lowestPrice (limiteds/reventa) o price (normal)
					it.price = d.lowestPrice or d.price or 0
					total = total + (tonumber(it.price) or 0)
				end
			end
		end
	end
	return items, total
end

-- ====================== GRUPOS CON RANGO ======================
local function getGroupsDetailed(userId)
	local data = apiGet("https://groups.roblox.com/v1/users/" .. userId .. "/groups/roles")
	if not data or not data.data then return nil end
	local list = {}
	for _, g in ipairs(data.data) do
		table.insert(list, {
			name = (g.group and g.group.name) or "?",
			role = (g.role and g.role.name) or "?",
			members = (g.group and g.group.memberCount) or nil,
		})
	end
	return list
end

-- ====================== BADGES RECIENTES ======================
local function getRecentBadges(userId, limit)
	limit = limit or 10
	local data = apiGet("https://badges.roblox.com/v1/users/" .. userId
		.. "/badges?limit=" .. limit .. "&sortOrder=Desc")
	if not data or not data.data then return nil end
	local list = {}
	for _, b in ipairs(data.data) do
		table.insert(list, { name = b.name, id = b.id })
	end
	return list
end

-- ====================== RAP (valor de limiteds, vía Rolimon's) ======================
-- AVISO: usa una web externa (rolimons.com). Si tu executor/red la bloquea,
-- devolverá nil y la UI mostrará "No disponible". No es un dato de Roblox.
-- Devuelve: tabla {rap, premium} o (nil, motivo).
-- motivo = "movida" | "sin_respuesta" | "sin_datos"  -> la UI dice la verdad
-- en vez de echarle la culpa al executor.
local function getRAP(userId)
	local data, status = apiGet("https://www.rolimons.com/playerapi/player/" .. userId)
	-- FIX (2026-07-26): Rolimon's RETIRÓ este endpoint. Hoy responde
	--   404 {"success":false,"message":"This endpoint has moved, use the new url"}
	-- y su reemplazo (api.rolimons.com) está detrás de Cloudflare y exige un rol
	-- de API que se pide en su Discord. O sea: el RAP NO es obtenible desde aquí.
	-- No se inventa un número: se informa por qué falta.
	if type(data) == "table" and data.success == false then
		local msg = tostring(data.message or "")
		if msg:find("moved") or msg:find("new url") or tonumber(status) == 404 then
			return nil, "movida"
		end
		return nil, "sin_datos"
	end
	if not data then return nil, "sin_respuesta" end
	local valor = data.value or data.rap
	if valor == nil then return nil, "sin_datos" end
	return { rap = valor, premium = data.premium }
end

-- ====================== SCORE DE CONFIANZA (heurística 0-100) ======================
-- Usa data.AccountAgeDays (NÚMERO). La actividad real (badges+juegos) es un
-- pilar y los amigos no dominan. Penaliza la cuenta "fantasma": vieja pero
-- sin grupos/badges/juegos/favs.
local function computeTrust(data)
	local days     = data.AccountAgeDays or 0
	local friends  = toNum(data.Friends)
	local groups   = toNum(data.Groups)
	local badges   = toNum(data.Badges)
	local favs     = toNum(data.Favorites)
	local games    = toNum(data.CreatedGames)
	local verified = (data.Verified == "Sí")

	local score, reasons = 0, {}
	local function add(pts, txt) score = score + pts; reasons[#reasons + 1] = txt end

	-- Antigüedad (máx 25)
	if days >= 1825 then add(25, "Cuenta de 5+ años (+25)")
	elseif days >= 730 then add(19, "Cuenta de 2+ años (+19)")
	elseif days >= 365 then add(13, "Más de 1 año (+13)")
	elseif days >= 90  then add(7,  "Algunos meses (+7)")
	elseif days >= 30  then add(3,  "Cuenta reciente (+3)")
	else add(0, "Cuenta muy nueva (+0)") end

	-- Actividad real: badges + experiencias (máx 25)
	local act = 0
	if badges >= 25 then act = act + 15
	elseif badges >= 10 then act = act + 11
	elseif badges >= 3 then act = act + 7
	elseif badges >= 1 then act = act + 3 end
	if games >= 3 then act = act + 10
	elseif games >= 1 then act = act + 5 end
	act = math.min(act, 25)
	add(act, "Actividad badges/juegos (+" .. act .. ")")

	-- Amigos (máx 15) — peso reducido
	if friends >= 50 then add(15, "Muchos amigos (+15)")
	elseif friends >= 10 then add(10, "Amigos normales (+10)")
	elseif friends >= 1 then add(5, "Pocos amigos (+5)")
	else add(0, "0 amigos (+0)") end

	-- Grupos (máx 15)
	if groups >= 5 then add(15, "Varios grupos (+15)")
	elseif groups >= 1 then add(8, "Algún grupo (+8)")
	else add(0, "0 grupos (+0)") end

	-- Favoritos (máx 5)
	if favs >= 5 then add(5, "Favoritos (+5)")
	elseif favs >= 1 then add(2, "Algún favorito (+2)") end

	-- Verificado (máx 10)
	if verified then add(10, "Insignia verificada (+10)") end

	-- PENALIZACIÓN: cuenta vieja pero "fantasma"
	local ghost = (days >= 730) and badges == 0 and groups == 0 and games == 0 and favs == 0
	if ghost then
		local penalty = (friends <= 1) and 25 or 15
		add(-penalty, "Cuenta antigua sin actividad (-" .. penalty .. ")")
	end

	score = math.clamp(score, 0, 100)
	local label, color = "Bajo", C.bad
	if score >= 70 then label, color = "Alto", C.good
	elseif score >= 40 then label, color = "Medio", C.warn end
	return score, label, color, reasons
end

-- ====================== AMIGOS EN COMÚN ======================
-- Forward-declaración: resolveNames() es un `local function` que se define más
-- ABAJO en el archivo (resolución de nombres en lote). getMutualFriends necesita
-- referirlo aquí arriba, así que lo declaramos ahora y allí se ASIGNA (sin `local`).
local resolveNames
-- Caché de la lista de amigos del propio jugador: no cambia dentro de la sesión,
-- así que no hace falta re-pedirla cada vez que se abre "Amigos en común".
local myFriendsCache
local function getMyFriendIds()
	if myFriendsCache then return myFriendsCache end
	local mine = apiGet("https://friends.roblox.com/v1/users/" .. player.UserId .. "/friends")
	if not mine or not mine.data then return nil end
	myFriendsCache = {}
	for _, f in ipairs(mine.data) do if f.id then myFriendsCache[f.id] = true end end
	return myFriendsCache
end

local function getMutualFriends(userId)
	if userId == player.UserId then return nil end
	local mySet  = getMyFriendIds()
	local theirs = apiGet("https://friends.roblox.com/v1/users/" .. userId .. "/friends")
	if not mySet or not theirs or not theirs.data then return nil end

	-- El endpoint /friends ya NO trae name/displayName (Roblox los quitó el
	-- 2024-10-21: ahora solo devuelve id/isDeleted). Recogemos los IDs en común
	-- y resolvemos los nombres en lote, igual que hace el explorador de amigos.
	local ids = {}
	for _, f in ipairs(theirs.data) do
		if f.id and mySet[f.id] then ids[#ids + 1] = f.id end
	end
	if #ids == 0 then return {} end

	local nameMap = resolveNames(ids)
	local mutual = {}
	for _, id in ipairs(ids) do
		local m = nameMap[id]
		mutual[#mutual + 1] = (m and (m.displayName or m.name)) or ("Usuario " .. id)
	end
	return mutual
end

-- ====================== INFLUENCIA inteligente 0-100 ======================
local function computeInfluence(data, rap)
	local followers = toNum(data.Followers)
	local following = toNum(data.Following)
	local groups    = toNum(data.Groups)
	local badges    = toNum(data.Badges)
	local games     = toNum(data.CreatedGames)
	local days      = data.AccountAgeDays or 0
	local verified  = (data.Verified == "Sí")

	local score = 0
	if followers >= 10000 then score = score + 35
	elseif followers >= 1000 then score = score + 28
	elseif followers >= 100 then score = score + 18
	elseif followers >= 25 then score = score + 10
	elseif followers >= 5 then score = score + 4 end

	if followers >= 10 then
		local ratio = followers / math.max(following, 1)
		if ratio >= 5 then score = score + 12
		elseif ratio >= 2 then score = score + 8
		elseif ratio >= 1 then score = score + 4 end
	end

	if verified then score = score + 15 end

	if games >= 5 then score = score + 12
	elseif games >= 1 then score = score + 6 end

	if groups >= 10 then score = score + 8 elseif groups >= 3 then score = score + 4 end
	if badges >= 50 then score = score + 8 elseif badges >= 10 then score = score + 4 end

	if rap and rap > 0 then
		if rap >= 1000000 then score = score + 10
		elseif rap >= 100000 then score = score + 7
		elseif rap >= 10000 then score = score + 4
		elseif rap >= 1000 then score = score + 2 end
	end

	if days >= 1825 then score = score + 5 elseif days >= 365 then score = score + 2 end

	score = math.clamp(score, 0, 100)
	local level, color = "Muy Bajo", C.subtext
	if score >= 75 then level, color = "Muy Alto", C.good
	elseif score >= 50 then level, color = "Alto", C.good
	elseif score >= 30 then level, color = "Medio", C.warn
	elseif score >= 15 then level, color = "Bajo", C.warn end
	return score, level, color
end

-- ====================== RIESGO ALT (modelo ponderado 0-100) ======================
-- Pesos: Antigüedad 25%, Actividad 25%, Red social 20%, Perfil 15%,
-- Verificación 10%, Historial 5%. Cada dimensión da un sub-riesgo 0-100
-- (0 = nada sospechoso, 100 = muy típico de alt) y se promedia ponderado.
-- 'data._namesCached' / 'data._itemsCached' afinan Perfil/Historial si ya se
-- cargaron (al abrir Perfil/Items); si no, se asumen neutros (no penaliza).
-- Devuelve: score, nivel, color, factores{}, desglose{ {nombre, riesgo, peso} }
local function computeAltRisk(data)
	local days     = data.AccountAgeDays or 0
	local friends  = toNum(data.Friends)
	local followers= toNum(data.Followers)
	local following= toNum(data.Following)
	local groups   = toNum(data.Groups)
	local favs     = toNum(data.Favorites)
	local badges   = toNum(data.Badges)
	local games    = toNum(data.CreatedGames)
	local verified = (data.Verified == "Sí")
	local hasDesc  = data.Description and data.Description ~= "" and data.Description ~= "Sin descripción"
	local prevNames = (type(data._namesCached) == "table") and #data._namesCached or nil
	local itemCount = (type(data._itemsCached) == "table") and #data._itemsCached or nil

	local factors = {}
	local function note(t) factors[#factors + 1] = t end

	-- 1) ANTIGÜEDAD (25%): cuanto más nueva, más riesgo
	local ageRisk
	if days <= 3 then ageRisk = 100; note("Cuenta de " .. days .. " día(s)")
	elseif days <= 7 then ageRisk = 92; note("Cuenta de menos de 1 semana")
	elseif days <= 14 then ageRisk = 82; note("Cuenta de menos de 2 semanas")
	elseif days <= 30 then ageRisk = 66; note("Cuenta de menos de 1 mes")
	elseif days <= 90 then ageRisk = 46; note("Cuenta de pocos meses")
	elseif days <= 180 then ageRisk = 30
	elseif days <= 365 then ageRisk = 18
	elseif days <= 730 then ageRisk = 8
	elseif days <= 1825 then ageRisk = 3
	else ageRisk = 0 end

	-- 2) ACTIVIDAD (25%): badges, juegos, favoritos, grupos
	local act = 0
	if badges >= 50 then act = act + 4 elseif badges >= 15 then act = act + 3
	elseif badges >= 5 then act = act + 2 elseif badges >= 1 then act = act + 1 end
	if games >= 1 then act = act + 2 end
	if favs >= 10 then act = act + 2 elseif favs >= 1 then act = act + 1 end
	if groups >= 5 then act = act + 2 elseif groups >= 1 then act = act + 1 end
	act = math.min(act, 8)
	local activityRisk = math.clamp(100 - act * 12.5, 0, 100)
	if badges == 0 then note("Sin badges") end
	if groups == 0 then note("0 grupos") end
	if favs == 0 then note("0 favoritos") end
	if games == 0 then note("Sin experiencias creadas") end

	-- 3) RED SOCIAL (20%): amigos + seguidores
	local soc = 0
	if friends >= 50 then soc = soc + 3 elseif friends >= 20 then soc = soc + 2.5
	elseif friends >= 10 then soc = soc + 2 elseif friends >= 3 then soc = soc + 1
	elseif friends >= 1 then soc = soc + 0.5 end
	if followers >= 100 then soc = soc + 2 elseif followers >= 10 then soc = soc + 1.5
	elseif followers >= 1 then soc = soc + 0.5 end
	soc = math.min(soc, 5)
	local socialRisk = math.clamp(100 - soc * 20, 0, 100)
	if friends == 0 then note("0 amigos")
	elseif friends <= 1 then note(friends .. " amigo") end
	if followers == 0 then note("0 seguidores") end
	-- crecimiento desbalanceado: sigue a muchos pero nadie le sigue
	if following >= 30 and followers == 0 then note("Sigue a muchos pero sin seguidores") end

	-- 4) PERFIL (15%): personalización (descripción + items equipados)
	local prof, profMax = 0, 2.5
	if hasDesc then prof = prof + 1.5 else note("Sin descripción") end
	if itemCount ~= nil then
		if itemCount >= 1 then prof = prof + 1 else note("Avatar sin items equipados") end
	else
		prof = prof + 0.5   -- desconocido: beneficio parcial (no penaliza de más)
	end
	local profileRisk = math.clamp(100 - (prof / profMax) * 100, 0, 100)

	-- 5) VERIFICACIÓN (10%)
	local verifyRisk = verified and 0 or 40
	if verified then note("Insignia verificada (atenúa)") end

	-- 6) HISTORIAL DE NOMBRES (5%)
	local historyRisk
	if prevNames == nil then historyRisk = 50            -- desconocido: neutro
	elseif prevNames >= 1 then historyRisk = 10          -- historial real
	else historyRisk = 65; note("Sin nombres anteriores") end

	local raw = ageRisk * 0.25 + activityRisk * 0.25 + socialRisk * 0.20
		+ profileRisk * 0.15 + verifyRisk * 0.10 + historyRisk * 0.05
	local score = math.clamp(math.floor(raw + 0.5), 0, 100)

	local level, color = "Muy Bajo", C.good
	if score >= 81 then level, color = "Muy Alto", C.bad
	elseif score >= 61 then level, color = "Alto", C.bad
	elseif score >= 41 then level, color = "Medio", C.warn
	elseif score >= 21 then level, color = "Bajo", C.good end

	local breakdown = {
		{ "Antigüedad", math.floor(ageRisk + 0.5), 25 },
		{ "Actividad", math.floor(activityRisk + 0.5), 25 },
		{ "Red social", math.floor(socialRisk + 0.5), 20 },
		{ "Perfil", math.floor(profileRisk + 0.5), 15 },
		{ "Verificación", math.floor(verifyRisk + 0.5), 10 },
		{ "Historial", math.floor(historyRisk + 0.5), 5 },
	}
	return score, level, color, factors, breakdown
end

-- ====================== ACTIVIDAD 0-100 ======================
local function computeActivity(data)
	local badges  = toNum(data.Badges)
	local games   = toNum(data.CreatedGames)
	local favs    = toNum(data.Favorites)
	local groups  = toNum(data.Groups)
	local playing = (data.PresenceType == 2)

	local score = 0
	if badges >= 50 then score = score + 35
	elseif badges >= 15 then score = score + 25
	elseif badges >= 5 then score = score + 15
	elseif badges >= 1 then score = score + 6 end
	if games >= 1 then score = score + 15 end
	if favs >= 10 then score = score + 15 elseif favs >= 1 then score = score + 7 end
	if groups >= 5 then score = score + 15 elseif groups >= 1 then score = score + 7 end
	if playing then score = score + 20 end

	score = math.clamp(score, 0, 100)
	local level, color = "Inactiva", C.subtext
	if score >= 70 then level, color = "Muy Activa", C.good
	elseif score >= 45 then level, color = "Activa", C.good
	elseif score >= 20 then level, color = "Moderada", C.warn end
	return score, level, color
end

-- ====================== RESUMEN AUTOMÁTICO ======================
local function buildSummary(data, trust, trustLvl, alt, altLvl, infl, inflLvl, actLvl)
	local s = {}
	local yrs  = data.AccountAgeYears or 0
	local days = data.AccountAgeDays or 0
	s[#s+1] = string.format("Cuenta de ~%.1f años (%d días).", yrs, days)
	s[#s+1] = string.format("Actividad %s; confianza %s (%d/100).", actLvl, trustLvl, trust)
	s[#s+1] = string.format("Riesgo de alt %s (%d/100).", altLvl, alt)
	s[#s+1] = string.format("Influencia %s (%d/100).", inflLvl, infl)
	if data.Verified == "Sí" then s[#s+1] = "Tiene insignia verificada." end
	if days >= 730 and toNum(data.Badges) == 0 and toNum(data.Groups) == 0 then
		s[#s+1] = "Atención: cuenta antigua con muy poca actividad (posible cuenta comprada o abandonada)."
	end
	if alt >= 60 then
		s[#s+1] = "El perfil encaja con patrones de cuenta secundaria/alt."
	elseif alt < 20 then
		s[#s+1] = "No muestra patrones típicos de alt."
	end
	return table.concat(s, " ")
end

-- ====================== HISTORIAL DE NOMBRES ======================
-- API username-history: trae los nombres anteriores del usuario.
-- Páginas de 100, hasta 10 páginas (máx 1000). Devuelve lista única + flag.
local function getNameHistory(userId)
	local allNames = {}
	local cursor = nil
	local maxPages = 10
	local pagesFetched = 0
	local hasMore = false

	repeat
		local url = "https://users.roblox.com/v1/users/" .. userId .. "/username-history?limit=100"
		if cursor then url = url .. "&cursor=" .. cursor end
		local data = apiGet(url)
		if not data then break end
		if data.data then
			for _, entry in ipairs(data.data) do
				table.insert(allNames, entry.name)
			end
		end
		cursor = data.nextPageCursor
		pagesFetched = pagesFetched + 1
	until (not cursor) or pagesFetched >= maxPages

	if cursor and cursor ~= "" and pagesFetched >= maxPages then hasMore = true end

	local seen, unique = {}, {}
	for _, name in ipairs(allNames) do
		if not seen[name] then
			seen[name] = true
			table.insert(unique, name)
		end
	end
	return unique, hasMore
end

-- ====================== RECOLECCIÓN EN PARALELO ======================
-- Cache con evicción LRU: máximo 20 perfiles en memoria.
-- Sin límite, en sesiones largas se acumularían muchas tablas grandes
-- (_itemsCached, _groupsCached, _badgesCached, etc.) sin liberarse nunca.
local profileCache      = {}
local profileCacheOrder = {}
-- (PROFILE_CACHE_MAX = 20 inlineado abajo: no gastar local de raíz.)
-- Caducidad de la caché (Shield.TTL, definido en el bloque NX Shields para no
-- gastar un local de raíz): la presencia ("Jugando: X") es un dato EN VIVO;
-- sin TTL, re-analizar devolvía el estado de la primera consulta para siempre.

local function setCached(userId, data)
	if not profileCache[userId] then
		table.insert(profileCacheOrder, userId)
		if #profileCacheOrder > 20 then   -- tope de perfiles en caché (inlineado)
			local oldest = table.remove(profileCacheOrder, 1)
			profileCache[oldest] = nil
		end
	end
	profileCache[userId] = data
end

local function gatherData(userId)
	-- Abre el registro de integridad de ESTE análisis (NX Shields).
	Shield.begin(userId)

	local profile = apiGet("https://users.roblox.com/v1/users/" .. userId)
	if type(profile) ~= "table" then
		Shield.mark("UserId", "missing", "el perfil no respondió")
		Shield.finish()
		return nil, "sin_respuesta"
	end

	-- VALIDACIÓN DEL PERFIL BASE. Antes se aceptaba cualquier tabla: una
	-- respuesta de error de Roblox ({errors:[...]}) pasaba el `if not profile`
	-- y se renderizaba un perfil fantasma (Username nil → "No disponible",
	-- created nil → 0 días de antigüedad → Riesgo ALT máximo inventado).
	local vId       = Shield.check("UserId",   profile.id or userId,      Shield.valid.userId)
	local vName     = Shield.check("Username", profile.name,              Shield.valid.username)
	local vCreated  = Shield.check("Created",  profile.created,           Shield.valid.isoDate)
	local vDisplay  = Shield.check("DisplayName", profile.displayName or profile.name, Shield.valid.displayName)
	-- Una descripción vacía es un estado LEGÍTIMO (mucha gente no tiene), no un
	-- dato que falte: se normaliza a "" para que no ensucie el estado a "parcial".
	local vDesc     = Shield.check("Description", profile.description or "",
		function(v) return Shield.valid.text(v, 4000) end)

	-- Sin identidad verificable no se muestra NADA: es preferible un error
	-- honesto a un perfil inventado. (Con Data Validation OFF, Shield.check
	-- devuelve el valor crudo y esto solo corta si de verdad vino nil.)
	if vId == nil or vName == nil then
		Shield.finish()
		return nil, "perfil_invalido"
	end

	local createdDate, accountAge, accountAgeDays, accountAgeYears = formatAge(vCreated)

	local results = {}
	local pending = 8   -- 7 contadores + el perfil moderno (user-profile-api)

	local function task_fetch(key, fn)
		task.spawn(function()
			local ok, value = pcall(fn)
			results[key] = ok and value or nil
			pending = pending - 1
		end)
	end

	task_fetch("Friends",      function() return simpleCount("https://friends.roblox.com/v1/users/" .. userId .. "/friends/count", "count") end)
	task_fetch("Followers",    function() return simpleCount("https://friends.roblox.com/v1/users/" .. userId .. "/followers/count", "count") end)
	task_fetch("Following",    function() return simpleCount("https://friends.roblox.com/v1/users/" .. userId .. "/followings/count", "count") end)
	task_fetch("Groups",       function() return countPaged("https://groups.roblox.com/v1/users/" .. userId .. "/groups/roles") end)
	task_fetch("Badges",       function() return countPaged("https://badges.roblox.com/v1/users/" .. userId .. "/badges") end)
	-- FIX (2026-07-26): games.roblox.com/v2 bajó su tope de página a 50. Con el
	-- limit=100 por defecto de countPaged, /games devolvía
	--   400 {"message":"Allowed values: 10, 25, 50","field":"limit"}
	-- así que "Juegos creados" salía SIEMPRE vacío -> Shields lo marcaba como
	-- dato ausente -> el análisis bajaba a "parcial" sin motivo real.
	-- Se fija 50 en los dos (favorite/games aún acepta 100, pero se iguala por
	-- coherencia y para que el mismo dominio no vuelva a romperse a medias).
	task_fetch("Favorites",    function() return countPaged("https://games.roblox.com/v2/users/" .. userId .. "/favorite/games", 50) end)
	task_fetch("CreatedGames", function() return countPaged("https://games.roblox.com/v2/users/" .. userId .. "/games", 50) end)

	-- PERFIL MODERNO (user-profile-api). Es el endpoint que usa hoy la web de
	-- Roblox; responde SIN sesión y en lote. Aporta dos cosas que /v1/users/{id}
	-- no da: isDeleted (cuenta borrada, que antes no se distinguía de una normal)
	-- y un segundo parecer sobre isVerified, útil para contrastar.
	-- Campos comprobados el 2026-07-26: names.username / names.displayName /
	-- names.combinedName / isVerified / isDeleted. NO existen 'description' ni
	-- 'previousUsernames' (devuelven lista vacía): no los pidas.
	task_fetch("ProfileApi", function()
		local resp = apiPost("https://apis.roblox.com/user-profile-api/v1/user/profiles/get-profiles", {
			userIds = { userId },
			fields  = { "names.username", "names.displayName", "names.combinedName", "isVerified", "isDeleted" },
		})
		if type(resp) ~= "table" or type(resp.profileDetails) ~= "table" then return nil end
		local d = resp.profileDetails[1]
		if type(d) ~= "table" then return nil end
		return d
	end)

	local started = os.clock()
	while pending > 0 and (os.clock() - started) < 15 do
		task.wait(0.05)
	end
	-- Si se agotó el tiempo, los campos que no llegaron quedan como nil y se
	-- registran abajo como "missing": el análisis saldrá PARCIAL, no completo.
	local expiro = (pending > 0)

	-- Presencia (estado en tiempo real)
	local presText, presColor, presPlaceId, presGameId, presType = getPresence(userId)

	-- Cada contador pasa por su validador antes de entrar en 'data'. Un valor
	-- corrupto (negativo, no numérico, formato raro) NO se muestra como cifra
	-- buena: queda en nil y la UI dirá "No disponible".
	local vFriends   = Shield.check("Friends",      results.Friends,      Shield.valid.count)
	local vFollowers = Shield.check("Followers",    results.Followers,    Shield.valid.count)
	local vFollowing = Shield.check("Following",    results.Following,    Shield.valid.count)
	local vGroups    = Shield.check("Groups",       results.Groups,       Shield.valid.count)
	local vBadges    = Shield.check("Badges",       results.Badges,       Shield.valid.count)
	local vFavorites = Shield.check("Favorites",    results.Favorites,    Shield.valid.count)
	local vGames     = Shield.check("CreatedGames", results.CreatedGames, Shield.valid.count)
	local vAvatar    = Shield.check("AvatarUrl",    getAvatar(userId),    Shield.valid.image)

	-- Lectura del perfil moderno. Si el endpoint no respondió, NO se inventa
	-- nada: los campos quedan nil y la UI lo dirá como "no disponible" en vez
	-- de afirmar que la cuenta está activa (un fallo de API no es un veredicto).
	local pa = results.ProfileApi
	local paOk = (type(pa) == "table")
	-- Se extraen con if explícito, NO con `paOk and pa.isDeleted or nil`: ese
	-- truco colapsa un `false` legítimo a nil (false or nil = nil), o sea que
	-- "la API dice que NO está borrada" se volvería "no se pudo comprobar".
	-- Es el mismo error de fondo que "dato ausente = 0".
	local paDeleted, paVerified, paCombined
	if paOk then
		if type(pa.isDeleted)  == "boolean" then paDeleted  = pa.isDeleted  end
		if type(pa.isVerified) == "boolean" then paVerified = pa.isVerified end
		if type(pa.names) == "table" and type(pa.names.combinedName) == "string" then
			paCombined = pa.names.combinedName
		end
	end

	local estado = Shield.finish()

	return {
		-- Perfil moderno (user-profile-api). nil = no se pudo comprobar.
		IsDeleted      = paDeleted,
		VerifiedApi    = paVerified,
		CombinedName   = paCombined,
		ProfileApiOk   = paOk,

		UserId         = vId,
		ProfileUrl     = "https://www.roblox.com/users/" .. vId .. "/profile",
		Username       = vName,
		DisplayName    = vDisplay or vName,
		Description    = (vDesc and vDesc ~= "" and vDesc) or "Sin descripción",
		Banned         = profile.isBanned and "Sí" or "No",
		Verified       = profile.hasVerifiedBadge and "Sí" or "No",
		Created        = createdDate or "No disponible",
		AccountAge     = accountAge or "No disponible",
		AccountAgeDays  = accountAgeDays or 0,   -- NÚMERO (fuente única para heurísticas)
		AccountAgeYears = accountAgeYears or 0,  -- NÚMERO
		Subscription   = getSubscription(userId),
		Presence       = presText,
		PresenceColor  = presColor,
		PresencePlace  = presPlaceId,
		PresenceGame   = presGameId,
		PresenceType   = presType,
		AvatarUrl      = vAvatar or "rbxassetid://0",
		Friends        = vFriends,
		Followers      = vFollowers,
		Following      = vFollowing,
		Groups         = vGroups,
		Badges         = vBadges,
		Favorites      = vFavorites,
		CreatedGames   = vGames,
		-- Instantánea del registro de integridad: viaja con el perfil, así que
		-- al releerlo de caché o re-pintar por tema el estado sigue siendo el real.
		_integrity     = Shield.run,
		_state         = estado,
		_timedOut      = expiro,
		_fetchedAt     = os.time(),
	}
end

-- ====================== GUI ======================
local gui = Instance.new("ScreenGui")
gui.Name = "UtilityPanel"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
-- POR ENCIMA DE CUALQUIER UI DEL JUEGO. DisplayOrder ordena los ScreenGui entre
-- sí: el más alto se dibuja encima. Sin esto, un juego que use un DisplayOrder
-- alto (menús, tiendas, cinemáticas) tapaba el panel.
-- OJO con lo que NO puede hacer: la CoreGui de Roblox (barra superior, chat,
-- menú de escape) SIEMPRE va por encima de PlayerGui, y meter el panel ahí
-- exige gethui()/CoreGui, donde los botones dejan de responder. Así que esto
-- lo pone sobre todo lo del JUEGO, no sobre la interfaz propia de Roblox.
gui.DisplayOrder = 2147483
gui.Parent = playerGui

-- Si el juego (o la re-ejecución de otro script) crea después un ScreenGui con
-- DisplayOrder aún más alto, lo re-imponemos. Es event-based, no un bucle:
-- solo corre cuando de verdad aparece un ScreenGui nuevo. (Ver regla de
-- rendimiento: nada de escanear en bucles.)
task.defer(function()
	pcall(function()
		playerGui.ChildAdded:Connect(function(hijo)
			if hijo ~= gui and hijo:IsA("ScreenGui") and hijo.DisplayOrder >= gui.DisplayOrder then
				gui.DisplayOrder = hijo.DisplayOrder + 1
			end
		end)
	end)
end)

-- INTRO: si la animación de bienvenida va a salir, ocultamos el panel desde el
-- arranque para que NO se vea antes que la intro. La intro lo revela al final
-- (bloque "NX INTRO" → _G.NXIntro). Failsafe interno: nunca queda oculto.
if (store.introEnabled ~= false) and (store.introSeen ~= true) then
	gui.Enabled = false
end

-- ====================== SISTEMA DE CONEXIONES ======================
local connections = {}
local function track(conn)
	table.insert(connections, conn)
	return conn
end

local function cleanupAll()
	for _, c in ipairs(connections) do
		pcall(function() c:Disconnect() end)
	end
	table.clear(connections)
	-- Corta el bucle de refresco de NX V2: no es una RBXScriptConnection, así que
	-- track()/Disconnect no lo cubre. Sin esto seguiría pidiendo HTTP tras cerrar.
	pcall(function() if _G.NXV2 and _G.NXV2.stop then _G.NXV2.stop() end end)
end

track(gui.AncestryChanged:Connect(function(_, newParent)
	if not newParent then cleanupAll() end
end))

-- ====================== MODO DISCRETO (tecla ocultar/mostrar) ======================
-- Una sola tecla esconde/muestra TODA la interfaz al instante, sin cerrarla ni
-- perder el análisis cargado. Pensado para no llamar la atención: si alguien
-- mira tu pantalla, la ocultas y la recuperas con la misma tecla. También hay
-- un botón "—" en la cabecera que solo oculta (se recupera con la tecla).
local HIDE_KEY = Enum.KeyCode.RightShift
local guiHidden = false
-- Tabla con las animaciones de ventana (se llena al crear la ventana). Va en UNA
-- tabla, no en locals sueltos, para no agotar el límite de 200 locals de Luau.
local NXWin = {}
local function setHidden(h)
	guiHidden = h
	gui.Enabled = not h
	-- Al volver a mostrar (tecla o botón), reproduce el "pop" de entrada premium.
	if (not h) and NXWin.playOpenAnim then pcall(NXWin.playOpenAnim) end
end
track(UserInputService.InputBegan:Connect(function(input, processed)
	-- no togglear si el juego ya procesó la tecla o si estás escribiendo
	if processed or UserInputService:GetFocusedTextBox() then return end
	if input.KeyCode == HIDE_KEY then
		setHidden(not guiHidden)
	end
end))

-- ====================== MOTION (animaciones + toggle global) ======================
-- Toda animación de la UI pasa por aquí. Si el usuario desactiva las animaciones
-- (Ajustes), motionTween salta directo a los valores finales (estilo
-- "prefers-reduced-motion"): la UI sigue funcionando, pero sin movimiento.
local ANIM = { enabled = (store.animations ~= false) }

local function motionTween(inst, info, props, onDone)
	if ANIM.enabled then
		local tw = TweenService:Create(inst, info, props)
		tw:Play()
		if onDone then tw.Completed:Once(onDone) end
		return tw
	end
	for k, v in pairs(props) do pcall(function() inst[k] = v end) end
	if onDone then task.defer(onDone) end
	return nil
end

-- Cambia el estado global de animaciones (y avisa al módulo de head tags si existe).
local function setAnimationsEnabled(on)
	ANIM.enabled = on and true or false
	if _G.NXHeadTags and _G.NXHeadTags.SetAnimationsEnabled then
		pcall(_G.NXHeadTags.SetAnimationsEnabled, ANIM.enabled)
	end
end

-- ====================== HELPERS DE UI (profundidad, sombra) ======================
-- Sin efecto hover a propósito: dejamos AutoButtonColor en false para que NO pase
-- NADA al poner el cursor encima (ni borde de acento ni oscurecido). Se conserva
-- el nombre de la función para no tocar los sitios donde ya se llamaba.
local function addHoverStroke(btn)
	btn.AutoButtonColor = false
	if not ANIM.enabled then return end
	-- Micro-feedback al pulsar: se hunde un pelín y vuelve al soltar. A propósito
	-- muy sutil (el usuario lo pidió poco notorio). Usa una UIScale propia; en
	-- reposo no toca ni color ni layout, así que no pelea con paintTabs ni themed.
	local sc = btn:FindFirstChildOfClass("UIScale") or Instance.new("UIScale", btn)
	local function to(s, d)
		motionTween(sc, TweenInfo.new(d, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = s })
	end
	btn.MouseButton1Down:Connect(function() to(0.95, 0.07) end)
	btn.MouseButton1Up:Connect(function() to(1, 0.12) end)
	btn.MouseLeave:Connect(function() to(1, 0.12) end)
end

-- Profundidad sutil para tarjetas: gradiente vertical (arriba algo más claro,
-- abajo más oscuro = "iluminado desde arriba") + borde fino temable.
local function addDepth(frame)
	local grad = Instance.new("UIGradient", frame)
	grad.Rotation = 90
	grad.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(214, 214, 220))
	local st = Instance.new("UIStroke", frame)
	st.Color = C.border; st.Transparency = 0.15; st.Thickness = 1
	themed(st, "Color", "border")
	return grad, st
end

-- Sombra suave (drop shadow) detrás de un elemento, usando el asset 9-slice
-- estándar de Roblox. 'parent' debe NO recortar (ClipsDescendants = false).
local function addDropShadow(target, parent, zIndex, pad, transparency)
	pad = pad or 26
	local sh = Instance.new("ImageLabel")
	sh.Name = "DropShadow"
	sh.Active = false
	sh.BackgroundTransparency = 1
	sh.Image = "rbxassetid://1316045217"
	sh.ImageColor3 = Color3.fromRGB(0, 0, 0)
	sh.ImageTransparency = transparency or 0.4
	sh.ScaleType = Enum.ScaleType.Slice
	sh.SliceCenter = Rect.new(10, 10, 118, 118)
	sh.AnchorPoint = target.AnchorPoint
	sh.Position = target.Position
	sh.Size = target.Size + UDim2.fromOffset(pad * 2, pad * 2)
	sh.ZIndex = zIndex or 0
	sh.Parent = parent
	return sh
end

-- ====================== SWITCH NX (estilo móvil) ======================
-- Interruptor deslizante reutilizable: pista + knob que viaja con animación
-- (respeta el toggle global de Animaciones vía motionTween) + estado de carga
-- (el knob late mientras corre una verificación REAL). Lo usan el panel de
-- NX Shields y la pestaña Ajustes, así que ambos se ven y se sienten igual.
-- Devuelve: frame, setOn(on), setBusy(b)
function Shield.makeSwitch(parent, on, onToggle)
	local W, H = 46, 24
	local track_ = Instance.new("TextButton", parent)
	track_.Size = UDim2.fromOffset(W, H)
	track_.AutoButtonColor = false
	track_.Text = ""
	track_.BorderSizePixel = 0
	track_.BackgroundColor3 = on and C.good or C.neutral
	Instance.new("UICorner", track_).CornerRadius = UDim.new(1, 0)
	local ts = Instance.new("UIStroke", track_)
	ts.Thickness = 1
	ts.Transparency = 0.55
	themed(ts, "Color", "border")

	local knob = Instance.new("Frame", track_)
	knob.Size = UDim2.fromOffset(H - 6, H - 6)
	knob.Position = on and UDim2.new(1, -(H - 3), 0, 3) or UDim2.new(0, 3, 0, 3)
	knob.BackgroundColor3 = Color3.fromRGB(250, 250, 252)
	knob.BorderSizePixel = 0
	knob.ZIndex = 2
	Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

	local estado, ocupado = on, false
	local latido   -- tween del "pensando"

	local function pintar()
		track_.BackgroundColor3 = ocupado and C.warn or (estado and C.good or C.neutral)
	end

	local function setOn(v, mover)
		estado = v and true or false
		local destino = estado and UDim2.new(1, -(H - 3), 0, 3) or UDim2.new(0, 3, 0, 3)
		if mover == false then knob.Position = destino
		else motionTween(knob, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = destino }) end
		pintar()
	end

	local function setBusy(b)
		ocupado = b and true or false
		pintar()
		if latido then pcall(function() latido:Cancel() end); latido = nil end
		if ocupado and ANIM.enabled then
			-- Latido REAL: solo late mientras hay una comprobación ejecutándose.
			knob.BackgroundTransparency = 0
			latido = TweenService:Create(knob,
				TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
				{ BackgroundTransparency = 0.55 })
			latido:Play()
		else
			knob.BackgroundTransparency = 0
		end
	end

	track_.MouseButton1Click:Connect(function()
		if ocupado then return end            -- no se toca mientras verifica
		setOn(not estado)
		if onToggle then onToggle(estado) end
	end)
	onRepaint(pintar)

	return track_, setOn, setBusy
end

-- ====================== VENTANA ======================
local MIN_W, MIN_H = 420, 360   -- tamaño mínimo al redimensionar
local main = Instance.new("Frame")
-- El nombre importa: la Lista de Jugadores se ancla al lado del panel buscando
-- UtilityPanel.main. Sin nombre era "Frame", la búsqueda fallaba en silencio y
-- la Lista se quedaba siempre en su posición de reserva.
main.Name = "main"
main.Size = UDim2.new(0, 600, 0, 480)
main.Position = UDim2.new(0.5, -300, 0.5, -240)
main.BackgroundColor3 = C.bg
main.BackgroundTransparency = 0.05
main.BorderSizePixel = 0
main.Active = true
main.ClipsDescendants = true
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
themed(main, "BackgroundColor3", "bg")
local stroke = Instance.new("UIStroke", main)
stroke.Color = C.accent
stroke.Transparency = 0.55
stroke.Thickness = 1.5
themed(stroke, "Color", "accent")

-- Sombra suave de la ventana (profundidad). Va detrás de 'main' (ZIndex 0) y la
-- sigue al arrastrar/redimensionar escuchando los cambios de Position/Size.
-- (SHADOW_PAD = 14, separación de la sombra, inlineado abajo: local de raíz.)
local windowShadow = Instance.new("ImageLabel")
windowShadow.Name = "WindowShadow"
windowShadow.Active = false
windowShadow.BackgroundTransparency = 1
windowShadow.Image = "rbxassetid://6014261993"   -- sombra suave con esquinas REDONDEADAS ("finalshdw")
windowShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
windowShadow.ImageTransparency = 0.5    -- visible pero suave
windowShadow.ScaleType = Enum.ScaleType.Slice
windowShadow.SliceCenter = Rect.new(49, 49, 450, 450)   -- centro del asset redondeado
windowShadow.ZIndex = 0
windowShadow.Parent = gui
local function syncWindowShadow()
	windowShadow.Size = main.Size + UDim2.fromOffset(28, 28)      -- SHADOW_PAD*2
	windowShadow.Position = main.Position - UDim2.fromOffset(14, 14)   -- SHADOW_PAD
end
syncWindowShadow()
track(main:GetPropertyChangedSignal("Size"):Connect(syncWindowShadow))
track(main:GetPropertyChangedSignal("Position"):Connect(syncWindowShadow))

-- Header
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 34)
header.BackgroundColor3 = C.accent
header.BackgroundTransparency = 0.85
header.BorderSizePixel = 0
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)
themed(header, "BackgroundColor3", "accent")

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -94, 1, 0)
title.Position = UDim2.new(0, 80, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "Roblox Profile Analyzer"
title.TextColor3 = C.accent
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextTruncate = Enum.TextTruncate.AtEnd
themed(title, "TextColor3", "accent")

-- ====================== BRILLO EN MOVIMIENTO (sheen del título) ======================
-- Premium "shine sweep": una COPIA BLANCA del título por encima, revelada solo en
-- una banda estrecha y diagonal que barre de izquierda a derecha en bucle. El título
-- base (acento, temable) no se toca; solo se le pasa un destello blanco por arriba.
-- En do...end: titleShine/shineGrad/syncShine NO gastan locals de raíz (límite 200 de Luau).
do
local titleShine = title:Clone()
titleShine.Name = "TitleShine"
titleShine.TextColor3 = Color3.fromRGB(255, 255, 255)
titleShine.TextTransparency = 0
titleShine.ZIndex = title.ZIndex + 1
titleShine.Parent = title.Parent
local shineGrad = Instance.new("UIGradient", titleShine)
shineGrad.Rotation = 18   -- ligeramente diagonal = look más premium
shineGrad.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0.00, 1),
	NumberSequenceKeypoint.new(0.42, 1),
	NumberSequenceKeypoint.new(0.50, 0.05),  -- núcleo del destello (casi opaco)
	NumberSequenceKeypoint.new(0.58, 1),
	NumberSequenceKeypoint.new(1.00, 1),
})
-- El overlay sigue al título (PRISM lo reubica/redimensiona más abajo).
local function syncShine()
	titleShine.Size = title.Size
	titleShine.Position = title.Position
	titleShine.TextXAlignment = title.TextXAlignment
end
syncShine()
track(title:GetPropertyChangedSignal("Size"):Connect(syncShine))
track(title:GetPropertyChangedSignal("Position"):Connect(syncShine))
-- Barrido infinito (respeta el toggle global de animaciones).
if ANIM.enabled then
	shineGrad.Offset = Vector2.new(-1, 0)
	TweenService:Create(shineGrad,
		TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, false, 1.0),
		{ Offset = Vector2.new(1, 0) }):Play()
else
	shineGrad.Offset = Vector2.new(2, 0)   -- banda fuera de pantalla = sin destello
end
end  -- /do (brillo del título)

-- ====================== CIRCULITOS DECORATIVOS (macOS / Tor) ======================
-- Los tres "circulitos" arriba a la izquierda son SOLO ADORNO (puro estilo). Los
-- controles que de verdad funcionan (minimizar/expandir/cerrar) viven a la DERECHA,
-- junto al logo NX (ver sección PRISM). En reposo se ven lisos; al pasar el cursor
-- aparece su símbolo, pero no ejecutan ninguna acción.

-- ====================== ANIMACIONES DE VENTANA (premium) ======================
-- Todo dentro de un do...end + la tabla NXWin: el estado (introScale, maximized,
-- etc.) vive en el bloque y NO gasta locals de raíz (Luau limita a 200 por función).
do
	local introScale = Instance.new("UIScale", main)
	introScale.Scale = 1
	local maximized, prevSize, prevPos = false, nil, nil
	local windowCollapsed, savedCollapseSize = false, nil

	-- Entrada: la ventana crece desde 0.94 con un leve rebote (Back). También al
	-- reaparecer tras ocultar con la tecla/botón.
	function NXWin.playOpenAnim()
		if not ANIM.enabled then
			introScale.Scale = 1
			windowShadow.ImageTransparency = 0.5
			return
		end
		introScale.Scale = 0.94
		windowShadow.ImageTransparency = 0.5
		motionTween(introScale, TweenInfo.new(0.40, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
	end

	-- "Smoosh" al arrastrar: la ventana se encoge un pelín al agarrarla y vuelve
	-- con un pequeño rebote al soltar. Reusa introScale (la ÚNICA UIScale de la
	-- ventana): añadir otra daría un comportamiento ambiguo entre las dos.
	function NXWin.setDragSquish(on)
		if not ANIM.enabled then return end
		if on then
			motionTween(introScale, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.985 })
		else
			motionTween(introScale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
		end
	end

	-- Cerrar animado: colapso elegante y destruye la GUI al terminar.
	function NXWin.animatedClose()
		if not ANIM.enabled then gui:Destroy(); return end
		motionTween(windowShadow, TweenInfo.new(0.18), { ImageTransparency = 1 })
		motionTween(introScale, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.02 }, function()
			gui:Destroy()
		end)
	end

	-- MINIMIZAR DE VERDAD: la ventana se encoge hasta la barra de título (NO se
	-- oculta); al pulsar de nuevo se restaura. Animado (como el panel de buscar nombres).
	function NXWin.toggleCollapse()
		if windowCollapsed then
			windowCollapsed = false
			motionTween(main, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = savedCollapseSize or main.Size })
		else
			savedCollapseSize = main.Size
			windowCollapsed = true
			motionTween(main, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{ Size = UDim2.new(main.Size.X.Scale, main.Size.X.Offset, 0, 34) })
		end
	end

	-- Maximizar/restaurar a ~90% con TRANSICIÓN SUAVE. Si estaba colapsada, recuerda
	-- su tamaño normal (no los 34px).
	function NXWin.toggleMaximize()
		local targetSize, targetPos
		if maximized then
			targetSize = prevSize or main.Size
			targetPos  = prevPos  or main.Position
			maximized = false
		else
			prevSize = (windowCollapsed and savedCollapseSize) or main.Size
			prevPos  = main.Position
			local cam = workspace.CurrentCamera
			local vp = (cam and cam.ViewportSize) or Vector2.new(1280, 720)
			local w = math.max(MIN_W, math.floor(vp.X * 0.9))
			local h = math.max(MIN_H, math.floor(vp.Y * 0.9))
			targetSize = UDim2.new(0, w, 0, h)
			targetPos  = UDim2.new(0.5, -w/2, 0.5, -h/2)
			maximized = true
		end
		windowCollapsed = false   -- maximizar/restaurar siempre des-colapsa
		motionTween(main, TweenInfo.new(0.34, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = targetSize, Position = targetPos })
	end
end

-- "Pop" de entrada al abrir el panel (se ve crecer con un leve rebote).
NXWin.playOpenAnim()

local function makeTrafficLight(x, color, glyph, onClick)
	local b = Instance.new("TextButton", header)
	b.Size = UDim2.new(0, 14, 0, 14)
	b.Position = UDim2.new(0, x, 0.5, -7)
	b.BackgroundColor3 = color
	b.Text = glyph
	b.Font = Enum.Font.GothamBold
	b.TextSize = 11
	b.TextColor3 = Color3.fromRGB(55, 40, 35)   -- símbolo oscuro (estilo Mac)
	b.TextTransparency = 1                        -- oculto hasta pasar el cursor
	b.AutoButtonColor = false
	b.BorderSizePixel = 0
	b.ZIndex = 3
	Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)  -- círculo perfecto
	local st = Instance.new("UIStroke", b)
	st.Color = Color3.fromRGB(0, 0, 0); st.Transparency = 0.82; st.Thickness = 1
	b.MouseEnter:Connect(function() b.TextTransparency = 0 end)
	b.MouseLeave:Connect(function() b.TextTransparency = 1 end)
	track(b.MouseButton1Click:Connect(onClick))
	return b
end

-- rojo / amarillo / verde, espaciados a la izquierda (como en macOS/Tor).
-- SOLO ADORNO: puntos de color lisos, SIN símbolo (para que no parezcan botones).
-- Los controles reales (minimizar/expandir/cerrar) están a la derecha, con el logo NX.
makeTrafficLight(14, Color3.fromRGB(255, 95, 86),  "", function() end)
makeTrafficLight(34, Color3.fromRGB(255, 189, 46), "", function() end)
makeTrafficLight(54, Color3.fromRGB(39, 201, 63),  "", function() end)

-- ====================== BÚSQUEDA ======================
local searchFrame = Instance.new("Frame", main)
searchFrame.Size = UDim2.new(1, -20, 0, 32)
searchFrame.Position = UDim2.new(0, 10, 0, 40)
searchFrame.BackgroundTransparency = 1

local searchBox = Instance.new("TextBox", searchFrame)
searchBox.Size = UDim2.new(0, 200, 0, 28)
searchBox.PlaceholderText = "Usuario o ID"
searchBox.Text = ""
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 14
searchBox.BackgroundColor3 = C.input
searchBox.TextColor3 = C.text
searchBox.ClearTextOnFocus = false
searchBox.BorderSizePixel = 0
searchBox.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 14)
local sbPad = Instance.new("UIPadding", searchBox)
sbPad.PaddingLeft = UDim.new(0, 26)
sbPad.PaddingRight = UDim.new(0, 8)
themed(searchBox, "BackgroundColor3", "input")
themed(searchBox, "TextColor3", "text")

-- Icono LUPA (buscar) dibujado a la izquierda: aro + mango. Vectorial, siempre
-- renderiza (nada de glifos/tofu) y se tiñe con el tema.
local lockGlyph = Instance.new("Frame", searchFrame)
lockGlyph.Name = "SearchIcon"
lockGlyph.Size = UDim2.new(0, 16, 0, 28)
lockGlyph.Position = UDim2.new(0, 7, 0, 0)
lockGlyph.BackgroundTransparency = 1
lockGlyph.ZIndex = 2
do
	local ring = Instance.new("Frame", lockGlyph)
	ring.AnchorPoint = Vector2.new(0.5, 0.5)
	ring.Position = UDim2.new(0.42, 0, 0.5, -1)
	ring.Size = UDim2.fromOffset(10, 10)
	ring.BackgroundTransparency = 1
	ring.BorderSizePixel = 0
	ring.ZIndex = 2
	Instance.new("UICorner", ring).CornerRadius = UDim.new(1, 0)
	local rs = Instance.new("UIStroke", ring)
	rs.Thickness = 1.6
	rs.Color = C.subtext
	themed(rs, "Color", "subtext")
	local handle = Instance.new("Frame", lockGlyph)
	handle.AnchorPoint = Vector2.new(0.5, 0.5)
	handle.Position = UDim2.new(0.74, 0, 0.78, -1)
	handle.Size = UDim2.fromOffset(5, 1.8)
	handle.Rotation = 45
	handle.BorderSizePixel = 0
	handle.BackgroundColor3 = C.subtext
	handle.ZIndex = 2
	Instance.new("UICorner", handle).CornerRadius = UDim.new(1, 0)
	themed(handle, "BackgroundColor3", "subtext")
end

-- (v3.8.2) MENÚ DE SUGERENCIAS ELIMINADO a pedido del usuario.
-- Antes salía un dropdown debajo del buscador con los últimos perfiles y con
-- resultados en vivo de la API. El problema real: caía a y=72 y las TABS
-- están a y=78, así que TAPABA las pestañas y el usuario no podía cambiar de
-- vista mientras estaba tecleando o mientras el buscador tenía foco vacío.
-- Solución simple: fuera. La búsqueda ya funciona escribiendo + Enter o
-- pulsando "Analizar" (auto-resuelve @usuario o UserId), así que no se pierde
-- funcionalidad, solo el atajo visual. Se dejan STUBS de las 3 funciones
-- (hideAllSuggestions/showSuggestions/ensureSuggestionItem) para no romper
-- las llamadas que quedan en otros sitios del archivo. Coste: 0.
local analyze
local function hideAllSuggestions() end
local function showSuggestions(_) end
local function ensureSuggestionItem(_) return nil end

local analyzeBtn = Instance.new("TextButton", searchFrame)
analyzeBtn.Size = UDim2.new(0, 100, 0, 28)
analyzeBtn.Position = UDim2.new(0, 210, 0, 0)
analyzeBtn.BackgroundColor3 = C.accent
analyzeBtn.Text = "Analizar"
analyzeBtn.Font = Enum.Font.GothamBold
analyzeBtn.TextSize = 14
analyzeBtn.TextColor3 = C.onAccent
analyzeBtn.BorderSizePixel = 0
Instance.new("UICorner", analyzeBtn).CornerRadius = UDim.new(0, 6)
themed(analyzeBtn, "BackgroundColor3", "accent")
themed(analyzeBtn, "TextColor3", "onAccent")
addHoverStroke(analyzeBtn)

local statusLabel = Instance.new("TextLabel", searchFrame)
statusLabel.Size = UDim2.new(1, -320, 0, 28)
statusLabel.Position = UDim2.new(0, 320, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 13
statusLabel.TextColor3 = C.subtext
statusLabel.Text = ""   -- (antes había un tip de [RShift]; quitado a pedido del usuario)
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.TextTruncate = Enum.TextTruncate.AtEnd
themed(statusLabel, "TextColor3", "subtext")

-- ====================== PESTAÑAS ======================
local tabBar = Instance.new("ScrollingFrame", main)
tabBar.Size = UDim2.new(1, -20, 0, 26)
tabBar.Position = UDim2.new(0, 10, 0, 78)
-- Fondo sólido (v3.8.2): antes era transparente y el contenido con scroll
-- se veía POR DEBAJO de las tabs (el toggle "Activado" atravesándolas).
tabBar.BackgroundColor3 = C.bg
tabBar.BackgroundTransparency = 0
themed(tabBar, "BackgroundColor3", "bg")
tabBar.BorderSizePixel = 0
tabBar.ScrollBarThickness = 3
tabBar.ScrollBarImageColor3 = C.accent
tabBar.ScrollingDirection = Enum.ScrollingDirection.X
tabBar.CanvasSize = UDim2.new(0, 0, 0, 0)
tabBar.AutomaticCanvasSize = Enum.AutomaticSize.X
local tabLayout = Instance.new("UIListLayout", tabBar)
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 5)
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder

local content = Instance.new("Frame", main)
-- -116: la barra de terminal inferior se retiró (v3.8.1), así que el contenido
-- vuelve a llegar casi hasta el borde de abajo. Más alto útil para los datos.
content.Size = UDim2.new(1, -20, 1, -116)
content.Position = UDim2.new(0, 10, 0, 106)
content.BackgroundTransparency = 1

-- (La BARRA DE TERMINAL inferior se retiró en v3.8.1 a pedido del usuario:
--  duplicaba la línea de estado y restaba alto útil. El aire de terminal lo
--  dan el tema Kali + la fuente mono. _G.NXTerm ya no existe y sus dos llamadas
--  —en analyze() y en el arranque del skin— también se quitaron.)

local tabs, pages = {}, {}
local tabByPage = {}      -- page -> botón (para activar una pestaña por código)
local onShowByPage = {}   -- page -> callback opcional al mostrarse (carga perezosa)
local activeTab = nil
local function paintTabs()
	for _, t in ipairs(tabs) do
		-- Texto de las tabs SIEMPRE blanco (a pedido): activo en blanco pleno,
		-- inactivo en el mismo blanco pero atenuado. Guarda de luminancia por si el
		-- fondo del tab es muy claro (el tema "negro" tiene accent BLANCO y "claro"
		-- tiene neutral claro): ahí el blanco no se leería, así que cae a onAccent.
		-- (bg/lum/txt son locales de ESTA función; no gastan registros de raíz.)
		local bg  = (t == activeTab) and C.accent or C.neutral
		local lum = 0.299 * bg.R + 0.587 * bg.G + 0.114 * bg.B
		local txt = (lum > 0.62) and C.onAccent or Color3.fromRGB(255, 255, 255)
		if t == activeTab then
			t.BackgroundColor3 = C.accent
			t.BackgroundTransparency = 0
			t.TextColor3 = txt
			t.TextTransparency = 0
		else
			-- inactivo: bloque más suave (menos saturado) + blanco atenuado
			t.BackgroundColor3 = C.neutral
			t.BackgroundTransparency = 0.35
			t.TextColor3 = txt
			t.TextTransparency = 0.32
		end
	end
end
onRepaint(paintTabs)

-- Muestra una pestaña por código (la usa el Explorador para saltar a "Perfil").
local function showPage(page)
	for _, p in pairs(pages) do p.Visible = false end
	page.Visible = true
	-- La pestaña entra con "smoosh": sube un pelín + un micro pop de escala que
	-- rebota (Back). Reusa una UIScale propia de la página (PageScale) para no
	-- crear una nueva en cada cambio de sección.
	if ANIM.enabled then
		local sc = page:FindFirstChild("PageScale")
		if not sc then sc = Instance.new("UIScale", page); sc.Name = "PageScale" end
		sc.Scale = 0.985
		page.Position = UDim2.new(0, 0, 0, 12)
		motionTween(page, TweenInfo.new(0.26, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
			{ Position = UDim2.new(0, 0, 0, 0) })
		motionTween(sc, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
			{ Scale = 1 })
	else
		page.Position = UDim2.new(0, 0, 0, 0)
	end
	activeTab = tabByPage[page]
	paintTabs()
	local cb = onShowByPage[page]
	if cb then pcall(cb) end
end

local function createTab(name, page, onShow)
	local btn = Instance.new("TextButton", tabBar)
	-- Auto-ancho: antes eran 92 px fijos y los rótulos largos se cortaban
	-- ("Estadísticas" salía como "stadística"). Ahora el tab se adapta al
	-- texto y un UIPadding le da 14 px de aire a cada lado.
	btn.Size = UDim2.new(0, 0, 0, 24)
	btn.AutomaticSize = Enum.AutomaticSize.X
	btn.LayoutOrder = #tabs
	btn.BackgroundColor3 = C.neutral
	btn.Text = name
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 13
	btn.TextColor3 = C.text
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
	local tp = Instance.new("UIPadding", btn)
	tp.PaddingLeft = UDim.new(0, 14); tp.PaddingRight = UDim.new(0, 14)
	addHoverStroke(btn)
	tabByPage[page] = btn
	if onShow then onShowByPage[page] = onShow end
	track(btn.MouseButton1Click:Connect(function() showPage(page) end))
	table.insert(tabs, btn)
	table.insert(pages, page)
	if #tabs == 1 then
		activeTab = btn
		page.Visible = true
	end
	paintTabs()
	return btn
end

local function makeScroll(parent)
	local sf = Instance.new("ScrollingFrame", parent)
	sf.Size = UDim2.new(1, 0, 1, 0)
	sf.BackgroundTransparency = 1
	sf.BorderSizePixel = 0
	sf.ScrollBarThickness = 4
	sf.ScrollBarImageColor3 = C.accent
	sf.CanvasSize = UDim2.new(0, 0, 0, 0)
	sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
	sf.ClipsDescendants = true
	themed(sf, "ScrollBarImageColor3", "accent")
	local layout = Instance.new("UIListLayout", sf)
	layout.Padding = UDim.new(0, 8)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	local pad = Instance.new("UIPadding", sf)
	pad.PaddingRight = UDim.new(0, 6)
	return sf
end

local profilePage = Instance.new("Frame", content)
profilePage.Size = UDim2.new(1, 0, 1, 0)
profilePage.BackgroundTransparency = 1
profilePage.Visible = false
local profileScroll = makeScroll(profilePage)

local statsPage = Instance.new("Frame", content)
statsPage.Size = UDim2.new(1, 0, 1, 0)
statsPage.BackgroundTransparency = 1
statsPage.Visible = false
local statsScroll = makeScroll(statsPage)

local itemsPage = Instance.new("Frame", content)
itemsPage.Size = UDim2.new(1, 0, 1, 0)
itemsPage.BackgroundTransparency = 1
itemsPage.Visible = false
local itemsScroll = makeScroll(itemsPage)

local analysisPage = Instance.new("Frame", content)
analysisPage.Size = UDim2.new(1, 0, 1, 0)
analysisPage.BackgroundTransparency = 1
analysisPage.Visible = false
local analysisScroll = makeScroll(analysisPage)

local settingsPage = Instance.new("Frame", content)
settingsPage.Size = UDim2.new(1, 0, 1, 0)
settingsPage.BackgroundTransparency = 1
settingsPage.Visible = false
local settingsScroll = makeScroll(settingsPage)

-- ====================== ABRIR URL ======================
local GuiService = game:GetService("GuiService")

-- NOTA: se ELIMINÓ la elevación de identidad del hilo (setthreadidentity(8)).
-- Esa línea ponía el script a nivel CoreScript y NO lo regresaba, lo que
-- puede romper sistemas del cliente como el chat de Roblox. Sin eso,
-- OpenBrowserWindow quizá no abra en algunos executors, pero el flujo cae
-- limpio al modal de "copiar link".
local function openURL(url)
	-- 1) NAVEGADOR NATIVO de Roblox. OpenBrowserWindow está protegido
	-- (RobloxScriptSecurity): con identidad normal NO abre (y a veces ni
	-- tira error -> antes "decía que sí" pero no abría nada). Elevamos a 8
	-- SOLO dentro de un hilo aparte y desechable: al morir el hilo se va la
	-- identidad elevada, así el hilo principal NUNCA queda elevado y no se
	-- rompe el chat de Roblox (ese era el bug por el que se quitó antes).
	local ok, done = false, false
	task.spawn(function()
		pcall(function() if setthreadidentity then setthreadidentity(8) end end)
		ok = pcall(function() GuiService:OpenBrowserWindow(url) end)
		done = true
	end)
	-- Esperar a que el hilo desechable termine antes de leer 'ok'. Antes se leía
	-- de inmediato (el spawn aún no había corrido) → SIEMPRE false, así que el
	-- navegador nativo nunca reportaba éxito y siempre caía a los fallbacks.
	local t0 = os.clock()
	while not done and (os.clock() - t0) < 1 do task.wait() end
	if ok then return true end
	local candidates = {
		rawget(_G, "open_url"), rawget(_G, "openurl"), rawget(_G, "openUrl"), rawget(_G, "OpenURL"),
		rawget(_G, "shellexecute"), rawget(_G, "shell_execute"), rawget(_G, "shellExecute"), rawget(_G, "ShellExecute"),
		rawget(_G, "openbrowser"), rawget(_G, "browse"),
		syn and syn.open_url, syn and syn.openurl,
		krnl and krnl.open_url,
		fluxus and fluxus.open_url, fluxus and fluxus.openurl,
		hydrogen and hydrogen.open_url,
		velocity and velocity.open_url,
		wave and wave.open_url,
		xeno and xeno.open_url, xeno and xeno.openurl,
	}
	for _, fn in ipairs(candidates) do
		if type(fn) == "function" then
			local okExec = pcall(fn, url)
			if okExec then return true end
		end
	end

	-- 3) NAVEGADOR POR PUERTO (igual que el truco de Discord, pero para TU
	-- navegador). Si lanzaste Brave/Chrome con la bandera
	-- --remote-debugging-port=9222, el navegador levanta un servidor local en
	-- ese puerto y le pedimos por HTTP que abra una pestaña con el link.
	-- Xeno SÍ puede pegarle a 127.0.0.1 (es lo mismo que hace con Discord).
	-- Si NO lanzaste Brave con la bandera, el request falla solito y caemos
	-- limpio al portapapeles de abajo, sin romper nada.
	if httpRequest then
		local okPort = false
		local function tryPort(method)
			pcall(function()
				local res = httpRequest({
					Url = "http://127.0.0.1:9222/json/new?" .. url,
					Method = method,
				})
				local code = res and (res.StatusCode or res.Status)
				if res and (res.Success == true or code == 200) then okPort = true end
			end)
		end
		tryPort("PUT")            -- Brave/Chrome nuevos exigen PUT
		if not okPort then tryPort("GET") end   -- versiones viejas
		if okPort then return true end
	end

	clipboard(url)
	return false
end

-- ====================== MODAL DE LINK ======================
local function showLinkModal(url)
	local existing = gui:FindFirstChild("LinkModal")
	if existing then existing:Destroy() end

	local overlay = Instance.new("Frame", gui)
	overlay.Name = "LinkModal"
	overlay.Size = UDim2.new(1, 0, 1, 0)
	overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	overlay.BackgroundTransparency = 0.4
	overlay.BorderSizePixel = 0
	overlay.ZIndex = 50

	local box = Instance.new("Frame", overlay)
	box.Size = UDim2.new(0, 480, 0, 300)
	box.Position = UDim2.new(0.5, -240, 0.5, -150)
	box.BackgroundColor3 = C.modalBg
	box.BorderSizePixel = 0
	box.ClipsDescendants = true
	box.ZIndex = 51
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 10)

	local boxStroke = Instance.new("UIStroke", box)
	boxStroke.Color = C.good
	boxStroke.Thickness = 1.5
	boxStroke.Transparency = 0.3

	local checkIcon = Instance.new("TextLabel", box)
	checkIcon.Size = UDim2.new(0, 32, 0, 32)
	checkIcon.Position = UDim2.new(0, 14, 0, 12)
	checkIcon.BackgroundColor3 = C.good
	checkIcon.Text = "✓"
	checkIcon.Font = Enum.Font.GothamBold
	checkIcon.TextSize = 20
	checkIcon.TextColor3 = C.text
	checkIcon.BorderSizePixel = 0
	checkIcon.ZIndex = 52
	Instance.new("UICorner", checkIcon).CornerRadius = UDim.new(0, 16)

	local mtitle = Instance.new("TextLabel", box)
	mtitle.Size = UDim2.new(1, -60, 0, 28)
	mtitle.Position = UDim2.new(0, 54, 0, 14)
	mtitle.BackgroundTransparency = 1
	mtitle.Font = Enum.Font.GothamBold
	mtitle.TextSize = 16
	mtitle.TextColor3 = Color3.fromRGB(60, 220, 130)
	mtitle.Text = "Link copiado al portapapeles"
	mtitle.TextXAlignment = Enum.TextXAlignment.Left
	mtitle.TextTruncate = Enum.TextTruncate.AtEnd
	mtitle.ZIndex = 52

	local info = Instance.new("TextLabel", box)
	info.Size = UDim2.new(1, -20, 0, 40)
	info.Position = UDim2.new(0, 10, 0, 54)
	info.BackgroundTransparency = 1
	info.Font = Enum.Font.Gotham
	info.TextSize = 12
	info.TextColor3 = C.subtext
	info.Text = "El executor " .. EXECUTOR_NAME .. " no permite abrir el navegador "
		.. "desde Roblox, pero el link YA está copiado en tu portapapeles."
	info.TextXAlignment = Enum.TextXAlignment.Left
	info.TextYAlignment = Enum.TextYAlignment.Top
	info.TextWrapped = true
	info.ZIndex = 52

	local steps = Instance.new("TextLabel", box)
	steps.Size = UDim2.new(1, -20, 0, 64)
	steps.Position = UDim2.new(0, 10, 0, 100)
	steps.BackgroundColor3 = C.modalStep
	steps.BackgroundTransparency = 0.3
	steps.BorderSizePixel = 0
	steps.Font = Enum.Font.Gotham
	steps.TextSize = 12
	steps.TextColor3 = Color3.fromRGB(220, 220, 230)
	steps.Text = "1. Alt+Tab a tu navegador\n"
		.. "2. Click en la barra de direcciones\n"
		.. "3. Pega con Ctrl+V y dale Enter"
	steps.TextXAlignment = Enum.TextXAlignment.Left
	steps.TextYAlignment = Enum.TextYAlignment.Center
	steps.TextWrapped = true
	steps.ZIndex = 52
	Instance.new("UICorner", steps).CornerRadius = UDim.new(0, 6)
	local stepsPadding = Instance.new("UIPadding", steps)
	stepsPadding.PaddingLeft = UDim.new(0, 10)
	stepsPadding.PaddingRight = UDim.new(0, 10)

	local urlBox = Instance.new("TextBox", box)
	urlBox.Size = UDim2.new(1, -20, 0, 36)
	urlBox.Position = UDim2.new(0, 10, 0, 174)
	urlBox.BackgroundColor3 = C.modalStep
	urlBox.TextColor3 = Color3.fromRGB(120, 200, 255)
	urlBox.Font = Enum.Font.Code
	urlBox.TextSize = 12
	urlBox.Text = url
	urlBox.TextEditable = false
	urlBox.ClearTextOnFocus = false
	urlBox.TextXAlignment = Enum.TextXAlignment.Left
	urlBox.TextTruncate = Enum.TextTruncate.AtEnd
	urlBox.ClipsDescendants = true
	urlBox.BorderSizePixel = 0
	urlBox.ZIndex = 52
	Instance.new("UICorner", urlBox).CornerRadius = UDim.new(0, 6)
	local urlPadding = Instance.new("UIPadding", urlBox)
	urlPadding.PaddingLeft = UDim.new(0, 8)
	urlPadding.PaddingRight = UDim.new(0, 8)

	local copyBtn = Instance.new("TextButton", box)
	copyBtn.Size = UDim2.new(0, 200, 0, 38)
	copyBtn.Position = UDim2.new(0, 10, 1, -48)
	copyBtn.BackgroundColor3 = C.neutral
	copyBtn.Text = "Copiar de nuevo"
	copyBtn.Font = Enum.Font.GothamBold
	copyBtn.TextSize = 14
	copyBtn.TextColor3 = C.text
	copyBtn.BorderSizePixel = 0
	copyBtn.ZIndex = 52
	Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 6)
	copyBtn.MouseButton1Click:Connect(function()
		clipboard(url)
		copyBtn.Text = "✓ Copiado"
		copyBtn.BackgroundColor3 = C.good
		task.delay(1.2, function()
			if copyBtn and copyBtn.Parent then
				copyBtn.Text = "Copiar de nuevo"
				copyBtn.BackgroundColor3 = C.neutral
			end
		end)
	end)

	local mCloseBtn = Instance.new("TextButton", box)
	mCloseBtn.Size = UDim2.new(0, 240, 0, 38)
	mCloseBtn.Position = UDim2.new(1, -250, 1, -48)
	mCloseBtn.BackgroundColor3 = C.good
	mCloseBtn.Text = "Entendido"
	mCloseBtn.Font = Enum.Font.GothamBold
	mCloseBtn.TextSize = 14
	mCloseBtn.TextColor3 = C.text
	mCloseBtn.BorderSizePixel = 0
	mCloseBtn.ZIndex = 52
	Instance.new("UICorner", mCloseBtn).CornerRadius = UDim.new(0, 6)
	mCloseBtn.MouseButton1Click:Connect(function() overlay:Destroy() end)

	overlay.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			local pos = input.Position
			local bp = box.AbsolutePosition
			local bs = box.AbsoluteSize
			if pos.X < bp.X or pos.X > bp.X + bs.X
				or pos.Y < bp.Y or pos.Y > bp.Y + bs.Y then
				overlay:Destroy()
			end
		end
	end)

	clipboard(url)
end

-- ====================== POPUP DE ADVERTENCIA NX ======================
-- Popup modal con 3 niveles (amarillo / naranja / rojo).
-- Se muestra al iniciar si el usuario tiene una entrada en warnings.json.
local function showNXWarning(warning)
	local level   = math.clamp(tonumber(warning.level) or 1, 1, 3)
	local message = tostring(warning.message or "Has recibido un aviso del sistema NX.")

	local LEVELS = {
		[1] = { label = "AVISO",             color = Color3.fromRGB(220, 185, 50)  },
		[2] = { label = "ADVERTENCIA",       color = Color3.fromRGB(230, 120, 40)  },
		[3] = { label = "ADVERTENCIA GRAVE", color = Color3.fromRGB(215, 50,  50)  },
	}
	local ld = LEVELS[level]

	local overlay = Instance.new("Frame", gui)
	overlay.Name                   = "NXWarningOverlay"
	overlay.Size                   = UDim2.new(1, 0, 1, 0)
	overlay.BackgroundColor3       = Color3.fromRGB(0, 0, 0)
	overlay.BackgroundTransparency = 1
	overlay.ZIndex                 = 90
	motionTween(overlay, TweenInfo.new(0.2), { BackgroundTransparency = 0.52 })

	local box = Instance.new("Frame", overlay)
	box.Size             = UDim2.new(0, 440, 0, 0)
	box.AutomaticSize    = Enum.AutomaticSize.Y
	box.AnchorPoint      = Vector2.new(0.5, 0.5)
	box.Position         = UDim2.new(0.5, 0, 0.5, 0)
	box.BackgroundColor3 = C.modalBg
	box.BorderSizePixel  = 0
	box.ClipsDescendants = false
	box.ZIndex           = 91
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 12)
	local wStroke = Instance.new("UIStroke", box)
	wStroke.Color = ld.color; wStroke.Thickness = 2; wStroke.Transparency = 0.12

	local wScale = Instance.new("UIScale", box); wScale.Scale = 0.88
	motionTween(wScale, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })

	local wOuterPad = Instance.new("UIPadding", box)
	wOuterPad.PaddingBottom = UDim.new(0, 20)
	local wLay = Instance.new("UIListLayout", box)
	wLay.Padding = UDim.new(0, 12); wLay.SortOrder = Enum.SortOrder.LayoutOrder
	wLay.HorizontalAlignment = Enum.HorizontalAlignment.Center

	-- Franja superior de color
	local stripe = Instance.new("Frame", box)
	stripe.LayoutOrder           = 0
	stripe.Size                  = UDim2.new(1, 0, 0, 44)
	stripe.BackgroundColor3      = ld.color
	stripe.BackgroundTransparency = 0.78
	stripe.BorderSizePixel       = 0
	Instance.new("UICorner", stripe).CornerRadius = UDim.new(0, 12)
	local stripeLbl = Instance.new("TextLabel", stripe)
	stripeLbl.Size                  = UDim2.new(1, 0, 1, 0)
	stripeLbl.BackgroundTransparency = 1
	stripeLbl.Font                  = Enum.Font.GothamBold
	stripeLbl.TextSize              = 16
	stripeLbl.TextColor3            = ld.color
	stripeLbl.Text                  = "  " .. ld.label

	-- Chip de nivel
	local chip = Instance.new("Frame", box)
	chip.LayoutOrder           = 1
	chip.Size                  = UDim2.new(0, 110, 0, 26)
	chip.BackgroundColor3      = ld.color
	chip.BackgroundTransparency = 0.75
	chip.BorderSizePixel       = 0
	Instance.new("UICorner", chip).CornerRadius = UDim.new(0, 13)
	local chipLbl = Instance.new("TextLabel", chip)
	chipLbl.Size                  = UDim2.new(1, 0, 1, 0)
	chipLbl.BackgroundTransparency = 1
	chipLbl.Font                  = Enum.Font.GothamBold
	chipLbl.TextSize              = 12
	chipLbl.TextColor3            = ld.color
	chipLbl.Text                  = "NIVEL " .. level .. " / 3"

	-- Cuerpo del mensaje
	local msgBox = Instance.new("Frame", box)
	msgBox.LayoutOrder           = 2
	msgBox.Size                  = UDim2.new(1, -40, 0, 0)
	msgBox.AutomaticSize         = Enum.AutomaticSize.Y
	msgBox.BackgroundColor3      = C.card
	msgBox.BackgroundTransparency = 0.3
	msgBox.BorderSizePixel       = 0
	Instance.new("UICorner", msgBox).CornerRadius = UDim.new(0, 8)
	local msgPad = Instance.new("UIPadding", msgBox)
	msgPad.PaddingTop = UDim.new(0, 12); msgPad.PaddingBottom = UDim.new(0, 12)
	msgPad.PaddingLeft = UDim.new(0, 14); msgPad.PaddingRight = UDim.new(0, 14)
	local msgLbl = Instance.new("TextLabel", msgBox)
	msgLbl.Size                  = UDim2.new(1, 0, 0, 0)
	msgLbl.AutomaticSize         = Enum.AutomaticSize.Y
	msgLbl.BackgroundTransparency = 1
	msgLbl.Font                  = Enum.Font.Gotham
	msgLbl.TextSize              = 14
	msgLbl.TextColor3            = C.text
	msgLbl.TextWrapped           = true
	msgLbl.TextXAlignment        = Enum.TextXAlignment.Left
	msgLbl.TextYAlignment        = Enum.TextYAlignment.Top
	msgLbl.Text                  = message

	-- Firma
	local wSign = Instance.new("TextLabel", box)
	wSign.LayoutOrder           = 3
	wSign.Size                  = UDim2.new(1, -40, 0, 16)
	wSign.BackgroundTransparency = 1
	wSign.Font                  = Enum.Font.Gotham
	wSign.TextSize              = 11
	wSign.TextColor3            = C.subtext
	wSign.Text                  = "— NX System  v" .. NXCore.getVersion()
	wSign.TextXAlignment        = Enum.TextXAlignment.Right

	-- Botón cerrar
	local function closeWarn()
		motionTween(wScale, TweenInfo.new(0.14), { Scale = 0.88 })
		motionTween(overlay, TweenInfo.new(0.14), { BackgroundTransparency = 1 })
		task.delay(0.16, function() if overlay.Parent then overlay:Destroy() end end)
	end
	local wClose = Instance.new("TextButton", box)
	wClose.LayoutOrder           = 4
	wClose.Size                  = UDim2.new(1, -40, 0, 38)
	wClose.BackgroundColor3      = ld.color
	wClose.BackgroundTransparency = 0.08
	wClose.Text                  = "Entendido"
	wClose.Font                  = Enum.Font.GothamBold
	wClose.TextSize              = 14
	wClose.TextColor3            = Color3.fromRGB(255, 255, 255)
	wClose.BorderSizePixel       = 0
	Instance.new("UICorner", wClose).CornerRadius = UDim.new(0, 8)
	wClose.MouseButton1Click:Connect(closeWarn)

	overlay.InputBegan:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 then
			local p = inp.Position
			local bp, bs = box.AbsolutePosition, box.AbsoluteSize
			if p.X < bp.X or p.X > bp.X + bs.X or p.Y < bp.Y or p.Y > bp.Y + bs.Y then
				closeWarn()
			end
		end
	end)
end

-- ====================== PANTALLA SIN LICENCIA NX ======================
-- Bloquea el botón de analizar y muestra un overlay de acceso denegado.
-- Solo aparece si el UserId no está en licenses.json (o si está en false).
local function showLicenseDenied()
	analyzeBtn.Active           = false
	analyzeBtn.Text             = "Sin acceso"
	analyzeBtn.BackgroundColor3 = C.neutral
	statusLabel.Text            = "Sin licencia NX."

	local overlay = Instance.new("Frame", gui)
	overlay.Name                   = "NXLicenseDenied"
	overlay.Size                   = UDim2.new(1, 0, 1, 0)
	overlay.BackgroundColor3       = Color3.fromRGB(0, 0, 0)
	overlay.BackgroundTransparency = 0.45
	overlay.ZIndex                 = 88

	local box = Instance.new("Frame", overlay)
	box.Size             = UDim2.new(0, 380, 0, 0)
	box.AutomaticSize    = Enum.AutomaticSize.Y
	box.AnchorPoint      = Vector2.new(0.5, 0.5)
	box.Position         = UDim2.new(0.5, 0, 0.5, 0)
	box.BackgroundColor3 = C.modalBg
	box.BorderSizePixel  = 0
	box.ClipsDescendants = false
	box.ZIndex           = 89
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 12)
	local dStroke = Instance.new("UIStroke", box)
	dStroke.Color = C.bad; dStroke.Thickness = 2; dStroke.Transparency = 0.15

	local dScale = Instance.new("UIScale", box); dScale.Scale = 0.88
	motionTween(dScale, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })

	local dPad = Instance.new("UIPadding", box)
	dPad.PaddingTop = UDim.new(0, 24); dPad.PaddingBottom = UDim.new(0, 24)
	dPad.PaddingLeft = UDim.new(0, 24); dPad.PaddingRight = UDim.new(0, 24)
	local dLay = Instance.new("UIListLayout", box)
	dLay.Padding = UDim.new(0, 10); dLay.SortOrder = Enum.SortOrder.LayoutOrder
	dLay.HorizontalAlignment = Enum.HorizontalAlignment.Center

	local iconFrame = Instance.new("Frame", box)
	iconFrame.LayoutOrder           = 0
	iconFrame.Size                  = UDim2.new(0, 52, 0, 52)
	iconFrame.BackgroundColor3      = C.bad
	iconFrame.BackgroundTransparency = 0.75
	iconFrame.BorderSizePixel       = 0
	Instance.new("UICorner", iconFrame).CornerRadius = UDim.new(0, 26)
	local iconLbl = Instance.new("TextLabel", iconFrame)
	iconLbl.Size                  = UDim2.new(1, 0, 1, 0)
	iconLbl.BackgroundTransparency = 1
	iconLbl.Font                  = Enum.Font.GothamBold
	iconLbl.TextSize              = 22
	iconLbl.TextColor3            = C.bad
	iconLbl.Text                  = "X"

	local deniedTitle = Instance.new("TextLabel", box)
	deniedTitle.LayoutOrder           = 1
	deniedTitle.Size                  = UDim2.new(1, 0, 0, 24)
	deniedTitle.BackgroundTransparency = 1
	deniedTitle.Font                  = Enum.Font.GothamBold
	deniedTitle.TextSize              = 18
	deniedTitle.TextColor3            = C.bad
	deniedTitle.Text                  = "Acceso no autorizado"
	deniedTitle.TextXAlignment        = Enum.TextXAlignment.Center

	local deniedSub = Instance.new("TextLabel", box)
	deniedSub.LayoutOrder           = 2
	deniedSub.Size                  = UDim2.new(1, 0, 0, 0)
	deniedSub.AutomaticSize         = Enum.AutomaticSize.Y
	deniedSub.BackgroundTransparency = 1
	deniedSub.Font                  = Enum.Font.Gotham
	deniedSub.TextSize              = 13
	deniedSub.TextColor3            = C.subtext
	deniedSub.TextWrapped           = true
	deniedSub.TextXAlignment        = Enum.TextXAlignment.Center
	deniedSub.Text = "Tu cuenta (" .. tostring(player.UserId)
		.. ") no está en la lista de licencias.\n\nContacta con un administrador si crees que es un error."

	local idRow = Instance.new("Frame", box)
	idRow.LayoutOrder      = 3
	idRow.Size             = UDim2.new(1, 0, 0, 30)
	idRow.BackgroundColor3 = C.neutral
	idRow.BorderSizePixel  = 0
	Instance.new("UICorner", idRow).CornerRadius = UDim.new(0, 6)
	local idLbl = Instance.new("TextLabel", idRow)
	idLbl.Size                  = UDim2.new(1, -76, 1, 0)
	idLbl.Position              = UDim2.new(0, 10, 0, 0)
	idLbl.BackgroundTransparency = 1
	idLbl.Font                  = Enum.Font.Code
	idLbl.TextSize              = 13
	idLbl.TextColor3            = C.text
	idLbl.TextXAlignment        = Enum.TextXAlignment.Left
	idLbl.Text                  = "UserId: " .. tostring(player.UserId)
	local copyIdBtn = Instance.new("TextButton", idRow)
	copyIdBtn.Size             = UDim2.new(0, 64, 1, -8)
	copyIdBtn.Position         = UDim2.new(1, -68, 0, 4)
	copyIdBtn.BackgroundColor3 = C.accent
	copyIdBtn.Text             = "Copiar"
	copyIdBtn.Font             = Enum.Font.GothamBold
	copyIdBtn.TextSize         = 12
	copyIdBtn.TextColor3       = C.onAccent
	copyIdBtn.BorderSizePixel  = 0
	Instance.new("UICorner", copyIdBtn).CornerRadius = UDim.new(0, 4)
	copyIdBtn.MouseButton1Click:Connect(function()
		clipboard(tostring(player.UserId))
		copyIdBtn.Text = "OK"
		task.delay(1.2, function() if copyIdBtn.Parent then copyIdBtn.Text = "Copiar" end end)
	end)

	local deniedSign = Instance.new("TextLabel", box)
	deniedSign.LayoutOrder           = 4
	deniedSign.Size                  = UDim2.new(1, 0, 0, 14)
	deniedSign.BackgroundTransparency = 1
	deniedSign.Font                  = Enum.Font.Gotham
	deniedSign.TextSize              = 11
	deniedSign.TextColor3            = C.subtext
	deniedSign.Text                  = "NX System  v" .. NXCore.getVersion()
	deniedSign.TextXAlignment        = Enum.TextXAlignment.Center
end

-- ====================== VISOR DE PERSONAJE (3D + 2D) ======================
local function showCharacterModal(userId, username)
	local prev = gui:FindFirstChild("CharModal")
	if prev then prev:Destroy() end

	local overlay = Instance.new("Frame", gui)
	overlay.Name = "CharModal"
	overlay.Size = UDim2.new(1, 0, 1, 0)
	overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	overlay.BackgroundTransparency = 1
	overlay.BorderSizePixel = 0
	overlay.ZIndex = 60
	motionTween(overlay, TweenInfo.new(0.18), { BackgroundTransparency = 0.35 })

	local box = Instance.new("Frame", overlay)
	box.Size = UDim2.new(0, 380, 0, 460)
	box.AnchorPoint = Vector2.new(0.5, 0.5)
	box.Position = UDim2.new(0.5, 0, 0.5, 0)
	box.BackgroundColor3 = C.modalBg
	box.BorderSizePixel = 0
	box.ClipsDescendants = true
	box.ZIndex = 61
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 12)
	local bs = Instance.new("UIStroke", box)
	bs.Color = C.accent; bs.Transparency = 0.4; bs.Thickness = 1.5
	addDropShadow(box, overlay, 60, 30, 0.4)
	local scale = Instance.new("UIScale", box)
	scale.Scale = 0.85
	motionTween(scale, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
		{ Scale = 1 })

	local function closeModal()
		motionTween(scale, TweenInfo.new(0.13), { Scale = 0.85 })
		motionTween(overlay, TweenInfo.new(0.13), { BackgroundTransparency = 1 })
		task.delay(0.15, function() if overlay and overlay.Parent then overlay:Destroy() end end)
	end

	local mtitle = Instance.new("TextLabel", box)
	mtitle.Size = UDim2.new(1, -50, 0, 30)
	mtitle.Position = UDim2.new(0, 14, 0, 10)
	mtitle.BackgroundTransparency = 1
	mtitle.Font = Enum.Font.GothamBold
	mtitle.TextSize = 16
	mtitle.TextColor3 = C.accent
	mtitle.Text = "Avatar de " .. tostring(username)
	mtitle.TextXAlignment = Enum.TextXAlignment.Left
	mtitle.TextTruncate = Enum.TextTruncate.AtEnd
	mtitle.ZIndex = 62

	local mClose = Instance.new("TextButton", box)
	mClose.Size = UDim2.new(0, 26, 0, 26)
	mClose.Position = UDim2.new(1, -34, 0, 10)
	mClose.BackgroundColor3 = C.neutral
	mClose.Text = "X"
	mClose.Font = Enum.Font.GothamBold
	mClose.TextSize = 14
	mClose.TextColor3 = C.text
	mClose.BorderSizePixel = 0
	mClose.ZIndex = 62
	Instance.new("UICorner", mClose).CornerRadius = UDim.new(0, 6)
	mClose.MouseButton1Click:Connect(closeModal)

	local canvas = Instance.new("Frame", box)
	canvas.Size = UDim2.new(1, -28, 1, -56)
	canvas.Position = UDim2.new(0, 14, 0, 46)
	canvas.BackgroundColor3 = C.card
	canvas.BorderSizePixel = 0
	canvas.ClipsDescendants = true
	canvas.ZIndex = 61
	Instance.new("UICorner", canvas).CornerRadius = UDim.new(0, 8)

	-- Vista 2D (miniaturas oficiales): cuerpo / busto / cabeza
	local img2D = Instance.new("ImageLabel", canvas)
	img2D.Size = UDim2.new(1, -20, 1, -50)
	img2D.Position = UDim2.new(0, 10, 0, 10)
	img2D.BackgroundTransparency = 1
	img2D.ScaleType = Enum.ScaleType.Fit
	img2D.ZIndex = 62

	local subBar = Instance.new("Frame", canvas)
	subBar.Size = UDim2.new(1, -20, 0, 28)
	subBar.Position = UDim2.new(0, 10, 1, -36)
	subBar.BackgroundTransparency = 1
	subBar.ZIndex = 63

	local sub2DButtons = {}
	local function set2DKind(kind, btn)
		img2D.Image = ("rbxthumb://type=%s&id=%d&w=420&h=420"):format(kind, userId)
		for _, b in ipairs(sub2DButtons) do
			b.BackgroundColor3 = C.neutral
			b.TextColor3 = C.text
		end
		btn.BackgroundColor3 = C.accent
		btn.TextColor3 = C.onAccent
	end

	local kinds = { {"Cuerpo", "Avatar"}, {"Busto", "AvatarBust"}, {"Cabeza", "AvatarHeadShot"} }
	for i, k in ipairs(kinds) do
		local b = Instance.new("TextButton", subBar)
		b.Size = UDim2.new(0, 86, 1, 0)
		b.Position = UDim2.new(0, (i - 1) * 92, 0, 0)
		b.BackgroundColor3 = C.neutral
		b.Text = k[1]
		b.Font = Enum.Font.GothamBold
		b.TextSize = 12
		b.TextColor3 = C.text
		b.BorderSizePixel = 0
		b.ZIndex = 64
		Instance.new("UICorner", b).CornerRadius = UDim.new(0, 5)
		table.insert(sub2DButtons, b)
		b.MouseButton1Click:Connect(function() set2DKind(k[2], b) end)
	end
	set2DKind("Avatar", sub2DButtons[1])   -- cuerpo entero por defecto

	overlay.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			local pos = input.Position
			local bp = box.AbsolutePosition
			local bsz = box.AbsoluteSize
			if pos.X < bp.X or pos.X > bp.X + bsz.X
				or pos.Y < bp.Y or pos.Y > bp.Y + bsz.Y then
				closeModal()
			end
		end
	end)
end

-- ====================== RENDER: FILA NORMAL ======================
local function addRow(parent, label, value, copyable, valueColor)
	local frame = Instance.new("Frame", parent)
	frame.Size = UDim2.new(1, -4, 0, 28)
	frame.BackgroundColor3 = C.card
	frame.BorderSizePixel = 0
	frame.ClipsDescendants = true
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 4)

	local lbl = Instance.new("TextLabel", frame)
	lbl.Size = UDim2.new(0.42, -10, 1, 0)
	lbl.Position = UDim2.new(0, 10, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Font = Enum.Font.Gotham
	lbl.TextSize = 13
	lbl.TextColor3 = C.subtext
	lbl.Text = label
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.TextTruncate = Enum.TextTruncate.AtEnd

	local valWidthOffset = copyable and -78 or -10
	local val = Instance.new("TextLabel", frame)
	val.Size = UDim2.new(0.58, valWidthOffset, 1, 0)
	val.Position = UDim2.new(0.42, 0, 0, 0)
	val.BackgroundTransparency = 1
	val.Font = Enum.Font.GothamBold
	val.TextSize = 13
	val.TextColor3 = valueColor or C.text
	val.Text = tostring(value == nil and "No disponible" or value)
	val.TextXAlignment = Enum.TextXAlignment.Right
	val.TextTruncate = Enum.TextTruncate.AtEnd

	if copyable then
		local cp = Instance.new("TextButton", frame)
		cp.Size = UDim2.new(0, 60, 0, 20)
		cp.Position = UDim2.new(1, -66, 0.5, -10)
		cp.BackgroundColor3 = C.accent
		cp.Text = "Copiar"
		cp.Font = Enum.Font.GothamBold
		cp.TextSize = 11
		cp.TextColor3 = C.onAccent
		cp.BorderSizePixel = 0
		cp.ZIndex = 2
		Instance.new("UICorner", cp).CornerRadius = UDim.new(0, 4)
		cp.MouseButton1Click:Connect(function()
			clipboard(tostring(value))
			statusLabel.Text = "Copiado: " .. label
			cp.Text = "✓"
			task.delay(1, function() if cp and cp.Parent then cp.Text = "Copiar" end end)
		end)
	end
	return frame
end

-- ====================== RENDER: DESCRIPCIÓN EXPANDIBLE ======================
-- La cabecera lleva contador de caracteres y botón COPIAR. El botón copia
-- SIEMPRE el texto completo, aunque en pantalla se vea recortado por el
-- plegado (usa 'text', no 'body.Text').
local function addDescription(parent, text)
	text = tostring(text or "Sin descripción")
	-- Una descripción vacía es un estado legítimo; ahí no hay nada que copiar.
	local vacia = (text == "" or text == "Sin descripción" or text == "No disponible")

	local card = Instance.new("Frame", parent)
	card.Size = UDim2.new(1, -4, 0, 0)
	card.AutomaticSize = Enum.AutomaticSize.Y
	card.BackgroundColor3 = C.card
	card.BorderSizePixel = 0
	card.ClipsDescendants = true
	Instance.new("UICorner", card).CornerRadius = UDim.new(0, 4)
	themed(card, "BackgroundColor3", "card")
	local pad = Instance.new("UIPadding", card)
	pad.PaddingTop = UDim.new(0, 8); pad.PaddingBottom = UDim.new(0, 8)
	pad.PaddingLeft = UDim.new(0, 10); pad.PaddingRight = UDim.new(0, 10)
	local layout = Instance.new("UIListLayout", card)
	layout.Padding = UDim.new(0, 4)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	-- Cabecera: título · contador · botón copiar (posicionados dentro de la fila,
	-- no en el UIListLayout de la tarjeta, para que queden en la misma línea).
	local headRow = Instance.new("Frame", card)
	headRow.LayoutOrder = 0
	headRow.Size = UDim2.new(1, 0, 0, 20)
	headRow.BackgroundTransparency = 1

	local head = Instance.new("TextLabel", headRow)
	head.Size = UDim2.new(1, -150, 1, 0)
	head.BackgroundTransparency = 1
	head.Font = Enum.Font.GothamBold
	head.TextSize = 13
	head.TextColor3 = C.subtext
	head.Text = "Descripción"
	head.TextXAlignment = Enum.TextXAlignment.Left
	head.TextTruncate = Enum.TextTruncate.AtEnd
	themed(head, "TextColor3", "subtext")

	local meta = Instance.new("TextLabel", headRow)
	meta.Size = UDim2.new(0, 70, 1, 0)
	meta.Position = UDim2.new(1, -142, 0, 0)
	meta.BackgroundTransparency = 1
	meta.Font = Enum.Font.Gotham
	meta.TextSize = 11
	meta.TextColor3 = C.subtext
	meta.Text = vacia and "vacía" or (#text .. " car.")
	meta.TextXAlignment = Enum.TextXAlignment.Right
	themed(meta, "TextColor3", "subtext")

	local copyDesc = Instance.new("TextButton", headRow)
	copyDesc.Size = UDim2.new(0, 66, 0, 20)
	copyDesc.Position = UDim2.new(1, -66, 0, 0)
	copyDesc.BackgroundColor3 = vacia and C.neutral or C.accent
	copyDesc.Text = "Copiar"
	copyDesc.Font = Enum.Font.GothamBold
	copyDesc.TextSize = 11
	copyDesc.TextColor3 = vacia and C.subtext or C.onAccent
	copyDesc.BorderSizePixel = 0
	copyDesc.AutoButtonColor = false
	copyDesc.ZIndex = 2
	Instance.new("UICorner", copyDesc).CornerRadius = UDim.new(0, 4)
	themed(copyDesc, "BackgroundColor3", vacia and "neutral" or "accent")
	themed(copyDesc, "TextColor3", vacia and "subtext" or "onAccent")
	copyDesc.MouseButton1Click:Connect(function()
		if vacia then
			statusLabel.Text = "Este usuario no tiene descripción"
			return
		end
		clipboard(text)              -- SIEMPRE el texto completo, no el recortado
		statusLabel.Text = "Copiado: descripción (" .. #text .. " caracteres)"
		copyDesc.Text = "✓ Copiado"
		task.delay(1.2, function()
			if copyDesc and copyDesc.Parent then copyDesc.Text = "Copiar" end
		end)
	end)

	local body = Instance.new("TextLabel", card)
	body.LayoutOrder = 1
	body.Size = UDim2.new(1, 0, 0, 0)
	body.AutomaticSize = Enum.AutomaticSize.Y
	body.BackgroundTransparency = 1
	body.Font = Enum.Font.Gotham
	body.TextSize = 13
	body.TextColor3 = C.text
	body.TextWrapped = true
	body.TextXAlignment = Enum.TextXAlignment.Left
	body.TextYAlignment = Enum.TextYAlignment.Top
	body.Text = text
	themed(body, "TextColor3", "text")

	local COLLAPSED = 160
	local isLong = #text > COLLAPSED
	local expanded = false

	local function refresh()
		if (not isLong) or expanded then
			body.Text = text
		else
			body.Text = text:sub(1, COLLAPSED) .. "..."
		end
	end
	refresh()

	if isLong then
		local toggle = Instance.new("TextButton", card)
		toggle.LayoutOrder = 2
		toggle.Size = UDim2.new(0, 120, 0, 22)
		toggle.BackgroundColor3 = C.accent
		toggle.Text = "Mostrar más"
		toggle.Font = Enum.Font.GothamBold
		toggle.TextSize = 12
		toggle.TextColor3 = C.onAccent
		toggle.BorderSizePixel = 0
		toggle.AutoButtonColor = false
		Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 4)
		themed(toggle, "BackgroundColor3", "accent")
		themed(toggle, "TextColor3", "onAccent")
		toggle.MouseButton1Click:Connect(function()
			expanded = not expanded
			toggle.Text = expanded and "Mostrar menos" or "Mostrar más"
			refresh()
		end)
	end
	return card
end

-- ====================== RENDER: TARJETA DE TEXTO (Análisis) ======================
local function addNoteCard(parent, titleText, bodyText, accentColor)
	local card = Instance.new("Frame", parent)
	card.Size = UDim2.new(1, -4, 0, 0)
	card.AutomaticSize = Enum.AutomaticSize.Y
	card.BackgroundColor3 = C.card
	card.BorderSizePixel = 0
	card.ClipsDescendants = true
	Instance.new("UICorner", card).CornerRadius = UDim.new(0, 4)
	local barStroke = Instance.new("UIStroke", card)
	barStroke.Color = accentColor or C.accent
	barStroke.Transparency = 0.4
	local pad = Instance.new("UIPadding", card)
	pad.PaddingTop = UDim.new(0, 8); pad.PaddingBottom = UDim.new(0, 8)
	pad.PaddingLeft = UDim.new(0, 10); pad.PaddingRight = UDim.new(0, 10)
	local layout = Instance.new("UIListLayout", card)
	layout.Padding = UDim.new(0, 4)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	local h = Instance.new("TextLabel", card)
	h.LayoutOrder = 0
	h.Size = UDim2.new(1, 0, 0, 20)
	h.BackgroundTransparency = 1
	h.Font = Enum.Font.GothamBold
	h.TextSize = 14
	h.TextColor3 = accentColor or C.accent
	h.Text = titleText
	h.TextXAlignment = Enum.TextXAlignment.Left

	local b = Instance.new("TextLabel", card)
	b.LayoutOrder = 1
	b.Size = UDim2.new(1, 0, 0, 0)
	b.AutomaticSize = Enum.AutomaticSize.Y
	b.BackgroundTransparency = 1
	b.Font = Enum.Font.Gotham
	b.TextSize = 13
	b.TextColor3 = C.text
	b.TextWrapped = true
	b.TextXAlignment = Enum.TextXAlignment.Left
	b.TextYAlignment = Enum.TextYAlignment.Top
	b.Text = bodyText
	return card
end

-- Barra normalizada 0-100. Devuelve (row, fill, valLabel) para actualizar luego.
local function addScoreBar(parent, label, score, levelTxt, color, order)
	local row = Instance.new("Frame", parent)
	row.LayoutOrder = order
	row.Size = UDim2.new(1, 0, 0, 26)
	row.BackgroundTransparency = 1

	local lab = Instance.new("TextLabel", row)
	lab.Size = UDim2.new(0, 88, 1, 0)
	lab.BackgroundTransparency = 1
	lab.Font = Enum.Font.Gotham
	lab.TextSize = 12
	lab.TextColor3 = C.subtext
	lab.Text = label
	lab.TextXAlignment = Enum.TextXAlignment.Left

	local track_ = Instance.new("Frame", row)
	track_.Position = UDim2.new(0, 92, 0.5, -7)
	track_.Size = UDim2.new(1, -210, 0, 14)
	track_.BackgroundColor3 = C.neutral
	track_.BorderSizePixel = 0
	Instance.new("UICorner", track_).CornerRadius = UDim.new(0, 4)

	local fill = Instance.new("Frame", track_)
	fill.Size = UDim2.new(0, 0, 1, 0)        -- arranca en 0 y se anima
	fill.BackgroundColor3 = color
	fill.BorderSizePixel = 0
	Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 4)
	-- barra de progreso animada
	motionTween(fill, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
		{ Size = UDim2.new(math.clamp(score / 100, 0, 1), 0, 1, 0) })

	local val = Instance.new("TextLabel", row)
	val.Position = UDim2.new(1, -112, 0, 0)
	val.Size = UDim2.new(0, 112, 1, 0)
	val.BackgroundTransparency = 1
	val.Font = Enum.Font.GothamBold
	val.TextSize = 12
	val.TextColor3 = color
	val.Text = string.format("%d%% · %s", score, levelTxt)
	val.TextXAlignment = Enum.TextXAlignment.Right
	return row, fill, val
end

local function clearScroll(sf)
	for _, c in ipairs(sf:GetChildren()) do
		if not c:IsA("UIListLayout") and not c:IsA("UIPadding") then c:Destroy() end
	end
end

-- ====================== RESOLVER NOMBRES EN LOTE ======================
-- La lista de amigos a veces NO trae name/displayName (datos parciales sin
-- sesión). Este endpoint (IDs -> usuarios) sí los devuelve siempre. Lo
-- pedimos en lotes de 100. Es la razón por la que antes salían vacíos.
-- Sin `local`: se ASIGNA a la forward-declaración de arriba (junto a
-- getMutualFriends), que la usa antes de este punto del archivo.
function resolveNames(ids)
	local map = {}
	local chunk = {}
	local function flush()
		if #chunk == 0 then return end
		local res = apiPost("https://users.roblox.com/v1/users", {
			userIds = chunk, excludeBannedUsers = false,
		})
		if res and res.data then
			for _, u in ipairs(res.data) do
				map[u.id] = { name = u.name, displayName = u.displayName, verified = u.hasVerifiedBadge }
			end
		end
		chunk = {}
	end
	for _, id in ipairs(ids) do
		table.insert(chunk, id)
		if #chunk >= 100 then flush() end
	end
	flush()
	return map
end

-- ====================== TARJETA MODAL (mini-perfil animado) ======================
-- Tarjeta vertical moderna que se abre con animación (escala + fade) al pulsar
-- "Analizar →" en un amigo. Muestra avatar, Display Name, @usuario (con copiar),
-- descripción, amigos y edad de cuenta. Carga los datos en segundo plano.
local function showMiniProfileCard(userId, fallback)
	fallback = fallback or {}
	local prev = gui:FindFirstChild("MiniCard")
	if prev then prev:Destroy() end

	local overlay = Instance.new("Frame", gui)
	overlay.Name = "MiniCard"
	overlay.Size = UDim2.new(1, 0, 1, 0)
	overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	overlay.BackgroundTransparency = 1
	overlay.BorderSizePixel = 0
	overlay.ZIndex = 70
	motionTween(overlay, TweenInfo.new(0.2), { BackgroundTransparency = 0.45 })

	local card = Instance.new("Frame", overlay)
	card.Size = UDim2.new(0, 320, 0, 486)
	card.AnchorPoint = Vector2.new(0.5, 0.5)
	card.Position = UDim2.new(0.5, 0, 0.5, 0)
	card.BackgroundColor3 = C.modalBg
	card.BorderSizePixel = 0
	card.ClipsDescendants = true
	card.ZIndex = 71
	Instance.new("UICorner", card).CornerRadius = UDim.new(0, 14)
	local cstroke = Instance.new("UIStroke", card)
	cstroke.Color = C.accent; cstroke.Transparency = 0.4; cstroke.Thickness = 1.5
	addDropShadow(card, overlay, 70, 30, 0.4)
	local scale = Instance.new("UIScale", card)
	scale.Scale = 0.85
	motionTween(scale, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
		{ Scale = 1 })

	local function closeCard()
		motionTween(scale, TweenInfo.new(0.14), { Scale = 0.85 })
		motionTween(overlay, TweenInfo.new(0.14), { BackgroundTransparency = 1 })
		task.delay(0.16, function() if overlay and overlay.Parent then overlay:Destroy() end end)
	end

	-- contenido (UIListLayout vertical). La X va fuera del layout.
	local body = Instance.new("Frame", card)
	body.Size = UDim2.new(1, 0, 1, 0)
	body.BackgroundTransparency = 1
	body.ZIndex = 72
	local pad = Instance.new("UIPadding", body)
	pad.PaddingTop = UDim.new(0, 16); pad.PaddingBottom = UDim.new(0, 14)
	pad.PaddingLeft = UDim.new(0, 14); pad.PaddingRight = UDim.new(0, 14)
	local lay = Instance.new("UIListLayout", body)
	lay.Padding = UDim.new(0, 7); lay.SortOrder = Enum.SortOrder.LayoutOrder
	lay.HorizontalAlignment = Enum.HorizontalAlignment.Center

	local xBtn = Instance.new("TextButton", card)
	xBtn.Size = UDim2.new(0, 26, 0, 26)
	xBtn.Position = UDim2.new(1, -32, 0, 6)
	xBtn.BackgroundColor3 = C.neutral
	xBtn.Text = "X"
	xBtn.Font = Enum.Font.GothamBold
	xBtn.TextSize = 14
	xBtn.TextColor3 = C.text
	xBtn.BorderSizePixel = 0
	xBtn.ZIndex = 74
	Instance.new("UICorner", xBtn).CornerRadius = UDim.new(0, 6)
	xBtn.MouseButton1Click:Connect(closeCard)

	-- avatar (cuerpo completo)
	local avatar = Instance.new("ImageLabel", body)
	avatar.LayoutOrder = 0
	avatar.Size = UDim2.new(0, 150, 0, 150)
	avatar.BackgroundColor3 = C.card
	avatar.BorderSizePixel = 0
	avatar.Image = ("rbxthumb://type=Avatar&id=%d&w=420&h=420"):format(userId)
	avatar.ZIndex = 72
	Instance.new("UICorner", avatar).CornerRadius = UDim.new(0, 12)

	local dispLbl = Instance.new("TextLabel", body)
	dispLbl.LayoutOrder = 1
	dispLbl.Size = UDim2.new(1, 0, 0, 24)
	dispLbl.BackgroundTransparency = 1
	dispLbl.Font = Enum.Font.GothamBold
	dispLbl.TextSize = 18
	dispLbl.TextColor3 = C.text
	dispLbl.Text = fallback.displayName or fallback.name or "Cargando..."
	dispLbl.TextXAlignment = Enum.TextXAlignment.Center
	dispLbl.TextTruncate = Enum.TextTruncate.AtEnd
	dispLbl.ZIndex = 72

	local userLbl = Instance.new("TextLabel", body)
	userLbl.LayoutOrder = 2
	userLbl.Size = UDim2.new(1, 0, 0, 16)
	userLbl.BackgroundTransparency = 1
	userLbl.Font = Enum.Font.Gotham
	userLbl.TextSize = 13
	userLbl.TextColor3 = C.subtext
	userLbl.Text = "@" .. (fallback.name or "...")
	userLbl.TextXAlignment = Enum.TextXAlignment.Center
	userLbl.TextTruncate = Enum.TextTruncate.AtEnd
	userLbl.ZIndex = 72

	local resolvedUser = fallback.name or tostring(userId)
	-- Fila de dos botones: copiar @usuario y copiar la descripción completa.
	-- (La descripción llega asíncrona más abajo; el botón lee 'resolvedDesc',
	--  que se rellena cuando responde la API.)
	local resolvedDesc = nil
	local btnRow = Instance.new("Frame", body)
	btnRow.LayoutOrder = 3
	btnRow.Size = UDim2.new(1, 0, 0, 28)
	btnRow.BackgroundTransparency = 1
	btnRow.ZIndex = 72
	local btnLay = Instance.new("UIListLayout", btnRow)
	btnLay.FillDirection = Enum.FillDirection.Horizontal
	btnLay.Padding = UDim.new(0, 6)
	btnLay.HorizontalAlignment = Enum.HorizontalAlignment.Center
	btnLay.SortOrder = Enum.SortOrder.LayoutOrder

	local copyBtn = Instance.new("TextButton", btnRow)
	copyBtn.LayoutOrder = 1
	copyBtn.Size = UDim2.new(0, 138, 0, 28)
	copyBtn.BackgroundColor3 = C.accent
	copyBtn.Text = "Copiar usuario"
	copyBtn.Font = Enum.Font.GothamBold
	copyBtn.TextSize = 12
	copyBtn.TextColor3 = C.onAccent
	copyBtn.BorderSizePixel = 0
	copyBtn.AutoButtonColor = false
	copyBtn.ZIndex = 72
	Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 6)
	copyBtn.MouseButton1Click:Connect(function()
		clipboard(resolvedUser)
		copyBtn.Text = "✓ Copiado"
		task.delay(1.1, function() if copyBtn and copyBtn.Parent then copyBtn.Text = "Copiar usuario" end end)
	end)

	local copyDescBtn = Instance.new("TextButton", btnRow)
	copyDescBtn.LayoutOrder = 2
	copyDescBtn.Size = UDim2.new(0, 148, 0, 28)
	copyDescBtn.BackgroundColor3 = C.neutral
	copyDescBtn.Text = "Copiar descripción"
	copyDescBtn.Font = Enum.Font.GothamBold
	copyDescBtn.TextSize = 12
	copyDescBtn.TextColor3 = C.text
	copyDescBtn.BorderSizePixel = 0
	copyDescBtn.AutoButtonColor = false
	copyDescBtn.ZIndex = 72
	Instance.new("UICorner", copyDescBtn).CornerRadius = UDim.new(0, 6)
	copyDescBtn.MouseButton1Click:Connect(function()
		if not resolvedDesc or resolvedDesc == "" then
			copyDescBtn.Text = "Sin descripción"
			task.delay(1.3, function()
				if copyDescBtn and copyDescBtn.Parent then copyDescBtn.Text = "Copiar descripción" end
			end)
			return
		end
		clipboard(resolvedDesc)
		copyDescBtn.Text = "✓ Copiado"
		task.delay(1.1, function()
			if copyDescBtn and copyDescBtn.Parent then copyDescBtn.Text = "Copiar descripción" end
		end)
	end)

	local divider = Instance.new("Frame", body)
	divider.LayoutOrder = 4
	divider.Size = UDim2.new(1, 0, 0, 1)
	divider.BackgroundColor3 = C.border
	divider.BorderSizePixel = 0
	divider.ZIndex = 72

	-- descripción (altura fija, con scroll si es larga)
	local descBox = Instance.new("ScrollingFrame", body)
	descBox.LayoutOrder = 5
	descBox.Size = UDim2.new(1, 0, 0, 70)
	descBox.BackgroundColor3 = C.card
	descBox.BackgroundTransparency = 0.4
	descBox.BorderSizePixel = 0
	descBox.ScrollBarThickness = 3
	descBox.ScrollBarImageColor3 = C.accent
	descBox.CanvasSize = UDim2.new(0, 0, 0, 0)
	descBox.AutomaticCanvasSize = Enum.AutomaticSize.Y
	descBox.ZIndex = 72
	Instance.new("UICorner", descBox).CornerRadius = UDim.new(0, 6)
	local descPad = Instance.new("UIPadding", descBox)
	descPad.PaddingTop = UDim.new(0, 6); descPad.PaddingBottom = UDim.new(0, 6)
	descPad.PaddingLeft = UDim.new(0, 8); descPad.PaddingRight = UDim.new(0, 8)
	local descLbl = Instance.new("TextLabel", descBox)
	descLbl.Size = UDim2.new(1, 0, 0, 0)
	descLbl.AutomaticSize = Enum.AutomaticSize.Y
	descLbl.BackgroundTransparency = 1
	descLbl.Font = Enum.Font.Gotham
	descLbl.TextSize = 12
	descLbl.TextColor3 = C.text
	descLbl.TextWrapped = true
	descLbl.TextXAlignment = Enum.TextXAlignment.Left
	descLbl.TextYAlignment = Enum.TextYAlignment.Top
	descLbl.Text = "Cargando descripción..."
	descLbl.ZIndex = 72

	-- filas de info (Amigos, Edad de cuenta, Verificado)
	local function infoRow(orderN, label)
		local row = Instance.new("Frame", body)
		row.LayoutOrder = orderN
		row.Size = UDim2.new(1, 0, 0, 22)
		row.BackgroundTransparency = 1
		row.ZIndex = 72
		local l = Instance.new("TextLabel", row)
		l.Size = UDim2.new(0.5, 0, 1, 0)
		l.BackgroundTransparency = 1
		l.Font = Enum.Font.Gotham; l.TextSize = 12; l.TextColor3 = C.subtext
		l.Text = label; l.TextXAlignment = Enum.TextXAlignment.Left; l.ZIndex = 72
		local v = Instance.new("TextLabel", row)
		v.Size = UDim2.new(0.5, 0, 1, 0); v.Position = UDim2.new(0.5, 0, 0, 0)
		v.BackgroundTransparency = 1
		v.Font = Enum.Font.GothamBold; v.TextSize = 12; v.TextColor3 = C.text
		v.Text = "..."; v.TextXAlignment = Enum.TextXAlignment.Right
		v.TextTruncate = Enum.TextTruncate.AtEnd; v.ZIndex = 72
		return v
	end
	local friendsVal = infoRow(6, "Amigos")
	local ageVal = infoRow(7, "Edad de cuenta")
	local verVal = infoRow(8, "Verificado")

	-- botón análisis completo (reusa el flujo existente)
	local fullBtn = Instance.new("TextButton", body)
	fullBtn.LayoutOrder = 9
	fullBtn.Size = UDim2.new(1, 0, 0, 30)
	fullBtn.BackgroundColor3 = C.neutral
	fullBtn.Text = "Análisis completo →"
	fullBtn.Font = Enum.Font.GothamBold
	fullBtn.TextSize = 13
	fullBtn.TextColor3 = C.text
	fullBtn.BorderSizePixel = 0
	fullBtn.ZIndex = 72
	Instance.new("UICorner", fullBtn).CornerRadius = UDim.new(0, 6)
	fullBtn.MouseButton1Click:Connect(function()
		closeCard()
		searchBox.Text = resolvedUser
		showPage(profilePage)
		if analyze then analyze(tostring(userId)) end
	end)

	-- clic fuera de la tarjeta = cerrar
	overlay.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			local p = input.Position
			local bp = card.AbsolutePosition
			local bs = card.AbsoluteSize
			if p.X < bp.X or p.X > bp.X + bs.X or p.Y < bp.Y or p.Y > bp.Y + bs.Y then
				closeCard()
			end
		end
	end)

	-- cargar datos en segundo plano
	task.spawn(function()
		local prof = apiGet("https://users.roblox.com/v1/users/" .. userId)
		local fc = apiGet("https://friends.roblox.com/v1/users/" .. userId .. "/friends/count")
		if not overlay.Parent then return end
		if prof then
			resolvedUser = prof.name or resolvedUser
			dispLbl.Text = prof.displayName or prof.name or ("ID " .. userId)
			userLbl.Text = "@" .. (prof.name or "?")
			resolvedDesc = (prof.description and prof.description ~= "" and prof.description) or nil
			descLbl.Text = resolvedDesc or "Sin descripción"
			verVal.Text = prof.hasVerifiedBadge and "Sí" or "No"
			local _, ageLabel = formatAge(prof.created)
			ageVal.Text = ageLabel or "No disponible"
		else
			descLbl.Text = "No disponible."
		end
		friendsVal.Text = (fc and fc.count ~= nil) and tostring(fc.count) or "?"
	end)
end

-- ====================== DESPLEGABLE DE AMIGOS (en Estadísticas) ======================
-- La fila "Amigos" es un botón: al pulsarlo se despliega hacia abajo la lista
-- de amigos con animación suave (y se cierra al volver a pulsar). Carga perezosa
-- + nombres resueltos en lote. Cada amigo abre la tarjeta modal al pulsarlo.
local function addFriendsDropdown(parent, data, order)
	local MAXH = 300
	local userId = data.UserId

	local container = Instance.new("Frame", parent)
	container.LayoutOrder = order
	container.Size = UDim2.new(1, -4, 0, 0)
	container.AutomaticSize = Enum.AutomaticSize.Y
	container.BackgroundTransparency = 1
	local clay = Instance.new("UIListLayout", container)
	clay.Padding = UDim.new(0, 4); clay.SortOrder = Enum.SortOrder.LayoutOrder

	local header = Instance.new("TextButton", container)
	header.LayoutOrder = 0
	header.Size = UDim2.new(1, 0, 0, 28)
	header.BackgroundColor3 = C.card
	header.AutoButtonColor = false
	header.Text = ""
	header.BorderSizePixel = 0
	Instance.new("UICorner", header).CornerRadius = UDim.new(0, 4)

	local hName = Instance.new("TextLabel", header)
	hName.Size = UDim2.new(0.5, -10, 1, 0); hName.Position = UDim2.new(0, 10, 0, 0)
	hName.BackgroundTransparency = 1; hName.Font = Enum.Font.Gotham; hName.TextSize = 13
	hName.TextColor3 = C.subtext; hName.Text = "Amigos"; hName.TextXAlignment = Enum.TextXAlignment.Left

	local hVal = Instance.new("TextLabel", header)
	hVal.Size = UDim2.new(0.5, -38, 1, 0); hVal.Position = UDim2.new(0.5, 0, 0, 0)
	hVal.BackgroundTransparency = 1; hVal.Font = Enum.Font.GothamBold; hVal.TextSize = 13
	hVal.TextColor3 = C.text
	hVal.Text = tostring(data.Friends == nil and "No disponible" or data.Friends)
	hVal.TextXAlignment = Enum.TextXAlignment.Right; hVal.TextTruncate = Enum.TextTruncate.AtEnd

	local chevron = Instance.new("TextLabel", header)
	chevron.Size = UDim2.new(0, 26, 1, 0); chevron.Position = UDim2.new(1, -28, 0, 0)
	chevron.BackgroundTransparency = 1; chevron.Font = Enum.Font.GothamBold; chevron.TextSize = 12
	chevron.TextColor3 = C.accent; chevron.Text = "▼"; chevron.TextXAlignment = Enum.TextXAlignment.Center

	-- zona desplegable: clip animado + scroll interno
	local clip = Instance.new("Frame", container)
	clip.LayoutOrder = 1
	clip.Size = UDim2.new(1, 0, 0, 0)
	clip.BackgroundTransparency = 1
	clip.ClipsDescendants = true

	local inner = Instance.new("ScrollingFrame", clip)
	inner.Size = UDim2.new(1, 0, 1, 0)
	inner.BackgroundTransparency = 1
	inner.BorderSizePixel = 0
	inner.ScrollBarThickness = 4
	inner.ScrollBarImageColor3 = C.accent
	inner.CanvasSize = UDim2.new(0, 0, 0, 0)
	inner.AutomaticCanvasSize = Enum.AutomaticSize.Y
	inner.ClipsDescendants = true
	local ilay = Instance.new("UIListLayout", inner)
	ilay.Padding = UDim.new(0, 4); ilay.SortOrder = Enum.SortOrder.LayoutOrder

	local open, loaded, targetH, shown = false, false, 0, 0

	local function animateTo(h)
		motionTween(clip, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{ Size = UDim2.new(1, 0, 0, h) })
	end

	local function addCard(info)
		local id = info.id
		local cardBtn = Instance.new("TextButton", inner)
		cardBtn.Size = UDim2.new(1, -6, 0, 44)
		cardBtn.BackgroundColor3 = C.neutral
		cardBtn.AutoButtonColor = false
		cardBtn.Text = ""
		cardBtn.BorderSizePixel = 0
		cardBtn.LayoutOrder = shown + 1
		Instance.new("UICorner", cardBtn).CornerRadius = UDim.new(0, 6)

		local av = Instance.new("ImageLabel", cardBtn)
		av.Size = UDim2.new(0, 34, 0, 34); av.Position = UDim2.new(0, 5, 0.5, -17)
		av.BackgroundColor3 = C.card; av.BorderSizePixel = 0
		av.Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(id)
		Instance.new("UICorner", av).CornerRadius = UDim.new(0, 17)

		local dn = Instance.new("TextLabel", cardBtn)
		dn.Size = UDim2.new(1, -135, 0, 17); dn.Position = UDim2.new(0, 46, 0, 4)
		dn.BackgroundTransparency = 1; dn.Font = Enum.Font.GothamBold; dn.TextSize = 13
		dn.TextColor3 = C.text; dn.Text = info.displayName or info.name or ("ID " .. id)
		dn.TextXAlignment = Enum.TextXAlignment.Left; dn.TextTruncate = Enum.TextTruncate.AtEnd

		local un = Instance.new("TextLabel", cardBtn)
		un.Size = UDim2.new(1, -135, 0, 15); un.Position = UDim2.new(0, 46, 0, 23)
		un.BackgroundTransparency = 1; un.Font = Enum.Font.Gotham; un.TextSize = 12
		un.TextColor3 = C.subtext; un.Text = "@" .. (info.name or "?")
		un.TextXAlignment = Enum.TextXAlignment.Left; un.TextTruncate = Enum.TextTruncate.AtEnd

		local go = Instance.new("TextLabel", cardBtn)
		go.Size = UDim2.new(0, 76, 1, 0); go.Position = UDim2.new(1, -80, 0, 0)
		go.BackgroundTransparency = 1; go.Font = Enum.Font.GothamBold; go.TextSize = 12
		go.TextColor3 = C.accent; go.Text = "Analizar →"; go.TextXAlignment = Enum.TextXAlignment.Right

		cardBtn.MouseButton1Click:Connect(function()
			showMiniProfileCard(id, info)   -- abre la tarjeta modal animada
		end)
		shown = shown + 1
	end

	local function loadFriends()
		loaded = true
		local loadingLbl = Instance.new("TextLabel", inner)
		loadingLbl.LayoutOrder = 0
		loadingLbl.Size = UDim2.new(1, -6, 0, 24); loadingLbl.BackgroundTransparency = 1
		loadingLbl.Font = Enum.Font.Gotham; loadingLbl.TextSize = 12; loadingLbl.TextColor3 = C.subtext
		loadingLbl.Text = "Cargando amigos..."; loadingLbl.TextXAlignment = Enum.TextXAlignment.Left
		task.spawn(function()
			local res = apiGet("https://friends.roblox.com/v1/users/" .. userId .. "/friends")
			if not container.Parent then return end
			if loadingLbl and loadingLbl.Parent then loadingLbl:Destroy() end
			if not res or not res.data then
				local err = Instance.new("TextLabel", inner)
				err.Size = UDim2.new(1, -6, 0, 24); err.BackgroundTransparency = 1
				err.Font = Enum.Font.Gotham; err.TextSize = 12; err.TextColor3 = C.bad
				err.Text = "No disponible."
				err.TextXAlignment = Enum.TextXAlignment.Left
				task.wait()
				targetH = math.min(ilay.AbsoluteContentSize.Y, MAXH)
				if open then animateTo(targetH) end
				return
			end
			-- resolver nombres en lote (la lista a veces no los trae)
			local ids = {}
			for _, f in ipairs(res.data) do if f.id then table.insert(ids, f.id) end end
			local nameMap = resolveNames(ids)
			if not container.Parent then return end
			for i, f in ipairs(res.data) do
				if not container.Parent then return end
				local m = nameMap[f.id]
				addCard({
					id = f.id,
					name = (m and m.name) or f.name,
					displayName = (m and m.displayName) or f.displayName or (m and m.name) or f.name,
				})
				if i % 25 == 0 then task.wait() end
			end
			if shown == 0 then
				local none = Instance.new("TextLabel", inner)
				none.Size = UDim2.new(1, -6, 0, 24); none.BackgroundTransparency = 1
				none.Font = Enum.Font.Gotham; none.TextSize = 12; none.TextColor3 = C.subtext
				none.Text = "Sin amigos públicos."; none.TextXAlignment = Enum.TextXAlignment.Left
			else
				hVal.Text = tostring(shown)
			end
			task.wait()  -- deja medir el layout
			targetH = math.min(ilay.AbsoluteContentSize.Y, MAXH)
			if open then animateTo(targetH) end
		end)
	end

	header.MouseButton1Click:Connect(function()
		open = not open
		chevron.Text = open and "▲" or "▼"
		if open then
			if not loaded then
				animateTo(34)        -- muestra "Cargando..."
				loadFriends()
			else
				animateTo(targetH)
			end
		else
			animateTo(0)
		end
	end)

	return container
end

-- ====================== AMISTAD: ESTADO + BOTÓN ROBUSTO ======================
-- Estado de amistad ENTRE tú y el objetivo: NotFriends / Friends /
-- RequestSent / RequestReceived. Devuelve el string o nil si falla.

local currentData = nil

-- NX Shields necesita saber qué perfil se está viendo para poder re-validarlo
-- de verdad cuando enciendes "Validación de datos" (selfTestData).
Shield.currentData = function() return currentData end

-- MODO AVANZADO. Apagado, la interfaz muestra lo justo; encendido, añade los
-- desgloses de las heurísticas, la recolección profunda de la pestaña Huella y
-- las notas metodológicas. Va como método de Shield (no como local de raíz)
-- para no gastar registros: el chunk roza el límite de 200 de Luau.
function Shield.adv() return store.advanced == true end

-- ====================== NX PLUS · identidad · reporte · caché ======================
-- (Va DESPUÉS de `local currentData` a propósito: si se declara después, leerlo
--  aquí dentro no daría el local sino un global nil, sin error y sin aviso.)
-- Bloque autocontenido en do...end: sus locals viven solo aquí dentro y se
-- liberan al 'end', así que NO consumen registros del chunk raíz (que ya va por
-- 151 de los 200 que permite Luau). Se expone por _G.NXPlus, igual que _G.NXV2.
-- Reversible: borrar el bloque y sus 3 llamadas devuelve el script a como estaba.
do
	if _G.NXPlus and _G.NXPlus.stop then pcall(_G.NXPlus.stop) end
	local P = {}

	-- ── Escala de profundidad (z-index) declarada UNA vez, en vez de repartir
	-- números sueltos por el archivo: contenido 1 · velo 300 · tarjeta 301 · encima 302.
	local Z = { velo = 300, card = 301, sobre = 302 }

	-- ────────────────────────────────────────────────────────────────────────
	-- 1) CACHÉ + HISTORIAL DE BÚSQUEDA
	-- ────────────────────────────────────────────────────────────────────────
	-- El endpoint /users/search es el más rate-limited de todos (429 constante).
	-- Repetir una búsqueda no debería costar una petición.
	local buscCache = {}          -- keyword(lower) -> { t = os.time(), datos = {...} }
	local BUSC_TTL  = 120         -- s. Una búsqueda de nombres no cambia en 2 min.

	function P.cacheGet(keyword)
		local k = tostring(keyword):lower()
		local e = buscCache[k]
		if e and (os.time() - e.t) < BUSC_TTL then return e.datos end
		if e then buscCache[k] = nil end        -- caducada: se limpia sola
		return nil
	end

	function P.cachePut(keyword, datos)
		if type(datos) ~= "table" then return end
		local k = tostring(keyword):lower()
		if not buscCache[k] then
			-- Tope duro: sin él, teclear mucho llena la tabla sin liberarse nunca.
			local n = 0
			for _ in pairs(buscCache) do n = n + 1 end
			if n >= 40 then table.clear(buscCache) end
		end
		buscCache[k] = { t = os.time(), datos = datos }
	end

	-- Historial de usuarios YA analizados, persistido en el mismo archivo de
	-- guardado que el tema (store). Máximo 12, sin repetidos, el último primero.
	if type(store.searchHistory) ~= "table" then store.searchHistory = {} end

	function P.recordar(userId, username, displayName)
		if not userId or not username then return end
		local h = store.searchHistory
		for i = #h, 1, -1 do
			local e = h[i]
			if type(e) ~= "table" or e.id == userId then table.remove(h, i) end
		end
		table.insert(h, 1, { id = userId, name = username, display = displayName or username })
		while #h > 12 do table.remove(h) end
		pcall(saveStore)
	end

	function P.recientes() return store.searchHistory or {} end

	function P.limpiarHistorial()
		store.searchHistory = {}
		pcall(saveStore)
	end

	-- ── NOMBRES PREVIOS COMPARTIDOS ────────────────────────────────────────
	-- El Panel de Identidad y la tarjeta "Historial de nombres" quieren el MISMO
	-- dato y se dibujan a la vez, así que sin esto lanzarían dos getNameHistory
	-- simultáneos contra username-history, que es el endpoint más rate-limited
	-- del conjunto (429 con facilidad). Mismo patrón que withRAP: el primero que
	-- llega crea la petición, el segundo se cuelga de ella.
	-- cb recibe (lista|nil, hasMore). nil = no se pudo obtener.
	function P.nombres(data, cb)
		if type(data._namesCached) == "table" then
			cb(data._namesCached, data._namesHasMore or false); return
		end
		if data._namesCached == false then cb(nil, false); return end

		data._namesWaiters = data._namesWaiters or {}
		table.insert(data._namesWaiters, cb)
		if data._namesInflight then return end
		data._namesInflight = true

		task.spawn(function()
			local ok, lista, mas = pcall(getNameHistory, data.UserId)
			if ok and type(lista) == "table" then
				data._namesCached  = lista
				data._namesHasMore = mas or false
			else
				data._namesCached  = false
				data._namesHasMore = false
			end
			data._namesInflight = false
			local esperando = data._namesWaiters or {}
			data._namesWaiters = nil
			local res = (type(data._namesCached) == "table") and data._namesCached or nil
			for _, fn in ipairs(esperando) do pcall(fn, res, data._namesHasMore) end
		end)
	end

	-- ────────────────────────────────────────────────────────────────────────
	-- 2) PANEL DE IDENTIDAD
	-- ────────────────────────────────────────────────────────────────────────
	-- Junta en un solo sitio TODO lo que Roblox expone públicamente sobre quién
	-- es esta cuenta, y dice explícitamente qué NO expone. Sin inventar nada.
	local function fila(parent, orden, etiqueta, valor, color, nota)
		local f = Instance.new("Frame", parent)
		f.LayoutOrder = orden
		f.Size = UDim2.new(1, 0, 0, 0)
		f.AutomaticSize = Enum.AutomaticSize.Y
		f.BackgroundTransparency = 1

		local lay = Instance.new("UIListLayout", f)
		lay.Padding = UDim.new(0, 1); lay.SortOrder = Enum.SortOrder.LayoutOrder

		local top = Instance.new("Frame", f)
		top.LayoutOrder = 0
		top.Size = UDim2.new(1, 0, 0, 20)
		top.BackgroundTransparency = 1

		local l = Instance.new("TextLabel", top)
		l.Size = UDim2.new(0, 118, 1, 0)
		l.BackgroundTransparency = 1
		l.Font = Enum.Font.Gotham; l.TextSize = 12
		l.TextColor3 = C.subtext
		l.Text = etiqueta
		l.TextXAlignment = Enum.TextXAlignment.Left
		themed(l, "TextColor3", "subtext")

		local v = Instance.new("TextLabel", top)
		v.Size = UDim2.new(1, -122, 1, 0)
		v.Position = UDim2.new(0, 122, 0, 0)
		v.BackgroundTransparency = 1
		v.Font = Enum.Font.GothamBold; v.TextSize = 12
		v.TextColor3 = color or C.text
		v.Text = tostring(valor)
		v.TextXAlignment = Enum.TextXAlignment.Left
		v.TextTruncate = Enum.TextTruncate.AtEnd
		if not color then themed(v, "TextColor3", "text") end

		-- Nota explicativa bajo la fila: el color NUNCA es el único indicador
		-- (accesibilidad); siempre hay símbolo + texto que lo dicen.
		if nota then
			local n = Instance.new("TextLabel", f)
			n.LayoutOrder = 1
			n.Size = UDim2.new(1, -122, 0, 0)
			n.Position = UDim2.new(0, 122, 0, 0)
			n.AutomaticSize = Enum.AutomaticSize.Y
			n.BackgroundTransparency = 1
			n.Font = Enum.Font.Gotham; n.TextSize = 11
			n.TextColor3 = C.subtext
			n.Text = nota
			n.TextWrapped = true
			n.TextXAlignment = Enum.TextXAlignment.Left
			themed(n, "TextColor3", "subtext")
		end
		-- Se devuelve TAMBIÉN el label del valor para poder rellenarlo luego sin
		-- tener que ir a buscarlo por el árbol (que es frágil y se rompe al
		-- tocar la jerarquía).
		return f, v
	end


	-- ────────────────────────────────────────────────────────────────────────
	-- 3) REPORTE DE USUARIO
	-- ────────────────────────────────────────────────────────────────────────
	-- QUÉ HACE Y QUÉ NO: Roblox no ofrece ninguna API para abrir su menú de
	-- reporte ni para enviar un reporte desde un script. Lo que SÍ existe y es
	-- estable es la página web de reporte con el usuario ya preseleccionado:
	--   https://www.roblox.com/report-abuse/?targetId=<id>&targetType=User
	-- (comprobada el 2026-07-26: si no hay sesión redirige al login y vuelve
	--  sola a la página de reporte, o sea que el enlace es el correcto).
	-- Así que esto abre ESA página con tu openURL de siempre (navegador nativo →
	-- open_url del executor → puerto 9222 → portapapeles) y te deja la
	-- descripción ya escrita para pegarla. El envío lo haces tú: la herramienta
	-- no manda reportes en tu nombre.
	local CATS = {
		{ id = "exploits", titulo = "Exploits / trampas", motivo = "Cheating/Exploiting",
		  prompts = {
			"El jugador está usando exploits en la experiencia. Se mueve a velocidad imposible y atraviesa paredes y obstáculos que deberían bloquearlo.",
			"El jugador está volando o teletransportándose por el mapa, algo que esta experiencia no permite de forma legítima.",
			"El jugador es invencible: recibe daño de varias fuentes y su vida no baja, y elimina a los demás al instante desde lejos.",
		  } },
		{ id = "audio", titulo = "Audio / micrófono", motivo = "Inappropriate audio",
		  prompts = {
			"El jugador transmite audio saturado y distorsionado a propósito por el chat de voz, a volumen muy alto, de forma continua e imposible de ignorar.",
			"El jugador está reproduciendo música con derechos de autor por el micrófono de forma constante, impidiendo que se escuche a los demás.",
			"El jugador grita e insulta por el chat de voz de forma repetida, dirigiéndose a otras personas de la sala.",
		  } },
		{ id = "avatar", titulo = "Avatar inapropiado", motivo = "Inappropriate avatar",
		  prompts = {
			"El avatar del jugador es sexualmente explícito: está configurado para simular desnudez y no es apropiado para la plataforma.",
			"El avatar del jugador usa una combinación de accesorios que forma una imagen ofensiva/obscena visible para todos.",
			"El avatar del jugador muestra símbolos de odio o referencias extremistas.",
		  } },
		{ id = "chat", titulo = "Chat de texto", motivo = "Abusive chat",
		  prompts = {
			"El jugador escribe insultos y lenguaje ofensivo por el chat de texto de forma repetida hacia otras personas.",
			"El jugador usa el chat para saltarse el filtro y escribir palabras ofensivas con símbolos y espacios entre letras.",
			"El jugador está enviando spam masivo por el chat, impidiendo seguir la conversación.",
		  } },
		{ id = "acoso", titulo = "Acoso / bullying", motivo = "Bullying/Harassment",
		  prompts = {
			"El jugador está acosando a otra persona de la sala: la sigue por el mapa, la bloquea y se burla de ella de forma insistente después de que le pidieran parar.",
			"El jugador amenaza a otros participantes y les dice que va a reportarlos o banearlos en falso para asustarlos.",
			"El jugador se dirige a otra persona con comentarios humillantes de forma repetida.",
		  } },
		{ id = "scam", titulo = "Estafa / scam", motivo = "Scamming",
		  prompts = {
			"El jugador ofrece Robux o items gratis a cambio de entrar a un enlace externo, que es una estafa.",
			"El jugador pide los datos de acceso de la cuenta prometiendo un premio a cambio.",
			"El jugador propone un intercambio, recibe primero y no entrega su parte.",
		  } },
		{ id = "suplantacion", titulo = "Suplantación", motivo = "Impersonation",
		  prompts = {
			"El jugador se hace pasar por personal de Roblox para pedir cosas a los demás.",
			"El jugador copió el Display Name y el avatar de otra persona para hacerse pasar por ella. Recuerda que el Display Name se puede repetir: el @usuario y el UserId son los que identifican de verdad.",
			"El jugador se hace pasar por un moderador o administrador de esta experiencia para dar órdenes.",
		  } },
		{ id = "adulto", titulo = "Contenido adulto", motivo = "Adult content",
		  prompts = {
			"El jugador tiene conductas de contenido sexual dentro de la experiencia.",
			"El jugador busca 'citas' de forma explícita e insiste a otras personas.",
			"El jugador comparte enlaces a contenido para adultos por el chat.",
		  } },
		{ id = "datos", titulo = "Datos personales", motivo = "Personal information",
		  prompts = {
			"El jugador está publicando datos personales de otra persona (nombre real, dirección, teléfono o redes) por el chat.",
			"El jugador pide insistentemente datos personales como edad, dirección o fotos.",
			"El jugador amenaza con publicar información privada de otro participante.",
		  } },
	}

	-- Contexto verificable de DÓNDE está pasando. Solo datos que existen de
	-- verdad; nada se rellena a ojo.
	local function contexto()
		local partes = {}
		partes[#partes + 1] = "PlaceId: " .. tostring(game.PlaceId)
		if game.JobId and game.JobId ~= "" then
			partes[#partes + 1] = "Servidor (JobId): " .. game.JobId
		end
		local nombre
		pcall(function()
			nombre = game:GetService("MarketplaceService")
				:GetProductInfo(game.PlaceId).Name
		end)
		if nombre then table.insert(partes, 1, "Experiencia: " .. nombre) end
		return table.concat(partes, "\n")
	end

	function P.textoReporte(data, cat, idx)
		local cuerpo = cat.prompts[idx] or cat.prompts[1]
		return table.concat({
			"Usuario reportado: @" .. tostring(data.Username)
				.. " (Display Name: " .. tostring(data.DisplayName)
				.. " · UserId: " .. tostring(data.UserId) .. ")",
			"Motivo: " .. cat.titulo,
			"",
			cuerpo,
			"",
			"--- Contexto ---",
			contexto(),
			"Fecha (UTC): " .. os.date("!%Y-%m-%d %H:%M"),
		}, "\n")
	end

	function P.reportar(data)
		if type(data) ~= "table" or not data.UserId then return end
		local viejo = gui:FindFirstChild("NXReportModal")
		if viejo then viejo:Destroy() end

		local velo = Instance.new("TextButton", gui)   -- TextButton = traga clics
		velo.Name = "NXReportModal"
		velo.Size = UDim2.new(1, 0, 1, 0)
		velo.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		velo.BackgroundTransparency = 1
		velo.BorderSizePixel = 0
		velo.Text = ""
		velo.AutoButtonColor = false
		velo.ZIndex = Z.velo
		motionTween(velo, TweenInfo.new(0.18), { BackgroundTransparency = 0.45 })

		local card = Instance.new("Frame", velo)
		card.Size = UDim2.new(0, 540, 0, 430)
		card.Position = UDim2.new(0.5, -270, 0.5, -215)
		card.BackgroundColor3 = C.bg
		card.BorderSizePixel = 0
		-- Active = true hace que la tarjeta ABSORBA el clic. Sin esto, un Frame
		-- normal deja pasar el clic al velo de detrás (que cierra el modal), o
		-- sea que pulsar dentro de la ventana la cerraría.
		card.Active = true
		card.ZIndex = Z.card
		themed(card, "BackgroundColor3", "bg")
		Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)
		local cst = Instance.new("UIStroke", card)
		cst.Color = C.accent; cst.Transparency = 0.4
		themed(cst, "Color", "accent")

		-- Aparición: escala 0.94 → 1 (transform, no tamaño en píxeles), 180 ms.
		local esc = Instance.new("UIScale", card)
		esc.Scale = 0.94
		motionTween(esc, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })

		local function cerrar()
			motionTween(velo, TweenInfo.new(0.15), { BackgroundTransparency = 1 })
			motionTween(esc, TweenInfo.new(0.15), { Scale = 0.94 }, function()
				if velo and velo.Parent then velo:Destroy() end
			end)
		end
		track(velo.MouseButton1Click:Connect(cerrar))

		-- ── Cabecera ──
		local head = Instance.new("TextLabel", card)
		head.Size = UDim2.new(1, -56, 0, 26)
		head.Position = UDim2.new(0, 14, 0, 12)
		head.BackgroundTransparency = 1
		head.Font = Enum.Font.GothamBold; head.TextSize = 16
		head.TextColor3 = C.accent
		head.Text = "Reportar usuario"
		head.TextXAlignment = Enum.TextXAlignment.Left
		head.ZIndex = Z.sobre
		themed(head, "TextColor3", "accent")

		local sub = Instance.new("TextLabel", card)
		sub.Size = UDim2.new(1, -56, 0, 16)
		sub.Position = UDim2.new(0, 14, 0, 34)
		sub.BackgroundTransparency = 1
		sub.Font = Enum.Font.Gotham; sub.TextSize = 12
		sub.TextColor3 = C.subtext
		sub.Text = "@" .. tostring(data.Username) .. "  ·  ID " .. tostring(data.UserId)
		sub.TextXAlignment = Enum.TextXAlignment.Left
		sub.TextTruncate = Enum.TextTruncate.AtEnd
		sub.ZIndex = Z.sobre
		themed(sub, "TextColor3", "subtext")

		local x = Instance.new("TextButton", card)
		x.Size = UDim2.new(0, 28, 0, 28)                 -- objetivo de toque cómodo
		x.Position = UDim2.new(1, -38, 0, 12)
		x.BackgroundColor3 = C.card
		x.Text = "X"
		x.Font = Enum.Font.GothamBold; x.TextSize = 13
		x.TextColor3 = C.text
		x.BorderSizePixel = 0
		x.AutoButtonColor = false
		x.ZIndex = Z.sobre
		Instance.new("UICorner", x).CornerRadius = UDim.new(0, 6)
		themed(x, "BackgroundColor3", "card"); themed(x, "TextColor3", "text")
		-- Hover: solo color, nunca escala (una escala aquí movería el layout).
		track(x.MouseEnter:Connect(function()
			motionTween(x, TweenInfo.new(0.15), { BackgroundColor3 = C.bad })
		end))
		track(x.MouseLeave:Connect(function()
			motionTween(x, TweenInfo.new(0.15), { BackgroundColor3 = C.card })
		end))
		track(x.MouseButton1Click:Connect(cerrar))

		-- ── Columna izquierda: categorías ──
		local izq = Instance.new("ScrollingFrame", card)
		izq.Size = UDim2.new(0, 186, 1, -118)
		izq.Position = UDim2.new(0, 14, 0, 60)
		izq.BackgroundTransparency = 1
		izq.BorderSizePixel = 0
		izq.ScrollBarThickness = 3
		izq.CanvasSize = UDim2.new(0, 0, 0, 0)
		izq.AutomaticCanvasSize = Enum.AutomaticSize.Y
		izq.ZIndex = Z.sobre
		local izqLay = Instance.new("UIListLayout", izq)
		izqLay.Padding = UDim.new(0, 4); izqLay.SortOrder = Enum.SortOrder.LayoutOrder

		-- ── Columna derecha: variantes + vista previa editable ──
		local varLbl = Instance.new("TextLabel", card)
		varLbl.Size = UDim2.new(0, 320, 0, 16)
		varLbl.Position = UDim2.new(0, 208, 0, 60)
		varLbl.BackgroundTransparency = 1
		varLbl.Font = Enum.Font.GothamBold; varLbl.TextSize = 11
		varLbl.TextColor3 = C.subtext
		varLbl.Text = "PLANTILLA"
		varLbl.TextXAlignment = Enum.TextXAlignment.Left
		varLbl.ZIndex = Z.sobre
		themed(varLbl, "TextColor3", "subtext")

		local varRow = Instance.new("Frame", card)
		varRow.Size = UDim2.new(0, 320, 0, 26)
		varRow.Position = UDim2.new(0, 208, 0, 78)
		varRow.BackgroundTransparency = 1
		varRow.ZIndex = Z.sobre
		local varLay = Instance.new("UIListLayout", varRow)
		varLay.FillDirection = Enum.FillDirection.Horizontal
		varLay.Padding = UDim.new(0, 6); varLay.SortOrder = Enum.SortOrder.LayoutOrder

		local prev = Instance.new("TextBox", card)
		prev.Size = UDim2.new(0, 320, 1, -186)
		prev.Position = UDim2.new(0, 208, 0, 110)
		prev.BackgroundColor3 = C.card
		prev.Font = Enum.Font.Gotham; prev.TextSize = 12
		prev.TextColor3 = C.text
		prev.TextWrapped = true
		prev.MultiLine = true
		prev.ClearTextOnFocus = false
		prev.TextEditable = true                          -- lo puedes ajustar tú
		prev.TextXAlignment = Enum.TextXAlignment.Left
		prev.TextYAlignment = Enum.TextYAlignment.Top
		prev.BorderSizePixel = 0
		prev.Text = ""
		prev.ZIndex = Z.sobre
		themed(prev, "BackgroundColor3", "card"); themed(prev, "TextColor3", "text")
		Instance.new("UICorner", prev).CornerRadius = UDim.new(0, 6)
		local ppad = Instance.new("UIPadding", prev)
		ppad.PaddingTop = UDim.new(0, 6); ppad.PaddingLeft = UDim.new(0, 8)
		ppad.PaddingRight = UDim.new(0, 8); ppad.PaddingBottom = UDim.new(0, 6)

		local catSel, varSel = CATS[1], 1
		local botonesCat, botonesVar = {}, {}

		local function pintarVar()
			for i, b in ipairs(botonesVar) do
				local on = (i == varSel)
				b.BackgroundColor3 = on and C.accent or C.card
				b.TextColor3 = on and C.onAccent or C.subtext
			end
		end

		local function pintarCat()
			for _, b in ipairs(botonesCat) do
				local on = (b:GetAttribute("catId") == catSel.id)
				b.BackgroundColor3 = on and C.accent or C.card
				b.TextColor3 = on and C.onAccent or C.text
			end
		end

		local function refrescar()
			prev.Text = P.textoReporte(data, catSel, varSel)
			pintarCat(); pintarVar()
		end

		local function construirVars()
			for _, b in ipairs(botonesVar) do b:Destroy() end
			table.clear(botonesVar)
			for i = 1, #catSel.prompts do
				local b = Instance.new("TextButton", varRow)
				b.LayoutOrder = i
				b.Size = UDim2.new(0, 34, 1, 0)
				b.BackgroundColor3 = C.card
				b.Text = tostring(i)
				b.Font = Enum.Font.GothamBold; b.TextSize = 12
				b.TextColor3 = C.subtext
				b.BorderSizePixel = 0
				b.AutoButtonColor = false
				b.ZIndex = Z.sobre
				Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
				track(b.MouseButton1Click:Connect(function()
					varSel = i
					refrescar()
				end))
				botonesVar[i] = b
			end
		end

		for i, cat in ipairs(CATS) do
			local b = Instance.new("TextButton", izq)
			b.LayoutOrder = i
			b.Size = UDim2.new(1, -6, 0, 32)             -- 32px: cómodo de pulsar
			b.BackgroundColor3 = C.card
			b.Text = "  " .. cat.titulo
			b.Font = Enum.Font.Gotham; b.TextSize = 12
			b.TextColor3 = C.text
			b.TextXAlignment = Enum.TextXAlignment.Left
			b.BorderSizePixel = 0
			b.AutoButtonColor = false
			b.ZIndex = Z.sobre
			b:SetAttribute("catId", cat.id)
			Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
			track(b.MouseButton1Click:Connect(function()
				catSel, varSel = cat, 1
				construirVars()
				refrescar()
			end))
			botonesCat[i] = b
		end

		-- ── Pie: acciones ──
		local copiar = Instance.new("TextButton", card)
		copiar.Size = UDim2.new(0, 168, 0, 32)
		copiar.Position = UDim2.new(0, 14, 1, -46)
		copiar.BackgroundColor3 = C.neutral
		copiar.Text = "Copiar descripción"
		copiar.Font = Enum.Font.GothamBold; copiar.TextSize = 12
		copiar.TextColor3 = C.text
		copiar.BorderSizePixel = 0
		copiar.AutoButtonColor = false
		copiar.ZIndex = Z.sobre
		Instance.new("UICorner", copiar).CornerRadius = UDim.new(0, 6)
		themed(copiar, "BackgroundColor3", "neutral"); themed(copiar, "TextColor3", "text")
		track(copiar.MouseButton1Click:Connect(function()
			clipboard(prev.Text)
			copiar.Text = "✓ Copiado"
			task.delay(1.2, function()
				if copiar and copiar.Parent then copiar.Text = "Copiar descripción" end
			end)
		end))

		local abrir = Instance.new("TextButton", card)
		abrir.Size = UDim2.new(0, 320, 0, 32)
		abrir.Position = UDim2.new(0, 208, 1, -46)
		abrir.BackgroundColor3 = C.accent
		abrir.Text = "Abrir reporte de Roblox →"
		abrir.Font = Enum.Font.GothamBold; abrir.TextSize = 12
		abrir.TextColor3 = C.onAccent
		abrir.BorderSizePixel = 0
		abrir.AutoButtonColor = false
		abrir.ZIndex = Z.sobre
		Instance.new("UICorner", abrir).CornerRadius = UDim.new(0, 6)
		themed(abrir, "BackgroundColor3", "accent"); themed(abrir, "TextColor3", "onAccent")
		track(abrir.MouseButton1Click:Connect(function()
			-- Estado de carga: el botón se desactiva mientras se intenta abrir,
			-- para que no se pueda pulsar tres veces seguidas.
			if abrir:GetAttribute("ocupado") then return end
			abrir:SetAttribute("ocupado", true)
			abrir.Text = "Abriendo…"
			clipboard(prev.Text)          -- la descripción va lista para pegar
			task.spawn(function()
				local url = "https://www.roblox.com/report-abuse/?targetId="
					.. tostring(data.UserId) .. "&targetType=User"
				local ok = openURL(url)
				if abrir and abrir.Parent then
					abrir.Text = "Abrir reporte de Roblox →"
					abrir:SetAttribute("ocupado", nil)
				end
				if ok then
					statusLabel.Text = "✓ Reporte abierto. La descripción está copiada: pégala en el formulario."
					cerrar()
				else
					statusLabel.Text = "No disponible en tu executor. Te dejo el link para copiarlo."
					showLinkModal(url)
				end
			end)
		end))

		local pie = Instance.new("TextLabel", card)
		pie.Size = UDim2.new(1, -28, 0, 14)
		pie.Position = UDim2.new(0, 14, 1, -66)
		pie.BackgroundTransparency = 1
		pie.Font = Enum.Font.Gotham; pie.TextSize = 10
		pie.TextColor3 = C.subtext
		pie.Text = "El reporte lo envías tú en la web de Roblox. Esta herramienta no manda nada en tu nombre."
		pie.TextXAlignment = Enum.TextXAlignment.Left
		pie.ZIndex = Z.sobre
		themed(pie, "TextColor3", "subtext")

		construirVars()
		refrescar()
		-- Se publica el repintado del modal abierto. El listener de tema se
		-- registra UNA sola vez (abajo, fuera de esta función): si se registrara
		-- aquí, cada apertura del modal añadiría otro a repaintExtra, que no
		-- tiene forma de quitarlos y se recorre entero en cada cambio de tema.
		P._repintarModal = function()
			if velo and velo.Parent then pcall(refrescar) end
		end
	end

	-- Listener de tema ÚNICO para el modal de reporte.
	onRepaint(function()
		if P._repintarModal then P._repintarModal() end
	end)

	_G.NXPlus = P
end

-- ====================== NX · USERNAME DECODER (motor local) ======================
-- Infiere posibles NOMBRES REALES a partir de un username. Es una INFERENCIA
-- heurística sobre texto PÚBLICO, jamás una confirmación de identidad. 100% local:
-- no hace ninguna llamada de red ni envía el username a ningún servicio externo.
-- Bloque autocontenido en do...end (sus locals se liberan al 'end', no gastan
-- registros del chunk raíz). Se expone por _G.NXDecoder. Reversible: borrar este
-- bloque y su tarjeta en render() devuelve el script a como estaba.
do
	local D = {}

	-- Diccionario de nombres (español + internacionales frecuentes), SIN acentos.
	-- Es el ancla ANTI-INVENCIÓN: si el token limpio no aparece aquí, el decoder NO
	-- afirma un nombre; lo marca como "sin evidencia suficiente".
	local NAMES = {}
	for _, n in ipairs({
		"alejandro","alonso","andres","angel","antonio","benjamin","bruno","carlos",
		"cristian","cristobal","daniel","david","diego","eduardo","emiliano","enzo",
		"esteban","fabian","felipe","fernando","francisco","gabriel","gael","gonzalo",
		"guillermo","hector","hugo","ignacio","isaac","ivan","javier","joaquin","jorge",
		"jose","juan","julian","leonardo","lucas","luis","manuel","marco","marcos",
		"martin","mateo","matias","mauricio","miguel","nicolas","oscar","pablo","pedro",
		"rafael","ramiro","raul","ricardo","roberto","rodrigo","ruben","salvador","samuel",
		"santiago","sebastian","sergio","thiago","tomas","valentin","vicente","victor",
		"abril","adriana","agustina","alejandra","ana","andrea","antonia","ariana",
		"beatriz","camila","carla","carmen","carolina","catalina","clara","constanza",
		"daniela","elena","emilia","emma","fernanda","florencia","gabriela","isabel",
		"isabella","isidora","javiera","josefa","juana","julia","julieta","laura","lucia",
		"luciana","maite","manuela","margarita","maria","mariana","martina","mia",
		"micaela","monica","natalia","nicole","paula","paulina","pilar","rocio","romina",
		"rosa","sofia","valentina","valeria","victoria","ximena",
		"aaron","adam","alex","alice","amanda","andrew","anna","anthony","ashley",
		"brandon","brian","chris","dylan","emily","eric","ethan","evan","jack","jacob",
		"jake","james","jason","jayden","jennifer","jessica","john","jordan","joseph",
		"josh","joshua","justin","kevin","liam","logan","luke","mark","mason","matthew",
		"max","michael","mike","nathan","noah","oliver","peter","robert","ryan","sam",
		"sarah","steven","thomas","tyler","william","zoe",
	}) do NAMES[n] = true end

	-- Relleno típico de usernames (gaming / Roblox / redes): se descarta, no aporta.
	local FILLER = {
		yt=true, ytb=true, ttv=true, tv=true, rblx=true, rbx=true, roblox=true,
		pro=true, gamer=true, gaming=true, real=true, oficial=true, official=true,
		its=true, im=true, the=true, xd=true, ff=true, op=true, god=true, king=true,
		queen=true, boss=true, lord=true, mr=true, mrs=true, itz=true, iam=true, yes=true,
	}

	-- Sufijos diminutivos en español (largos primero): "rubencito" -> "ruben".
	local DIMINUTIVES = { "chito","chita","cito","cita","illo","illa","ito","ita" }

	-- Sustituciones leet. 1 opción = SÓLIDA; 2+ opciones = AMBIGUA (ramifica).
	local LEET = {
		["4"]={"a"}, ["3"]={"e"}, ["0"]={"o"}, ["7"]={"t"}, ["8"]={"b"},
		["@"]={"a"}, ["$"]={"s"}, ["+"]={"t"},
		["1"]={"i","l"}, ["5"]={"s"}, ["9"]={"g"}, ["6"]={"g"}, ["2"]={"z"},
		["!"]={"i","l"}, ["|"]={"i","l"},
	}

	-- Acentos/ñ -> ascii, para comparar contra el diccionario (que va sin acentos).
	local ACCENTS = {
		["á"]="a",["é"]="e",["í"]="i",["ó"]="o",["ú"]="u",["ü"]="u",["ñ"]="n",
	}
	local function normalize(s)
		s = tostring(s):lower()
		for from, to in pairs(ACCENTS) do s = s:gsub(from, to) end
		return s
	end

	-- Levenshtein acotado (una diferencia >2 no interesa): tolera 1-2 adornos/erratas.
	local function editDistance(a, b)
		local la, lb = #a, #b
		if math.abs(la - lb) > 2 then return 99 end
		local prev = {}
		for j = 0, lb do prev[j] = j end
		for i = 1, la do
			local cur = { [0] = i }
			local ca = a:byte(i)
			for j = 1, lb do
				local cost = (ca == b:byte(j)) and 0 or 1
				cur[j] = math.min(prev[j] + 1, cur[j-1] + 1, prev[j-1] + cost)
			end
			prev = cur
		end
		return prev[lb]
	end

	-- Mejor nombre del diccionario para un candidato: exacto (dist 0) o cercano (≤2).
	local function matchName(cand)
		if #cand < 3 then
			if NAMES[cand] then return cand, 0 end   -- nombres cortos exactos (mia, ana, sam...)
			return nil, 99
		end
		if NAMES[cand] then return cand, 0 end
		local best, bestD = nil, 3
		for name in pairs(NAMES) do
			if math.abs(#name - #cand) <= 2 then
				local d = editDistance(cand, name)
				if d < bestD then best, bestD = name, d end
			end
		end
		if best then return best, bestD end
		return nil, 99
	end

	-- Expande las sustituciones leet de un token en varios candidatos (con tope).
	local MAX_CAND = 24
	local function deLeet(token)
		local res = { { text = "", subs = {}, ambig = 0, solid = 0 } }
		for i = 1, #token do
			local ch = token:sub(i, i)
			local opts = LEET[ch]
			local nxt = {}
			if opts then
				local isAmbig = #opts > 1
				for _, r in ipairs(res) do
					for _, letter in ipairs(opts) do
						if #nxt < MAX_CAND then
							local subs = {}
							for _, x in ipairs(r.subs) do subs[#subs + 1] = x end
							subs[#subs + 1] = ch .. " → " .. letter
							nxt[#nxt + 1] = {
								text = r.text .. letter, subs = subs,
								ambig = r.ambig + (isAmbig and 1 or 0),
								solid = r.solid + (isAmbig and 0 or 1),
							}
						end
					end
				end
			else
				local keep = ch:match("%a") and ch or ""   -- letras se quedan; otros símbolos fuera
				for _, r in ipairs(res) do
					r.text = r.text .. keep
					nxt[#nxt + 1] = r
				end
			end
			res = nxt
			if #res == 0 then break end
		end
		return res
	end

	local function stripDiminutive(w)
		for _, suf in ipairs(DIMINUTIVES) do
			if #w >= #suf + 3 and w:sub(-#suf) == suf then
				return w:sub(1, #w - #suf), suf
			end
		end
		return w, nil
	end

	local function levelOf(sc, matched)
		if not matched then return "Insuficiente" end
		if sc >= 75 then return "Alta"
		elseif sc >= 50 then return "Media"
		elseif sc >= 30 then return "Baja"
		else return "Insuficiente" end
	end

	-- Analiza UN username. Devuelve { username, subs (del mejor), candidates[], hasEvidence }.
	function D.analyze(username)
		local out = { username = tostring(username or ""), subs = {}, candidates = {}, hasEvidence = false }
		if out.username == "" then return out end

		local s = normalize(out.username)
		local ranked = {}            -- name -> mejor { score, level, subs }
		local cleanedFallback = nil  -- token limpio si no hay ningún match de diccionario

		for tok in s:gmatch("[%w@$!|+]+") do
			-- 1) recorta afijos de borde: dígitos y 'x' de relleno (xX..Xx, año al final)
			local core = tok:gsub("^[0-9x]+", ""):gsub("[0-9x]+$", "")
			for _, base in ipairs({ tok, core }) do
				if #base >= 2 and base:match("%a") then      -- ignora tokens sin letras (años tipo "2011")
					local lettersOnly = base:gsub("[^a-z]", "")
					if not FILLER[lettersOnly] then          -- descarta relleno puro ("yt", "pro"...)
						if not cleanedFallback and #lettersOnly >= 2 then cleanedFallback = lettersOnly end
						for _, c in ipairs(deLeet(base)) do
							-- prueba el candidato tal cual y, si aplica, sin diminutivo
							local variants = { { c.text, false } }
							local baseWord, dim = stripDiminutive(c.text)
							if dim then variants[#variants + 1] = { baseWord, true } end
							for _, v in ipairs(variants) do
								local cand, dist = matchName(v[1])
								if cand then
									local sc = 100 - 25 * dist - 22 * c.ambig - 4 * c.solid
									if v[2] then sc = sc - 12 end   -- dependió de recortar diminutivo
									sc = math.clamp(sc, 0, 100)
									local prev = ranked[cand]
									if not prev or sc > prev.score then
										ranked[cand] = { score = sc, level = levelOf(sc, true), subs = c.subs }
									end
								end
							end
						end
					end
				end
			end
		end

		local list = {}
		for name, info in pairs(ranked) do
			list[#list + 1] = { name = name, score = info.score, level = info.level, subs = info.subs }
		end
		table.sort(list, function(a, b) return a.score > b.score end)

		if list[1] then out.subs = list[1].subs; out.hasEvidence = true end
		for i = 1, math.min(4, #list) do out.candidates[#out.candidates + 1] = list[i] end

		-- Sin ningún match: ofrece el token limpio como inferencia DÉBIL y honesta.
		if #out.candidates == 0 and cleanedFallback then
			out.candidates[1] = { name = cleanedFallback, score = 15, level = "Insuficiente", subs = {} }
		end
		return out
	end

	_G.NXDecoder = D
end

local function render(data, skipEntrance)
	clearScroll(profileScroll)
	clearScroll(statsScroll)
	clearScroll(itemsScroll)
	clearScroll(analysisScroll)
	currentData = data
	-- La pestaña Huella se rellena sola al abrirla (carga perezosa). Aquí solo
	-- se invalida lo que hubiera pintado del perfil anterior.
	if _G.NXOSINT and _G.NXOSINT.reset then pcall(_G.NXOSINT.reset) end

	-- Compactación de roleMap: themed() añade una entrada por instancia en CADA
	-- render, pero la limpieza de entradas muertas (inst == nil, lo pone el
	-- Destroying de themed()) solo la hacía repaint(), que únicamente corre al
	-- cambiar de tema. Analizar muchos perfiles sin tocar el tema dejaba miles de
	-- entradas muertas apiladas. Los clearScroll de arriba ya destruyeron el
	-- contenido anterior (Destroying es síncrono), así que aquí ya están en nil.
	if #roleMap > 800 then
		local n = 0
		for i = 1, #roleMap do
			local e = roleMap[i]
			if e.inst then n = n + 1; roleMap[n] = e end
		end
		for i = #roleMap, n + 1, -1 do roleMap[i] = nil end
	end

	if not data then return end

	-- Animación de entrada: la pestaña visible entra deslizándose suave al cargar
	-- un perfil nuevo (chill). No se reproduce al re-pintar por cambio de tema.
	if ANIM.enabled and not skipEntrance then
		for _, pg in ipairs({ profilePage, statsPage, itemsPage, analysisPage }) do
			if pg.Visible then
				local sc = pg:FindFirstChild("PageScale")
				if not sc then sc = Instance.new("UIScale", pg); sc.Name = "PageScale" end
				sc.Scale = 0.98
				pg.Position = UDim2.new(0, 0, 0, 14)
				motionTween(pg, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
					{ Position = UDim2.new(0, 0, 0, 0) })
				motionTween(sc, TweenInfo.new(0.38, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
					{ Scale = 1 })
			end
		end
	end

	-- ---------- PESTAÑA PERFIL ----------
	local avatarFrame = Instance.new("Frame", profileScroll)
	avatarFrame.Size = UDim2.new(1, -4, 0, 196)
	avatarFrame.BackgroundTransparency = 1
	avatarFrame.LayoutOrder = 0
	local avatar = Instance.new("ImageButton", avatarFrame)
	avatar.Size = UDim2.new(0, 150, 0, 150)
	avatar.Position = UDim2.new(0.5, -75, 0, 5)
	avatar.BackgroundColor3 = C.card
	avatar.Image = data.AvatarUrl
	avatar.AutoButtonColor = false
	avatar.BorderSizePixel = 0
	Instance.new("UICorner", avatar).CornerRadius = UDim.new(0, 75)
	avatar.MouseButton1Click:Connect(function()
		showCharacterModal(data.UserId, data.Username)
	end)
	-- detalle: el avatar aparece con un fade suave al cargar el perfil.
	if ANIM.enabled and not skipEntrance then
		avatar.ImageTransparency = 1
		motionTween(avatar, TweenInfo.new(0.32, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{ ImageTransparency = 0 })
	end

	local viewCharBtn = Instance.new("TextButton", avatarFrame)
	viewCharBtn.Size = UDim2.new(0, 220, 0, 30)
	viewCharBtn.Position = UDim2.new(0.5, -110, 0, 160)
	viewCharBtn.BackgroundColor3 = C.accent
	viewCharBtn.Text = "Ver avatar"
	viewCharBtn.Font = Enum.Font.GothamBold
	viewCharBtn.TextSize = 13
	viewCharBtn.TextColor3 = C.onAccent
	viewCharBtn.BorderSizePixel = 0
	Instance.new("UICorner", viewCharBtn).CornerRadius = UDim.new(0, 6)
	viewCharBtn.MouseButton1Click:Connect(function()
		showCharacterModal(data.UserId, data.Username)
	end)

	-- NX Tag: insignia personalizada bajo el avatar. Oculta por defecto; se llena
	-- (async) solo si el UserId está en el JSON de NX Tags. No rompe el layout
	-- porque solo agranda el avatarFrame cuando hay tag que mostrar.
	local nxChip = Instance.new("Frame", avatarFrame)
	nxChip.Name = "NXTag"
	nxChip.AnchorPoint = Vector2.new(0.5, 0)
	nxChip.Position = UDim2.new(0.5, 0, 0, 196)
	nxChip.Size = UDim2.new(0, 0, 0, 26)
	nxChip.AutomaticSize = Enum.AutomaticSize.X
	nxChip.BackgroundColor3 = C.card
	nxChip.BackgroundTransparency = 1
	nxChip.BorderSizePixel = 0
	nxChip.Visible = false
	Instance.new("UICorner", nxChip).CornerRadius = UDim.new(0, 13)
	local nxStroke = Instance.new("UIStroke", nxChip)
	nxStroke.Thickness = 1.5
	nxStroke.Transparency = 1
	local nxPad = Instance.new("UIPadding", nxChip)
	nxPad.PaddingLeft = UDim.new(0, 12); nxPad.PaddingRight = UDim.new(0, 12)
	-- (Fase 1 NX V2) Layout horizontal: icono opcional (imagen) + texto del rol.
	-- Con images OFF, nxIcon queda oculto y el chip se ve igual que antes (emoji + texto).
	local nxList = Instance.new("UIListLayout", nxChip)
	nxList.FillDirection = Enum.FillDirection.Horizontal
	nxList.VerticalAlignment = Enum.VerticalAlignment.Center
	nxList.HorizontalAlignment = Enum.HorizontalAlignment.Center
	nxList.SortOrder = Enum.SortOrder.LayoutOrder
	nxList.Padding = UDim.new(0, 6)

	local nxIcon = Instance.new("ImageLabel", nxChip)
	nxIcon.Name = "NXIcon"
	nxIcon.BackgroundTransparency = 1
	nxIcon.Size = UDim2.fromOffset(18, 18)
	nxIcon.LayoutOrder = 1
	nxIcon.Visible = false

	local nxLabel = Instance.new("TextLabel", nxChip)
	nxLabel.LayoutOrder = 2
	nxLabel.AutomaticSize = Enum.AutomaticSize.X
	nxLabel.Size = UDim2.new(0, 0, 1, 0)
	nxLabel.BackgroundTransparency = 1
	nxLabel.Font = Enum.Font.GothamBold
	nxLabel.TextSize = 14
	nxLabel.TextColor3 = C.text
	nxLabel.Text = ""

	do
		local renderedFor = data.UserId
		local function applyTag(t)
			if not t or not nxChip.Parent then return end
			if currentData == nil or currentData.UserId ~= renderedFor then return end
			local IR  = _G.NXV2 and _G.NXV2.image
			local img = t.iconImage and IR and IR.normalize(t.iconImage)
			if img and IR.usable(img) then
				nxIcon.Image = img; nxIcon.Visible = true
				nxLabel.Text = t.tag                                  -- imagen + texto (sin emoji)
				IR.preload(img)
				task.spawn(function()                                  -- si el asset es inválido, cae a emoji
					local n = 0
					while n < 50 and IR.usable(img) and not nxIcon.IsLoaded do task.wait(0.1); n = n + 1 end
					if (not IR.usable(img)) and currentData and currentData.UserId == renderedFor then
						nxIcon.Visible = false
						nxLabel.Text = ((t.icon ~= "" and (t.icon .. " ")) or "") .. t.tag
					end
				end)
			else
				nxIcon.Visible = false
				nxLabel.Text = ((t.icon ~= "" and (t.icon .. " ")) or "") .. t.tag   -- emoji + texto (igual que hoy)
			end
			nxLabel.TextColor3 = t.color
			nxStroke.Color = t.color
			nxStroke.Transparency = 0.25
			nxChip.BackgroundTransparency = 0.15
			nxChip.Visible = true
			avatarFrame.Size = UDim2.new(1, -4, 0, 232)   -- hueco para el chip
		end
		-- Resuelve vía dispatcher (v2 -> legacy).
		local now = getNXTag(data.UserId)
		if now then
			applyTag(now)
		else
			-- Aún no hay tag porque algún backend sigue cargando. En vez de
			-- sondear (antes: hasta 60 vueltas de task.wait(0.1)), nos
			-- suscribimos a los dos y el primero que traiga algo lo pinta.
			local function reintentar()
				if currentData == nil or currentData.UserId ~= renderedFor then return end
				if not nxChip.Parent then return end
				applyTag(getNXTag(renderedFor))
			end
			_G.NXTagKit.alCargarLegacy(reintentar)
			if _G.NXV2 and _G.NXV2.onReady then _G.NXV2.onReady(reintentar) end
		end
	end


	-- Link + acciones (v3.8.1 · reestructurado en DOS filas)
	-- Antes: link + 3 botones de 88 px en UNA sola fila de 30 px. Al reducir la
	-- ventana los botones se montaban sobre el link y el texto se salía. Ahora el
	-- link ocupa una fila ENTERA arriba (siempre visible y completo) y los 2
	-- botones (Abrir Perfil / Copiar link) van en una segunda fila a mitades con
	-- un UIListLayout (nunca se solapan, se adaptan al ancho). El botón Reportar
	-- se retiró a pedido del usuario. Los handlers son los de siempre.
	local linkFrame = Instance.new("Frame", profileScroll)
	linkFrame.LayoutOrder = 2
	linkFrame.Size = UDim2.new(1, -4, 0, 66)
	linkFrame.BackgroundColor3 = C.card
	linkFrame.BorderSizePixel = 0
	linkFrame.ClipsDescendants = true
	Instance.new("UICorner", linkFrame).CornerRadius = UDim.new(0, 4)
	themed(linkFrame, "BackgroundColor3", "card")

	local linkBox = Instance.new("TextBox", linkFrame)
	linkBox.Size = UDim2.new(1, -12, 0, 28)
	linkBox.Position = UDim2.new(0, 6, 0, 4)
	linkBox.BackgroundColor3 = C.link
	linkBox.Font = Enum.Font.Code
	linkBox.TextSize = 12
	linkBox.TextColor3 = Color3.fromRGB(120, 200, 255)
	linkBox.Text = data.ProfileUrl
	linkBox.ClearTextOnFocus = false
	linkBox.TextEditable = false
	linkBox.TextXAlignment = Enum.TextXAlignment.Left
	linkBox.TextTruncate = Enum.TextTruncate.AtEnd
	linkBox.BorderSizePixel = 0
	themed(linkBox, "BackgroundColor3", "link")
	Instance.new("UICorner", linkBox).CornerRadius = UDim.new(0, 4)
	local lbPad = Instance.new("UIPadding", linkBox)
	lbPad.PaddingLeft = UDim.new(0, 8); lbPad.PaddingRight = UDim.new(0, 8)

	-- Segunda fila: los 3 botones en tercios iguales (el layout los separa).
	local actRow = Instance.new("Frame", linkFrame)
	actRow.Size = UDim2.new(1, -12, 0, 26)
	actRow.Position = UDim2.new(0, 6, 0, 36)
	actRow.BackgroundTransparency = 1
	local actLay = Instance.new("UIListLayout", actRow)
	actLay.FillDirection = Enum.FillDirection.Horizontal
	actLay.Padding = UDim.new(0, 8)
	actLay.HorizontalAlignment = Enum.HorizontalAlignment.Left
	actLay.VerticalAlignment = Enum.VerticalAlignment.Center
	actLay.SortOrder = Enum.SortOrder.LayoutOrder
	local BTN = UDim2.new(0.5, -4, 1, 0)   -- media fila menos el aire (2 botones)

	local openProfile = Instance.new("TextButton", actRow)
	openProfile.LayoutOrder = 1
	openProfile.Size = BTN
	openProfile.BackgroundColor3 = C.neutral
	openProfile.Text = "Abrir Perfil"
	openProfile.Font = Enum.Font.GothamBold
	openProfile.TextSize = 12
	openProfile.TextColor3 = C.text
	openProfile.BorderSizePixel = 0
	openProfile.TextTruncate = Enum.TextTruncate.AtEnd
	Instance.new("UICorner", openProfile).CornerRadius = UDim.new(0, 4)
	themed(openProfile, "BackgroundColor3", "neutral")
	themed(openProfile, "TextColor3", "text")
	openProfile.MouseButton1Click:Connect(function()
		local opened = openURL(data.ProfileUrl)
		if opened then
			statusLabel.Text = "✓ Perfil abierto en el navegador."
		else
			statusLabel.Text = "No disponible en tu executor. Te dejo el link para copiarlo."
			showLinkModal(data.ProfileUrl)
		end
	end)

	local copyLink = Instance.new("TextButton", actRow)
	copyLink.LayoutOrder = 2
	copyLink.Size = BTN
	copyLink.BackgroundColor3 = C.accent
	copyLink.Text = "Copiar link"
	copyLink.Font = Enum.Font.GothamBold
	copyLink.TextSize = 12
	copyLink.TextColor3 = C.onAccent
	copyLink.BorderSizePixel = 0
	copyLink.TextTruncate = Enum.TextTruncate.AtEnd
	Instance.new("UICorner", copyLink).CornerRadius = UDim.new(0, 4)
	themed(copyLink, "BackgroundColor3", "accent")
	themed(copyLink, "TextColor3", "onAccent")
	copyLink.MouseButton1Click:Connect(function()
		clipboard(data.ProfileUrl)
		statusLabel.Text = "Link del perfil copiado"
		copyLink.Text = "¡Copiado!"
		task.delay(1.2, function()
			if copyLink and copyLink.Parent then copyLink.Text = "Copiar link" end
		end)
	end)

	-- Estado (presencia en tiempo real). Color re-derivado del TIPO (v3.1.0)
	-- para que respete el tema actual en cada render.
	local estadoRow = addRow(profileScroll, "Estado", data.Presence, false, presenceColorFor(data.PresenceType))
	estadoRow.LayoutOrder = 3

	-- Botón "Unirse a su servidor" (solo si está jugando y hay datos públicos)
	if data.PresenceType == 2 and data.PresencePlace and data.PresenceGame then
		local joinFrame = Instance.new("Frame", profileScroll)
		joinFrame.LayoutOrder = 4
		joinFrame.Size = UDim2.new(1, -4, 0, 32)
		joinFrame.BackgroundTransparency = 1
		local joinBtn = Instance.new("TextButton", joinFrame)
		joinBtn.Size = UDim2.new(1, 0, 1, 0)
		joinBtn.BackgroundColor3 = C.good
		joinBtn.Text = "Unirse a su servidor"
		joinBtn.Font = Enum.Font.GothamBold
		joinBtn.TextSize = 14
		joinBtn.TextColor3 = C.onAccent
		joinBtn.BorderSizePixel = 0
		Instance.new("UICorner", joinBtn).CornerRadius = UDim.new(0, 6)
		joinBtn.MouseButton1Click:Connect(function()
			statusLabel.Text = "Intentando unirse..."
			local TS = game:GetService("TeleportService")
			local ok = pcall(function()
				TS:TeleportToPlaceInstance(data.PresencePlace, data.PresenceGame, player)
			end)
			if not ok then
				statusLabel.Text = "No disponible (servidor lleno, privado o sin acceso)."
			end
		end)
	end

	addRow(profileScroll, "Username", data.Username, false).LayoutOrder = 5
	addRow(profileScroll, "Display Name", data.DisplayName, false).LayoutOrder = 6
	addRow(profileScroll, "UserId", data.UserId, true).LayoutOrder = 7            -- botón Copiar ID
	addRow(profileScroll, "Suscripción", data.Subscription, false).LayoutOrder = 8
	-- (v3.8.3) "Verificado" se movió al panel " Verificación" (que además cruza
	-- las dos fuentes) para no mostrarlo duplicado aquí y allá.
	addRow(profileScroll, "Baneado", data.Banned, false,
		(data.Banned == "Sí") and C.bad or C.text).LayoutOrder = 10
	addRow(profileScroll, "Creación", data.Created, false).LayoutOrder = 11
	addRow(profileScroll, "Edad de cuenta", data.AccountAge, false).LayoutOrder = 12
	addDescription(profileScroll, data.Description).LayoutOrder = 13


	-- ---------- HISTORIAL DE NOMBRES (reincorporado en v3.1.0) ----------
	-- Tarjeta con el nombre actual + nombres anteriores (API username-history).
	-- Caché por-sección (data._namesCached) para no re-pedir al cambiar tema.
	local historyFrame = Instance.new("Frame", profileScroll)
	historyFrame.Name = "NameHistory"
	historyFrame.LayoutOrder = 15   -- 14 lo ocupa ahora el Panel de Identidad
	historyFrame.Size = UDim2.new(1, -4, 0, 0)
	historyFrame.BackgroundTransparency = 1
	historyFrame.AutomaticSize = Enum.AutomaticSize.Y
	local historyLayout = Instance.new("UIListLayout", historyFrame)
	historyLayout.Padding = UDim.new(0, 4)
	historyLayout.SortOrder = Enum.SortOrder.LayoutOrder

	local histTitle = Instance.new("TextLabel", historyFrame)
	histTitle.LayoutOrder = 0
	histTitle.Size = UDim2.new(1, 0, 0, 24)
	histTitle.BackgroundTransparency = 1
	histTitle.Font = Enum.Font.GothamBold
	histTitle.TextSize = 14
	histTitle.TextColor3 = C.accent
	histTitle.Text = "Historial de nombres"
	histTitle.TextXAlignment = Enum.TextXAlignment.Left

	local loadingHist = Instance.new("TextLabel", historyFrame)
	loadingHist.LayoutOrder = 1
	loadingHist.Size = UDim2.new(1, 0, 0, 20)
	loadingHist.BackgroundTransparency = 1
	loadingHist.Font = Enum.Font.Gotham
	loadingHist.TextSize = 12
	loadingHist.TextColor3 = C.subtext
	loadingHist.Text = "Cargando..."
	loadingHist.TextXAlignment = Enum.TextXAlignment.Left

	local historyFor = data.UserId
	-- Pasa por el canal compartido de NX Plus: el Panel de Identidad pide lo
	-- mismo y se dibuja a la vez, así que sin esto salían DOS peticiones a
	-- username-history por perfil. Fallback al método directo si el módulo no
	-- estuviera cargado, para no depender de él.
	local function conNombres(cb)
		-- Solo la DETECCIÓN va en pcall. Si se envolviera también la llamada, un
		-- error dentro de cb haría creer que el módulo falló y dispararía además
		-- el fallback: el historial se pintaría dos veces.
		local viaModulo
		pcall(function()
			if _G.NXPlus and type(_G.NXPlus.nombres) == "function" then
				viaModulo = _G.NXPlus.nombres
			end
		end)
		if viaModulo then viaModulo(data, cb); return end
		task.spawn(function()
			local names, hasMore = getNameHistory(data.UserId)
			data._namesCached = names or false
			data._namesHasMore = hasMore or false
			cb(names, hasMore)
		end)
	end
	conNombres(function(names, hasMore)
		if currentData == nil or currentData.UserId ~= historyFor then return end
		if not historyFrame.Parent then return end
		if loadingHist and loadingHist.Parent then loadingHist:Destroy() end

		if not names then
			local err = Instance.new("TextLabel", historyFrame)
			err.LayoutOrder = 1
			err.Size = UDim2.new(1, 0, 0, 20)
			err.BackgroundTransparency = 1
			err.Font = Enum.Font.Gotham
			err.TextSize = 12
			err.TextColor3 = C.bad
			err.Text = "No disponible."
			err.TextXAlignment = Enum.TextXAlignment.Left
			return
		end

		-- nombre actual (destacado)
		local current = Instance.new("Frame", historyFrame)
		current.LayoutOrder = 1
		current.Size = UDim2.new(1, 0, 0, 24)
		current.BackgroundColor3 = C.accent
		current.BackgroundTransparency = 0.8
		current.BorderSizePixel = 0
		current.ClipsDescendants = true
		Instance.new("UICorner", current).CornerRadius = UDim.new(0, 4)
		local curLabel = Instance.new("TextLabel", current)
		curLabel.Size = UDim2.new(1, -10, 1, 0)
		curLabel.Position = UDim2.new(0, 5, 0, 0)
		curLabel.BackgroundTransparency = 1
		curLabel.Font = Enum.Font.GothamBold
		curLabel.TextSize = 13
		curLabel.TextColor3 = C.text
		curLabel.Text = "Actual: " .. data.Username
		curLabel.TextXAlignment = Enum.TextXAlignment.Left
		curLabel.TextTruncate = Enum.TextTruncate.AtEnd

		if #names > 0 then
			local prevHeader = Instance.new("TextLabel", historyFrame)
			prevHeader.LayoutOrder = 2
			prevHeader.Size = UDim2.new(1, 0, 0, 20)
			prevHeader.BackgroundTransparency = 1
			prevHeader.Font = Enum.Font.Gotham
			prevHeader.TextSize = 12
			prevHeader.TextColor3 = C.subtext
			prevHeader.Text = "Nombres anteriores (" .. #names .. "):"
			prevHeader.TextXAlignment = Enum.TextXAlignment.Left

			for i, name in ipairs(names) do
				local entry = Instance.new("Frame", historyFrame)
				entry.LayoutOrder = 2 + i
				entry.Size = UDim2.new(1, 0, 0, 20)
				entry.BackgroundTransparency = 1
				entry.ClipsDescendants = true
				local entryLabel = Instance.new("TextLabel", entry)
				entryLabel.Size = UDim2.new(1, -10, 1, 0)
				entryLabel.Position = UDim2.new(0, 5, 0, 0)
				entryLabel.BackgroundTransparency = 1
				entryLabel.Font = Enum.Font.Gotham
				entryLabel.TextSize = 12
				entryLabel.TextColor3 = C.text
				entryLabel.Text = "• " .. name
				entryLabel.TextXAlignment = Enum.TextXAlignment.Left
				entryLabel.TextTruncate = Enum.TextTruncate.AtEnd
			end

			if hasMore then
				local more = Instance.new("TextLabel", historyFrame)
				more.LayoutOrder = 3 + #names
				more.Size = UDim2.new(1, 0, 0, 20)
				more.BackgroundTransparency = 1
				more.Font = Enum.Font.Gotham
				more.TextSize = 11
				more.TextColor3 = C.subtext
				more.Text = "Hay más nombres (solo se muestran los primeros 1000)."
				more.TextXAlignment = Enum.TextXAlignment.Left
			end
		else
			local none = Instance.new("TextLabel", historyFrame)
			none.LayoutOrder = 2
			none.Size = UDim2.new(1, 0, 0, 20)
			none.BackgroundTransparency = 1
			none.Font = Enum.Font.Gotham
			none.TextSize = 12
			none.TextColor3 = C.text
			none.Text = "Sin nombres anteriores."
			none.TextXAlignment = Enum.TextXAlignment.Left
		end
	end)

	-- ---------- PESTAÑA ESTADÍSTICAS ----------
	addFriendsDropdown(statsScroll, data, 1)   -- "Amigos" desplegable (lista in-situ)
	addRow(statsScroll, "Seguidores", data.Followers, false).LayoutOrder = 2
	addRow(statsScroll, "Siguiendo", data.Following, false).LayoutOrder = 3
	addRow(statsScroll, "Grupos", data.Groups, false).LayoutOrder = 4
	addRow(statsScroll, "Badges", data.Badges, false).LayoutOrder = 5
	addRow(statsScroll, "Favoritos", data.Favorites, false).LayoutOrder = 6
	addRow(statsScroll, "Experiencias creadas", data.CreatedGames, false).LayoutOrder = 7

	local exportFrame = Instance.new("Frame", statsScroll)
	exportFrame.LayoutOrder = 8
	exportFrame.Size = UDim2.new(1, -4, 0, 36)
	exportFrame.BackgroundTransparency = 1

	local function mkBtn(text, x)
		local b = Instance.new("TextButton", exportFrame)
		b.Size = UDim2.new(0, 130, 0, 28)
		b.Position = UDim2.new(0, x, 0, 4)
		b.BackgroundColor3 = C.neutral
		b.Text = text
		b.Font = Enum.Font.GothamBold
		b.TextSize = 13
		b.TextColor3 = C.text
		b.BorderSizePixel = 0
		Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
		return b
	end

	local order = {
		{"Username","Username"},{"Display Name","DisplayName"},{"UserId","UserId"},{"Link","ProfileUrl"},
		{"Suscripción","Subscription"},{"Estado","Presence"},{"Verificado","Verified"},{"Baneado","Banned"},
		{"Creación","Created"},{"Edad de cuenta","AccountAge"},{"Descripción","Description"},
		{"Amigos","Friends"},{"Seguidores","Followers"},{"Siguiendo","Following"},
		{"Grupos","Groups"},{"Badges","Badges"},{"Favoritos","Favorites"},
		{"Experiencias creadas","CreatedGames"},
	}

	-- Construye las líneas de texto del informe (incluye historial de nombres).
	local function buildTxtLines()
		local lines = {}
		for _, pair in ipairs(order) do
			table.insert(lines, pair[1] .. ": " .. tostring(data[pair[2]] == nil and "No disponible" or data[pair[2]]))
		end
		-- Nombres anteriores. Si la API falló o no hay, lo decimos explícito
		-- en vez de omitir la línea (así el TXT siempre lleva el dato).
		if type(data._namesCached) == "table" and #data._namesCached > 0 then
			local extra = data._namesHasMore and " (y más)" or ""
			lines[#lines+1] = "Nombres anteriores: " .. table.concat(data._namesCached, ", ") .. extra
		elseif data._namesCached == false then
			lines[#lines+1] = "Nombres anteriores: no disponible"
		else
			lines[#lines+1] = "Nombres anteriores: ninguno"
		end
		return lines
	end

	-- Copia "limpia" de data para exportar: sin los campos de caché internos
	-- (prefijo "_") y con los nombres anteriores ya incluidos.
	local function buildExportData()
		local out = {}
		for k, v in pairs(data) do
			if type(k) ~= "string" or k:sub(1, 1) ~= "_" then
				out[k] = v
			end
		end
		out.NombresAnteriores = (type(data._namesCached) == "table") and data._namesCached or {}
		return out
	end

	-- Asegura que el historial de nombres esté en caché antes de exportar.
	-- Si aún no se pidió (p. ej. no abriste la pestaña Perfil), lo pide bajo
	-- demanda y ejecuta "after" al terminar. Reusa la caché si ya existe.
	local function withNames(prepMsg, after)
		if data._namesCached ~= nil then
			after()
			return
		end
		statusLabel.Text = prepMsg
		local wantFor = data.UserId
		task.spawn(function()
			local names, hasMore = getNameHistory(data.UserId)
			data._namesCached = names or false
			data._namesHasMore = hasMore or false
			-- Si cambiaste de perfil mientras se pedía, no copiamos ni
			-- pisamos el estado del perfil nuevo.
			if currentData and currentData.UserId ~= wantFor then return end
			after()
		end)
	end

	-- Feedback visual EN EL PROPIO BOTÓN: cambia a "✓"/"" un instante y vuelve.
	local function flashBtn(btn, msg)
		local prev = btn.Text
		btn.Text = msg
		task.delay(1.1, function()
			if btn and btn.Parent then btn.Text = prev end
		end)
	end

	local txtBtn = mkBtn("Copiar TXT", 0)
	txtBtn.MouseButton1Click:Connect(function()
		withNames("Preparando TXT (historial de nombres)...", function()
			local ok = pcall(function() clipboard(table.concat(buildTxtLines(), "\n")) end)
			if ok then
				statusLabel.Text = "✓ Copiado a portapapeles (TXT)"
				flashBtn(txtBtn, "Copiado ✓")
			else
				statusLabel.Text = "No disponible (tu executor no da acceso al portapapeles)."
				flashBtn(txtBtn, "Error")
			end
		end)
	end)

	local jsonBtn = mkBtn("Copiar JSON", 140)
	jsonBtn.MouseButton1Click:Connect(function()
		withNames("Preparando JSON (historial de nombres)...", function()
			local ok = pcall(function() clipboard(HttpService:JSONEncode(buildExportData())) end)
			if ok then
				statusLabel.Text = "✓ Copiado a portapapeles (JSON)"
				flashBtn(jsonBtn, "Copiado ✓")
			else
				statusLabel.Text = "No disponible (tu executor no da acceso al portapapeles)."
				flashBtn(jsonBtn, "Error")
			end
		end)
	end)

	-- ---------- PESTAÑA ITEMS (avatar + precio + grupos + badges + RAP) ----------
	local priceCard = addNoteCard(itemsScroll, "Precio del avatar", "Calculando...", C.good)
	priceCard.LayoutOrder = 1

	local itemsCard = addNoteCard(itemsScroll, "Items equipados", "Cargando...", C.accent)
	itemsCard.LayoutOrder = 2

	local groupsCard = addNoteCard(itemsScroll, "Grupos", "Cargando...", C.accent)
	groupsCard.LayoutOrder = 3

	local badgesCard = addNoteCard(itemsScroll, "Badges recientes", "Cargando...", C.accent)
	badgesCard.LayoutOrder = 4

	local rapCard = addNoteCard(itemsScroll, "RAP (valor limiteds)",
		"Consultando Rolimon's (web externa)...", C.warn)
	rapCard.LayoutOrder = 5

	local function bodyOf(card)
		for _, ch in ipairs(card:GetChildren()) do
			if ch:IsA("TextLabel") and ch.LayoutOrder == 1 then return ch end
		end
	end

	local itemsFor = data.UserId
	task.spawn(function()
		local items, total
		if data._itemsCached ~= nil then
			items = data._itemsCached or nil
			total = data._itemsTotalCached or 0
		else
			items, total = getWornItems(data.UserId)
			data._itemsCached = items or false
			data._itemsTotalCached = total or 0
		end
		if currentData == nil or currentData.UserId ~= itemsFor then return end
		local b = bodyOf(itemsCard)
		local pb = bodyOf(priceCard)
		if not items then
			if b then b.Text = "No disponible." end
			if pb then pb.Text = "No disponible." end
			return
		end
		if #items == 0 then
			if b then b.Text = "No lleva items equipados." end
			if pb then pb.Text = "0 R$ (sin items con precio)." end
			return
		end
		if pb then
			pb.Text = "≈ " .. tostring(total) .. " R$ en total\n"
				.. "(Suma del precio de catálogo de lo equipado. Aproximado: "
				.. "los items gratis o sin precio cuentan como 0.)"
		end
		local names = {}
		for _, it in ipairs(items) do
			local priceTxt = (it.price and it.price > 0) and (" — " .. it.price .. " R$") or ""
			table.insert(names, "• " .. (it.name or ("Asset " .. it.id)) .. priceTxt)
		end
		if b then b.Text = #items .. " item(s):\n" .. table.concat(names, "\n") end
		local grid = Instance.new("Frame", itemsCard)
		grid.LayoutOrder = 2
		grid.Size = UDim2.new(1, 0, 0, 0)
		grid.AutomaticSize = Enum.AutomaticSize.Y
		grid.BackgroundTransparency = 1
		local gl = Instance.new("UIGridLayout", grid)
		gl.CellSize = UDim2.new(0, 56, 0, 56)
		gl.CellPadding = UDim2.new(0, 6, 0, 6)
		for _, it in ipairs(items) do
			local thumb = Instance.new("ImageLabel", grid)
			thumb.Size = UDim2.new(0, 56, 0, 56)
			thumb.BackgroundColor3 = C.neutral
			thumb.BorderSizePixel = 0
			thumb.Image = ("rbxthumb://type=Asset&id=%d&w=150&h=150"):format(it.id)
			Instance.new("UICorner", thumb).CornerRadius = UDim.new(0, 6)
		end
	end)

	task.spawn(function()
		local groups
		if data._groupsCached ~= nil then
			groups = data._groupsCached or nil
		else
			groups = getGroupsDetailed(data.UserId)
			data._groupsCached = groups or false
		end
		if currentData == nil or currentData.UserId ~= itemsFor then return end
		local b = bodyOf(groupsCard); if not b then return end
		if not groups then b.Text = "No disponible." ; return end
		-- Con Data Validation ON se descartan las entradas mal formadas (sin
		-- nombre o sin rol) en vez de pintarlas como "?  —  ?".
		local descartados = 0
		if Shield.flags.data then
			groups, descartados = Shield.valid.list(groups, Shield.shape.group)
		end
		if #groups == 0 then
			b.Text = (descartados > 0)
				and ("Sin grupos válidos (" .. descartados .. " entrada(s) descartada(s) por datos corruptos).")
				or  "No está en ningún grupo."
			return
		end
		local lines = {}
		for _, g in ipairs(groups) do
			table.insert(lines, "• " .. g.name .. "  —  " .. g.role)
		end
		b.Text = #groups .. " grupo(s):\n" .. table.concat(lines, "\n")
			.. ((descartados > 0) and ("\n" .. descartados .. " entrada(s) descartada(s) por NX Shields.") or "")
	end)

	task.spawn(function()
		local badges
		if data._badgesCached ~= nil then
			badges = data._badgesCached or nil
		else
			badges = getRecentBadges(data.UserId, 12)
			data._badgesCached = badges or false
		end
		if currentData == nil or currentData.UserId ~= itemsFor then return end
		local b = bodyOf(badgesCard); if not b then return end
		if not badges then b.Text = "No disponible." ; return end
		local descartados = 0
		if Shield.flags.data then
			badges, descartados = Shield.valid.list(badges, Shield.shape.badge)
		end
		if #badges == 0 then
			b.Text = (descartados > 0)
				and ("Sin badges válidos (" .. descartados .. " descartado(s) por datos corruptos).")
				or  "Sin badges recientes."
			return
		end
		local lines = {}
		for _, bd in ipairs(badges) do table.insert(lines, "• " .. bd.name) end
		b.Text = "Últimos " .. #badges .. ":\n" .. table.concat(lines, "\n")
			.. ((descartados > 0) and ("\n" .. descartados .. " descartado(s) por NX Shields.") or "")
	end)

	-- RAP COMPARTIDO. Antes, la tarjeta de RAP y el recálculo de Influencia
	-- lanzaban getRAP() a la vez con _rapCached todavía en nil: DOS peticiones
	-- simultáneas a Rolimon's por cada render (y el render se repite en cada
	-- cambio de tema). Ahora la primera llamada crea la petición y la segunda
	-- se cuelga de la misma, esperando su resultado.
	local function withRAP(cb)
		if data._rapCached ~= nil then
			cb(data._rapCached or nil)
			return
		end
		data._rapWaiters = data._rapWaiters or {}
		table.insert(data._rapWaiters, cb)
		if data._rapInflight then return end       -- ya hay una petición en curso
		data._rapInflight = true
		task.spawn(function()
			local rap, motivo = getRAP(data.UserId)
			data._rapMotivo = motivo          -- por qué falta (lo lee la tarjeta)
			local val = rap and tonumber(rap.rap) or nil
			-- El RAP también se valida: un valor negativo o no numérico se descarta.
			if Shield.flags.data and val ~= nil and (val < 0 or val ~= math.floor(val)) then
				val = nil
			end
			data._rapCached  = val or false
			data._rapInflight = false
			local waiters = data._rapWaiters or {}
			data._rapWaiters = nil
			for _, fn in ipairs(waiters) do pcall(fn, val) end
		end)
	end

	task.spawn(function()
		local rapVal
		do
			local hecho, valor = false, nil
			withRAP(function(v) hecho, valor = true, v end)
			while not hecho do task.wait(0.05) end
			rapVal = valor
		end
		if currentData == nil or currentData.UserId ~= itemsFor then return end
		local b = bodyOf(rapCard); if not b then return end
		if not rapVal or rapVal <= 0 then
			-- Mensaje según la causa REAL. Antes siempre culpaba al executor,
			-- lo cual desde 2026-07 es falso: la API de Rolimon's se retiró.
			local m = data._rapMotivo
			if m == "movida" then
				b.Text = "No disponible · Rolimon's retiró su API pública."
			elseif m == "sin_respuesta" then
				b.Text = "No disponible · la fuente externa no respondió."
			else
				b.Text = "No disponible · sin limiteds o sin valor publicado."
			end
			return
		end
		b.Text = "RAP estimado: " .. tostring(rapVal) .. " R$\n(Fuente: Rolimon's, valor aproximado, NO oficial.)"
	end)

	-- ---------- PESTAÑA ANÁLISIS ----------
	-- TARJETA DE INTEGRIDAD (NX Shields). Encabeza la pestaña y dice, con el
	-- resultado real de las comprobaciones, de qué se puede fiar el usuario.
	do
		local st = data._state or "verified"
		local ETIQ = {
			verified   = { "Datos verificados",     C.good, "Todas las respuestas pasaron la validación." },
			partial    = { "Datos parciales",       C.warn, "Algunas consultas no respondieron. Lo que falta aparece como \"No disponible\"." },
			incomplete = { "Datos incompletos",     C.warn, "Faltan campos clave del perfil." },
			error      = { "Datos no verificables", C.bad,  "Parte de la respuesta no pasó la validación y no se muestra." },
		}
		local e = ETIQ[st] or ETIQ.verified
		-- En modo normal esta tarjeta solo aparece si hay algo que advertir: con
		-- todo verificado no aporta nada y se come la primera pantalla.
		if st ~= "verified" or Shield.adv() then
			local cuerpo = e[3]
			if Shield.adv() then
				local probs = Shield.problemas(data)
				if #probs > 0 then
					cuerpo = cuerpo .. "\n\nDetalle:\n• " .. table.concat(probs, "\n• ")
				end
				if data._timedOut then
					cuerpo = cuerpo .. "\n\nAlguna consulta superó el tiempo límite de 15 s."
				end
				if not Shield.flags.api or not Shield.flags.data then
					local off = {}
					if not Shield.flags.api  then off[#off + 1] = "Verificación API" end
					if not Shield.flags.data then off[#off + 1] = "Validación de datos" end
					cuerpo = cuerpo .. "\n\nProtección desactivada: " .. table.concat(off, " · ")
						.. ". Los datos se muestran sin capa de verificación."
				end
			end
			addNoteCard(analysisScroll, e[1], cuerpo, e[2]).LayoutOrder = 0
		end
	end

	-- ---------- USERNAME DECODER (inferencia LOCAL, NO confirma identidad) ----------
	-- Va AQUÍ (LayoutOrder 1, arriba) y ANTES del corte por datos incompletos: solo
	-- necesita el username, que siempre existe, así que debe salir en TODO perfil
	-- aunque las heurísticas de scoring no sean calculables. Todo local: no sale
	-- ni un byte del username a la red.
	do
		local dec = _G.NXDecoder
		if dec then
			local function titulo(name)
				return name:sub(1, 1):upper() .. name:sub(2)
			end
			local function fmtOne(res)
				local lines = {}
				if #res.subs > 0 then
					lines[#lines + 1] = "Sustituciones: " .. table.concat(res.subs, ", ")
				end
				if #res.candidates == 0 then
					lines[#lines + 1] = "Sin datos suficientes para inferir un nombre."
				else
					lines[#lines + 1] = "Posibles nombres:"
					for i, c in ipairs(res.candidates) do
						lines[#lines + 1] = string.format("  %d. %s — %s", i, titulo(c.name), c.level)
					end
				end
				return table.concat(lines, "\n")
			end

			local cur = dec.analyze(data.Username)
			local function buildBody(histLines)
				local parts = { "Username: " .. tostring(data.Username), fmtOne(cur) }
				if histLines and #histLines > 0 then
					parts[#parts + 1] = "\nNombres previos (historial):\n" .. table.concat(histLines, "\n")
				end
				parts[#parts + 1] = "\n⚠ Es una INFERENCIA sobre texto público, NO una identidad confirmada."
				return table.concat(parts, "\n")
			end

			local topLvl = (cur.candidates[1] and cur.candidates[1].level) or "Insuficiente"
			local decColor = (topLvl == "Alta") and C.good
				or ((topLvl == "Media") and C.accent or C.subtext)
			local decCard = addNoteCard(analysisScroll, "🔤 Username Decoder", buildBody(nil), decColor)
			decCard.LayoutOrder = 1

			-- Historial: reutiliza el fetch compartido (deduplica y cachea; mismo
			-- endpoint rate-limited que ya usan Identidad e Historial de nombres).
			if _G.NXPlus and type(_G.NXPlus.nombres) == "function" then
				local decFor = data.UserId
				_G.NXPlus.nombres(data, function(lista)
					if currentData == nil or currentData.UserId ~= decFor then return end
					if not decCard.Parent then return end
					local bodyLabel
					for _, ch in ipairs(decCard:GetChildren()) do
						if ch:IsA("TextLabel") and ch.LayoutOrder == 1 then bodyLabel = ch end
					end
					if not bodyLabel then return end
					local extra, shown = {}, 0
					for _, prevName in ipairs(lista or {}) do
						if prevName ~= data.Username and shown < 6 then
							local r = dec.analyze(prevName)
							local top = r.candidates[1]
							if top then
								extra[#extra + 1] = string.format("• %s → %s (%s)", prevName, titulo(top.name), top.level)
							else
								extra[#extra + 1] = string.format("• %s → sin datos", prevName)
							end
							shown = shown + 1
						end
					end
					if #extra > 0 then bodyLabel.Text = buildBody(extra) end
				end)
			end
		end
	end

	-- ¿Hay base suficiente para puntuar? Si faltan 2+ pilares (amigos, badges,
	-- grupos, juegos), las heurísticas leerían nil como 0 y devolverían un
	-- "Riesgo ALT alto" INVENTADO sobre una cuenta normal cuya API falló.
	local fiable, faltantes = Shield.scoresFiables(data)
	if not fiable then
		addNoteCard(analysisScroll,
			"Análisis no calculable",
			"Faltan datos que son pilares del modelo:\n• "
				.. table.concat(faltantes, "\n• ")
				.. "\n\nSin ellos el resultado no sería fiable, así que no se publica.",
			C.bad).LayoutOrder = 1
		return
	end

	local trustScore, trustLvl, trustColor, trustReasons = computeTrust(data)
	local altScore,   altLvl,   altColor,   altSignals, altBreakdown = computeAltRisk(data)
	local actScore,   actLvl,   actColor                 = computeActivity(data)
	local inflScore,  inflLvl,  inflColor                = computeInfluence(data, nil)

	local advCard = Instance.new("Frame", analysisScroll)
	advCard.LayoutOrder = 1
	advCard.Size = UDim2.new(1, -4, 0, 0)
	advCard.AutomaticSize = Enum.AutomaticSize.Y
	advCard.BackgroundColor3 = C.card
	advCard.BorderSizePixel = 0
	advCard.ClipsDescendants = true
	Instance.new("UICorner", advCard).CornerRadius = UDim.new(0, 4)
	local advStroke = Instance.new("UIStroke", advCard)
	advStroke.Color = C.accent; advStroke.Transparency = 0.4
	local advPad = Instance.new("UIPadding", advCard)
	advPad.PaddingTop = UDim.new(0,8); advPad.PaddingBottom = UDim.new(0,8)
	advPad.PaddingLeft = UDim.new(0,10); advPad.PaddingRight = UDim.new(0,10)
	local advLay = Instance.new("UIListLayout", advCard)
	advLay.Padding = UDim.new(0, 6); advLay.SortOrder = Enum.SortOrder.LayoutOrder

	local advTitle = Instance.new("TextLabel", advCard)
	advTitle.LayoutOrder = 0; advTitle.Size = UDim2.new(1,0,0,20)
	advTitle.BackgroundTransparency = 1
	advTitle.Font = Enum.Font.GothamBold; advTitle.TextSize = 14
	advTitle.TextColor3 = C.accent
	advTitle.Text = "Puntuaciones"
	advTitle.TextXAlignment = Enum.TextXAlignment.Left

	addScoreBar(advCard, "Confianza", trustScore, trustLvl, trustColor, 1)
	addScoreBar(advCard, "Actividad", actScore, actLvl, actColor, 2)
	local _, inflFill, inflVal = addScoreBar(advCard, "Influencia", inflScore, inflLvl, inflColor, 3)
	addScoreBar(advCard, "Riesgo ALT", altScore, altLvl, altColor, 4)

	local summaryLbl = Instance.new("TextLabel", advCard)
	summaryLbl.LayoutOrder = 5
	summaryLbl.Size = UDim2.new(1, 0, 0, 0)
	summaryLbl.AutomaticSize = Enum.AutomaticSize.Y
	summaryLbl.BackgroundTransparency = 1
	summaryLbl.Font = Enum.Font.Gotham; summaryLbl.TextSize = 12
	summaryLbl.TextColor3 = C.text
	summaryLbl.TextWrapped = true
	summaryLbl.TextXAlignment = Enum.TextXAlignment.Left
	summaryLbl.TextYAlignment = Enum.TextYAlignment.Top
	summaryLbl.Text = buildSummary(data, trustScore, trustLvl, altScore, altLvl, inflScore, inflLvl, actLvl)

	-- RAP llega async → recalcula Influencia (usa el RAP cacheado si ya está)
	local advFor = data.UserId
	withRAP(function(rapVal)
		if currentData == nil or currentData.UserId ~= advFor then return end
		if not advCard.Parent then return end
		if rapVal and rapVal > 0 then
			local ns, nl, nc = computeInfluence(data, rapVal)
			inflFill.Size = UDim2.new(math.clamp(ns/100, 0, 1), 0, 1, 0)
			inflFill.BackgroundColor3 = nc
			inflVal.Text = string.format("%d/100 · %s (incl. RAP)", ns, nl)
			inflVal.TextColor3 = nc
			summaryLbl.Text = buildSummary(data, trustScore, trustLvl, altScore, altLvl, ns, nl, actLvl)
		end
	end)

	-- Los desgloses son la letra pequeña del modelo: solo en modo avanzado.
	if Shield.adv() then
		addNoteCard(analysisScroll,
			"Confianza: " .. trustScore .. "/100  (" .. trustLvl .. ")",
			"Puntaje heurístico, no oficial. Desglose:\n• " .. table.concat(trustReasons, "\n• "),
			trustColor).LayoutOrder = 2
	end

	-- Riesgo ALT: explicación contextual (según nivel) + factores con ✓ +
	-- desglose ponderado por área (transparencia del modelo).
	local altContext
	if Shield.adv() then
	if altScore >= 61 then
		altContext = "Esta cuenta presenta varias características comunes en cuentas "
			.. "secundarias (alt)."
	elseif altScore >= 41 then
		altContext = "Señales mixtas: podría ser un alt o una cuenta nueva/poco activa "
			.. "pero legítima."
	else
		altContext = "La cuenta NO muestra patrones típicos de cuenta secundaria."
	end
	local altFactorsTxt = (#altSignals == 0)
		and "Factores detectados:\n(ninguno relevante)"
		or  ("Factores detectados:\n✓ " .. table.concat(altSignals, "\n✓ "))
	local bd = {}
	for _, b in ipairs(altBreakdown) do
		bd[#bd + 1] = string.format("• %s: %d/100 (peso %d%%)", b[1], b[2], b[3])
	end
	addNoteCard(analysisScroll,
		"Riesgo de ALT: " .. altScore .. "/100  (" .. altLvl .. ")",
		altContext .. "\n\n" .. altFactorsTxt
			.. "\n\nDesglose ponderado (riesgo por área):\n" .. table.concat(bd, "\n")
			.. "\n\nHeurística sobre datos públicos: no prueba que la cuenta sea un alt.",
		altColor).LayoutOrder = 3
	end

	local mutualCard = addNoteCard(analysisScroll,
		"Amigos en común",
		(data.UserId == player.UserId) and "Estás viendo tu propia cuenta." or "Calculando...",
		C.accent)
	mutualCard.LayoutOrder = 4

	if data.UserId ~= player.UserId then
		local renderedFor = data.UserId
		task.spawn(function()
			local mutual
			if data._mutualCached ~= nil then
				mutual = data._mutualCached or nil
			else
				mutual = getMutualFriends(data.UserId)
				data._mutualCached = mutual or false
			end
			if currentData == nil or currentData.UserId ~= renderedFor then return end
			if not mutualCard.Parent then return end
			local bodyLabel
			for _, ch in ipairs(mutualCard:GetChildren()) do
				if ch:IsA("TextLabel") and ch.LayoutOrder == 1 then bodyLabel = ch end
			end
			if not bodyLabel then return end
			if not mutual then
				bodyLabel.Text = "No disponible."
			elseif #mutual == 0 then
				bodyLabel.Text = "No tienen amigos en común."
			else
				bodyLabel.Text = "Tienes " .. #mutual .. " amigo(s) en común:\n• "
					.. table.concat(mutual, "\n• ")
			end
		end)
	end
end

-- Hook del tema en vivo: al cambiar color, repaint() pinta el chrome y
-- rerenderCurrent reconstruye las pestañas de contenido con el tema nuevo.
rerenderCurrent = function()
	if currentData then
		pcall(render, currentData, true)   -- true = sin animación de entrada (solo re-pinta el tema)
	end
end

-- ====================== PESTAÑA AJUSTES (solo Tema, en vivo) ======================
do
	-- Muestra los nombres de tema con mayúscula inicial (Negro, Azul, Rojo…)
	-- sin cambiar la clave interna en minúscula (no rompe el guardado ni THEMES).
	local function titleCase(s)
		s = tostring(s)
		return s:sub(1, 1):upper() .. s:sub(2)
	end

	local themeCard = Instance.new("Frame", settingsScroll)
	themeCard.LayoutOrder = 1
	themeCard.Size = UDim2.new(1, -4, 0, 0)
	themeCard.AutomaticSize = Enum.AutomaticSize.Y
	themeCard.BackgroundColor3 = C.card
	themeCard.BorderSizePixel = 0
	Instance.new("UICorner", themeCard).CornerRadius = UDim.new(0, 8)
	themed(themeCard, "BackgroundColor3", "card")
	addDepth(themeCard)
	local thPad = Instance.new("UIPadding", themeCard)
	thPad.PaddingTop = UDim.new(0,8); thPad.PaddingBottom = UDim.new(0,8)
	thPad.PaddingLeft = UDim.new(0,10); thPad.PaddingRight = UDim.new(0,10)
	local thLay = Instance.new("UIListLayout", themeCard)
	thLay.Padding = UDim.new(0,6); thLay.SortOrder = Enum.SortOrder.LayoutOrder

	local thTitle = Instance.new("TextLabel", themeCard)
	thTitle.LayoutOrder = 0; thTitle.Size = UDim2.new(1,0,0,20); thTitle.BackgroundTransparency = 1
	thTitle.Font = Enum.Font.GothamBold; thTitle.TextSize = 14; thTitle.TextColor3 = C.accent
	thTitle.Text = "Tema (se aplica al instante)"; thTitle.TextXAlignment = Enum.TextXAlignment.Left
	themed(thTitle, "TextColor3", "accent")

	-- Chips de tema que hacen wrap automáticamente (escala a muchos colores).
	-- El chip sin seleccionar se tiñe con el acento de SU propio tema (preview).
	local thBtnRow = Instance.new("Frame", themeCard)
	thBtnRow.LayoutOrder = 1
	thBtnRow.Size = UDim2.new(1, 0, 0, 0)
	thBtnRow.AutomaticSize = Enum.AutomaticSize.Y
	thBtnRow.BackgroundTransparency = 1
	local thGrid = Instance.new("UIGridLayout", thBtnRow)
	thGrid.CellSize = UDim2.new(0, 70, 0, 26)
	thGrid.CellPadding = UDim2.new(0, 6, 0, 6)
	thGrid.SortOrder = Enum.SortOrder.LayoutOrder
	thGrid.HorizontalAlignment = Enum.HorizontalAlignment.Left

	local thInfo = Instance.new("TextLabel", themeCard)
	thInfo.LayoutOrder = 2; thInfo.Size = UDim2.new(1,0,0,16); thInfo.BackgroundTransparency = 1
	thInfo.Font = Enum.Font.Gotham; thInfo.TextSize = 11; thInfo.TextColor3 = C.subtext
	thInfo.Text = "Tema actual: " .. titleCase(store.theme); thInfo.TextXAlignment = Enum.TextXAlignment.Left
	themed(thInfo, "TextColor3", "subtext")

	local themeButtons = {}
	local function paintThemeButtons()
		for _, b in ipairs(themeButtons) do
			local tn = b:GetAttribute("ThemeKey")
			local sel = (store.theme == tn)
			local own = THEMES[tn]
			b.BackgroundColor3 = sel and C.accent or C.neutral
			b.TextColor3 = sel and C.onAccent or ((own and own.accent) or C.text)
		end
	end
	onRepaint(paintThemeButtons)

	local themeOrder = { "negro", "azul", "verde", "tor", "rojo", "morado", "cyan", "rosa", "naranja", "claro" }
	for i, tn in ipairs(themeOrder) do
		local tb = Instance.new("TextButton", thBtnRow)
		tb.LayoutOrder = i
		tb.BackgroundColor3 = C.neutral
		tb.Text = titleCase(tn); tb.Font = Enum.Font.GothamBold; tb.TextSize = 11; tb.BorderSizePixel = 0
		tb.TextTruncate = Enum.TextTruncate.AtEnd
		tb:SetAttribute("ThemeKey", tn)   -- clave interna (minúscula) separada del texto visible
		Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 6)
		addHoverStroke(tb)
		table.insert(themeButtons, tb)
		tb.MouseButton1Click:Connect(function()
			setTheme(tn)                 -- cambia el tema EN VIVO (sin reabrir)
			thInfo.Text = "Tema actual: " .. titleCase(tn)
			paintThemeButtons()
		end)
	end
	paintThemeButtons()

	-- ====== NX Head Tags (toggle · Fase 1 de integración) ======
	-- Solo enciende/apaga el módulo NX V2 vía su API pública. NO cambia su
	-- comportamiento ni toca sus internos. Si el módulo no está cargado, el
	-- toggle igual guarda la preferencia (se aplicará cuando exista).
	local nxCard = Instance.new("Frame", settingsScroll)
	nxCard.LayoutOrder = 2
	nxCard.Size = UDim2.new(1, -4, 0, 0)
	nxCard.AutomaticSize = Enum.AutomaticSize.Y
	nxCard.BackgroundColor3 = C.card
	nxCard.BorderSizePixel = 0
	Instance.new("UICorner", nxCard).CornerRadius = UDim.new(0, 8)
	themed(nxCard, "BackgroundColor3", "card")
	addDepth(nxCard)
	local nxPad = Instance.new("UIPadding", nxCard)
	nxPad.PaddingTop = UDim.new(0, 8); nxPad.PaddingBottom = UDim.new(0, 8)
	nxPad.PaddingLeft = UDim.new(0, 10); nxPad.PaddingRight = UDim.new(0, 10)
	local nxLay = Instance.new("UIListLayout", nxCard)
	nxLay.Padding = UDim.new(0, 6); nxLay.SortOrder = Enum.SortOrder.LayoutOrder

	local nxTitle = Instance.new("TextLabel", nxCard)
	nxTitle.LayoutOrder = 0; nxTitle.Size = UDim2.new(1, 0, 0, 20); nxTitle.BackgroundTransparency = 1
	nxTitle.Font = Enum.Font.GothamBold; nxTitle.TextSize = 14; nxTitle.TextColor3 = C.accent
	nxTitle.Text = "NX Head Tags (todos)"; nxTitle.TextXAlignment = Enum.TextXAlignment.Left
	themed(nxTitle, "TextColor3", "accent")

	local nxDesc = Instance.new("TextLabel", nxCard)
	nxDesc.LayoutOrder = 1; nxDesc.Size = UDim2.new(1, 0, 0, 16); nxDesc.BackgroundTransparency = 1
	nxDesc.Font = Enum.Font.Gotham; nxDesc.TextSize = 11; nxDesc.TextColor3 = C.subtext
	nxDesc.Text = "Muestra/oculta los tags de TODOS (solo los ves tú). Para ocultar SOLO el tuyo, usa el interruptor de tu tag en la barra superior."
	nxDesc.TextXAlignment = Enum.TextXAlignment.Left
	nxDesc.TextWrapped = true
	themed(nxDesc, "TextColor3", "subtext")

	-- Fila: switch NX + etiqueta de estado (mismo componente que el panel del escudo).
	local nxRow = Instance.new("Frame", nxCard)
	nxRow.LayoutOrder = 2; nxRow.Size = UDim2.new(1, 0, 0, 28); nxRow.BackgroundTransparency = 1
	local nxRowLay = Instance.new("UIListLayout", nxRow)
	nxRowLay.FillDirection = Enum.FillDirection.Horizontal
	nxRowLay.VerticalAlignment = Enum.VerticalAlignment.Center
	nxRowLay.Padding = UDim.new(0, 10)

	local nxState = Instance.new("TextLabel", nxRow)
	nxState.LayoutOrder = 2; nxState.Size = UDim2.new(0, 160, 0, 20)
	nxState.BackgroundTransparency = 1
	nxState.Font = Enum.Font.GothamBold; nxState.TextSize = 12
	nxState.TextXAlignment = Enum.TextXAlignment.Left

	local nxSwitch, nxSetOn
	local function paintNxToggle()
		local on = store.headTags
		nxState.Text = on and "Activado" or "Desactivado"
		nxState.TextColor3 = on and C.good or C.subtext
	end

	nxSwitch, nxSetOn = Shield.makeSwitch(nxRow, store.headTags ~= false, function(on)
		store.headTags = on
		saveStore()
		paintNxToggle()
		if _G.NXHeadTags then
			_G.NXHeadTags.SetEnabled(on)     -- efecto real: enciende/apaga el módulo
		end
	end)
	nxSwitch.LayoutOrder = 1
	paintNxToggle()
	onRepaint(paintNxToggle)

	-- ====== Animaciones (toggle global de movimiento) ======
	-- Apaga TODAS las animaciones de la UI (hover, transiciones, barras, modales)
	-- y el brillo/shimmer de los head tags. La preferencia se guarda entre sesiones.
	local animCard = Instance.new("Frame", settingsScroll)
	animCard.LayoutOrder = 3
	animCard.Size = UDim2.new(1, -4, 0, 0)
	animCard.AutomaticSize = Enum.AutomaticSize.Y
	animCard.BackgroundColor3 = C.card
	animCard.BorderSizePixel = 0
	Instance.new("UICorner", animCard).CornerRadius = UDim.new(0, 8)
	themed(animCard, "BackgroundColor3", "card")
	addDepth(animCard)
	local anPad = Instance.new("UIPadding", animCard)
	anPad.PaddingTop = UDim.new(0, 8); anPad.PaddingBottom = UDim.new(0, 8)
	anPad.PaddingLeft = UDim.new(0, 10); anPad.PaddingRight = UDim.new(0, 10)
	local anLay = Instance.new("UIListLayout", animCard)
	anLay.Padding = UDim.new(0, 6); anLay.SortOrder = Enum.SortOrder.LayoutOrder

	local anTitle = Instance.new("TextLabel", animCard)
	anTitle.LayoutOrder = 0; anTitle.Size = UDim2.new(1, 0, 0, 20); anTitle.BackgroundTransparency = 1
	anTitle.Font = Enum.Font.GothamBold; anTitle.TextSize = 14; anTitle.TextColor3 = C.accent
	anTitle.Text = "Animaciones"; anTitle.TextXAlignment = Enum.TextXAlignment.Left
	themed(anTitle, "TextColor3", "accent")

	local anDesc = Instance.new("TextLabel", animCard)
	anDesc.LayoutOrder = 1; anDesc.Size = UDim2.new(1, 0, 0, 16); anDesc.BackgroundTransparency = 1
	anDesc.Font = Enum.Font.Gotham; anDesc.TextSize = 11; anDesc.TextColor3 = C.subtext
	anDesc.Text = "Transiciones y efectos de la interfaz (y el brillo de los head tags)."
	anDesc.TextXAlignment = Enum.TextXAlignment.Left
	themed(anDesc, "TextColor3", "subtext")

	local anRow = Instance.new("Frame", animCard)
	anRow.LayoutOrder = 2; anRow.Size = UDim2.new(1, 0, 0, 28); anRow.BackgroundTransparency = 1
	local anRowLay = Instance.new("UIListLayout", anRow)
	anRowLay.FillDirection = Enum.FillDirection.Horizontal
	anRowLay.VerticalAlignment = Enum.VerticalAlignment.Center
	anRowLay.Padding = UDim.new(0, 10)

	local anState = Instance.new("TextLabel", anRow)
	anState.LayoutOrder = 2; anState.Size = UDim2.new(0, 160, 0, 20)
	anState.BackgroundTransparency = 1
	anState.Font = Enum.Font.GothamBold; anState.TextSize = 12
	anState.TextXAlignment = Enum.TextXAlignment.Left

	local function paintAnToggle()
		local on = store.animations ~= false
		anState.Text = on and "Activadas" or "Desactivadas"
		anState.TextColor3 = on and C.good or C.subtext
	end

	local anSwitch = Shield.makeSwitch(anRow, store.animations ~= false, function(on)
		store.animations = on
		saveStore()
		setAnimationsEnabled(on)          -- efecto real sobre motionTween
		paintAnToggle()
	end)
	anSwitch.LayoutOrder = 1
	paintAnToggle()
	onRepaint(paintAnToggle)

	-- ======  NX Shields (las MISMAS protecciones del escudo del header) ======
	-- Estos switches y los del panel del escudo controlan el mismo estado
	-- (Shield.flags) y se sincronizan por Shield.onChange: cambies donde cambies,
	-- ambos se actualizan. Encender ejecuta una verificación REAL y la etiqueta
	-- refleja su resultado, no un texto fijo.
	local shCard = Instance.new("Frame", settingsScroll)
	shCard.LayoutOrder = 4
	shCard.Size = UDim2.new(1, -4, 0, 0)
	shCard.AutomaticSize = Enum.AutomaticSize.Y
	shCard.BackgroundColor3 = C.card
	shCard.BorderSizePixel = 0
	Instance.new("UICorner", shCard).CornerRadius = UDim.new(0, 8)
	themed(shCard, "BackgroundColor3", "card")
	addDepth(shCard)
	local shPad = Instance.new("UIPadding", shCard)
	shPad.PaddingTop = UDim.new(0, 8); shPad.PaddingBottom = UDim.new(0, 8)
	shPad.PaddingLeft = UDim.new(0, 10); shPad.PaddingRight = UDim.new(0, 10)
	local shLay = Instance.new("UIListLayout", shCard)
	shLay.Padding = UDim.new(0, 6); shLay.SortOrder = Enum.SortOrder.LayoutOrder

	local shTitle = Instance.new("TextLabel", shCard)
	shTitle.LayoutOrder = 0; shTitle.Size = UDim2.new(1, 0, 0, 20); shTitle.BackgroundTransparency = 1
	shTitle.Font = Enum.Font.GothamBold; shTitle.TextSize = 14; shTitle.TextColor3 = C.accent
	shTitle.Text = "NX Shields"; shTitle.TextXAlignment = Enum.TextXAlignment.Left
	themed(shTitle, "TextColor3", "accent")

	local shDesc = Instance.new("TextLabel", shCard)
	shDesc.LayoutOrder = 1; shDesc.Size = UDim2.new(1, 0, 0, 16); shDesc.BackgroundTransparency = 1
	shDesc.Font = Enum.Font.Gotham; shDesc.TextSize = 11; shDesc.TextColor3 = C.subtext
	shDesc.Text = "Verificación de las respuestas de las APIs y de cada dato antes de mostrarlo. También en el escudo de la barra superior."
	shDesc.TextXAlignment = Enum.TextXAlignment.Left
	shDesc.TextWrapped = true
	themed(shDesc, "TextColor3", "subtext")

	-- Construye una fila "nombre + switch + estado" enlazada a una protección real.
	local function filaProteccion(orden, nombre, clave)
		local fila = Instance.new("Frame", shCard)
		fila.LayoutOrder = orden; fila.Size = UDim2.new(1, 0, 0, 30); fila.BackgroundTransparency = 1

		local et = Instance.new("TextLabel", fila)
		et.Size = UDim2.new(1, -180, 1, 0); et.Position = UDim2.new(0, 0, 0, 0)
		et.BackgroundTransparency = 1
		et.Font = Enum.Font.GothamMedium; et.TextSize = 13; et.TextColor3 = C.text
		et.Text = nombre; et.TextXAlignment = Enum.TextXAlignment.Left
		et.TextTruncate = Enum.TextTruncate.AtEnd
		themed(et, "TextColor3", "text")

		local est = Instance.new("TextLabel", fila)
		est.AnchorPoint = Vector2.new(1, 0.5)
		est.Position = UDim2.new(1, -54, 0.5, 0)
		est.Size = UDim2.new(0, 118, 1, 0)
		est.BackgroundTransparency = 1
		est.Font = Enum.Font.GothamBold; est.TextSize = 11
		est.TextXAlignment = Enum.TextXAlignment.Right
		est.TextTruncate = Enum.TextTruncate.AtEnd

		local sw, setOn, setBusy
		sw, setOn, setBusy = Shield.makeSwitch(fila, Shield.flags[clave], function(on)
			setBusy(true)
			est.Text = "verificando…"
			est.TextColor3 = C.warn
			Shield.setFlag(clave, on, function(ok, detalle)
				setBusy(false)
				-- La etiqueta muestra el resultado REAL de la comprobación.
				if not on then
					est.Text = "Desactivado"; est.TextColor3 = C.subtext
				elseif ok then
					est.Text = "Activo ✓"; est.TextColor3 = C.good
				else
					est.Text = "Falló"; est.TextColor3 = C.bad
					statusLabel.Text = "" .. nombre .. ": " .. tostring(detalle)
				end
			end)
		end)
		sw.AnchorPoint = Vector2.new(1, 0.5)
		sw.Position = UDim2.new(1, 0, 0.5, 0)

		local function refrescar()
			local on = Shield.flags[clave]
			setOn(on, false)
			if Shield.busy == clave then
				est.Text = "verificando…"; est.TextColor3 = C.warn
			elseif not on then
				est.Text = "Desactivado"; est.TextColor3 = C.subtext
			else
				local t = Shield.lastTest and Shield.lastTest[clave]
				if t and not t.ok then
					est.Text = "Falló"; est.TextColor3 = C.bad
				else
					est.Text = "Activo ✓"; est.TextColor3 = C.good
				end
			end
		end
		refrescar()
		Shield.onChange(refrescar)   -- sincroniza con el panel del escudo
		onRepaint(refrescar)
	end

	filaProteccion(2, "Verificación API",    "api")
	filaProteccion(3, "Validación de datos", "data")

	local shNota = Instance.new("TextLabel", shCard)
	shNota.LayoutOrder = 4; shNota.Size = UDim2.new(1, 0, 0, 30); shNota.BackgroundTransparency = 1
	shNota.Font = Enum.Font.Gotham; shNota.TextSize = 10; shNota.TextColor3 = C.subtext
	shNota.Text = "Apagarlas no es cosmético: los datos pasan a mostrarse sin filtrar y los análisis heurísticos dejan de bloquearse aunque falten pilares."
	shNota.TextXAlignment = Enum.TextXAlignment.Left
	shNota.TextWrapped = true
	themed(shNota, "TextColor3", "subtext")

	-- (La tarjeta " Intro de inicio" se retiró a pedido del usuario. La intro
	--  sigue existiendo: se controla por _G.NXIntro.play() / store.introEnabled.)

	-- (La tarjeta "Signos · prueba de glifos" se quitó a pedido del usuario.)
end

-- ====================== AJUSTES · MODO AVANZADO ======================
-- Va en su propio do...end DESPUÉS del bloque de Ajustes a propósito: allí ya
-- hay ~35 locals vivos y el chunk anda cerca del límite de 200 de Luau. Aquí
-- esos registros ya se liberaron.
do
	local card = Instance.new("Frame", settingsScroll)
	card.LayoutOrder = 5
	card.Size = UDim2.new(1, -4, 0, 0)
	card.AutomaticSize = Enum.AutomaticSize.Y
	card.BackgroundColor3 = C.card
	card.BorderSizePixel = 0
	Instance.new("UICorner", card).CornerRadius = UDim.new(0, 8)
	themed(card, "BackgroundColor3", "card")
	addDepth(card)
	local pad = Instance.new("UIPadding", card)
	pad.PaddingTop = UDim.new(0, 8); pad.PaddingBottom = UDim.new(0, 8)
	pad.PaddingLeft = UDim.new(0, 10); pad.PaddingRight = UDim.new(0, 10)
	local lay = Instance.new("UIListLayout", card)
	lay.Padding = UDim.new(0, 6); lay.SortOrder = Enum.SortOrder.LayoutOrder

	local titulo = Instance.new("TextLabel", card)
	titulo.LayoutOrder = 0; titulo.Size = UDim2.new(1, 0, 0, 20)
	titulo.BackgroundTransparency = 1
	titulo.Font = Enum.Font.GothamBold; titulo.TextSize = 14; titulo.TextColor3 = C.accent
	titulo.Text = "Modo avanzado"; titulo.TextXAlignment = Enum.TextXAlignment.Left
	themed(titulo, "TextColor3", "accent")

	local desc = Instance.new("TextLabel", card)
	desc.LayoutOrder = 1; desc.Size = UDim2.new(1, 0, 0, 0)
	desc.AutomaticSize = Enum.AutomaticSize.Y
	desc.BackgroundTransparency = 1
	desc.Font = Enum.Font.Gotham; desc.TextSize = 11; desc.TextColor3 = C.subtext
	desc.Text = "Añade los desgloses de las puntuaciones y la recolección profunda "
		.. "de la pestaña Huella. Apagado, la interfaz muestra solo lo esencial."
	desc.TextXAlignment = Enum.TextXAlignment.Left
	desc.TextWrapped = true
	themed(desc, "TextColor3", "subtext")

	local fila = Instance.new("Frame", card)
	fila.LayoutOrder = 2; fila.Size = UDim2.new(1, 0, 0, 28); fila.BackgroundTransparency = 1
	local filaLay = Instance.new("UIListLayout", fila)
	filaLay.FillDirection = Enum.FillDirection.Horizontal
	filaLay.VerticalAlignment = Enum.VerticalAlignment.Center
	filaLay.Padding = UDim.new(0, 10)
	filaLay.SortOrder = Enum.SortOrder.LayoutOrder

	local estado = Instance.new("TextLabel", fila)
	estado.LayoutOrder = 2; estado.Size = UDim2.new(0, 160, 0, 20)
	estado.BackgroundTransparency = 1
	estado.Font = Enum.Font.GothamBold; estado.TextSize = 12
	estado.TextXAlignment = Enum.TextXAlignment.Left

	local function pintar()
		local on = store.advanced == true
		estado.Text = on and "Activado" or "Desactivado"
		estado.TextColor3 = on and C.good or C.subtext
	end

	local sw = Shield.makeSwitch(fila, store.advanced == true, function(on)
		store.advanced = on
		saveStore()
		pintar()
		-- Efecto inmediato: el perfil que estés viendo se vuelve a pintar con el
		-- nivel de detalle nuevo, sin tener que analizarlo otra vez.
		if rerenderCurrent then pcall(rerenderCurrent) end
		if _G.NXOSINT and _G.NXOSINT.reset then pcall(_G.NXOSINT.reset) end
	end)
	sw.LayoutOrder = 1
	pintar()
	onRepaint(pintar)
end

-- ====================== NX CONTROL CENTER (Panel Admin) ======================
-- Pestaña exclusiva para administradores (permissions.admin == true).
-- Se construye y añade al tab bar dinámicamente desde NXCore.onReady().
-- Secciones: Dashboard · Licencias · Avisos · Tags · Permisos.
-- Usa los helpers del scope padre: createTab, makeScroll, addRow, C, themed,
-- onRepaint, content, nxTags, player, NXCore.
local function buildAdminPanel()
	local d = NXCore.getData()

	-- ── Página raíz del admin ─────────────────────────────────────────────
	local adminPage = Instance.new("Frame", content)
	adminPage.Size                = UDim2.new(1, 0, 1, 0)
	adminPage.BackgroundTransparency = 1
	adminPage.Visible             = false
	createTab("Admin", adminPage)

	-- ── Sub-navegación horizontal ─────────────────────────────────────────
	local subNav = Instance.new("ScrollingFrame", adminPage)
	subNav.Size                  = UDim2.new(1, 0, 0, 28)
	subNav.BackgroundTransparency = 1
	subNav.BorderSizePixel       = 0
	subNav.ScrollBarThickness    = 2
	subNav.ScrollBarImageColor3  = C.accent
	subNav.ScrollingDirection    = Enum.ScrollingDirection.X
	subNav.CanvasSize            = UDim2.new(0, 0, 0, 0)
	subNav.AutomaticCanvasSize   = Enum.AutomaticSize.X
	themed(subNav, "ScrollBarImageColor3", "accent")
	local snLay = Instance.new("UIListLayout", subNav)
	snLay.FillDirection = Enum.FillDirection.Horizontal
	snLay.Padding       = UDim.new(0, 5)
	snLay.SortOrder     = Enum.SortOrder.LayoutOrder

	-- ── Área de contenido de las sub-secciones ────────────────────────────
	local adminArea = Instance.new("Frame", adminPage)
	adminArea.Size                = UDim2.new(1, 0, 1, -34)
	adminArea.Position            = UDim2.new(0, 0, 0, 34)
	adminArea.BackgroundTransparency = 1

	local subPages   = {}
	local subBtns    = {}
	local activeSub  = nil

	local function showSub(id)
		for k, pg in pairs(subPages) do pg.Visible = (k == id) end
		activeSub = id
		for k, b in pairs(subBtns) do
			b.BackgroundColor3 = (k == id) and C.accent or C.neutral
			b.TextColor3       = (k == id) and C.onAccent or C.text
		end
	end

	-- Crea un botón de sub-navegación y su página vacía.
	local SUB_SECTIONS = {
		{ id = "dashboard", label = "Dashboard"  },
		{ id = "licenses",  label = "Licencias"  },
		{ id = "warnings",  label = "Avisos"      },
		{ id = "tags",      label = "Tags"         },
		{ id = "perms",     label = "Permisos"     },
	}
	for i, sec in ipairs(SUB_SECTIONS) do
		local btn = Instance.new("TextButton", subNav)
		btn.Size             = UDim2.new(0, 84, 0, 24)
		btn.LayoutOrder      = i
		btn.BackgroundColor3 = C.neutral
		btn.Text             = sec.label
		btn.Font             = Enum.Font.Gotham
		btn.TextSize         = 12
		btn.TextColor3       = C.text
		btn.BorderSizePixel  = 0
		btn.AutoButtonColor  = false
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
		subBtns[sec.id] = btn
		btn.MouseButton1Click:Connect(function() showSub(sec.id) end)

		local pg = Instance.new("Frame", adminArea)
		pg.Size                = UDim2.new(1, 0, 1, 0)
		pg.BackgroundTransparency = 1
		pg.Visible             = false
		subPages[sec.id] = pg
	end

	-- Repaint de sub-nav con el tema en vivo.
	onRepaint(function()
		for k, b in pairs(subBtns) do
			b.BackgroundColor3 = (k == activeSub) and C.accent or C.neutral
			b.TextColor3       = (k == activeSub) and C.onAccent or C.text
		end
	end)

	-- ── Helpers de layout internos ────────────────────────────────────────
	local function aScroll(parent)
		local sf = Instance.new("ScrollingFrame", parent)
		sf.Size                  = UDim2.new(1, 0, 1, 0)
		sf.BackgroundTransparency = 1
		sf.BorderSizePixel       = 0
		sf.ScrollBarThickness    = 4
		sf.ScrollBarImageColor3  = C.accent
		sf.CanvasSize            = UDim2.new(0, 0, 0, 0)
		sf.AutomaticCanvasSize   = Enum.AutomaticSize.Y
		sf.ClipsDescendants      = true
		themed(sf, "ScrollBarImageColor3", "accent")
		local ly = Instance.new("UIListLayout", sf)
		ly.Padding = UDim.new(0, 7); ly.SortOrder = Enum.SortOrder.LayoutOrder
		Instance.new("UIPadding", sf).PaddingRight = UDim.new(0, 6)
		return sf
	end

	-- Tarjeta de estadística grande (número + etiqueta).
	local function statCard(parent, label, value, color, order)
		local card = Instance.new("Frame", parent)
		card.BackgroundColor3 = C.card; card.BorderSizePixel = 0; card.LayoutOrder = order
		Instance.new("UICorner", card).CornerRadius = UDim.new(0, 8)
		local st = Instance.new("UIStroke", card)
		st.Color = color or C.accent; st.Transparency = 0.45; st.Thickness = 1
		themed(card, "BackgroundColor3", "card")
		local numLbl = Instance.new("TextLabel", card)
		numLbl.Size                  = UDim2.new(1, 0, 0, 34)
		numLbl.Position              = UDim2.new(0, 0, 0, 8)
		numLbl.BackgroundTransparency = 1
		numLbl.Font                  = Enum.Font.GothamBold
		numLbl.TextSize              = 24
		numLbl.TextColor3            = color or C.accent
		numLbl.Text                  = tostring(value)
		numLbl.TextXAlignment        = Enum.TextXAlignment.Center
		local nameLbl = Instance.new("TextLabel", card)
		nameLbl.Size                  = UDim2.new(1, 0, 0, 16)
		nameLbl.Position              = UDim2.new(0, 0, 0, 42)
		nameLbl.BackgroundTransparency = 1
		nameLbl.Font                  = Enum.Font.Gotham
		nameLbl.TextSize              = 11
		nameLbl.TextColor3            = C.subtext
		nameLbl.Text                  = label
		nameLbl.TextXAlignment        = Enum.TextXAlignment.Center
		themed(nameLbl, "TextColor3", "subtext")
		return card
	end

	-- Fila de tabla (cabecera o dato).
	local function tRow(parent, cols, isHeader, order)
		local row = Instance.new("Frame", parent)
		row.Size             = UDim2.new(1, -4, 0, isHeader and 22 or 26)
		row.BackgroundColor3 = isHeader and C.neutral or C.card
		row.BorderSizePixel  = 0
		row.LayoutOrder      = order
		Instance.new("UICorner", row).CornerRadius = UDim.new(0, 4)
		themed(row, "BackgroundColor3", isHeader and "neutral" or "card")
		local colW = 1 / #cols
		for i, txt in ipairs(cols) do
			local c = Instance.new("TextLabel", row)
			c.Size                  = UDim2.new(colW, -4, 1, 0)
			c.Position              = UDim2.new((i - 1) * colW, 2, 0, 0)
			c.BackgroundTransparency = 1
			c.Font                  = isHeader and Enum.Font.GothamBold or Enum.Font.Gotham
			c.TextSize              = isHeader and 11 or 12
			c.TextColor3            = isHeader and C.subtext or C.text
			c.Text                  = tostring(txt)
			c.TextXAlignment        = i == 1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center
			c.TextTruncate          = Enum.TextTruncate.AtEnd
			themed(c, "TextColor3", isHeader and "subtext" or "text")
		end
		return row
	end

	local function emptyNote(parent, msg, order)
		local lbl = Instance.new("TextLabel", parent)
		lbl.LayoutOrder           = order
		lbl.Size                  = UDim2.new(1, -4, 0, 22)
		lbl.BackgroundTransparency = 1
		lbl.Font                  = Enum.Font.Gotham
		lbl.TextSize              = 12
		lbl.TextColor3            = C.subtext
		lbl.Text                  = msg
		lbl.TextXAlignment        = Enum.TextXAlignment.Left
		themed(lbl, "TextColor3", "subtext")
	end

	-- ── DASHBOARD ─────────────────────────────────────────────────────────
	do
		local sf = aScroll(subPages.dashboard)

		local hdr = Instance.new("TextLabel", sf)
		hdr.LayoutOrder           = 0; hdr.Size = UDim2.new(1, -4, 0, 28)
		hdr.BackgroundTransparency = 1; hdr.Font = Enum.Font.GothamBold
		hdr.TextSize              = 16; hdr.TextColor3 = C.accent
		hdr.Text                  = "NX Control Center  v" .. NXCore.getVersion()
		hdr.TextXAlignment        = Enum.TextXAlignment.Left
		themed(hdr, "TextColor3", "accent")

		-- Grid 2×2 de stats
		local grid = Instance.new("Frame", sf)
		grid.LayoutOrder           = 1
		grid.Size                  = UDim2.new(1, -4, 0, 136)
		grid.BackgroundTransparency = 1
		local gl = Instance.new("UIGridLayout", grid)
		gl.CellSize    = UDim2.new(0.5, -5, 0, 62)
		gl.CellPadding = UDim2.new(0, 6, 0, 6)
		gl.SortOrder   = Enum.SortOrder.LayoutOrder
		statCard(grid, "Licencias",  NXCore.countOf("licenses"),    C.good,    1)
		statCard(grid, "Avisos",     NXCore.countOf("warnings"),     C.warn,    2)
		statCard(grid, "Tags NX",    NXCore.countTags(),             C.accent,  3)
		statCard(grid, "Permisos",   NXCore.countOf("permissions"),  C.subtext, 4)

		-- Estado de carga de archivos remotos
		local stCard = Instance.new("Frame", sf)
		stCard.LayoutOrder      = 2
		stCard.Size             = UDim2.new(1, -4, 0, 0)
		stCard.AutomaticSize    = Enum.AutomaticSize.Y
		stCard.BackgroundColor3 = C.card; stCard.BorderSizePixel = 0
		Instance.new("UICorner", stCard).CornerRadius = UDim.new(0, 8)
		themed(stCard, "BackgroundColor3", "card")
		local stp = Instance.new("UIPadding", stCard)
		stp.PaddingTop = UDim.new(0,10); stp.PaddingBottom = UDim.new(0,10)
		stp.PaddingLeft = UDim.new(0,12); stp.PaddingRight = UDim.new(0,12)
		local stLay = Instance.new("UIListLayout", stCard)
		stLay.Padding = UDim.new(0, 5); stLay.SortOrder = Enum.SortOrder.LayoutOrder

		local stTitle = Instance.new("TextLabel", stCard)
		stTitle.LayoutOrder = 0; stTitle.Size = UDim2.new(1,0,0,20)
		stTitle.BackgroundTransparency = 1; stTitle.Font = Enum.Font.GothamBold
		stTitle.TextSize = 13; stTitle.TextColor3 = C.accent
		stTitle.Text = "Archivos remotos"; stTitle.TextXAlignment = Enum.TextXAlignment.Left
		themed(stTitle, "TextColor3", "accent")

		for i, f in ipairs({ {"licenses.json","licenses"}, {"warnings.json","warnings"}, {"permissions.json","permissions"} }) do
			local ok = not d.failed[f[2]]
			local fRow = Instance.new("Frame", stCard)
			fRow.LayoutOrder = i; fRow.Size = UDim2.new(1,0,0,22); fRow.BackgroundTransparency = 1
			local fName = Instance.new("TextLabel", fRow)
			fName.Size = UDim2.new(1,-70,1,0); fName.BackgroundTransparency = 1
			fName.Font = Enum.Font.Gotham; fName.TextSize = 12; fName.TextColor3 = C.text
			fName.Text = f[1]; fName.TextXAlignment = Enum.TextXAlignment.Left
			themed(fName, "TextColor3", "text")
			local fSt = Instance.new("TextLabel", fRow)
			fSt.Size = UDim2.new(0,66,1,0); fSt.Position = UDim2.new(1,-68,0,0)
			fSt.BackgroundTransparency = 1; fSt.Font = Enum.Font.GothamBold; fSt.TextSize = 12
			fSt.TextColor3 = ok and C.good or C.bad
			fSt.Text = ok and "OK" or "Error"
			fSt.TextXAlignment = Enum.TextXAlignment.Right
		end

		-- Tus permisos
		local myPerms  = NXCore.getPermissions(player.UserId)
		local permCard = Instance.new("Frame", sf)
		permCard.LayoutOrder = 3; permCard.Size = UDim2.new(1,-4,0,0)
		permCard.AutomaticSize = Enum.AutomaticSize.Y
		permCard.BackgroundColor3 = C.card; permCard.BorderSizePixel = 0
		Instance.new("UICorner", permCard).CornerRadius = UDim.new(0, 8)
		themed(permCard, "BackgroundColor3", "card")
		local pp = Instance.new("UIPadding", permCard)
		pp.PaddingTop = UDim.new(0,10); pp.PaddingBottom = UDim.new(0,10)
		pp.PaddingLeft = UDim.new(0,12); pp.PaddingRight = UDim.new(0,12)
		local pLay = Instance.new("UIListLayout", permCard)
		pLay.Padding = UDim.new(0, 5); pLay.SortOrder = Enum.SortOrder.LayoutOrder

		local pTitle = Instance.new("TextLabel", permCard)
		pTitle.LayoutOrder = 0; pTitle.Size = UDim2.new(1,0,0,20)
		pTitle.BackgroundTransparency = 1; pTitle.Font = Enum.Font.GothamBold
		pTitle.TextSize = 13; pTitle.TextColor3 = C.accent
		pTitle.Text = "Tus permisos  (" .. player.DisplayName .. ")"
		pTitle.TextXAlignment = Enum.TextXAlignment.Left
		themed(pTitle, "TextColor3", "accent")

		for i, pDef in ipairs({
			{"admin","Administrador"},{"canWarn","Puede advertir"},
			{"canManageTags","Gestionar Tags"},{"canAccessBeta","Acceso Beta"},
		}) do
			local has = myPerms[pDef[1]] == true
			local pRow = Instance.new("Frame", permCard)
			pRow.LayoutOrder = i; pRow.Size = UDim2.new(1,0,0,22); pRow.BackgroundTransparency = 1
			local pName = Instance.new("TextLabel", pRow)
			pName.Size = UDim2.new(1,-50,1,0); pName.BackgroundTransparency = 1
			pName.Font = Enum.Font.Gotham; pName.TextSize = 12; pName.TextColor3 = C.text
			pName.Text = pDef[2]; pName.TextXAlignment = Enum.TextXAlignment.Left
			themed(pName, "TextColor3", "text")
			local pVal = Instance.new("TextLabel", pRow)
			pVal.Size = UDim2.new(0,46,1,0); pVal.Position = UDim2.new(1,-48,0,0)
			pVal.BackgroundTransparency = 1; pVal.Font = Enum.Font.GothamBold; pVal.TextSize = 12
			pVal.TextColor3 = has and C.good or C.subtext
			pVal.Text = has and "Si" or "No"
			pVal.TextXAlignment = Enum.TextXAlignment.Right
		end
	end

	-- ── LICENCIAS ─────────────────────────────────────────────────────────
	do
		local sf = aScroll(subPages.licenses)
		local hdr = Instance.new("TextLabel", sf)
		hdr.LayoutOrder = 0; hdr.Size = UDim2.new(1,-4,0,24)
		hdr.BackgroundTransparency = 1; hdr.Font = Enum.Font.GothamBold
		hdr.TextSize = 14; hdr.TextColor3 = C.accent
		hdr.Text = "Licencias activas  (" .. NXCore.countOf("licenses") .. ")"
		hdr.TextXAlignment = Enum.TextXAlignment.Left
		themed(hdr, "TextColor3", "accent")

		tRow(sf, {"UserId", "Estado", "Cargado"}, true, 1)
		local loadedAt = d.loadedAt > 0 and os.date("%H:%M:%S", d.loadedAt) or "—"
		local rOrder = 2
		for uid, active in pairs(d.licenses) do
			tRow(sf, {uid, active and "Activa" or "Inactiva", loadedAt}, false, rOrder)
			rOrder = rOrder + 1
		end
		if rOrder == 2 then emptyNote(sf, "Sin datos (archivo vacío o no disponible).", 2) end
	end

	-- ── AVISOS ────────────────────────────────────────────────────────────
	do
		local sf = aScroll(subPages.warnings)
		local hdr = Instance.new("TextLabel", sf)
		hdr.LayoutOrder = 0; hdr.Size = UDim2.new(1,-4,0,24)
		hdr.BackgroundTransparency = 1; hdr.Font = Enum.Font.GothamBold
		hdr.TextSize = 14; hdr.TextColor3 = C.warn
		hdr.Text = "Advertencias  (" .. NXCore.countOf("warnings") .. ")"
		hdr.TextXAlignment = Enum.TextXAlignment.Left

		tRow(sf, {"UserId", "Nivel", "Mensaje"}, true, 1)
		local rOrder = 2
		for uid, w in pairs(d.warnings) do
			if type(w) == "table" then
				tRow(sf, {uid, tostring(w.level or "?"), tostring(w.message or "—")}, false, rOrder)
				rOrder = rOrder + 1
			end
		end
		if rOrder == 2 then emptyNote(sf, "Sin advertencias activas.", 2) end
	end

	-- ── TAGS ──────────────────────────────────────────────────────────────
	do
		local sf = aScroll(subPages.tags)
		local hdr = Instance.new("TextLabel", sf)
		hdr.LayoutOrder = 0; hdr.Size = UDim2.new(1,-4,0,24)
		hdr.BackgroundTransparency = 1; hdr.Font = Enum.Font.GothamBold
		hdr.TextSize = 14; hdr.TextColor3 = C.accent
		hdr.Text = "Tags NX  (" .. NXCore.countTags() .. ")"
		hdr.TextXAlignment = Enum.TextXAlignment.Left
		themed(hdr, "TextColor3", "accent")

		tRow(sf, {"UserId", "Tag", "Prioridad", "Color"}, true, 1)
		local rOrder = 2
		if type(nxTags) == "table" then
			for uid, t in pairs(nxTags) do
				if type(t) == "table" then
					tRow(sf, {
						uid,
						tostring(t.tag or "—"),
						tostring(t.priority or "—"),
						tostring(t.color or "—"),
					}, false, rOrder)
					rOrder = rOrder + 1
				end
			end
		end
		if rOrder == 2 then emptyNote(sf, "Tags aún cargando o sin datos.", 2) end
	end

	-- ── PERMISOS ──────────────────────────────────────────────────────────
	do
		local sf = aScroll(subPages.perms)
		local hdr = Instance.new("TextLabel", sf)
		hdr.LayoutOrder = 0; hdr.Size = UDim2.new(1,-4,0,24)
		hdr.BackgroundTransparency = 1; hdr.Font = Enum.Font.GothamBold
		hdr.TextSize = 14; hdr.TextColor3 = C.accent
		hdr.Text = "Permisos  (" .. NXCore.countOf("permissions") .. ")"
		hdr.TextXAlignment = Enum.TextXAlignment.Left
		themed(hdr, "TextColor3", "accent")

		tRow(sf, {"UserId", "Admin", "Advertir", "Tags", "Beta"}, true, 1)
		local rOrder = 2
		for uid, p in pairs(d.permissions) do
			if type(p) == "table" then
				tRow(sf, {
					uid,
					p.admin         and "Si" or "—",
					p.canWarn       and "Si" or "—",
					p.canManageTags and "Si" or "—",
					p.canAccessBeta and "Si" or "—",
				}, false, rOrder)
				rOrder = rOrder + 1
			end
		end
		if rOrder == 2 then emptyNote(sf, "Sin permisos configurados.", 2) end
	end

	-- Mostrar dashboard al abrir el panel admin.
	showSub("dashboard")
end

-- ====================== FLUJO PRINCIPAL ======================
local analyzing = false

-- ====================== ANIMACIÓN DE ANÁLISIS · "NX Flow" ======================
-- Escáner minimalista: TRES servidores en fila que representan el flujo del
-- análisis —  [Request] -> [Processing] -> [Complete]  — con una línea entre
-- cada par y un paquete de datos que viaja de uno al siguiente. Nada más: sin
-- núcleo/hub, sin redes, sin efectos extra.
--
-- SEPARACIÓN DE RESPONSABILIDADES: toda la animación vive aquí (_G.NXScan). El
-- analizador solo la abre con NXWin.startScan() y, cuando el trabajo REAL
-- termina, llama a _G.NXScan.finish(cb); la animación cierra y ejecuta cb() (que
-- pinta la info) YA sin overlay, así la información nunca sale encima. do...end:
-- sus locals se liberan al cerrar (límite de 200 de Luau). Todo TweenService,
-- sin RenderStepped propio.
do
	-- Tres nodos en fila horizontal, centrados. Etiqueta fija bajo cada uno.
	local NODOS = {
		{ label = "Request",    cx = 0.22, cy = 0.46 },
		{ label = "Processing", cx = 0.50, cy = 0.46 },
		{ label = "Complete",   cx = 0.78, cy = 0.46 },
	}
	local GROSOR = 2

	-- Estado del bloque (singleton: un solo análisis a la vez, que garantiza el
	-- propio analizador). Se reinicia en cada start().
	local overlay, stage, statusLbl, sizeConn
	local nodes, lines, packet = {}, {}, nil
	local alive, finishing, startedAt, gen = false, false, 0, 0

	-- "Rack" de servidor: tarjeta con dos barras y una luz. Devuelve body + borde.
	local function makeRack(parent, w, h, accent)
		local body = Instance.new("Frame", parent)
		body.AnchorPoint = Vector2.new(0.5, 0)
		body.Position = UDim2.new(0.5, 0, 0, 0)
		body.Size = UDim2.fromOffset(w, h)
		body.BackgroundColor3 = C.card
		body.BorderSizePixel = 0
		Instance.new("UICorner", body).CornerRadius = UDim.new(0, 6)
		local grad = Instance.new("UIGradient", body)
		grad.Rotation = 90
		grad.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(220, 220, 228))
		grad.Transparency = NumberSequence.new(0.85)
		local st = Instance.new("UIStroke", body)
		st.Color = accent; st.Thickness = 1.2; st.Transparency = 0.35
		for i = 1, 2 do
			local bar = Instance.new("Frame", body)
			bar.AnchorPoint = Vector2.new(0, 0.5)
			bar.Size = UDim2.new(0, math.floor(w * 0.42), 0, 3)
			bar.Position = UDim2.new(0, 8, i / 3, 0)
			bar.BackgroundColor3 = C.subtext
			bar.BackgroundTransparency = 0.4
			bar.BorderSizePixel = 0
			Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
		end
		local dot = Instance.new("Frame", body)
		dot.AnchorPoint = Vector2.new(1, 0.5)
		dot.Size = UDim2.fromOffset(5, 5)
		dot.Position = UDim2.new(1, -8, 0.5, 0)
		dot.BackgroundColor3 = accent
		dot.BorderSizePixel = 0
		Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
		return body, st
	end

	local function makeLabel(parent, y, size, color, txt)
		local l = Instance.new("TextLabel", parent)
		l.AnchorPoint = Vector2.new(0.5, 0)
		l.Position = UDim2.new(0.5, 0, 0, y)
		l.Size = UDim2.new(1, 12, 0, size + 4)
		l.BackgroundTransparency = 1
		l.Font = Enum.Font.GothamMedium
		l.TextSize = size
		l.TextColor3 = color
		l.Text = txt
		l.TextXAlignment = Enum.TextXAlignment.Center
		l.TextTruncate = Enum.TextTruncate.AtEnd
		return l
	end

	-- Recalcula posiciones (escala 0-1 -> px del overlay). 'port' = centro del
	-- rack (la etiqueta va debajo), que es donde enganchan líneas y paquete.
	local function layout()
		if not stage then return end
		local sz = stage.AbsoluteSize
		if sz.X < 10 or sz.Y < 10 then return end
		for _, n in ipairs(nodes) do
			n.px = Vector2.new(n.def.cx * sz.X, n.def.cy * sz.Y)
			n.port = Vector2.new(n.px.X, n.px.Y - 11)
			n.holder.Position = UDim2.fromOffset(n.px.X, n.px.Y)
		end
		for _, ln in ipairs(lines) do
			local a, b = nodes[ln.from].port, nodes[ln.to].port
			local d = b - a
			ln.len = d.Magnitude
			ln.frame.Position = UDim2.fromOffset(a.X, a.Y)
			ln.frame.Rotation = math.deg(math.atan(d.Y, d.X))
			if ln.grown then ln.frame.Size = UDim2.fromOffset(ln.len, GROSOR) end
		end
	end

	local function lightNode(i, color)
		local n = nodes[i]
		if not n then return end
		motionTween(n.stroke, TweenInfo.new(0.2), { Transparency = 0, Color = color or C.accent })
	end
	local function dimNode(i)
		local n = nodes[i]
		if not n then return end
		motionTween(n.stroke, TweenInfo.new(0.2), { Transparency = 0.35 })
	end

	local function setStatus(txt, color)
		if statusLbl then statusLbl.Text = txt; statusLbl.TextColor3 = color or C.accent end
	end

	-- El paquete recorre un tramo (nodo seg -> seg+1); al llegar enciende el nodo
	-- y sigue. Tras el último, pausa, apaga los intermedios y repite. Sin bucles:
	-- se encadena por el Completed del tween.
	local function travel(seg, miGen)
		if not alive or miGen ~= gen or finishing then return end
		local a, b = nodes[seg].port, nodes[seg + 1].port
		packet.Position = UDim2.fromOffset(a.X, a.Y)
		packet.BackgroundTransparency = 0.05
		packet.Visible = true
		local dur = math.clamp((b - a).Magnitude / 220, 0.35, 0.7)
		motionTween(packet, TweenInfo.new(dur, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{ Position = UDim2.fromOffset(b.X, b.Y) }, function()
				if not alive or miGen ~= gen or finishing then return end
				lightNode(seg + 1)
				if seg + 1 < #nodes then
					travel(seg + 1, miGen)
				else
					task.delay(0.35, function()
						if not alive or finishing or miGen ~= gen then return end
						dimNode(2); dimNode(3)
						travel(1, miGen)
					end)
				end
			end)
	end

	local function destroyNow()
		alive = false
		gen = gen + 1
		if sizeConn then sizeConn:Disconnect(); sizeConn = nil end
		if overlay then overlay:Destroy() end
		overlay, stage, statusLbl, packet = nil, nil, nil, nil
		nodes, lines = {}, {}
	end

	local M = {}

	-- Cierre: converge a "Complete" (líneas y nodos en verde, paquete al final),
	-- funde el escenario y, YA sin overlay, llama a cb() para que el analizador
	-- pinte la info. cb SIEMPRE se llama (si no, el perfil no aparecería y la
	-- herramienta quedaría bloqueada).
	function M.finish(cb)
		local function done() if cb then task.spawn(cb) end end
		if not alive then done(); return end
		if finishing then done(); return end
		finishing = true
		local miGen = gen
		task.spawn(function()
			local elapsed = os.clock() - startedAt
			if elapsed < 1.0 then task.wait(1.0 - elapsed) end   -- mínimo en pantalla
			if miGen ~= gen then done(); return end
			for _, ln in ipairs(lines) do
				motionTween(ln.frame, TweenInfo.new(0.3), { BackgroundColor3 = C.good })
			end
			for i = 1, #nodes do lightNode(i, C.good) end
			if nodes[3] and nodes[3].label then nodes[3].label.TextColor3 = C.good end
			if packet then
				packet.BackgroundColor3 = C.good
				local b = nodes[#nodes].port
				motionTween(packet, TweenInfo.new(0.3), { Position = UDim2.fromOffset(b.X, b.Y) })
			end
			setStatus("Completed", C.good)
			task.wait(0.45)
			if miGen ~= gen then done(); return end
			motionTween(stage, TweenInfo.new(0.3), { GroupTransparency = 1 })
			motionTween(overlay, TweenInfo.new(0.3), { BackgroundTransparency = 1 }, function()
				destroyNow()
				done()
			end)
		end)
	end

	function M.stop() destroyNow() end

	function M.start()
		if not ANIM.enabled then return end
		destroyNow()
		gen = gen + 1
		local miGen = gen
		alive, finishing, startedAt = true, false, os.clock()

		-- Cubre SOLO el área de contenido (debajo de tabs/buscador) y es casi
		-- opaco: la info del perfil anterior queda oculta mientras corre.
		overlay = Instance.new("Frame")
		overlay.Name = "ScanOverlay"
		overlay.Position = UDim2.new(0, 0, 0, 0)
		overlay.Size = UDim2.new(1, 0, 1, 0)
		overlay.BackgroundColor3 = C.bg
		overlay.BackgroundTransparency = 0.03
		overlay.BorderSizePixel = 0
		overlay.ClipsDescendants = true
		overlay.Active = true
		overlay.ZIndex = 50
		overlay.Parent = content

		stage = Instance.new("CanvasGroup")
		stage.Size = UDim2.new(1, 0, 1, 0)
		stage.BackgroundTransparency = 1
		stage.BorderSizePixel = 0
		stage.GroupTransparency = 0
		stage.ZIndex = 51
		stage.Parent = overlay

		-- Estado global (una sola línea, arriba).
		local pill = Instance.new("Frame", stage)
		pill.AnchorPoint = Vector2.new(0.5, 0)
		pill.Position = UDim2.new(0.5, 0, 0, 10)
		pill.Size = UDim2.fromOffset(180, 24)
		pill.BackgroundColor3 = C.card
		pill.BackgroundTransparency = 0.1
		pill.BorderSizePixel = 0
		Instance.new("UICorner", pill).CornerRadius = UDim.new(1, 0)
		local pst = Instance.new("UIStroke", pill)
		pst.Color = C.accent; pst.Transparency = 0.4
		statusLbl = Instance.new("TextLabel", pill)
		statusLbl.Size = UDim2.new(1, -16, 1, 0)
		statusLbl.Position = UDim2.new(0, 8, 0, 0)
		statusLbl.BackgroundTransparency = 1
		statusLbl.Font = Enum.Font.GothamBold
		statusLbl.TextSize = 12
		statusLbl.TextColor3 = C.accent
		statusLbl.Text = "Requesting Data..."
		statusLbl.TextXAlignment = Enum.TextXAlignment.Center

		-- Nodos (con su etiqueta fija debajo).
		nodes, lines = {}, {}
		for _, def in ipairs(NODOS) do
			local holder = Instance.new("Frame", stage)
			holder.AnchorPoint = Vector2.new(0.5, 0.5)
			holder.Size = UDim2.fromOffset(92, 62)
			holder.BackgroundTransparency = 1
			holder.ZIndex = 3
			local sc = Instance.new("UIScale", holder); sc.Scale = 0
			local _, st = makeRack(holder, 84, 40, C.accent)
			local lbl = makeLabel(holder, 44, 12, C.subtext, def.label)
			nodes[#nodes + 1] = { def = def, holder = holder, scale = sc, stroke = st, label = lbl }
		end

		-- Líneas entre nodos consecutivos (1->2, 2->3).
		for i = 1, #nodes - 1 do
			local line = Instance.new("Frame", stage)
			line.AnchorPoint = Vector2.new(0, 0.5)
			line.Size = UDim2.fromOffset(0, GROSOR)
			line.BackgroundColor3 = C.accent
			line.BackgroundTransparency = 0.2
			line.BorderSizePixel = 0
			line.ZIndex = 2
			local lg = Instance.new("UIGradient", line)
			lg.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.5),
				NumberSequenceKeypoint.new(0.5, 0),
				NumberSequenceKeypoint.new(1, 0.5),
			})
			lines[#lines + 1] = { frame = line, from = i, to = i + 1, grown = false }
		end

		-- Paquete de datos.
		packet = Instance.new("Frame", stage)
		packet.AnchorPoint = Vector2.new(0.5, 0.5)
		packet.Size = UDim2.fromOffset(8, 8)
		packet.BackgroundColor3 = C.accent
		packet.BorderSizePixel = 0
		packet.Visible = false
		packet.ZIndex = 5
		Instance.new("UICorner", packet).CornerRadius = UDim.new(1, 0)
		local pk = Instance.new("UIStroke", packet)
		pk.Color = Color3.fromRGB(255, 255, 255); pk.Transparency = 0.4

		layout()
		sizeConn = stage:GetPropertyChangedSignal("AbsoluteSize"):Connect(layout)

		-- Aparición en cadena (izq -> der) + crecimiento de las líneas.
		for i, n in ipairs(nodes) do
			task.delay(0.12 * (i - 1), function()
				if miGen ~= gen or not alive then return end
				motionTween(n.scale, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
			end)
		end
		for i, ln in ipairs(lines) do
			task.delay(0.12 * i, function()
				if miGen ~= gen or not alive then return end
				ln.grown = true
				motionTween(ln.frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ Size = UDim2.fromOffset(ln.len, GROSOR) })
			end)
		end
		-- Nodo 1 encendido (origen) y arranque del tráfico de paquetes.
		task.delay(0.42, function()
			if miGen ~= gen or not alive then return end
			lightNode(1)
			travel(1, miGen)
		end)
	end

	_G.NXScan = M
end

-- El analizador sigue llamando a esto y nada más; la animación es cosa de _G.NXScan.
function NXWin.startScan()
	if _G.NXScan then _G.NXScan.start() end
end

-- Texto de estado según el resultado REAL de las verificaciones del análisis.
-- Va como método de Shield (no como local de raíz) para no gastar registros.
function Shield.textoEstado(data)
	local st = data and data._state
	if st == "verified" then return "✓ Verificado." end
	if st == "partial" then
		local n = #Shield.problemas(data)
		return "◑ Parcial · " .. n .. " dato(s) no disponibles."
	end
	if st == "incomplete" then return "Datos incompletos (faltan campos clave)." end
	if st == "error"      then return "✕ Error de validación en los datos." end
	return "✓ Listo."
end

analyze = function(input)
	if analyzing then return end
	input = (input or ""):gsub("%s", "")
	if input == "" then return end

	analyzing = true
	hideAllSuggestions()
	statusLabel.Text = "Buscando..."
	NXWin.startScan()

	task.spawn(function()
		-- Se CALCULA el resultado, pero NO se pinta aún: la información aparece
		-- DESPUÉS de que la animación termine y se desvanezca (el usuario lo pidió
		-- así). Aquí solo se decide QUÉ pintar (outData) y con qué estado (outStatus);
		-- los mensajes de progreso ("Buscando…", "Consultando…") sí se ven durante.
		local outData, outStatus = nil, "No disponible."
		local ok, err = pcall(function()
			local userId = tonumber(input)
			if not userId then
				local id, _, errType = getUserIdByName(input)
				if not id then
					if errType == "not_found" then outStatus = "Usuario no encontrado."
					elseif errType == "api_error" then outStatus = "No disponible. Vuelve a intentarlo en un momento."
					else outStatus = "No disponible." end
					return
				end
				userId = id
			end

			-- Validación de entrada: un ID escrito a mano puede ser absurdo.
			if Shield.flags.data and Shield.valid.userId(userId) == nil then
				outStatus = "UserId no válido."
				return
			end

			-- CACHÉ CON CADUCIDAD (Shield.TTL): pasado ese tiempo se reconsulta.
			local hit = profileCache[userId]
			if hit and (os.time() - (hit._fetchedAt or 0)) < Shield.TTL then
				Shield.run = hit._integrity or Shield.run
				outData = hit
				outStatus = Shield.textoEstado(hit) .. " (caché)"
				return
			end

			statusLabel.Text = "Consultando APIs..."
			local data, motivo = gatherData(userId)
			if not data then
				outStatus = (motivo == "perfil_invalido" or motivo == "sin_respuesta")
					and "No disponible." or "Usuario no encontrado."
			else
				setCached(userId, data)
				outData = data
				outStatus = Shield.textoEstado(data)
				-- Historial de perfiles analizados (solo lo que se analizó BIEN).
				pcall(function()
					if _G.NXPlus and _G.NXPlus.recordar then
						_G.NXPlus.recordar(data.UserId, data.Username, data.DisplayName)
					end
				end)
			end
		end)
		if not ok then
			outData, outStatus = nil, "No disponible."
			warn("[NX Analyzer] error en analyze: " .. tostring(err))
		end

		-- La info se pinta SOLO cuando la animación ha terminado y desaparecido:
		-- así nunca se dibujan una encima de la otra. `analyzing` se libera aquí
		-- dentro, de modo que la herramienta sigue "ocupada" durante toda la
		-- animación (no se puede lanzar otro análisis a medias).
		local function paint()
			Shield.emit()
			render(outData)
			statusLabel.Text = outStatus
			analyzing = false
		end
		if _G.NXScan then _G.NXScan.finish(paint) else paint() end
	end)
end

track(analyzeBtn.MouseButton1Click:Connect(function() analyze(searchBox.Text) end))
track(searchBox.FocusLost:Connect(function(enter)
	if enter then analyze(searchBox.Text) end
end))

-- (v3.8.2) El auto-dropdown de "perfiles recientes al enfocar" también se retiró
-- con el sistema de sugerencias. Los recientes siguen existiendo en _G.NXPlus.recientes
-- (por si algún día hace falta una lista visible en un sitio que no tape las tabs).

-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  NX OSINT · huella pública                                            ║
-- ╠══════════════════════════════════════════════════════════════════════╣
-- ║  Traducción al ecosistema de Roblox de tres herramientas clásicas:    ║
-- ║                                                                       ║
-- ║  Sherlock → "¿dónde EXISTE esta identidad?". Roblox es un universo    ║
-- ║    cerrado, así que en vez de rastrear cientos de redes se comprueban ║
-- ║    los espacios donde una cuenta de Roblox deja huella: DevForum,     ║
-- ║    experiencias publicadas, grupos que dirige, catálogo e inventario. ║
-- ║  Maigret → recolección profunda: listas completas y cifras totales,   ║
-- ║    no las muestras de 10 que enseña la pestaña Items.                 ║
-- ║  Holehe → Roblox NO expone el correo de NADIE, así que "¿en qué       ║
-- ║    servicios está registrada esta dirección?" se traduce a "¿en qué   ║
-- ║    estado está esta cuenta?", cruzando dos fuentes independientes.    ║
-- ║                                                                       ║
-- ║  REGLA DE LA PESTAÑA: una fuente que no contesta NO es un negativo.   ║
-- ║  Se distingue siempre entre "No encontrado" (la fuente respondió y no ║
-- ║  está) y "No disponible" (la fuente no respondió). Nunca un error.    ║
-- ║                                                                       ║
-- ║  do...end: sus registros se liberan al cerrar y no cuentan contra el  ║
-- ║  límite de 200 locals de Luau del chunk.                              ║
-- ╚══════════════════════════════════════════════════════════════════════╝
do
	if _G.NXOSINT and _G.NXOSINT.stop then pcall(_G.NXOSINT.stop) end

	local page = Instance.new("Frame", content)
	page.Size = UDim2.new(1, 0, 1, 0)
	page.BackgroundTransparency = 1
	page.Visible = false
	local scroll = makeScroll(page)

	local pintadoPara = nil    -- UserId ya dibujado (carga perezosa)
	local gen = 0              -- generación: descarta respuestas de un perfil viejo
	local res = {}             -- resultados crudos, para el informe

	-- GET + JSON crudo. NO pasa por apiGet a propósito: la validación de NX
	-- Shields está escrita contra la forma de las respuestas de Roblox, y
	-- fuentes como el DevForum tienen otra. Devuelve (tabla|nil, códigoHTTP).
	local function getJSON(url)
		local body, st = rawGet(url)
		if not body then return nil, tonumber(st) end
		local ok, t = pcall(function() return HttpService:JSONDecode(body) end)
		if not ok or type(t) ~= "table" then return nil, tonumber(st) end
		return t, tonumber(st)
	end

	-- ── piezas de UI ────────────────────────────────────────────────────────
	local function tarjeta(orden, titulo, subtitulo)
		local card = Instance.new("Frame", scroll)
		card.LayoutOrder = orden
		card.Size = UDim2.new(1, -4, 0, 0)
		card.AutomaticSize = Enum.AutomaticSize.Y
		card.BackgroundColor3 = C.card
		card.BorderSizePixel = 0
		Instance.new("UICorner", card).CornerRadius = UDim.new(0, 8)
		themed(card, "BackgroundColor3", "card")
		addDepth(card)
		local pad = Instance.new("UIPadding", card)
		pad.PaddingTop = UDim.new(0, 9); pad.PaddingBottom = UDim.new(0, 9)
		pad.PaddingLeft = UDim.new(0, 10); pad.PaddingRight = UDim.new(0, 10)
		local lay = Instance.new("UIListLayout", card)
		lay.Padding = UDim.new(0, 5); lay.SortOrder = Enum.SortOrder.LayoutOrder

		local h = Instance.new("TextLabel", card)
		h.LayoutOrder = 0; h.Size = UDim2.new(1, 0, 0, 20)
		h.BackgroundTransparency = 1
		h.Font = Enum.Font.GothamBold; h.TextSize = 14; h.TextColor3 = C.accent
		h.Text = titulo; h.TextXAlignment = Enum.TextXAlignment.Left
		themed(h, "TextColor3", "accent")

		if subtitulo then
			local s = Instance.new("TextLabel", card)
			s.LayoutOrder = 1; s.Size = UDim2.new(1, 0, 0, 0)
			s.AutomaticSize = Enum.AutomaticSize.Y
			s.BackgroundTransparency = 1
			s.Font = Enum.Font.Gotham; s.TextSize = 11; s.TextColor3 = C.subtext
			s.Text = subtitulo; s.TextXAlignment = Enum.TextXAlignment.Left
			s.TextWrapped = true
			themed(s, "TextColor3", "subtext")
		end
		return card
	end

	-- Fila etiqueta/valor. Devuelve el label del valor para rellenarlo async.
	local function fila(card, orden, etiqueta, url)
		local f = Instance.new("Frame", card)
		f.LayoutOrder = orden
		f.Size = UDim2.new(1, 0, 0, 24)
		f.BackgroundTransparency = 1

		local et = Instance.new("TextLabel", f)
		et.Size = UDim2.new(0, 150, 1, 0)
		et.BackgroundTransparency = 1
		et.Font = Enum.Font.Gotham; et.TextSize = 12; et.TextColor3 = C.subtext
		et.Text = etiqueta; et.TextXAlignment = Enum.TextXAlignment.Left
		et.TextTruncate = Enum.TextTruncate.AtEnd
		themed(et, "TextColor3", "subtext")

		local anchoBoton = url and 62 or 0
		local v = Instance.new("TextLabel", f)
		v.Size = UDim2.new(1, -154 - anchoBoton, 1, 0)
		v.Position = UDim2.new(0, 154, 0, 0)
		v.BackgroundTransparency = 1
		v.Font = Enum.Font.GothamBold; v.TextSize = 12; v.TextColor3 = C.subtext
		v.Text = "Comprobando…"; v.TextXAlignment = Enum.TextXAlignment.Left
		v.TextTruncate = Enum.TextTruncate.AtEnd

		if url then
			local b = Instance.new("TextButton", f)
			b.AnchorPoint = Vector2.new(1, 0.5)
			b.Position = UDim2.new(1, 0, 0.5, 0)
			b.Size = UDim2.new(0, 58, 0, 20)
			b.BackgroundColor3 = C.neutral
			b.Text = "Abrir"
			b.Font = Enum.Font.GothamBold; b.TextSize = 11; b.TextColor3 = C.text
			b.BorderSizePixel = 0
			Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
			themed(b, "BackgroundColor3", "neutral")
			themed(b, "TextColor3", "text")
			b.MouseButton1Click:Connect(function()
				if openURL(url) then
					statusLabel.Text = "Abierto en el navegador."
				else
					clipboard(url)
					statusLabel.Text = "No disponible en tu executor. Link copiado."
				end
			end)
		end
		return v
	end

	-- Estados. "nd" (no disponible) NUNCA se pinta como negativo: una fuente
	-- caída no es prueba de ausencia, y esa diferencia es el 90% del valor de
	-- una herramienta OSINT honesta.
	local function marcar(lbl, clave, texto)
		if not lbl or not lbl.Parent then return end
		if clave == "si" then
			lbl.Text = texto or "Presente";      lbl.TextColor3 = C.good
		elseif clave == "no" then
			lbl.Text = texto or "No encontrado"; lbl.TextColor3 = C.subtext
		else
			lbl.Text = texto or "No disponible"; lbl.TextColor3 = C.warn
		end
	end

	-- Lanza una comprobación en paralelo y la escribe en su fila cuando llega.
	-- El guardia de generación evita que la respuesta de un perfil anterior
	-- pinte encima del que estás viendo ahora.
	local function comprobar(miGen, lbl, clave, fn)
		task.spawn(function()
			local ok, estado, texto, crudo = pcall(fn)
			if not ok then estado, texto = "nd", nil end
			if miGen ~= gen then return end
			res[clave] = { estado = estado, texto = texto, datos = crudo }
			marcar(lbl, estado, texto)
		end)
	end

	-- ── construcción de la pestaña ──────────────────────────────────────────
	local function construir()
		local data = currentData
		clearScroll(scroll)
		res = {}
		gen = gen + 1
		local miGen = gen

		if not data then
			pintadoPara = nil
			local vacio = Instance.new("TextLabel", scroll)
			vacio.LayoutOrder = 0
			vacio.Size = UDim2.new(1, -4, 0, 40)
			vacio.BackgroundTransparency = 1
			vacio.Font = Enum.Font.Gotham; vacio.TextSize = 12; vacio.TextColor3 = C.subtext
			vacio.Text = "Analiza un perfil para ver su huella pública."
			vacio.TextXAlignment = Enum.TextXAlignment.Left
			themed(vacio, "TextColor3", "subtext")
			return
		end

		pintadoPara = data.UserId
		local uid  = data.UserId
		local user = tostring(data.Username or "")

		-- ── 1) PRESENCIA (Sherlock) ────────────────────────────────────────
		local cPres = tarjeta(0, "Presencia",
			"Espacios de Roblox donde esta cuenta deja huella pública.")

		-- El perfil es el punto de partida: si estamos aquí, existe.
		marcar(fila(cPres, 2, "Perfil de Roblox", data.ProfileUrl), "si")

		local lDev = fila(cPres, 3, "DevForum",
			"https://devforum.roblox.com/u/" .. user)
		comprobar(miGen, lDev, "devforum", function()
			if user == "" then return "nd" end
			local t, code = getJSON("https://devforum.roblox.com/u/" .. user .. ".json")
			if t and type(t.user) == "table" then
				local nivel = tonumber(t.user.trust_level)
				return "si", nivel and ("Presente · nivel de confianza " .. nivel) or "Presente", t.user
			end
			if code == 404 then return "no" end
			return "nd"
		end)

		local lJuegos = fila(cPres, 4, "Experiencias publicadas",
			"https://www.roblox.com/users/" .. uid .. "/profile")
		comprobar(miGen, lJuegos, "juegos", function()
			local t = getJSON("https://games.roblox.com/v2/users/" .. uid
				.. "/games?accessFilter=Public&limit=50&sortOrder=Desc")
			if not t or type(t.data) ~= "table" then return "nd" end
			local n = #t.data
			if n == 0 then return "no", "Ninguna pública" end
			local mas = (t.nextPageCursor and t.nextPageCursor ~= "") and "+" or ""
			return "si", n .. mas .. " experiencia(s)", t.data
		end)

		local lGrupos = fila(cPres, 5, "Grupos que dirige")
		comprobar(miGen, lGrupos, "grupos", function()
			local t = getJSON("https://groups.roblox.com/v2/users/" .. uid .. "/groups/roles")
			if not t or type(t.data) ~= "table" then return "nd" end
			local propios, total = {}, #t.data
			for _, e in ipairs(t.data) do
				local g = e.group
				if type(g) == "table" and type(g.owner) == "table"
					and tonumber(g.owner.userId) == tonumber(uid) then
					propios[#propios + 1] = g.name or ("Grupo " .. tostring(g.id))
				end
			end
			if #propios == 0 then
				return "no", (total == 0) and "En ningún grupo" or ("Miembro de " .. total .. ", dueño de 0")
			end
			return "si", "Dueño de " .. #propios .. " de " .. total, { propios = propios, todos = t.data }
		end)

		local lCat = fila(cPres, 6, "Items en el catálogo")
		comprobar(miGen, lCat, "catalogo", function()
			local t = getJSON("https://catalog.roblox.com/v1/search/items?category=All"
				.. "&creatorTargetId=" .. uid .. "&creatorType=User&limit=10")
			if not t or type(t.data) ~= "table" then return "nd" end
			if #t.data == 0 then return "no", "Nada a la venta" end
			local mas = (t.nextPageCursor and t.nextPageCursor ~= "") and "+" or ""
			return "si", #t.data .. mas .. " item(s) creados", t.data
		end)

		local lInv = fila(cPres, 7, "Inventario público",
			"https://www.roblox.com/users/" .. uid .. "/inventory")
		comprobar(miGen, lInv, "inventario", function()
			local t = getJSON("https://inventory.roblox.com/v1/users/" .. uid
				.. "/can-view-inventory")
			if not t or type(t.canView) ~= "boolean" then return "nd" end
			if t.canView then return "si", "Visible" end
			return "no", "Privado"
		end)

		local lRol = fila(cPres, 8, "Rolimon's",
			"https://www.rolimons.com/player/" .. uid)
		marcar(lRol, "nd", "No verificable desde el script")
		res.rolimons = { estado = "nd", texto = "API pública retirada" }

		-- ── 2) ESTADO DE LA CUENTA (Holehe) ────────────────────────────────
		-- Aquí vive lo que antes era la tarjeta "Verificación" de la pestaña
		-- Perfil: es su sitio natural, junto al resto de comprobaciones.
		local cEst = tarjeta(1, "Estado de la cuenta",
			"Roblox no publica el correo de nadie, así que en vez de rastrear "
			.. "direcciones se cruza el estado de la cuenta entre dos fuentes.")

		local lEstado = fila(cEst, 2, "Estado")
		if data.Banned == "Sí" then
			marcar(lEstado, "no", "Baneada")
			lEstado.TextColor3 = C.bad
		elseif data.IsDeleted == true then
			marcar(lEstado, "no", "Borrada")
			lEstado.TextColor3 = C.bad
		elseif data.IsDeleted == false then
			marcar(lEstado, "si", "Activa")
		else
			marcar(lEstado, "nd", "No comprobable")
		end
		res.estado = { texto = lEstado.Text }

		local lVer = fila(cEst, 3, "Insignia verificada")
		local vLegacy = (data.Verified == "Sí")
		if data.VerifiedApi ~= nil and data.VerifiedApi ~= vLegacy then
			marcar(lVer, "nd", "Las dos fuentes no coinciden")
		elseif vLegacy then
			marcar(lVer, "si", "Sí")
		else
			marcar(lVer, "no", "No")
		end
		res.verificada = { texto = lVer.Text }

		local lCoin = fila(cEst, 4, "Nombre visible")
		if tostring(data.DisplayName):lower() ~= tostring(data.Username):lower() then
			marcar(lCoin, "no", "Distinto del @usuario")
		else
			marcar(lCoin, "si", "Igual al @usuario")
		end

		local lPrev = fila(cEst, 5, "Nombres previos")
		do
			local paraPrev = uid
			local function recibir(lista)
				if miGen ~= gen or paraPrev ~= uid then return end
				if lista == nil then
					marcar(lPrev, "nd")
				elseif #lista == 0 then
					marcar(lPrev, "no", "Ninguno")
				else
					marcar(lPrev, "si", #lista .. " anterior(es)")
				end
				res.nombres = { datos = lista }
			end
			if _G.NXPlus and type(_G.NXPlus.nombres) == "function" then
				_G.NXPlus.nombres(data, recibir)
			else
				task.spawn(function() recibir(getNameHistory(uid)) end)
			end
		end

		-- ── 3) RECOLECCIÓN PROFUNDA (Maigret) · solo en modo avanzado ──────
		if Shield.adv() then
			local cRec = tarjeta(2, "Recolección profunda",
				"Cifras completas, no las muestras de 10 de la pestaña Items.")

			local lBadges = fila(cRec, 2, "Badges (total)")
			comprobar(miGen, lBadges, "badgesTotal", function()
				local n = countPaged("https://badges.roblox.com/v1/users/" .. uid .. "/badges", 100)
				if n == nil then return "nd" end
				return "si", tostring(n)
			end)

			local lRed = fila(cRec, 3, "Red social")
			marcar(lRed, "si", string.format("%s amigos · %s seguidores · sigue a %s",
				tostring(data.Friends or "?"), tostring(data.Followers or "?"),
				tostring(data.Following or "?")))

			local lTop = fila(cRec, 4, "Experiencia más visitada")
			comprobar(miGen, lTop, "topJuego", function()
				local t = getJSON("https://games.roblox.com/v2/users/" .. uid
					.. "/games?accessFilter=Public&limit=50&sortOrder=Desc")
				if not t or type(t.data) ~= "table" or #t.data == 0 then return "nd" end
				local mejor, visitas = nil, -1
				for _, g in ipairs(t.data) do
					local v = tonumber(g.placeVisits) or 0
					if v > visitas then mejor, visitas = g.name, v end
				end
				if not mejor then return "nd" end
				return "si", string.format("%s (%d visitas)", tostring(mejor), visitas)
			end)

			local lCreada = fila(cRec, 5, "Cuenta creada")
			marcar(lCreada, "si", tostring(data.Created or "No disponible")
				.. " · " .. tostring(data.AccountAge or ""))
		end

		-- ── 4) INFORME ─────────────────────────────────────────────────────
		local cInf = tarjeta(3, "Informe",
			"Vuelca a texto todo lo que hay en esta pestaña, ya resuelto.")
		local btn = Instance.new("TextButton", cInf)
		btn.LayoutOrder = 2
		btn.Size = UDim2.new(1, 0, 0, 28)
		btn.BackgroundColor3 = C.accent
		btn.Text = "Copiar informe"
		btn.Font = Enum.Font.GothamBold; btn.TextSize = 12; btn.TextColor3 = C.onAccent
		btn.BorderSizePixel = 0
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
		themed(btn, "BackgroundColor3", "accent")
		themed(btn, "TextColor3", "onAccent")
		btn.MouseButton1Click:Connect(function()
			local l = {}
			l[#l + 1] = "HUELLA PUBLICA · " .. tostring(data.Username)
				.. " (UserId " .. tostring(uid) .. ")"
			l[#l + 1] = "Perfil: " .. tostring(data.ProfileUrl)
			l[#l + 1] = ""
			l[#l + 1] = "PRESENCIA"
			for _, k in ipairs({ "devforum", "juegos", "grupos", "catalogo",
			                     "inventario", "rolimons" }) do
				local r = res[k]
				local v = r and (r.texto or ({ si = "Presente", no = "No encontrado" })[r.estado])
				l[#l + 1] = "  " .. k .. ": " .. tostring(v or "No disponible")
			end
			l[#l + 1] = ""
			l[#l + 1] = "ESTADO DE LA CUENTA"
			l[#l + 1] = "  estado: " .. tostring(res.estado and res.estado.texto or "No disponible")
			l[#l + 1] = "  insignia verificada: "
				.. tostring(res.verificada and res.verificada.texto or "No disponible")
			local nm = res.nombres and res.nombres.datos
			l[#l + 1] = "  nombres previos: "
				.. (nm and ((#nm > 0) and table.concat(nm, ", ") or "ninguno") or "No disponible")
			if res.badgesTotal then
				l[#l + 1] = ""
				l[#l + 1] = "RECOLECCION"
				l[#l + 1] = "  badges: " .. tostring(res.badgesTotal.texto or "No disponible")
				if res.topJuego then
					l[#l + 1] = "  experiencia top: " .. tostring(res.topJuego.texto or "No disponible")
				end
			end
			clipboard(table.concat(l, "\n"))
			statusLabel.Text = "Informe copiado."
			btn.Text = "Copiado"
			task.delay(1.2, function()
				if btn and btn.Parent then btn.Text = "Copiar informe" end
			end)
		end)
	end

	-- Carga perezosa: la pestaña solo pide datos cuando la abres, y solo si el
	-- perfil cambió desde la última vez. Sin esto, cada análisis dispararía 6
	-- peticiones más contra endpoints que ya van justos de rate limit.
	local function alMostrar()
		local uid = currentData and currentData.UserId or nil
		if uid == pintadoPara and (uid ~= nil or pintadoPara ~= nil) then return end
		construir()
	end

	_G.NXOSINT = {
		page  = page,
		onShow = alMostrar,
		-- render() la llama al cargar otro perfil: invalida lo pintado y corta
		-- las respuestas en vuelo del perfil anterior.
		reset = function()
			gen = gen + 1
			pintadoPara = nil
			if page.Visible then construir() end
		end,
		stop = function() gen = gen + 1 end,
	}
end

createTab("Perfil", profilePage)
createTab("Estadísticas", statsPage)
createTab("Items", itemsPage)
createTab("Análisis", analysisPage)
createTab("Huella", _G.NXOSINT.page, _G.NXOSINT.onShow)
createTab("Ajustes", settingsPage)

-- ====================== PUENTE PÚBLICO (lo usa la Lista de Jugadores) ======================
-- Expone una forma de "analizar a alguien" desde OTRO script (la lista de
-- nombres pegada más abajo). Le pasas un usuario o UserId, y esto:
--   1) muestra la ventana del Analyzer (por si estaba oculta),
--   2) salta a la pestaña "Perfil",
--   3) escribe el nombre en el buscador y lanza el análisis.
-- Va envuelto en pcall: si algo no está listo, no rompe nada.
_G.NXAnalyze = function(input)
	input = tostring(input or ""):gsub("%s", "")
	if input == "" then return end
	pcall(function()
		setHidden(false)            -- por si estaba en modo discreto
		searchBox.Text = input
		showPage(profilePage)       -- ir a Perfil (ya pinta la pestaña activa)
	end)
	analyze(input)
end

-- ── NXCore integration: licencias + avisos + panel admin ─────────────────
NXCore.onReady(function()
	local uid = player.UserId

	-- 1. Licencia: si el sistema cargó y el usuario NO está licenciado, bloquear.
	if not NXCore.isLicensed(uid) then
		showLicenseDenied()
	end

	-- 2. Advertencia: mostrar popup si existe una para este usuario.
	local warning = NXCore.getWarning(uid)
	if warning then
		task.delay(1.2, function() showNXWarning(warning) end)
	end

	-- 3. Panel admin: solo si el usuario tiene admin = true.
	if NXCore.isAdmin(uid) then
		buildAdminPanel()
	end
end)

-- ====================== ARRASTRE (sin conexión global permanente) ======================
local dragInputConn, dragEndedConn

local function stopDrag()
	if dragInputConn then dragInputConn:Disconnect(); dragInputConn = nil end
	if dragEndedConn then dragEndedConn:Disconnect(); dragEndedConn = nil end
end

track(header.InputBegan:Connect(function(input)
	local t = input.UserInputType
	if t ~= Enum.UserInputType.MouseButton1 and t ~= Enum.UserInputType.Touch then return end
	local startMouse = input.Position
	local startPos = main.Position
	stopDrag()
	NXWin.setDragSquish(true)
	dragInputConn = UserInputService.InputChanged:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseMovement
			or i.UserInputType == Enum.UserInputType.Touch then
			local d = i.Position - startMouse
			main.Position = UDim2.new(
				startPos.X.Scale, startPos.X.Offset + d.X,
				startPos.Y.Scale, startPos.Y.Offset + d.Y
			)
		end
	end)
	dragEndedConn = input.Changed:Connect(function()
		if input.UserInputState == Enum.UserInputState.End then
			stopDrag(); NXWin.setDragSquish(false)
		end
	end)
end))

-- ====================== REDIMENSIONAR (agarre esquina inferior derecha) ======================
local resizeGrip = Instance.new("TextButton", main)
resizeGrip.Name = "ResizeGrip"
resizeGrip.Size = UDim2.new(0, 18, 0, 18)
resizeGrip.Position = UDim2.new(1, -20, 1, -20)
resizeGrip.BackgroundColor3 = C.accent
resizeGrip.BackgroundTransparency = 0.25
resizeGrip.Text = "⤡"
resizeGrip.Font = Enum.Font.GothamBold
resizeGrip.TextSize = 14
resizeGrip.TextColor3 = C.onAccent
resizeGrip.AutoButtonColor = false
resizeGrip.BorderSizePixel = 0
resizeGrip.ZIndex = 5
Instance.new("UICorner", resizeGrip).CornerRadius = UDim.new(0, 4)
themed(resizeGrip, "BackgroundColor3", "accent")
themed(resizeGrip, "TextColor3", "onAccent")

local resInputConn, resEndedConn
local function stopResize()
	if resInputConn then resInputConn:Disconnect(); resInputConn = nil end
	if resEndedConn then resEndedConn:Disconnect(); resEndedConn = nil end
end

track(resizeGrip.InputBegan:Connect(function(input)
	local t = input.UserInputType
	if t ~= Enum.UserInputType.MouseButton1 and t ~= Enum.UserInputType.Touch then return end
	local startMouse = input.Position
	local startSize = main.AbsoluteSize
	stopResize()
	resInputConn = UserInputService.InputChanged:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseMovement
			or i.UserInputType == Enum.UserInputType.Touch then
			local d = i.Position - startMouse
			local newW = math.max(MIN_W, startSize.X + d.X)
			local newH = math.max(MIN_H, startSize.Y + d.Y)
			main.Size = UDim2.new(0, newW, 0, newH)
		end
	end)
	resEndedConn = input.Changed:Connect(function()
		if input.UserInputState == Enum.UserInputState.End then stopResize() end
	end)
end))

-- ====================== AVISOS ======================
if not httpRequest then
	statusLabel.Text = "Aviso: " .. EXECUTOR_NAME .. " no expone 'request'; se usará game:HttpGet."
end

-- ====================== NX BROADCAST · AVISOS REMOTOS ======================
-- Sistema para que TÚ (el autor) envíes mensajes/warnings a CUALQUIERA que
-- ejecute el script, EN VIVO. Funciona igual que NX Tags: lees un JSON público
-- en GitHub; cuando lo editas (commit), a los pocos segundos le sale el aviso a
-- todos los que tengan el script abierto. Toast premium (glass/neon) que respeta
-- el tema en vivo y el toggle de animaciones. Las imágenes son OPCIONALES: si el
-- campo "image" trae un rbxassetid válido, se usa; si no, sale un emoji por tipo.
--
--   Cómo ENVIAR un aviso  (editas messages.json en tu repo y haces commit):
--   {
--     "messages": [
--       {
--         "id": "2026-06-21-bienvenida",   -- ÚNICO; sirve para no repetir
--         "type": "info",                   -- info | warn | error | success
--         "title": "Bienvenido a NX",
--         "body":  "Gracias por usar la herramienta.",
--         "image": "",                       -- rbxassetid OPCIONAL (cuando tengas el ID)
--         "duration": 8,                     -- seg en pantalla; 0 = fijo (cierra a mano)
--         "once": true,                      -- true = se muestra UNA vez por persona
--         "enabled": true,                   -- false = borrador (no se muestra)
--         "expires": 0,                      -- os.time() límite; 0 = nunca caduca
--         "targets": []                      -- [] = TODOS; [userId,...] = solo esos
--       }
--     ]
--   }
--
--   AVISO ESTILO ROBLOX (popup centrado tipo "Error al unirse", troll/cosmético):
--   añade  "style": "roblox"  al mensaje. Campos extra:
--     "button"    -- texto del botón (por defecto "Salir")
--     "errorCode" -- número; muestra "(Código de error: N)". Ej: 600
--   { "id":"ban1", "style":"roblox", "title":"Error al unirse",
--     "body":"Has sido expulsado por 4 minutos.", "button":"Salir",
--     "errorCode":600, "duration":0, "enabled":true, "targets":[] }
--
--   BLOQUEO CON TIEMPO (cierra la herramienta y no la pueden usar por X tiempo):
--   añade  "lockMinutes": N  (o "lockSeconds"/"lock" en segundos) al mensaje. El
--   bloqueo se guarda en disco, así que re-ejecutar el script NO lo salta. El
--   tiempo lo administras tú. Para liberar antes: un mensaje con "unlock": true.
--     LOCK:   { "id":"ban-2025", "style":"roblox", "title":"Error al unirse",
--               "body":"...", "errorCode":600, "lockMinutes":5,
--               "enabled":true, "targets":[123456789] }
--     UNLOCK: { "id":"unlock-1", "unlock":true, "enabled":true, "targets":[123456789] }
--   (cada bloqueo se aplica UNA vez por id: para re-bloquear, usa un id nuevo.)
--
--   Pruebas rápidas SIN tocar GitHub (consola del executor):
--     _G.NXBroadcast.test()         -- muestra un toast de cada tipo
--     _G.NXBroadcast.testBan()      -- muestra el popup estilo Roblox (como la foto)
--     _G.NXBroadcast.testLock(30)   -- bloquea 30 seg (prueba el cierre). unlock() para salir
--     _G.NXBroadcast.lock(300)      -- bloquea 300 seg manualmente
--     _G.NXBroadcast.unlock()       -- quita el bloqueo
--     _G.NXBroadcast.refresh()      -- re-descarga el JSON ahora mismo
--     _G.NXBroadcast.clearSeen()    -- olvida los "once" (vuelven a salir)
--     _G.NXBroadcast.show({ type="warn", title="Hola", body="Texto", duration=6 })
--     _G.NXBroadcast.modal({ title="Error al unirse", body="...", errorCode=600 })
do
    local CONFIG = {
        --  EDITA esta URL a tu repo de avisos (raw de GitHub).
        URL     = "https://raw.githubusercontent.com/dreennx/nx-messages/refs/heads/main/messages.json",
        REFRESH = 120,   -- seg entre re-descargas (avisos nuevos en vivo). 0 = solo al iniciar.
        RETRY   = 20,    -- seg para reintentar si la primera descarga falla.
        WIDTH   = 330,   -- ancho del toast (px).
        DEFAULT_DURATION = 8,
        MAX_VISIBLE = 4, -- máximo de toasts a la vez (los viejos se cierran solos).
        GAP = 0.18,      -- pausa entre toasts encolados (para que entren escalonados).
    }

    -- ---- persistencia "ya visto" (archivo propio; NO toca el store del tema) ----
    local SEEN_FILE = "NX_msgs_seen.json"
    local seen = {}
    if hasFS then
        pcall(function()
            if isfile(SEEN_FILE) then
                local d = HttpService:JSONDecode(readfile(SEEN_FILE))
                if type(d) == "table" then seen = d end
            end
        end)
    end
    local function markSeen(id)
        if not id then return end
        seen[tostring(id)] = true
        if hasFS then
            pcall(function() writefile(SEEN_FILE, HttpService:JSONEncode(seen)) end)
        end
    end

    -- ---- color e icono por tipo (usan los roles del tema => respetan el tema en vivo) ----
    local function typeRole(t)
        t = tostring(t or "info"):lower()
        if t == "warn" or t == "warning" then return "warn" end
        if t == "error" or t == "bad" or t == "danger" then return "bad" end
        if t == "success" or t == "ok" or t == "good" then return "good" end
        return "accent"
    end
    local function typeColor(t) return C[typeRole(t)] or C.accent end
    local function typeEmoji(t)
        t = tostring(t or "info"):lower()
        if t == "warn" or t == "warning" then return "" end
        if t == "error" or t == "bad" or t == "danger" then return "" end
        if t == "success" or t == "ok" or t == "good" then return "" end
        return ""
    end

    -- ---- normaliza la imagen opcional (acepta número, "123" o "rbxassetid://123") ----
    local CP = game:GetService("ContentProvider")
    local function normImg(v)
        if v == nil then return nil end
        if type(v) == "number" then v = "rbxassetid://" .. v end
        v = tostring(v)
        if v == "" or v == "rbxassetid://0" then return nil end
        local d = v:match("^(%d+)$"); if d then v = "rbxassetid://" .. d end
        return (v:match("^rbxassetid://%d+$") or v:match("^rbxthumb") or v:match("^http")) and v or nil
    end

    -- ---- contenedor (esquina superior derecha del ScreenGui) ----
    local holder = Instance.new("Frame")
    holder.Name = "NXBroadcast"
    holder.AnchorPoint = Vector2.new(1, 0)
    holder.Position = UDim2.new(1, -16, 0, 16)
    holder.Size = UDim2.new(0, CONFIG.WIDTH, 1, -32)
    holder.BackgroundTransparency = 1
    holder.ClipsDescendants = false
    holder.ZIndex = 300
    holder.Parent = gui
    local hlist = Instance.new("UIListLayout", holder)
    hlist.FillDirection = Enum.FillDirection.Vertical
    hlist.HorizontalAlignment = Enum.HorizontalAlignment.Right
    hlist.VerticalAlignment = Enum.VerticalAlignment.Top
    hlist.SortOrder = Enum.SortOrder.LayoutOrder
    hlist.Padding = UDim.new(0, 10)

    local live = {}        -- toasts vivos: { slot, card, type, hovered, accentEls, dismiss }
    local order = 0

    -- Al cambiar de tema, re-aplica el color de tipo (acento/warn/bad/good) a cada toast vivo.
    onRepaint(function()
        for _, ti in ipairs(live) do
            local col = typeColor(ti.type)
            for _, el in ipairs(ti.accentEls) do
                pcall(function() el.inst[el.prop] = col end)
            end
        end
    end)

    -- Cierra los toasts más viejos si pasamos del máximo visible.
    local function reflowLimit()
        while #live > CONFIG.MAX_VISIBLE do
            local oldest = live[1]
            if oldest and oldest.dismiss then oldest.dismiss() else table.remove(live, 1) end
        end
    end

    -- ---- crea y muestra un toast ----
    local function showToast(opts)
        opts = opts or {}
        local mtype = opts.type or "info"
        local col   = typeColor(mtype)
        order = order + 1

        local slot = Instance.new("Frame")
        slot.Name = "Slot"
        slot.BackgroundTransparency = 1
        slot.Size = UDim2.new(0, CONFIG.WIDTH, 0, 0)
        slot.AutomaticSize = Enum.AutomaticSize.Y
        slot.ClipsDescendants = false
        slot.LayoutOrder = -order          -- los nuevos salen ARRIBA
        slot.ZIndex = 301
        slot.Parent = holder

        -- CanvasGroup: nos deja desvanecer TODO el toast con una sola propiedad.
        local card = Instance.new("CanvasGroup")
        card.Name = "Card"
        card.Size = UDim2.new(1, 0, 0, 0)
        card.AutomaticSize = Enum.AutomaticSize.Y
        card.BackgroundColor3 = C.card
        card.BackgroundTransparency = 0.02
        card.BorderSizePixel = 0
        card.GroupTransparency = ANIM.enabled and 1 or 0
        card.Position = ANIM.enabled and UDim2.new(0, CONFIG.WIDTH, 0, 0) or UDim2.new(0, 0, 0, 0)
        card.ZIndex = 301
        card.Parent = slot
        themed(card, "BackgroundColor3", "card")
        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 12)
        local stroke = Instance.new("UIStroke", card)
        stroke.Color = C.border; stroke.Transparency = 0.05; stroke.Thickness = 1
        themed(stroke, "Color", "border")

        -- barra de acento (izquierda)
        local bar = Instance.new("Frame", card)
        bar.Size = UDim2.new(0, 4, 1, 0)
        bar.BackgroundColor3 = col
        bar.BorderSizePixel = 0
        bar.ZIndex = 303
        Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 4)

        -- botón cerrar
        local close = Instance.new("TextButton", card)
        close.AnchorPoint = Vector2.new(1, 0)
        close.Position = UDim2.new(1, -8, 0, 8)
        close.Size = UDim2.new(0, 20, 0, 20)
        close.BackgroundTransparency = 1
        close.Text = "✕"
        close.Font = Enum.Font.GothamBold
        close.TextSize = 14
        close.TextColor3 = C.subtext
        close.AutoButtonColor = false
        close.ZIndex = 305
        themed(close, "TextColor3", "subtext")

        -- contenido (con padding; el list-layout apila cabecera + cuerpo + progreso)
        local content = Instance.new("Frame", card)
        content.BackgroundTransparency = 1
        content.Size = UDim2.new(1, 0, 0, 0)
        content.AutomaticSize = Enum.AutomaticSize.Y
        content.ZIndex = 302
        local cpad = Instance.new("UIPadding", content)
        cpad.PaddingLeft = UDim.new(0, 16)
        cpad.PaddingRight = UDim.new(0, 30)
        cpad.PaddingTop = UDim.new(0, 12)
        cpad.PaddingBottom = UDim.new(0, 12)
        local clist = Instance.new("UIListLayout", content)
        clist.FillDirection = Enum.FillDirection.Vertical
        clist.SortOrder = Enum.SortOrder.LayoutOrder
        clist.Padding = UDim.new(0, 6)

        -- cabecera: icono + título
        local head = Instance.new("Frame", content)
        head.BackgroundTransparency = 1
        head.Size = UDim2.new(1, 0, 0, 24)
        head.LayoutOrder = 1
        head.ZIndex = 302

        local iconBg = Instance.new("Frame", head)
        iconBg.Size = UDim2.new(0, 24, 0, 24)
        iconBg.BackgroundColor3 = col
        iconBg.BackgroundTransparency = 0.82
        iconBg.BorderSizePixel = 0
        iconBg.ZIndex = 302
        Instance.new("UICorner", iconBg).CornerRadius = UDim.new(0, 7)

        local emoji = Instance.new("TextLabel", iconBg)
        emoji.BackgroundTransparency = 1
        emoji.Size = UDim2.new(1, 0, 1, 0)
        emoji.Text = typeEmoji(mtype)
        emoji.Font = Enum.Font.GothamBold
        emoji.TextSize = 14
        emoji.ZIndex = 303

        local img = Instance.new("ImageLabel", iconBg)
        img.BackgroundTransparency = 1
        img.Size = UDim2.new(1, 0, 1, 0)
        img.Visible = false
        img.ScaleType = Enum.ScaleType.Fit
        img.ZIndex = 303
        Instance.new("UICorner", img).CornerRadius = UDim.new(0, 7)

        local title = Instance.new("TextLabel", head)
        title.BackgroundTransparency = 1
        title.Position = UDim2.new(0, 32, 0, 0)
        title.Size = UDim2.new(1, -32, 1, 0)
        title.Text = tostring(opts.title or "Aviso")
        title.Font = Enum.Font.GothamBold
        title.TextSize = 15
        title.TextColor3 = C.text
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.TextYAlignment = Enum.TextYAlignment.Center
        title.TextTruncate = Enum.TextTruncate.AtEnd
        title.ZIndex = 302
        themed(title, "TextColor3", "text")

        -- cuerpo (se ajusta solo en altura)
        local body = Instance.new("TextLabel", content)
        body.BackgroundTransparency = 1
        body.Size = UDim2.new(1, 0, 0, 0)
        body.AutomaticSize = Enum.AutomaticSize.Y
        body.Text = tostring(opts.body or "")
        body.Font = Enum.Font.Gotham
        body.TextSize = 13
        body.TextColor3 = C.subtext
        body.TextWrapped = true
        body.TextXAlignment = Enum.TextXAlignment.Left
        body.TextYAlignment = Enum.TextYAlignment.Top
        body.LayoutOrder = 2
        body.ZIndex = 302
        themed(body, "TextColor3", "subtext")
        if body.Text == "" then body.Visible = false end

        -- imagen opcional: si el id carga bien, sustituye el emoji por la imagen
        local idImg = normImg(opts.image)
        if idImg then
            task.spawn(function()
                local probe = Instance.new("ImageLabel"); probe.Image = idImg
                local ok = pcall(function() CP:PreloadAsync({ probe }) end)
                probe:Destroy()
                if ok and img.Parent then
                    img.Image = idImg; img.Visible = true; emoji.Visible = false
                end
            end)
        end

        -- barra de progreso (cuenta atrás) si hay duración
        local duration = tonumber(opts.duration) or CONFIG.DEFAULT_DURATION
        local progFill
        if duration and duration > 0 then
            local ptrack = Instance.new("Frame", content)
            ptrack.Size = UDim2.new(1, 0, 0, 3)
            ptrack.BackgroundColor3 = C.neutral
            ptrack.BackgroundTransparency = 0.3
            ptrack.BorderSizePixel = 0
            ptrack.LayoutOrder = 3
            ptrack.ZIndex = 302
            themed(ptrack, "BackgroundColor3", "neutral")
            Instance.new("UICorner", ptrack).CornerRadius = UDim.new(1, 0)
            progFill = Instance.new("Frame", ptrack)
            progFill.Size = UDim2.new(1, 0, 1, 0)
            progFill.BackgroundColor3 = col
            progFill.BorderSizePixel = 0
            progFill.ZIndex = 303
            Instance.new("UICorner", progFill).CornerRadius = UDim.new(1, 0)
        end

        -- registro del toast (para repaint de color y para el límite de visibles)
        local entry = {
            slot = slot, card = card, type = mtype, hovered = false, _dead = false,
            accentEls = {
                { inst = bar, prop = "BackgroundColor3" },
                { inst = iconBg, prop = "BackgroundColor3" },
            },
        }
        if progFill then table.insert(entry.accentEls, { inst = progFill, prop = "BackgroundColor3" }) end

        local function dismiss()
            if entry._dead then return end
            entry._dead = true
            for i, v in ipairs(live) do if v == entry then table.remove(live, i) break end end
            motionTween(card, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                { GroupTransparency = 1, Position = UDim2.new(0, CONFIG.WIDTH, 0, 0) }, function()
                    if slot and slot.Parent then slot:Destroy() end
                end)
        end
        entry.dismiss = dismiss

        close.MouseButton1Click:Connect(dismiss)
        card.MouseEnter:Connect(function() entry.hovered = true end)
        card.MouseLeave:Connect(function() entry.hovered = false end)

        table.insert(live, entry)
        reflowLimit()

        -- animación de entrada (slide desde la derecha + fade)
        motionTween(card, TweenInfo.new(0.34, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { GroupTransparency = 0, Position = UDim2.new(0, 0, 0, 0) })

        -- cuenta atrás (se pausa mientras el cursor está encima)
        if duration and duration > 0 then
            task.spawn(function()
                local elapsed = 0
                while elapsed < duration and not entry._dead and slot.Parent do
                    task.wait(0.05)
                    if not entry.hovered then
                        elapsed = elapsed + 0.05
                        if progFill then
                            local frac = math.clamp(1 - (elapsed / duration), 0, 1)
                            progFill.Size = UDim2.new(frac, 0, 1, 0)
                        end
                    end
                end
                if not entry._dead then dismiss() end
            end)
        end

        return entry
    end

    -- ---- aviso estilo POPUP DE ROBLOX (centrado, tipo "Error al unirse") ----
    -- COSMÉTICO: solo aparece en la pantalla del que ejecuta el script. NO banea
    -- ni expulsa a nadie de verdad; es una notificación que IMITA el modal de
    -- Roblox (troll). Colores fijos (look Roblox), no siguen el tema a propósito.
    local function showRobloxModal(opts)
        opts = opts or {}
        -- solo un modal a la vez (si había uno, lo quitamos)
        local old = gui:FindFirstChild("NXBroadcastModal")
        if old then old:Destroy() end

        -- fondo oscurecido que bloquea clics detrás (como un modal real)
        local backdrop = Instance.new("Frame")
        backdrop.Name = "NXBroadcastModal"
        backdrop.Size = UDim2.new(1, 0, 1, 0)
        backdrop.Position = UDim2.new(0, 0, 0, 0)
        backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        backdrop.BackgroundTransparency = ANIM.enabled and 1 or 0.45
        backdrop.BorderSizePixel = 0
        backdrop.Active = true
        backdrop.ZIndex = 400
        backdrop.Parent = gui

        -- panel central
        local panel = Instance.new("CanvasGroup")
        panel.Name = "Panel"
        panel.AnchorPoint = Vector2.new(0.5, 0.5)
        panel.Position = UDim2.new(0.5, 0, 0.5, 0)
        panel.Size = UDim2.new(0, 420, 0, 0)
        panel.AutomaticSize = Enum.AutomaticSize.Y
        panel.BackgroundColor3 = Color3.fromRGB(40, 42, 51)
        panel.BackgroundTransparency = 0.02
        panel.BorderSizePixel = 0
        panel.GroupTransparency = ANIM.enabled and 1 or 0
        panel.ZIndex = 401
        panel.Parent = backdrop
        Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)
        local pst = Instance.new("UIStroke", panel)
        pst.Color = Color3.fromRGB(70, 73, 85); pst.Transparency = 0.4; pst.Thickness = 1
        local scale = Instance.new("UIScale", panel)
        scale.Scale = ANIM.enabled and 0.9 or 1

        local pad = Instance.new("UIPadding", panel)
        pad.PaddingTop = UDim.new(0, 22); pad.PaddingBottom = UDim.new(0, 18)
        pad.PaddingLeft = UDim.new(0, 26); pad.PaddingRight = UDim.new(0, 26)
        local pl = Instance.new("UIListLayout", panel)
        pl.FillDirection = Enum.FillDirection.Vertical
        pl.HorizontalAlignment = Enum.HorizontalAlignment.Center
        pl.SortOrder = Enum.SortOrder.LayoutOrder
        pl.Padding = UDim.new(0, 14)

        -- título
        local title = Instance.new("TextLabel", panel)
        title.BackgroundTransparency = 1
        title.Size = UDim2.new(1, 0, 0, 26)
        title.Text = tostring(opts.title or "Error al unirse")
        title.Font = Enum.Font.GothamBold
        title.TextSize = 21
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextXAlignment = Enum.TextXAlignment.Center
        title.LayoutOrder = 1
        title.ZIndex = 402

        -- línea divisora bajo el título
        local divider = Instance.new("Frame", panel)
        divider.Size = UDim2.new(1, -10, 0, 1)
        divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        divider.BackgroundTransparency = 0.82
        divider.BorderSizePixel = 0
        divider.LayoutOrder = 2
        divider.ZIndex = 402

        -- cuerpo (+ "(Código de error: N)" si pasas errorCode)
        local bodyText = tostring(opts.body or "")
        local code = tonumber(opts.errorCode)
        if code then bodyText = bodyText .. "\n(Código de error: " .. tostring(code) .. ")" end
        local body = Instance.new("TextLabel", panel)
        body.BackgroundTransparency = 1
        body.Size = UDim2.new(1, 0, 0, 0)
        body.AutomaticSize = Enum.AutomaticSize.Y
        body.Text = bodyText
        body.Font = Enum.Font.Gotham
        body.TextSize = 15
        body.TextColor3 = Color3.fromRGB(225, 226, 232)
        body.TextWrapped = true
        body.TextXAlignment = Enum.TextXAlignment.Center
        body.TextYAlignment = Enum.TextYAlignment.Top
        body.LineHeight = 1.1
        body.LayoutOrder = 3
        body.ZIndex = 402

        -- botón (pastilla clara con texto oscuro, como el de Roblox)
        local btn = Instance.new("TextButton", panel)
        btn.Size = UDim2.new(1, 0, 0, 42)
        btn.BackgroundColor3 = Color3.fromRGB(228, 229, 234)
        btn.AutoButtonColor = true
        btn.Text = tostring(opts.button or "Salir")
        btn.Font = Enum.Font.GothamMedium
        btn.TextSize = 16
        btn.TextColor3 = Color3.fromRGB(60, 62, 70)
        btn.LayoutOrder = 4
        btn.ZIndex = 402
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

        local dead = false
        local function dismiss()
            if dead then return end
            dead = true
            motionTween(backdrop, TweenInfo.new(0.18), { BackgroundTransparency = 1 })
            motionTween(scale, TweenInfo.new(0.18), { Scale = 0.9 })
            motionTween(panel, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                { GroupTransparency = 1 }, function()
                    if backdrop and backdrop.Parent then backdrop:Destroy() end
                end)
        end
        btn.MouseButton1Click:Connect(function()
            dismiss()
            if type(opts.onButton) == "function" then pcall(opts.onButton) end
        end)

        -- pop de entrada (escala + fade)
        motionTween(backdrop, TweenInfo.new(0.18), { BackgroundTransparency = 0.45 })
        motionTween(panel, TweenInfo.new(0.26, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { GroupTransparency = 0 })
        motionTween(scale, TweenInfo.new(0.26, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })

        -- auto-cierre opcional (0 = se queda hasta que pulsen el botón)
        local duration = tonumber(opts.duration) or 0
        if duration > 0 then
            task.delay(duration, function() if not dead then dismiss() end end)
        end

        return { dismiss = dismiss }
    end

    -- ---- BLOQUEO REMOTO (cierra la herramienta por X tiempo, administrable) ----
    -- Si un mensaje trae lock/lockSeconds/lockMinutes, se muestra el popup Y la
    -- herramienta queda BLOQUEADA hasta que pase ese tiempo. Se guarda en disco
    -- (NX_lock.json) y en _G, así que aunque re-ejecuten el script durante el
    -- bloqueo vuelve a salir el popup y NO pueden usarlo hasta que expire.
    -- El tiempo lo administras TÚ en el JSON. Para liberar antes: manda un mensaje
    -- con "unlock": true, o usa _G.NXBroadcast.unlock().
    local LOCK_FILE = "NX_lock.json"

    local function getLock()  -- devuelve la info del bloqueo ACTIVO (until > ahora), o nil
        local best
        local function consider(d)
            if type(d) == "table" then
                local u = tonumber(d["until"])
                if u and u > os.time() and (not best or u > tonumber(best["until"])) then best = d end
            end
        end
        if type(_G.NX_LOCK) == "table" then consider(_G.NX_LOCK) end
        if hasFS then
            pcall(function()
                if isfile(LOCK_FILE) then consider(HttpService:JSONDecode(readfile(LOCK_FILE))) end
            end)
        end
        return best
    end

    local function setLock(d)
        _G.NX_LOCK = d
        if hasFS then pcall(function() writefile(LOCK_FILE, HttpService:JSONEncode(d)) end) end
    end

    local function clearLock()
        _G.NX_LOCK = nil
        if hasFS then pcall(function() writefile(LOCK_FILE, HttpService:JSONEncode({ ["until"] = 0 })) end) end
    end

    local function fmtRemaining(secs)
        secs = math.max(0, math.floor(secs))
        local m = math.floor(secs / 60)
        local s = secs % 60
        if m > 0 then return string.format("%d min %d seg", m, s) end
        return string.format("%d seg", s)
    end

    -- Cierra/inhabilita la herramienta (la quita de la pantalla).
    local toolClosed = false
    local function closeTool()
        if toolClosed then return end
        toolClosed = true
        pcall(function() gui.Enabled = false end)
        task.delay(0.2, function() pcall(function() gui:Destroy() end) end)
    end

    -- Muestra el popup de bloqueo con el tiempo restante; al pulsar el botón cierra todo.
    -- DESACTIVADO: nunca se muestra el popup de bloqueo.
    local function showLockPopup(d)
        -- no-op
    end

    -- Inicia un bloqueo NUEVO de 'secs' segundos con los textos dados.
    -- DESACTIVADO: el kill-switch remoto ya no puede bloquear la herramienta.
    local function triggerLockout(secs, modalOpts)
        -- no-op
    end

    -- Segundos de bloqueo declarados en un mensaje (lock / lockSeconds / lockMinutes), o 0.
    local function lockSecondsOf(m)
        local s = tonumber(m.lock) or tonumber(m.lockSeconds)
        if not s and tonumber(m.lockMinutes) then s = tonumber(m.lockMinutes) * 60 end
        return tonumber(s) or 0
    end

    -- ---- decidir si un mensaje se muestra a ESTE usuario ----
    local shownSession = {}    -- ids ya mostrados en esta sesión (evita repetir al refrescar)
    local function eligible(m)
        if type(m) ~= "table" then return false end
        if m.enabled == false then return false end
        local exp = tonumber(m.expires)
        if exp and exp > 0 and os.time() > exp then return false end
        local tg = m.targets
        if type(tg) == "table" and #tg > 0 then
            local me, ok = player.UserId, false
            for _, u in ipairs(tg) do if tonumber(u) == me then ok = true break end end
            if not ok then return false end
        end
        local id = m.id and tostring(m.id) or nil
        if id then
            if shownSession[id] then return false end
            if m.once and seen[id] then return false end
        end
        return true
    end

    -- ---- procesa el JSON descargado y encola los avisos elegibles ----
    local function consume(decoded)
        local list = decoded
        if type(decoded) == "table" and decoded.messages then list = decoded.messages end
        if type(list) ~= "table" then return end
        -- acepta array [..] o diccionario { id = {..} }
        local arr = {}
        if #list > 0 then
            arr = list
        else
            for k, v in pairs(list) do
                if type(v) == "table" then v.id = v.id or k; table.insert(arr, v) end
            end
        end
        task.spawn(function()
            for _, m in ipairs(arr) do
                if m.unlock == true then
                    -- mensaje de LIBERACIÓN: quita el bloqueo (si aplica a este user)
                    if eligible(m) then clearLock() end
                elseif eligible(m) then
                    local id = m.id and tostring(m.id) or nil
                    if id then shownSession[id] = true; if m.once then markSeen(id) end end

                    local lockSecs = lockSecondsOf(m)
                    if lockSecs > 0 then
                        -- mensaje con BLOQUEO: cierra la herramienta por X tiempo
                        local active = getLock()
                        if active then
                            showLockPopup(active)          -- ya bloqueado: solo re-mostrar (no reinicia el tiempo)
                        elseif not (id and seen[id]) then
                            triggerLockout(lockSecs, {
                                id = id, title = m.title, body = m.body,
                                button = m.button, errorCode = m.errorCode or m.code,
                            })
                            if id then markSeen(id) end    -- aplicado UNA vez: no re-bloquea tras expirar
                        end
                    else
                        -- estilo modal-Roblox por "style", o por "type" (perdonador:
                        -- type=roblox/ban/kick/modal también abre el popup; type=error
                        -- NO, porque ahí "error" es un color de toast válido).
                        -- DESACTIVADO: los mensajes remotos ya NO pueden abrir el
                        -- modal estilo "ban/kick" de Roblox. Solo toasts normales.
                        pcall(showToast, {
                            type = m.type, title = m.title, body = m.body, image = m.image,
                            duration = tonumber(m.duration) or CONFIG.DEFAULT_DURATION,
                        })
                    end
                    task.wait(CONFIG.GAP)
                end
            end
        end)
    end

    local function fetchNow()
        task.spawn(function()
            local body = rawGet(CONFIG.URL)
            if not body then return end
            local ok, decoded = pcall(function() return HttpService:JSONDecode(body) end)
            if ok and type(decoded) == "table" then consume(decoded) end
        end)
    end

    -- ---- al cargar: limpiar cualquier bloqueo guardado de antes (kill-switch
    -- remoto desactivado; nunca vuelve a quedar bloqueado) ----
    do
        clearLock()
    end

    -- ---- arranque: primer intento con reintentos + refresco periódico ----
    task.spawn(function()
        local got = false
        while not got and gui.Parent do
            local body = rawGet(CONFIG.URL)
            if body then
                local ok, decoded = pcall(function() return HttpService:JSONDecode(body) end)
                if ok and type(decoded) == "table" then got = true; consume(decoded) end
            end
            if not got then task.wait(CONFIG.RETRY) end
        end
        if CONFIG.REFRESH and CONFIG.REFRESH > 0 then
            while gui.Parent do
                task.wait(CONFIG.REFRESH)
                if gui.Parent then fetchNow() end
            end
        end
    end)

    -- ---- API pública para pruebas / uso manual ----
    _G.NXBroadcast = {
        show    = function(o) pcall(showToast, o or {}) end,
        modal   = function(o) pcall(showRobloxModal, o or {}) end,
        refresh = function() fetchNow() end,
        clearSeen = function()
            seen = {}
            if hasFS then pcall(function() writefile(SEEN_FILE, HttpService:JSONEncode(seen)) end) end
        end,
        test = function()
            pcall(showToast, { type = "info",    title = "Aviso de prueba", body = "Esto es un mensaje informativo de NX.", duration = 6 })
            task.delay(0.2, function() pcall(showToast, { type = "success", title = "¡Listo!",  body = "Operación completada con éxito.",      duration = 6 }) end)
            task.delay(0.4, function() pcall(showToast, { type = "warn",    title = "Cuidado",  body = "Esto es una advertencia importante.",   duration = 6 }) end)
            task.delay(0.6, function() pcall(showToast, { type = "error",   title = "Error",    body = "Algo salió mal. Revisa la consola.",    duration = 0 }) end)
        end,
        testBan = function()
            pcall(showRobloxModal, {
                title = "Error al unirse",
                body  = "Esta experiencia o sus moderadores te expulsaron por 4 minutos. Mensaje de moderación:\n\nRoblox has determined that content in this experience violated our Community Standards. You have been temporarily removed.",
                button = "Salir",
                errorCode = 600,
                duration = 0,
            })
        end,
        -- BLOQUEO manual (segundos). Cierra la herramienta y la deja bloqueada.
        lock = function(secs, opts)
            opts = opts or {}
            opts.title = opts.title or "Error al unirse"
            opts.errorCode = opts.errorCode or 600
            triggerLockout(tonumber(secs) or 60, opts)
        end,
        unlock     = function() clearLock() end,           -- libera el bloqueo
        lockStatus = function() return getLock() end,      -- info del bloqueo activo o nil
        testLock   = function(secs)                         -- prueba: bloquea 30s por defecto
            triggerLockout(tonumber(secs) or 30, {
                title = "Error al unirse",
                body  = "Esta experiencia o sus moderadores te expulsaron temporalmente. Mensaje de moderación:\n\nRoblox has determined that content in this experience violated our Community Standards. You have been temporarily removed.",
                button = "Salir", errorCode = 600,
            })
        end,
    }
end


print(("[Profile Analyzer v3.8.3] Cargado correctamente. Executor: %s"):format(EXECUTOR_NAME))


-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  NX HEAD TAG SYSTEM V2  —  PEGA TU MÓDULO COMPLETO AQUÍ ABAJO          ║
-- ╠══════════════════════════════════════════════════════════════════════╣
-- ║  INSTRUCCIONES (Fase 1 de integración):                               ║
-- ║                                                                        ║
-- ║  1) Pega TODO tu bloque "do ... end" del NX Head Tag System V2         ║
-- ║     TAL CUAL, sin modificar nada, JUSTO debajo de esta caja.           ║
-- ║     Debe quedar a nivel raíz (NO dentro de ninguna función).           ║
-- ║                                                                        ║
-- ║  2) Tu módulo expone el global _G.NXHeadTags y se auto-inicia.         ║
-- ║     El Analyzer NO toca sus internos: solo lo enciende/apaga desde     ║
-- ║     el toggle de la pestaña Ajustes (vía _G.NXHeadTags.SetEnabled).    ║
-- ║                                                                        ║
-- ║  3) La línea de abajo (después de donde pegues el módulo) respeta tu   ║
-- ║     preferencia guardada: si dejaste los tags apagados, los para al    ║
-- ║     cargar SIN tocar el código del módulo.                            ║
-- ╚══════════════════════════════════════════════════════════════════════╝

-- <<< PEGA AQUÍ EL BLOQUE do...end DE NX HEAD TAG SYSTEM V2 >>>
--[[
================================================================================
  NX HEAD TAG SYSTEM  V2
  Client-side, local-only head tags (BillboardGui) above player characters.

  • COMPLETELY SEPARATE from your Profile Tag System.
  • Only shared resource is the GitHub JSON (read-only) -> nothing to break.
  • Local only: created on the client, never replicated to the server or
    to other players. Only the user running this sees the tags.
  • Reuses BillboardGui objects across respawns (no leaks).
  • Single RenderStepped loop drives all animations (cheap, scales well).

  USAGE
  -----
  This block auto-starts when it runs. It exposes a control handle on
  _G.NXHeadTags so you can drive it from anywhere:

      _G.NXHeadTags.Start()                 -- start (auto-called already)
      _G.NXHeadTags.Stop()                  -- stop + full cleanup
      _G.NXHeadTags.Refresh()               -- force re-download the JSON now
      _G.NXHeadTags.SetEnabled(bool)        -- toggle on/off
      _G.NXHeadTags.SetTeleportEnabled(bool)-- toggle TP-al-tocar-el-tag on/off

      -- quick local test without touching GitHub:
      _G.NXHeadTags.SetLocalOverride(
          game.Players.LocalPlayer.UserId,
          { tag = "NX OWNER", icon = "", color = "gold", animation = "rainbow" }
      )

  Drop this in as its own LocalScript, OR paste the whole `do ... end`
  block at the END of your existing NX LocalScript. Because it is wrapped
  in `do ... end` and only uses locals + _G.NXHeadTags, it cannot collide
  with any variable in your Profile Analyzer.
================================================================================
]]

do
    -- Clean up a previous instance if this block is re-executed (hot reload).
    if _G.NXHeadTags and _G.NXHeadTags.Stop then
        pcall(_G.NXHeadTags.Stop)
    end

    --==========================================================================
    -- SERVICES
    --==========================================================================
    local Players       = game:GetService("Players")
    local RunService    = game:GetService("RunService")
    local HttpService   = game:GetService("HttpService")
    local TweenService  = game:GetService("TweenService")

    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        LocalPlayer = Players.LocalPlayer
    end

    local NXHeadTags = {}
    NXHeadTags._running = false
    NXHeadTags._anim    = true   -- false = pausa glow/shimmer (toggle de Animaciones)

    --==========================================================================
    -- CONFIG  (tweak everything here)
    --==========================================================================
    local CONFIG = {
        TAGS_URL          = _G.NXTagRepo.tags,
        REFRESH_INTERVAL  = 300,   -- seconds between re-downloads. 0 = download once, never refresh.
        RETRY_INTERVAL    = 10,    -- seconds between retries if the first download fails.
        HEAD_WAIT_TIMEOUT = 10,    -- seconds to wait for a character's Head part.

        SHOW_OWN_TAG      = true,  -- show a tag above your own character too.
        ALWAYS_ON_TOP     = true,  -- render through walls (premium-tool style). false = occluded by geometry.
        MAX_DISTANCE      = 0,     -- 0 = visible a CUALQUIER distancia (gran alcance).
        STUDS_OFFSET_Y    = 2.6,   -- height above the head.

        -- LOD (nivel de detalle): cerca = pill completa; lejos = círculo compacto.
        CIRCLE_DISTANCE   = 65,    -- a partir de esta distancia (studs) el tag se vuelve un círculo.
        CIRCLE_SIZE       = 46,    -- diámetro (px) del círculo lejano.
        CIRCLE_BG_TRANSPARENCY = 0.04,  -- fondo del círculo (más bajo = más oscuro/sólido, tipo tag).
        CIRCLE_LOGO       = "NX",  -- texto del logo dentro del círculo (si no hay imagen).
        CIRCLE_LOGO_IMAGE = "",    -- rbxassetid de tu logo NX (opcional). "" = usa el texto "NX".
        GLOW_ALL          = false, -- (apagado) sin respiración: el tag se queda con su borde fijo

        -- TP AL TOCAR EL TAG: click normal sobre la pill/círculo de un jugador y
        -- te teletransportas a su posición (justo encima). false = desactivado.
        TP_ON_CLICK       = true,
        TP_COOLDOWN       = 0.4,   -- segundos mínimos entre TPs (anti-spam / anti doble-click).

        -- Visuals  (fondo oscuro estilo "tag NX": casi negro y sólido)
        PILL_BG               = Color3.fromRGB(9, 9, 13),
        PILL_BG_TRANSPARENCY  = 0.04,
        PILL_GRADIENT_TOP     = Color3.fromRGB(24, 24, 32),
        PILL_GRADIENT_BOTTOM  = Color3.fromRGB(5, 5, 8),
        USERNAME_COLOR        = Color3.fromRGB(255, 255, 255),

        ROLE_FONT       = Enum.Font.GothamBold,
        ICON_FONT       = Enum.Font.GothamBold,
        USERNAME_FONT   = Enum.Font.GothamMedium,
        ICON_TEXT_SIZE      = 20,
        ICON_IMAGE_SIZE     = 22,   -- tamaño en px del icono cuando es imagen (rbxassetid)
        ROLE_TEXT_SIZE      = 18,
        USERNAME_TEXT_SIZE  = 14,

        DEFAULT_ANIMATION = "gradient", -- used when a tag has no animation and its role has no preset.
        SHOW_USERNAME     = false,      -- nombre debajo del rol. false = SIN nombre (más limpio/pro).
    }

    --==========================================================================
    -- NAMED COLORS  (color field accepts: a name below, "#RRGGBB", or {r,g,b})
    --==========================================================================
    -- La paleta y el parseo de color viven en _G.NXTagKit: aquí había una tabla
    -- de nombres DISTINTA de la del panel (red, blue, cyan, gold… no coincidían),
    -- así que un mismo tag salía de un color en el chip del perfil y de otro
    -- sobre la cabeza. Ahora los dos leen del mismo sitio.
    local resolveColor = _G.NXTagKit.color

    -- HTTP GET that works in executor environments (game:HttpGet) and falls
    -- back to standard HttpService. Matches whatever your profile system uses.
    -- Este módulo traía su propia cadena de intentos (game:HttpGet /
    -- HttpService:GetAsync). rawGet ya hace eso y además prueba el 'request'
    -- del executor, que es el único que funciona en varios de ellos.
    local function httpGet(url)
        return (rawGet(url))
    end

    --==========================================================================
    -- TAG DATABASE  (download + cache + resolve)
    --==========================================================================
    local TagDatabase = {
        _resolved = {},     -- [tostring(userId)] = { tag, icon, color(Color3), animation, priority }
        _loaded   = false,
        _lastFetch = 0,
    }

    -- Normaliza el campo de imagen: acepta número, "123" o "rbxassetid://123".
    -- Devuelve nil si no hay imagen (entonces se usa el emoji/texto de 'icon').
    local normalizeImage = _G.NXTagKit.imagen

    -- ROLE_PRESETS + normalizeRole se usaban abajo pero se habían quedado sin
    -- definir tras el refactor a v2/roles.json, así que _resolveEntry lanzaba
    -- "attempt to call a nil value" en cuanto Load() recorría la primera entrada
    -- (dejando _resolved sin llenar y matando el refresh loop). El LOOK del rol
    -- ahora vive en v2/roles.json; las entradas del legacy (main/tags.json) ya
    -- traen su propio color/icon/animation/priority, así que un preset vacío es
    -- suficiente: _resolveEntry lee esos campos del raw. normalizeRole replica
    -- el normRole de la capa v2 (trim + espacios colapsados + MAYÚSCULAS).
    local function normalizeRole(s)
        s = tostring(s or ""):gsub("%s+", " ")
        return string.upper(s:match("^%s*(.-)%s*$") or s)
    end
    local ROLE_PRESETS = {}

    function TagDatabase:_resolveEntry(raw)
        local roleName  = raw.tag or raw.role or "MEMBER"
        local preset    = ROLE_PRESETS[normalizeRole(roleName)] or {}

        local color     = resolveColor(raw.color, preset.color or Color3.fromRGB(255, 255, 255))
        local icon      = _G.NXTagKit.icono(raw.icon or preset.icon)
        local iconImage = normalizeImage(raw.iconImage or raw.image or preset.iconImage)
        local animation = preset.animation or raw.animation or CONFIG.DEFAULT_ANIMATION
        animation       = string.lower(tostring(animation))
        local priority  = tonumber(raw.priority) or preset.priority or 0

        return {
            tag       = tostring(roleName),
            icon      = tostring(icon),
            iconImage = iconImage,           -- NUEVO (nil si no hay imagen)
            color     = color,
            animation = animation,
            priority  = priority,
        }
    end

    function TagDatabase:Load(force)
        if self._loaded and not force then
            return true
        end
        local body = httpGet(CONFIG.TAGS_URL)
        if not body then
            warn("[NX Head Tags] Could not download the tag database.")
            return false
        end
        local ok, decoded = pcall(function()
            return HttpService:JSONDecode(body)
        end)
        if not ok or type(decoded) ~= "table" then
            warn("[NX Head Tags] Could not parse the tag JSON.")
            return false
        end

        local resolved = {}
        for userId, data in pairs(decoded) do
            if type(data) == "table" and not tostring(userId):match("^_") then  -- ignora _comment, _roles…
                resolved[tostring(userId)] = self:_resolveEntry(data)
            end
        end
        self._resolved  = resolved
        self._loaded    = true
        self._lastFetch = os.clock()
        return true
    end

    function TagDatabase:Get(userId)
        -- (Fase 1 NX V2) v2 primero; si no hay tag v2 o el resolver no existe,
        -- cae al resuelto actual (presets). 100% aditivo / reversible.
        if _G.NXResolve then
            local v = _G.NXResolve(userId)
            if v then return v end
        end
        return self._resolved[tostring(userId)]
    end

    --==========================================================================
    -- ANIMATION SYSTEM  (modular)
    -- Each entry may define:
    --   init(ctx, tag)   -> one-time setup (e.g. create a UIGradient)
    --   update(ctx, t)   -> called every frame, t = seconds the tag has existed
    -- ctx exposes: billboard, container, scale, pill, stroke, icon, role,
    --              roleStroke, username  (+ any instances an init() stores)
    -- Add a new animation simply by adding a key here, then reference it in JSON.
    --==========================================================================
    local Animations = {}

    Animations.none = {
        update = function() end,
    }

    -- Gentle size breathing via UIScale.
    Animations.pulse = {
        update = function(ctx, t)
            ctx.scale.Scale = 1 + 0.07 * math.sin(t * 4)
        end,
    }

    -- Vertical bob via the billboard's StudsOffset.
    Animations.bounce = {
        update = function(ctx, t)
            local y = math.abs(math.sin(t * 3)) * 0.35
            ctx.billboard.StudsOffset = Vector3.new(0, CONFIG.STUDS_OFFSET_Y + y, 0)
        end,
    }

    -- Pulsing border + text outline glow.
    Animations.glow = {
        update = function(ctx, t)
            local a = 0.5 + 0.5 * math.sin(t * 3)
            ctx.stroke.Transparency  = lerp(0.05, 0.7, a)
            ctx.stroke.Thickness     = lerp(1.5, 3.2, a)
            ctx.roleStroke.Transparency = lerp(0.0, 0.55, a)
        end,
    }

    -- Full hue cycle on the text, icon and border.
    Animations.rainbow = {
        update = function(ctx, t)
            local hue = (t * 0.18) % 1
            local c = Color3.fromHSV(hue, 0.85, 1)
            ctx.role.TextColor3 = c
            if ctx.icon:IsA("ImageLabel") then
                ctx.icon.ImageColor3 = c      -- tiñe la imagen (no tiene TextColor3)
            else
                ctx.icon.TextColor3 = c
            end
            ctx.stroke.Color    = c
        end,
    }

    -- Flowing multi-color gradient derived from the tag color.
    Animations.gradient = {
        init = function(ctx)
            local g = Instance.new("UIGradient")
            g.Name = "FlowGradient"
            local h, s = Color3.toHSV(ctx.role.TextColor3)
            local c1 = Color3.fromHSV((h + 0.08) % 1, math.min(s + 0.1, 1), 1)
            local c2 = ctx.role.TextColor3
            local c3 = Color3.fromHSV((h + 0.92) % 1, math.min(s + 0.1, 1), 1)
            g.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0,   c1),
                ColorSequenceKeypoint.new(0.5, c2),
                ColorSequenceKeypoint.new(1,   c3),
            })
            g.Parent = ctx.role
            ctx.gradient = g
        end,
        update = function(ctx, t)
            ctx.gradient.Rotation = math.sin(t * 0.8) * 25
            ctx.gradient.Offset   = Vector2.new(math.sin(t * 0.6) * 0.4, 0)
        end,
    }

    -- A bright band that sweeps across the text.
    Animations.shine = {
        init = function(ctx)
            local g = Instance.new("UIGradient")
            g.Name = "ShineGradient"
            local base  = ctx.role.TextColor3
            local white = Color3.fromRGB(255, 255, 255)
            g.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0.0,  base),
                ColorSequenceKeypoint.new(0.42, base),
                ColorSequenceKeypoint.new(0.50, white),
                ColorSequenceKeypoint.new(0.58, base),
                ColorSequenceKeypoint.new(1.0,  base),
            })
            g.Parent = ctx.role
            ctx.shine = g
        end,
        update = function(ctx, t)
            ctx.shine.Offset = Vector2.new(((t * 0.6) % 1.6) - 0.8, 0)
        end,
    }
Animations.luxe = {
    init = function(ctx)
        local g = Instance.new("UIGradient")
        g.Name = "LuxeBorder"
        local h, s, v = Color3.toHSV(ctx.role.TextColor3)
        local light = Color3.fromHSV(h, math.max(s - 0.30, 0), math.min(v + 0.18, 1))
        local deep  = Color3.fromHSV(h, math.min(s + 0.15, 1), math.max(v - 0.28, 0.15))

        g.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0.0, light),
            ColorSequenceKeypoint.new(0.5, ctx.role.TextColor3),
            ColorSequenceKeypoint.new(1.0, deep),
        })

        g.Parent = ctx.stroke
        ctx.luxeBorder = g
    end,

    update = function(ctx, t)
        ctx.luxeBorder.Rotation = (t * 55) % 360

        local a = 0.5 + 0.5 * math.sin(t * 2.2)

        ctx.stroke.Thickness =
            lerp(2.0, 3.0, a)

        ctx.stroke.Transparency =
            lerp(0.0, 0.22, a)
    end,
}

-- ELITE animations (next-gen tier). All share these properties:
    --   • One UIGradient on the existing pill stroke (no new frames, no second loop).
    --   • One UIGradient on the role text for animated text shading.
    --   • Driven entirely by the existing shared RenderStepped loop.
    --   • init() builds; update() advances time — no per-frame allocations.

    -- Helper shared by elite animations. Local to the Animations table.
    local function buildEliteGradients(ctx, lightShift, deepShift)
        local base = ctx.role.TextColor3
        local h, s, v = Color3.toHSV(base)
        local light = Color3.fromHSV(h, math.max(s - lightShift, 0), math.min(v + 0.22, 1))
        local deep  = Color3.fromHSV(h, math.min(s + deepShift, 1), math.max(v - 0.32, 0.12))

        local border = Instance.new("UIGradient")
        border.Name = "EliteBorder"
        border.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0.00, deep),
            ColorSequenceKeypoint.new(0.30, base),
            ColorSequenceKeypoint.new(0.50, light),
            ColorSequenceKeypoint.new(0.70, base),
            ColorSequenceKeypoint.new(1.00, deep),
        })
        border.Parent = ctx.stroke

        local text = Instance.new("UIGradient")
        text.Name = "EliteText"
        text.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0.0, base),
            ColorSequenceKeypoint.new(0.5, light),
            ColorSequenceKeypoint.new(1.0, base),
        })
        text.Rotation = 90
        text.Parent = ctx.role

        return border, text, base, light, deep
    end

    -- NX OWNER — gold elite. Counter-rotating border + text shimmer + breathing pill.
    Animations.elite_gold = {
        init = function(ctx)
            local border, text = buildEliteGradients(ctx, 0.35, 0.10)
            ctx.eliteBorder = border
            ctx.eliteText   = text
            ctx.pillBaseTransparency = ctx.pill.BackgroundTransparency
        end,
        update = function(ctx, t)
            ctx.eliteBorder.Rotation = (t * 70) % 360
            ctx.eliteText.Offset     = Vector2.new(((t * 0.55) % 2) - 1, 0)
            local a = 0.5 + 0.5 * math.sin(t * 2.0)
            ctx.stroke.Thickness     = lerp(2.4, 3.6, a)
            ctx.stroke.Transparency  = lerp(0.00, 0.18, a)
            ctx.roleStroke.Transparency = lerp(0.05, 0.45, a)
            ctx.pill.BackgroundTransparency = lerp(
                math.max(ctx.pillBaseTransparency - 0.04, 0),
                ctx.pillBaseTransparency + 0.04, a)
        end,
    }

    -- OWNER ASSISTANT — platinum/silver elite. Cooler shimmer, slightly slower.
    Animations.elite_platinum = {
        init = function(ctx)
            local border, text = buildEliteGradients(ctx, 0.55, 0.05)
            ctx.eliteBorder = border
            ctx.eliteText   = text
        end,
        update = function(ctx, t)
            ctx.eliteBorder.Rotation = (t * 55) % 360
            ctx.eliteText.Offset     = Vector2.new(((t * 0.45) % 2) - 1, 0)
            local a = 0.5 + 0.5 * math.sin(t * 1.8)
            ctx.stroke.Thickness    = lerp(2.2, 3.2, a)
            ctx.stroke.Transparency = lerp(0.00, 0.20, a)
        end,
    }

    -- SUPPORT SPECIALIST — cyan premium. Clean tech feel, faster sweep.
    Animations.elite_cyan = {
        init = function(ctx)
            local border, text = buildEliteGradients(ctx, 0.40, 0.10)
            ctx.eliteBorder = border
            ctx.eliteText   = text
        end,
        update = function(ctx, t)
            ctx.eliteBorder.Rotation = (t * 90) % 360
            ctx.eliteText.Offset     = Vector2.new(((t * 0.7) % 2) - 1, 0)
            local a = 0.5 + 0.5 * math.sin(t * 2.4)
            ctx.stroke.Thickness    = lerp(2.0, 3.0, a)
            ctx.stroke.Transparency = lerp(0.05, 0.25, a)
        end,
    }

    -- CYBER SECURITY — electric blue. Sharper pulse + occasional flicker accent.
    Animations.elite_cyber = {
        init = function(ctx)
            local border, text, base, light = buildEliteGradients(ctx, 0.30, 0.15)
            ctx.eliteBorder = border
            ctx.eliteText   = text
            ctx.eliteAccent = light
            ctx.eliteBase   = base
        end,
        update = function(ctx, t)
            ctx.eliteBorder.Rotation = (t * 100) % 360
            ctx.eliteText.Offset     = Vector2.new(((t * 0.8) % 2) - 1, 0)
            local pulse   = 0.5 + 0.5 * math.sin(t * 3.0)
            local flicker = (math.sin(t * 17) > 0.985) and 1 or 0       -- rare electric blip
            ctx.stroke.Thickness    = lerp(2.2, 3.4, pulse) + flicker * 0.6
            ctx.stroke.Transparency = lerp(0.00, 0.22, pulse) - flicker * 0.15
            ctx.roleStroke.Transparency = lerp(0.10, 0.45, pulse)
        end,
    }

    -- SPECIAL ACCESS — crystal purple. Slow prismatic hue drift around the base color.
    Animations.elite_crystal = {
        init = function(ctx)
            local border, text, base = buildEliteGradients(ctx, 0.35, 0.12)
            ctx.eliteBorder = border
            ctx.eliteText   = text
            ctx.eliteBase   = base
        end,
        update = function(ctx, t)
            ctx.eliteBorder.Rotation = (t * 60) % 360
            ctx.eliteText.Offset     = Vector2.new(((t * 0.5) % 2) - 1, 0)
            local a = 0.5 + 0.5 * math.sin(t * 2.0)
            ctx.stroke.Thickness    = lerp(2.2, 3.3, a)
            ctx.stroke.Transparency = lerp(0.00, 0.20, a)
            -- subtle hue drift on the role text for the prismatic crystal feel
            local h, s, v = Color3.toHSV(ctx.eliteBase)
            local drift  = math.sin(t * 0.9) * 0.04
            ctx.role.TextColor3 = Color3.fromHSV((h + drift) % 1, s, v)
        end,
    }
    --==========================================================================
    -- TELEPORT ON CLICK  (tocar el tag de un jugador -> TP a su posición)
    -- Click normal sobre la pill (cerca) o el círculo (lejos) y te llevas a tu
    -- personaje justo encima del jugador. Anti-spam con cooldown.
    --==========================================================================
    local lastTeleport = 0

    -- Raíz del personaje. R6 y R15 usan HumanoidRootPart; fallback a torsos.
    local function rootOf(character)
        if not character then return nil end
        return character:FindFirstChild("HumanoidRootPart")
            or character:FindFirstChild("UpperTorso")
            or character:FindFirstChild("Torso")
    end

    local function teleportToPlayer(targetPlayer)
        if not CONFIG.TP_ON_CLICK then return end
        if not targetPlayer or targetPlayer == LocalPlayer then return end
        local myRoot = rootOf(LocalPlayer.Character)
        local tRoot  = rootOf(targetPlayer.Character)
        if not myRoot or not tRoot then return end
        -- "Justo encima": misma posición y orientación que el objetivo.
        myRoot.CFrame = tRoot.CFrame
    end

    -- Rebote rápido del elemento visible como confirmación visual del click.
    local function flashTag(ctx)
        local s = ctx.isFar and ctx.circleScale or ctx.pillScale
        if not s then return end
        local up = TweenService:Create(s,
            TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { Scale = 1.28 })
        up:Play()
        up.Completed:Once(function()
            TweenService:Create(s,
                TweenInfo.new(0.20, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                { Scale = 1 }):Play()
        end)
    end

    local function onTagClicked(ctx)
        if not CONFIG.TP_ON_CLICK then return end
        local now = os.clock()
        if now - lastTeleport < (CONFIG.TP_COOLDOWN or 0.4) then return end
        lastTeleport = now
        flashTag(ctx)
        teleportToPlayer(ctx.player)
    end

    -- Hace un Frame clickeable (Active) y dispara el TP al pulsarlo. La conexión
    -- se libera sola cuando el billboard se destruye (Destroy desconecta sus eventos).
    local function makeClickable(guiObject, ctx)
        guiObject.Active = true
        guiObject.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                onTagClicked(ctx)
            end
        end)
    end

    --==========================================================================
    -- BILLBOARD BUILDER  (premium look: stroke, padding, corners, gradient)
    --==========================================================================
    local function buildBillboard(player, tag)
        local billboard = Instance.new("BillboardGui")
        billboard.Name          = "NXHeadTag_" .. player.UserId
        billboard.Size          = UDim2.fromOffset(360, 90)
        billboard.StudsOffset   = Vector3.new(0, CONFIG.STUDS_OFFSET_Y, 0)
        billboard.AlwaysOnTop   = CONFIG.ALWAYS_ON_TOP
        billboard.LightInfluence = 0
        billboard.MaxDistance   = (CONFIG.MAX_DISTANCE > 0) and CONFIG.MAX_DISTANCE or 1e4
        billboard.ClipsDescendants = false

        -- Centered transparent container that holds the vertical stack.
        local container = Instance.new("Frame")
        container.Name                 = "Container"
        container.BackgroundTransparency = 1
        container.Size                 = UDim2.fromScale(1, 1)
        container.AnchorPoint          = Vector2.new(0.5, 0.5)
        container.Position             = UDim2.fromScale(0.5, 0.5)
        container.Parent               = billboard

        local scale = Instance.new("UIScale")  -- used by pulse / scaling anims
        scale.Scale = 1
        scale.Parent = container

        local vlist = Instance.new("UIListLayout")
        vlist.FillDirection       = Enum.FillDirection.Vertical
        vlist.HorizontalAlignment = Enum.HorizontalAlignment.Center
        vlist.VerticalAlignment   = Enum.VerticalAlignment.Center
        vlist.SortOrder           = Enum.SortOrder.LayoutOrder
        vlist.Padding             = UDim.new(0, 2)
        vlist.Parent              = container

        ----------------------------------------------------------------------
        -- The role "pill"
        ----------------------------------------------------------------------
        local pill = Instance.new("Frame")
        pill.Name                 = "RolePill"
        pill.BackgroundColor3     = CONFIG.PILL_BG
        pill.BackgroundTransparency = CONFIG.PILL_BG_TRANSPARENCY
        pill.AutomaticSize        = Enum.AutomaticSize.XY
        pill.Size                 = UDim2.fromOffset(0, 0)
        pill.LayoutOrder          = 1
        pill.Parent               = container

        local pillCorner = Instance.new("UICorner")
        pillCorner.CornerRadius = UDim.new(1, 0)   -- full stadium / pill shape
        pillCorner.Parent = pill

        local pillStroke = Instance.new("UIStroke")
        pillStroke.Thickness       = 2
        pillStroke.Color           = tag.color
        pillStroke.Transparency    = 0.1
        pillStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        pillStroke.Parent          = pill

        -- Halo de GLOW para todos (late en el loop, independiente de la animación del rol).
        local glowStroke = Instance.new("UIStroke")
        glowStroke.Thickness       = 4
        glowStroke.Color           = tag.color
        glowStroke.Transparency    = 0.55
        glowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        glowStroke.Parent          = pill

        local pillGradient = Instance.new("UIGradient")
        pillGradient.Rotation = 90
        pillGradient.Color = ColorSequence.new(CONFIG.PILL_GRADIENT_TOP, CONFIG.PILL_GRADIENT_BOTTOM)
        pillGradient.Parent = pill

        local pillPad = Instance.new("UIPadding")
        pillPad.PaddingLeft   = UDim.new(0, 12)
        pillPad.PaddingRight  = UDim.new(0, 12)
        pillPad.PaddingTop    = UDim.new(0, 5)
        pillPad.PaddingBottom = UDim.new(0, 5)
        pillPad.Parent        = pill

        local hlist = Instance.new("UIListLayout")
        hlist.FillDirection       = Enum.FillDirection.Horizontal
        hlist.VerticalAlignment   = Enum.VerticalAlignment.Center
        hlist.HorizontalAlignment = Enum.HorizontalAlignment.Center
        hlist.SortOrder           = Enum.SortOrder.LayoutOrder
        hlist.Padding             = UDim.new(0, 6)
        hlist.Parent              = pill

        -- Icono: imagen personalizada (rbxassetid) si el JSON la trae; si no, emoji/texto.
        local icon
        if tag.iconImage and tag.iconImage ~= "" then
            icon = Instance.new("ImageLabel")
            icon.Name                   = "Icon"
            icon.BackgroundTransparency = 1
            icon.Image                  = tag.iconImage
            icon.Size                   = UDim2.fromOffset(CONFIG.ICON_IMAGE_SIZE, CONFIG.ICON_IMAGE_SIZE)
            icon.ScaleType              = Enum.ScaleType.Fit
            icon.LayoutOrder            = 1
            icon.Visible                = true
            icon.Parent                 = pill
            -- Si la imagen NO carga (asset no listo/inválido), ocultar el icono para
            -- que NO deje espacio sobrante en la pill (UIListLayout ignora lo invisible).
            do
                local thisIcon = icon
                task.spawn(function()
                    local deadline = os.clock() + 4
                    while os.clock() < deadline do
                        local loaded = true
                        pcall(function() loaded = thisIcon.IsLoaded end)
                        if loaded then return end       -- cargó bien: se queda visible
                        task.wait(0.25)
                    end
                    if thisIcon and thisIcon.Parent then thisIcon.Visible = false end
                end)
            end
        else
            icon = Instance.new("TextLabel")
            icon.Name                   = "Icon"
            icon.BackgroundTransparency = 1
            icon.AutomaticSize          = Enum.AutomaticSize.XY
            icon.Font                   = CONFIG.ICON_FONT
            icon.Text                   = tag.icon
            icon.TextSize               = CONFIG.ICON_TEXT_SIZE
            icon.TextColor3             = Color3.fromRGB(255, 255, 255)
            icon.LayoutOrder            = 1
            icon.Visible                = (tag.icon ~= "")
            icon.Parent                 = pill
        end

        local role = Instance.new("TextLabel")
        role.Name                 = "Role"
        role.BackgroundTransparency = 1
        role.AutomaticSize        = Enum.AutomaticSize.XY
        role.Font                 = CONFIG.ROLE_FONT
        role.Text                 = tag.tag
        role.TextSize             = CONFIG.ROLE_TEXT_SIZE
        role.TextColor3           = tag.color
        role.LayoutOrder          = 2
        role.Parent               = pill

        local roleStroke = Instance.new("UIStroke")
        roleStroke.Thickness    = 1.4
        roleStroke.Color        = Color3.fromRGB(0, 0, 0)
        roleStroke.Transparency = 0.25
        roleStroke.Parent       = role

        ----------------------------------------------------------------------
        -- Username (second line). To make it SINGLE-LINE instead, set
        -- CONFIG.SHOW_USERNAME = false and add the name into the pill's
        -- horizontal layout (see the note in chat).
        ----------------------------------------------------------------------
        local username
        if CONFIG.SHOW_USERNAME then
            username = Instance.new("TextLabel")
            username.Name                 = "Username"
            username.BackgroundTransparency = 1
            username.AutomaticSize        = Enum.AutomaticSize.XY
            username.Font                 = CONFIG.USERNAME_FONT
            username.Text                 = player.DisplayName   -- swap for player.Name if you prefer @usernames
            username.TextSize             = CONFIG.USERNAME_TEXT_SIZE
            username.TextColor3           = CONFIG.USERNAME_COLOR
            username.LayoutOrder          = 2
            username.Parent               = container

            local nameStroke = Instance.new("UIStroke")
            nameStroke.Thickness    = 1.2
            nameStroke.Color        = Color3.fromRGB(0, 0, 0)
            nameStroke.Transparency = 0.3
            nameStroke.Parent       = username
        end

        ----------------------------------------------------------------------
        -- Círculo compacto (LOD): se muestra cuando estás LEJOS. Es un disco
        -- con el color del rol, glow, y el icono (o iniciales) dentro.
        ----------------------------------------------------------------------
        local circle = Instance.new("Frame")
        circle.Name                 = "Circle"
        circle.AnchorPoint          = Vector2.new(0.5, 0.5)
        circle.Position             = UDim2.fromScale(0.5, 0.5)
        circle.Size                 = UDim2.fromOffset(CONFIG.CIRCLE_SIZE, CONFIG.CIRCLE_SIZE)
        circle.BackgroundColor3     = CONFIG.PILL_BG
        circle.BackgroundTransparency = CONFIG.CIRCLE_BG_TRANSPARENCY
        circle.Visible              = false
        circle.Parent               = billboard

        local circleCorner = Instance.new("UICorner")
        circleCorner.CornerRadius = UDim.new(1, 0)
        circleCorner.Parent = circle

        local circleGlow = Instance.new("UIStroke")
        circleGlow.Thickness    = 3
        circleGlow.Color        = tag.color
        circleGlow.Transparency = 0.25
        circleGlow.Parent       = circle

        -- Logo NX dentro del círculo (nunca queda vacío). Si defines CIRCLE_LOGO_IMAGE
        -- usa esa imagen; si no, dibuja el monograma "NX" con el color del rol.
        local circleIcon
        if CONFIG.CIRCLE_LOGO_IMAGE and CONFIG.CIRCLE_LOGO_IMAGE ~= "" then
            circleIcon = Instance.new("ImageLabel")
            circleIcon.BackgroundTransparency = 1
            circleIcon.Image                  = CONFIG.CIRCLE_LOGO_IMAGE
            circleIcon.Size                   = UDim2.fromScale(0.70, 0.70)
            circleIcon.Position               = UDim2.fromScale(0.5, 0.5)
            circleIcon.AnchorPoint            = Vector2.new(0.5, 0.5)
            circleIcon.ScaleType              = Enum.ScaleType.Fit
            circleIcon.ImageColor3            = tag.color
            circleIcon.Parent                 = circle
        else
            circleIcon = Instance.new("TextLabel")
            circleIcon.BackgroundTransparency = 1
            circleIcon.Size                   = UDim2.fromScale(0.82, 0.82)
            circleIcon.Position               = UDim2.fromScale(0.5, 0.5)
            circleIcon.AnchorPoint            = Vector2.new(0.5, 0.5)
            circleIcon.Font                   = Enum.Font.GothamBlack
            circleIcon.TextScaled             = true
            circleIcon.TextColor3             = tag.color
            circleIcon.Text                   = CONFIG.CIRCLE_LOGO
            local ciStroke = Instance.new("UIStroke")
            ciStroke.Thickness = 1.5; ciStroke.Color = Color3.fromRGB(0, 0, 0); ciStroke.Transparency = 0.3
            ciStroke.Parent = circleIcon
            circleIcon.Parent = circle
        end

        -- Escalas (UIScale) para la animación de transición pill <-> círculo.
        local circleScale = Instance.new("UIScale")
        circleScale.Scale = 1
        circleScale.Parent = circle

        local pillScale = Instance.new("UIScale")
        pillScale.Scale = 1
        pillScale.Parent = pill

        local ctx = {
            player     = player,
            billboard  = billboard,
            container  = container,
            scale      = scale,
            pill       = pill,
            stroke     = pillStroke,
            glow        = glowStroke,
            circle      = circle,
            circleGlow  = circleGlow,
            circleIcon  = circleIcon,
            circleScale = circleScale,
            pillScale   = pillScale,
            isFar       = false,
            transitioning = false,
            icon       = icon,
            role       = role,
            roleStroke = roleStroke,
            username   = username,
            tag        = tag,
            elapsed    = 0,
        }

        -- TP al tocar el tag: tanto la pill (cerca) como el círculo (lejos).
        makeClickable(pill, ctx)
        makeClickable(circle, ctx)

        -- Wire up the chosen animation (modular).
        local anim = Animations[tag.animation] or Animations.none
        if anim.init then
            pcall(anim.init, ctx, tag)
        end
        ctx.anim = anim

        return ctx
    end

    -- Cheap fingerprint so we know when a tag actually changed (vs a respawn).
    local function tagSignature(t)
        if not t then return "nil" end
        local c = t.color
        return string.format("%s|%s|%s|%s|%d|%d,%d,%d",
            t.tag, t.icon, tostring(t.iconImage), t.animation, t.priority or 0,
            math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5))
    end

    --==========================================================================
    -- TAG MANAGER  (lifecycle + object reuse)
    --==========================================================================
    local TagManager = {
        active    = {},   -- [player] = ctx
        container = nil,  -- Folder under PlayerGui that holds all billboards
    }

    function TagManager:_getContainer()
        if self.container and self.container.Parent then
            return self.container
        end
        local pg = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui")
        local folder = pg:FindFirstChild("NXHeadTags")
        if not folder then
            folder = Instance.new("Folder")
            folder.Name = "NXHeadTags"
            folder.Parent = pg
        end
        self.container = folder
        return folder
    end

    function TagManager:remove(player)
        local ctx = self.active[player]
        if ctx then
            if ctx.billboard then
                ctx.billboard:Destroy()
            end
            self.active[player] = nil
        end
    end

    function TagManager:apply(player)
        if (not CONFIG.SHOW_OWN_TAG) and player == LocalPlayer then
            self:remove(player)
            return
        end

        local tag = TagDatabase:Get(player.UserId)
        if not tag then
            self:remove(player)    -- player has no (longer a) tag
            return
        end

        local character = player.Character
        if not character then
            return  -- CharacterAdded will re-call this once the body exists
        end
        local head = character:FindFirstChild("Head")
        if not head then
            return
        end

        local ctx = self.active[player]

        -- REUSE: same tag, just point the existing billboard at the new head.
        if ctx and tagSignature(ctx.tag) == tagSignature(tag) then
            ctx.billboard.Adornee = head
            ctx.billboard.Enabled = true
            ctx.adornee = head
            if ctx.username then
                ctx.username.Text = player.DisplayName
            end
            return
        end

        -- REBUILD: brand new, or the tag changed after a refresh.
        if ctx then
            self:remove(player)
        end
        local newCtx = buildBillboard(player, tag)
        newCtx.adornee = head
        newCtx.billboard.Adornee = head
        newCtx.billboard.Parent  = self:_getContainer()
        self.active[player] = newCtx
    end

    function TagManager:refreshAll()
        for _, player in ipairs(Players:GetPlayers()) do
            self:apply(player)
        end
    end

    function TagManager:clearAll()
        for _, ctx in pairs(self.active) do
            if ctx.billboard then
                ctx.billboard:Destroy()
            end
        end
        table.clear(self.active)
    end

    --==========================================================================
    -- PLAYER / CHARACTER WIRING
    --==========================================================================
    local connections = {}   -- [player] = { connection, ... }

    local function hookCharacter(player, character)
        task.spawn(function()
            local head = character:FindFirstChild("Head")
                or character:WaitForChild("Head", CONFIG.HEAD_WAIT_TIMEOUT)
            if head and player.Character == character then
                TagManager:apply(player)
            end
        end)
    end

    local function hookPlayer(player)
        connections[player] = connections[player] or {}

        if player.Character then
            hookCharacter(player, player.Character)
        end

        table.insert(connections[player], player.CharacterAdded:Connect(function(character)
            hookCharacter(player, character)
        end))

        -- On death/despawn: keep the billboard object (reuse), just hide it.
        table.insert(connections[player], player.CharacterRemoving:Connect(function()
            local ctx = TagManager.active[player]
            if ctx and ctx.billboard then
                ctx.billboard.Enabled = false
                ctx.billboard.Adornee = nil
                ctx.adornee = nil
            end
        end))
    end

    local function unhookPlayer(player)
        if connections[player] then
            for _, c in ipairs(connections[player]) do
                pcall(function() c:Disconnect() end)
            end
            connections[player] = nil
        end
        TagManager:remove(player)
    end

    --==========================================================================
    -- LOD TRANSITION  (animación pop al pasar de pill a círculo y viceversa)
    --==========================================================================
    -- Curvas de la transición pill <-> círculo:
    --   POP    = entra creciendo desde 0 con un rebote suave (overshoot).
    --   SHRINK = sale encogiéndose limpio hasta 0.
    --   FADE   = acompaña con transparencia para que no sea un corte seco.
    --   SPIN   = giro corto de "asentamiento" del logo del círculo.
    local LOD_POP    = TweenInfo.new(0.42, Enum.EasingStyle.Back,  Enum.EasingDirection.Out)
    local LOD_SHRINK = TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    local LOD_FADE   = TweenInfo.new(0.26, Enum.EasingStyle.Quad,  Enum.EasingDirection.Out)
    local LOD_SPIN   = TweenInfo.new(0.5,  Enum.EasingStyle.Back,  Enum.EasingDirection.Out)

    local function setLOD(ctx, far)
        ctx.transitioning = true   -- pausa el loop de glow para que no pelee con el fade
        if far then
            -- PILL -> CÍRCULO: el círculo crece desde el centro con rebote, aparece
            -- desde transparente y su logo gira para "asentarse"; la pill se encoge
            -- y se desvanece a la vez (transición fluida, no un corte).
            ctx.circle.Visible              = true
            ctx.circleScale.Scale           = 0.0
            ctx.circle.BackgroundTransparency = 1
            if ctx.circleGlow then ctx.circleGlow.Transparency = 1 end
            if ctx.circleIcon then ctx.circleIcon.Rotation = -90 end

            TweenService:Create(ctx.circleScale, LOD_POP, { Scale = 1 }):Play()
            TweenService:Create(ctx.circle, LOD_FADE,
                { BackgroundTransparency = CONFIG.CIRCLE_BG_TRANSPARENCY }):Play()
            if ctx.circleGlow then
                TweenService:Create(ctx.circleGlow, LOD_FADE, { Transparency = 0.25 }):Play()
            end
            if ctx.circleIcon then
                TweenService:Create(ctx.circleIcon, LOD_SPIN, { Rotation = 0 }):Play()
            end

            local t = TweenService:Create(ctx.pillScale, LOD_SHRINK, { Scale = 0.0 })
            t:Play()
            t.Completed:Once(function()
                if ctx.isFar and ctx.container then ctx.container.Visible = false end
                ctx.transitioning = false
            end)
        else
            -- CÍRCULO -> PILL: la pill reaparece con rebote; el círculo se encoge
            -- y se desvanece al mismo tiempo.
            ctx.container.Visible = true
            ctx.pillScale.Scale   = 0.0
            TweenService:Create(ctx.pillScale, LOD_POP, { Scale = 1 }):Play()

            TweenService:Create(ctx.circle, LOD_FADE, { BackgroundTransparency = 1 }):Play()
            if ctx.circleGlow then
                TweenService:Create(ctx.circleGlow, LOD_FADE, { Transparency = 1 }):Play()
            end
            local t = TweenService:Create(ctx.circleScale, LOD_SHRINK, { Scale = 0.0 })
            t:Play()
            t.Completed:Once(function()
                if not ctx.isFar and ctx.circle then ctx.circle.Visible = false end
                ctx.transitioning = false
            end)
        end
    end

    --==========================================================================
    -- MASTER ANIMATION LOOP  (one connection drives every tag)
    --==========================================================================
    local renderConn
    local function startLoop()
        if renderConn then return end
        renderConn = RunService.RenderStepped:Connect(function(dt)
            local cam = workspace.CurrentCamera
            local camPos = cam and cam.CFrame.Position
            for _, ctx in pairs(TagManager.active) do
                if not ctx.adornee or not ctx.adornee.Parent then
                    -- El adornee se fue: muerte, respawn o STREAMING al alejarte.
                    -- Antes nos quedábamos con el tag APAGADO hasta el próximo
                    -- refresh del JSON (hasta 5 min) => por eso "tardaba en volver".
                    -- Ahora reintentamos enganchar la cabeza viva ~4 veces/seg, así
                    -- al regresar (o al re-streamear la cabeza) el tag reaparece YA.
                    ctx._reacquireAt = ctx._reacquireAt or 0
                    if os.clock() >= ctx._reacquireAt then
                        ctx._reacquireAt = os.clock() + 0.25
                        local char = ctx.player and ctx.player.Character
                        local head = char and char:FindFirstChild("Head")
                        if head then
                            ctx.adornee           = head
                            ctx.billboard.Adornee = head
                            ctx.billboard.Enabled = true
                        else
                            ctx.billboard.Enabled = false   -- aún sin cabeza: self-heal
                        end
                    end
                elseif ctx.billboard.Enabled then
                    ctx.elapsed += dt

                    -- LOD: lejos => círculo; cerca => pill (con histéresis para no parpadear).
                    if camPos and ctx.circle and ctx.container then
                        local dist = (camPos - ctx.adornee.Position).Magnitude
                        local far = ctx.isFar
                        if ctx.isFar and dist < (CONFIG.CIRCLE_DISTANCE - 8) then
                            far = false
                        elseif (not ctx.isFar) and dist > (CONFIG.CIRCLE_DISTANCE + 8) then
                            far = true
                        end
                        if far ~= ctx.isFar then
                            ctx.isFar = far
                            setLOD(ctx, far)
                        end
                    end

                    -- GLOW para todos: halo que late (independiente de la animación del rol).
                    -- Se pausa durante la transición de LOD para no pelear con el fade.
                    if CONFIG.GLOW_ALL and not ctx.transitioning and NXHeadTags._anim then
                        local g = 0.5 + 0.5 * math.sin(ctx.elapsed * 2.5)
                        if ctx.glow then
                            ctx.glow.Transparency = lerp(0.35, 0.78, g)
                            ctx.glow.Thickness    = lerp(3, 6.5, g)
                        end
                        if ctx.circleGlow then
                            ctx.circleGlow.Transparency = lerp(0.15, 0.6, g)
                            ctx.circleGlow.Thickness    = lerp(2.5, 5.5, g)
                        end
                    end

                    -- Animación premium por-rol (solo cuando se ve la pill, no el círculo).
                    if (not ctx.isFar) and ctx.anim and ctx.anim.update and NXHeadTags._anim then
                        pcall(ctx.anim.update, ctx, ctx.elapsed)
                    end
                end
            end
        end)
    end

    --==========================================================================
    -- DATABASE REFRESH LOOP  (download once, retry on failure, refresh on timer)
    --==========================================================================
    local function startRefreshLoop()
        task.spawn(function()
            while NXHeadTags._running do
                if not TagDatabase._loaded then
                    if TagDatabase:Load(false) then
                        TagManager:refreshAll()
                    end
                    task.wait(CONFIG.RETRY_INTERVAL)
                elseif CONFIG.REFRESH_INTERVAL > 0 then
                    task.wait(CONFIG.REFRESH_INTERVAL)
                    if NXHeadTags._running and TagDatabase:Load(true) then
                        TagManager:refreshAll()
                    end
                else
                    task.wait(5)
                end
            end
        end)
    end

    --==========================================================================
    -- PUBLIC API
    --==========================================================================
    function NXHeadTags.Start()
        if NXHeadTags._running then return end
        NXHeadTags._running = true

        -- Immediate load for snappiness (the refresh loop also retries/refreshes).
        task.spawn(function()
            if TagDatabase:Load(false) then
                TagManager:refreshAll()
            end
        end)

        for _, player in ipairs(Players:GetPlayers()) do
            hookPlayer(player)
        end
        NXHeadTags._playerAdded    = Players.PlayerAdded:Connect(hookPlayer)
        NXHeadTags._playerRemoving = Players.PlayerRemoving:Connect(unhookPlayer)

        startLoop()
        startRefreshLoop()
    end

    function NXHeadTags.Stop()
        NXHeadTags._running = false
        if NXHeadTags._playerAdded then NXHeadTags._playerAdded:Disconnect() end
        if NXHeadTags._playerRemoving then NXHeadTags._playerRemoving:Disconnect() end
        NXHeadTags._playerAdded, NXHeadTags._playerRemoving = nil, nil

        if renderConn then renderConn:Disconnect() renderConn = nil end

        for player in pairs(connections) do
            unhookPlayer(player)
        end
        TagManager:clearAll()
    end

    function NXHeadTags.Refresh()
        task.spawn(function()
            if TagDatabase:Load(true) then
                TagManager:refreshAll()
            end
        end)
    end

    function NXHeadTags.SetEnabled(on)
        if on then NXHeadTags.Start() else NXHeadTags.Stop() end
    end

    -- Activa/desactiva el TP al tocar un tag sin parar el resto del sistema.
    function NXHeadTags.SetTeleportEnabled(on)
        CONFIG.TP_ON_CLICK = on and true or false
    end

    -- Muestra/oculta SOLO el tag de TU propio personaje, sin tocar a los demás
    -- (los tags del resto siguen igual). Lo usa el botón de la barra superior.
    function NXHeadTags.SetShowOwnTag(on)
        CONFIG.SHOW_OWN_TAG = on and true or false
        pcall(function() TagManager:apply(LocalPlayer) end)
    end

    -- Activa/desactiva el glow + shimmer de los tags (lo usa el toggle de
    -- Animaciones del Analyzer). El LOD (pill<->círculo) sigue funcionando.
    function NXHeadTags.SetAnimationsEnabled(on)
        NXHeadTags._anim = on and true or false
    end

    -- Add/override a tag locally without editing GitHub (great for testing).
    function NXHeadTags.SetLocalOverride(userId, data)
        TagDatabase._resolved[tostring(userId)] = TagDatabase:_resolveEntry(data or {})
        local p = Players:GetPlayerByUserId(tonumber(userId))
        if p then
            TagManager:apply(p)
        end
    end

    --==========================================================================
    -- GO
    --==========================================================================
    _G.NXHeadTags = NXHeadTags
    NXHeadTags.Start()
end


-- Aplica la preferencia guardada del toggle (Fase 1). Seguro aunque el
-- módulo no exista: si _G.NXHeadTags es nil, no hace nada.
if _G.NXHeadTags and not store.headTags then
	_G.NXHeadTags.SetEnabled(false)
end

-- Aplica la preferencia guardada de "mi tag" (botón de la barra superior): si lo
-- dejaste oculto, se quita SOLO tu propio tag al cargar (sin afectar a los demás).
if _G.NXHeadTags and _G.NXHeadTags.SetShowOwnTag and store.ownTag == false then
	_G.NXHeadTags.SetShowOwnTag(false)
end

-- Aplica la preferencia guardada de Animaciones: si las dejaste apagadas,
-- también se calma el glow/shimmer de los head tags al cargar.
if _G.NXHeadTags and _G.NXHeadTags.SetAnimationsEnabled and store.animations == false then
	_G.NXHeadTags.SetAnimationsEnabled(false)
end

-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║   PRISM LOOK · capa visual premium (glass + borde neón + ripple)     ║
-- ╠══════════════════════════════════════════════════════════════════════╣
-- ║  Capa ADITIVA. No toca tu arquitectura: reusa tus hooks de tema       ║
-- ║  (themed/onRepaint/C => todo sale de C.accent y cambia EN VIVO con    ║
-- ║  el tema), tu motionTween (respeta el toggle de Animaciones de        ║
-- ║  Ajustes) y track() para autolimpiarse al cerrar. Va en una IIFE:     ║
-- ║  no añade NI UNA variable a tu scope de archivo (registros aislados).  ║
-- ║  Apaga lo que no quieras en la tabla PRISM de abajo.                  ║
-- ╚══════════════════════════════════════════════════════════════════════╝
-- (IIFE: scope de registros propio, no suma locales a tu chunk principal)
;(function()
	local RunService = game:GetService("RunService")
	local Lighting   = game:GetService("Lighting")

	-- ▼▼▼ AJUSTA AQUÍ (true/false para encender/apagar cada efecto) ▼▼▼
	local PRISM = {
		neonBorder   = true,   -- borde con gradiente neón que gira lento
		titleShimmer = true,   -- brillo que recorre el título
		headerLine   = true,   -- línea de acento bajo la cabecera
		glassBlur    = false,  -- desenfoque del fondo 3D (APAGADO a pedido)
		popOpen      = true,   -- animación de apertura (escala + rebote)
		ripple       = true,   -- onda al pulsar botones
		blurSize     = 12,     -- intensidad del cristal (0–24)
		spinSpeed    = 18,     -- (v3.8.3) borde neón más calmado (antes 24 g/seg)
		strokeAlpha  = 0.55,   -- (v3.8.3) borde MÁS transparente = menos saturado (antes 0.30)
		strokeWidth  = 1.4,    -- (v3.8.3) borde un pelín más fino (antes 1.6)
	}
	-- ▲▲▲ ───────────────────────────────────────────────────────── ▲▲▲

	-- Mezclas de color: el neón se DERIVA de C.accent (respeta el tema).
	local function lerp(a, b, t) return a + (b - a) * t end
	local function lighten(c, f) return Color3.new(lerp(c.R,1,f), lerp(c.G,1,f), lerp(c.B,1,f)) end
	local function darken(c, f)  return Color3.new(lerp(c.R,0,f), lerp(c.G,0,f), lerp(c.B,0,f)) end

	local function neonSeq()
		local a = C.accent
		return ColorSequence.new({
			ColorSequenceKeypoint.new(0.0, darken(a, 0.12)),
			ColorSequenceKeypoint.new(0.5, lighten(a, 0.55)),
			ColorSequenceKeypoint.new(1.0, darken(a, 0.12)),
		})
	end
	local function titleSeq()
		local a = C.accent
		return ColorSequence.new({
			ColorSequenceKeypoint.new(0.0, lighten(a, 0.05)),
			ColorSequenceKeypoint.new(0.5, lighten(a, 0.85)),
			ColorSequenceKeypoint.new(1.0, lighten(a, 0.05)),
		})
	end

	-- 1) BORDE NEÓN ANIMADO (sobre el UIStroke de la ventana 'main')
	local neonGrad
	if PRISM.neonBorder then
		pcall(function()
			local winStroke = main:FindFirstChildOfClass("UIStroke")
			if winStroke then
				winStroke.Transparency = PRISM.strokeAlpha
				winStroke.Thickness    = PRISM.strokeWidth
				neonGrad = Instance.new("UIGradient", winStroke)
				neonGrad.Color = neonSeq()
			end
		end)
	end

	-- 2) SHIMMER EN EL TÍTULO
	local titleGrad
	if PRISM.titleShimmer then
		pcall(function()
			titleGrad = Instance.new("UIGradient", title)
			titleGrad.Color = titleSeq()
		end)
	end

	-- 3) LÍNEA DE ACENTO BAJO LA CABECERA (se atenúa en los bordes)
	if PRISM.headerLine then
		pcall(function()
			local line = Instance.new("Frame", header)
			line.Size = UDim2.new(1, 0, 0, 1)
			line.Position = UDim2.new(0, 0, 1, -1)
			line.BorderSizePixel = 0
			line.BackgroundColor3 = C.accent
			line.BackgroundTransparency = 0.5
			line.ZIndex = 2
			themed(line, "BackgroundColor3", "accent")
			local g = Instance.new("UIGradient", line)
			g.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.5, 0),
				NumberSequenceKeypoint.new(1, 1),
			})
		end)
	end

	-- 4) EFECTO CRISTAL: desenfoque del fondo 3D al abrir el panel.
	-- Quita cualquier blur previo para que al recargar el script no se acumulen.
	for _, v in ipairs(Lighting:GetChildren()) do
		if v.Name == "PrismGlass" then v:Destroy() end
	end
	local blur
	if PRISM.glassBlur then
		blur = Instance.new("BlurEffect")
		blur.Name = "PrismGlass"
		blur.Size = 0
		blur.Parent = Lighting
		track(gui.Destroying:Connect(function()
			if blur then blur:Destroy() end
		end))
	end

	-- 5) APERTURA con POP (UIScale sobre 'main': es visual, NO afecta drag/resize)
	local mainScale
	if PRISM.popOpen then
		mainScale = Instance.new("UIScale", main)
		mainScale.Scale = 1
	end

	local OPEN_INFO  = TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local FADE_INFO  = TweenInfo.new(0.30, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local CLOSE_INFO = TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

	local function playOpen()
		if mainScale then
			mainScale.Scale = 0.9
			motionTween(mainScale, OPEN_INFO, { Scale = 1 })
		end
		if blur then motionTween(blur, FADE_INFO, { Size = PRISM.blurSize }) end
	end
	local function playClose()
		if blur then motionTween(blur, CLOSE_INFO, { Size = 0 }) end
	end

	-- Tu setHidden ya alterna gui.Enabled (botón "–" y tecla RightShift):
	-- escuchamos ese cambio para disparar pop+blur sin tocar tu función.
	track(gui:GetPropertyChangedSignal("Enabled"):Connect(function()
		if gui.Enabled then playOpen() else playClose() end
	end))
	if gui.Enabled then task.defer(playOpen) end   -- también al cargar el script

	-- 6) RIPPLE (onda al pulsar) en los botones, presente y futuros.
	local Mouse = player:GetMouse()
	local function attachRipple(btn)
		local sx = btn.Size.X
		if sx.Scale <= 0 and sx.Offset < 50 then return end   -- salta los semáforos/iconos
		if btn:GetAttribute("PrismRipple") then return end
		btn:SetAttribute("PrismRipple", true)
		btn.ClipsDescendants = true
		track(btn.MouseButton1Down:Connect(function()
			if not ANIM.enabled then return end
			local circle = Instance.new("Frame")
			circle.AnchorPoint = Vector2.new(0.5, 0.5)
			circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			circle.BackgroundTransparency = 0.78
			circle.BorderSizePixel = 0
			circle.Position = UDim2.fromOffset(Mouse.X - btn.AbsolutePosition.X,
				Mouse.Y - btn.AbsolutePosition.Y)
			circle.Size = UDim2.fromOffset(0, 0)
			circle.ZIndex = btn.ZIndex + 5
			Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)
			circle.Parent = btn
			local d = math.max(btn.AbsoluteSize.X, btn.AbsoluteSize.Y) * 2
			motionTween(circle,
				TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ Size = UDim2.fromOffset(d, d), BackgroundTransparency = 1 })
			task.delay(0.5, function() if circle then circle:Destroy() end end)
		end))
	end
	if PRISM.ripple then
		for _, d in ipairs(main:GetDescendants()) do
			if d:IsA("TextButton") then pcall(attachRipple, d) end
		end
		track(main.DescendantAdded:Connect(function(d)
			if d:IsA("TextButton") then task.defer(function() pcall(attachRipple, d) end) end
		end))
	end

	-- 7) LATIDO: gira el borde neón y mueve el shimmer. Respeta animaciones
	-- (se calma si las apagas) y solo trabaja cuando el panel está visible.
	local shim = 0
	track(RunService.Heartbeat:Connect(function(dt)
		if not gui.Enabled or not ANIM.enabled then return end
		if neonGrad then neonGrad.Rotation = (neonGrad.Rotation + dt * PRISM.spinSpeed) % 360 end
		if titleGrad then
			shim = (shim + dt * 0.25) % 2
			titleGrad.Offset = Vector2.new(shim - 1, 0)
		end
	end))

	-- 8) Mantener neón/shimmer sincronizados con el TEMA EN VIVO.
	onRepaint(function()
		if neonGrad  then pcall(function() neonGrad.Color  = neonSeq()  end) end
		if titleGrad then pcall(function() titleGrad.Color = titleSeq() end) end
	end)
end)()

-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║   PRISM HUD + NX  ·  barra superior · logo NX · TP-al-tocar-el-tag   ║
-- ╠══════════════════════════════════════════════════════════════════════╣
-- ║  · Barra HUD arriba (score · ms · fps) que se ADAPTA al tema (C).     ║
-- ║  · Logo NX en la cabecera del panel (tu marca siempre presente).      ║
-- ║  · Círculo del tag re-estilizado a "badge sólido" como tu imagen.     ║
-- ║  · TP robusto al tocar el tag: proyecta cada jugador-con-tag a la     ║
-- ║    pantalla y TP al más cercano al cursor (basta click cerca de él).  ║
-- ║  IIFE: registros aislados. Usa themed/track/C => cambia con el tema.   ║
-- ╚══════════════════════════════════════════════════════════════════════╝
;(function()
	local RunService = game:GetService("RunService")
	local UIS        = game:GetService("UserInputService")
	local Players    = game:GetService("Players")

	-- ── 0) TOOLTIP minimalista: etiqueta flotante al pasar el cursor sobre
	-- los iconos del HUD (resuelve el "no se sabe qué hace cada icono"). Una
	-- sola etiqueta reutilizada; se autolimpia con track() al cerrar la GUI.
	local tip
	local function attachTip(obj, text)
		track(obj.MouseEnter:Connect(function()
			if not tip then
				tip = Instance.new("TextLabel")
				tip.Name = "PrismTip"
				tip.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
				tip.BackgroundTransparency = 0.05
				tip.TextColor3 = Color3.fromRGB(240, 240, 240)
				tip.Font = Enum.Font.GothamMedium
				tip.TextSize = 12
				tip.AutomaticSize = Enum.AutomaticSize.XY
				tip.ZIndex = 60
				tip.Parent = gui
				local tcz = Instance.new("UICorner", tip); tcz.CornerRadius = UDim.new(0, 6)
				local tpz = Instance.new("UIPadding", tip)
				tpz.PaddingLeft = UDim.new(0, 8); tpz.PaddingRight = UDim.new(0, 8)
				tpz.PaddingTop = UDim.new(0, 3); tpz.PaddingBottom = UDim.new(0, 3)
				local tsz = Instance.new("UIStroke", tip); tsz.Color = C.accent; tsz.Transparency = 0.3
				themed(tsz, "Color", "accent")
			end
			tip.Text = text
			tip.Visible = true
			tip.AnchorPoint = Vector2.new(0.5, 0)              -- centrado bajo el icono
			local ap = obj.AbsolutePosition
			local cam = workspace.CurrentCamera
			local vpX = (cam and cam.ViewportSize.X) or 1280
			local cx = math.clamp(ap.X + obj.AbsoluteSize.X / 2, 70, vpX - 70)   -- no se sale por los lados
			-- SIEMPRE debajo del icono (si saliera arriba, se cortaría y no se vería)
			tip.Position = UDim2.fromOffset(cx, ap.Y + obj.AbsoluteSize.Y + 6)
		end))
		track(obj.MouseLeave:Connect(function()
			if tip then tip.Visible = false end
		end))
	end

	-- ── 1) LOGO NX de la esquina: RETIRADO (v3.8.1) ─────────────────────────
	-- El usuario pidió quitar el logo de la esquina y reaprovechar el espacio.
	-- Sin el badge, los controles de ventana pasan a la esquina derecha del
	-- todo (ver abajo) y el título recupera el ancho que ocupaba el logo.

	-- ── 1.5) CONTROLES DE VENTANA (minimizar / expandir / cerrar) ───────────
	-- En la ESQUINA DERECHA del header (antes iban a la izquierda del logo NX,
	-- que ya no existe). Iconos DIBUJADOS con Frames (no glifos) para que
	-- NUNCA salga el cuadrito "tofu"; la X de cerrar es letra (siempre renderiza).
	-- Mismo estilo que el panel de buscar nombres. TextButton → consumen el clic
	-- y no arrancan el arrastre de la ventana.
	pcall(function()
		local WHITE = Color3.fromRGB(255, 255, 255)
		local function lighten(c, amt)
			return Color3.new(c.R + (1 - c.R) * amt, c.G + (1 - c.G) * amt, c.B + (1 - c.B) * amt)
		end

		local ctrls = Instance.new("Frame")
		ctrls.Name = "NXWindowControls"
		ctrls.AnchorPoint = Vector2.new(1, 0.5)
		ctrls.Position = UDim2.new(1, -10, 0.5, 0)         -- esquina derecha del header
		ctrls.Size = UDim2.fromOffset(24 * 3 + 6 * 2, 24)  -- 3 botones de 24 + 2 gaps de 6
		ctrls.BackgroundTransparency = 1
		ctrls.ZIndex = 4
		ctrls.Parent = header
		local lay = Instance.new("UIListLayout", ctrls)
		lay.FillDirection = Enum.FillDirection.Horizontal
		lay.HorizontalAlignment = Enum.HorizontalAlignment.Right
		lay.VerticalAlignment = Enum.VerticalAlignment.Center
		lay.Padding = UDim.new(0, 6)
		lay.SortOrder = Enum.SortOrder.LayoutOrder

		local function ctrlButton(order, baseRole, tipText, onClick)
			local b = Instance.new("TextButton")
			b.Name = "Ctrl" .. order
			b.LayoutOrder = order
			b.Size = UDim2.fromOffset(24, 24)
			b.AutoButtonColor = false
			b.Text = ""
			b.BorderSizePixel = 0
			b.Active = true
			b.ZIndex = 5
			b.BackgroundColor3 = C[baseRole]
			b.Parent = ctrls
			Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
			themed(b, "BackgroundColor3", baseRole)
			local st = Instance.new("UIStroke", b)
			st.Thickness = 1; st.Transparency = 0.35
			themed(st, "Color", "border")
			-- Hover: el botón se aclara un poco (suave).
			track(b.MouseEnter:Connect(function()
				motionTween(b, TweenInfo.new(0.12), { BackgroundColor3 = lighten(C[baseRole], 0.12) })
			end))
			track(b.MouseLeave:Connect(function()
				motionTween(b, TweenInfo.new(0.16), { BackgroundColor3 = C[baseRole] })
			end))
			track(b.MouseButton1Click:Connect(onClick))
			attachTip(b, tipText)
			return b
		end

		-- (1) Minimizar: barra horizontal dibujada.
		local minBtn = ctrlButton(1, "neutral", "Minimizar", function() NXWin.toggleCollapse() end)
		do
			local bar = Instance.new("Frame", minBtn)
			bar.AnchorPoint = Vector2.new(0.5, 0.5)
			bar.Position = UDim2.new(0.5, 0, 0.5, 0)
			bar.Size = UDim2.new(0, 11, 0, 2)
			bar.BorderSizePixel = 0
			bar.ZIndex = 6
			Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
			themed(bar, "BackgroundColor3", "text")
		end

		-- (2) Expandir / restaurar: cuadro hueco dibujado (con UIStroke).
		local maxBtn = ctrlButton(2, "neutral", "Expandir / Restaurar", function() NXWin.toggleMaximize() end)
		do
			local box = Instance.new("Frame", maxBtn)
			box.AnchorPoint = Vector2.new(0.5, 0.5)
			box.Position = UDim2.new(0.5, 0, 0.5, 0)
			box.Size = UDim2.new(0, 12, 0, 11)
			box.BackgroundTransparency = 1
			box.BorderSizePixel = 0
			box.ZIndex = 6
			Instance.new("UICorner", box).CornerRadius = UDim.new(0, 2)
			local bst = Instance.new("UIStroke", box)
			bst.Thickness = 1.6
			themed(bst, "Color", "text")
		end

		-- (3) Cerrar: la X es una letra (siempre renderiza), blanca sobre rojo.
		local closeBtn = ctrlButton(3, "bad", "Cerrar", function() NXWin.animatedClose() end)
		do
			local x = Instance.new("TextLabel", closeBtn)
			x.Size = UDim2.new(1, 0, 1, 0)
			x.BackgroundTransparency = 1
			x.Font = Enum.Font.GothamBold
			x.TextSize = 14
			x.Text = "X"
			x.TextColor3 = WHITE
			x.ZIndex = 6
		end
	end)

	-- ╔════════════════════════════════════════════════════════════════════╗
	-- ║   NX SHIELDS · escudo del header + panel estilo extensión         ║
	-- ╠════════════════════════════════════════════════════════════════════╣
	-- ║  El icono vive a la izquierda de los controles de ventana, como la  ║
	-- ║  barra de extensiones de Chrome/Brave. Su punto de estado NO es      ║
	-- ║  decorativo: sale de Shield.estado(), que deriva del resultado real  ║
	-- ║  de las validaciones del último análisis y de qué protecciones       ║
	-- ║  están encendidas. Al pulsarlo se abre el panel con los switches.    ║
	-- ╚════════════════════════════════════════════════════════════════════╝
	pcall(function()
		-- Solo TEXTOS aquí: los colores NO se guardan en esta tabla porque se
		-- congelarían con el tema activo al construirla. Se releen de C (tabla
		-- viva) en cada llamada, así el escudo sigue el tema al cambiarlo.
		local TEXTOS = { ok = "Protegido", partial = "Parcial", error = "Error", loading = "Verificando…" }
		local function paleta()
			local e = Shield.estado()
			local mapa = { ok = C.good, partial = C.warn, error = C.bad, loading = C.accent }
			return mapa[e] or C.good, TEXTOS[e] or TEXTOS.ok, e
		end

		-- ── Botón escudo (glass + neón, forma de escudo dibujada) ──────────
		local sBtn = Instance.new("TextButton")
		sBtn.Name = "NXShieldButton"
		sBtn.AnchorPoint = Vector2.new(1, 0.5)
		sBtn.Position = UDim2.new(1, -100, 0.5, 0)       -- a la izquierda de los 3 controles
		sBtn.Size = UDim2.fromOffset(26, 24)
		sBtn.AutoButtonColor = false
		sBtn.Text = ""
		sBtn.BorderSizePixel = 0
		sBtn.BackgroundColor3 = C.neutral
		sBtn.BackgroundTransparency = 0.15
		sBtn.ZIndex = 5
		sBtn.Parent = header
		themed(sBtn, "BackgroundColor3", "neutral")
		Instance.new("UICorner", sBtn).CornerRadius = UDim.new(0, 7)
		local sStroke = Instance.new("UIStroke", sBtn)
		sStroke.Thickness = 1.3
		sStroke.Transparency = 0.25

		-- Escudo DIBUJADO con Frames (no emoji ni asset: nunca sale el cuadrito
		-- "tofu" ni depende de que Roblox modere una imagen). Cuerpo rectangular
		-- + punta inferior en diamante rotado, con "NX" encima.
		local sTop = Instance.new("Frame", sBtn)
		sTop.AnchorPoint = Vector2.new(0.5, 0)
		sTop.Position = UDim2.new(0.5, 0, 0.5, -8)
		sTop.Size = UDim2.fromOffset(14, 9)
		sTop.BorderSizePixel = 0
		sTop.BackgroundColor3 = C.good
		sTop.ZIndex = 6
		local stc = Instance.new("UICorner", sTop); stc.CornerRadius = UDim.new(0, 3)
		local sBot = Instance.new("Frame", sBtn)
		sBot.AnchorPoint = Vector2.new(0.5, 0)
		sBot.Position = UDim2.new(0.5, 0, 0.5, -2)
		sBot.Size = UDim2.fromOffset(10, 10)
		sBot.Rotation = 45
		sBot.BorderSizePixel = 0
		sBot.BackgroundColor3 = C.good
		sBot.ZIndex = 6
		local sbc = Instance.new("UICorner", sBot); sbc.CornerRadius = UDim.new(0, 3)
		-- "NX" encima del escudo (letras: siempre renderizan).
		local sTxt = Instance.new("TextLabel", sBtn)
		sTxt.BackgroundTransparency = 1
		sTxt.AnchorPoint = Vector2.new(0.5, 0.5)
		sTxt.Position = UDim2.new(0.5, 0, 0.5, -1)
		sTxt.Size = UDim2.fromOffset(24, 12)
		sTxt.Font = Enum.Font.GothamBold
		sTxt.Text = "NX"
		sTxt.TextSize = 9
		sTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
		sTxt.ZIndex = 8

		-- Punto de estado (arriba-derecha del icono), como el badge de una extensión.
		local sDot = Instance.new("Frame", sBtn)
		sDot.AnchorPoint = Vector2.new(1, 0)
		sDot.Position = UDim2.new(1, 1, 0, -1)
		sDot.Size = UDim2.fromOffset(8, 8)
		sDot.BorderSizePixel = 0
		sDot.BackgroundColor3 = C.good
		sDot.ZIndex = 9
		Instance.new("UICorner", sDot).CornerRadius = UDim.new(1, 0)
		local sDotStroke = Instance.new("UIStroke", sDot)
		sDotStroke.Thickness = 1.2
		sDotStroke.Color = Color3.fromRGB(15, 15, 18)

		-- ── Panel desplegable (dentro de 'main' para que no lo recorte nada) ──
		local panel = Instance.new("Frame")
		panel.Name = "NXShieldPanel"
		panel.AnchorPoint = Vector2.new(1, 0)
		panel.Position = UDim2.new(1, -12, 0, 38)
		panel.Size = UDim2.fromOffset(268, 0)
		panel.AutomaticSize = Enum.AutomaticSize.Y
		panel.BackgroundColor3 = C.card
		panel.BackgroundTransparency = 0.04
		panel.BorderSizePixel = 0
		panel.Visible = false
		panel.ZIndex = 120
		panel.Parent = main
		themed(panel, "BackgroundColor3", "card")
		Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 12)
		local pStroke = Instance.new("UIStroke", panel)
		pStroke.Thickness = 1.4
		pStroke.Transparency = 0.35
		themed(pStroke, "Color", "accent")
		local pScale = Instance.new("UIScale", panel)
		local pPad = Instance.new("UIPadding", panel)
		pPad.PaddingTop = UDim.new(0, 10); pPad.PaddingBottom = UDim.new(0, 10)
		pPad.PaddingLeft = UDim.new(0, 12); pPad.PaddingRight = UDim.new(0, 12)
		local pLay = Instance.new("UIListLayout", panel)
		pLay.Padding = UDim.new(0, 8); pLay.SortOrder = Enum.SortOrder.LayoutOrder

		local function etiqueta(orden, texto, size, role, bold, alto)
			local l = Instance.new("TextLabel", panel)
			l.LayoutOrder = orden
			l.Size = UDim2.new(1, 0, 0, alto or 16)
			l.BackgroundTransparency = 1
			l.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
			l.TextSize = size
			l.TextColor3 = C[role]
			l.TextXAlignment = Enum.TextXAlignment.Left
			l.TextWrapped = (alto ~= nil)
			l.TextYAlignment = Enum.TextYAlignment.Top
			l.Text = texto
			l.ZIndex = 121
			themed(l, "TextColor3", role)
			return l
		end

		-- Cabecera del panel: punto + título + estado en texto
		local cab = Instance.new("Frame", panel)
		cab.LayoutOrder = 0; cab.Size = UDim2.new(1, 0, 0, 22); cab.BackgroundTransparency = 1
		cab.ZIndex = 121
		local cabDot = Instance.new("Frame", cab)
		cabDot.AnchorPoint = Vector2.new(0, 0.5)
		cabDot.Position = UDim2.new(0, 0, 0.5, 0)
		cabDot.Size = UDim2.fromOffset(9, 9)
		cabDot.BorderSizePixel = 0
		cabDot.BackgroundColor3 = C.good
		cabDot.ZIndex = 122
		Instance.new("UICorner", cabDot).CornerRadius = UDim.new(1, 0)
		local cabTit = Instance.new("TextLabel", cab)
		cabTit.Position = UDim2.new(0, 16, 0, 0)
		cabTit.Size = UDim2.new(1, -16, 1, 0)
		cabTit.BackgroundTransparency = 1
		cabTit.Font = Enum.Font.GothamBold
		cabTit.TextSize = 14
		cabTit.TextColor3 = C.text
		cabTit.Text = "NX Shields"
		cabTit.TextXAlignment = Enum.TextXAlignment.Left
		cabTit.ZIndex = 122
		themed(cabTit, "TextColor3", "text")
		local cabEstado = Instance.new("TextLabel", cab)
		cabEstado.AnchorPoint = Vector2.new(1, 0.5)
		cabEstado.Position = UDim2.new(1, 0, 0.5, 0)
		cabEstado.Size = UDim2.new(0, 110, 1, 0)
		cabEstado.BackgroundTransparency = 1
		cabEstado.Font = Enum.Font.GothamBold
		cabEstado.TextSize = 11
		cabEstado.TextXAlignment = Enum.TextXAlignment.Right
		cabEstado.ZIndex = 122

		local function linea(orden)
			local d = Instance.new("Frame", panel)
			d.LayoutOrder = orden
			d.Size = UDim2.new(1, 0, 0, 1)
			d.BackgroundColor3 = C.border
			d.BackgroundTransparency = 0.4
			d.BorderSizePixel = 0
			d.ZIndex = 121
			themed(d, "BackgroundColor3", "border")
		end
		linea(1)

		--  Usuario Roblox — datos REALES de la sesión, pasados por los validadores.
		etiqueta(2, "Usuario Roblox", 12, "subtext", true)
		local usrOk   = Shield.valid.username(player.Name) ~= nil
		local idOk    = Shield.valid.userId(player.UserId) ~= nil
		local usrLbl  = etiqueta(3, "", 12, "text", true)
		usrLbl.Text   = (usrOk and "✓ " or "✕ ") .. player.Name .. "  ·  " .. tostring(player.UserId)
		usrLbl.TextColor3 = (usrOk and idOk) and C.good or C.bad
		local execLbl = etiqueta(4, "Executor: " .. EXECUTOR_NAME, 10, "subtext")

		linea(5)
		etiqueta(6, "Verificaciones", 12, "subtext", true)

		-- Fila de protección con switch real
		local filas = {}
		local function filaProt(orden, nombre, clave, desc)
			local f = Instance.new("Frame", panel)
			f.LayoutOrder = orden
			f.Size = UDim2.new(1, 0, 0, 44)
			f.BackgroundTransparency = 1
			f.ZIndex = 121

			local nom = Instance.new("TextLabel", f)
			nom.Size = UDim2.new(1, -56, 0, 18)
			nom.BackgroundTransparency = 1
			nom.Font = Enum.Font.GothamBold
			nom.TextSize = 12
			nom.TextColor3 = C.text
			nom.Text = nombre
			nom.TextXAlignment = Enum.TextXAlignment.Left
			nom.TextTruncate = Enum.TextTruncate.AtEnd
			nom.ZIndex = 122
			themed(nom, "TextColor3", "text")

			local est = Instance.new("TextLabel", f)
			est.Position = UDim2.new(0, 0, 0, 18)
			est.Size = UDim2.new(1, -56, 0, 24)
			est.BackgroundTransparency = 1
			est.Font = Enum.Font.Gotham
			est.TextSize = 10
			est.Text = desc
			est.TextColor3 = C.subtext
			est.TextXAlignment = Enum.TextXAlignment.Left
			est.TextWrapped = true
			est.TextYAlignment = Enum.TextYAlignment.Top
			est.ZIndex = 122

			-- Forward-declare: el callback usa setBusy, y en `local a,b,c = expr`
			-- las variables aún NO existen dentro de expr (sería un global nil).
			local sw, setOn, setBusy
			sw, setOn, setBusy = Shield.makeSwitch(f, Shield.flags[clave], function(on)
				setBusy(true)
				est.Text = "Ejecutando verificación…"
				est.TextColor3 = C.warn
				Shield.setFlag(clave, on, function(ok, detalle)
					setBusy(false)
					if not on then
						est.Text = (clave == "api") and "Verificación API desactivada"
							or "Validación de datos desactivada"
						est.TextColor3 = C.subtext
					elseif ok then
						est.Text = (clave == "api") and ("API verificada correctamente · " .. tostring(detalle))
							or ("Datos validados · " .. tostring(detalle))
						est.TextColor3 = C.good
					else
						est.Text = "Falló: " .. tostring(detalle)
						est.TextColor3 = C.bad
					end
				end)
			end)
			sw.AnchorPoint = Vector2.new(1, 0)
			sw.Position = UDim2.new(1, 0, 0, 4)
			sw.ZIndex = 122

			filas[clave] = { est = est, setOn = setOn, setBusy = setBusy, desc = desc }
		end

		filaProt(7, "API Validation",  "api",
			"Comprueba estructura, errores y códigos HTTP de cada respuesta.")
		filaProt(8, "Data Validation", "data",
			"Valida username, UserId, fechas, contadores, avatar e items.")

		linea(9)
		-- Pie con contadores REALES del interceptor + estado del último análisis.
		local pie = etiqueta(10, "", 10, "subtext", false, 44)

		-- ── Sincronización de todo el estado visible ────────────────────────
		local function refrescar()
			local color, texto, est = paleta()
			sDot.BackgroundColor3   = color
			sTop.BackgroundColor3   = color
			sBot.BackgroundColor3   = color
			sStroke.Color           = color
			cabDot.BackgroundColor3 = color
			cabEstado.TextColor3    = color
			cabEstado.Text          = texto

			for clave, f in pairs(filas) do
				local on = Shield.flags[clave]
				f.setOn(on, false)
				f.setBusy(Shield.busy == clave)
				if Shield.busy ~= clave then
					if not on then
						f.est.Text = (clave == "api") and "Verificación API desactivada"
							or "Validación de datos desactivada"
						f.est.TextColor3 = C.subtext
					else
						local t = Shield.lastTest and Shield.lastTest[clave]
						if t and not t.ok then
							f.est.Text = "Falló: " .. tostring(t.detalle)
							f.est.TextColor3 = C.bad
						elseif t and t.ok then
							f.est.Text = (clave == "api")
								and ("API verificada correctamente · " .. tostring(t.detalle))
								or  ("Datos validados · " .. tostring(t.detalle))
							f.est.TextColor3 = C.good
						else
							f.est.Text = f.desc
							f.est.TextColor3 = C.subtext
						end
					end
				end
			end

			local r = Shield.run
			local ESTADOS = {
				verified = "Verificado", partial = "Parcial",
				incomplete = "Datos incompletos", error = "Error", loading = "Cargando…",
			}
			local ultimo = r and (ESTADOS[r.state] or r.state) or "sin análisis aún"
			pie.Text = string.format(
				"Respuestas inspeccionadas: %d  ·  bloqueadas: %d\nCampos validados: %d  ·  rechazados: %d\nÚltimo análisis: %s",
				Shield.stats.checks, Shield.stats.blocked,
				Shield.stats.fields, Shield.stats.rejected, ultimo)
			-- El icono NO late si no hay nada ejecutándose: la animación indica
			-- proceso real, no adorno.
			sTxt.TextTransparency = (est == "loading") and 0.35 or 0
		end
		refrescar()
		Shield.onChange(refrescar)
		onRepaint(refrescar)

		-- ── Abrir / cerrar el panel (animado) ───────────────────────────────
		local abierto = false
		local function setAbierto(v)
			abierto = v
			if v then
				refrescar()
				panel.Visible = true
				if ANIM.enabled then
					pScale.Scale = 0.92
					panel.BackgroundTransparency = 1
					motionTween(pScale, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
					motionTween(panel, TweenInfo.new(0.16), { BackgroundTransparency = 0.04 })
				else
					pScale.Scale = 1
					panel.BackgroundTransparency = 0.04
				end
			else
				if ANIM.enabled then
					motionTween(pScale, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.92 })
					motionTween(panel, TweenInfo.new(0.14), { BackgroundTransparency = 1 }, function()
						if not abierto then panel.Visible = false end
					end)
				else
					panel.Visible = false
				end
			end
		end

		track(sBtn.MouseButton1Click:Connect(function() setAbierto(not abierto) end))
		track(sBtn.MouseEnter:Connect(function()
			motionTween(sBtn, TweenInfo.new(0.12), { BackgroundTransparency = 0 })
		end))
		track(sBtn.MouseLeave:Connect(function()
			motionTween(sBtn, TweenInfo.new(0.16), { BackgroundTransparency = 0.15 })
		end))
		attachTip(sBtn, "NX Shields · estado de verificación")

		-- Cerrar al pulsar fuera del panel (como el popup de una extensión).
		-- NO se filtra por gameProcessedEvent: al pulsar sobre CUALQUIER GUI ese
		-- flag llega en true, así que filtrar por él impedía cerrar el panel al
		-- hacer clic en otra parte de la interfaz. El test real es geométrico.
		track(UserInputService.InputBegan:Connect(function(input)
			if not abierto then return end
			if input.UserInputType ~= Enum.UserInputType.MouseButton1
				and input.UserInputType ~= Enum.UserInputType.Touch then return end
			local p = input.Position
			local function dentro(obj)
				local a, b = obj.AbsolutePosition, obj.AbsoluteSize
				return p.X >= a.X and p.X <= a.X + b.X and p.Y >= a.Y and p.Y <= a.Y + b.Y
			end
			if not dentro(panel) and not dentro(sBtn) then setAbierto(false) end
		end))
	end)

	-- ── 2) BARRA HUD arriba-DERECHA (jugadores · ms · fps + Discord) ─────
	-- Iconos con emoji (tu script ya usa emojis => renderizan). Para iconos
	-- monocromos EXACTOS como la imagen, pásame los rbxassetid y los cambio.
	local DISCORD_INVITE  = "https://discord.gg/JgsW2M6322"   -- (se copia al click + intenta abrir)
	local DISCORD_LOGO_ID = ""   -- pega aquí TU logo Discord (rbxassetid). "" = usa el icono 
	local pingLabel, fpsLabel, playersLabel
	pcall(function()
		local hud = Instance.new("Frame")
		hud.Name = "PrismHUD"
		hud.AnchorPoint = Vector2.new(1, 0)
		hud.Position = UDim2.new(1, -12, 0, 10)            -- esquina superior DERECHA
		hud.Size = UDim2.fromOffset(60, 40)
		hud.AutomaticSize = Enum.AutomaticSize.X
		hud.BackgroundColor3 = C.bg                          -- fondo SINCRONIZADO con el tema (cambia al cambiar la UI)
		themed(hud, "BackgroundColor3", "bg")
		hud.BackgroundTransparency = 0.1
		hud.BorderSizePixel = 0
		hud.Parent = gui
		local hc = Instance.new("UICorner", hud); hc.CornerRadius = UDim.new(0, 20)
		local hs = Instance.new("UIStroke", hud); hs.Thickness = 1.6; hs.Color = C.accent; hs.Transparency = 0.1  -- borde vívido (igual de intenso que el panel)
		themed(hs, "Color", "accent")

		local lay = Instance.new("UIListLayout", hud)
		lay.FillDirection = Enum.FillDirection.Horizontal
		lay.VerticalAlignment = Enum.VerticalAlignment.Center
		lay.Padding = UDim.new(0, 9)
		lay.SortOrder = Enum.SortOrder.LayoutOrder
		local hp = Instance.new("UIPadding", hud)
		hp.PaddingLeft = UDim.new(0, 13); hp.PaddingRight = UDim.new(0, 13)
		hp.PaddingTop = UDim.new(0, 5); hp.PaddingBottom = UDim.new(0, 5)

		local order = 0
		-- celda = icono (emoji O dibujo vectorial vía drawFn) + valor
		local function cell(emoji, text, valueColor, drawFn)
			order += 1
			local holder = Instance.new("Frame", hud)
			holder.BackgroundTransparency = 1
			holder.AutomaticSize = Enum.AutomaticSize.X
			holder.Size = UDim2.fromOffset(0, 24)
			holder.LayoutOrder = order
			local hl = Instance.new("UIListLayout", holder)
			hl.FillDirection = Enum.FillDirection.Horizontal
			hl.VerticalAlignment = Enum.VerticalAlignment.Center
			hl.Padding = UDim.new(0, 5)
			local ic = Instance.new("TextLabel", holder)
			ic.BackgroundTransparency = 1
			ic.AutomaticSize = Enum.AutomaticSize.X
			ic.Size = UDim2.fromOffset(0, 24)
			ic.Font = Enum.Font.GothamBold
			ic.TextSize = 15
			ic.TextColor3 = C.accent
			ic.LayoutOrder = 1
			themed(ic, "TextColor3", "accent")
			if drawFn then
				ic.Text = ""
				ic.AutomaticSize = Enum.AutomaticSize.None
				ic.Size = UDim2.fromOffset(16, 16)
				pcall(drawFn, ic)
			else
				ic.Text = emoji
			end
			local v = Instance.new("TextLabel", holder)
			v.BackgroundTransparency = 1
			v.AutomaticSize = Enum.AutomaticSize.X
			v.Size = UDim2.fromOffset(0, 24)
			v.Font = Enum.Font.GothamBold
			v.Text = text
			v.TextSize = 14
			v.TextColor3 = valueColor or Color3.fromRGB(236, 238, 242)
			v.LayoutOrder = 2
			return v
		end
		local function divider()
			order += 1
			local d = Instance.new("Frame", hud)
			d.Size = UDim2.fromOffset(1, 18)
			d.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			d.BackgroundTransparency = 0.8
			d.BorderSizePixel = 0
			d.LayoutOrder = order
		end

		-- ICONO FPS dibujado: 3 barritas tipo gráfico (acento, temable).
		local function drawBars(parent)
			local alturas = { 6, 10, 14 }
			for i = 1, 3 do
				local bar = Instance.new("Frame", parent)
				bar.AnchorPoint = Vector2.new(0, 1)
				bar.Position = UDim2.new(0, (i - 1) * 5 + 1, 1, -1)
				bar.Size = UDim2.fromOffset(3, alturas[i])
				bar.BorderSizePixel = 0
				bar.BackgroundColor3 = C.accent
				themed(bar, "BackgroundColor3", "accent")
				Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 1)
			end
		end
		-- ICONO DISCORD dibujado: burbuja de chat blanca con 3 puntitos blurple.
		local function drawBubble(parent)
			local body = Instance.new("Frame", parent)
			body.AnchorPoint = Vector2.new(0.5, 0.5)
			body.Position = UDim2.new(0.5, 0, 0.42, 0)
			body.Size = UDim2.fromScale(0.78, 0.56)
			body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			body.BorderSizePixel = 0
			Instance.new("UICorner", body).CornerRadius = UDim.new(0.42, 0)
			local tail = Instance.new("Frame", parent)
			tail.AnchorPoint = Vector2.new(0.5, 0.5)
			tail.Position = UDim2.new(0.38, 0, 0.7, 0)
			tail.Size = UDim2.fromScale(0.18, 0.18)
			tail.Rotation = 45
			tail.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			tail.BorderSizePixel = 0
			for i = 1, 3 do
				local dot = Instance.new("Frame", body)
				dot.AnchorPoint = Vector2.new(0.5, 0.5)
				dot.Position = UDim2.new(0.27 + (i - 1) * 0.23, 0, 0.5, 0)
				dot.Size = UDim2.fromScale(0.14, 0.2)
				dot.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
				dot.BorderSizePixel = 0
				Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
			end
		end

		playersLabel = cell("", "—/—", Color3.fromRGB(236, 238, 242))
		divider()
		pingLabel    = cell("", "— ms", Color3.fromRGB(236, 238, 242))
		divider()
		fpsLabel     = cell(nil, "— fps", Color3.fromRGB(120, 230, 150), drawBars)

		-- helper: botón de icono redondo (oscuro), con imagen (rbxassetid), dibujo
		-- vectorial (drawFn) o emoji. Prioridad: imagen > dibujo > emoji.
		local function iconButton(emoji, imageId, onClick, bgColor, drawFn)
			order += 1
			local b = Instance.new("TextButton", hud)
			b.Size = UDim2.fromOffset(28, 28)
			b.AutoButtonColor = false
			b.Text = ""
			b.LayoutOrder = order
			if bgColor then
				b.BackgroundColor3 = bgColor            -- color fijo (p.ej. blurple de Discord)
			else
				b.BackgroundColor3 = C.neutral
				themed(b, "BackgroundColor3", "neutral") -- se adapta al tema
			end
			local cc = Instance.new("UICorner", b); cc.CornerRadius = UDim.new(0, 14)
			local content
			if imageId and imageId ~= "" then
				content = Instance.new("ImageLabel", b)
				content.BackgroundTransparency = 1
				content.AnchorPoint = Vector2.new(0.5, 0.5)
				content.Position = UDim2.fromScale(0.5, 0.5)
				content.Size = UDim2.fromScale(0.64, 0.64)
				content.Image = imageId
			elseif drawFn then
				content = Instance.new("Frame", b)
				content.BackgroundTransparency = 1
				content.AnchorPoint = Vector2.new(0.5, 0.5)
				content.Position = UDim2.fromScale(0.5, 0.5)
				content.Size = UDim2.fromScale(0.82, 0.82)
				pcall(drawFn, content)
			else
				content = Instance.new("TextLabel", b)
				content.BackgroundTransparency = 1
				content.Size = UDim2.fromScale(1, 1)
				content.Font = Enum.Font.GothamBold
				content.Text = emoji or "?"
				content.TextSize = 14
			end
			track(b.MouseButton1Click:Connect(onClick))
			return b, content
		end

		-- DISCORD: usa el RPC LOCAL de la app Discord (puertos 6463-6472) para
		-- abrir el invite DIRECTO en la app, como tu otro script. Además copia
		-- el invite por si la app no estuviera abierta.
		local function openDiscord()
			if DISCORD_INVITE == "" then return end
			pcall(function() if clipboard then clipboard(DISCORD_INVITE) end end)
			local code = DISCORD_INVITE:match("([%w%-_]+)%s*$")   -- saca el código del invite
			if not code or not httpRequest then return end
			task.spawn(function()
				for port = 6463, 6472 do                          -- Discord escucha en uno de estos
					pcall(function()
						httpRequest({
							Url = "http://127.0.0.1:" .. port .. "/rpc?v=1",
							Method = "POST",
							Headers = {
								["Content-Type"] = "application/json",
								["Origin"] = "https://discord.com",
							},
							Body = HttpService:JSONEncode({
								cmd = "INVITE_BROWSER",
								args = { code = code },
								nonce = HttpService:GenerateGUID(false),
							}),
						})
					end)
				end
			end)
		end
		local discBtn = iconButton(nil, DISCORD_LOGO_ID, openDiscord, Color3.fromRGB(88, 101, 242), drawBubble)  -- blurple Discord
		attachTip(discBtn, "Discord NX")

		-- OCULTAR / MOSTRAR **SOLO TU PROPIO TAG** (rápido, desde la barra). Persiste.
		-- El interruptor maestro que oculta los tags de TODOS vive en
		-- Ajustes →  NX Head Tags (todos). Aquí solo se quita/pone el tuyo.
		local ownOn = (store.ownTag ~= false)
		local ownIcon
		local function setOwnTag(on)
			ownOn = on
			store.ownTag = on
			pcall(saveStore)
			if _G.NXHeadTags and _G.NXHeadTags.SetShowOwnTag then
				pcall(_G.NXHeadTags.SetShowOwnTag, on)
			end
			if ownIcon then ownIcon.Text = on and "" or "" end
		end
		local ownBtn, oi = iconButton(ownOn and "" or "", nil, function() setOwnTag(not ownOn) end)
		ownIcon = oi
		attachTip(ownBtn, ownOn and "Tu tag: visible (click = ocultar)" or "Tu tag: oculto (click = mostrar)")

		-- Destapa el límite de FPS del cliente (si el executor lo permite) para que el
		-- contador muestre los FPS REALES, sin tope de 240. Falla en silencio.
		pcall(function()
			local cap = rawget(getfenv(), "setfpscap") or setfpscap
			if type(cap) == "function" then cap(1000) end   -- 1000 = sin tope práctico (puedes subirlo)
		end)

		-- FPS (promediado) en vivo
		local frames, acc = 0, 0
		track(RunService.RenderStepped:Connect(function(dt)
			frames += 1; acc += dt
			if acc >= 0.5 then
				if fpsLabel then fpsLabel.Text = math.floor(frames / acc + 0.5) .. " fps" end
				frames, acc = 0, 0
			end
		end))
		-- ping + jugadores cada 1s (ahora SÍ cuenta los jugadores)
		task.spawn(function()
			while hud.Parent do
				local ok, ms = pcall(function() return math.floor((player:GetNetworkPing() or 0) * 1000 + 0.5) end)
				if pingLabel then pingLabel.Text = (ok and ms or 0) .. " ms" end
				if playersLabel then
					local mx = Players.MaxPlayers
					local cnt = #Players:GetPlayers()
					playersLabel.Text = (mx and mx > 0) and (cnt .. "/" .. mx) or tostring(cnt)
				end
				task.wait(1)
			end
		end)
	end)

	-- ── 3) Círculo del tag => NX BLANCO, fondo NEGRO, borde = COLOR DEL ROL
	-- (limpio y legible; sin respiración por GLOW_ALL=false).
	local function restyleCircle(circle)
		if not circle or circle:GetAttribute("PrismStyled") then return end
		circle:SetAttribute("PrismStyled", true)
		local st = circle:FindFirstChildOfClass("UIStroke")
		local roleColor = (st and st.Color) or Color3.fromRGB(255, 255, 255)
		circle.BackgroundColor3 = Color3.fromRGB(10, 10, 12)   -- fondo NEGRO
		circle.BackgroundTransparency = 0
		if st then
			st.Color = roleColor       -- borde = COLOR DEL ROL
			st.Thickness = 3
			st.Transparency = 0
		end
		for _, ch in ipairs(circle:GetChildren()) do
			if ch:IsA("TextLabel") then
				ch.TextColor3 = Color3.fromRGB(255, 255, 255)  -- NX BLANCO
				ch.Size = UDim2.fromScale(0.62, 0.62)          -- NX más pequeño
				local ts = ch:FindFirstChildOfClass("UIStroke")
				if ts then ts.Transparency = 1 end             -- sin contorno (limpio)
			elseif ch:IsA("ImageLabel") then
				ch.ImageColor3 = Color3.fromRGB(255, 255, 255)
				ch.Size = UDim2.fromScale(0.55, 0.55)
			end
		end
	end
	task.spawn(function()
		local pg = player:FindFirstChildOfClass("PlayerGui") or player:WaitForChild("PlayerGui")
		local folder = pg:FindFirstChild("NXHeadTags")
		local t0 = os.clock()
		while not folder and (os.clock() - t0) < 20 do
			task.wait(0.5); folder = pg:FindFirstChild("NXHeadTags")
		end
		if not folder then return end
		for _, bb in ipairs(folder:GetChildren()) do
			local c = bb:FindFirstChild("Circle"); if c then restyleCircle(c) end
		end
		track(folder.ChildAdded:Connect(function(bb)
			task.defer(function()
				local c = bb:FindFirstChild("Circle"); if c then restyleCircle(c) end
			end)
		end))
	end)

	-- ── 4) TP AL TOCAR EL TAG (robusto, por proyección a pantalla) ───────
	-- Proyecta la cabeza de cada jugador-CON-tag a la pantalla y, al hacer
	-- click, TP al más cercano al cursor. No hace falta acertar la pill
	-- flotante: basta tocar cerca del jugador. Cooldown anti-spam.
	local lastTp = 0
	local function rootOf(ch)
		return ch and (ch:FindFirstChild("HumanoidRootPart")
			or ch:FindFirstChild("UpperTorso") or ch:FindFirstChild("Torso"))
	end
	track(UIS.InputBegan:Connect(function(input, gpe)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch then return end
		local now = os.clock()
		if now - lastTp < 0.4 then return end
		local cam = workspace.CurrentCamera
		if not cam then return end
		local pg = player:FindFirstChildOfClass("PlayerGui")
		local folder = pg and pg:FindFirstChild("NXHeadTags")
		local mouse = UIS:GetMouseLocation()
		local best, bestD
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= player and plr.Character then
				local head = plr.Character:FindFirstChild("Head")
				local hasTag = folder and folder:FindFirstChild("NXHeadTag_" .. plr.UserId)
				if head and hasTag then
					local sp, on = cam:WorldToViewportPoint(head.Position + Vector3.new(0, 2.6, 0))
					if on then
						local d = (Vector2.new(sp.X, sp.Y) - mouse).Magnitude
						if not bestD or d < bestD then bestD = d; best = plr end
					end
				end
			end
		end
		local radius = gpe and 55 or 60    -- radio conservador (120 era demasiado agresivo)
		if best and bestD and bestD <= radius then
			local myR, tR = rootOf(player.Character), rootOf(best.Character)
			if myR and tR then
				myR.CFrame = tR.CFrame
				lastTp = now
			end
		end
	end))
end)()

-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║   PRISM TOPBAR ULTRA · cabecera premium (logo · divisiones · título) ║
-- ╠══════════════════════════════════════════════════════════════════════╣
-- ║  Capa ADITIVA y FINAL: corre DESPUÉS de PRISM LOOK + PRISM HUD, así    ║
-- ║  manda sobre la geometría del título. Arregla que el texto se SALGA    ║
-- ║  o se corte ilegible (título adaptativo full→corto→mini midiendo el    ║
-- ║  ancho REAL), añade un LOGO genérico (gema, siempre renderiza), pone   ║
-- ║  DIVISIONES en la barra, un borde neón sobre el título y un brillo     ║
-- ║  SMOOTH que recorre la cabecera. Todo temable (themed/onRepaint),      ║
-- ║  respeta Animaciones (ANIM) y se autolimpia con track(). IIFE: scope   ║
-- ║  propio, no suma locales al chunk (no toca el límite de 200 de Luau).  ║
-- ╚══════════════════════════════════════════════════════════════════════╝
;(function()
	local RunService  = game:GetService("RunService")
	local TextService = game:GetService("TextService")

	-- Mezclas de color: todo el neón se DERIVA de C.accent (respeta el tema).
	local function lerp(a, b, t) return a + (b - a) * t end
	local function lighten(c, f) return Color3.new(lerp(c.R,1,f), lerp(c.G,1,f), lerp(c.B,1,f)) end
	local function darken(c, f)  return Color3.new(lerp(c.R,0,f), lerp(c.G,0,f), lerp(c.B,0,f)) end

	-- ── 1) BRILLO SUPERIOR (specular): finísima línea clara arriba = cristal.
	pcall(function()
		local top = Instance.new("Frame", header)
		top.Name = "TopSpecular"
		top.Size = UDim2.new(1, -24, 0, 1)
		top.Position = UDim2.new(0, 12, 0, 1)
		top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		top.BackgroundTransparency = 0.55
		top.BorderSizePixel = 0
		top.ZIndex = 3
		local g = Instance.new("UIGradient", top)
		g.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(0.5, 0),
			NumberSequenceKeypoint.new(1, 1),
		})
	end)

	-- ── 2) DIVISIONES verticales (atenuadas en los extremos), tono del tema.
	local function vdivider(name, pos)
		local d = Instance.new("Frame", header)
		d.Name = name
		d.AnchorPoint = Vector2.new(0.5, 0.5)
		d.Position = pos
		d.Size = UDim2.fromOffset(1, 18)
		d.BackgroundColor3 = C.accent
		d.BackgroundTransparency = 0.5
		d.BorderSizePixel = 0
		d.ZIndex = 3
		themed(d, "BackgroundColor3", "accent")
		local g = Instance.new("UIGradient", d)
		g.Rotation = 90
		g.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(0.5, 0.15),
			NumberSequenceKeypoint.new(1, 1),
		})
		return d
	end
	vdivider("DivLeft",  UDim2.new(0, 74, 0.5, 0))     -- tras los semáforos
	vdivider("DivRight", UDim2.new(1, -146, 0.5, 0))   -- antes de los controles

	-- ── 3) LOGO genérico (gema/prisma): SIEMPRE renderiza, no depende de un
	-- asset moderado. Va entre la división izquierda y el título.
	local gemGrad, gemStroke
	pcall(function()
		local gem = Instance.new("Frame", header)
		gem.Name = "NXGem"
		gem.AnchorPoint = Vector2.new(0.5, 0.5)
		gem.Position = UDim2.new(0, 90, 0.5, 0)
		gem.Size = UDim2.fromOffset(15, 15)
		gem.Rotation = 45
		gem.BackgroundColor3 = C.accent
		gem.BorderSizePixel = 0
		gem.ZIndex = 3
		themed(gem, "BackgroundColor3", "accent")
		Instance.new("UICorner", gem).CornerRadius = UDim.new(0, 3)
		gemGrad = Instance.new("UIGradient", gem)
		gemGrad.Rotation = 90
		gemGrad.Color = ColorSequence.new(lighten(C.accent, 0.45), darken(C.accent, 0.12))
		gemStroke = Instance.new("UIStroke", gem)
		gemStroke.Thickness = 1.2
		gemStroke.Color = lighten(C.accent, 0.55)
		gemStroke.Transparency = 0.15
		-- destello interior (faceta)
		local spark = Instance.new("Frame", gem)
		spark.AnchorPoint = Vector2.new(0.5, 0.5)
		spark.Position = UDim2.fromScale(0.5, 0.5)
		spark.Size = UDim2.fromScale(0.42, 0.42)
		spark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		spark.BackgroundTransparency = 0.35
		spark.BorderSizePixel = 0
		spark.ZIndex = 4
		Instance.new("UICorner", spark).CornerRadius = UDim.new(0, 2)
	end)

	-- ── 4) TÍTULO adaptativo: nunca se sale ni se corta ilegible. Mide el
	-- ancho REAL disponible y elige el texto MÁS LARGO que quepa entero.
	local FORMS = { "Roblox Profile Analyzer", "Profile Analyzer", "Analyzer", "NX" }
	title.Position       = UDim2.new(0, 106, 0, 0)
	-- Reserva derecha reducida (v3.8.1): ya no está el logo NX. A la derecha solo
	-- quedan el escudo (~-100) y los 3 controles (~-94..-10), así que el título
	-- puede crecer hasta -140 y así entra la forma larga con más frecuencia.
	title.Size           = UDim2.new(1, -140, 1, 0)
	title.TextTruncate   = Enum.TextTruncate.AtEnd
	title.TextXAlignment = Enum.TextXAlignment.Left
	local function widthOf(s)
		local ok, sz = pcall(function()
			return TextService:GetTextSize(s, title.TextSize, title.Font, Vector2.new(9999, 100)).X
		end)
		return ok and sz or (#s * 9)
	end
	local function fitTitle()
		local avail = title.AbsoluteSize.X - 4
		local chosen = FORMS[#FORMS]
		for _, t in ipairs(FORMS) do
			if widthOf(t) <= avail then chosen = t; break end
		end
		if title.Text ~= chosen then title.Text = chosen end
		local shine = title.Parent:FindFirstChild("TitleShine")   -- el barrido blanco sigue el mismo texto
		if shine then shine.Text = chosen end
	end
	track(title:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() pcall(fitTitle) end))
	task.defer(function() pcall(fitTitle) end)

	-- Baja el BRILLO del barrido blanco del título (legibilidad: el destello
	-- blanco era muy fuerte y costaba leer el título).
	pcall(function()
		local shine = title.Parent:FindFirstChild("TitleShine")
		if shine then shine.TextTransparency = 0.6 end
	end)

	-- ── 5) BORDE NEÓN sobre el título (premium) + respiración suave (smooth).
	-- Brillo REBAJADO a pedido: stroke fino y bastante transparente = se lee mejor.
	local titleStroke
	pcall(function()
		titleStroke = Instance.new("UIStroke", title)
		titleStroke.Thickness = 1
		titleStroke.Color = lighten(C.accent, 0.1)
		titleStroke.Transparency = 0.72
		titleStroke.LineJoinMode = Enum.LineJoinMode.Round
	end)

	-- ── 6) BRILLO SMOOTH que recorre la base de la cabecera (escáner sutil).
	local sheen, sheenGrad
	pcall(function()
		sheen = Instance.new("Frame", header)
		sheen.Name = "HeaderSheen"
		sheen.Size = UDim2.new(1, 0, 0, 2)
		sheen.Position = UDim2.new(0, 0, 1, -2)
		sheen.BackgroundColor3 = C.accent
		sheen.BackgroundTransparency = 0.4
		sheen.BorderSizePixel = 0
		sheen.ZIndex = 3
		themed(sheen, "BackgroundColor3", "accent")
		sheenGrad = Instance.new("UIGradient", sheen)
		sheenGrad.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0.00, 1),
			NumberSequenceKeypoint.new(0.42, 1),
			NumberSequenceKeypoint.new(0.50, 0.45),
			NumberSequenceKeypoint.new(0.58, 1),
			NumberSequenceKeypoint.new(1.00, 1),
		})
		sheenGrad.Offset = Vector2.new(-1, 0)
	end)

	-- ── 7) LATIDO: barre el escáner y respira el borde del título. Solo con la
	-- GUI visible y con las animaciones activas (si las apagas, se queda quieto).
	local t = 0
	track(RunService.Heartbeat:Connect(function(dt)
		if not gui.Enabled or not ANIM.enabled then return end
		t += dt
		if sheenGrad then
			local p = (t * 0.30) % 2          -- 0..2 → barre de -1 a 1 y vuelve
			sheenGrad.Offset = Vector2.new(p - 1, 0)
		end
		if titleStroke then
			titleStroke.Transparency = 0.7 + 0.08 * math.sin(t * 1.4)   -- respiración muy suave y tenue
		end
	end))

	-- ── 8) Sincronía con el TEMA EN VIVO (recalcula degradados de acento).
	onRepaint(function()
		if gemGrad     then pcall(function() gemGrad.Color     = ColorSequence.new(lighten(C.accent,0.45), darken(C.accent,0.12)) end) end
		if gemStroke   then pcall(function() gemStroke.Color   = lighten(C.accent, 0.55) end) end
		if titleStroke then pcall(function() titleStroke.Color = lighten(C.accent, 0.1)  end) end
	end)

	-- ── 9) HUD: subida un poco para aprovechar el espacio, sin pegarla al borde.
	pcall(function()
		local hud = gui:FindFirstChild("PrismHUD")
		if hud then hud.Position = UDim2.new(1, -16, 0, 28) end
	end)

	-- ── 10) BOTONES (panel principal): esquinas redondeadas garantizadas +
	-- micro-interacción hover/click. Solo UIScale → NO altera el layout ni pelea
	-- con los colores de tema de cada botón. Idempotente (atributo NXPolished).
	local function polishButton(b)
		if b:GetAttribute("NXPolished") then return end
		b:SetAttribute("NXPolished", true)
		if not b:FindFirstChildOfClass("UICorner") then
			Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
		end
		local sc = b:FindFirstChildOfClass("UIScale") or Instance.new("UIScale", b)
		local function to(scale, dur)
			if ANIM.enabled then motionTween(sc, TweenInfo.new(dur, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = scale })
			else sc.Scale = scale end
		end
		track(b.MouseEnter:Connect(function()        to(1.035, 0.12) end))
		track(b.MouseLeave:Connect(function()        to(1.0,   0.14) end))
		track(b.MouseButton1Down:Connect(function()  to(0.965, 0.08) end))
		track(b.MouseButton1Up:Connect(function()    to(1.02,  0.10) end))
	end
	pcall(function()
		for _, d in ipairs(main:GetDescendants()) do
			if d:IsA("TextButton") then pcall(polishButton, d) end
		end
		track(main.DescendantAdded:Connect(function(d)
			if d:IsA("TextButton") then task.defer(function() pcall(polishButton, d) end) end
		end))
	end)
end)()

-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║   NX INTRO  ·  animación de bienvenida (logo NX + sonido suave)      ║
-- ╠══════════════════════════════════════════════════════════════════════╣
-- ║  Splash premium glass/neón que aparece SOLO la primera vez (se        ║
-- ║  recuerda con store.introSeen). Se apaga o se re-ve desde Ajustes ›   ║
-- ║  " Intro de inicio". API: _G.NXIntro.play(true) la fuerza,          ║
-- ║  _G.NXIntro.reset() la vuelve a marcar como NO vista.                 ║
-- ║  IIFE: registros aislados (no toca el límite de 200 locals).          ║
-- ╚══════════════════════════════════════════════════════════════════════╝
;(function()
	local SoundService = game:GetService("SoundService")
	local Debris       = game:GetService("Debris")

	-- Logo NX = el MISMO asset del header del panel.
	local LOGO_ID     = "rbxassetid://97974702902814"
	-- ── SONIDO de la intro · UN solo toque, suave ──
	-- Suena UNA sola vez al abrir la intro. Nada de doble tono (eso sonaba a
	-- timbre). Volumen bajo = discreto y agradable. Assets INTERNOS de Roblox
	-- (siempre disponibles, sin moderación).
	--  Para PROBAR otro, cambia SOUND_PACK por cualquier nombre de SOUND_PACKS.
	local SOUND_PACKS = {
		suave    = { id = "rbxasset://sounds/button.wav",              vol = 0.22, pitch = 0.95 },
		pop      = { id = "rbxasset://sounds/electronicpingshort.wav", vol = 0.22, pitch = 0.60 },
		profundo = { id = "rbxasset://sounds/bass.wav",               vol = 0.26, pitch = 1.05 },
		click    = { id = "rbxasset://sounds/clickfast.wav",          vol = 0.22, pitch = 0.95 },
		none     = { id = "",                                          vol = 0.00, pitch = 1.00 },
	}
	local SOUND_PACK  = "suave"   -- ← prueba: suave · pop · profundo · click · none (silencio)
	local SPLASH_NAME = "UtilityIntro"
	local accent      = (C and C.accent) or Color3.fromRGB(120, 220, 255)

	-- Tween local: la intro SIEMPRE anima cuando se reproduce (es algo puntual).
	local function tw(inst, t, style, dir, props)
		local info = TweenInfo.new(t, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out)
		local x = TweenService:Create(inst, info, props)
		x:Play()
		return x
	end

	-- ── Ocultar / revelar los paneles (Analyzer + Lista de jugadores) ──
	-- La intro va PRIMERO con los paneles ocultos; al final los paneles nacen
	-- del círculo con un "pop".
	local function setListaEnabled(on)
		pcall(function()
			local lista = playerGui:FindFirstChild("ListaJugadoresModerna")
			if lista then lista.Enabled = on end
		end)
	end
	local function hidePanels()
		pcall(function() gui.Enabled = false end)
		-- la Lista se crea DESPUÉS de este bloque; task.defer la oculta sin parpadeo
		task.defer(setListaEnabled, false)
	end
	local function popIn(frame)
		if not frame then return end
		pcall(function()
			local us = frame:FindFirstChildOfClass("UIScale") or Instance.new("UIScale", frame)
			us.Scale = 0.9
			TweenService:Create(us, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
		end)
	end
	local function revealPanels()
		-- panel principal (con su "pop" de entrada)
		pcall(function()
			gui.Enabled = true
			if NXWin and NXWin.playOpenAnim then NXWin.playOpenAnim() end
		end)
		-- panel de la Lista de jugadores (con pop)
		setListaEnabled(true)
		pcall(function()
			local lista = playerGui:FindFirstChild("ListaJugadoresModerna")
			if lista then popIn(lista:FindFirstChild("Ventana")) end
		end)
	end

	local NXIntro = {}
	local playing = false
	local INTRO_REMOVED = false   -- ← interruptor: true = apaga la intro; false = ENCENDIDA

	function NXIntro.play()
		if INTRO_REMOVED then return end   -- si está apagada, no hace nada
		if playing then return end
		playing = true

		hidePanels()   -- la intro sale SOLA primero; los paneles esperan
		-- failsafe: pase lo que pase, los paneles vuelven (que nunca queden ocultos)
		task.delay(6, function()
			pcall(function() if not gui.Enabled then gui.Enabled = true end end)
			setListaEnabled(true)
		end)

		-- limpia cualquier splash previo (re-ejecución / replay)
		pcall(function()
			local old = playerGui:FindFirstChild(SPLASH_NAME)
			if old then old:Destroy() end
		end)

		task.spawn(function()
			-- ── Capa propia, por encima de TODO (su propio ScreenGui) ──
			local sg = Instance.new("ScreenGui")
			sg.Name = SPLASH_NAME
			sg.ResetOnSpawn = false
			sg.IgnoreGuiInset = true
			sg.DisplayOrder = 100000
			sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			sg.Parent = playerGui

			-- (SIN fondo: la intro es SOLO el círculo flotando en el centro;
			-- NO oscurece la pantalla.)

			-- contenedor central (escala animada)
			local center = Instance.new("Frame")
			center.AnchorPoint = Vector2.new(0.5, 0.5)
			center.Position = UDim2.fromScale(0.5, 0.46)
			center.Size = UDim2.fromOffset(180, 200)
			center.BackgroundTransparency = 1
			center.ZIndex = 2
			center.Parent = sg
			local cScale = Instance.new("UIScale", center)
			cScale.Scale = 0.6

			local BASE = 124   -- diámetro del círculo

			-- halo neón CIRCULAR detrás de la moneda (gira JUNTO al disco en el efecto moneda)
			local halo = Instance.new("Frame")
			halo.AnchorPoint = Vector2.new(0.5, 0.5)
			halo.Position = UDim2.new(0.5, 0, 0, 70)
			halo.Size = UDim2.fromOffset(BASE + 18, BASE + 18)
			halo.BackgroundColor3 = accent
			halo.BackgroundTransparency = 1
			halo.BorderSizePixel = 0
			halo.ZIndex = 1
			halo.Parent = center
			Instance.new("UICorner", halo).CornerRadius = UDim.new(1, 0)

			-- la "moneda": círculo oscuro tipo badge M7 (gira en 3D)
			local coin = Instance.new("Frame")
			coin.AnchorPoint = Vector2.new(0.5, 0.5)
			coin.Position = UDim2.new(0.5, 0, 0, 70)
			coin.Size = UDim2.fromOffset(BASE, BASE)
			coin.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
			coin.BackgroundTransparency = 1
			coin.BorderSizePixel = 0
			coin.ClipsDescendants = true       -- mantiene el disco limpio al aplastarse
			coin.ZIndex = 2
			coin.Parent = center
			Instance.new("UICorner", coin).CornerRadius = UDim.new(1, 0)
			local cStroke = Instance.new("UIStroke", coin)
			cStroke.Color = accent
			cStroke.Thickness = 1.5
			cStroke.Transparency = 1

			-- WORDMARK "NX" limpio (SIN la barra del logo). Centrado tipo badge M7.
			-- (Tu imagen-logo trae la línea N/X incrustada; por eso aquí va texto.
			--  Si algún día subes un logo SIN la línea, cámbialo por un ImageLabel
			--  con LOGO_ID + ScaleType.Stretch y listo.)
			-- VA DENTRO de la moneda (hijo de coin): así las LETRAS "NX" GIRAN en
			-- perfecta sincronía con el disco (se aplastan junto con él, gratis).
			-- Lo único que se queda fijo es el tagline de abajo ("PROFILE ANALYZER").
			local wordmark = Instance.new("TextLabel", coin)
			wordmark.AnchorPoint = Vector2.new(0.5, 0.5)
			wordmark.Position = UDim2.fromScale(0.5, 0.5)
			wordmark.Size = UDim2.fromScale(0.72, 0.72)
			wordmark.BackgroundTransparency = 1
			wordmark.Text = "NX"
			wordmark.Font = Enum.Font.GothamBlack
			wordmark.TextColor3 = Color3.fromRGB(255, 255, 255)
			wordmark.TextScaled = true
			wordmark.TextTransparency = 1
			wordmark.ZIndex = 3

			-- tagline debajo
			local tag = Instance.new("TextLabel")
			tag.AnchorPoint = Vector2.new(0.5, 0)
			tag.Position = UDim2.new(0.5, 0, 0, 142)
			tag.Size = UDim2.fromOffset(280, 18)
			tag.BackgroundTransparency = 1
			tag.Font = Enum.Font.GothamMedium
			tag.Text = "P R O F I L E   A N A L Y Z E R"
			tag.TextSize = 12
			tag.TextColor3 = accent
			tag.TextTransparency = 1
			tag.ZIndex = 3
			tag.Parent = center

			-- ── SONIDO · helper local (2D) + pack elegido ──
			local SND = SOUND_PACKS[SOUND_PACK] or SOUND_PACKS.suave
			local function playTone(id, vol, pitch)
				if not id or id == "" then return end
				pcall(function()
					local snd = Instance.new("Sound")
					snd.SoundId       = id
					snd.Volume        = vol or 0.5
					snd.PlaybackSpeed = pitch or 1
					snd.Parent        = SoundService
					SoundService:PlayLocalSound(snd)
					Debris:AddItem(snd, 5)
				end)
			end

			-- ── ENTRADA "FLIP + ZOOM" · el logo CRECE desde pequeño mientras da
			--    una VUELTA horizontal completa (eje vertical), todo en un mismo
			--    movimiento. Easing ease-out (lo ideal para entradas: arranca con
			--    energía y asienta suave). El "NX" va dentro de la moneda → gira y
			--    crece con ella; disco + halo van sincronizados. El tagline NO se anima.
			local RunService = game:GetService("RunService")
			local SPIN_SECS, SPINS = 1.25, 1     -- una vuelta + zoom, ágil
			local START_SCALE = 0.35             -- tamaño inicial del logo (de aquí crece a 1)
			local spinConn
			local function startSpin()
				local t0 = os.clock()
				spinConn = RunService.RenderStepped:Connect(function()
					local p = (os.clock() - t0) / SPIN_SECS
					if p >= 1 then
						cScale.Scale = 1
						coin.Size = UDim2.fromOffset(BASE, BASE)
						halo.Size = UDim2.fromOffset(BASE + 18, BASE + 18)
						coin.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
						wordmark.TextColor3   = Color3.fromRGB(255, 255, 255)
						playTone(SND.id, SND.vol, SND.pitch)   -- SINCRONIZADO: suena justo al asentarse el logo
						if spinConn then spinConn:Disconnect(); spinConn = nil end
						return
					end
					-- ease-out cúbico: rápido al entrar, suave al asentar
					local s = 1 - (1 - p) ^ 3
					-- ZOOM: el logo crece de START_SCALE a 1 (cScale escala todo el conjunto)
					cScale.Scale = START_SCALE + (1 - START_SCALE) * s
					-- FLIP horizontal: una vuelta (escorzo de ancho con |cos|)
					local face = math.cos(s * SPINS * 2 * math.pi)   -- +1 cara · 0 canto · -1 dorso
					local w    = math.abs(face)
					local n    = (face + 1) * 0.5
					coin.Size = UDim2.fromOffset(math.max(BASE * w, BASE * 0.03), BASE)
					halo.Size = UDim2.fromOffset(math.max((BASE + 18) * w, (BASE + 18) * 0.03), BASE + 18)
					-- sombreado cara/dorso → la vuelta se siente real mientras crece
					local sh = 0.18 + 0.82 * n
					coin.BackgroundColor3 = Color3.fromRGB(math.floor(14 * sh), math.floor(14 * sh), math.floor(18 * sh))
					wordmark.TextColor3   = Color3.fromRGB(math.floor(255 * sh), math.floor(255 * sh), math.floor(255 * sh))
				end)
			end

			-- ── LÍNEA DE TIEMPO · entrada FLIP + ZOOM ──
			cScale.Scale = START_SCALE                 -- arranca pequeño
			-- el logo se MATERIALIZA rápido mientras ya crece y gira
			tw(halo,    0.30, Enum.EasingStyle.Quad, nil, { BackgroundTransparency = 0.72 })
			tw(coin,    0.28, Enum.EasingStyle.Quad, nil, { BackgroundTransparency = 0 })
			tw(cStroke, 0.32, Enum.EasingStyle.Quad, nil, { Transparency = 0.18 })
			tw(wordmark,0.28, Enum.EasingStyle.Quad, nil, { TextTransparency = 0 })

			startSpin()                                 -- flip + zoom · el sonido suena al aterrizar (ver driver)

			-- el tagline entra SOLO al final, cuando el logo ya se asienta (nunca gira)
			task.delay(SPIN_SECS * 0.72, function()
				tw(tag, 0.45, Enum.EasingStyle.Quad, nil, { TextTransparency = 0.12 })
			end)

			task.wait(SPIN_SECS + 0.2)

			-- ── SALIDA: del CÍRCULO nacen los paneles ──
			if spinConn then spinConn:Disconnect(); spinConn = nil end
			coin.Size = UDim2.fromOffset(BASE, BASE)

			-- los paneles aparecen con pop justo cuando el círculo se encoge y desaparece
			revealPanels()

			tw(cScale,  0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.In, { Scale = 1.14 })
			tw(cStroke, 0.40, Enum.EasingStyle.Quad, nil, { Transparency = 1 })
			tw(wordmark, 0.40, Enum.EasingStyle.Quad, nil, { TextTransparency = 1 })
			tw(coin,    0.40, Enum.EasingStyle.Quad, nil, { BackgroundTransparency = 1 })
			tw(tag,     0.35, Enum.EasingStyle.Quad, nil, { TextTransparency = 1 })
			tw(halo,    0.40, Enum.EasingStyle.Quad, nil, { BackgroundTransparency = 1 })

			task.wait(0.5)
			if spinConn then spinConn:Disconnect(); spinConn = nil end
			pcall(function() sg:Destroy() end)
			playing = false
		end)
	end

	function NXIntro.reset()
		store.introSeen = false
		pcall(saveStore)
	end
	function NXIntro.setEnabled(on)
		store.introEnabled = on and true or false
		pcall(saveStore)
	end
	_G.NXIntro = NXIntro

	-- ── AUTO-ARRANQUE ──
	--  MODO PRUEBA: con TEST_FORCE = true la intro sale en CADA ejecución
	-- (ignora el "ya vista"). Cuando termines de probar, ponlo en false y
	-- volverá a salir SOLO la primera vez (recordado en ProfileAnalyzer_data.json).
	-- AUTO-ARRANQUE de la intro. TEST_FORCE = true → sale en CADA ejecución.
	-- Ponlo en false y saldrá SOLO la primera vez (recordado en el guardado).
	local TEST_FORCE = true
	if (not INTRO_REMOVED) and (store.introEnabled ~= false) and (TEST_FORCE or store.introSeen ~= true) then
		store.introSeen = true
		pcall(saveStore)
		NXIntro.play()
	end
end)()

--[[ ==========================================================================
   Lista de Jugadores Moderna  v2.4   (pegada al Analyzer · misma ejecución)
   --------------------------------------------------------------------------
   Cambios en v2.4 (sobre v2.3):
   • COLORES SINCRONIZADOS con el Analyzer. Si el Analyzer está cargado,
     la lista lee su tabla de tema VIVA (_G.NXTheme) y se cuelga de su
     repaint: cuando cambias el tema en Ajustes, la lista se repinta sola
     al instante. Si el Analyzer no está, usa la paleta Tor de respaldo.
   • BOTONES DE VENTANA estilo navegador, blindados: minimizar (–),
     pantalla completa / restaurar (cuadro dibujado con Frames pa' que
     NUNCA salga el cuadrito de glifo roto) y cerrar (X de verdad). Hit-area
     24x24, hover suave, borde sutil y consumen el input (no disparan el
     arrastre por accidente). Pantalla completa = ~96% de la pantalla.
   --------------------------------------------------------------------------
   Cambios en v2.3 (sobre v2.2): integración con el Analyzer (una sola
   ejecución) + BÚSQUEDA GLOBAL en todo Roblox (API users/search) con
   sección " Roblox" y botón "Analizar" (→ _G.NXAnalyze).
   Se mantiene TODO lo de v2.2: carga al instante, orden por secciones,
   sugerencias, arrastre y live update al entrar/salir jugadores.
============================================================================ ]]
-- IIFE (no `do...end`): una función propia tiene su PROPIO presupuesto de 200
-- locals de Luau. Con `do...end` los locals se apilaban sobre los ~154 del
-- Analyzer y reventaba ("Out of local registers ... exceeded limit 200").
;(function()
	-- ====================== SERVICIOS ======================
	local Players = game:GetService("Players")
	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	local HttpService = game:GetService("HttpService")

	local player = Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")

	-- ====================== TEMA (sincronizado con el Analyzer) ======================
	-- Si el Analyzer está cargado expone su tabla de colores VIVA (_G.NXTheme.C,
	-- se muta en sitio) + onRepaint. Nos colgamos de ahí: al cambiar el tema en
	-- Ajustes, prepaint() repinta toda la lista. Si no está, usamos FALLBACK.
	local NXT = rawget(_G, "NXTheme")
	local C = NXT and NXT.C or nil
	local WHITE = Color3.fromRGB(255, 255, 255)

	local FALLBACK = {
		bg=Color3.fromRGB(20,15,28), header=Color3.fromRGB(33,24,46), card=Color3.fromRGB(36,27,50),
		input=Color3.fromRGB(26,19,38), neutral=Color3.fromRGB(42,31,58), border=Color3.fromRGB(60,45,82),
		accent=Color3.fromRGB(160,100,210), accent2=Color3.fromRGB(122,82,178), onAccent=WHITE,
		text=Color3.fromRGB(238,233,246), subtext=Color3.fromRGB(158,143,176),
		good=Color3.fromRGB(80,190,110), bad=Color3.fromRGB(196,78,92),
		avatarBg=Color3.fromRGB(52,40,72), scrollbar=Color3.fromRGB(108,86,140),
		globe=Color3.fromRGB(160,100,210),
	}

	local function lighten(c, k) return Color3.new(math.min(c.R+k,1), math.min(c.G+k,1), math.min(c.B+k,1)) end
	local function darken(c, k) return Color3.new(c.R*k, c.G*k, c.B*k) end

	-- Resuelve un "rol" de color al Color3 actual (tema vivo del Analyzer o
	-- respaldo). Los roles propios de la lista se derivan del tema del Analyzer.
	local function col(role)
		if role == "white" then return WHITE end
		if C then
			local direct = C[role]
			if direct ~= nil then return direct end
			if role == "header"    then return C.neutral end
			if role == "avatarBg"  then return C.neutral end
			if role == "scrollbar" then return C.accent end
			if role == "globe"     then return C.accent end
			if role == "accent2"   then return darken(C.accent, 0.78) end
		end
		return FALLBACK[role] or FALLBACK.accent
	end

	-- Registro de temizado: (inst, prop, rol). prepaint() lo recorre al cambiar
	-- el tema. El slot pasa a nil cuando la instancia se destruye (sin leaks).
	local plRoleMap = {}
	local vivo = true
	local function pthemed(inst, prop, role)
		local entry = { inst = inst, prop = prop, role = role }
		table.insert(plRoleMap, entry)
		pcall(function() inst.Destroying:Connect(function() entry.inst = nil end) end)
		pcall(function() inst[prop] = col(role) end)
		return inst
	end
	local prepaintExtra = {}
	local function onPrepaint(fn) table.insert(prepaintExtra, fn) end
	local function prepaint()
		if not vivo then return end
		for _, e in ipairs(plRoleMap) do
			if e.inst then pcall(function() e.inst[e.prop] = col(e.role) end) end
		end
		for _, fn in ipairs(prepaintExtra) do pcall(fn) end
	end
	if NXT and NXT.onRepaint then pcall(NXT.onRepaint, prepaint) end

	-- Proxy de compatibilidad: TOR.x devuelve el color VIVO del rol "x".
	local TOR = setmetatable({}, { __index = function(_, k) return col(k) end })

	-- ====================== PORTAPAPELES ======================
	local function copiar(texto)
		local fns = { (getgenv and getgenv().setclipboard), setclipboard, (syn and syn.write_clipboard), toclipboard }
		for _, fn in ipairs(fns) do
			if type(fn) == "function" then
				local ok = pcall(fn, texto)
				if ok then return true end
			end
		end
		warn("[Lista] No se encontró una función de portapapeles disponible.")
		return false
	end

	-- ====================== HTTP (pa' la búsqueda global en TODO Roblox) ======================
	local httpRequest = (syn and syn.request) or http_request or request or (http and http.request)
	local function apiGet(url)
		local body
		if httpRequest then
			local ok, res = pcall(httpRequest, { Url = url, Method = "GET" })
			if ok and res and res.Body then body = res.Body end
		end
		if not body then
			local ok, res = pcall(function() return game:HttpGet(url) end)
			if ok then body = res end
		end
		if not body then return nil end
		local ok, decoded = pcall(function() return HttpService:JSONDecode(body) end)
		return ok and decoded or nil
	end

	-- POST JSON (pa' resolver el username EXACTO). El endpoint usernames/users es
	-- de lectura y NO necesita CSRF/sesión → encuentra nombres exactos que el
	-- buscador difuso (users/search) a veces no devuelve.
	local function apiPost(url, bodyTbl)
		if not httpRequest then return nil end
		local ok, res = pcall(httpRequest, {
			Url = url, Method = "POST",
			Headers = { ["Content-Type"] = "application/json" },
			Body = HttpService:JSONEncode(bodyTbl),
		})
		if not (ok and res and res.Body) then return nil end
		local ok2, decoded = pcall(function() return HttpService:JSONDecode(res.Body) end)
		return ok2 and decoded or nil
	end

	-- ====================== CACHÉ DE AVATARES (carga en segundo plano) ======================
	local avatarCache = {}
	local PLACEHOLDER = "rbxassetid://0"
	local function cargarAvatarAsync(userId, imageLabel)
		if avatarCache[userId] then
			imageLabel.Image = avatarCache[userId]
			return
		end
		task.spawn(function()
			local ok, thumb = pcall(function()
				return Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
			end)
			local content = (ok and thumb ~= "" and thumb) or PLACEHOLDER
			avatarCache[userId] = content
			if imageLabel and imageLabel.Parent then
				imageLabel.Image = content
			end
		end)
	end

	-- ====================== LIMPIAR GUI ANTERIOR ======================
	if playerGui:FindFirstChild("ListaJugadoresModerna") then
		playerGui.ListaJugadoresModerna:Destroy()
	end

	local gui = Instance.new("ScreenGui")
	gui.Name = "ListaJugadoresModerna"
	gui.ResetOnSpawn = false
	gui.IgnoreGuiInset = true
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	-- Por encima de la UI del juego, pero UNO por debajo del Analyzer, para que
	-- al solaparse mande siempre la ventana principal.
	gui.DisplayOrder = 2147482
	gui.Parent = playerGui

	-- ====================== VENTANA PRINCIPAL ======================
	local ANCHO, ALTO = 380, 480
	local ventana = Instance.new("Frame")
	ventana.Name = "Ventana"
	ventana.Size = UDim2.new(0, ANCHO, 0, ALTO)
	-- Posición inicial = FALLBACK (se aplica si el Analyzer no está cargado).
	-- El docking real (anclar a la derecha del Analyzer con un gap) se hace al
	-- final del init en task.defer → ver "DOCKING" más abajo.
	ventana.Position = UDim2.new(0.5, 308, 0.5, -ALTO/2)
	ventana.BorderSizePixel = 0
	ventana.ClipsDescendants = true
	ventana.Parent = gui
	pthemed(ventana, "BackgroundColor3", "bg")
	Instance.new("UICorner", ventana).CornerRadius = UDim.new(0, 10)

	local borde = Instance.new("UIStroke", ventana)
	borde.Thickness = 1.2
	borde.Transparency = 0.4
	pthemed(borde, "Color", "border")

	-- ====================== ENCABEZADO ======================
	local encabezado = Instance.new("Frame", ventana)
	encabezado.Name = "Encabezado"
	encabezado.Size = UDim2.new(1, 0, 0, 34)
	encabezado.BorderSizePixel = 0
	pthemed(encabezado, "BackgroundColor3", "header")
	Instance.new("UICorner", encabezado).CornerRadius = UDim.new(0, 10)

	local titulo = Instance.new("TextLabel", encabezado)
	titulo.Size = UDim2.new(1, -110, 1, 0)
	titulo.Position = UDim2.new(0, 14, 0, 0)
	titulo.BackgroundTransparency = 1
	titulo.Font = Enum.Font.GothamBold
	titulo.Text = "Jugadores: 0"
	titulo.TextSize = 14
	titulo.TextXAlignment = Enum.TextXAlignment.Left
	titulo.TextTruncate = Enum.TextTruncate.AtEnd
	pthemed(titulo, "TextColor3", "accent")

	-- ====================== CONTROLES DE VENTANA (estilo navegador, blindados) ======================
	-- Contenedor anclado a la derecha; 3 botones en fila: minimizar, pantalla
	-- completa, cerrar. Iconos DIBUJADOS con Frames (no glifos) pa' que jamás
	-- salga el "tofu"/cuadrito; la X de cerrar sí es letra (siempre renderiza).
	-- Son TextButton → consumen el clic y no arrancan el arrastre.
	local controles = Instance.new("Frame", encabezado)
	controles.Name = "Controles"
	controles.AnchorPoint = Vector2.new(1, 0.5)
	controles.Position = UDim2.new(1, -8, 0.5, 0)
	controles.Size = UDim2.new(0, 24*3 + 6*2, 0, 24)
	controles.BackgroundTransparency = 1
	local layoutCtrl = Instance.new("UIListLayout", controles)
	layoutCtrl.FillDirection = Enum.FillDirection.Horizontal
	layoutCtrl.Padding = UDim.new(0, 6)
	layoutCtrl.SortOrder = Enum.SortOrder.LayoutOrder
	layoutCtrl.VerticalAlignment = Enum.VerticalAlignment.Center

	local function crearControl(orden, baseRole, onClick)
		local b = Instance.new("TextButton", controles)
		b.Size = UDim2.new(0, 24, 0, 24)
		b.LayoutOrder = orden
		b.AutoButtonColor = false
		b.Text = ""
		b.BorderSizePixel = 0
		b.Active = true
		b:SetAttribute("rolBase", baseRole)
		Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
		pthemed(b, "BackgroundColor3", baseRole)
		local st = Instance.new("UIStroke", b)
		st.Thickness = 1
		st.Transparency = 0.35
		pthemed(st, "Color", "border")
		b.MouseEnter:Connect(function()
			TweenService:Create(b, TweenInfo.new(0.12), { BackgroundColor3 = lighten(col(baseRole), 0.10) }):Play()
		end)
		b.MouseLeave:Connect(function()
			TweenService:Create(b, TweenInfo.new(0.16), { BackgroundColor3 = col(baseRole) }):Play()
		end)
		b.MouseButton1Click:Connect(onClick)
		return b
	end

	local minimizado, maximizado = false, false
	local NORMAL_SIZE = UDim2.new(0, ANCHO, 0, ALTO)
	local posGuardada = ventana.Position
	local function aplicarVentana(animar)
		local size, pos
		if maximizado then
			size = UDim2.new(0.96, 0, 0.92, 0)
			pos  = UDim2.new(0.02, 0, 0.04, 0)
		else
			size = NORMAL_SIZE
			pos  = posGuardada
		end
		if minimizado then
			size = UDim2.new(size.X.Scale, size.X.Offset, 0, 34)
		end
		local info = TweenInfo.new(animar == false and 0 or 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		TweenService:Create(ventana, info, { Size = size, Position = pos }):Play()
	end

	-- (1) Minimizar: barra horizontal dibujada.
	local minBtn = crearControl(1, "neutral", function()
		minimizado = not minimizado
		aplicarVentana(true)
	end)
	do
		local bar = Instance.new("Frame", minBtn)
		bar.AnchorPoint = Vector2.new(0.5, 0.5)
		bar.Position = UDim2.new(0.5, 0, 0.5, 0)
		bar.Size = UDim2.new(0, 11, 0, 2)
		bar.BorderSizePixel = 0
		Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
		pthemed(bar, "BackgroundColor3", "text")
	end

	-- (2) Pantalla completa / restaurar: cuadro dibujado (con UIStroke).
	local maxBtn = crearControl(2, "neutral", function()
		maximizado = not maximizado
		if maximizado then minimizado = false end
		aplicarVentana(true)
	end)
	do
		local box = Instance.new("Frame", maxBtn)
		box.AnchorPoint = Vector2.new(0.5, 0.5)
		box.Position = UDim2.new(0.5, 0, 0.5, 0)
		box.Size = UDim2.new(0, 12, 0, 11)
		box.BackgroundTransparency = 1
		box.BorderSizePixel = 0
		Instance.new("UICorner", box).CornerRadius = UDim.new(0, 2)
		local bst = Instance.new("UIStroke", box)
		bst.Thickness = 1.6
		pthemed(bst, "Color", "text")
	end

	-- (3) Cerrar: la X es una letra (siempre renderiza), blanca sobre rojo.
	local cerrarBtn = crearControl(3, "bad", function()
		vivo = false
		gui:Destroy()
	end)
	do
		local x = Instance.new("TextLabel", cerrarBtn)
		x.Size = UDim2.new(1, 0, 1, 0)
		x.BackgroundTransparency = 1
		x.Font = Enum.Font.GothamBold
		x.TextSize = 14
		x.Text = "X"
		x.TextColor3 = WHITE
	end

	-- ====================== BARRA DE BÚSQUEDA (estilo barra de direcciones) ======================
	local cajaBusqueda = Instance.new("TextBox", ventana)
	cajaBusqueda.Size = UDim2.new(1, -16, 0, 30)
	cajaBusqueda.Position = UDim2.new(0, 8, 0, 42)
	cajaBusqueda.PlaceholderText = "Buscar en el servidor o en todo Roblox..."
	cajaBusqueda.Font = Enum.Font.Gotham
	cajaBusqueda.TextSize = 13
	cajaBusqueda.BorderSizePixel = 0
	cajaBusqueda.ClearTextOnFocus = false
	cajaBusqueda.Text = ""
	cajaBusqueda.TextXAlignment = Enum.TextXAlignment.Left
	pthemed(cajaBusqueda, "BackgroundColor3", "input")
	pthemed(cajaBusqueda, "TextColor3", "text")
	pthemed(cajaBusqueda, "PlaceholderColor3", "subtext")
	Instance.new("UICorner", cajaBusqueda).CornerRadius = UDim.new(0, 14)

	local padBusqueda = Instance.new("UIPadding", cajaBusqueda)
	padBusqueda.PaddingLeft = UDim.new(0, 30)
	padBusqueda.PaddingRight = UDim.new(0, 8)

	-- Icono LUPA dibujado (aro + mango), temable. Antes era un label vacío.
	local lockGlyph = Instance.new("Frame", cajaBusqueda)
	lockGlyph.Name = "SearchIcon"
	lockGlyph.Size = UDim2.new(0, 16, 0, 16)
	lockGlyph.Position = UDim2.new(0, 9, 0.5, -8)
	lockGlyph.BackgroundTransparency = 1
	lockGlyph.ZIndex = 2
	do
		local ring = Instance.new("Frame", lockGlyph)
		ring.AnchorPoint = Vector2.new(0.5, 0.5)
		ring.Position = UDim2.new(0.42, 0, 0.42, 0)
		ring.Size = UDim2.fromOffset(10, 10)
		ring.BackgroundTransparency = 1
		ring.BorderSizePixel = 0
		ring.ZIndex = 2
		Instance.new("UICorner", ring).CornerRadius = UDim.new(1, 0)
		local rs = Instance.new("UIStroke", ring)
		rs.Thickness = 1.6
		pthemed(rs, "Color", "subtext")
		local handle = Instance.new("Frame", lockGlyph)
		handle.AnchorPoint = Vector2.new(0.5, 0.5)
		handle.Position = UDim2.new(0.72, 0, 0.72, 0)
		handle.Size = UDim2.fromOffset(5, 1.8)
		handle.Rotation = 45
		handle.BorderSizePixel = 0
		handle.ZIndex = 2
		Instance.new("UICorner", handle).CornerRadius = UDim.new(1, 0)
		pthemed(handle, "BackgroundColor3", "subtext")
	end

	local strokeBusqueda = Instance.new("UIStroke", cajaBusqueda)
	strokeBusqueda.Thickness = 1
	strokeBusqueda.Transparency = 0.45
	pthemed(strokeBusqueda, "Color", "border")

	-- ====================== PANEL DE SUGERENCIAS ======================
	local panelSugerencias = Instance.new("Frame", ventana)
	panelSugerencias.Size = UDim2.new(1, -16, 0, 0)
	panelSugerencias.Position = UDim2.new(0, 8, 0, 74)
	panelSugerencias.BorderSizePixel = 0
	panelSugerencias.Visible = false
	panelSugerencias.ZIndex = 5
	panelSugerencias.ClipsDescendants = true
	pthemed(panelSugerencias, "BackgroundColor3", "card")
	Instance.new("UICorner", panelSugerencias).CornerRadius = UDim.new(0, 6)

	local strokeSug = Instance.new("UIStroke", panelSugerencias)
	strokeSug.Thickness = 1
	strokeSug.Transparency = 0.4
	pthemed(strokeSug, "Color", "border")

	local listaSugerencias = Instance.new("UIListLayout", panelSugerencias)
	listaSugerencias.SortOrder = Enum.SortOrder.LayoutOrder
	listaSugerencias.Padding = UDim.new(0, 0)

	-- ====================== ÁREA DE TARJETAS ======================
	local scroll = Instance.new("ScrollingFrame", ventana)
	scroll.Size = UDim2.new(1, -8, 1, -80)
	scroll.Position = UDim2.new(0, 4, 0, 78)
	scroll.BackgroundTransparency = 0.5
	scroll.BorderSizePixel = 0
	scroll.ScrollBarThickness = 5
	scroll.ScrollingDirection = Enum.ScrollingDirection.Y
	scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	pthemed(scroll, "BackgroundColor3", "input")
	pthemed(scroll, "ScrollBarImageColor3", "scrollbar")

	local layoutLista = Instance.new("UIListLayout", scroll)
	layoutLista.Padding = UDim.new(0, 4)
	layoutLista.FillDirection = Enum.FillDirection.Vertical
	layoutLista.HorizontalAlignment = Enum.HorizontalAlignment.Center
	layoutLista.SortOrder = Enum.SortOrder.LayoutOrder

	local paddingLista = Instance.new("UIPadding", scroll)
	paddingLista.PaddingTop = UDim.new(0, 4)
	paddingLista.PaddingBottom = UDim.new(0, 4)

	local sinResultados = Instance.new("TextLabel", ventana)
	sinResultados.Size = UDim2.new(1, -20, 0, 30)
	sinResultados.Position = UDim2.new(0, 10, 0.5, -15)
	sinResultados.BackgroundTransparency = 1
	sinResultados.Font = Enum.Font.Gotham
	sinResultados.TextSize = 13
	sinResultados.Text = "No se encontraron jugadores"
	sinResultados.Visible = false
	pthemed(sinResultados, "TextColor3", "subtext")

	-- ====================== ESTADO ======================
	local tarjetas = {}       -- [Player] = { frame, userId, username, displayName, ... }
	local hayVisiblesLocal = false
	local numGlobales = 0     -- cuántos resultados globales hay pintados ahora
	local globalActivo = false -- true cuando hay sección " Roblox" en pantalla
	                           -- (declarado arriba a propósito: lo capturan
	                           --  actualizarSinResultados, crear/limpiarGlobales)

	-- ====================== ORDENAMIENTO Y SECCIONES ======================
	local function obtenerCategoriaYClave(displayName)
		if displayName == "" then return 2, "" end
		local primerCaracter = displayName:sub(1,1)
		local byte = primerCaracter:byte()
		if not byte then return 3, displayName:lower() end

		if byte >= 48 and byte <= 57 then
			return 0, displayName:lower()
		elseif (byte >= 65 and byte <= 90) or (byte >= 97 and byte <= 122) then
			return 1, displayName:lower()
		elseif byte >= 32 and byte <= 126 then
			return 2, displayName:lower()
		else
			return 3, displayName:lower()
		end
	end

	local function obtenerSeccion(displayName)
		local primerCaracter = displayName:sub(1,1)
		local byte = primerCaracter:byte()
		if not byte then return "Other" end
		if byte >= 48 and byte <= 57 then
			return "0-9"
		elseif (byte >= 65 and byte <= 90) or (byte >= 97 and byte <= 122) then
			return string.upper(primerCaracter)
		elseif byte >= 32 and byte <= 126 then
			return "#"
		else
			return "Other"
		end
	end

	local function compararJugadores(plr1, plr2)
		local datos1 = tarjetas[plr1]
		local datos2 = tarjetas[plr2]
		if not datos1 or not datos2 then return false end
		local cat1, clave1 = obtenerCategoriaYClave(datos1.displayName)
		local cat2, clave2 = obtenerCategoriaYClave(datos2.displayName)
		if cat1 ~= cat2 then return cat1 < cat2 end
		return clave1 < clave2
	end

	-- ====================== ANIMACIÓN DE BOTÓN COPIADO ======================
	local function animarCopiado(btn, textoOriginal)
		btn.Text = "✓ Copiado"
		TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundColor3 = col("good") }):Play()
		task.delay(0.9, function()
			if btn and btn.Parent then
				btn.Text = textoOriginal
				local role = btn:GetAttribute("rolBase") or "accent"
				TweenService:Create(btn, TweenInfo.new(0.25), { BackgroundColor3 = col(role) }):Play()
			end
		end)
	end

	-- Botón estándar de tarjeta (color por ROL → sincronizado con el tema).
	local function crearBotonTarjeta(parent, texto, orden, role, accion)
		local btn = Instance.new("TextButton", parent)
		btn.Size = UDim2.new(1, 0, 0, 18)
		btn.LayoutOrder = orden
		btn.Text = texto
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 10
		btn.BorderSizePixel = 0
		btn.AutoButtonColor = false
		btn:SetAttribute("rolBase", role)
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
		pthemed(btn, "BackgroundColor3", role)
		pthemed(btn, "TextColor3", "onAccent")
		btn.MouseEnter:Connect(function()
			TweenService:Create(btn, TweenInfo.new(0.12), { BackgroundColor3 = lighten(col(role), 0.08) }):Play()
		end)
		btn.MouseLeave:Connect(function()
			TweenService:Create(btn, TweenInfo.new(0.18), { BackgroundColor3 = col(role) }):Play()
		end)
		btn.MouseButton1Click:Connect(function() accion(btn, texto) end)
		return btn
	end

	-- Llama al Analyzer (si está cargado) pa' analizar a esa persona.
	local function analizarEnAnalyzer(usernameOId)
		if type(_G.NXAnalyze) == "function" then
			pcall(_G.NXAnalyze, usernameOId)
			return true
		end
		warn("[Lista] El Analyzer no está cargado (sin _G.NXAnalyze).")
		return false
	end

	-- forward declare
	local actualizarSinResultados

	-- ====================== ACTUALIZACIÓN COMPLETA DE LA LISTA (servidor) ======================
	local function actualizarLista()
		local jugadores = {}
		for plr, _ in pairs(tarjetas) do table.insert(jugadores, plr) end
		table.sort(jugadores, compararJugadores)

		local texto = cajaBusqueda.Text:lower()
		local hayFiltro = (texto ~= "")
		local jugadoresVisibles = {}
		for _, plr in ipairs(jugadores) do
			local datos = tarjetas[plr]
			if not hayFiltro
				or string.find(datos.username:lower(), texto, 1, true)
				or string.find(datos.displayName:lower(), texto, 1, true) then
				table.insert(jugadoresVisibles, plr)
			end
		end

		-- Limpiar SOLO las secciones locales (no tocar las globales)
		for _, hijo in ipairs(scroll:GetChildren()) do
			if hijo:IsA("Frame") and hijo.Name:find("^Seccion_") then
				hijo:Destroy()
			end
		end

		for plr, datos in pairs(tarjetas) do
			datos.frame.Visible = false
			datos.frame.LayoutOrder = 9999
		end

		local orden = 1
		local ultimaSeccion = nil
		for _, plr in ipairs(jugadoresVisibles) do
			local datos = tarjetas[plr]
			-- Al BUSCAR, agrupamos a los del servidor bajo un único header claro
			-- ("En este servidor"), bien dividido del bloque global " Roblox".
			-- Sin filtro, se mantienen las secciones alfabéticas de siempre.
			local seccion = hayFiltro and "En este servidor" or obtenerSeccion(datos.displayName)
			if seccion ~= ultimaSeccion then
				local header = Instance.new("Frame", scroll)
				header.Name = "Seccion_" .. seccion
				header.Size = UDim2.new(1, -16, 0, 24)
				header.BorderSizePixel = 0
				header.LayoutOrder = orden
				pthemed(header, "BackgroundColor3", "header")
				Instance.new("UICorner", header).CornerRadius = UDim.new(0, 6)

				local label = Instance.new("TextLabel", header)
				label.Size = UDim2.new(1, -16, 1, 0)
				label.Position = UDim2.new(0, 10, 0, 0)
				label.BackgroundTransparency = 1
				label.Font = Enum.Font.GothamBold
				label.TextSize = 13
				label.Text = seccion
				label.TextXAlignment = Enum.TextXAlignment.Left
				pthemed(label, "TextColor3", "accent")

				orden = orden + 1
				ultimaSeccion = seccion
			end
			datos.frame.Visible = true
			datos.frame.LayoutOrder = orden
			orden = orden + 1
		end

		hayVisiblesLocal = (#jugadoresVisibles > 0)
		actualizarSinResultados()

		local total = 0
		for _ in pairs(tarjetas) do total = total + 1 end
		if hayFiltro then
			titulo.Text = "Jugadores: " .. #jugadoresVisibles .. " / " .. total
		else
			titulo.Text = "Jugadores: " .. total
		end
	end

	function actualizarSinResultados()
		local hayFiltro = (cajaBusqueda.Text ~= "")
		local hayJugadores = (next(tarjetas) ~= nil)
		sinResultados.Visible =
			(not globalActivo) and (not hayVisiblesLocal) and (hayJugadores or hayFiltro)
	end

	-- ====================== CREAR TARJETA (jugador del servidor) ======================
	local function crearTarjeta(plr, diferir)
		if tarjetas[plr] then return end
		local userId = plr.UserId

		local tarjeta = Instance.new("Frame", scroll)
		tarjeta.Name = "Tarjeta_" .. plr.Name
		tarjeta.Size = UDim2.new(1, -16, 0, 64)
		tarjeta.BorderSizePixel = 0
		tarjeta.LayoutOrder = 0
		pthemed(tarjeta, "BackgroundColor3", "card")
		Instance.new("UICorner", tarjeta).CornerRadius = UDim.new(0, 8)

		local avatar = Instance.new("ImageLabel", tarjeta)
		avatar.Size = UDim2.new(0, 44, 0, 44)
		avatar.Position = UDim2.new(0, 10, 0.5, -22)
		avatar.Image = avatarCache[userId] or PLACEHOLDER
		avatar.BorderSizePixel = 0
		pthemed(avatar, "BackgroundColor3", "avatarBg")
		Instance.new("UICorner", avatar).CornerRadius = UDim.new(0, 22)
		cargarAvatarAsync(userId, avatar)

		local labelDisplay = Instance.new("TextLabel", tarjeta)
		labelDisplay.Size = UDim2.new(1, -100, 0, 20)
		labelDisplay.Position = UDim2.new(0, 64, 0, 10)
		labelDisplay.BackgroundTransparency = 1
		labelDisplay.Font = Enum.Font.GothamBold
		labelDisplay.TextSize = 14
		labelDisplay.Text = plr.DisplayName
		labelDisplay.TextXAlignment = Enum.TextXAlignment.Left
		labelDisplay.TextTruncate = Enum.TextTruncate.AtEnd
		pthemed(labelDisplay, "TextColor3", "text")

		local labelUser = Instance.new("TextLabel", tarjeta)
		labelUser.Size = UDim2.new(1, -100, 0, 18)
		labelUser.Position = UDim2.new(0, 64, 0, 32)
		labelUser.BackgroundTransparency = 1
		labelUser.Font = Enum.Font.Gotham
		labelUser.TextSize = 12
		labelUser.Text = "@" .. plr.Name
		labelUser.TextXAlignment = Enum.TextXAlignment.Left
		labelUser.TextTruncate = Enum.TextTruncate.AtEnd
		pthemed(labelUser, "TextColor3", "subtext")

		local columnaBotones = Instance.new("Frame", tarjeta)
		columnaBotones.Size = UDim2.new(0, 80, 0, 58)
		columnaBotones.Position = UDim2.new(1, -88, 0.5, -29)
		columnaBotones.BackgroundTransparency = 1

		local layoutBotones = Instance.new("UIListLayout", columnaBotones)
		layoutBotones.SortOrder = Enum.SortOrder.LayoutOrder
		layoutBotones.Padding = UDim.new(0, 2)

		crearBotonTarjeta(columnaBotones, "Copiar nombre", 1, "accent", function(btn, txt)
			if copiar(plr.DisplayName) then animarCopiado(btn, txt) end
		end)
		crearBotonTarjeta(columnaBotones, "Copiar usuario", 2, "accent2", function(btn, txt)
			if copiar(plr.Name) then animarCopiado(btn, txt) end
		end)
		crearBotonTarjeta(columnaBotones, "Analizar", 3, "good", function()
			analizarEnAnalyzer(plr.Name)
		end)

		local datos = {
			frame = tarjeta, userId = userId,
			labelDisplay = labelDisplay, labelUser = labelUser,
			username = plr.Name, displayName = plr.DisplayName,
		}
		tarjetas[plr] = datos

		plr:GetPropertyChangedSignal("DisplayName"):Connect(function()
			datos.displayName = plr.DisplayName
			labelDisplay.Text = plr.DisplayName
			actualizarLista()
		end)

		if not diferir then actualizarLista() end
	end

	local function eliminarTarjeta(plr)
		local datos = tarjetas[plr]
		if datos and datos.frame then
			datos.frame:Destroy()
			tarjetas[plr] = nil
			actualizarLista()
		end
	end

	-- ====================== BÚSQUEDA GLOBAL (TODO ROBLOX vía API) ======================
	local SECCION_GLOBAL = "SeccionGlobal"
	local BASE_ORDEN_GLOBAL = 100000
	local GLOBAL_MAX = 12
	local globalHeaderLabel = nil
	local busquedaGlobalId = 0
	local hiloGlobal = nil

	local function limpiarGlobales()
		for _, hijo in ipairs(scroll:GetChildren()) do
			if hijo:IsA("Frame") and (hijo.Name == SECCION_GLOBAL or hijo.Name:find("^Global_")) then
				hijo:Destroy()
			end
		end
		globalHeaderLabel = nil
		numGlobales = 0
		globalActivo = false
	end

	local function crearHeaderGlobal(texto)
		local header = Instance.new("Frame", scroll)
		header.Name = SECCION_GLOBAL
		header.Size = UDim2.new(1, -16, 0, 24)
		header.BorderSizePixel = 0
		header.LayoutOrder = BASE_ORDEN_GLOBAL
		pthemed(header, "BackgroundColor3", "header")
		Instance.new("UICorner", header).CornerRadius = UDim.new(0, 6)
		local label = Instance.new("TextLabel", header)
		label.Size = UDim2.new(1, -16, 1, 0)
		label.Position = UDim2.new(0, 10, 0, 0)
		label.BackgroundTransparency = 1
		label.Font = Enum.Font.GothamBold
		label.TextSize = 13
		label.Text = texto
		label.TextXAlignment = Enum.TextXAlignment.Left
		pthemed(label, "TextColor3", "globe")
		globalHeaderLabel = label
		globalActivo = true
	end

	-- Tarjeta de un resultado global (no es un Player del servidor).
	local function crearTarjetaGlobal(info, orden)
		local tarjeta = Instance.new("Frame", scroll)
		tarjeta.Name = "Global_" .. info.id
		tarjeta.Size = UDim2.new(1, -16, 0, 64)
		tarjeta.BorderSizePixel = 0
		tarjeta.LayoutOrder = orden
		pthemed(tarjeta, "BackgroundColor3", "card")
		Instance.new("UICorner", tarjeta).CornerRadius = UDim.new(0, 8)

		-- Filito de acento a la izquierda pa' distinguir lo global del servidor
		local marca = Instance.new("Frame", tarjeta)
		marca.Size = UDim2.new(0, 3, 1, -12)
		marca.Position = UDim2.new(0, 0, 0, 6)
		marca.BorderSizePixel = 0
		pthemed(marca, "BackgroundColor3", "globe")
		Instance.new("UICorner", marca).CornerRadius = UDim.new(0, 2)

		local avatar = Instance.new("ImageLabel", tarjeta)
		avatar.Size = UDim2.new(0, 44, 0, 44)
		avatar.Position = UDim2.new(0, 10, 0.5, -22)
		avatar.Image = avatarCache[info.id] or PLACEHOLDER
		avatar.BorderSizePixel = 0
		pthemed(avatar, "BackgroundColor3", "avatarBg")
		Instance.new("UICorner", avatar).CornerRadius = UDim.new(0, 22)
		cargarAvatarAsync(info.id, avatar)

		local labelDisplay = Instance.new("TextLabel", tarjeta)
		labelDisplay.Size = UDim2.new(1, -100, 0, 20)
		labelDisplay.Position = UDim2.new(0, 64, 0, 10)
		labelDisplay.BackgroundTransparency = 1
		labelDisplay.Font = Enum.Font.GothamBold
		labelDisplay.TextSize = 14
		labelDisplay.Text = info.displayName
		labelDisplay.TextXAlignment = Enum.TextXAlignment.Left
		labelDisplay.TextTruncate = Enum.TextTruncate.AtEnd
		pthemed(labelDisplay, "TextColor3", "text")

		local labelUser = Instance.new("TextLabel", tarjeta)
		labelUser.Size = UDim2.new(1, -100, 0, 18)
		labelUser.Position = UDim2.new(0, 64, 0, 32)
		labelUser.BackgroundTransparency = 1
		labelUser.Font = Enum.Font.Gotham
		labelUser.TextSize = 12
		labelUser.Text = "@" .. info.name
		labelUser.TextXAlignment = Enum.TextXAlignment.Left
		labelUser.TextTruncate = Enum.TextTruncate.AtEnd
		pthemed(labelUser, "TextColor3", "subtext")

		local columnaBotones = Instance.new("Frame", tarjeta)
		columnaBotones.Size = UDim2.new(0, 80, 0, 58)
		columnaBotones.Position = UDim2.new(1, -88, 0.5, -29)
		columnaBotones.BackgroundTransparency = 1
		local layoutBotones = Instance.new("UIListLayout", columnaBotones)
		layoutBotones.SortOrder = Enum.SortOrder.LayoutOrder
		layoutBotones.Padding = UDim.new(0, 2)

		crearBotonTarjeta(columnaBotones, "Copiar nombre", 1, "accent", function(btn, txt)
			if copiar(info.displayName) then animarCopiado(btn, txt) end
		end)
		crearBotonTarjeta(columnaBotones, "Copiar usuario", 2, "accent2", function(btn, txt)
			if copiar(info.name) then animarCopiado(btn, txt) end
		end)
		crearBotonTarjeta(columnaBotones, "Analizar", 3, "good", function()
			analizarEnAnalyzer(info.name)
		end)
	end

	local function buscarGlobal(textoCrudo)
		busquedaGlobalId = busquedaGlobalId + 1
		local myId = busquedaGlobalId
		if hiloGlobal then pcall(task.cancel, hiloGlobal); hiloGlobal = nil end

		local texto = (textoCrudo or ""):gsub("^%s+", ""):gsub("%s+$", "")
		if #texto < 3 then
			limpiarGlobales()
			actualizarSinResultados()
			return
		end

		limpiarGlobales()
		crearHeaderGlobal("Roblox — buscando…")
		actualizarSinResultados()

		hiloGlobal = task.delay(0.45, function()
			hiloGlobal = nil
			if myId ~= busquedaGlobalId then return end

			-- jugadores del servidor → se excluyen de "Roblox" (ya salen arriba)
			local enServidor = {}
			for plr, _ in pairs(tarjetas) do enServidor[plr.UserId] = true end

			-- acumulador con dedupe; marcamos los EXACTOS pa' subirlos arriba
			local resultados, vistos = {}, {}
			local function add(u, exacto)
				local id = u and u.id
				if not id or enServidor[id] or vistos[id] then return end
				vistos[id] = true
				table.insert(resultados, {
					id = id,
					name = u.name or u.requestedUsername or "?",
					displayName = u.displayName or u.name or "?",
					exacto = exacto and true or false,
				})
			end

			-- 1) EXACTO por username (POST, sin sesión): encuentra el nombre tal cual
			local exactData = apiPost("https://users.roblox.com/v1/usernames/users", {
				usernames = { texto }, excludeBannedUsers = false,
			})
			if myId ~= busquedaGlobalId then return end
			if exactData and type(exactData.data) == "table" then
				for _, u in ipairs(exactData.data) do add(u, true) end
			end

			-- 2) DIFUSO por keyword (GET): coincidencias parciales en todo Roblox
			-- FIX (2026-07-26): Roblox solo acepta limit = 10, 25, 50 o 100. Con
			-- GLOBAL_MAX (12) la petición salía 400 y la búsqueda global entera
			-- estaba muerta. Se pide 25 y se recorta a GLOBAL_MAX al añadir.
			local url = "https://users.roblox.com/v1/users/search?keyword="
				.. HttpService:UrlEncode(texto) .. "&limit=25"
			local data = apiGet(url)
			if myId ~= busquedaGlobalId then return end
			if data and type(data.data) == "table" then
				for _, u in ipairs(data.data) do
					if #resultados >= GLOBAL_MAX then break end
					add(u, false)
				end
			end

			-- exactos primero, luego el resto (orden estable)
			table.sort(resultados, function(a, b)
				if a.exacto ~= b.exacto then return a.exacto end
				return false
			end)

			limpiarGlobales()
			if #resultados == 0 then
				if not exactData and not data then
					crearHeaderGlobal("Roblox — sin conexión a la API")
				else
					crearHeaderGlobal("Roblox — sin resultados")
				end
				numGlobales = 0
			else
				crearHeaderGlobal("Roblox (" .. #resultados .. ")")
				local orden = BASE_ORDEN_GLOBAL + 1
				for _, u in ipairs(resultados) do
					crearTarjetaGlobal(u, orden)
					orden = orden + 1
				end
				numGlobales = #resultados
			end
			actualizarSinResultados()
		end)
	end

	-- ====================== SUGERENCIAS (locales del servidor) ======================
	local function limpiarSugerencias()
		for _, hijo in ipairs(panelSugerencias:GetChildren()) do
			if hijo:IsA("TextButton") then hijo:Destroy() end
		end
	end

	local function mostrarSugerencias(texto)
		limpiarSugerencias()
		if texto == "" then panelSugerencias.Visible = false; return end

		local busqueda = texto:lower()
		local coincidencias = {}
		for plr, datos in pairs(tarjetas) do
			local idxUser    = string.find(datos.username:lower(),    busqueda, 1, true)
			local idxDisplay = string.find(datos.displayName:lower(), busqueda, 1, true)
			if idxUser or idxDisplay then
				local prioridad = math.min(idxUser or 999, idxDisplay or 999)
				table.insert(coincidencias, { plr = plr, datos = datos, prioridad = prioridad })
			end
		end
		if #coincidencias == 0 then panelSugerencias.Visible = false; return end
		table.sort(coincidencias, function(a, b) return a.prioridad < b.prioridad end)

		local maxMostrar = math.min(#coincidencias, 5)
		local ALTO_FILA = 28
		for i = 1, maxMostrar do
			local datos = coincidencias[i].datos
			local fila = Instance.new("TextButton", panelSugerencias)
			fila.Size = UDim2.new(1, 0, 0, ALTO_FILA)
			fila.BackgroundTransparency = 1
			fila.Text = ""
			fila.AutoButtonColor = false
			fila.BorderSizePixel = 0
			fila.LayoutOrder = i
			fila.ZIndex = 6
			pthemed(fila, "BackgroundColor3", "neutral")

			local txt = Instance.new("TextLabel", fila)
			txt.Size = UDim2.new(1, -16, 1, 0)
			txt.Position = UDim2.new(0, 10, 0, 0)
			txt.BackgroundTransparency = 1
			txt.Font = Enum.Font.Gotham
			txt.TextSize = 12
			txt.Text = datos.displayName .. "  ·  @" .. datos.username
			txt.TextXAlignment = Enum.TextXAlignment.Left
			txt.TextTruncate = Enum.TextTruncate.AtEnd
			txt.ZIndex = 7
			pthemed(txt, "TextColor3", "text")

			fila.MouseEnter:Connect(function()
				TweenService:Create(fila, TweenInfo.new(0.1), { BackgroundTransparency = 0 }):Play()
			end)
			fila.MouseLeave:Connect(function()
				TweenService:Create(fila, TweenInfo.new(0.15), { BackgroundTransparency = 1 }):Play()
			end)
			fila.MouseButton1Click:Connect(function()
				cajaBusqueda.Text = datos.username
				panelSugerencias.Visible = false
				actualizarLista()
			end)
		end

		panelSugerencias.Size = UDim2.new(1, -16, 0, maxMostrar * ALTO_FILA)
		panelSugerencias.Visible = true
	end

	-- ====================== EVENTOS DEL CAMPO DE BÚSQUEDA ======================
	cajaBusqueda:GetPropertyChangedSignal("Text"):Connect(function()
		actualizarLista()
		mostrarSugerencias(cajaBusqueda.Text)
		buscarGlobal(cajaBusqueda.Text)
	end)

	cajaBusqueda.FocusLost:Connect(function()
		task.delay(0.15, function()
			if panelSugerencias and panelSugerencias.Parent then
				panelSugerencias.Visible = false
			end
		end)
	end)

	-- ====================== EVENTOS DE JUGADORES ======================
	Players.PlayerAdded:Connect(function(plr) crearTarjeta(plr) end)
	Players.PlayerRemoving:Connect(function(plr) eliminarTarjeta(plr) end)

	-- ====================== ARRASTRE (mouse + táctil) ======================
	local arrastrando, inicioInput, inicioPos = false, nil, nil
	local function esInputArrastre(input)
		return input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch
	end
	local function esMovimientoArrastre(input)
		return input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch
	end

	encabezado.InputBegan:Connect(function(input)
		if esInputArrastre(input) then
			arrastrando = true
			inicioInput = input.Position
			inicioPos = ventana.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					arrastrando = false
				end
			end)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if arrastrando and esMovimientoArrastre(input) then
			local delta = input.Position - inicioInput
			ventana.Position = UDim2.new(
				inicioPos.X.Scale, inicioPos.X.Offset + delta.X,
				inicioPos.Y.Scale, inicioPos.Y.Offset + delta.Y
			)
			-- recordar la posición normal pa' restaurar desde pantalla completa
			if not maximizado then posGuardada = ventana.Position end
		end
	end)

	-- ====================== INICIALIZACIÓN ======================
	for _, plr in ipairs(Players:GetPlayers()) do
		crearTarjeta(plr, true)
	end
	actualizarLista()

	-- ====================== DOCKING (ancla la Lista a la derecha del Analyzer) ======================
	-- Lee la posición/tamaño REAL del Analyzer al primer frame y se pega a su
	-- derecha con un gap. Defensivo: reintenta una vez si AbsoluteSize aún no
	-- está calculado (ejecutores lentos). Si el Analyzer no está cargado, se
	-- queda con el fallback inicial (posición fija a la derecha del centro).
	local DOCK_GAP = 8
	local function dockNextToAnalyzer()
		local agui = playerGui:FindFirstChild("UtilityPanel")
		local awin = agui and agui:FindFirstChild("main")
		if not awin then return false end
		local size = awin.AbsoluteSize
		if size.X <= 0 or size.Y <= 0 then return false end   -- aún no calculado
		local pos = awin.AbsolutePosition
		ventana.Position = UDim2.fromOffset(pos.X + size.X + DOCK_GAP, pos.Y)
		posGuardada = ventana.Position
		return true
	end
	task.defer(function()
		if not dockNextToAnalyzer() then
			task.wait(0.1)
			dockNextToAnalyzer()   -- segundo intento, sin drama si tampoco entra
		end
	end)

	print("[Lista de Jugadores v2.4] Cargada · colores sincronizados + controles navegador.")
end)()

-- ╔══════════════════════════════════════════════════════════════════════╗
