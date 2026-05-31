--[[
   Roblox Public Profile Analyzer  v2.7.0
   ---------------------------------------------------------------
   Nuevo/arreglado en v2.7.0 (sobre v2.6.0):
     • FIX CHAT: se ELIMINÓ la elevación de identidad del hilo
       (setthreadidentity(8)) que ponía el script a nivel CoreScript
       sin regresarlo — causa probable de que se quitara el chat de
       Roblox. Abrir navegador ahora cae limpio al modal de copiar link.
     • FIX VISOR 3D: el ViewportFrame ahora usa un WorldModel (necesario
       para renderizar accesorios/MeshParts del avatar), el modelo se
       lleva al origen, se ancla, se desactiva el Humanoid, la cámara se
       encuadra con CFrame.lookAt y la rotación va por RenderStepped.
       Hay timeout de 12s con aviso si no carga.
     • COMPARADOR rehecho: filas de alto automático con texto envuelto
       (ya no se corta "Solo visible en cuenta…"), columnas A/B claras
       y resalta en verde el valor mayor.
     • AJUSTES (pestaña nueva): Auto-Execute (con URL del script),
       selector de tema e historial/favoritos (movidos aquí).
     • NOTIFICACIÓN de Auto-Execute al abrir (una sola vez).

   Nuevo en v2.6.0: Items, grupos, badges, RAP, trust score, gráfico,
     unirse al servidor, comparador, historial/favoritos, temas.
   Nuevo en v2.5.0: visor de personaje 3D + 2D.
   Nuevo en v2.4.0: tema blanco y negro (estilo Quick Chat NX).

   Nuevo en v2.3.0 (sobre v2.2.4, sin romper nada):
     • TEMA (color): todos los fondos están centralizados en la tabla C
       de abajo -> cambia ahí y afecta todo el panel de una.
     • SUSCRIPCIÓN: la fila "Premium" ahora se llama "Suscripción".
       Roblox reemplazó Premium por Plus (30/04/2026) y quitó el badge
       de Premium del perfil (30/05/2026), así que para OTROS usuarios
       ya no es detectable de forma confirmada -> se muestra "Solo
       visible en cuenta propia". Para TU cuenta se usa MembershipType.
       (Premium y Plus no se distinguen limpiamente por API, se reporta
       como "Premium / Plus".)
     • PANEL REDIMENSIONABLE: hay un agarre (esquina inferior derecha)
       para estirar la ventana. Tamaño mínimo limitado. La conexión
       solo se engancha mientras redimensionas (igual que el arrastre,
       para no tirar FPS).
     • DESCRIPCIÓN EXPANDIBLE: ya no se corta ni se sale. Si es larga
       se ve recortada con un botón "Mostrar más" / "Mostrar menos".
       La tarjeta crece sola (AutomaticSize) y recorta lo que sobre.
     • COPIAR ID: la fila UserId trae botón "Copiar".
     • ESTADO / ACTIVIDAD: fila de estado en tiempo real (Online,
       Jugando, En Studio, Offline) vía la API de presencia. Si el
       jugador tiene la presencia privada saldrá Offline.
     • PESTAÑA ANÁLISIS (nueva): amigos en común (cuántos y cuáles),
       nivel de influencia (heurística) y detector de alt (heurística).
       Lo heurístico está marcado como tal: NO es dato confirmado.
     • TODO DENTRO DE LAS TARJETAS: ClipsDescendants + auto-size para
       que ningún texto se escape del UI.

   --- Historial previo (intacto) ---
   v2.2.4: detección de executor, overlay full-screen, texto sin desborde.
   v2.2.3: modal verde "Link copiado", pasos numerados.
   v2.2.2: identidad elevada + lista extendida de funciones executor.
   (resto de notas en versiones anteriores)
--]]

-- ====================== SERVICIOS ======================
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ====================== PERSISTENCIA (archivo) ======================
-- Igual que Quick Chat: si el executor tiene sistema de archivos, guardamos
-- el tema elegido, el historial de búsquedas y los favoritos.
local SAVE_FILE = "ProfileAnalyzer_data.json"
local hasFS = (type(writefile) == "function")
	and (type(readfile) == "function")
	and (type(isfile) == "function")

local store = { theme = "negro", history = {}, favorites = {},
	autoexec = false, autoexecUrl = "", autoexecAsked = false }

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
				store.theme     = decoded.theme or "negro"
				store.history   = type(decoded.history) == "table" and decoded.history or {}
				store.favorites = type(decoded.favorites) == "table" and decoded.favorites or {}
				store.autoexec  = decoded.autoexec or false
				store.autoexecUrl = decoded.autoexecUrl or ""
				store.autoexecAsked = decoded.autoexecAsked or false
			end
		end
	end)
end
loadStore()

-- ====================== AUTO-EXECUTE (carpeta autoexec del executor) ======================
-- HONESTO: esto depende 100% del executor. Solo funciona si:
--   1) Tu executor soporta writefile.
--   2) Tu executor lee una carpeta de auto-ejecución (autoexec/).
--   3) Tienes la URL de tu script (loadstring) para volver a cargarlo.
-- Escribimos un pequeño "loader" en varias rutas comunes de autoexec.
local AUTOEXEC_FILE = "ProfileAnalyzer_autoexec.lua"
local AUTOEXEC_DIRS = { "autoexec", "autoexecute", "auto-exec" }

local function autoexecEnable(url)
	if not hasFS then return false, "Tu executor no soporta writefile." end
	if not url or url == "" then return false, "Falta la URL del script (escríbela arriba)." end
	local code = ('loadstring(game:HttpGet("%s"))()'):format(url)
	local wrote = false
	for _, dir in ipairs(AUTOEXEC_DIRS) do
		if type(makefolder) == "function" then pcall(makefolder, dir) end
		local path = dir .. "/" .. AUTOEXEC_FILE
		if pcall(writefile, path, code) then wrote = true end
	end
	pcall(writefile, AUTOEXEC_FILE, code) -- algunos executors usan la raíz
	if wrote then
		return true, "Auto-execute activado. Se ejecutará al inyectar (si tu executor soporta autoexec)."
	end
	return false, "No se pudo escribir en la carpeta autoexec de tu executor."
end

local function autoexecDisable()
	if not hasFS then return end
	for _, dir in ipairs(AUTOEXEC_DIRS) do
		local path = dir .. "/" .. AUTOEXEC_FILE
		if type(delfile) == "function" then pcall(delfile, path) end
		pcall(writefile, path, "-- auto-execute desactivado")
	end
	if type(delfile) == "function" then pcall(delfile, AUTOEXEC_FILE) end
end

-- ====================== TEMAS ======================
-- 'onAccent' = texto que va ENCIMA del acento (debe contrastar con él).
-- El cambio de tema se guarda y se aplica al REABRIR el script (limpio y
-- sin riesgo de romper la UI en caliente).
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
}

-- C arranca con el tema guardado. Cambiar 'store.theme' y guardar -> efecto al reabrir.
local C = {}
local function applyTheme(name)
	local t = THEMES[name] or THEMES.negro
	for k, v in pairs(t) do C[k] = v end
end
applyTheme(store.theme)

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
for _, child in ipairs(playerGui:GetChildren()) do
	if child:IsA("ScreenGui") and child.Name == "ProfileAnalyzer" then
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

-- Extrae los días de la cadena "2301 días (~6.3 años)"
local function daysFromAge(ageStr)
	local d = tostring(ageStr):match("(%d+)%s*d[ií]as")
	return tonumber(d) or 0
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

local function formatAge(isoCreated)
	if not isoCreated then return nil, nil end
	local y, m, d = isoCreated:match("(%d+)-(%d+)-(%d+)")
	if not y then return isoCreated:sub(1,10), nil end
	local created = os.time{ year = tonumber(y), month = tonumber(m), day = tonumber(d) }
	local days = math.floor((os.time() - created) / 86400)
	local years = days / 365.25
	return isoCreated:sub(1,10), string.format("%d días (~%.1f años)", days, years)
end

-- ====================== SUSCRIPCIÓN (Premium / Plus) ======================
-- Honesto: para otros usuarios ya no es detectable (Roblox quitó el badge
-- de Premium el 30/05/2026 y Plus reemplazó a Premium el 30/04/2026).
-- Para TU propia cuenta se lee MembershipType. Premium y Plus no se
-- distinguen limpiamente por API, por eso se reporta junto.
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

-- ====================== ITEMS EQUIPADOS (avatar actual) ======================
-- Devuelve lista de { id=assetId, name=... }. Los nombres se piden aparte.
local function getWornItems(userId)
	local data = apiGet("https://avatar.roblox.com/v1/users/" .. userId .. "/currently-wearing")
	if not data or not data.assetIds then return nil end
	local items = {}
	for _, id in ipairs(data.assetIds) do
		table.insert(items, { id = id, name = nil })
	end
	-- pedir nombres en lote (catálogo). Si falla, quedan solo los IDs.
	if #items > 0 then
		local ids = {}
		for _, it in ipairs(items) do table.insert(ids, { itemType = "Asset", id = it.id }) end
		local resp = apiPost("https://catalog.roblox.com/v1/catalog/items/details", { items = ids })
		if resp and resp.data then
			local byId = {}
			for _, d in ipairs(resp.data) do byId[d.id] = d.name end
			for _, it in ipairs(items) do it.name = byId[it.id] end
		end
	end
	return items
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
	-- Rolimon's devuelve 'value' (RAP estimado) cuando el jugador existe
	if data.success == false then return nil end
	return {
		rap = data.value or data.rap,
		premium = data.premium,
	}
