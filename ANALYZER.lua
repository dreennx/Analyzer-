--[[
   Roblox Public Profile Analyzer  v3.3.0
   ---------------------------------------------------------------
   Cambios en v3.3.0 (sobre v3.2.5):
     • INTEGRACIÓN NX Head Tags (Fase 1 · coexistencia segura). El módulo
       "NX Head Tag System V2" (BillboardGui de roles sobre las cabezas) se
       pega VERBATIM al final de este archivo, en su propio bloque do...end
       (solo expone el global _G.NXHeadTags). No se modifica su lógica.
       Este Analyzer NO toca sus internos: solo lo enciende/apaga por su
       API pública (_G.NXHeadTags.SetEnabled) desde un toggle en Ajustes.
       - Nuevo: preferencia persistente store.headTags (on/off), recordada
         entre sesiones en el mismo archivo de guardado.
       - Nuevo: tarjeta "🏷️ NX Head Tags" en la pestaña Ajustes con un
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
       direcciones (forma de píldora, candado 🔒 a la izquierda y texto
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
local SAVE_FILE = "ProfileAnalyzer_data.json"
local hasFS = (type(writefile) == "function")
	and (type(readfile) == "function")
	and (type(isfile) == "function")

local store = { theme = "negro", headTags = true, animations = true }

local function saveStore()
	if not hasFS then return end
	pcall(function() writefile(SAVE_FILE, HttpService:JSONEncode(store)) end)
end

local function loadStore()
	if not hasFS then return end
	pcall(function()
		if isfile(SAVE_FILE) then
			local ok, decoded = pcall(function() return HttpService:JSONDecode(readfile(SAVE_FILE)) end)
			if ok and type(decoded) == "table" then
				store.theme = decoded.theme or "negro"
				if type(decoded.headTags) == "boolean" then store.headTags = decoded.headTags end
				if type(decoded.animations) == "boolean" then store.animations = decoded.animations end
			end
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
applyTheme(store.theme)

-- ====================== SISTEMA DE TEMA EN VIVO ======================
-- Cada elemento se registra con su "rol" de color. Al cambiar de tema,
-- repaint() recorre el registro y actualiza todo al instante (sin reabrir).
local roleMap = {}
local function themed(inst, prop, role)
	table.insert(roleMap, { inst = inst, prop = prop, role = role })
	pcall(function() inst[prop] = C[role] end)
	return inst
end

local repaintExtra = {}  -- funciones extra a llamar en cada repaint (casos especiales)
local function onRepaint(fn) table.insert(repaintExtra, fn) end

local function repaint()
	for _, e in ipairs(roleMap) do
		if e.inst then
			pcall(function() e.inst[e.prop] = C[e.role] end)
		end
	end
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
local GUI_NAME = "UtilityPanel"
for _, child in ipairs(playerGui:GetChildren()) do
	if child:IsA("ScreenGui") and child.Name == GUI_NAME then
		child:Destroy()
	end
end

-- ====================== HTTP ROBUSTO ======================
local httpRequest = (syn and syn.request) or http_request or request or (http and http.request)
local clipboard = setclipboard or (syn and syn.write_clipboard) or toclipboard or function() end

local function rawGet(url)
	local body, statusCode
	if httpRequest then
		local ok, res = pcall(httpRequest, { Url = url, Method = "GET" })
		if ok and res then
			body = res.Body
			statusCode = res.StatusCode
		else
			return nil, "connection_failure"
		end
	end
	if not body then
		local ok, res = pcall(function() return game:HttpGet(url) end)
		if ok then body = res; statusCode = nil end
	end
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
-- Estructura esperada:  { "8396392068": { "tag": "NX OWNER", "color": "cyan", "icon": "👑" } }
local NX_TAGS_URL = "https://raw.githubusercontent.com/dreennx/nx-tags/refs/heads/main/tags.json"
local nxTags = nil           -- nil = aún no cargado; tabla = listo (puede estar vacía)
local nxLoading = false

local function loadNXTags()
	if nxTags ~= nil or nxLoading then return end
	nxLoading = true
	task.spawn(function()
		local body = rawGet(NX_TAGS_URL)        -- usa el GET crudo del script (con fallback)
		local parsed = {}
		if body then
			pcall(function()
				local decoded = HttpService:JSONDecode(body)
				if type(decoded) == "table" then parsed = decoded end
			end)
		end
		nxTags = parsed                          -- nunca queda en nil: evita reintentos infinitos
		nxLoading = false
	end)
end

-- Convierte el nombre de color del JSON a Color3. Acepta nombres comunes o hex "#RRGGBB".
local NX_COLORS = {
	cyan = Color3.fromRGB(0, 229, 255),  red = Color3.fromRGB(255, 76, 76),
	green = Color3.fromRGB(80, 220, 120), blue = Color3.fromRGB(80, 150, 255),
	yellow = Color3.fromRGB(255, 214, 64), orange = Color3.fromRGB(255, 150, 40),
	purple = Color3.fromRGB(180, 110, 255), pink = Color3.fromRGB(255, 110, 200),
	white = Color3.fromRGB(245, 245, 245), gold = Color3.fromRGB(255, 196, 64),
	gray = Color3.fromRGB(170, 170, 170), grey = Color3.fromRGB(170, 170, 170),
	black = Color3.fromRGB(30, 30, 30),
}
local function nxColor(name)
	if type(name) == "string" then
		local hex = name:match("^#?(%x%x%x%x%x%x)$")
		if hex then
			return Color3.fromRGB(tonumber(hex:sub(1, 2), 16),
				tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16))
		end
		local c = NX_COLORS[name:lower()]
		if c then return c end
	end
	return NX_COLORS.cyan      -- por defecto
end

-- Devuelve { tag, icon, color(Color3) } para un userId, o nil si no tiene tag.
local function getNXTag(userId)
	if type(nxTags) ~= "table" then return nil end
	local entry = nxTags[tostring(userId)]
	if type(entry) ~= "table" then return nil end
	local tagText = entry.tag or entry.text or ""
	if tagText == "" and (entry.icon == nil or entry.icon == "") then return nil end
	return { tag = tagText, icon = entry.icon or "", color = nxColor(entry.color) }
end

loadNXTags()      -- precarga al iniciar (no bloquea: corre en segundo plano)

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
local MAX_RETRIES = 2

local function getUserIdByName(name)
	for attempt = 1, MAX_RETRIES + 1 do
		local data, status = apiPost("https://users.roblox.com/v1/usernames/users", {
			usernames = { name }, excludeBannedUsers = false,
		})
		if data and data.data and data.data[1] then
			return data.data[1].id, data.data[1].name, nil
		end
		if status == 200 and data then return nil, nil, "not_found" end
		if attempt <= MAX_RETRIES then task.wait(1) end
	end

	for attempt = 1, MAX_RETRIES + 1 do
		local s, status = apiGet("https://users.roblox.com/v1/users/search?keyword="
			.. HttpService:UrlEncode(name) .. "&limit=1")
		if s and s.data then
			if s.data[1] then
				if s.data[1].name:lower() == name:lower() then
					return s.data[1].id, s.data[1].name, nil
				else
					return nil, nil, "api_error"
				end
			else
				return nil, nil, "not_found"
			end
		elseif status == 200 then
			return nil, nil, "not_found"
		end
		if attempt <= MAX_RETRIES then task.wait(1) end
	end
	return nil, nil, "api_error"
end

local avatarCache = {}
local function getAvatar(userId)
	if avatarCache[userId] then return avatarCache[userId] end
	local ok, thumb = pcall(function()
		return Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	end)
	local img = (ok and thumb ~= "" and thumb) or "rbxassetid://0"
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
		return "Premium / Plus ⭐"
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
		return "🎮 Jugando" .. (loc and (": " .. loc) or ""), C.good, placeId, gameId, t
	elseif t == 3 then
		return "🏗️ En Studio", C.warn, nil, nil, t
	elseif t == 1 then
		return "🟢 Online" .. (loc and (" (" .. loc .. ")") or " (web/app)"), C.good, nil, nil, t
	else
		return "⚫ Offline", C.subtext, nil, nil, t
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
		local resp = apiPost("https://catalog.roblox.com/v1/catalog/items/details", { items = ids })
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
local function getRAP(userId)
	local data = apiGet("https://www.rolimons.com/playerapi/player/" .. userId)
	if not data then return nil end
	if data.success == false then return nil end
	return {
		rap = data.value or data.rap,
		premium = data.premium,
	}
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
		add(-penalty, "⚠️ Cuenta antigua sin actividad (-" .. penalty .. ")")
	end

	score = math.clamp(score, 0, 100)
	local label, color = "Bajo", C.bad
	if score >= 70 then label, color = "Alto", C.good
	elseif score >= 40 then label, color = "Medio", C.warn end
	return score, label, color, reasons
end

-- ====================== AMIGOS EN COMÚN ======================
local function getMutualFriends(userId)
	if userId == player.UserId then return nil end
	local mine = apiGet("https://friends.roblox.com/v1/users/" .. player.UserId .. "/friends")
	local theirs = apiGet("https://friends.roblox.com/v1/users/" .. userId .. "/friends")
	if not mine or not mine.data or not theirs or not theirs.data then return nil end
	local mySet = {}
	for _, f in ipairs(mine.data) do mySet[f.id] = true end
	local mutual = {}
	for _, f in ipairs(theirs.data) do
		if mySet[f.id] then
			table.insert(mutual, f.displayName or f.name)
		end
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
local profileCache = {}

local function gatherData(userId)
	local profile = apiGet("https://users.roblox.com/v1/users/" .. userId)
	if not profile then return nil end

	local createdDate, accountAge, accountAgeDays, accountAgeYears = formatAge(profile.created)

	local results = {}
	local pending = 7

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
	task_fetch("Favorites",    function() return countPaged("https://games.roblox.com/v2/users/" .. userId .. "/favorite/games") end)
	task_fetch("CreatedGames", function() return countPaged("https://games.roblox.com/v2/users/" .. userId .. "/games") end)

	local started = os.clock()
	while pending > 0 and (os.clock() - started) < 15 do
		task.wait(0.05)
	end

	-- Presencia (estado en tiempo real)
	local presText, presColor, presPlaceId, presGameId, presType = getPresence(userId)

	return {
		UserId         = userId,
		ProfileUrl     = "https://www.roblox.com/users/" .. userId .. "/profile",
		Username       = profile.name,
		DisplayName    = profile.displayName or profile.name,
		Description    = (profile.description ~= "" and profile.description) or "Sin descripción",
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
		AvatarUrl      = getAvatar(userId),
		Friends        = results.Friends,
		Followers      = results.Followers,
		Following      = results.Following,
		Groups         = results.Groups,
		Badges         = results.Badges,
		Favorites      = results.Favorites,
		CreatedGames   = results.CreatedGames,
	}
end

-- ====================== GUI ======================
local gui = Instance.new("ScreenGui")
gui.Name = GUI_NAME
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.Parent = playerGui

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
local function setHidden(h)
	guiHidden = h
	gui.Enabled = not h
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

-- ====================== VENTANA ======================
local MIN_W, MIN_H = 420, 360   -- tamaño mínimo al redimensionar
local main = Instance.new("Frame")
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
local SHADOW_PAD = 11   -- pegada al UI (antes 22): la sombra abraza el borde.
local windowShadow = Instance.new("ImageLabel")
windowShadow.Name = "WindowShadow"
windowShadow.Active = false
windowShadow.BackgroundTransparency = 1
windowShadow.Image = "rbxassetid://1316045217"
windowShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
windowShadow.ImageTransparency = 0.62   -- más sutil (antes 0.42).
windowShadow.ScaleType = Enum.ScaleType.Slice
windowShadow.SliceCenter = Rect.new(10, 10, 118, 118)
windowShadow.ZIndex = 0
windowShadow.Parent = gui
local function syncWindowShadow()
	windowShadow.Size = main.Size + UDim2.fromOffset(SHADOW_PAD * 2, SHADOW_PAD * 2)
	windowShadow.Position = main.Position - UDim2.fromOffset(SHADOW_PAD, SHADOW_PAD)
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

-- ====================== CONTROLES ESTILO macOS / Tor ======================
-- Los tres "circulitos" arriba a la izquierda, como el navegador en Mac:
--   rojo = cerrar · amarillo = ocultar (minimizar) · verde = maximizar.
-- En reposo se ven lisos; al pasar el cursor por encima aparece su símbolo.

-- Maximizar/restaurar: guarda el tamaño/posición previos y alterna a ~90%
-- de la pantalla. Vuelve a su tamaño original al pulsar de nuevo.
local maximized, prevSize, prevPos = false, nil, nil
local function toggleMaximize()
	if maximized then
		if prevSize then main.Size = prevSize end
		if prevPos then main.Position = prevPos end
		maximized = false
	else
		prevSize, prevPos = main.Size, main.Position
		local cam = workspace.CurrentCamera
		local vp = (cam and cam.ViewportSize) or Vector2.new(1280, 720)
		local w = math.max(MIN_W, math.floor(vp.X * 0.9))
		local h = math.max(MIN_H, math.floor(vp.Y * 0.9))
		main.Size = UDim2.new(0, w, 0, h)
		main.Position = UDim2.new(0.5, -w/2, 0.5, -h/2)
		maximized = true
	end
end

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

-- rojo / amarillo / verde, espaciados a la izquierda (como en macOS/Tor)
makeTrafficLight(14, Color3.fromRGB(255, 95, 86),  "×", function() gui:Destroy() end)
makeTrafficLight(34, Color3.fromRGB(255, 189, 46), "–", function() setHidden(true) end)
makeTrafficLight(54, Color3.fromRGB(39, 201, 63),  "+", function() toggleMaximize() end)

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

-- Candado a la izquierda, look de barra de direcciones de navegador.
local lockGlyph = Instance.new("TextLabel", searchFrame)
lockGlyph.Size = UDim2.new(0, 16, 0, 28)
lockGlyph.Position = UDim2.new(0, 7, 0, 0)
lockGlyph.BackgroundTransparency = 1
lockGlyph.Text = "🔒"
lockGlyph.Font = Enum.Font.Gotham
lockGlyph.TextSize = 11
lockGlyph.TextColor3 = C.subtext
lockGlyph.ZIndex = 2
themed(lockGlyph, "TextColor3", "subtext")

local SUG_MAX = 5
local suggestionFrame = Instance.new("Frame", searchFrame)
suggestionFrame.Name = "Suggestions"
suggestionFrame.Size = UDim2.new(0, 200, 0, 0)
suggestionFrame.Position = UDim2.new(0, 0, 0, 32)
suggestionFrame.BackgroundColor3 = C.input
suggestionFrame.BorderSizePixel = 0
suggestionFrame.Visible = false
suggestionFrame.ZIndex = 10
suggestionFrame.AutomaticSize = Enum.AutomaticSize.Y
Instance.new("UICorner", suggestionFrame).CornerRadius = UDim.new(0, 6)
local sugStroke = Instance.new("UIStroke", suggestionFrame)
sugStroke.Color = C.accent
sugStroke.Transparency = 0.7
local suggestionList = Instance.new("UIListLayout", suggestionFrame)
suggestionList.Padding = UDim.new(0, 2)

local analyze

local suggestionItems = {}
local function ensureSuggestionItem(idx)
	local item = suggestionItems[idx]
	if item then return item end
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -4, 0, 28)
	btn.BackgroundColor3 = C.neutral
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 13
	btn.TextColor3 = C.text
	btn.BorderSizePixel = 0
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.LayoutOrder = idx
	btn.Visible = false
	btn.ZIndex = 11
	btn.Parent = suggestionFrame
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
	suggestionItems[idx] = { button = btn, userName = "" }
	track(btn.MouseButton1Click:Connect(function()
		local data = suggestionItems[idx]
		if data and data.userName ~= "" then
			searchBox.Text = data.userName
			for _, it in ipairs(suggestionItems) do it.button.Visible = false end
			suggestionFrame.Visible = false
			if analyze then analyze(data.userName) end
		end
	end))
	return suggestionItems[idx]
end

local function hideAllSuggestions()
	for _, item in ipairs(suggestionItems) do
		item.button.Visible = false
		item.userName = ""
	end
	suggestionFrame.Visible = false
end

local function showSuggestions(entries)
	if not entries or #entries == 0 then hideAllSuggestions(); return end
	local shown = math.min(#entries, SUG_MAX)
	for i = 1, SUG_MAX do
		local item = ensureSuggestionItem(i)
		if i <= shown then
			local u = entries[i]
			item.userName = u.name
			item.button.Text = (u.displayName or u.name) .. " (@" .. u.name .. ")"
			item.button.Visible = true
		else
			item.button.Visible = false
			item.userName = ""
		end
	end
	suggestionFrame.Visible = true
end

local suggestThread
local suggestRequestId = 0
local lastSuggestText = ""

track(searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local txt = searchBox.Text:gsub("%s", "")
	if txt == lastSuggestText then return end
	lastSuggestText = txt
	suggestRequestId = suggestRequestId + 1
	local myId = suggestRequestId
	if suggestThread then pcall(task.cancel, suggestThread); suggestThread = nil end
	if #txt < 3 then hideAllSuggestions(); return end
	suggestThread = task.delay(0.5, function()
		suggestThread = nil
		if myId ~= suggestRequestId then return end
		local url = "https://users.roblox.com/v1/users/search?keyword="
			.. HttpService:UrlEncode(txt) .. "&limit=" .. SUG_MAX
		local data = apiGet(url)
		if myId ~= suggestRequestId then return end
		if data and data.data then showSuggestions(data.data) else hideAllSuggestions() end
	end)
end))

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
statusLabel.Text = "Tip: [RShift] oculta/muestra"
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.TextTruncate = Enum.TextTruncate.AtEnd
themed(statusLabel, "TextColor3", "subtext")

-- ====================== PESTAÑAS ======================
local tabBar = Instance.new("ScrollingFrame", main)
tabBar.Size = UDim2.new(1, -20, 0, 26)
tabBar.Position = UDim2.new(0, 10, 0, 78)
tabBar.BackgroundTransparency = 1
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
content.Size = UDim2.new(1, -20, 1, -116)
content.Position = UDim2.new(0, 10, 0, 106)
content.BackgroundTransparency = 1

local tabs, pages = {}, {}
local tabByPage = {}      -- page -> botón (para activar una pestaña por código)
local onShowByPage = {}   -- page -> callback opcional al mostrarse (carga perezosa)
local activeTab = nil
local function paintTabs()
	for _, t in ipairs(tabs) do
		if t == activeTab then
			t.BackgroundColor3 = C.accent
			t.TextColor3 = C.onAccent
		else
			t.BackgroundColor3 = C.neutral
			t.TextColor3 = C.text
		end
	end
end
onRepaint(paintTabs)

-- Muestra una pestaña por código (la usa el Explorador para saltar a "Perfil").
local function showPage(page)
	for _, p in pairs(pages) do p.Visible = false end
	page.Visible = true
	-- transición chill: la pestaña entra deslizándose un pelín hacia arriba.
	if ANIM.enabled then
		page.Position = UDim2.new(0, 0, 0, 10)
		motionTween(page, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{ Position = UDim2.new(0, 0, 0, 0) })
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
	btn.Size = UDim2.new(0, 92, 0, 24)
	btn.LayoutOrder = #tabs
	btn.BackgroundColor3 = C.neutral
	btn.Text = name
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 13
	btn.TextColor3 = C.text
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
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
	local ok = pcall(function() GuiService:OpenBrowserWindow(url) end)
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
local function addDescription(parent, text)
	text = tostring(text or "Sin descripción")

	local card = Instance.new("Frame", parent)
	card.Size = UDim2.new(1, -4, 0, 0)
	card.AutomaticSize = Enum.AutomaticSize.Y
	card.BackgroundColor3 = C.card
	card.BorderSizePixel = 0
	card.ClipsDescendants = true
	Instance.new("UICorner", card).CornerRadius = UDim.new(0, 4)
	local pad = Instance.new("UIPadding", card)
	pad.PaddingTop = UDim.new(0, 8); pad.PaddingBottom = UDim.new(0, 8)
	pad.PaddingLeft = UDim.new(0, 10); pad.PaddingRight = UDim.new(0, 10)
	local layout = Instance.new("UIListLayout", card)
	layout.Padding = UDim.new(0, 4)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	local head = Instance.new("TextLabel", card)
	head.LayoutOrder = 0
	head.Size = UDim2.new(1, 0, 0, 18)
	head.BackgroundTransparency = 1
	head.Font = Enum.Font.GothamBold
	head.TextSize = 13
	head.TextColor3 = C.subtext
	head.Text = "Descripción"
	head.TextXAlignment = Enum.TextXAlignment.Left

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
		Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 4)
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
local function resolveNames(ids)
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
	local copyBtn = Instance.new("TextButton", body)
	copyBtn.LayoutOrder = 3
	copyBtn.Size = UDim2.new(0, 170, 0, 28)
	copyBtn.BackgroundColor3 = C.accent
	copyBtn.Text = "Copiar usuario"
	copyBtn.Font = Enum.Font.GothamBold
	copyBtn.TextSize = 13
	copyBtn.TextColor3 = C.onAccent
	copyBtn.BorderSizePixel = 0
	copyBtn.ZIndex = 72
	Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 6)
	copyBtn.MouseButton1Click:Connect(function()
		clipboard(resolvedUser)
		copyBtn.Text = "✓ Copiado"
		task.delay(1.1, function() if copyBtn and copyBtn.Parent then copyBtn.Text = "Copiar usuario" end end)
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
			descLbl.Text = (prof.description and prof.description ~= "" and prof.description) or "Sin descripción"
			verVal.Text = prof.hasVerifiedBadge and "Sí" or "No"
			local _, ageLabel = formatAge(prof.created)
			ageVal.Text = ageLabel or "No disponible"
		else
			descLbl.Text = "No se pudo cargar la info."
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
				err.Text = "No disponible (lista privada o falló la API)."
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
local function getFriendStatus(targetId)
	local d = apiGet("https://friends.roblox.com/v1/users/" .. player.UserId
		.. "/friends/statuses?userIds=" .. targetId)
	if d and d.data and d.data[1] and d.data[1].status then
		return d.data[1].status
	end
	return nil
end

-- Botón de solicitud de amistad con: verificación previa del estado (ya amigo /
-- pendiente / recibida), UN SOLO USO (anti-spam, no repite peticiones), estados
-- de color (tema/amarillo/verde/rojo) y mensajes de error claros.
local function buildFriendButton(parent, targetId, order)
	local frame = Instance.new("Frame", parent)
	frame.LayoutOrder = order
	frame.Size = UDim2.new(1, -4, 0, 32)
	frame.BackgroundTransparency = 1

	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.BackgroundColor3 = C.neutral
	btn.Text = "Comprobando estado..."
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.TextColor3 = C.text
	btn.AutoButtonColor = false
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

	local locked = true   -- bloqueado hasta conocer el estado (evita spam)
	local function setState(text, bg, fg, clickable)
		btn.Text = text
		motionTween(btn, TweenInfo.new(0.15), { BackgroundColor3 = bg })
		btn.TextColor3 = fg or C.onAccent
		btn.AutoButtonColor = clickable and true or false
		locked = not clickable
	end

	-- verificación previa del estado de amistad
	task.spawn(function()
		local status = getFriendStatus(targetId)
		if not frame.Parent then return end
		if status == "Friends" then
			setState("✓ Ya son amigos", C.good, C.onAccent, false)
		elseif status == "RequestSent" then
			setState("Pendiente", C.warn, C.onAccent, false)
		elseif status == "RequestReceived" then
			setState("➕ Aceptar solicitud", C.accent, C.onAccent, true)
		else
			setState("➕ Enviar solicitud de amistad", C.accent, C.onAccent, true)
		end
	end)

	btn.MouseButton1Click:Connect(function()
		if locked then return end                 -- un solo uso / sin clics múltiples
		setState("Enviando...", C.warn, C.onAccent, false)
		task.spawn(function()
			local body, statusCode, errs = postAuth(
				"https://friends.roblox.com/v1/users/" .. targetId .. "/request-friendship", {})
			if not frame.Parent then return end
			local code = tonumber(statusCode)
			local ok = (code == 200) and (type(body) ~= "table" or body.success ~= false)

			-- fallback en-juego si la vía web falla y el usuario está en tu servidor
			if not ok then
				local fb = false
				pcall(function()
					local target = Players:GetPlayerByUserId(targetId)
					if target then player:RequestFriendship(target); fb = true end
				end)
				if fb then ok = true end
			end

			if ok then
				setState("✓ Solicitud enviada", C.good, C.onAccent, false)
				statusLabel.Text = "Solicitud de amistad enviada correctamente."
				return
			end

			-- ---- manejo de errores claro ----
			local errMsg = (errs and errs[1] and errs[1].message) or ""
			local low = errMsg:lower()
			if statusCode == "no_http_request" then
				setState("✕ No disponible", C.bad, C.onAccent, false)
				statusLabel.Text = "Tu executor no permite enviar solicitudes (sin 'request')."
			elseif statusCode == "connection_failure" then
				setState("✕ Error de red — reintentar", C.bad, C.onAccent, true)
				statusLabel.Text = "Error de red al enviar la solicitud. Reintenta."
			elseif code == 429 then
				setState("✕ Límite — reintentar", C.bad, C.onAccent, true)
				statusLabel.Text = "Demasiadas solicitudes (límite de Roblox). Espera un poco."
			elseif code == 401 then
				setState("✕ Sin sesión", C.bad, C.onAccent, false)
				statusLabel.Text = "El executor no envía tu sesión; Roblox rechazó la solicitud."
			elseif low:find("already") or low:find("friend") then
				setState("✓ Ya enviada / amigos", C.good, C.onAccent, false)
				statusLabel.Text = "Ya son amigos o ya existía una solicitud."
			elseif low:find("privacy") or low:find("not authorized") or low:find("cannot") or low:find("can't") then
				setState("✕ No acepta solicitudes", C.bad, C.onAccent, false)
				statusLabel.Text = "Este usuario no acepta solicitudes (configuración de privacidad)."
			else
				setState("✕ Error — reintentar", C.bad, C.onAccent, true)
				statusLabel.Text = "No se pudo enviar" ..
					((errMsg ~= "") and (": " .. errMsg) or (" (código " .. tostring(statusCode) .. ")."))
			end
		end)
	end)

	return frame
end

local currentData = nil

local function render(data, skipEntrance)
	clearScroll(profileScroll)
	clearScroll(statsScroll)
	clearScroll(itemsScroll)
	clearScroll(analysisScroll)
	currentData = data
	if not data then return end

	-- Animación de entrada: la pestaña visible entra deslizándose suave al cargar
	-- un perfil nuevo (chill). No se reproduce al re-pintar por cambio de tema.
	if ANIM.enabled and not skipEntrance then
		for _, pg in ipairs({ profilePage, statsPage, itemsPage, analysisPage }) do
			if pg.Visible then
				pg.Position = UDim2.new(0, 0, 0, 12)
				motionTween(pg, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
					{ Position = UDim2.new(0, 0, 0, 0) })
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
	viewCharBtn.Text = "👤 Ver avatar"
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
	local nxLabel = Instance.new("TextLabel", nxChip)
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
			nxLabel.Text = ((t.icon ~= "" and (t.icon .. " ")) or "") .. t.tag
			nxLabel.TextColor3 = t.color
			nxStroke.Color = t.color
			nxStroke.Transparency = 0.25
			nxChip.BackgroundTransparency = 0.15
			nxChip.Visible = true
			avatarFrame.Size = UDim2.new(1, -4, 0, 232)   -- hueco para el chip
		end
		local now = getNXTag(data.UserId)
		if now then
			applyTag(now)
		elseif nxTags == nil then
			-- el JSON aún se está descargando: aplica cuando esté listo
			task.spawn(function()
				local tries = 0
				while nxTags == nil and tries < 40 do task.wait(0.1); tries = tries + 1 end
				applyTag(getNXTag(renderedFor))
			end)
		end
	end

	-- Botón "Enviar solicitud de amistad" (solo si NO es tu propia cuenta)
	if data.UserId ~= player.UserId then
		buildFriendButton(profileScroll, data.UserId, 1)
	end

	-- Link
	local linkFrame = Instance.new("Frame", profileScroll)
	linkFrame.LayoutOrder = 2
	linkFrame.Size = UDim2.new(1, -4, 0, 30)
	linkFrame.BackgroundColor3 = C.card
	linkFrame.BorderSizePixel = 0
	linkFrame.ClipsDescendants = true
	Instance.new("UICorner", linkFrame).CornerRadius = UDim.new(0, 4)

	local linkBox = Instance.new("TextBox", linkFrame)
	linkBox.Size = UDim2.new(1, -214, 1, -6)
	linkBox.Position = UDim2.new(0, 6, 0, 3)
	linkBox.BackgroundColor3 = C.link
	linkBox.Font = Enum.Font.Code
	linkBox.TextSize = 12
	linkBox.TextColor3 = Color3.fromRGB(120, 200, 255)
	linkBox.Text = data.ProfileUrl
	linkBox.ClearTextOnFocus = false
	linkBox.TextEditable = false
	linkBox.TextXAlignment = Enum.TextXAlignment.Left
	linkBox.BorderSizePixel = 0
	Instance.new("UICorner", linkBox).CornerRadius = UDim.new(0, 4)

	local copyLink = Instance.new("TextButton", linkFrame)
	copyLink.Size = UDim2.new(0, 96, 1, -6)
	copyLink.Position = UDim2.new(1, -102, 0, 3)
	copyLink.BackgroundColor3 = C.accent
	copyLink.Text = "Copiar link"
	copyLink.Font = Enum.Font.GothamBold
	copyLink.TextSize = 12
	copyLink.TextColor3 = C.onAccent
	copyLink.BorderSizePixel = 0
	Instance.new("UICorner", copyLink).CornerRadius = UDim.new(0, 4)
	copyLink.MouseButton1Click:Connect(function()
		clipboard(data.ProfileUrl)
		statusLabel.Text = "Link del perfil copiado"
		copyLink.Text = "¡Copiado!"
		task.delay(1.2, function()
			if copyLink and copyLink.Parent then copyLink.Text = "Copiar link" end
		end)
	end)

	local openProfile = Instance.new("TextButton", linkFrame)
	openProfile.Size = UDim2.new(0, 96, 1, -6)
	openProfile.Position = UDim2.new(1, -206, 0, 3)
	openProfile.BackgroundColor3 = C.neutral
	openProfile.Text = "Abrir Perfil"
	openProfile.Font = Enum.Font.GothamBold
	openProfile.TextSize = 12
	openProfile.TextColor3 = C.text
	openProfile.BorderSizePixel = 0
	Instance.new("UICorner", openProfile).CornerRadius = UDim.new(0, 4)
	openProfile.MouseButton1Click:Connect(function()
		local opened = openURL(data.ProfileUrl)
		if opened then
			statusLabel.Text = "Perfil abierto en el navegador."
		else
			statusLabel.Text = "El executor " .. EXECUTOR_NAME .. " no permite abrir el navegador."
			showLinkModal(data.ProfileUrl)
		end
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
		joinBtn.Text = "🎮 Unirse a su servidor"
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
				statusLabel.Text = "No se pudo unir (servidor lleno/privado o sin acceso)."
			end
		end)
	end

	addRow(profileScroll, "Username", data.Username, false).LayoutOrder = 5
	addRow(profileScroll, "Display Name", data.DisplayName, false).LayoutOrder = 6
	addRow(profileScroll, "UserId", data.UserId, true).LayoutOrder = 7            -- botón Copiar ID
	addRow(profileScroll, "Suscripción", data.Subscription, false).LayoutOrder = 8
	addRow(profileScroll, "Verificado", data.Verified, false).LayoutOrder = 9
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
	historyFrame.LayoutOrder = 14
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
	task.spawn(function()
		local names, hasMore
		if data._namesCached ~= nil then
			names = data._namesCached or nil
			hasMore = data._namesHasMore or false
		else
			names, hasMore = getNameHistory(data.UserId)
			data._namesCached = names or false
			data._namesHasMore = hasMore or false
		end
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
			err.Text = "No se pudo obtener el historial."
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

	mkBtn("Copiar TXT", 0).MouseButton1Click:Connect(function()
		withNames("Preparando TXT (historial de nombres)...", function()
			clipboard(table.concat(buildTxtLines(), "\n"))
			statusLabel.Text = "Copiado a portapapeles (TXT)"
		end)
	end)

	mkBtn("Copiar JSON", 140).MouseButton1Click:Connect(function()
		withNames("Preparando JSON (historial de nombres)...", function()
			clipboard(HttpService:JSONEncode(buildExportData()))
			statusLabel.Text = "Copiado a portapapeles (JSON)"
		end)
	end)

	-- ---------- PESTAÑA ITEMS (avatar + precio + grupos + badges + RAP) ----------
	local priceCard = addNoteCard(itemsScroll, "💰 Precio del avatar", "Calculando...", C.good)
	priceCard.LayoutOrder = 1

	local itemsCard = addNoteCard(itemsScroll, "🎽 Items equipados", "Cargando...", C.accent)
	itemsCard.LayoutOrder = 2

	local groupsCard = addNoteCard(itemsScroll, "👥 Grupos", "Cargando...", C.accent)
	groupsCard.LayoutOrder = 3

	local badgesCard = addNoteCard(itemsScroll, "🏅 Badges recientes", "Cargando...", C.accent)
	badgesCard.LayoutOrder = 4

	local rapCard = addNoteCard(itemsScroll, "💎 RAP (valor limiteds)",
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
		if #groups == 0 then b.Text = "No está en ningún grupo." ; return end
		local lines = {}
		for _, g in ipairs(groups) do
			table.insert(lines, "• " .. g.name .. "  —  " .. g.role)
		end
		b.Text = #groups .. " grupo(s):\n" .. table.concat(lines, "\n")
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
		if #badges == 0 then b.Text = "Sin badges recientes." ; return end
		local lines = {}
		for _, bd in ipairs(badges) do table.insert(lines, "• " .. bd.name) end
		b.Text = "Últimos " .. #badges .. ":\n" .. table.concat(lines, "\n")
	end)

	task.spawn(function()
		local rapVal
		if data._rapCached ~= nil then
			rapVal = data._rapCached or nil
		else
			local rap = getRAP(data.UserId)
			rapVal = rap and tonumber(rap.rap) or nil
			data._rapCached = rapVal or false
		end
		if currentData == nil or currentData.UserId ~= itemsFor then return end
		local b = bodyOf(rapCard); if not b then return end
		if not rapVal or rapVal <= 0 then
			b.Text = "No disponible (la web externa no respondió o tu executor la bloquea). No es un dato oficial de Roblox."
			return
		end
		b.Text = "RAP estimado: " .. tostring(rapVal) .. " R$\n(Fuente: Rolimon's, valor aproximado, NO oficial.)"
	end)

	-- ---------- PESTAÑA ANÁLISIS ----------
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
	advTitle.Text = "🔍 Análisis avanzado"
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
	task.spawn(function()
		local rapVal
		if data._rapCached ~= nil then
			rapVal = data._rapCached or nil
		else
			local rap = getRAP(data.UserId)
			rapVal = rap and tonumber(rap.rap) or nil
			data._rapCached = rapVal or false
		end
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

	addNoteCard(analysisScroll,
		"🛡️ Confianza: " .. trustScore .. "/100  (" .. trustLvl .. ")",
		"Puntaje heurístico (NO oficial). Desglose:\n• " .. table.concat(trustReasons, "\n• "),
		trustColor).LayoutOrder = 2

	-- Riesgo ALT: explicación contextual (según nivel) + factores con ✓ +
	-- desglose ponderado por área (transparencia del modelo).
	local altContext
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
		"🧪 Riesgo de ALT: " .. altScore .. "/100  (" .. altLvl .. ")",
		altContext .. "\n\n" .. altFactorsTxt
			.. "\n\nDesglose ponderado (riesgo por área):\n" .. table.concat(bd, "\n")
			.. "\n\nHeurística sobre datos públicos: NO prueba que la cuenta sea un alt.",
		altColor).LayoutOrder = 3

	local mutualCard = addNoteCard(analysisScroll,
		"👥 Amigos en común",
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
				bodyLabel.Text = "No disponible (alguna lista de amigos es privada o falló la API)."
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
	thTitle.Text = "🎨 Tema (se aplica al instante)"; thTitle.TextXAlignment = Enum.TextXAlignment.Left
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
	nxTitle.Text = "🏷️ NX Head Tags"; nxTitle.TextXAlignment = Enum.TextXAlignment.Left
	themed(nxTitle, "TextColor3", "accent")

	local nxDesc = Instance.new("TextLabel", nxCard)
	nxDesc.LayoutOrder = 1; nxDesc.Size = UDim2.new(1, 0, 0, 16); nxDesc.BackgroundTransparency = 1
	nxDesc.Font = Enum.Font.Gotham; nxDesc.TextSize = 11; nxDesc.TextColor3 = C.subtext
	nxDesc.Text = "Etiquetas sobre la cabeza de usuarios NX (solo las ves tú)."
	nxDesc.TextXAlignment = Enum.TextXAlignment.Left
	themed(nxDesc, "TextColor3", "subtext")

	local nxToggle = Instance.new("TextButton", nxCard)
	nxToggle.LayoutOrder = 2; nxToggle.Size = UDim2.new(0, 130, 0, 28)
	nxToggle.Font = Enum.Font.GothamBold; nxToggle.TextSize = 13; nxToggle.BorderSizePixel = 0
	Instance.new("UICorner", nxToggle).CornerRadius = UDim.new(0, 5)
	addHoverStroke(nxToggle)

	local function paintNxToggle()
		local on = store.headTags
		nxToggle.Text = on and "Activado ✓" or "Desactivado"
		nxToggle.BackgroundColor3 = on and C.good or C.neutral
		nxToggle.TextColor3 = on and C.onAccent or C.text
	end
	paintNxToggle()
	onRepaint(paintNxToggle)

	nxToggle.MouseButton1Click:Connect(function()
		store.headTags = not store.headTags
		saveStore()
		paintNxToggle()
		if _G.NXHeadTags then
			_G.NXHeadTags.SetEnabled(store.headTags)
		end
	end)

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
	anTitle.Text = "✨ Animaciones"; anTitle.TextXAlignment = Enum.TextXAlignment.Left
	themed(anTitle, "TextColor3", "accent")

	local anDesc = Instance.new("TextLabel", animCard)
	anDesc.LayoutOrder = 1; anDesc.Size = UDim2.new(1, 0, 0, 16); anDesc.BackgroundTransparency = 1
	anDesc.Font = Enum.Font.Gotham; anDesc.TextSize = 11; anDesc.TextColor3 = C.subtext
	anDesc.Text = "Transiciones y efectos de la interfaz (y el brillo de los head tags)."
	anDesc.TextXAlignment = Enum.TextXAlignment.Left
	themed(anDesc, "TextColor3", "subtext")

	local anToggle = Instance.new("TextButton", animCard)
	anToggle.LayoutOrder = 2; anToggle.Size = UDim2.new(0, 140, 0, 28)
	anToggle.Font = Enum.Font.GothamBold; anToggle.TextSize = 13; anToggle.BorderSizePixel = 0
	Instance.new("UICorner", anToggle).CornerRadius = UDim.new(0, 5)
	addHoverStroke(anToggle)

	local function paintAnToggle()
		local on = store.animations ~= false
		anToggle.Text = on and "Activadas ✓" or "Desactivadas"
		anToggle.BackgroundColor3 = on and C.good or C.neutral
		anToggle.TextColor3 = on and C.onAccent or C.text
	end
	paintAnToggle()
	onRepaint(paintAnToggle)

	anToggle.MouseButton1Click:Connect(function()
		local newOn = not (store.animations ~= false)
		store.animations = newOn
		saveStore()
		setAnimationsEnabled(newOn)
		paintAnToggle()
	end)
end

-- ====================== FLUJO PRINCIPAL ======================
local analyzing = false
analyze = function(input)
	if analyzing then return end
	input = (input or ""):gsub("%s", "")
	if input == "" then return end

	analyzing = true
	hideAllSuggestions()
	statusLabel.Text = "Buscando..."

	task.spawn(function()
		local userId = tonumber(input)
		if not userId then
			local id, _, errType = getUserIdByName(input)
			if not id then
				if errType == "not_found" then
					statusLabel.Text = "Usuario no encontrado."
				elseif errType == "api_error" then
					statusLabel.Text = "Error temporal de Roblox API. Intenta más tarde."
				else
					statusLabel.Text = "Error desconocido."
				end
				render(nil)
				analyzing = false
				return
			end
			userId = id
		end

		if profileCache[userId] then
			render(profileCache[userId])
			statusLabel.Text = "Listo (caché)."
			analyzing = false
			return
		end

		statusLabel.Text = "Consultando APIs..."
		local data = gatherData(userId)
		if not data then
			statusLabel.Text = "Error o usuario inexistente."
			render(nil)
		else
			profileCache[userId] = data
			render(data)
			statusLabel.Text = "Listo."
		end
		analyzing = false
	end)
end

track(analyzeBtn.MouseButton1Click:Connect(function() analyze(searchBox.Text) end))
track(searchBox.FocusLost:Connect(function(enter)
	if enter then analyze(searchBox.Text) end
end))

createTab("Perfil", profilePage)
createTab("Estadísticas", statsPage)
createTab("Items", itemsPage)
createTab("Análisis", analysisPage)
createTab("Ajustes", settingsPage)

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
		if input.UserInputState == Enum.UserInputState.End then stopDrag() end
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


print(("[Profile Analyzer v3.3.0] Cargado correctamente. Executor: %s"):format(EXECUTOR_NAME))


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
          { tag = "NX OWNER", icon = "👑", color = "gold", animation = "rainbow" }
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
        TAGS_URL          = "https://raw.githubusercontent.com/dreennx/nx-tags/main/tags.json",
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
        GLOW_ALL          = true,  -- halo de glow que late para TODOS los tags.

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
    local NAMED_COLORS = {
        white   = Color3.fromRGB(255, 255, 255),
        black   = Color3.fromRGB(0, 0, 0),
        red     = Color3.fromRGB(255, 60, 60),
        green   = Color3.fromRGB(80, 220, 120),
        blue    = Color3.fromRGB(70, 150, 255),
        cyan    = Color3.fromRGB(0, 255, 255),
        gold    = Color3.fromRGB(255, 215, 0),
        yellow  = Color3.fromRGB(255, 225, 60),
        orange  = Color3.fromRGB(255, 150, 40),
        purple  = Color3.fromRGB(170, 120, 255),
        pink    = Color3.fromRGB(255, 110, 200),
        magenta = Color3.fromRGB(255, 0, 200),
        teal    = Color3.fromRGB(0, 200, 180),
        silver  = Color3.fromRGB(200, 200, 210),
        lime    = Color3.fromRGB(160, 255, 80),
    }

    --==========================================================================
    -- ROLE PRESETS  (Discord hierarchy)
    -- These fill in defaults so the JSON can be minimal. A JSON entry of just
    -- { "tag": "NX OWNER" } will inherit this icon/color/animation/priority.
    -- Anything the JSON DOES specify always wins over the preset.
    --==========================================================================
    local ROLE_PRESETS = {
    ["OWNER"]                = { color = Color3.fromRGB(255, 215, 90),  icon = "👑", priority = 100, animation = "elite_gold"     },
    ["OWNER'S ASSISTANT"]    = { color = Color3.fromRGB(200, 160, 255), icon = "👑", priority = 95,  animation = "elite_platinum" },
    ["SUPPORT SPECIALIST"]   = { color = Color3.fromRGB(90, 230, 150),  icon = "⌘",  priority = 90,  animation = "luxe"           },
    ["UI DESIGNER"]          = { color = Color3.fromRGB(120, 230, 160), icon = "🎨", priority = 85,  animation = "gradient"       },
    ["CYBER SECURITY"]       = { color = Color3.fromRGB(90, 160, 255),  icon = "🛡️", priority = 80,  animation = "elite_cyber"    },
    ["DEVELOPER UPDATES"]    = { color = Color3.fromRGB(255, 80, 80),   icon = "🛠️", priority = 78,  animation = "luxe"           },
    ["TESTER"]               = { color = Color3.fromRGB(110, 235, 150), icon = "🧪", priority = 75,  animation = "pulse"          },
    ["MODS"]                 = { color = Color3.fromRGB(90, 150, 255),  icon = "⚒️", priority = 70,  animation = "elite_cyan"     },
    ["SERVER BOOSTER"]       = { color = Color3.fromRGB(235, 130, 245), icon = "🚀", priority = 65,  animation = "gradient"       },
    ["SPECIAL ACCESS"]       = { color = Color3.fromRGB(80, 180, 255),  icon = "💎", priority = 60,  animation = "elite_crystal"  },
    ["NX CONTRIBUTOR"]       = { color = Color3.fromRGB(120, 230, 140), icon = "🧩", priority = 55,  animation = "gradient"       },
    ["INTEGRANTES"]          = { color = Color3.fromRGB(140, 235, 160), icon = "👥", priority = 50,  animation = "glow"           },
    ["AMIGO/A"]              = { color = Color3.fromRGB(255, 90, 220),  icon = "🦊", priority = 45,  animation = "shine"          },
    ["NX HELPER BOT"]        = { color = Color3.fromRGB(120, 230, 150), icon = "🤖", priority = 40,  animation = "glow"           },
    ["CREADOR DE CONTENIDO"] = { color = Color3.fromRGB(220, 90, 90),   icon = "🎥", priority = 38,  animation = "shine"          },
    ["PENDING"]              = { color = Color3.fromRGB(235, 235, 235), icon = "⏳", priority = 35,  animation = "glow"           },
    ["TICKETS SUPPORT"]      = { color = Color3.fromRGB(180, 185, 195), icon = "🎫", priority = 30,  animation = "glow"           },
    ["TICKETS ADMIN"]        = { color = Color3.fromRGB(170, 175, 185), icon = "🎟️", priority = 28,  animation = "glow"           },
    ["APPS"]                 = { color = Color3.fromRGB(235, 235, 235), icon = "📱", priority = 25,  animation = "glow"           },
    ["ROBLOX UPDATE"]        = { color = Color3.fromRGB(180, 185, 195), icon = "🔔", priority = 22,  animation = "glow"           },
    ["AUTHORIZED"]           = { color = Color3.fromRGB(90, 200, 120),  icon = "✅", priority = 20,  animation = "glow"           },
    ["TRIAL SUPPORT"]        = { color = Color3.fromRGB(120, 220, 150), icon = "🎫", priority = 18,  animation = "glow"           },
}

    -- Alias: nombres antiguos siguen funcionando con el mismo estilo (compatibilidad).
    ROLE_PRESETS["NX OWNER"]        = ROLE_PRESETS["OWNER"]
    ROLE_PRESETS["OWNER ASSISTANT"] = ROLE_PRESETS["OWNER'S ASSISTANT"]
    ROLE_PRESETS["NX MOD"]          = ROLE_PRESETS["MODS"]
    ROLE_PRESETS["MEMBER"]          = ROLE_PRESETS["INTEGRANTES"]
    ROLE_PRESETS["CONTRIBUTOR"]     = ROLE_PRESETS["NX CONTRIBUTOR"]
    ROLE_PRESETS["CONTENT CREATOR"] = ROLE_PRESETS["CREADOR DE CONTENIDO"]

    --==========================================================================
    -- SMALL HELPERS
    --==========================================================================
    local function lerp(a, b, t)
        return a + (b - a) * t
    end

    local function normalizeRole(name)
        name = tostring(name or "")
        name = name:gsub("%s+", " ")                 -- collapse internal whitespace
        name = name:match("^%s*(.-)%s*$") or name    -- trim ends
        return string.upper(name)
    end

    local function resolveColor(value, fallback)
        fallback = fallback or Color3.fromRGB(255, 255, 255)
        if typeof(value) == "Color3" then
            return value
        end
        if type(value) == "table" then
            local r = value[1] or value.r or value.R
            local g = value[2] or value.g or value.G
            local b = value[3] or value.b or value.B
            if r and g and b then
                if r <= 1 and g <= 1 and b <= 1 then
                    return Color3.new(r, g, b)
                end
                return Color3.fromRGB(r, g, b)
            end
            return fallback
        end
        if type(value) == "string" then
            local s = string.lower((value:gsub("%s", "")))
            if NAMED_COLORS[s] then
                return NAMED_COLORS[s]
            end
            local hex = (s:gsub("#", ""))
            if #hex == 6 and string.match(hex, "^%x+$") then
                return Color3.fromRGB(
                    tonumber(string.sub(hex, 1, 2), 16),
                    tonumber(string.sub(hex, 3, 4), 16),
                    tonumber(string.sub(hex, 5, 6), 16)
                )
            end
        end
        return fallback
    end

    -- HTTP GET that works in executor environments (game:HttpGet) and falls
    -- back to standard HttpService. Matches whatever your profile system uses.
    local function httpGet(url)
        local attempts = {
            function() return game:HttpGet(url, true) end,
            function() return HttpService:GetAsync(url, true) end,
        }
        for _, fn in ipairs(attempts) do
            local ok, res = pcall(fn)
            if ok and type(res) == "string" and #res > 0 then
                return res
            end
        end
        return nil
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
    local function normalizeImage(v)
        if v == nil then return nil end
        if type(v) == "number" then return "rbxassetid://" .. v end
        v = tostring(v)
        if v == "" or v == "rbxassetid://0" then return nil end
        if v:match("^rbxassetid://%d+") or v:match("^rbxthumb") or v:match("^http") then return v end
        local digits = v:match("^(%d+)$")
        if digits then return "rbxassetid://" .. digits end
        return v
    end

    function TagDatabase:_resolveEntry(raw)
        local roleName  = raw.tag or raw.role or "MEMBER"
        local preset    = ROLE_PRESETS[normalizeRole(roleName)] or {}

        local color     = resolveColor(raw.color, preset.color or Color3.fromRGB(255, 255, 255))
        local icon      = raw.icon or preset.icon or ""
        local iconImage = normalizeImage(raw.iconImage or raw.image or preset.iconImage)  -- NUEVO
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
            circleIcon.Size                   = UDim2.fromScale(0.50, 0.50)
            circleIcon.Position               = UDim2.fromScale(0.5, 0.5)
            circleIcon.AnchorPoint            = Vector2.new(0.5, 0.5)
            circleIcon.ScaleType              = Enum.ScaleType.Fit
            circleIcon.ImageColor3            = tag.color
            circleIcon.Parent                 = circle
        else
            circleIcon = Instance.new("TextLabel")
            circleIcon.BackgroundTransparency = 1
            circleIcon.Size                   = UDim2.fromScale(0.62, 0.62)
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
                    ctx.billboard.Enabled = false           -- adornee gone; self-heal
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

-- Aplica la preferencia guardada de Animaciones: si las dejaste apagadas,
-- también se calma el glow/shimmer de los head tags al cargar.
if _G.NXHeadTags and _G.NXHeadTags.SetAnimationsEnabled and store.animations == false then
	_G.NXHeadTags.SetAnimationsEnabled(false)
end