end

-- ====================== SCORE DE CONFIANZA (heurística 0-100) ======================
local function computeTrust(data)
	local score = 0
	local reasons = {}
	local days   = (tostring(data.AccountAge):match("(%d+)%s*d[ií]as") and tonumber(tostring(data.AccountAge):match("(%d+)%s*d[ií]as"))) or 0
	local friends = tonumber((tostring(data.Friends):gsub("%+",""))) or 0
	local groups  = tonumber((tostring(data.Groups):gsub("%+",""))) or 0
	local badges  = tonumber((tostring(data.Badges):gsub("%+",""))) or 0
	local verified = (data.Verified == "Sí")

	-- antigüedad (máx 35)
	if days >= 1825 then score = score + 35; table.insert(reasons, "Cuenta muy antigua (+35)")
	elseif days >= 730 then score = score + 25; table.insert(reasons, "Cuenta antigua (+25)")
	elseif days >= 365 then score = score + 18; table.insert(reasons, "Más de 1 año (+18)")
	elseif days >= 90 then score = score + 10; table.insert(reasons, "Algunos meses (+10)")
	elseif days >= 30 then score = score + 4; table.insert(reasons, "Cuenta reciente (+4)")
	else table.insert(reasons, "Cuenta muy nueva (+0)") end

	-- amigos (máx 25)
	if friends >= 50 then score = score + 25; table.insert(reasons, "Muchos amigos (+25)")
	elseif friends >= 10 then score = score + 15; table.insert(reasons, "Amigos normales (+15)")
	elseif friends >= 1 then score = score + 6; table.insert(reasons, "Pocos amigos (+6)")
	else table.insert(reasons, "0 amigos (+0)") end

	-- grupos (máx 20)
	if groups >= 5 then score = score + 20; table.insert(reasons, "Varios grupos (+20)")
	elseif groups >= 1 then score = score + 10; table.insert(reasons, "Algún grupo (+10)")
	else table.insert(reasons, "0 grupos (+0)") end

	-- badges (máx 10)
	if badges >= 10 then score = score + 10; table.insert(reasons, "Actividad en juegos (+10)")
	elseif badges >= 1 then score = score + 5; table.insert(reasons, "Algo de actividad (+5)") end

	-- verificado (máx 10)
	if verified then score = score + 10; table.insert(reasons, "Insignia verificada (+10)") end

	if score > 100 then score = 100 end
	local label, color = "Bajo", C.bad
	if score >= 70 then label, color = "Alto", C.good
	elseif score >= 40 then label, color = "Medio", C.warn end
	return score, label, color, reasons, days, friends, groups, badges
end

-- ====================== AMIGOS EN COMÚN ======================
-- Solo tiene sentido al analizar a OTRA persona. Requiere que ambas
-- listas de amigos sean públicas.
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

-- ====================== INFLUENCIA (heurística) ======================
local function computeInfluence(data)
	local score = 0
	local followers = toNum(data.Followers)
	local groups    = toNum(data.Groups)
	local favs      = toNum(data.Favorites)
	local days      = daysFromAge(data.AccountAge)

	if followers >= 1000 then score += 3
	elseif followers >= 100 then score += 2
	elseif followers >= 10 then score += 1 end

	if groups >= 10 then score += 2
	elseif groups >= 3 then score += 1 end

	if favs >= 20 then score += 1 end

	if days >= 1825 then score += 2
	elseif days >= 365 then score += 1 end

	local level, color = "Bajo", C.subtext
	if score >= 6 then level, color = "Alto", C.good
	elseif score >= 3 then level, color = "Medio", C.warn end
	return level, color
end

-- ====================== DETECTOR DE ALT (heurística) ======================
local function computeAlt(data)
	local reasons = {}
	local days    = daysFromAge(data.AccountAge)
	local friends = toNum(data.Friends)
	local groups  = toNum(data.Groups)
	local favs    = toNum(data.Favorites)

	if days <= 30 then table.insert(reasons, "Creada hace " .. days .. " días") end
	if friends == 0 then table.insert(reasons, "0 amigos") end
	if groups == 0 then table.insert(reasons, "0 grupos") end
	if favs == 0 then table.insert(reasons, "0 favoritos") end

	local isAlt = (#reasons >= 3)
	return isAlt, reasons
end

-- ====================== HISTORIAL DE NOMBRES ======================
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

	if cursor and pagesFetched >= maxPages then hasMore = true end

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

	local createdDate, accountAge = formatAge(profile.created)

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
gui.Name = "ProfileAnalyzer"
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
local stroke = Instance.new("UIStroke", main)
stroke.Color = C.accent
stroke.Transparency = 0.55
stroke.Thickness = 1.5

-- Header
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 34)
header.BackgroundColor3 = C.accent
header.BackgroundTransparency = 0.85
header.BorderSizePixel = 0
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 14, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "Roblox Profile Analyzer"
title.TextColor3 = C.accent
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("ImageButton", header)
closeBtn.Size = UDim2.new(0, 20, 0, 20)
closeBtn.Position = UDim2.new(1, -30, 0.5, -10)
closeBtn.BackgroundTransparency = 1
closeBtn.Image = "rbxassetid://3926305904"
closeBtn.ImageRectOffset = Vector2.new(244, 204)
closeBtn.ImageRectSize = Vector2.new(24, 24)
track(closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end))

-- ====================== BÚSQUEDA ======================
local searchFrame = Instance.new("Frame", main)
searchFrame.Size = UDim2.new(1, -20, 0, 32)
searchFrame.Position = UDim2.new(0, 10, 0, 40)
searchFrame.BackgroundTransparency = 1

local searchBox = Instance.new("TextBox", searchFrame)
searchBox.Size = UDim2.new(0, 200, 0, 28)
searchBox.PlaceholderText = "Nombre de usuario o ID"
searchBox.Text = ""
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 14
searchBox.BackgroundColor3 = C.input
searchBox.TextColor3 = C.text
searchBox.ClearTextOnFocus = false
searchBox.BorderSizePixel = 0
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 6)

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

local statusLabel = Instance.new("TextLabel", searchFrame)
statusLabel.Size = UDim2.new(1, -320, 0, 28)
statusLabel.Position = UDim2.new(0, 320, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 13
statusLabel.TextColor3 = C.subtext
statusLabel.Text = ""
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.TextTruncate = Enum.TextTruncate.AtEnd

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
local function createTab(name, page)
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
	track(btn.MouseButton1Click:Connect(function()
		for _, t in pairs(tabs) do
			t.BackgroundColor3 = C.neutral
			t.TextColor3 = C.text          -- inactiva: texto claro sobre negro
		end
		for _, p in pairs(pages) do p.Visible = false end
		btn.BackgroundColor3 = C.accent
		btn.TextColor3 = C.onAccent        -- activa: texto negro sobre acento blanco
		page.Visible = true
	end))
	table.insert(tabs, btn)
	table.insert(pages, page)
	if #tabs == 1 then
		btn.BackgroundColor3 = C.accent
		btn.TextColor3 = C.onAccent
		page.Visible = true
	end
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

local comparePage = Instance.new("Frame", content)
comparePage.Size = UDim2.new(1, 0, 1, 0)
comparePage.BackgroundTransparency = 1
comparePage.Visible = false
local compareScroll = makeScroll(comparePage)

local settingsPage = Instance.new("Frame", content)
settingsPage.Size = UDim2.new(1, 0, 1, 0)
settingsPage.BackgroundTransparency = 1
settingsPage.Visible = false
local settingsScroll = makeScroll(settingsPage)

-- ====================== ABRIR URL (intacto) ======================
local GuiService = game:GetService("GuiService")

-- NOTA v2.7.0: se ELIMINÓ la elevación de identidad del hilo
-- (setthreadidentity(8)). Esa línea ponía el script a nivel CoreScript
-- y NO lo regresaba, lo que puede romper sistemas del cliente como el
-- chat de Roblox. Sin eso, OpenBrowserWindow quizá no abra en algunos
-- executors, pero el flujo cae limpio al modal de "copiar link".
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
-- Modal "épico": muestra el avatar del jugador.
--   • 3D: modelo real (CreateHumanoidModelFromUserId) dentro de un
--         ViewportFrame, que puedes ROTAR arrastrando con el mouse/dedo.
--   • 2D: thumbnails oficiales de Roblox (cuerpo completo / busto / cabeza),
--         con sub-botones para cambiar entre los tres.
local function showCharacterModal(userId, username)
	-- limpiar uno previo
	local prev = gui:FindFirstChild("CharModal")
	if prev then prev:Destroy() end

	local overlay = Instance.new("Frame", gui)
	overlay.Name = "CharModal"
	overlay.Size = UDim2.new(1, 0, 1, 0)
	overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	overlay.BackgroundTransparency = 0.35
	overlay.BorderSizePixel = 0
	overlay.ZIndex = 60

	local box = Instance.new("Frame", overlay)
	box.Size = UDim2.new(0, 420, 0, 500)
	box.Position = UDim2.new(0.5, -210, 0.5, -250)
	box.BackgroundColor3 = C.modalBg
	box.BorderSizePixel = 0
	box.ClipsDescendants = true
	box.ZIndex = 61
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 12)
	local bs = Instance.new("UIStroke", box)
	bs.Color = C.accent
	bs.Transparency = 0.4
	bs.Thickness = 1.5

	-- Título
	local mtitle = Instance.new("TextLabel", box)
	mtitle.Size = UDim2.new(1, -50, 0, 30)
	mtitle.Position = UDim2.new(0, 14, 0, 10)
	mtitle.BackgroundTransparency = 1
	mtitle.Font = Enum.Font.GothamBold
	mtitle.TextSize = 16
	mtitle.TextColor3 = C.accent
	mtitle.Text = "Personaje de " .. tostring(username)
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
	mClose.MouseButton1Click:Connect(function() overlay:Destroy() end)

	-- Toggle 3D / 2D
	local toggle3D = Instance.new("TextButton", box)
	toggle3D.Size = UDim2.new(0, 90, 0, 26)
	toggle3D.Position = UDim2.new(0, 14, 0, 46)
	toggle3D.BackgroundColor3 = C.accent
	toggle3D.Text = "3D"
	toggle3D.Font = Enum.Font.GothamBold
	toggle3D.TextSize = 13
	toggle3D.TextColor3 = C.onAccent
	toggle3D.BorderSizePixel = 0
	toggle3D.ZIndex = 62
	Instance.new("UICorner", toggle3D).CornerRadius = UDim.new(0, 6)

	local toggle2D = Instance.new("TextButton", box)
	toggle2D.Size = UDim2.new(0, 90, 0, 26)
	toggle2D.Position = UDim2.new(0, 110, 0, 46)
	toggle2D.BackgroundColor3 = C.neutral
	toggle2D.Text = "2D"
	toggle2D.Font = Enum.Font.GothamBold
	toggle2D.TextSize = 13
	toggle2D.TextColor3 = C.text
	toggle2D.BorderSizePixel = 0
	toggle2D.ZIndex = 62
	Instance.new("UICorner", toggle2D).CornerRadius = UDim.new(0, 6)

	-- Área del lienzo (donde va el viewport 3D o la imagen 2D)
	local canvas = Instance.new("Frame", box)
	canvas.Size = UDim2.new(1, -28, 1, -130)
	canvas.Position = UDim2.new(0, 14, 0, 82)
	canvas.BackgroundColor3 = C.card
	canvas.BorderSizePixel = 0
	canvas.ClipsDescendants = true
	canvas.ZIndex = 61
	Instance.new("UICorner", canvas).CornerRadius = UDim.new(0, 8)

	-- ---------- VISTA 3D ----------
	local viewport = Instance.new("ViewportFrame", canvas)
	viewport.Size = UDim2.new(1, 0, 1, 0)
	viewport.BackgroundColor3 = C.modalStep
	viewport.BackgroundTransparency = 0
	viewport.ZIndex = 62
	viewport.Ambient = Color3.fromRGB(200, 200, 200)
	viewport.LightColor = Color3.fromRGB(255, 255, 255)
	viewport.LightDirection = Vector3.new(-0.4, -1, -0.6)
	Instance.new("UICorner", viewport).CornerRadius = UDim.new(0, 8)

	-- WorldModel: imprescindible para que accesorios/MeshParts del avatar
	-- se rendericen dentro del ViewportFrame en versiones modernas.
	local world = Instance.new("WorldModel")
	world.Parent = viewport

	local cam = Instance.new("Camera")
	cam.FieldOfView = 50
	viewport.CurrentCamera = cam
	cam.Parent = viewport

	local hint3D = Instance.new("TextLabel", canvas)
	hint3D.Size = UDim2.new(1, 0, 0, 20)
	hint3D.Position = UDim2.new(0, 0, 1, -22)
	hint3D.BackgroundTransparency = 1
	hint3D.Font = Enum.Font.Gotham
	hint3D.TextSize = 11
	hint3D.TextColor3 = C.subtext
	hint3D.Text = "Cargando modelo 3D..."
	hint3D.ZIndex = 63

	-- ---------- VISTA 2D ----------
	local img2D = Instance.new("ImageLabel", canvas)
	img2D.Size = UDim2.new(1, -20, 1, -50)
	img2D.Position = UDim2.new(0, 10, 0, 10)
	img2D.BackgroundTransparency = 1
	img2D.ScaleType = Enum.ScaleType.Fit
	img2D.Visible = false
	img2D.ZIndex = 62

	-- sub-botones 2D (cuerpo / busto / cabeza)
	local subBar = Instance.new("Frame", canvas)
	subBar.Size = UDim2.new(1, -20, 0, 28)
	subBar.Position = UDim2.new(0, 10, 1, -36)
	subBar.BackgroundTransparency = 1
	subBar.Visible = false
	subBar.ZIndex = 63

	local function thumbURL(kind)
		-- usa rbxthumb (carga directa, sin esperas)
		return ("rbxthumb://type=%s&id=%d&w=420&h=420"):format(kind, userId)
	end

	local sub2DButtons = {}
	local function set2DKind(kind, btn)
		img2D.Image = thumbURL(kind)
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

	-- ---------- CARGA DEL MODELO 3D ----------
	local model
	local yaw = 0
	local loaded3D = false

	-- timeout: si en 12s no cargó, avisar
	task.delay(12, function()
		if overlay.Parent and not loaded3D then
			hint3D.Text = "El modelo 3D está tardando o no cargó. Prueba la vista 2D."
		end
	end)

	task.spawn(function()
		local ok, result = pcall(function()
			return Players:CreateHumanoidModelFromUserId(userId)
		end)
		if not overlay.Parent then
			if ok and result then pcall(function() result:Destroy() end) end
			return
		end
		if not ok or not result then
			hint3D.Text = "No se pudo cargar el modelo 3D. Usa la vista 2D."
			return
		end
		model = result

		-- anclar todo para que no se caiga ni camine
		for _, part in ipairs(model:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Anchored = true
				part.CanCollide = false
			end
		end
		-- desactivar el Humanoid para que no intente animar/caer
		local hum = model:FindFirstChildOfClass("Humanoid")
		if hum then
			pcall(function() hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None end)
			pcall(function() hum.EvaluateStateMachine = false end)
		end

		-- mover el modelo al origen (0,0,0) para encuadrar fácil
		pcall(function() model:PivotTo(CFrame.new(0, 0, 0)) end)
		model.Parent = world

		-- medir el modelo
		local center, msize
		local ok2 = pcall(function() center, msize = model:GetBoundingBox() end)
		if not ok2 or not center then
			center = CFrame.new(0, 0, 0)
			msize = Vector3.new(4, 6, 2)
		end
		local target = center.Position
		local dist = math.max(msize.X, msize.Y, 5) * 1.5 + 3

		local function updateCam()
			local x = math.sin(yaw) * dist
			local z = math.cos(yaw) * dist
			local eye = target + Vector3.new(x, msize.Y * 0.1, z)
			cam.CFrame = CFrame.lookAt(eye, target)
		end
		updateCam()
		loaded3D = true
		hint3D.Text = "Arrastra para girar"

		-- rotación: capturamos el arrastre y aplicamos en RenderStepped
		local dragging, lastX, dxAccum = false, 0, 0
		local RunService = game:GetService("RunService")
		local renderConn
		renderConn = RunService.RenderStepped:Connect(function()
			if not overlay.Parent or not viewport.Parent then
				renderConn:Disconnect()
				return
			end
			if dxAccum ~= 0 then
				yaw = yaw + dxAccum * 0.01
				dxAccum = 0
				updateCam()
			end
		end)

		viewport.InputBegan:Connect(function(inp)
			if inp.UserInputType == Enum.UserInputType.MouseButton1
				or inp.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				lastX = inp.Position.X
			end
		end)
		viewport.InputEnded:Connect(function(inp)
			if inp.UserInputType == Enum.UserInputType.MouseButton1
				or inp.UserInputType == Enum.UserInputType.Touch then
				dragging = false
			end
		end)
		viewport.InputChanged:Connect(function(inp)
			if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement
				or inp.UserInputType == Enum.UserInputType.Touch) then
				dxAccum = dxAccum + (inp.Position.X - lastX)
				lastX = inp.Position.X
			end
		end)
	end)

	-- ---------- LÓGICA DE LOS TOGGLES ----------
	local function show3D()
		viewport.Visible = true
		hint3D.Visible = true
		img2D.Visible = false
		subBar.Visible = false
		toggle3D.BackgroundColor3 = C.accent;  toggle3D.TextColor3 = C.onAccent
		toggle2D.BackgroundColor3 = C.neutral; toggle2D.TextColor3 = C.text
	end
	local function show2D()
		viewport.Visible = false
		hint3D.Visible = false
		img2D.Visible = true
		subBar.Visible = true
		toggle2D.BackgroundColor3 = C.accent;  toggle2D.TextColor3 = C.onAccent
		toggle3D.BackgroundColor3 = C.neutral; toggle3D.TextColor3 = C.text
		if img2D.Image == "" then set2DKind("Avatar", sub2DButtons[1]) end
	end
	toggle3D.MouseButton1Click:Connect(show3D)
	toggle2D.MouseButton1Click:Connect(show2D)

	-- limpiar modelo al cerrar
	overlay.AncestryChanged:Connect(function(_, parent)
		if not parent and model then pcall(function() model:Destroy() end) end
	end)

	-- cerrar tocando el fondo
	overlay.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			local pos = input.Position
			local bp = box.AbsolutePosition
			local bsz = box.AbsoluteSize
			if pos.X < bp.X or pos.X > bp.X + bsz.X
				or pos.Y < bp.Y or pos.Y > bp.Y + bsz.Y then
				overlay:Destroy()
			end
		end
	end)

	show3D()  -- empezar en 3D
end

-- ====================== RENDER: FILA NORMAL ======================
-- copyable = true agrega un botón "Copiar" a la derecha (para UserId, etc.)
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
-- Recorta descripciones largas con "Mostrar más" / "Mostrar menos".
-- La tarjeta crece sola y recorta todo lo que sobre (nada se sale del UI).
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

	local COLLAPSED = 160        -- caracteres visibles cuando está colapsada
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

local function clearScroll(sf)
	for _, c in ipairs(sf:GetChildren()) do
		if not c:IsA("UIListLayout") and not c:IsA("UIPadding") then c:Destroy() end
	end
end

local currentData = nil

local function render(data)
	clearScroll(profileScroll)
	clearScroll(statsScroll)
	clearScroll(itemsScroll)
	clearScroll(analysisScroll)
	currentData = data
	if not data then return end

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

	-- Botón "Ver personaje 3D / 2D"
	local viewCharBtn = Instance.new("TextButton", avatarFrame)
	viewCharBtn.Size = UDim2.new(0, 220, 0, 30)
	viewCharBtn.Position = UDim2.new(0.5, -110, 0, 160)
	viewCharBtn.BackgroundColor3 = C.accent
	viewCharBtn.Text = "👤 Ver personaje (3D / 2D)"
	viewCharBtn.Font = Enum.Font.GothamBold
	viewCharBtn.TextSize = 13
	viewCharBtn.TextColor3 = C.onAccent
	viewCharBtn.BorderSizePixel = 0
	Instance.new("UICorner", viewCharBtn).CornerRadius = UDim.new(0, 6)
	viewCharBtn.MouseButton1Click:Connect(function()
		showCharacterModal(data.UserId, data.Username)
	end)

	-- Link
	local linkFrame = Instance.new("Frame", profileScroll)
	linkFrame.LayoutOrder = 1
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

	-- Estado (presencia en tiempo real)
	local estadoRow = addRow(profileScroll, "Estado", data.Presence, false, data.PresenceColor)
	estadoRow.LayoutOrder = 2

	-- Botón "Unirse a su servidor" (solo si está jugando y hay datos públicos)
	if data.PresenceType == 2 and data.PresencePlace and data.PresenceGame then
		local joinFrame = Instance.new("Frame", profileScroll)
		joinFrame.LayoutOrder = 3
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

	addRow(profileScroll, "Username", data.Username, false).LayoutOrder = 4
	addRow(profileScroll, "Display Name", data.DisplayName, false).LayoutOrder = 5
	addRow(profileScroll, "UserId", data.UserId, true).LayoutOrder = 6            -- botón Copiar ID
	addRow(profileScroll, "Suscripción", data.Subscription, false).LayoutOrder = 7
	addRow(profileScroll, "Verificado", data.Verified, false).LayoutOrder = 8
	addRow(profileScroll, "Baneado", data.Banned, false,
		(data.Banned == "Sí") and C.bad or C.text).LayoutOrder = 9
	addRow(profileScroll, "Creación", data.Created, false).LayoutOrder = 10
	addRow(profileScroll, "Edad de cuenta", data.AccountAge, false).LayoutOrder = 11
	addDescription(profileScroll, data.Description).LayoutOrder = 12

	-- Historial de nombres
	local historyFrame = Instance.new("Frame", profileScroll)
	historyFrame.Name = "NameHistory"
	historyFrame.LayoutOrder = 13
	historyFrame.Size = UDim2.new(1, -4, 0, 0)
	historyFrame.BackgroundTransparency = 1
	historyFrame.AutomaticSize = Enum.AutomaticSize.Y
	local historyLayout = Instance.new("UIListLayout", historyFrame)
	historyLayout.Padding = UDim.new(0, 4)

	local histTitle = Instance.new("TextLabel", historyFrame)
	histTitle.Size = UDim2.new(1, 0, 0, 24)
	histTitle.BackgroundTransparency = 1
	histTitle.Font = Enum.Font.GothamBold
	histTitle.TextSize = 14
	histTitle.TextColor3 = C.accent
	histTitle.Text = "Historial de nombres"
	histTitle.TextXAlignment = Enum.TextXAlignment.Left

	local renderedForUserId = data.UserId
	task.spawn(function()
		local names, hasMore = getNameHistory(data.UserId)
		if currentData == nil or currentData.UserId ~= renderedForUserId then return end
		if not historyFrame.Parent then return end

		if not names then
			local err = Instance.new("TextLabel", historyFrame)
			err.Size = UDim2.new(1, 0, 0, 20)
			err.BackgroundTransparency = 1
			err.Font = Enum.Font.Gotham
			err.TextSize = 12
			err.TextColor3 = C.bad
			err.Text = "No se pudo obtener historial."
			err.TextXAlignment = Enum.TextXAlignment.Left
		else
			local current = Instance.new("Frame", historyFrame)
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
				prevHeader.Size = UDim2.new(1, 0, 0, 20)
				prevHeader.BackgroundTransparency = 1
				prevHeader.Font = Enum.Font.Gotham
				prevHeader.TextSize = 12
				prevHeader.TextColor3 = C.subtext
				prevHeader.Text = "Nombres anteriores:"
				prevHeader.TextXAlignment = Enum.TextXAlignment.Left

				for _, name in ipairs(names) do
					local entry = Instance.new("Frame", historyFrame)
					entry.Size = UDim2.new(1, 0, 0, 20)
					entry.BackgroundTransparency = 1
					entry.ClipsDescendants = true
					local entryLabel = Instance.new("TextLabel", entry)
					entryLabel.Size = UDim2.new(1, -10, 1, 0)
					entryLabel.Position = UDim2.new(0, 5, 0, 0)
					entryLabel.BackgroundTransparency = 1
					entryLabel.Font = Enum.Font.Gotham
					entryLabel.TextSize = 12
					entryLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
					entryLabel.Text = name
					entryLabel.TextXAlignment = Enum.TextXAlignment.Left
					entryLabel.TextTruncate = Enum.TextTruncate.AtEnd
				end

				if hasMore then
					local more = Instance.new("TextLabel", historyFrame)
					more.Size = UDim2.new(1, 0, 0, 20)
					more.BackgroundTransparency = 1
					more.Font = Enum.Font.Gotham
					more.TextSize = 11
					more.TextColor3 = Color3.fromRGB(150, 150, 150)
					more.Text = "Hay más nombres (solo se muestran los primeros 1000)"
					more.TextXAlignment = Enum.TextXAlignment.Left
				end
			else
				local none = Instance.new("TextLabel", historyFrame)
				none.Size = UDim2.new(1, 0, 0, 20)
				none.BackgroundTransparency = 1
				none.Font = Enum.Font.Gotham
				none.TextSize = 12
				none.TextColor3 = Color3.fromRGB(200, 200, 200)
				none.Text = "Sin nombres anteriores."
				none.TextXAlignment = Enum.TextXAlignment.Left
			end
		end
	end)

	-- ---------- PESTAÑA ESTADÍSTICAS ----------
	addRow(statsScroll, "Amigos", data.Friends, false).LayoutOrder = 1
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

	mkBtn("Copiar TXT", 0).MouseButton1Click:Connect(function()
		local lines = {}
		for _, pair in ipairs(order) do
			table.insert(lines, pair[1] .. ": " .. tostring(data[pair[2]] == nil and "No disponible" or data[pair[2]]))
		end
		clipboard(table.concat(lines, "\n"))
		statusLabel.Text = "Copiado a portapapeles (TXT)"
	end)

	mkBtn("Copiar JSON", 140).MouseButton1Click:Connect(function()
		clipboard(HttpService:JSONEncode(data))
		statusLabel.Text = "Copiado a portapapeles (JSON)"
	end)

	-- ---------- PESTAÑA ITEMS (avatar + grupos + badges + RAP) ----------
	-- Items equipados (grid con miniaturas)
	local itemsCard = addNoteCard(itemsScroll, "🎽 Items equipados", "Cargando...", C.accent)
	itemsCard.LayoutOrder = 1

	local groupsCard = addNoteCard(itemsScroll, "👥 Grupos", "Cargando...", C.accent)
	groupsCard.LayoutOrder = 2

	local badgesCard = addNoteCard(itemsScroll, "🏅 Badges recientes", "Cargando...", C.accent)
	badgesCard.LayoutOrder = 3

	local rapCard = addNoteCard(itemsScroll, "💎 RAP (valor limiteds)",
		"Consultando Rolimon's (web externa)...", C.warn)
	rapCard.LayoutOrder = 4

	local function bodyOf(card)
		for _, ch in ipairs(card:GetChildren()) do
			if ch:IsA("TextLabel") and ch.LayoutOrder == 1 then return ch end
		end
	end

	local itemsFor = data.UserId
	-- Items
	task.spawn(function()
		local items = getWornItems(data.UserId)
		if currentData == nil or currentData.UserId ~= itemsFor then return end
		local b = bodyOf(itemsCard); if not b then return end
		if not items then b.Text = "No disponible." ; return end
		if #items == 0 then b.Text = "No lleva items equipados." ; return end
		-- listar nombres (texto) + un grid de miniaturas debajo
		local names = {}
		for _, it in ipairs(items) do
			table.insert(names, "• " .. (it.name or ("Asset " .. it.id)))
		end
		b.Text = #items .. " item(s):\n" .. table.concat(names, "\n")
		-- grid de miniaturas
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

	-- Grupos con rango
	task.spawn(function()
		local groups = getGroupsDetailed(data.UserId)
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

	-- Badges recientes
	task.spawn(function()
		local badges = getRecentBadges(data.UserId, 12)
		if currentData == nil or currentData.UserId ~= itemsFor then return end
		local b = bodyOf(badgesCard); if not b then return end
		if not badges then b.Text = "No disponible." ; return end
		if #badges == 0 then b.Text = "Sin badges recientes." ; return end
		local lines = {}
		for _, bd in ipairs(badges) do table.insert(lines, "• " .. bd.name) end
		b.Text = "Últimos " .. #badges .. ":\n" .. table.concat(lines, "\n")
	end)

	-- RAP (externo)
	task.spawn(function()
		local rap = getRAP(data.UserId)
		if currentData == nil or currentData.UserId ~= itemsFor then return end
		local b = bodyOf(rapCard); if not b then return end
		if not rap or not rap.rap then
			b.Text = "No disponible (la web externa no respondió o tu executor la bloquea). No es un dato oficial de Roblox."
			return
		end
		b.Text = "RAP estimado: " .. tostring(rap.rap) .. " R$\n(Fuente: Rolimon's, valor aproximado, NO oficial.)"
	end)

	-- ---------- PESTAÑA ANÁLISIS ----------
	-- Score de confianza (heurística 0-100) + desglose
	local trustScore, trustLabel, trustColor, trustReasons, tDays, tFriends, tGroups, tBadges = computeTrust(data)
	addNoteCard(analysisScroll,
		"🛡️ Confianza: " .. trustScore .. "/100  (" .. trustLabel .. ")",
		"Puntaje heurístico (NO oficial) combinando antigüedad, amigos, grupos, "
		.. "badges y verificación.\n\nDesglose:\n• " .. table.concat(trustReasons, "\n• "),
		trustColor).LayoutOrder = 1

	-- Gráfico simple antigüedad vs actividad (barras)
	local graphCard = Instance.new("Frame", analysisScroll)
	graphCard.LayoutOrder = 2
	graphCard.Size = UDim2.new(1, -4, 0, 0)
	graphCard.AutomaticSize = Enum.AutomaticSize.Y
	graphCard.BackgroundColor3 = C.card
	graphCard.BorderSizePixel = 0
	graphCard.ClipsDescendants = true
	Instance.new("UICorner", graphCard).CornerRadius = UDim.new(0, 4)
	local gcStroke = Instance.new("UIStroke", graphCard); gcStroke.Color = C.accent; gcStroke.Transparency = 0.5
	local gpad = Instance.new("UIPadding", graphCard)
	gpad.PaddingTop = UDim.new(0,8); gpad.PaddingBottom = UDim.new(0,8)
	gpad.PaddingLeft = UDim.new(0,10); gpad.PaddingRight = UDim.new(0,10)
	local glay = Instance.new("UIListLayout", graphCard)
	glay.Padding = UDim.new(0, 6); glay.SortOrder = Enum.SortOrder.LayoutOrder

	local gh = Instance.new("TextLabel", graphCard)
	gh.LayoutOrder = 0; gh.Size = UDim2.new(1,0,0,20); gh.BackgroundTransparency = 1
	gh.Font = Enum.Font.GothamBold; gh.TextSize = 14; gh.TextColor3 = C.accent
	gh.Text = "📈 Antigüedad vs Actividad"; gh.TextXAlignment = Enum.TextXAlignment.Left

	local function bar(label, value, maxValue, order)
		local row = Instance.new("Frame", graphCard)
		row.LayoutOrder = order; row.Size = UDim2.new(1, 0, 0, 22); row.BackgroundTransparency = 1
		local lab = Instance.new("TextLabel", row)
		lab.Size = UDim2.new(0, 90, 1, 0); lab.BackgroundTransparency = 1
		lab.Font = Enum.Font.Gotham; lab.TextSize = 12; lab.TextColor3 = C.subtext
		lab.Text = label; lab.TextXAlignment = Enum.TextXAlignment.Left
		local track_ = Instance.new("Frame", row)
		track_.Position = UDim2.new(0, 94, 0.5, -7); track_.Size = UDim2.new(1, -130, 0, 14)
		track_.BackgroundColor3 = C.neutral; track_.BorderSizePixel = 0
		Instance.new("UICorner", track_).CornerRadius = UDim.new(0, 4)
		local frac = math.clamp((maxValue > 0) and (value / maxValue) or 0, 0, 1)
		local fill = Instance.new("Frame", track_)
		fill.Size = UDim2.new(frac, 0, 1, 0); fill.BackgroundColor3 = C.accent; fill.BorderSizePixel = 0
		Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 4)
		local val = Instance.new("TextLabel", row)
		val.Position = UDim2.new(1, -32, 0, 0); val.Size = UDim2.new(0, 32, 1, 0)
		val.BackgroundTransparency = 1; val.Font = Enum.Font.GothamBold; val.TextSize = 12
		val.TextColor3 = C.text; val.Text = tostring(value); val.TextXAlignment = Enum.TextXAlignment.Right
	end
	-- escalamos cada métrica a un máximo razonable para verlas comparables
	bar("Días", tDays, 2000, 1)
	bar("Amigos", tFriends, 200, 2)
	bar("Grupos", tGroups, 20, 3)
	bar("Badges", tBadges, 50, 4)

	local infLevel, infColor = computeInfluence(data)
	addNoteCard(analysisScroll,
		"📊 Influencia: " .. infLevel,
		"Estimación (heurística, NO oficial) calculada con seguidores, grupos, "
		.. "favoritos y antigüedad de la cuenta. Es solo una referencia.",
		infColor).LayoutOrder = 3

	local isAlt, reasons = computeAlt(data)
	if isAlt then
		addNoteCard(analysisScroll,
			"⚠️ Posible alt",
			"Indicios (heurística, NO confirmado): " .. table.concat(reasons, ", ")
			.. ". Esto NO prueba que sea un alt; solo son señales típicas de cuentas nuevas/secundarias.",
			C.warn).LayoutOrder = 4
	else
		addNoteCard(analysisScroll,
			"✅ Sin señales de alt",
			"La cuenta no cumple los criterios típicos de un alt (cuenta nueva con 0 amigos/grupos/favoritos). "
			.. "Recuerda que esto es solo una heurística.",
			C.good).LayoutOrder = 4
	end

	-- Amigos en común (asíncrono; solo para otros usuarios)
	local mutualCard = addNoteCard(analysisScroll,
		"👥 Amigos en común",
		(data.UserId == player.UserId) and "Estás viendo tu propia cuenta." or "Calculando...",
		C.accent)
	mutualCard.LayoutOrder = 5

	if data.UserId ~= player.UserId then
		local renderedFor = data.UserId
		task.spawn(function()
			local mutual = getMutualFriends(data.UserId)
			if currentData == nil or currentData.UserId ~= renderedFor then return end
			if not mutualCard.Parent then return end
			-- actualizar el cuerpo de la tarjeta (segundo hijo TextLabel)
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

-- ====================== PESTAÑA COMPARAR + EXTRAS (historial/favoritos/temas) ======================
-- Forward declaration usada por analyze().
local refreshExtras

-- Contenedor del comparador (input de 2 usuarios + resultado lado a lado)
local cmpInputCard = Instance.new("Frame", compareScroll)
cmpInputCard.LayoutOrder = 1
cmpInputCard.Size = UDim2.new(1, -4, 0, 0)
cmpInputCard.AutomaticSize = Enum.AutomaticSize.Y
cmpInputCard.BackgroundColor3 = C.card
cmpInputCard.BorderSizePixel = 0
Instance.new("UICorner", cmpInputCard).CornerRadius = UDim.new(0, 4)
local cmpPad = Instance.new("UIPadding", cmpInputCard)
cmpPad.PaddingTop = UDim.new(0,8); cmpPad.PaddingBottom = UDim.new(0,8)
cmpPad.PaddingLeft = UDim.new(0,10); cmpPad.PaddingRight = UDim.new(0,10)
local cmpLay = Instance.new("UIListLayout", cmpInputCard)
cmpLay.Padding = UDim.new(0,6); cmpLay.SortOrder = Enum.SortOrder.LayoutOrder

local cmpTitle = Instance.new("TextLabel", cmpInputCard)
cmpTitle.LayoutOrder = 0; cmpTitle.Size = UDim2.new(1,0,0,20); cmpTitle.BackgroundTransparency = 1
cmpTitle.Font = Enum.Font.GothamBold; cmpTitle.TextSize = 14; cmpTitle.TextColor3 = C.accent
cmpTitle.Text = "⚖️ Comparar dos cuentas"; cmpTitle.TextXAlignment = Enum.TextXAlignment.Left

local function cmpBox(order, ph)
	local tb = Instance.new("TextBox", cmpInputCard)
	tb.LayoutOrder = order; tb.Size = UDim2.new(1, 0, 0, 28)
	tb.BackgroundColor3 = C.input; tb.PlaceholderText = ph; tb.Text = ""
	tb.Font = Enum.Font.Gotham; tb.TextSize = 13; tb.TextColor3 = C.text
	tb.ClearTextOnFocus = false; tb.BorderSizePixel = 0
	Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 6)
	return tb
end
local cmpA = cmpBox(1, "Usuario o ID  (A)")
local cmpB = cmpBox(2, "Usuario o ID  (B)")

local cmpBtn = Instance.new("TextButton", cmpInputCard)
cmpBtn.LayoutOrder = 3; cmpBtn.Size = UDim2.new(1, 0, 0, 30)
cmpBtn.BackgroundColor3 = C.accent; cmpBtn.Text = "Comparar"
cmpBtn.Font = Enum.Font.GothamBold; cmpBtn.TextSize = 14; cmpBtn.TextColor3 = C.onAccent
cmpBtn.BorderSizePixel = 0
Instance.new("UICorner", cmpBtn).CornerRadius = UDim.new(0, 6)

-- Tarjeta de resultados del comparador
local cmpResult = Instance.new("Frame", compareScroll)
cmpResult.LayoutOrder = 2
cmpResult.Size = UDim2.new(1, -4, 0, 0)
cmpResult.AutomaticSize = Enum.AutomaticSize.Y
cmpResult.BackgroundColor3 = C.card
cmpResult.BorderSizePixel = 0
cmpResult.Visible = false
Instance.new("UICorner", cmpResult).CornerRadius = UDim.new(0, 4)
local crPad = Instance.new("UIPadding", cmpResult)
crPad.PaddingTop = UDim.new(0,8); crPad.PaddingBottom = UDim.new(0,8)
crPad.PaddingLeft = UDim.new(0,10); crPad.PaddingRight = UDim.new(0,10)
local crLay = Instance.new("UIListLayout", cmpResult)
crLay.Padding = UDim.new(0,3); crLay.SortOrder = Enum.SortOrder.LayoutOrder

local function cmpResolve(input)
	input = (input or ""):gsub("%s", "")
	if input == "" then return nil end
	local id = tonumber(input)
	if not id then id = (getUserIdByName(input)) end
	if not id then return nil end
	return gatherData(id)
end

local cmpRunning = false
cmpBtn.MouseButton1Click:Connect(function()
	if cmpRunning then return end
	cmpRunning = true
	cmpBtn.Text = "Comparando..."
	task.spawn(function()
		local a = cmpResolve(cmpA.Text)
		local b = cmpResolve(cmpB.Text)
		cmpBtn.Text = "Comparar"
		cmpRunning = false
		for _, ch in ipairs(cmpResult:GetChildren()) do
			if ch:IsA("Frame") or ch:IsA("TextLabel") then ch:Destroy() end
		end
		if not a or not b then
			cmpResult.Visible = true
			local e = Instance.new("TextLabel", cmpResult)
			e.Size = UDim2.new(1,0,0,20); e.BackgroundTransparency = 1
			e.Font = Enum.Font.Gotham; e.TextSize = 12; e.TextColor3 = C.bad
			e.Text = "No se pudo cargar una o ambas cuentas."
			e.TextXAlignment = Enum.TextXAlignment.Left
			return
		end
		cmpResult.Visible = true

		-- Encabezado: columna fija + dos columnas de nombres
		local headRow = Instance.new("Frame", cmpResult)
		headRow.LayoutOrder = 0; headRow.Size = UDim2.new(1, 0, 0, 24); headRow.BackgroundTransparency = 1
		local hSpacer = Instance.new("TextLabel", headRow)
		hSpacer.Size = UDim2.new(0.30, -4, 1, 0); hSpacer.BackgroundTransparency = 1
		hSpacer.Font = Enum.Font.GothamBold; hSpacer.TextSize = 12; hSpacer.TextColor3 = C.subtext
		hSpacer.Text = "Campo"; hSpacer.TextXAlignment = Enum.TextXAlignment.Left
		local hA = Instance.new("TextLabel", headRow)
		hA.Position = UDim2.new(0.30, 0, 0, 0); hA.Size = UDim2.new(0.35, -4, 1, 0); hA.BackgroundTransparency = 1
		hA.Font = Enum.Font.GothamBold; hA.TextSize = 12; hA.TextColor3 = C.accent
		hA.Text = "A: " .. a.Username; hA.TextXAlignment = Enum.TextXAlignment.Left
		hA.TextTruncate = Enum.TextTruncate.AtEnd
		local hB = Instance.new("TextLabel", headRow)
		hB.Position = UDim2.new(0.65, 0, 0, 0); hB.Size = UDim2.new(0.35, -4, 1, 0); hB.BackgroundTransparency = 1
		hB.Font = Enum.Font.GothamBold; hB.TextSize = 12; hB.TextColor3 = C.accent
		hB.Text = "B: " .. b.Username; hB.TextXAlignment = Enum.TextXAlignment.Left
		hB.TextTruncate = Enum.TextTruncate.AtEnd

		local fields = {
			{"Edad", "AccountAge"}, {"Amigos","Friends"}, {"Seguidores","Followers"},
			{"Siguiendo","Following"}, {"Grupos","Groups"}, {"Badges","Badges"},
			{"Favoritos","Favorites"}, {"Verificado","Verified"},
			{"Baneado","Banned"}, {"Suscripción","Subscription"}, {"Estado","Presence"},
		}
		-- para comparar numéricamente y resaltar el mayor
		local function numOf(v)
			if v == nil then return nil end
			local n = tostring(v):match("(%d+)")
			return n and tonumber(n) or nil
		end

		for i, f in ipairs(fields) do
			local row = Instance.new("Frame", cmpResult)
			row.LayoutOrder = i
			row.Size = UDim2.new(1, 0, 0, 0)
			row.AutomaticSize = Enum.AutomaticSize.Y
			row.BackgroundColor3 = (i % 2 == 0) and C.neutral or C.card
			row.BackgroundTransparency = 0.4
			row.BorderSizePixel = 0
			Instance.new("UICorner", row).CornerRadius = UDim.new(0, 4)
			local rpad = Instance.new("UIPadding", row)
			rpad.PaddingTop = UDim.new(0,3); rpad.PaddingBottom = UDim.new(0,3)
			rpad.PaddingLeft = UDim.new(0,4); rpad.PaddingRight = UDim.new(0,4)

			local lab = Instance.new("TextLabel", row)
			lab.Size = UDim2.new(0.30, -4, 1, 0); lab.BackgroundTransparency = 1
			lab.Font = Enum.Font.Gotham; lab.TextSize = 11; lab.TextColor3 = C.subtext
			lab.Text = f[1]; lab.TextXAlignment = Enum.TextXAlignment.Left
			lab.TextYAlignment = Enum.TextYAlignment.Top
			lab.TextWrapped = true

			local av = (a[f[2]] == nil) and "-" or tostring(a[f[2]])
			local bv = (b[f[2]] == nil) and "-" or tostring(b[f[2]])
			local na, nb = numOf(av), numOf(bv)
			local colA, colB = C.text, C.text
			if na and nb and na ~= nb then
				if na > nb then colA = C.good else colB = C.good end
			end

			local va = Instance.new("TextLabel", row)
			va.Position = UDim2.new(0.30, 0, 0, 0); va.Size = UDim2.new(0.35, -4, 1, 0)
			va.BackgroundTransparency = 1
			va.Font = Enum.Font.GothamBold; va.TextSize = 11; va.TextColor3 = colA
			va.Text = av; va.TextXAlignment = Enum.TextXAlignment.Left
			va.TextYAlignment = Enum.TextYAlignment.Top
			va.TextWrapped = true

			local vb = Instance.new("TextLabel", row)
			vb.Position = UDim2.new(0.65, 0, 0, 0); vb.Size = UDim2.new(0.35, -4, 1, 0)
			vb.BackgroundTransparency = 1
			vb.Font = Enum.Font.GothamBold; vb.TextSize = 11; vb.TextColor3 = colB
			vb.Text = bv; vb.TextXAlignment = Enum.TextXAlignment.Left
			vb.TextYAlignment = Enum.TextYAlignment.Top
			vb.TextWrapped = true
		end
	end)
end)

-- Tarjeta de AUTO-EXECUTE (en Ajustes)
local aeCard = Instance.new("Frame", settingsScroll)
aeCard.LayoutOrder = 1
aeCard.Size = UDim2.new(1, -4, 0, 0)
aeCard.AutomaticSize = Enum.AutomaticSize.Y
aeCard.BackgroundColor3 = C.card
aeCard.BorderSizePixel = 0
Instance.new("UICorner", aeCard).CornerRadius = UDim.new(0, 4)
local aeStroke = Instance.new("UIStroke", aeCard); aeStroke.Color = C.accent; aeStroke.Transparency = 0.5
local aePad = Instance.new("UIPadding", aeCard)
aePad.PaddingTop = UDim.new(0,8); aePad.PaddingBottom = UDim.new(0,8)
aePad.PaddingLeft = UDim.new(0,10); aePad.PaddingRight = UDim.new(0,10)
local aeLay = Instance.new("UIListLayout", aeCard)
aeLay.Padding = UDim.new(0,6); aeLay.SortOrder = Enum.SortOrder.LayoutOrder

local aeTitle = Instance.new("TextLabel", aeCard)
aeTitle.LayoutOrder = 0; aeTitle.Size = UDim2.new(1,0,0,20); aeTitle.BackgroundTransparency = 1
aeTitle.Font = Enum.Font.GothamBold; aeTitle.TextSize = 14; aeTitle.TextColor3 = C.accent
aeTitle.Text = "⚙️ Auto-Execute"; aeTitle.TextXAlignment = Enum.TextXAlignment.Left

local aeDesc = Instance.new("TextLabel", aeCard)
aeDesc.LayoutOrder = 1; aeDesc.Size = UDim2.new(1,0,0,0); aeDesc.AutomaticSize = Enum.AutomaticSize.Y
aeDesc.BackgroundTransparency = 1; aeDesc.Font = Enum.Font.Gotham; aeDesc.TextSize = 11
aeDesc.TextColor3 = C.subtext; aeDesc.TextWrapped = true; aeDesc.TextXAlignment = Enum.TextXAlignment.Left
aeDesc.Text = "Ejecuta el script solo al entrar al juego. Necesita que tu executor "
	.. "tenga carpeta autoexec y la URL de tu script (loadstring)."

local aeUrl = Instance.new("TextBox", aeCard)
aeUrl.LayoutOrder = 2; aeUrl.Size = UDim2.new(1, 0, 0, 28)
aeUrl.BackgroundColor3 = C.input; aeUrl.PlaceholderText = "URL del script (https://...)"
aeUrl.Text = store.autoexecUrl or ""
aeUrl.Font = Enum.Font.Code; aeUrl.TextSize = 12; aeUrl.TextColor3 = C.text
aeUrl.ClearTextOnFocus = false; aeUrl.BorderSizePixel = 0; aeUrl.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", aeUrl).CornerRadius = UDim.new(0, 6)
local aeUrlPad = Instance.new("UIPadding", aeUrl); aeUrlPad.PaddingLeft = UDim.new(0,8); aeUrlPad.PaddingRight = UDim.new(0,8)
aeUrl.FocusLost:Connect(function()
	store.autoexecUrl = aeUrl.Text:gsub("%s", "")
	saveStore()
end)

local aeToggle = Instance.new("TextButton", aeCard)
aeToggle.LayoutOrder = 3; aeToggle.Size = UDim2.new(1, 0, 0, 30)
aeToggle.Font = Enum.Font.GothamBold; aeToggle.TextSize = 14; aeToggle.BorderSizePixel = 0
Instance.new("UICorner", aeToggle).CornerRadius = UDim.new(0, 6)

local aeStatus = Instance.new("TextLabel", aeCard)
aeStatus.LayoutOrder = 4; aeStatus.Size = UDim2.new(1,0,0,0); aeStatus.AutomaticSize = Enum.AutomaticSize.Y
aeStatus.BackgroundTransparency = 1; aeStatus.Font = Enum.Font.Gotham; aeStatus.TextSize = 11
aeStatus.TextColor3 = C.subtext; aeStatus.TextWrapped = true; aeStatus.TextXAlignment = Enum.TextXAlignment.Left
aeStatus.Text = ""

local function refreshAeToggle()
	if store.autoexec then
		aeToggle.Text = "✓ Auto-Execute ACTIVADO (click para desactivar)"
		aeToggle.BackgroundColor3 = C.good; aeToggle.TextColor3 = C.onAccent
	else
		aeToggle.Text = "Activar Auto-Execute"
		aeToggle.BackgroundColor3 = C.neutral; aeToggle.TextColor3 = C.text
	end
end
refreshAeToggle()

aeToggle.MouseButton1Click:Connect(function()
	if store.autoexec then
		autoexecDisable()
		store.autoexec = false
		saveStore()
		aeStatus.Text = "Auto-execute desactivado."
		refreshAeToggle()
	else
		local ok, msg = autoexecEnable(aeUrl.Text:gsub("%s", ""))
		aeStatus.Text = msg
		aeStatus.TextColor3 = ok and C.good or C.bad
		if ok then
			store.autoexec = true
			store.autoexecUrl = aeUrl.Text:gsub("%s", "")
			saveStore()
			refreshAeToggle()
		end
	end
end)

-- Tarjeta de TEMAS (en Ajustes)
local themeCard = Instance.new("Frame", settingsScroll)
themeCard.LayoutOrder = 3
themeCard.Size = UDim2.new(1, -4, 0, 0)
themeCard.AutomaticSize = Enum.AutomaticSize.Y
themeCard.BackgroundColor3 = C.card
themeCard.BorderSizePixel = 0
Instance.new("UICorner", themeCard).CornerRadius = UDim.new(0, 4)
local thPad = Instance.new("UIPadding", themeCard)
thPad.PaddingTop = UDim.new(0,8); thPad.PaddingBottom = UDim.new(0,8)
thPad.PaddingLeft = UDim.new(0,10); thPad.PaddingRight = UDim.new(0,10)
local thLay = Instance.new("UIListLayout", themeCard)
thLay.Padding = UDim.new(0,6); thLay.SortOrder = Enum.SortOrder.LayoutOrder

local thTitle = Instance.new("TextLabel", themeCard)
thTitle.LayoutOrder = 0; thTitle.Size = UDim2.new(1,0,0,20); thTitle.BackgroundTransparency = 1
thTitle.Font = Enum.Font.GothamBold; thTitle.TextSize = 14; thTitle.TextColor3 = C.accent
thTitle.Text = "🎨 Tema (se aplica al reabrir)"; thTitle.TextXAlignment = Enum.TextXAlignment.Left

local thBtnRow = Instance.new("Frame", themeCard)
thBtnRow.LayoutOrder = 1; thBtnRow.Size = UDim2.new(1, 0, 0, 28); thBtnRow.BackgroundTransparency = 1
local thBtnLay = Instance.new("UIListLayout", thBtnRow)
thBtnLay.FillDirection = Enum.FillDirection.Horizontal; thBtnLay.Padding = UDim.new(0, 6)

local thInfo = Instance.new("TextLabel", themeCard)
thInfo.LayoutOrder = 2; thInfo.Size = UDim2.new(1,0,0,16); thInfo.BackgroundTransparency = 1
thInfo.Font = Enum.Font.Gotham; thInfo.TextSize = 11; thInfo.TextColor3 = C.subtext
thInfo.Text = "Tema actual: " .. store.theme; thInfo.TextXAlignment = Enum.TextXAlignment.Left

for _, tn in ipairs({ "negro", "azul", "verde" }) do
	local tb = Instance.new("TextButton", thBtnRow)
	tb.Size = UDim2.new(0, 80, 1, 0)
	tb.BackgroundColor3 = (store.theme == tn) and C.accent or C.neutral
	tb.TextColor3 = (store.theme == tn) and C.onAccent or C.text
	tb.Text = tn; tb.Font = Enum.Font.GothamBold; tb.TextSize = 12; tb.BorderSizePixel = 0
	Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 5)
	tb.MouseButton1Click:Connect(function()
		store.theme = tn
		saveStore()
		thInfo.Text = "Guardado: " .. tn .. ". Cierra y reabre el script para verlo."
		for _, b in ipairs(thBtnRow:GetChildren()) do
			if b:IsA("TextButton") then
				b.BackgroundColor3 = (b.Text == tn) and C.accent or C.neutral
				b.TextColor3 = (b.Text == tn) and C.onAccent or C.text
			end
		end
	end)
end

-- Tarjeta de HISTORIAL (en Ajustes)
local histCard = Instance.new("Frame", settingsScroll)
histCard.LayoutOrder = 4
histCard.Size = UDim2.new(1, -4, 0, 0)
histCard.AutomaticSize = Enum.AutomaticSize.Y
histCard.BackgroundColor3 = C.card
histCard.BorderSizePixel = 0
Instance.new("UICorner", histCard).CornerRadius = UDim.new(0, 4)
local hcPad = Instance.new("UIPadding", histCard)
hcPad.PaddingTop = UDim.new(0,8); hcPad.PaddingBottom = UDim.new(0,8)
hcPad.PaddingLeft = UDim.new(0,10); hcPad.PaddingRight = UDim.new(0,10)
local hcLay = Instance.new("UIListLayout", histCard)
hcLay.Padding = UDim.new(0,4); hcLay.SortOrder = Enum.SortOrder.LayoutOrder

local hcTitle = Instance.new("TextLabel", histCard)
hcTitle.LayoutOrder = 0; hcTitle.Size = UDim2.new(1,0,0,20); hcTitle.BackgroundTransparency = 1
hcTitle.Font = Enum.Font.GothamBold; hcTitle.TextSize = 14; hcTitle.TextColor3 = C.accent
hcTitle.Text = "🕘 Historial / Favoritos"; hcTitle.TextXAlignment = Enum.TextXAlignment.Left

-- fila reutilizable: nombre + botón ★ favorito + botón "ver"
local function makeListRow(parent, order, entry, isFav)
	local row = Instance.new("Frame", parent)
	row.LayoutOrder = order; row.Size = UDim2.new(1, 0, 0, 26); row.BackgroundColor3 = C.neutral
	row.BorderSizePixel = 0
	Instance.new("UICorner", row).CornerRadius = UDim.new(0, 4)
	local nm = Instance.new("TextButton", row)
	nm.Size = UDim2.new(1, -90, 1, 0); nm.Position = UDim2.new(0, 8, 0, 0)
	nm.BackgroundTransparency = 1; nm.Font = Enum.Font.Gotham; nm.TextSize = 12
	nm.TextColor3 = C.text; nm.TextXAlignment = Enum.TextXAlignment.Left
	nm.Text = (entry.display or entry.name or ("ID " .. entry.id)) .. "  (@" .. (entry.name or entry.id) .. ")"
	nm.TextTruncate = Enum.TextTruncate.AtEnd
	nm.MouseButton1Click:Connect(function()
		searchBox.Text = entry.name or tostring(entry.id)
		-- saltar a la pestaña Perfil
		if tabs[1] then
			for _, t in pairs(tabs) do t.BackgroundColor3 = C.neutral; t.TextColor3 = C.text end
			for _, p in pairs(pages) do p.Visible = false end
			tabs[1].BackgroundColor3 = C.accent; tabs[1].TextColor3 = C.onAccent
			pages[1].Visible = true
		end
		if analyze then analyze(entry.name or tostring(entry.id)) end
	end)
	-- estrella favorito
	local star = Instance.new("TextButton", row)
	star.Size = UDim2.new(0, 26, 0, 20); star.Position = UDim2.new(1, -32, 0.5, -10)
	star.BackgroundTransparency = 1; star.Font = Enum.Font.GothamBold; star.TextSize = 16
	star.Text = isFav and "★" or "☆"
	star.TextColor3 = isFav and C.warn or C.subtext
	star.MouseButton1Click:Connect(function()
		-- toggle en favoritos
		local found = false
		for i = #store.favorites, 1, -1 do
			if store.favorites[i].id == entry.id then table.remove(store.favorites, i); found = true end
		end
		if not found then table.insert(store.favorites, 1, entry) end
		saveStore()
		if refreshExtras then refreshExtras() end
	end)
	return row
end

refreshExtras = function()
	-- limpiar filas previas (todo menos el título y layout/padding)
	for _, c in ipairs(histCard:GetChildren()) do
		if (c:IsA("Frame") or c:IsA("TextLabel")) and c ~= hcTitle then c:Destroy() end
	end
	local order = 1
	-- favoritos primero
	if #store.favorites > 0 then
		local favHdr = Instance.new("TextLabel", histCard)
		favHdr.LayoutOrder = order; order = order + 1
		favHdr.Size = UDim2.new(1,0,0,16); favHdr.BackgroundTransparency = 1
		favHdr.Font = Enum.Font.Gotham; favHdr.TextSize = 11; favHdr.TextColor3 = C.warn
		favHdr.Text = "Favoritos:"; favHdr.TextXAlignment = Enum.TextXAlignment.Left
		for _, e in ipairs(store.favorites) do
			makeListRow(histCard, order, e, true); order = order + 1
		end
	end
	-- historial
	local hsHdr = Instance.new("TextLabel", histCard)
	hsHdr.LayoutOrder = order; order = order + 1
	hsHdr.Size = UDim2.new(1,0,0,16); hsHdr.BackgroundTransparency = 1
	hsHdr.Font = Enum.Font.Gotham; hsHdr.TextSize = 11; hsHdr.TextColor3 = C.subtext
	hsHdr.Text = "Recientes:"; hsHdr.TextXAlignment = Enum.TextXAlignment.Left
	if #store.history == 0 then
		local none = Instance.new("TextLabel", histCard)
		none.LayoutOrder = order; order = order + 1
		none.Size = UDim2.new(1,0,0,18); none.BackgroundTransparency = 1
		none.Font = Enum.Font.Gotham; none.TextSize = 11; none.TextColor3 = C.subtext
		none.Text = (hasFS and "Aún no has buscado a nadie." or "Tu executor no guarda archivos (sesión temporal).")
		none.TextXAlignment = Enum.TextXAlignment.Left
	else
		for _, e in ipairs(store.history) do
			local isFav = false
			for _, f in ipairs(store.favorites) do if f.id == e.id then isFav = true break end end
			makeListRow(histCard, order, e, isFav); order = order + 1
		end
	end
end
refreshExtras()

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
			-- Guardar en historial (sin duplicados, máx 15, lo más reciente arriba)
			local entry = { id = data.UserId, name = data.Username, display = data.DisplayName }
			for i = #store.history, 1, -1 do
				if store.history[i].id == data.UserId then table.remove(store.history, i) end
			end
			table.insert(store.history, 1, entry)
			while #store.history > 15 do table.remove(store.history) end
			saveStore()
			if refreshExtras then refreshExtras() end
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
createTab("Comparar", comparePage)
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
-- Mismo patrón que el arrastre: solo conecta InputChanged mientras
-- redimensionas activamente, para no tirar FPS.
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

-- ====================== NOTIFICACIÓN: AUTO-EXECUTE ======================
-- Solo aparece una vez (hasta que el usuario responda), y solo si el
-- executor tiene sistema de archivos.
local function showAutoExecNotif()
	if not hasFS or store.autoexecAsked then return end

	local notif = Instance.new("Frame", gui)
	notif.Name = "AutoExecNotif"
	notif.Size = UDim2.new(0, 300, 0, 0)
	notif.AutomaticSize = Enum.AutomaticSize.Y
	notif.Position = UDim2.new(1, -312, 0, 12)
	notif.BackgroundColor3 = C.modalBg
	notif.BorderSizePixel = 0
	notif.ZIndex = 80
	Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 10)
	local ns = Instance.new("UIStroke", notif); ns.Color = C.accent; ns.Transparency = 0.4
	local np = Instance.new("UIPadding", notif)
	np.PaddingTop = UDim.new(0,10); np.PaddingBottom = UDim.new(0,10)
	np.PaddingLeft = UDim.new(0,12); np.PaddingRight = UDim.new(0,12)
	local nl = Instance.new("UIListLayout", notif)
	nl.Padding = UDim.new(0,8); nl.SortOrder = Enum.SortOrder.LayoutOrder

	local nTitle = Instance.new("TextLabel", notif)
	nTitle.LayoutOrder = 0; nTitle.Size = UDim2.new(1,0,0,20); nTitle.BackgroundTransparency = 1
	nTitle.Font = Enum.Font.GothamBold; nTitle.TextSize = 14; nTitle.TextColor3 = C.accent
	nTitle.Text = "⚙️ Auto-Execute"; nTitle.TextXAlignment = Enum.TextXAlignment.Left
	nTitle.ZIndex = 81

	local nBody = Instance.new("TextLabel", notif)
	nBody.LayoutOrder = 1; nBody.Size = UDim2.new(1,0,0,0); nBody.AutomaticSize = Enum.AutomaticSize.Y
	nBody.BackgroundTransparency = 1; nBody.Font = Enum.Font.Gotham; nBody.TextSize = 12
	nBody.TextColor3 = C.text; nBody.TextWrapped = true; nBody.TextXAlignment = Enum.TextXAlignment.Left
	nBody.Text = "¿Quieres ejecutar el script automáticamente al entrar al juego? "
		.. "Puedes configurarlo en la pestaña Ajustes."
	nBody.ZIndex = 81

	local btnRow = Instance.new("Frame", notif)
	btnRow.LayoutOrder = 2; btnRow.Size = UDim2.new(1, 0, 0, 30); btnRow.BackgroundTransparency = 1
	btnRow.ZIndex = 81
	local rowLay = Instance.new("UIListLayout", btnRow)
	rowLay.FillDirection = Enum.FillDirection.Horizontal; rowLay.Padding = UDim.new(0, 8)

	local yesBtn = Instance.new("TextButton", btnRow)
	yesBtn.Size = UDim2.new(0.5, -4, 1, 0); yesBtn.BackgroundColor3 = C.accent
	yesBtn.Text = "Ir a Ajustes"; yesBtn.Font = Enum.Font.GothamBold; yesBtn.TextSize = 12
	yesBtn.TextColor3 = C.onAccent; yesBtn.BorderSizePixel = 0; yesBtn.ZIndex = 82
	Instance.new("UICorner", yesBtn).CornerRadius = UDim.new(0, 6)

	local noBtn = Instance.new("TextButton", btnRow)
	noBtn.Size = UDim2.new(0.5, -4, 1, 0); noBtn.BackgroundColor3 = C.neutral
	noBtn.Text = "Ahora no"; noBtn.Font = Enum.Font.GothamBold; noBtn.TextSize = 12
	noBtn.TextColor3 = C.text; noBtn.BorderSizePixel = 0; noBtn.ZIndex = 82
	Instance.new("UICorner", noBtn).CornerRadius = UDim.new(0, 6)

	local function dismiss(goSettings)
		store.autoexecAsked = true
		saveStore()
		notif:Destroy()
		if goSettings and tabs[6] then
			for _, t in pairs(tabs) do t.BackgroundColor3 = C.neutral; t.TextColor3 = C.text end
			for _, p in pairs(pages) do p.Visible = false end
			tabs[6].BackgroundColor3 = C.accent; tabs[6].TextColor3 = C.onAccent
			pages[6].Visible = true
		end
	end
	yesBtn.MouseButton1Click:Connect(function() dismiss(true) end)
	noBtn.MouseButton1Click:Connect(function() dismiss(false) end)
end
task.spawn(showAutoExecNotif)

print(("[Profile Analyzer v2.7.0] Cargado correctamente. Executor: %s"):format(EXECUTOR_NAME))