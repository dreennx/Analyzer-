local Players = game:GetService("\80\108\97\121\101\114\115")
local HttpService = game:GetService("\72\116\116\112\83\101\114\118\105\99\101")
local UserInputService = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
local TweenService = game:GetService("\84\119\101\101\110\83\101\114\118\105\99\101")
local _a = Players._bhb
local _b = _a:WaitForChild("\80\108\97\121\101\114\71\117\105")
local _c = (type(writefile) == "\102\117\110\99\116\105\111\110")
 and (type(readfile) == "\102\117\110\99\116\105\111\110")
 and (type(isfile) == "\102\117\110\99\116\105\111\110")
local _d = { theme = "\116\111\114", headTags = true, animations = true, ownTag = true, introEnabled = true, introSeen = false, advanced = false }
local function saveStore()
 if not _c then return end
 pcall(function()
 local _e = HttpService:JSONEncode(_d)
 writefile("\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\100\97\116\97\46\106\115\111\110", _e)
 writefile("\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\100\97\116\97\46\98\97\107\46\106\115\111\110", _e)
 end)
end
local function loadStore()
 if not _c then return end
 pcall(function()
 local _f
 if isfile("\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\100\97\116\97\46\106\115\111\110") then _f = readfile("\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\100\97\116\97\46\106\115\111\110") end
 local _g, _ie = pcall(function() return HttpService:JSONDecode(_f) end)
 if (not _g or type(_ie) ~= "\116\97\98\108\101") and isfile("\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\100\97\116\97\46\98\97\107\46\106\115\111\110") then
 _g, _ie = pcall(function() return HttpService:JSONDecode(readfile("\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\100\97\116\97\46\98\97\107\46\106\115\111\110")) end)
 end
 if _g and type(_ie) == "\116\97\98\108\101" then
 for k, v in pairs(_ie) do _d[k] = v end
 end
 end)
end
loadStore()
local _h = {
 negro = {
 bg=Color3.fromRGB(26,27,30), _o=Color3.fromRGB(34,36,39), _jj=Color3.fromRGB(30,31,34),
 surface=Color3.fromRGB(34,36,39), surfaceHover=Color3.fromRGB(42,44,48), elevated=Color3.fromRGB(46,48,53),
 link=Color3.fromRGB(26,27,30), neutral=Color3.fromRGB(40,42,46), _whb=Color3.fromRGB(58,60,66),
 _jq=Color3.fromRGB(50,52,58), headerBg=Color3.fromRGB(30,31,34), textDisabled=Color3.fromRGB(85,87,94),
 _idb=Color3.fromRGB(224,226,230), onAccent=Color3.fromRGB(26,27,30),
 good=Color3.fromRGB(87,210,143), warn=Color3.fromRGB(240,178,50), bad=Color3.fromRGB(237,66,69),
 _hb=Color3.fromRGB(224,225,228), subtext=Color3.fromRGB(139,141,148),
 modalBg=Color3.fromRGB(30,31,34), modalStep=Color3.fromRGB(26,27,30),
 },
 azul = {
 bg=Color3.fromRGB(18,24,42), _o=Color3.fromRGB(28,36,62), _jj=Color3.fromRGB(24,30,54),
 surface=Color3.fromRGB(28,36,62), surfaceHover=Color3.fromRGB(36,44,72), elevated=Color3.fromRGB(40,50,82),
 link=Color3.fromRGB(18,24,42), neutral=Color3.fromRGB(38,48,80), _whb=Color3.fromRGB(52,64,100),
 _jq=Color3.fromRGB(44,56,90), headerBg=Color3.fromRGB(22,28,50), textDisabled=Color3.fromRGB(80,90,120),
 _idb=Color3.fromRGB(88,101,242), onAccent=Color3.fromRGB(255,255,255),
 good=Color3.fromRGB(87,210,143), warn=Color3.fromRGB(240,178,50), bad=Color3.fromRGB(237,66,69),
 _hb=Color3.fromRGB(240,240,245), subtext=Color3.fromRGB(160,165,185),
 modalBg=Color3.fromRGB(22,28,50), modalStep=Color3.fromRGB(16,22,40),
 },
 verde = {
 bg=Color3.fromRGB(14,22,16), _o=Color3.fromRGB(22,34,26), _jj=Color3.fromRGB(20,30,23),
 surface=Color3.fromRGB(22,34,26), surfaceHover=Color3.fromRGB(30,44,34), elevated=Color3.fromRGB(34,50,38),
 link=Color3.fromRGB(14,22,16), neutral=Color3.fromRGB(30,46,34), _whb=Color3.fromRGB(44,66,50),
 _jq=Color3.fromRGB(38,56,42), headerBg=Color3.fromRGB(18,28,20), textDisabled=Color3.fromRGB(75,95,80),
 _idb=Color3.fromRGB(60,220,130), onAccent=Color3.fromRGB(8,16,10),
 good=Color3.fromRGB(87,210,143), warn=Color3.fromRGB(230,190,90), bad=Color3.fromRGB(230,100,100),
 _hb=Color3.fromRGB(225,235,228), subtext=Color3.fromRGB(120,140,128),
 modalBg=Color3.fromRGB(18,28,20), modalStep=Color3.fromRGB(14,22,16),
 },
 tor = {
 bg=Color3.fromRGB(24,18,34), _o=Color3.fromRGB(35,26,48), _jj=Color3.fromRGB(30,22,42),
 surface=Color3.fromRGB(35,26,48), surfaceHover=Color3.fromRGB(44,34,58), elevated=Color3.fromRGB(50,38,66),
 link=Color3.fromRGB(24,18,34), neutral=Color3.fromRGB(46,34,62), _whb=Color3.fromRGB(65,50,88),
 _jq=Color3.fromRGB(55,42,74), headerBg=Color3.fromRGB(28,21,40), textDisabled=Color3.fromRGB(90,78,110),
 _idb=Color3.fromRGB(160,100,210), onAccent=Color3.fromRGB(255,255,255),
 good=Color3.fromRGB(87,210,143), warn=Color3.fromRGB(230,180,90), bad=Color3.fromRGB(225,95,95),
 _hb=Color3.fromRGB(235,230,242), subtext=Color3.fromRGB(150,135,168),
 modalBg=Color3.fromRGB(28,21,40), modalStep=Color3.fromRGB(22,16,32),
 },
 rojo = {
 bg=Color3.fromRGB(24,14,16), _o=Color3.fromRGB(38,22,25), _jj=Color3.fromRGB(32,18,21),
 surface=Color3.fromRGB(38,22,25), surfaceHover=Color3.fromRGB(48,30,34), elevated=Color3.fromRGB(54,34,38),
 link=Color3.fromRGB(24,14,16), neutral=Color3.fromRGB(50,28,32), _whb=Color3.fromRGB(76,42,48),
 _jq=Color3.fromRGB(62,36,40), headerBg=Color3.fromRGB(28,16,19), textDisabled=Color3.fromRGB(100,72,78),
 _idb=Color3.fromRGB(237,66,69), onAccent=Color3.fromRGB(255,255,255),
 good=Color3.fromRGB(87,210,143), warn=Color3.fromRGB(230,180,90), bad=Color3.fromRGB(255,90,90),
 _hb=Color3.fromRGB(240,228,230), subtext=Color3.fromRGB(165,135,140),
 modalBg=Color3.fromRGB(28,16,19), modalStep=Color3.fromRGB(22,12,14),
 },
 morado = {
 bg=Color3.fromRGB(20,16,32), _o=Color3.fromRGB(30,24,48), _jj=Color3.fromRGB(26,20,42),
 surface=Color3.fromRGB(30,24,48), surfaceHover=Color3.fromRGB(40,32,60), elevated=Color3.fromRGB(46,38,68),
 link=Color3.fromRGB(20,16,32), neutral=Color3.fromRGB(42,32,66), _whb=Color3.fromRGB(62,48,98),
 _jq=Color3.fromRGB(52,40,80), headerBg=Color3.fromRGB(24,18,38), textDisabled=Color3.fromRGB(88,76,115),
 _idb=Color3.fromRGB(170,110,255), onAccent=Color3.fromRGB(255,255,255),
 good=Color3.fromRGB(87,210,143), warn=Color3.fromRGB(230,180,90), bad=Color3.fromRGB(235,95,95),
 _hb=Color3.fromRGB(232,226,245), subtext=Color3.fromRGB(150,138,175),
 modalBg=Color3.fromRGB(24,18,38), modalStep=Color3.fromRGB(18,14,28),
 },
 cyan = {
 bg=Color3.fromRGB(12,22,24), _o=Color3.fromRGB(18,34,37), _jj=Color3.fromRGB(16,30,33),
 surface=Color3.fromRGB(18,34,37), surfaceHover=Color3.fromRGB(26,44,48), elevated=Color3.fromRGB(30,50,54),
 link=Color3.fromRGB(12,22,24), neutral=Color3.fromRGB(26,46,50), _whb=Color3.fromRGB(38,68,74),
 _jq=Color3.fromRGB(32,56,62), headerBg=Color3.fromRGB(14,26,28), textDisabled=Color3.fromRGB(68,96,100),
 _idb=Color3.fromRGB(0,220,210), onAccent=Color3.fromRGB(6,18,18),
 good=Color3.fromRGB(87,210,143), warn=Color3.fromRGB(230,180,90), bad=Color3.fromRGB(235,95,95),
 _hb=Color3.fromRGB(224,238,238), subtext=Color3.fromRGB(120,150,150),
 modalBg=Color3.fromRGB(14,26,28), modalStep=Color3.fromRGB(10,20,22),
 },
 rosa = {
 bg=Color3.fromRGB(26,16,22), _o=Color3.fromRGB(40,24,34), _jj=Color3.fromRGB(34,20,28),
 surface=Color3.fromRGB(40,24,34), surfaceHover=Color3.fromRGB(52,32,44), elevated=Color3.fromRGB(58,36,50),
 link=Color3.fromRGB(26,16,22), neutral=Color3.fromRGB(52,30,44), _whb=Color3.fromRGB(78,46,66),
 _jq=Color3.fromRGB(64,38,54), headerBg=Color3.fromRGB(30,18,26), textDisabled=Color3.fromRGB(105,78,92),
 _idb=Color3.fromRGB(255,110,190), onAccent=Color3.fromRGB(28,10,20),
 good=Color3.fromRGB(87,210,143), warn=Color3.fromRGB(230,180,90), bad=Color3.fromRGB(235,95,95),
 _hb=Color3.fromRGB(245,228,238), subtext=Color3.fromRGB(170,135,155),
 modalBg=Color3.fromRGB(30,18,26), modalStep=Color3.fromRGB(24,14,20),
 },
 naranja = {
 bg=Color3.fromRGB(26,18,10), _o=Color3.fromRGB(40,28,16), _jj=Color3.fromRGB(34,24,14),
 surface=Color3.fromRGB(40,28,16), surfaceHover=Color3.fromRGB(52,36,22), elevated=Color3.fromRGB(58,42,26),
 link=Color3.fromRGB(26,18,10), neutral=Color3.fromRGB(52,36,20), _whb=Color3.fromRGB(78,56,32),
 _jq=Color3.fromRGB(64,46,26), headerBg=Color3.fromRGB(30,22,12), textDisabled=Color3.fromRGB(105,88,68),
 _idb=Color3.fromRGB(255,150,50), onAccent=Color3.fromRGB(28,16,6),
 good=Color3.fromRGB(87,210,143), warn=Color3.fromRGB(230,180,90), bad=Color3.fromRGB(235,95,95),
 _hb=Color3.fromRGB(244,234,222), subtext=Color3.fromRGB(168,148,124),
 modalBg=Color3.fromRGB(30,22,12), modalStep=Color3.fromRGB(24,16,8),
 },
 claro = {
 bg=Color3.fromRGB(238,240,244), _o=Color3.fromRGB(255,255,255), _jj=Color3.fromRGB(248,249,251),
 surface=Color3.fromRGB(255,255,255), surfaceHover=Color3.fromRGB(242,243,247), elevated=Color3.fromRGB(255,255,255),
 link=Color3.fromRGB(238,240,244), neutral=Color3.fromRGB(228,231,237), _whb=Color3.fromRGB(205,210,220),
 _jq=Color3.fromRGB(218,222,230), headerBg=Color3.fromRGB(248,249,251), textDisabled=Color3.fromRGB(170,175,185),
 _idb=Color3.fromRGB(88,101,242), onAccent=Color3.fromRGB(255,255,255),
 good=Color3.fromRGB(40,160,90), warn=Color3.fromRGB(205,135,30), bad=Color3.fromRGB(220,70,70),
 _hb=Color3.fromRGB(22,26,34), subtext=Color3.fromRGB(95,105,120),
 modalBg=Color3.fromRGB(255,255,255), modalStep=Color3.fromRGB(238,240,244),
 },
}
local C = {}
local function applyTheme(_i)
 local t = _h[_i] or _h.negro
 for k, v in pairs(t) do C[k] = v end
end
if _d.theme == "\107\97\108\105" then _d.theme = "\116\111\114" end
applyTheme(_d.theme)
local _j = {}
local function themed(_p, _q, _r)
 local _k = { _p = _p, _q = _q, _r = _r }
 table.insert(_j, _k)
 pcall(function()
 _p.Destroying:Connect(function() _k._p = nil end)
 end)
 pcall(function() _p[_q] = C[_r] end)
 return _p
end
local _l = {}
local function onRepaint(_s) table.insert(_l, _s) end
local function repaint()
 local n = 0
 for i = 1, #_j do
 local e = _j[i]
 if e._p then
 n = n + 1
 _j[n] = e
 pcall(function() e._p[e._q] = C[e._r] end)
 end
 end
 for i = #_j, n + 1, -1 do _j[i] = nil end
 for _, _s in ipairs(_l) do pcall(_s) end
end
local _m
local function setTheme(_i)
 applyTheme(_i)
 _d.theme = _i
 saveStore()
 repaint()
 if _m then pcall(_m) end
end
_G.NXTheme = {
 C = C,
 onRepaint = onRepaint,
 themed = themed,
 getTheme = function() return _d.theme end,
}
do
 local _n = {}
 _n.corner = { sm = UDim.new(0, 6), md = UDim.new(0, 8), _wdb = UDim.new(0, 12), _sdb = UDim.new(1, 0) }
 _n._hb   = { xs = 10, sm = 11, md = 13, _wdb = 15, xl = 18, _lk = 16 }
 _n.space  = { xs = 4, sm = 6, md = 8, _wdb = 12, xl = 16 }
 _n._tj    = { _o = 12, section = 14 }
 function _n.makeCard(_t, _u)
 _u = _u or {}
 local _o = Instance.new("\70\114\97\109\101", _t)
 if _u._mb then _o.LayoutOrder = _u._mb end
 _o.Size = UDim2.new(1, 0, 0, 0)
 _o.AutomaticSize = Enum.AutomaticSize.Y
 _o.BackgroundColor3 = C.surface
 _o.BorderSizePixel = 0
 _o.ClipsDescendants = true
 Instance.new("\85\73\67\111\114\110\101\114", _o).CornerRadius = _n.corner.md
 themed(_o, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 local _v = Instance.new("\85\73\83\116\114\111\107\101", _o)
 _v.Color = C._whb; _v.Transparency = 0.6; _v.Thickness = 1
 themed(_v, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local p = Instance.new("\85\73\80\97\100\100\105\110\103", _o)
 p.PaddingTop = UDim.new(0, _n._tj._o); p.PaddingBottom = UDim.new(0, _n._tj._o)
 p.PaddingLeft = UDim.new(0, _n._tj._o); p.PaddingRight = UDim.new(0, _n._tj._o)
 local _w = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _o)
 _w.Padding = UDim.new(0, _n.space.md); _w.SortOrder = Enum.SortOrder.LayoutOrder
 local _x = _o
 if _u._lk then
 local h = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 h.LayoutOrder = 0; h.Size = UDim2.new(1, 0, 0, 20); h.BackgroundTransparency = 1
 h.Font = Enum.Font.GothamBold; h.TextSize = _n._hb.md; h.TextColor3 = C._hb
 h.Text = _u._lk; h.TextXAlignment = Enum.TextXAlignment.Left
 themed(h, "\84\101\120\116\67\111\108\111\114\51", _u._idb and "\97\99\99\101\110\116" or "\116\101\120\116")
 end
 if _u.subtitle then
 local s = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 s.LayoutOrder = 1; s.Size = UDim2.new(1, 0, 0, 0); s.AutomaticSize = Enum.AutomaticSize.Y
 s.BackgroundTransparency = 1; s.Font = Enum.Font.Gotham; s.TextSize = _n._hb.sm
 s.TextColor3 = C.subtext; s.Text = _u.subtitle; s.TextWrapped = true
 s.TextXAlignment = Enum.TextXAlignment.Left
 themed(s, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 return _o, _x
 end
 function _n.makeDataRow(_t, _z, _ab, _u)
 _u = _u or {}
 local _y = Instance.new("\70\114\97\109\101", _t)
 if _u._mb then _y.LayoutOrder = _u._mb end
 _y.Size = UDim2.new(1, 0, 0, 26)
 _y.BackgroundTransparency = 1
 _y.ClipsDescendants = true
 local _bb = Instance.new("\84\101\120\116\76\97\98\101\108", _y)
 _bb.Size = UDim2.new(0, 0, 1, 0); _bb.AutomaticSize = Enum.AutomaticSize.X
 _bb.BackgroundTransparency = 1
 _bb.Font = Enum.Font.Gotham; _bb.TextSize = _n._hb.sm; _bb.TextColor3 = C.subtext
 _bb.Text = _z; _bb.TextXAlignment = Enum.TextXAlignment.Left
 themed(_bb, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _cb = _u.important and Enum.Font.GothamBold or Enum.Font.GothamMedium
 local _db = _u.important and _n._hb._wdb or _n._hb.md
 local _eb = Instance.new("\84\101\120\116\76\97\98\101\108", _y)
 _eb.Size = UDim2.new(1, 0, 1, 0)
 _eb.BackgroundTransparency = 1
 _eb.Font = _cb; _eb.TextSize = _db
 _eb.TextColor3 = _u._mp or C._hb
 if not _u._mp then themed(_eb, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116") end
 _eb.Text = tostring(_ab == nil and "\8212" or _ab)
 _eb.TextXAlignment = Enum.TextXAlignment.Right
 _eb.TextTruncate = Enum.TextTruncate.AtEnd
 if _u._lp and _ab then
 local _fb = Instance.new("\84\101\120\116\66\117\116\116\111\110", _y)
 _fb.Size = UDim2.fromOffset(22, 22); _fb.AnchorPoint = Vector2.new(1, 0.5)
 _fb.Position = UDim2.new(1, 0, 0.5, 0)
 _fb.BackgroundTransparency = 1; _fb.Text = "\55357\56523"
 _fb.Font = Enum.Font.Gotham; _fb.TextSize = 12
 _fb.AutoButtonColor = false; _fb.ZIndex = 3
 _fb.TextTransparency = 0.6
 _fb.MouseEnter:Connect(function() _fb.TextTransparency = 0 end)
 _fb.MouseLeave:Connect(function() _fb.TextTransparency = 0.6 end)
 _fb.MouseButton1Click:Connect(function()
 if _fc then _fc(tostring(_ab)) end
 if _gl then _gl.Text = "\67\111\112\105\97\100\111\58\32" .. _z end
 _fb.Text = "\10003"
 task.delay(1, function() if _fb and _fb.Parent then _fb.Text = "\55357\56523" end end)
 end)
 _eb.Size = UDim2.new(1, -28, 1, 0)
 end
 return _y
 end
 function _n.makeButton(_t, _hb, _ib, _u)
 _u = _u or {}
 local _gb = Instance.new("\84\101\120\116\66\117\116\116\111\110", _t)
 if _u._mb then _gb.LayoutOrder = _u._mb end
 _gb.Size = _u._mdb or UDim2.new(0, 0, 0, 30)
 if not _u._mdb then _gb.AutomaticSize = Enum.AutomaticSize.X end
 _gb.BackgroundColor3 = (_ib == "\112\114\105\109\97\114\121" and C._idb) or (_ib == "\115\101\99\111\110\100\97\114\121" and C.surface) or Color3.new(0,0,0)
 _gb.BackgroundTransparency = (_ib == "\103\104\111\115\116") and 1 or 0
 _gb.Text = _hb; _gb.Font = Enum.Font.GothamBold; _gb.TextSize = _n._hb.md
 _gb.TextColor3 = (_ib == "\112\114\105\109\97\114\121" and C.onAccent) or C._hb
 _gb.BorderSizePixel = 0; _gb.AutoButtonColor = false
 Instance.new("\85\73\67\111\114\110\101\114", _gb).CornerRadius = _n.corner.sm
 local _jb = Instance.new("\85\73\80\97\100\100\105\110\103", _gb)
 _jb.PaddingLeft = UDim.new(0, 16); _jb.PaddingRight = UDim.new(0, 16)
 if _ib == "\112\114\105\109\97\114\121" then
 themed(_gb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116"); themed(_gb, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 elseif _ib == "\115\101\99\111\110\100\97\114\121" then
 themed(_gb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101"); themed(_gb, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _kb = Instance.new("\85\73\83\116\114\111\107\101", _gb)
 _kb.Thickness = 1; _kb.Color = C._whb; _kb.Transparency = 0.5
 themed(_kb, "\67\111\108\111\114", "\98\111\114\100\101\114")
 else
 themed(_gb, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 local _lb = Instance.new("\85\73\83\99\97\108\101", _gb)
 _gb.MouseEnter:Connect(function()
 if _ib ~= "\103\104\111\115\116" then
 _gb.BackgroundTransparency = (_ib == "\103\104\111\115\116") and 0.85 or 0
 end
 end)
 _gb.MouseButton1Down:Connect(function()
 motionTween(_lb, TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.97 })
 end)
 _gb.MouseButton1Up:Connect(function()
 motionTween(_lb, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 })
 end)
 _gb.MouseLeave:Connect(function()
 _lb.Scale = 1
 if _ib == "\103\104\111\115\116" then _gb.BackgroundTransparency = 1 end
 end)
 if _u._skb then _gb.MouseButton1Click:Connect(_u._skb) end
 return _gb
 end
 function _n.makeSectionHeader(_t, _hb, _mb)
 local h = Instance.new("\84\101\120\116\76\97\98\101\108", _t)
 h.LayoutOrder = _mb or 0
 h.Size = UDim2.new(1, 0, 0, 22); h.BackgroundTransparency = 1
 h.Font = Enum.Font.GothamBold; h.TextSize = _n._hb.sm; h.TextColor3 = C.subtext
 h.Text = string.upper(_hb); h.TextXAlignment = Enum.TextXAlignment.Left
 themed(h, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 return h
 end
 function _n.makeToggleRow(_t, _z, _ob, _pb, _mb, _qb)
 local _o, _ = _n.makeCard(_t, { _mb = _mb })
 local _nb = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 _nb.LayoutOrder = 0; _nb.Size = UDim2.new(1, 0, 0, 20)
 _nb.BackgroundTransparency = 1; _nb.Font = Enum.Font.GothamBold
 _nb.TextSize = _n._hb.md; _nb.TextColor3 = C._hb
 _nb.Text = _z; _nb.TextXAlignment = Enum.TextXAlignment.Left
 themed(_nb, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 if _ob then
 local d = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 d.LayoutOrder = 1; d.Size = UDim2.new(1, 0, 0, 0)
 d.AutomaticSize = Enum.AutomaticSize.Y; d.BackgroundTransparency = 1
 d.Font = Enum.Font.Gotham; d.TextSize = _n._hb.xs; d.TextColor3 = C.subtext
 d.Text = _ob; d.TextWrapped = true; d.TextXAlignment = Enum.TextXAlignment.Left
 themed(d, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 local _y = Instance.new("\70\114\97\109\101", _o)
 _y.LayoutOrder = 2; _y.Size = UDim2.new(1, 0, 0, 24); _y.BackgroundTransparency = 1
 local _rb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _y)
 _rb.FillDirection = Enum.FillDirection.Horizontal
 _rb.VerticalAlignment = Enum.VerticalAlignment.Center
 _rb.Padding = UDim.new(0, 10)
 local _sb = Instance.new("\84\101\120\116\76\97\98\101\108", _y)
 _sb.LayoutOrder = 2; _sb.Size = UDim2.new(0, 140, 0, 20)
 _sb.BackgroundTransparency = 1; _sb.Font = Enum.Font.GothamBold
 _sb.TextSize = _n._hb.sm; _sb.TextXAlignment = Enum.TextXAlignment.Left
 local function paint()
 _sb.Text = _pb and "\65\99\116\105\118\97\100\111" or "\68\101\115\97\99\116\105\118\97\100\111"
 _sb.TextColor3 = _pb and C.good or C.subtext
 end
 local _tb, setOn, setBusy = _n._makeSwitch(_y, _pb, function(_ub)
 _pb = _ub
 paint()
 if _qb then _qb(_ub) end
 end)
 _tb.LayoutOrder = 1
 paint()
 onRepaint(paint)
 return _o, _tb, setOn, setBusy, _sb
 end
 function _n.makeScoreBar(_t, _z, _vb, _wb, _xb, _mb)
 local _y = Instance.new("\70\114\97\109\101", _t)
 _y.LayoutOrder = _mb or 0
 _y.Size = UDim2.new(1, 0, 0, 28)
 _y.BackgroundTransparency = 1
 local _yb = Instance.new("\84\101\120\116\76\97\98\101\108", _y)
 _yb.Size = UDim2.new(0, 90, 1, 0)
 _yb.BackgroundTransparency = 1; _yb.Font = Enum.Font.Gotham
 _yb.TextSize = _n._hb.sm; _yb.TextColor3 = C.subtext
 _yb.Text = _z; _yb.TextXAlignment = Enum.TextXAlignment.Left
 themed(_yb, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _zb = Instance.new("\70\114\97\109\101", _y)
 _zb.Position = UDim2.new(0, 96, 0.5, -3)
 _zb.Size = UDim2.new(1, -220, 0, 6)
 _zb.BackgroundColor3 = C._whb; _zb.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _zb).CornerRadius = UDim.new(0, 3)
 themed(_zb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\111\114\100\101\114")
 local _ac = Instance.new("\70\114\97\109\101", _zb)
 local _bc = math.clamp(_vb / 100, 0, 1)
 _ac.Size = UDim2.new(0, 0, 1, 0)
 _ac.BackgroundColor3 = _xb; _ac.BorderSizePixel = 0
 _ac.ClipsDescendants = true
 Instance.new("\85\73\67\111\114\110\101\114", _ac).CornerRadius = UDim.new(0, 3)
 local _cc = math._de(_bc, _vb > 0 and 0.04 or 0)
 motionTween(_ac, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
 { Size = UDim2.new(_cc, 0, 1, 0) })
 local _eb = Instance.new("\84\101\120\116\76\97\98\101\108", _y)
 _eb.Position = UDim2.new(1, -118, 0, 0)
 _eb.Size = UDim2.new(0, 118, 1, 0)
 _eb.BackgroundTransparency = 1; _eb.Font = Enum.Font.GothamBold
 _eb.TextSize = _n._hb.sm; _eb.TextColor3 = _xb
 _eb.Text = string.format("\37\100\37\37\32\183\32\37\115", _vb, _wb)
 _eb.TextXAlignment = Enum.TextXAlignment.Right
 return _y, _ac, _eb
 end
 _G.NXDS = _n
end
local function detectExecutor()
 if identifyexecutor then
 local _g, _i = pcall(identifyexecutor)
 if _g and type(_i) == "\115\116\114\105\110\103" and _i ~= "" then return _i end
 end
 if getexecutorname then
 local _g, _i = pcall(getexecutorname)
 if _g and type(_i) == "\115\116\114\105\110\103" and _i ~= "" then return _i end
 end
 if rawget(_G, "\120\101\110\111") then return "\88\101\110\111" end
 if rawget(_G, "\83\121\110\97\112\115\101") or rawget(_G, "\115\121\110") then return "\83\121\110\97\112\115\101\32\88" end
 if rawget(_G, "\75\82\78\76\95\76\79\65\68\69\68") or rawget(_G, "\107\114\110\108") then return "\75\82\78\76" end
 if rawget(_G, "\102\108\117\120\117\115") then return "\70\108\117\120\117\115" end
 if rawget(_G, "\104\121\100\114\111\103\101\110") then return "\72\121\100\114\111\103\101\110" end
 if rawget(_G, "\119\97\118\101") then return "\87\97\118\101" end
 if rawget(_G, "\118\101\108\111\99\105\116\121") then return "\86\101\108\111\99\105\116\121" end
 if rawget(_G, "\83\111\108\97\114\97") then return "\83\111\108\97\114\97" end
 if rawget(_G, "\80\82\79\84\79\83\77\65\83\72\69\82\95\76\79\65\68\69\68") then return "\80\114\111\116\111\83\109\97\115\104\101\114" end
 if rawget(_G, "\83\105\114\104\117\114\116") then return "\83\105\114\72\117\114\116" end
 if rawget(_G, "\83\67\82\73\80\84\87\65\82\69\95\76\79\65\68\69\68") then return "\83\99\114\105\112\116\45\87\97\114\101" end
 if rawget(_G, "\114\101\113\117\101\115\116") or rawget(_G, "\104\116\116\112\95\114\101\113\117\101\115\116") then return "\101\120\101\99\117\116\111\114\32\100\101\115\99\111\110\111\99\105\100\111" end
 return "\116\117\32\101\120\101\99\117\116\111\114"
end
local _dc = detectExecutor()
for _, child in ipairs(_b:GetChildren()) do
 if child:IsA("\83\99\114\101\101\110\71\117\105") and child.Name == "\85\116\105\108\105\116\121\80\97\110\101\108" then
 child:Destroy()
 end
end
pcall(function()
 if _G._chb and _G._chb.Stop then _G._chb.Stop() end
end)
do
 local o = _b:FindFirstChild("\78\88\72\101\97\100\84\97\103\115")
 if o then o:Destroy() end
 o = _b:FindFirstChild("\76\105\115\116\97\74\117\103\97\100\111\114\101\115\77\111\100\101\114\110\97")
 if o then o:Destroy() end
end
local _ec = (syn and syn.request) or http_request or request or (http and http.request)
local _fc = setclipboard or (syn and syn.write_clipboard) or toclipboard or function() end
local function rawGet(_gc)
 local _x, statusCode
 if _ec then
 local _g, _mc = pcall(_ec, { Url = _gc, Method = "\71\69\84" })
 if _g and _mc then
 _x = _mc.Body
 statusCode = _mc.StatusCode
 end
 end
 if _x == nil or _x == "" then
 local _g, _mc = pcall(function() return game:HttpGet(_gc) end)
 if _g and type(_mc) == "\115\116\114\105\110\103" and _mc ~= "" then _x, statusCode = _mc, 200 end
 end
 if _x == nil or _x == "" then return nil, statusCode or "\99\111\110\110\101\99\116\105\111\110\95\102\97\105\108\117\114\101" end
 return _x, statusCode
end
local function apiGet(_gc)
 local _x, _je = rawGet(_gc)
 if not _x then return nil, _je end
 local _g, _ie = pcall(function() return HttpService:JSONDecode(_x) end)
 return _g and _ie or nil, _je
end
local function apiPost(_gc, _hc)
 if not _ec then return nil, "\110\111\95\104\116\116\112\95\114\101\113\117\101\115\116" end
 local _g, _mc = pcall(_ec, {
 Url = _gc,
 Method = "\80\79\83\84",
 Headers = { ["\67\111\110\116\101\110\116\45\84\121\112\101"] = "\97\112\112\108\105\99\97\116\105\111\110\47\106\115\111\110" },
 Body = HttpService:JSONEncode(_hc),
 })
 if _g and _mc and _mc.Body then
 local _ic, _ie = pcall(function() return HttpService:JSONDecode(_mc.Body) end)
 return _ic and _ie or nil, _mc.StatusCode
 end
 return nil, (_g and _mc and _mc.StatusCode) or "\99\111\110\110\101\99\116\105\111\110\95\102\97\105\108\117\114\101"
end
local _jc = nil
local function postAuth(_gc, _hc)
 if not _ec then return nil, "\110\111\95\104\116\116\112\95\114\101\113\117\101\115\116", nil end
 local function doReq(_lc)
 local _kc = { ["\67\111\110\116\101\110\116\45\84\121\112\101"] = "\97\112\112\108\105\99\97\116\105\111\110\47\106\115\111\110" }
 if _lc then _kc["\88\45\67\83\82\70\45\84\79\75\69\78"] = _lc end
 local _g, _mc = pcall(_ec, {
 Url = _gc, Method = "\80\79\83\84", Headers = _kc,
 Body = HttpService:JSONEncode(_hc or {}),
 })
 if not _g or not _mc then return nil end
 return _mc
 end
 local _mc = doReq(_jc)
 if _mc and tonumber(_mc.StatusCode) == 403 then
 local h = _mc.Headers or {}
 local _lc = h["\120\45\99\115\114\102\45\116\111\107\101\110"] or h["\88\45\67\83\82\70\45\84\79\75\69\78"] or h["\88\45\67\115\114\102\45\84\111\107\101\110"]
 if _lc then
 _jc = _lc
 _mc = doReq(_lc)
 end
 end
 if not _mc then return nil, "\99\111\110\110\101\99\116\105\111\110\95\102\97\105\108\117\114\101", nil end
 local _x
 if _mc.Body and _mc.Body ~= "" then
 local _ic, _az = pcall(function() return HttpService:JSONDecode(_mc.Body) end)
 _x = _ic and _az or nil
 end
 local _nc = (type(_x) == "\116\97\98\108\101" and _x.errors) or nil
 return _x, _mc.StatusCode, _nc
end
_G.NXTagRepo = {
 _shb = "\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\100\114\101\101\110\110\120\47\110\120\45\116\97\103\115\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47",
}
_G.NXTagRepo._ld = _G.NXTagRepo._shb .. "\116\97\103\115\46\106\115\111\110"
_G.NXJson = function(_gc)
 local _x, _je = rawGet(_gc)
 if not _x then return nil, tonumber(_je) or _je end
 local _g, t = pcall(function() return HttpService:JSONDecode(_x) end)
 if not _g or type(t) ~= "\116\97\98\108\101" then return nil, tonumber(_je) or _je end
 return t, tonumber(_je) or _je
end
local _oc = nil
local _pc = false
local _qc = {}
local function loadNXTags()
 if _oc ~= nil or _pc then return end
 _pc = true
 task.spawn(function()
 _oc = _G.NXJson(_G.NXTagRepo._ld) or {}
 _pc = false
 local _rc = _qc
 _qc = {}
 for _, _s in ipairs(_rc) do task.spawn(_s) end
 end)
end
_G.NXTagKit = {
 CORONA_ASSET = "\57\56\55\49\48\49\52\51\51\52\52\52\56\56",
 COLORES = {
 cyan = Color3.fromRGB(0, 229, 255),  red = Color3.fromRGB(255, 76, 76),
 green = Color3.fromRGB(80, 220, 120), blue = Color3.fromRGB(80, 150, 255),
 yellow = Color3.fromRGB(255, 214, 64), orange = Color3.fromRGB(255, 150, 40),
 purple = Color3.fromRGB(180, 110, 255), pink = Color3.fromRGB(255, 110, 200),
 _thb = Color3.fromRGB(245, 245, 245), gold = Color3.fromRGB(255, 196, 64),
 gray = Color3.fromRGB(170, 170, 170), grey = Color3.fromRGB(170, 170, 170),
 black = Color3.fromRGB(30, 30, 30),
 magenta = Color3.fromRGB(255, 0, 200), teal = Color3.fromRGB(0, 200, 180),
 silver = Color3.fromRGB(200, 200, 210), lime = Color3.fromRGB(160, 255, 80),
 },
}
function _G.NXTagKit._xb(_ab, _sc)
 _sc = _sc or _G.NXTagKit.COLORES.cyan
 if typeof(_ab) == "\67\111\108\111\114\51" then return _ab end
 if type(_ab) == "\116\97\98\108\101" then
 local r = _ab[1] or _ab.r or _ab.R
 local g = _ab[2] or _ab.g or _ab.G
 local b = _ab[3] or _ab.b or _ab.B
 if r and g and b then
 if r > 1 or g > 1 or b > 1 then return Color3.fromRGB(r, g, b) end
 return Color3.new(r, g, b)
 end
 return _sc
 end
 if type(_ab) == "\115\116\114\105\110\103" then
 local s = _ab:lower():gsub("\37\115", "")
 local c = _G.NXTagKit.COLORES[s]
 if c then return c end
 local _tc = s:match("\94\35\63\40\37\120\37\120\37\120\37\120\37\120\37\120\41\36")
 if _tc then
 return Color3.fromRGB(tonumber(_tc:_is(1, 2), 16),
 tonumber(_tc:_is(3, 4), 16), tonumber(_tc:_is(5, 6), 16))
 end
 end
 return _sc
end
function _G.NXTagKit.imagen(v)
 if v == nil then return nil end
 if type(v) == "\110\117\109\98\101\114" then v = "\114\98\120\97\115\115\101\116\105\100\58\47\47" .. v end
 v = tostring(v)
 if v == "" or v == "\114\98\120\97\115\115\101\116\105\100\58\47\47\48" then return nil end
 local d = v:match("\94\40\37\100\43\41\36")
 if d then v = "\114\98\120\97\115\115\101\116\105\100\58\47\47" .. d end
 if not (v:match("\94\114\98\120\97\115\115\101\116\105\100\58\47\47\37\100\43\36") or v:match("\94\114\98\120\116\104\117\109\98") or v:match("\94\104\116\116\112")) then
 return nil
 end
 if v:find(_G.NXTagKit.CORONA_ASSET, 1, true) then return nil end
 return v
end
function _G.NXTagKit.icono(v)
 return (tostring(v or ""):gsub("\92\117\123\49\70\52\53\49\125", ""))
end
function _G.NXTagKit.alCargarLegacy(_s)
 if _oc ~= nil then task.defer(_s) else table.insert(_qc, _s) end
end
local function nxColor(_i)
 return _G.NXTagKit._xb(_i)
end
local function getNXTag(_uc)
 if type(_oc) ~= "\116\97\98\108\101" then return nil end
 local _k = _oc[tostring(_uc)]
 if type(_k) ~= "\116\97\98\108\101" then return nil end
 local _vc = _k._kib or _k._hb or ""
 if _vc == "" and (_k._nd == nil or _k._nd == "") then return nil end
 local _wc = _G.NXTagKit.icono(_k._nd)
 return { _kib = _vc, _nd = _wc, _xb = nxColor(_k._xb) }
end
loadNXTags()
do
 if _G.NXV2 and _G.NXV2.stop then pcall(_G.NXV2.stop) end
 local _xc = { enabled = true, images = false }
 local _yc = true
 local _zc  = _G.NXTagRepo._shb .. "\118\50\47"
 local _ad, RETRY = 300, 15
 local _bd, at, inflight = {}, {}, {}
 local _cd
 local function fetch(f, _ed)
 if inflight[f] then return end
 if not _ed and _bd[f] and (os.clock() - (at[f] or 0)) < _ad then return end
 inflight[f] = true
 task.spawn(function()
 local t = _G.NXJson(_zc .. f)
 if t then _bd[f], at[f] = t, os.clock() end
 inflight[f] = nil
 _cd()
 end)
 end
 local function dget(f) return _bd[f] end
 local _dd = {}
 function _cd()
 if not (_bd["\114\111\108\101\115\46\106\115\111\110"] and _bd["\116\97\103\115\46\106\115\111\110"]) then return end
 local _rc = _dd
 _dd = {}
 for _, _s in ipairs(_rc) do task.spawn(_s) end
 end
 local function alCargar(_s)
 if _bd["\114\111\108\101\115\46\106\115\111\110"] and _bd["\116\97\103\115\46\106\115\111\110"] then task.defer(_s)
 else table.insert(_dd, _s) end
 end
 task.spawn(function()
 while _yc do
 if _xc.enabled then
 for _, f in ipairs({ "\114\111\108\101\115\46\106\115\111\110", "\116\97\103\115\46\106\115\111\110" }) do
 if not _bd[f] then fetch(f)
 elseif (os.clock() - (at[f] or 0)) >= _ad then fetch(f, true) end
 end
 end
 task.wait(RETRY)
 end
 end)
 fetch("\114\111\108\101\115\46\106\115\111\110"); fetch("\116\97\103\115\46\106\115\111\110")
 local _fd, icache = game:GetService("\67\111\110\116\101\110\116\80\114\111\118\105\100\101\114"), {}
 local _gd = _G.NXTagKit.imagen
 local function imgPreload(v)
 local _hd = _gd(v); if not _hd or icache[_hd] then return end
 icache[_hd] = "\112\101\110\100\105\110\103"
 task.spawn(function()
 local i = Instance.new("\73\109\97\103\101\76\97\98\101\108"); i.Image = _hd
 icache[_hd] = pcall(function() _fd:PreloadAsync({ i }) end) and "\111\107" or "\98\97\100"
 i:Destroy()
 end)
 end
 local function imgUsable(v) local _hd = _gd(v); return _hd ~= nil and icache[_hd] ~= "\98\97\100" end
 local _id = {
 graphic_ui = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\54\57\55\51\51\50\53\57\50\50\54\52\52", settings = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\51\49\52\51\53\55\50\56\48\48\54\48\57\52",
 youtube = "\114\98\120\97\115\115\101\116\105\100\58\47\47\51\49\49\55\53\54\49\50\55\54", discord = "\114\98\120\97\115\115\101\116\105\100\58\47\47\55\52\51\52\48\56\50\55\57\49\53\56\50\52",
 copy_link = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\53\52\49\54\54\50\55\53\57\56",
 }
 local function nxAsset(_jd)
 local r = dget("\114\111\108\101\115\46\106\115\111\110")
 return (r and r._assets and r._assets[_jd]) or _id[_jd]
 end
 local function normRole(s) s = tostring(s or ""):gsub("\37\115\43", "\32"); return string.upper(s:match("\94\37\115\42\40\46\45\41\37\115\42\36") or s) end
 local function roleDef(_kd)
 local r = dget("\114\111\108\101\115\46\106\115\111\110"); if not r then return nil end
 local k = normRole(_kd)
 if r._aliases and r._aliases[k] then k = normRole(r._aliases[k]) end
 return r[k]
 end
 local function resolveV2(_uc)
 if not _xc.enabled then return nil end
 local _ld = dget("\116\97\103\115\46\106\115\111\110"); if not _ld then return nil end
 local _f = _ld[tostring(_uc)]; if type(_f) ~= "\116\97\98\108\101" then return nil end
 local _r = roleDef(_f._kib) or {}
 local _md = nil
 if _xc.images then
 _md = _gd(_f._jhb) or _gd(nxAsset(_f.iconAsset))
 or _gd(_r._jhb) or _gd(nxAsset(_r.iconAsset))
 if _md then imgPreload(_md) end
 end
 local _vc = _f._kib or ""
 local _nd = _G.NXTagKit.icono(_f._nd or _r._nd)
 if _vc == "" and _nd == "" and not _md then return nil end
 return {
 _kib = _vc, discordRole = _f.discordRole or _r.discordRole,
 _nd = _nd, _jhb = _md,
 _xb = nxColor(_f._xb or _r._xb),
 _khb = string.lower(tostring(_f._khb or _r._khb or "\103\114\97\100\105\101\110\116")),
 _lhb = tonumber(_f._lhb) or tonumber(_r._lhb) or 0,
 }
 end
 _G.NXV2 = {
 enabled = true, images = false,
 resolve = resolveV2, _r = roleDef, asset = nxAsset,
 image = { normalize = _gd, preload = imgPreload, usable = imgUsable },
 _ye = { get = dget, ensure = fetch },
 _ud = function() return not (dget("\114\111\108\101\115\46\106\115\111\110") and dget("\116\97\103\115\46\106\115\111\110")) end,
 onReady = alCargar,
 setEnabled = function(_pb) _xc.enabled = _pb and true or false; _G.NXV2.enabled = _xc.enabled end,
 setImages = function(_pb) _xc.images = _pb and true or false; _G.NXV2.images = _xc.images end,
 stop = function() _yc = false end,
 }
 _G.NXAsset = nxAsset
 _G.NXResolve = resolveV2
 local _od = getNXTag
 getNXTag = function(_uc)
 if _xc.enabled then local v = resolveV2(_uc); if v then return v end end
 return _od(_uc)
 end
 alCargar(function()
 if _G._chb and _G._chb.Refresh then
 pcall(_G._chb.Refresh)
 end
 end)
end
local _pd = (function()
 local _qd    = _G.NXTagRepo._shb
 local _rd = "\51\46\57\46\51"
 local _sd = {
 licenses    = {},
 warnings    = {},
 permissions = {},
 ready       = false,
 _cdb    = 0,
 failed      = {},
 }
 local _td = {}
 local function fetchJSON(_vd)
 return _G.NXJson(_qd .. _vd)
 end
 local function fireReady()
 _sd.ready    = true
 _sd._cdb = os.time()
 for _, _s in ipairs(_td) do pcall(_s) end
 _td = {}
 end
 do
 local _ud = 3
 local function _az()
 _ud = _ud - 1
 if _ud <= 0 then fireReady() end
 end
 task.spawn(function()
 local d = fetchJSON("\108\105\99\101\110\115\101\115\46\106\115\111\110")
 if d then _sd.licenses = d else _sd.failed.licenses = true end
 _az()
 end)
 task.spawn(function()
 local d = fetchJSON("\119\97\114\110\105\110\103\115\46\106\115\111\110")
 if d then _sd.warnings = d else _sd.failed.warnings = true end
 _az()
 end)
 task.spawn(function()
 local d = fetchJSON("\112\101\114\109\105\115\115\105\111\110\115\46\106\115\111\110")
 if d then _sd.permissions = d else _sd.failed.permissions = true end
 _az()
 end)
 end
 local _wd = {}
 function _wd.onReady(_s)
 if _sd.ready then task.defer(_s)
 else table.insert(_td, _s) end
 end
 function _wd.isLicensed(_uc)
 if not _sd.ready or _sd.failed.licenses then return true end
 if _sd.licenses._enforce ~= true then return true end
 local e = _sd.licenses[tostring(_uc)]
 if e == nil or e == false then return false end
 if type(e) == "\116\97\98\108\101" and e.expires then
 local _xd = tonumber(e.expires)
 if _xd and os.time() > _xd then return false end
 end
 return true
 end
 function _wd.getWarning(_uc)
 if not _sd.ready then return nil end
 local w = _sd.warnings[tostring(_uc)]
 return (type(w) == "\116\97\98\108\101") and w or nil
 end
 function _wd.getPermissions(_uc)
 if not _sd.ready then return {} end
 local p = _sd.permissions[tostring(_uc)]
 return (type(p) == "\116\97\98\108\101") and p or {}
 end
 function _wd.isAdmin(_uc)
 return _wd.getPermissions(_uc).admin == true
 end
 function _wd.can(_uc, _yd)
 return _wd.getPermissions(_uc)[_yd] == true
 end
 function _wd.countOf(_jd)
 local n = 0
 for _ in pairs(_sd[_jd] or {}) do n = n + 1 end
 return n
 end
 function _wd.countTags()
 if type(_oc) ~= "\116\97\98\108\101" then return 0 end
 local n = 0
 for _ in pairs(_oc) do n = n + 1 end
 return n
 end
 function _wd.getData() return _sd end
 function _wd.getVersion() return _rd end
 function _wd.logEvent(_be, _ce) end
 return _wd
end)()
local _zd
do
 if _d.shieldAPI  == nil then _d.shieldAPI  = true end
 if _d.shieldData == nil then _d.shieldData = true end
 local S = {
 flags  = { _wd = _d.shieldAPI ~= false, _ye = _d.shieldData ~= false },
 run    = nil,
 stats  = { checks = 0, blocked = 0, fields = 0, rejected = 0 },
 _ut   = nil,
 busy   = nil,
 _ad    = 180,
 }
 local _ae = {}
 function S.onChange(_s) table.insert(_ae, _s) end
 local function emit()
 for _, _s in ipairs(_ae) do pcall(_s) end
 end
 S.emit = emit
 S.valid = {}
 function S.valid._uc(v)
 local n = tonumber(v)
 if not n then return nil end
 if n <= 0 or n ~= math.floor(n) or n > 1e13 then return nil end
 return n
 end
 function S.valid._bp(v)
 if type(v) ~= "\115\116\114\105\110\103" then return nil end
 if #v < 3 or #v > 20 then return nil end
 if v:match("\91\94\37\119\95\93") then return nil end
 local _, guiones = v:gsub("\95", "")
 if guiones > 1 then return nil end
 if v:_is(1, 1) == "\95" or v:_is(-1) == "\95" then return nil end
 return v
 end
 function S.valid._rr(v)
 if type(v) ~= "\115\116\114\105\110\103" then return nil end
 if #v < 1 or #v > 60 then return nil end
 return v
 end
 function S.valid.count(v)
 if type(v) == "\110\117\109\98\101\114" then
 if v < 0 or v ~= math.floor(v) or v > 1e9 then return nil end
 return v
 end
 if type(v) == "\115\116\114\105\110\103" then
 local n = v:match("\94\40\37\100\43\41\37\43\63\36")
 if n and tonumber(n) then return v end
 end
 return nil
 end
 function S.valid.image(v)
 if type(v) ~= "\115\116\114\105\110\103" or v == "" or v == "\114\98\120\97\115\115\101\116\105\100\58\47\47\48" then return nil end
 if v:match("\94\114\98\120\97\115\115\101\116\105\100\58\47\47\37\100\43\36") or v:match("\94\114\98\120\116\104\117\109\98") or v:match("\94\104\116\116\112\115\63\58\47\47") then
 return v
 end
 return nil
 end
 function S.valid.isoDate(v)
 if type(v) ~= "\115\116\114\105\110\103" then return nil end
 local y, m, d = v:match("\94\40\37\100\37\100\37\100\37\100\41\45\40\37\100\37\100\41\45\40\37\100\37\100\41")
 if not y then return nil end
 y, m, d = tonumber(y), tonumber(m), tonumber(d)
 if m < 1 or m > 12 or d < 1 or d > 31 then return nil end
 if y < 2004 then return nil end
 local t = os.time{ year = y, month = m, day = d }
 if t > os.time() + 86400 then return nil end
 return v
 end
 function S.valid._hb(v, _de)
 if type(v) ~= "\115\116\114\105\110\103" then return nil end
 if #v > (_de or 4000) then return nil end
 return v
 end
 function S.valid._yf(t, _ee)
 if type(t) ~= "\116\97\98\108\101" then return nil, 0 end
 local _fe, dropped = {}, 0
 for _, _k in ipairs(t) do
 if _ee(_k) then _fe[#_fe + 1] = _k else dropped = dropped + 1 end
 end
 return _fe, dropped
 end
 S.shape = {}
 function S.shape.group(g)
 return type(g) == "\116\97\98\108\101" and type(g._i) == "\115\116\114\105\110\103" and g._i ~= ""
 and type(g._r) == "\115\116\114\105\110\103" and g._r ~= ""
 end
 function S.shape.badge(b)
 return type(b) == "\116\97\98\108\101" and type(b._i) == "\115\116\114\105\110\103" and b._i ~= ""
 end
 function S.shape.item(_ge)
 return type(_ge) == "\116\97\98\108\101" and S.valid._uc(_ge._hd) ~= nil
 end
 local function humanizeShieldErr(_f)
 if not _f then return "\78\111\32\100\105\115\112\111\110\105\98\108\101" end
 if _f:find("\94\72\84\84\80\32\52") then return "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\97\99\99\101\115\111\32\100\101\110\101\103\97\100\111\41" end
 if _f:find("\94\72\84\84\80\32\53") then return "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\101\114\114\111\114\32\100\101\108\32\115\101\114\118\105\100\111\114\41" end
 if _f:find("\94\72\84\84\80\32") then return "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\101\114\114\111\114\32\100\101\32\99\111\110\101\120\105\243\110\41" end
 if _f == "\115\105\110\32\114\101\115\112\117\101\115\116\97" then return "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\115\105\110\32\114\101\115\112\117\101\115\116\97\41" end
 if _f == "\74\83\79\78\32\105\110\118\225\108\105\100\111" then return "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\114\101\115\112\117\101\115\116\97\32\99\111\114\114\117\112\116\97\41" end
 if _f:find("\94\65\80\73\58\32") then return "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\114\101\115\112\117\101\115\116\97\32\100\101\32\101\114\114\111\114\41" end
 return "\78\111\32\100\105\115\112\111\110\105\98\108\101"
 end
 S.humanizeErr = humanizeShieldErr
 function S.inspect(_ie, _je, _ke)
 S.stats.checks = S.stats.checks + 1
 local _he = tonumber(_je)
 if _ie == nil then
 if _ke == false then return nil, "\74\83\79\78\32\105\110\118\225\108\105\100\111" end
 return nil, _he and ("\72\84\84\80\32" .. _he) or "\115\105\110\32\114\101\115\112\117\101\115\116\97"
 end
 if type(_ie) ~= "\116\97\98\108\101" then return nil, "\102\111\114\109\97\116\111\32\105\110\101\115\112\101\114\97\100\111" end
 if type(_ie.errors) == "\116\97\98\108\101" and _ie.errors[1] then
 local e = _ie.errors[1]
 local _le = (type(e) == "\116\97\98\108\101" and (e._vn or e._he)) or "\63"
 return nil, "\65\80\73\58\32" .. tostring(_le)
 end
 if _he and _he >= 400 then return nil, "\72\84\84\80\32" .. _he end
 return _ie, nil
 end
 local _me = apiPost
 apiGet = function(_gc)
 local _f, _je = rawGet(_gc)
 local _ie, _ke = nil, true
 if _f ~= nil then
 local _g, d = pcall(function() return HttpService:JSONDecode(_f) end)
 _ke = _g
 _ie = _g and d or nil
 end
 if not S.flags._wd then
 return _ie, _je
 end
 local _ne, _kr = S.inspect(_ie, _je, _ke)
 if _kr then
 S.stats.blocked = S.stats.blocked + 1
 S._ut = _kr
 return nil, _je
 end
 return _ne, _je
 end
 apiPost = function(_gc, _hc)
 local _x, _je = _me(_gc, _hc)
 if not S.flags._wd then return _x, _je end
 local _ne, _kr = S.inspect(_x, _je, true)
 if _kr then
 S.stats.blocked = S.stats.blocked + 1
 S._ut = _kr
 return nil, _je
 end
 return _ne, _je
 end
 local _oe  = { Friends = true, Badges = true, Groups = true, CreatedGames = true }
 local _pe = { UserId = true, Username = true, Created = true }
 function S.begin(_uc)
 S.run = {
 _uc  = _uc,
 fields  = {},
 _mb   = {},
 _sd   = "\108\111\97\100\105\110\103",
 counts  = { _g = 0, missing = 0, invalid = 0 },
 _ji = os.clock(),
 }
 emit()
 return S.run
 end
 function S.mark(_se, _je, _te)
 local r = S.run
 if not r then return end
 local _qe = r.fields[_se]
 if _qe == nil then
 r._mb[#r._mb + 1] = _se
 else
 local _re = _qe._je
 r.counts[_re] = (r.counts[_re] or 1) - 1
 end
 r.fields[_se] = { _je = _je, _te = _te }
 r.counts[_je] = (r.counts[_je] or 0) + 1
 S.stats.fields = S.stats.fields + 1
 if _je ~= "\111\107" then S.stats.rejected = S.stats.rejected + 1 end
 end
 function S.check(_se, _ab, _ue)
 if not S.flags._ye then
 S.mark(_se, _ab == nil and "\109\105\115\115\105\110\103" or "\111\107")
 return _ab
 end
 if _ab == nil then
 S.mark(_se, "\109\105\115\115\105\110\103", "\108\97\32\65\80\73\32\110\111\32\100\101\118\111\108\118\105\243\32\101\108\32\100\97\116\111")
 return nil
 end
 local _ne = _ue(_ab)
 if _ne == nil then
 S.mark(_se, "\105\110\118\97\108\105\100", "\110\111\32\112\97\115\243\32\108\97\32\118\97\108\105\100\97\99\105\243\110\32\100\101\32\102\111\114\109\97\116\111")
 return nil
 end
 S.mark(_se, "\111\107")
 return _ne
 end
 function S.finish()
 local r = S.run
 if not r then return "\101\114\114\111\114" end
 local _ve, faltanPilares = 0, 0
 for _se, _xe in pairs(r.fields) do
 if _xe._je ~= "\111\107" then
 if _pe[_se] then _ve = _ve + 1 end
 if _oe[_se]  then faltanPilares  = faltanPilares  + 1 end
 end
 end
 r.criticos, r.pilares = _ve, faltanPilares
 if _ve > 0 then
 r._sd = (r.counts.invalid > 0) and "\101\114\114\111\114" or "\105\110\99\111\109\112\108\101\116\101"
 elseif r.counts.invalid > 0 then
 r._sd = "\101\114\114\111\114"
 elseif r.counts.missing > 0 then
 r._sd = "\112\97\114\116\105\97\108"
 else
 r._sd = "\118\101\114\105\102\105\101\100"
 end
 r._qdb = os.clock() - r._ji
 emit()
 return r._sd
 end
 function S.scoresFiables(_ye)
 if not S.flags._ye then return true, nil end
 local r = (_ye and _ye._integrity) or S.run
 if not r then return true, nil end
 local _we = {}
 for _se in pairs(_oe) do
 local _xe = r.fields[_se]
 if _xe and _xe._je ~= "\111\107" then _we[#_we + 1] = _se end
 end
 table.sort(_we)
 local _ze = r.fields.Created
 if _ze and _ze._je ~= "\111\107" then
 table.insert(_we, 1, "\67\114\101\97\116\101\100\32\40\101\100\97\100\32\100\101\32\99\117\101\110\116\97\41")
 return false, _we
 end
 if #_we >= 2 then
 return false, _we
 end
 return true, _we
 end
 function S.problemas(_ye)
 local r = (_ye and _ye._integrity) or S.run
 local _fe = {}
 if not r then return _fe end
 for _, _se in ipairs(r._mb) do
 local _xe = r.fields[_se]
 if _xe and _xe._je ~= "\111\107" then
 _fe[#_fe + 1] = _se .. "\58\32" .. (_xe._te or _xe._je)
 end
 end
 return _fe
 end
 function S._xi()
 if S.busy then return "\108\111\97\100\105\110\103" end
 local r = S.run
 if r and (r._sd == "\101\114\114\111\114") then return "\101\114\114\111\114" end
 if not (S.flags._wd and S.flags._ye) then return "\112\97\114\116\105\97\108" end
 if r and (r._sd == "\112\97\114\116\105\97\108" or r._sd == "\105\110\99\111\109\112\108\101\116\101") then return "\112\97\114\116\105\97\108" end
 if r and r._sd == "\108\111\97\100\105\110\103" then return "\108\111\97\100\105\110\103" end
 return "\111\107"
 end
 function S.selfTestAPI()
 local _x, _je = rawGet("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\49")
 local _g, _ie = false, nil
 if _x then _g, _ie = pcall(function() return HttpService:JSONDecode(_x) end) end
 local _ne, _kr = S.inspect(_g and _ie or nil, _je, _g)
 if _kr then return false, _kr end
 if type(_ne._hd) ~= "\110\117\109\98\101\114" or type(_ne._i) ~= "\115\116\114\105\110\103" or _ne._ze == nil then
 return false, "\108\97\32\114\101\115\112\117\101\115\116\97\32\110\111\32\116\105\101\110\101\32\108\97\32\101\115\116\114\117\99\116\117\114\97\32\101\115\112\101\114\97\100\97"
 end
 if not S.valid.isoDate(_ne._ze) then
 return false, "\102\101\99\104\97\32\100\101\32\99\114\101\97\99\105\243\110\32\105\110\118\225\108\105\100\97\32\101\110\32\108\97\32\114\101\115\112\117\101\115\116\97"
 end
 return true, "\101\115\116\114\117\99\116\117\114\97\32\121\32\116\105\112\111\115\32\118\101\114\105\102\105\99\97\100\111\115"
 end
 function S.selfTestData(_ye)
 local _af, _uf = 0, 0
 local function probar(v, _s) _uf = _uf + 1; if _s(v) ~= nil then _af = _af + 1 end end
 if _ye then
 probar(_ye.UserId,      S.valid._uc)
 probar(_ye.Username,    S.valid._bp)
 probar(_ye.DisplayName, S.valid._rr)
 probar(_ye.AvatarUrl,   S.valid.image)
 probar(_ye.Created,     S.valid.isoDate)
 else
 probar(_a.UserId, S.valid._uc)
 probar(_a.Name,   S.valid._bp)
 local _bf, _sy = pcall(function()
 return Players:GetUserThumbnailAsync(_a.UserId,
 Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
 end)
 probar(_bf and _sy or nil, S.valid.image)
 end
 if _af == _uf then return true, _af .. "\47" .. _uf .. "\32\99\97\109\112\111\115\32\118\225\108\105\100\111\115" end
 return false, (_uf - _af) .. "\32\100\101\32" .. _uf .. "\32\99\97\109\112\111\115\32\110\111\32\112\97\115\97\114\111\110"
 end
 function S.setFlag(_cf, _pb, _df)
 S.flags[_cf] = _pb and true or false
 if _cf == "\97\112\105"  then _d.shieldAPI  = S.flags._wd  end
 if _cf == "\100\97\116\97" then _d.shieldData = S.flags._ye end
 pcall(saveStore)
 emit()
 if not _pb then
 if _df then _df(true, "\112\114\111\116\101\99\99\105\243\110\32\100\101\115\97\99\116\105\118\97\100\97") end
 emit()
 return
 end
 S.busy = _cf
 emit()
 task.spawn(function()
 local _g, _cbb
 if _cf == "\97\112\105" then _g, _cbb = S.selfTestAPI()
 else _g, _cbb = S.selfTestData(S._mr and S._mr()) end
 S.busy = nil
 S.lastTest = S.lastTest or {}
 local _ef = not _g and humanizeShieldErr(_cbb) or _cbb
 S.lastTest[_cf] = { _g = _g, _cbb = _ef, at = os.time() }
 if not _g then S._ut = _ef end
 emit()
 if _df then _df(_g, _cbb) end
 end)
 end
 _zd = S
 _G.NXShields = S
end
local function countPaged(_gc, _ff)
 _ff = _ff or 100
 local _ye = apiGet(_gc .. (_gc:find("\37\63") and "\38" or "\63") .. "\108\105\109\105\116\61" .. _ff)
 if not _ye or not _ye._ye then return nil end
 local n = #_ye._ye
 if _ye.nextPageCursor and _ye.nextPageCursor ~= "" then return n .. "\43" end
 return n
end
local function simpleCount(_gc, _jd)
 local _ye = apiGet(_gc)
 if _ye and _ye[_jd] ~= nil then return _ye[_jd] end
 return nil
end
local function toNum(v)
 if v == nil then return 0 end
 local s = tostring(v):gsub("\37\43", "")
 return tonumber(s) or 0
end
local function getUserIdByName(_i)
 for _gf = 1, 3 do
 local _ye, _je = apiPost("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\110\97\109\101\115\47\117\115\101\114\115", {
 usernames = { _i }, excludeBannedUsers = false,
 })
 if _ye and _ye._ye and _ye._ye[1] then
 return _ye._ye[1]._hd, _ye._ye[1]._i, nil
 end
 if _je == 200 and _ye then return nil, nil, "\110\111\116\95\102\111\117\110\100" end
 if _gf <= 2 then task.wait(1) end
 end
 for _gf = 1, 3 do
 local s, _je = apiGet("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\115\101\97\114\99\104\63\107\101\121\119\111\114\100\61"
 .. HttpService:UrlEncode(_i) .. "\38\108\105\109\105\116\61\49\48")
 if s and s._ye then
 if s._ye[1] then
 local _hf = _i:lower()
 for _, _beb in ipairs(s._ye) do
 if type(_beb._i) == "\115\116\114\105\110\103" and type(_beb._hd) == "\110\117\109\98\101\114"
 and _beb._i:lower() == _hf then
 return _beb._hd, _beb._i, nil
 end
 end
 return nil, nil, "\110\111\116\95\102\111\117\110\100"
 else
 return nil, nil, "\110\111\116\95\102\111\117\110\100"
 end
 elseif _je == 200 then
 return nil, nil, "\110\111\116\95\102\111\117\110\100"
 end
 if _gf <= 2 then task.wait(1) end
 end
 return nil, nil, "\97\112\105\95\101\114\114\111\114"
end
local _if = {}
local _jf = {}
local function getAvatar(_uc)
 if _if[_uc] then return _if[_uc] end
 local _g, _sy = pcall(function()
 return Players:GetUserThumbnailAsync(_uc, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
 end)
 local _md = (_g and type(_sy) == "\115\116\114\105\110\103" and _sy ~= "" and _sy) or "\114\98\120\97\115\115\101\116\105\100\58\47\47\48"
 _jf[#_jf + 1] = _uc
 if #_jf > 60 then
 local _kf = table.remove(_jf, 1)
 if _kf ~= _uc then _if[_kf] = nil end
 end
 _if[_uc] = _md
 return _md
end
local function formatAge(_lf)
 if not _lf then return nil, nil, nil, nil end
 local y, m, d = _lf:match("\40\37\100\43\41\45\40\37\100\43\41\45\40\37\100\43\41")
 if not y then return _lf:_is(1,10), nil, nil, nil end
 local _ze = os.time{ year = tonumber(y), month = tonumber(m), day = tonumber(d) }
 local _mf = math.floor((os.time() - _ze) / 86400)
 if _mf < 0 then _mf = 0 end
 local _nf = _mf / 365.25
 local _z = string.format("\37\100\32\100\237\97\115\32\40\126\37\46\49\102\32\97\241\111\115\41", _mf, _nf)
 return _lf:_is(1,10), _z, _mf, _nf
end
local function getSubscription(_uc)
 if _uc ~= _a.UserId then
 return "\83\111\108\111\32\118\105\115\105\98\108\101\32\101\110\32\99\117\101\110\116\97\32\112\114\111\112\105\97"
 end
 local _of = _a.MembershipType
 if _of == Enum.MembershipType.None then
 return "\78\105\110\103\117\110\97\32\40\99\117\101\110\116\97\32\103\114\97\116\105\115\41"
 elseif _of == Enum.MembershipType.Premium then
 return "\80\114\101\109\105\117\109\32\47\32\80\108\117\115"
 else
 return tostring(_of.Name)
 end
end
local function getPresence(_uc)
 local _pf = apiPost("\104\116\116\112\115\58\47\47\112\114\101\115\101\110\99\101\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\112\114\101\115\101\110\99\101\47\117\115\101\114\115", { userIds = { _uc } })
 if not _pf or not _pf.userPresences or not _pf.userPresences[1] then
 return "\78\111\32\100\105\115\112\111\110\105\98\108\101", C.subtext, nil, nil, 0
 end
 local p = _pf.userPresences[1]
 local t = p.userPresenceType
 local _qf = (p.lastLocation and p.lastLocation ~= "" and p.lastLocation) or nil
 local _rf = p._rf or p.rootPlaceId
 local _sf = p._sf
 if t == 2 then
 return "\74\117\103\97\110\100\111" .. (_qf and ("\58\32" .. _qf) or ""), C.good, _rf, _sf, t
 elseif t == 3 then
 return "\69\110\32\83\116\117\100\105\111", C.warn, nil, nil, t
 elseif t == 1 then
 return "\79\110\108\105\110\101" .. (_qf and ("\32\40" .. _qf .. "\41") or "\32\40\119\101\98\47\97\112\112\41"), C.good, nil, nil, t
 else
 return "\79\102\102\108\105\110\101", C.subtext, nil, nil, t
 end
end
local function presenceColorFor(t)
 if t == 2 or t == 1 then return C.good
 elseif t == 3 then return C.warn
 else return C.subtext end
end
local function getWornItems(_uc)
 local _ye = apiGet("\104\116\116\112\115\58\47\47\97\118\97\116\97\114\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc .. "\47\99\117\114\114\101\110\116\108\121\45\119\101\97\114\105\110\103")
 if not _ye or not _ye.assetIds then return nil, nil end
 local _tf = {}
 for _, _hd in ipairs(_ye.assetIds) do
 table.insert(_tf, { _hd = _hd, _i = nil, price = nil })
 end
 local _uf = 0
 if #_tf > 0 then
 local _vf = {}
 for _, _ge in ipairs(_tf) do table.insert(_vf, { itemType = "\65\115\115\101\116", _hd = _ge._hd }) end
 local _wf = postAuth("\104\116\116\112\115\58\47\47\99\97\116\97\108\111\103\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\99\97\116\97\108\111\103\47\105\116\101\109\115\47\100\101\116\97\105\108\115", { _tf = _vf })
 if _wf and _wf._ye then
 local _xf = {}
 for _, d in ipairs(_wf._ye) do _xf[d._hd] = d end
 for _, _ge in ipairs(_tf) do
 local d = _xf[_ge._hd]
 if d then
 _ge._i = d._i
 _ge.price = d.lowestPrice or d.price or 0
 _uf = _uf + (tonumber(_ge.price) or 0)
 end
 end
 end
 end
 return _tf, _uf
end
local function getGroupsDetailed(_uc)
 local _ye = apiGet("\104\116\116\112\115\58\47\47\103\114\111\117\112\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc .. "\47\103\114\111\117\112\115\47\114\111\108\101\115")
 if not _ye or not _ye._ye then return nil end
 local _yf = {}
 for _, g in ipairs(_ye._ye) do
 table.insert(_yf, {
 _i = (g.group and g.group._i) or "\63",
 _r = (g._r and g._r._i) or "\63",
 members = (g.group and g.group.memberCount) or nil,
 })
 end
 return _yf
end
local function getRecentBadges(_uc, _ff)
 _ff = _ff or 10
 local _ye = apiGet("\104\116\116\112\115\58\47\47\98\97\100\103\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc
 .. "\47\98\97\100\103\101\115\63\108\105\109\105\116\61" .. _ff .. "\38\115\111\114\116\79\114\100\101\114\61\68\101\115\99")
 if not _ye or not _ye._ye then return nil end
 local _yf = {}
 for _, b in ipairs(_ye._ye) do
 table.insert(_yf, { _i = b._i, _hd = b._hd })
 end
 return _yf
end
local function getRAP(_uc)
 local _ye, _je = apiGet("\104\116\116\112\115\58\47\47\119\119\119\46\114\111\108\105\109\111\110\115\46\99\111\109\47\112\108\97\121\101\114\97\112\105\47\112\108\97\121\101\114\47" .. _uc)
 if type(_ye) == "\116\97\98\108\101" and _ye.success == false then
 local _le = tostring(_ye._vn or "")
 if _le:find("\109\111\118\101\100") or _le:find("\110\101\119\32\117\114\108") or tonumber(_je) == 404 then
 return nil, "\109\111\118\105\100\97"
 end
 return nil, "\115\105\110\95\100\97\116\111\115"
 end
 if not _ye then return nil, "\115\105\110\95\114\101\115\112\117\101\115\116\97" end
 local _zf = _ye._ab or _ye._ug
 if _zf == nil then return nil, "\115\105\110\95\100\97\116\111\115" end
 return { _ug = _zf, premium = _ye.premium }
end
local function computeTrust(_ye)
 local _mf     = _ye.AccountAgeDays or 0
 local _ag  = toNum(_ye.Friends)
 local _bg   = toNum(_ye.Groups)
 local _cg   = toNum(_ye.Badges)
 local _dg     = toNum(_ye.Favorites)
 local _eg    = toNum(_ye.CreatedGames)
 local _fg = (_ye.Verified == "\83\237")
 local _vb, reasons = 0, {}
 local function add(_gg, _hg) _vb = _vb + _gg; reasons[#reasons + 1] = _hg end
 if _mf >= 1825 then add(25, "\67\117\101\110\116\97\32\100\101\32\53\43\32\97\241\111\115\32\40\43\50\53\41")
 elseif _mf >= 730 then add(19, "\67\117\101\110\116\97\32\100\101\32\50\43\32\97\241\111\115\32\40\43\49\57\41")
 elseif _mf >= 365 then add(13, "\77\225\115\32\100\101\32\49\32\97\241\111\32\40\43\49\51\41")
 elseif _mf >= 90  then add(7,  "\65\108\103\117\110\111\115\32\109\101\115\101\115\32\40\43\55\41")
 elseif _mf >= 30  then add(3,  "\67\117\101\110\116\97\32\114\101\99\105\101\110\116\101\32\40\43\51\41")
 else add(0, "\67\117\101\110\116\97\32\109\117\121\32\110\117\101\118\97\32\40\43\48\41") end
 local _ig = 0
 if _cg >= 25 then _ig = _ig + 15
 elseif _cg >= 10 then _ig = _ig + 11
 elseif _cg >= 3 then _ig = _ig + 7
 elseif _cg >= 1 then _ig = _ig + 3 end
 if _eg >= 3 then _ig = _ig + 10
 elseif _eg >= 1 then _ig = _ig + 5 end
 _ig = math.min(_ig, 25)
 add(_ig, "\65\99\116\105\118\105\100\97\100\32\98\97\100\103\101\115\47\106\117\101\103\111\115\32\40\43" .. _ig .. "\41")
 if _ag >= 50 then add(15, "\77\117\99\104\111\115\32\97\109\105\103\111\115\32\40\43\49\53\41")
 elseif _ag >= 10 then add(10, "\65\109\105\103\111\115\32\110\111\114\109\97\108\101\115\32\40\43\49\48\41")
 elseif _ag >= 1 then add(5, "\80\111\99\111\115\32\97\109\105\103\111\115\32\40\43\53\41")
 else add(0, "\48\32\97\109\105\103\111\115\32\40\43\48\41") end
 if _bg >= 5 then add(15, "\86\97\114\105\111\115\32\103\114\117\112\111\115\32\40\43\49\53\41")
 elseif _bg >= 1 then add(8, "\65\108\103\250\110\32\103\114\117\112\111\32\40\43\56\41")
 else add(0, "\48\32\103\114\117\112\111\115\32\40\43\48\41") end
 if _dg >= 5 then add(5, "\70\97\118\111\114\105\116\111\115\32\40\43\53\41")
 elseif _dg >= 1 then add(2, "\65\108\103\250\110\32\102\97\118\111\114\105\116\111\32\40\43\50\41") end
 if _fg then add(10, "\73\110\115\105\103\110\105\97\32\118\101\114\105\102\105\99\97\100\97\32\40\43\49\48\41") end
 local _jg = (_mf >= 730) and _cg == 0 and _bg == 0 and _eg == 0 and _dg == 0
 if _jg then
 local _kg = (_ag <= 1) and 25 or 15
 add(-_kg, "\67\117\101\110\116\97\32\97\110\116\105\103\117\97\32\115\105\110\32\97\99\116\105\118\105\100\97\100\32\40\45" .. _kg .. "\41")
 end
 _vb = math.clamp(_vb, 0, 100)
 local _z, _xb = "\66\97\106\111", C.bad
 if _vb >= 70 then _z, _xb = "\65\108\116\111", C.good
 elseif _vb >= 40 then _z, _xb = "\77\101\100\105\111", C.warn end
 return _vb, _z, _xb, reasons
end
local _lg
local _mg
local function getMyFriendIds()
 if _mg then return _mg end
 local _ng = apiGet("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _a.UserId .. "\47\102\114\105\101\110\100\115")
 if not _ng or not _ng._ye then return nil end
 _mg = {}
 for _, f in ipairs(_ng._ye) do if f._hd then _mg[f._hd] = true end end
 return _mg
end
local function getMutualFriends(_uc)
 if _uc == _a.UserId then return nil end
 local _og  = getMyFriendIds()
 local _pg = apiGet("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc .. "\47\102\114\105\101\110\100\115")
 if not _og or not _pg or not _pg._ye then return nil end
 local _vf = {}
 for _, f in ipairs(_pg._ye) do
 if f._hd and _og[f._hd] then _vf[#_vf + 1] = f._hd end
 end
 if #_vf == 0 then return {} end
 local _qg = _lg(_vf)
 local _rg = {}
 for _, _hd in ipairs(_vf) do
 local m = _qg[_hd]
 _rg[#_rg + 1] = (m and (m._rr or m._i)) or ("\85\115\117\97\114\105\111\32" .. _hd)
 end
 return _rg
end
local function computeInfluence(_ye, _ug)
 local _sg = toNum(_ye.Followers)
 local _tg = toNum(_ye.Following)
 local _bg    = toNum(_ye.Groups)
 local _cg    = toNum(_ye.Badges)
 local _eg     = toNum(_ye.CreatedGames)
 local _mf      = _ye.AccountAgeDays or 0
 local _fg  = (_ye.Verified == "\83\237")
 local _vb = 0
 if _sg >= 10000 then _vb = _vb + 35
 elseif _sg >= 1000 then _vb = _vb + 28
 elseif _sg >= 100 then _vb = _vb + 18
 elseif _sg >= 25 then _vb = _vb + 10
 elseif _sg >= 5 then _vb = _vb + 4 end
 if _sg >= 10 then
 local _vg = _sg / math._de(_tg, 1)
 if _vg >= 5 then _vb = _vb + 12
 elseif _vg >= 2 then _vb = _vb + 8
 elseif _vg >= 1 then _vb = _vb + 4 end
 end
 if _fg then _vb = _vb + 15 end
 if _eg >= 5 then _vb = _vb + 12
 elseif _eg >= 1 then _vb = _vb + 6 end
 if _bg >= 10 then _vb = _vb + 8 elseif _bg >= 3 then _vb = _vb + 4 end
 if _cg >= 50 then _vb = _vb + 8 elseif _cg >= 10 then _vb = _vb + 4 end
 if _ug and _ug > 0 then
 if _ug >= 1000000 then _vb = _vb + 10
 elseif _ug >= 100000 then _vb = _vb + 7
 elseif _ug >= 10000 then _vb = _vb + 4
 elseif _ug >= 1000 then _vb = _vb + 2 end
 end
 if _mf >= 1825 then _vb = _vb + 5 elseif _mf >= 365 then _vb = _vb + 2 end
 _vb = math.clamp(_vb, 0, 100)
 local _wg, _xb = "\77\117\121\32\66\97\106\111", C.subtext
 if _vb >= 75 then _wg, _xb = "\77\117\121\32\65\108\116\111", C.good
 elseif _vb >= 50 then _wg, _xb = "\65\108\116\111", C.good
 elseif _vb >= 30 then _wg, _xb = "\77\101\100\105\111", C.warn
 elseif _vb >= 15 then _wg, _xb = "\66\97\106\111", C.warn end
 return _vb, _wg, _xb
end
local function computeAltRisk(_ye)
 local _mf     = _ye.AccountAgeDays or 0
 local _ag  = toNum(_ye.Friends)
 local _sg= toNum(_ye.Followers)
 local _tg= toNum(_ye.Following)
 local _bg   = toNum(_ye.Groups)
 local _dg     = toNum(_ye.Favorites)
 local _cg   = toNum(_ye.Badges)
 local _eg    = toNum(_ye.CreatedGames)
 local _fg = (_ye.Verified == "\83\237")
 local _xg  = _ye.Description and _ye.Description ~= "" and _ye.Description ~= "\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110"
 local _yg = (type(_ye._namesCached) == "\116\97\98\108\101") and #_ye._namesCached or nil
 local _zg = (type(_ye._itemsCached) == "\116\97\98\108\101") and #_ye._itemsCached or nil
 local _ah = {}
 local function note(t) _ah[#_ah + 1] = t end
 local _bh
 if _mf <= 3 then _bh = 100; note("\67\117\101\110\116\97\32\100\101\32" .. _mf .. "\32\100\237\97\40\115\41")
 elseif _mf <= 7 then _bh = 92; note("\67\117\101\110\116\97\32\100\101\32\109\101\110\111\115\32\100\101\32\49\32\115\101\109\97\110\97")
 elseif _mf <= 14 then _bh = 82; note("\67\117\101\110\116\97\32\100\101\32\109\101\110\111\115\32\100\101\32\50\32\115\101\109\97\110\97\115")
 elseif _mf <= 30 then _bh = 66; note("\67\117\101\110\116\97\32\100\101\32\109\101\110\111\115\32\100\101\32\49\32\109\101\115")
 elseif _mf <= 90 then _bh = 46; note("\67\117\101\110\116\97\32\100\101\32\112\111\99\111\115\32\109\101\115\101\115")
 elseif _mf <= 180 then _bh = 30
 elseif _mf <= 365 then _bh = 18
 elseif _mf <= 730 then _bh = 8
 elseif _mf <= 1825 then _bh = 3
 else _bh = 0 end
 local _ig = 0
 if _cg >= 50 then _ig = _ig + 4 elseif _cg >= 15 then _ig = _ig + 3
 elseif _cg >= 5 then _ig = _ig + 2 elseif _cg >= 1 then _ig = _ig + 1 end
 if _eg >= 1 then _ig = _ig + 2 end
 if _dg >= 10 then _ig = _ig + 2 elseif _dg >= 1 then _ig = _ig + 1 end
 if _bg >= 5 then _ig = _ig + 2 elseif _bg >= 1 then _ig = _ig + 1 end
 _ig = math.min(_ig, 8)
 local _ch = math.clamp(100 - _ig * 12.5, 0, 100)
 if _cg == 0 then note("\83\105\110\32\98\97\100\103\101\115") end
 if _bg == 0 then note("\48\32\103\114\117\112\111\115") end
 if _dg == 0 then note("\48\32\102\97\118\111\114\105\116\111\115") end
 if _eg == 0 then note("\83\105\110\32\101\120\112\101\114\105\101\110\99\105\97\115\32\99\114\101\97\100\97\115") end
 local _dh = 0
 if _ag >= 50 then _dh = _dh + 3 elseif _ag >= 20 then _dh = _dh + 2.5
 elseif _ag >= 10 then _dh = _dh + 2 elseif _ag >= 3 then _dh = _dh + 1
 elseif _ag >= 1 then _dh = _dh + 0.5 end
 if _sg >= 100 then _dh = _dh + 2 elseif _sg >= 10 then _dh = _dh + 1.5
 elseif _sg >= 1 then _dh = _dh + 0.5 end
 _dh = math.min(_dh, 5)
 local _eh = math.clamp(100 - _dh * 20, 0, 100)
 if _ag == 0 then note("\48\32\97\109\105\103\111\115")
 elseif _ag <= 1 then note(_ag .. "\32\97\109\105\103\111") end
 if _sg == 0 then note("\48\32\115\101\103\117\105\100\111\114\101\115") end
 if _tg >= 30 and _sg == 0 then note("\83\105\103\117\101\32\97\32\109\117\99\104\111\115\32\112\101\114\111\32\115\105\110\32\115\101\103\117\105\100\111\114\101\115") end
 local _fh, profMax = 0, 2.5
 if _xg then _fh = _fh + 1.5 else note("\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110") end
 if _zg ~= nil then
 if _zg >= 1 then _fh = _fh + 1 else note("\65\118\97\116\97\114\32\115\105\110\32\105\116\101\109\115\32\101\113\117\105\112\97\100\111\115") end
 else
 _fh = _fh + 0.5
 end
 local _gh = math.clamp(100 - (_fh / profMax) * 100, 0, 100)
 local _hh = _fg and 0 or 40
 if _fg then note("\73\110\115\105\103\110\105\97\32\118\101\114\105\102\105\99\97\100\97\32\40\97\116\101\110\250\97\41") end
 local _ih
 if _yg == nil then _ih = 50
 elseif _yg >= 1 then _ih = 10
 else _ih = 65; note("\83\105\110\32\110\111\109\98\114\101\115\32\97\110\116\101\114\105\111\114\101\115") end
 local _f = _bh * 0.25 + _ch * 0.25 + _eh * 0.20
 + _gh * 0.15 + _hh * 0.10 + _ih * 0.05
 local _vb = math.clamp(math.floor(_f + 0.5), 0, 100)
 local _wg, _xb = "\77\117\121\32\66\97\106\111", C.good
 if _vb >= 81 then _wg, _xb = "\77\117\121\32\65\108\116\111", C.bad
 elseif _vb >= 61 then _wg, _xb = "\65\108\116\111", C.bad
 elseif _vb >= 41 then _wg, _xb = "\77\101\100\105\111", C.warn
 elseif _vb >= 21 then _wg, _xb = "\66\97\106\111", C.good end
 local _jh = {
 { "\65\110\116\105\103\252\101\100\97\100", math.floor(_bh + 0.5), 25 },
 { "\65\99\116\105\118\105\100\97\100", math.floor(_ch + 0.5), 25 },
 { "\82\101\100\32\115\111\99\105\97\108", math.floor(_eh + 0.5), 20 },
 { "\80\101\114\102\105\108", math.floor(_gh + 0.5), 15 },
 { "\86\101\114\105\102\105\99\97\99\105\243\110", math.floor(_hh + 0.5), 10 },
 { "\72\105\115\116\111\114\105\97\108", math.floor(_ih + 0.5), 5 },
 }
 return _vb, _wg, _xb, _ah, _jh
end
local function computeActivity(_ye)
 local _cg  = toNum(_ye.Badges)
 local _eg   = toNum(_ye.CreatedGames)
 local _dg    = toNum(_ye.Favorites)
 local _bg  = toNum(_ye.Groups)
 local _kh = (_ye.PresenceType == 2)
 local _vb = 0
 if _cg >= 50 then _vb = _vb + 35
 elseif _cg >= 15 then _vb = _vb + 25
 elseif _cg >= 5 then _vb = _vb + 15
 elseif _cg >= 1 then _vb = _vb + 6 end
 if _eg >= 1 then _vb = _vb + 15 end
 if _dg >= 10 then _vb = _vb + 15 elseif _dg >= 1 then _vb = _vb + 7 end
 if _bg >= 5 then _vb = _vb + 15 elseif _bg >= 1 then _vb = _vb + 7 end
 if _kh then _vb = _vb + 20 end
 _vb = math.clamp(_vb, 0, 100)
 local _wg, _xb = "\73\110\97\99\116\105\118\97", C.subtext
 if _vb >= 70 then _wg, _xb = "\77\117\121\32\65\99\116\105\118\97", C.good
 elseif _vb >= 45 then _wg, _xb = "\65\99\116\105\118\97", C.good
 elseif _vb >= 20 then _wg, _xb = "\77\111\100\101\114\97\100\97", C.warn end
 return _vb, _wg, _xb
end
local function buildSummary(_ye, _mh, _nh, _oh, _ph, _qh, _rh, _sh)
 local s = {}
 local _lh  = _ye.AccountAgeYears or 0
 local _mf = _ye.AccountAgeDays or 0
 s[#s+1] = string.format("\67\117\101\110\116\97\32\100\101\32\126\37\46\49\102\32\97\241\111\115\32\40\37\100\32\100\237\97\115\41\46", _lh, _mf)
 s[#s+1] = string.format("\65\99\116\105\118\105\100\97\100\32\37\115\59\32\99\111\110\102\105\97\110\122\97\32\37\115\32\40\37\100\47\49\48\48\41\46", _sh, _nh, _mh)
 s[#s+1] = string.format("\82\105\101\115\103\111\32\100\101\32\97\108\116\32\37\115\32\40\37\100\47\49\48\48\41\46", _ph, _oh)
 s[#s+1] = string.format("\73\110\102\108\117\101\110\99\105\97\32\37\115\32\40\37\100\47\49\48\48\41\46", _rh, _qh)
 if _ye.Verified == "\83\237" then s[#s+1] = "\84\105\101\110\101\32\105\110\115\105\103\110\105\97\32\118\101\114\105\102\105\99\97\100\97\46" end
 if _mf >= 730 and toNum(_ye.Badges) == 0 and toNum(_ye.Groups) == 0 then
 s[#s+1] = "\65\116\101\110\99\105\243\110\58\32\99\117\101\110\116\97\32\97\110\116\105\103\117\97\32\99\111\110\32\109\117\121\32\112\111\99\97\32\97\99\116\105\118\105\100\97\100\32\40\112\111\115\105\98\108\101\32\99\117\101\110\116\97\32\99\111\109\112\114\97\100\97\32\111\32\97\98\97\110\100\111\110\97\100\97\41\46"
 end
 if _oh >= 60 then
 s[#s+1] = "\69\108\32\112\101\114\102\105\108\32\101\110\99\97\106\97\32\99\111\110\32\112\97\116\114\111\110\101\115\32\100\101\32\99\117\101\110\116\97\32\115\101\99\117\110\100\97\114\105\97\47\97\108\116\46"
 elseif _oh < 20 then
 s[#s+1] = "\78\111\32\109\117\101\115\116\114\97\32\112\97\116\114\111\110\101\115\32\116\237\112\105\99\111\115\32\100\101\32\97\108\116\46"
 end
 return table.concat(s, "\32")
end
local function getNameHistory(_uc)
 local _th = {}
 local _uh = nil
 local _vh = 10
 local _wh = 0
 local _xh = false
 repeat
 local _gc = "\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc .. "\47\117\115\101\114\110\97\109\101\45\104\105\115\116\111\114\121\63\108\105\109\105\116\61\49\48\48"
 if _uh then _gc = _gc .. "\38\99\117\114\115\111\114\61" .. _uh end
 local _ye = apiGet(_gc)
 if not _ye then break end
 if _ye._ye then
 for _, _k in ipairs(_ye._ye) do
 table.insert(_th, _k._i)
 end
 end
 _uh = _ye.nextPageCursor
 _wh = _wh + 1
 until (not _uh) or _wh >= _vh
 if _uh and _uh ~= "" and _wh >= _vh then _xh = true end
 local _yh, unique = {}, {}
 for _, _i in ipairs(_th) do
 if not _yh[_i] then
 _yh[_i] = true
 table.insert(unique, _i)
 end
 end
 return unique, _xh
end
local _zh      = {}
local _ai = {}
local function setCached(_uc, _ye)
 if not _zh[_uc] then
 table.insert(_ai, _uc)
 if #_ai > 20 then
 local _kf = table.remove(_ai, 1)
 _zh[_kf] = nil
 end
 end
 _zh[_uc] = _ye
end
local function gatherData(_uc)
 _zd.begin(_uc)
 local _bi = apiGet("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc)
 if type(_bi) ~= "\116\97\98\108\101" then
 _zd.mark("\85\115\101\114\73\100", "\109\105\115\115\105\110\103", "\101\108\32\112\101\114\102\105\108\32\110\111\32\114\101\115\112\111\110\100\105\243")
 _zd.finish()
 return nil, "\115\105\110\95\114\101\115\112\117\101\115\116\97"
 end
 local _ci       = _zd.check("\85\115\101\114\73\100",   _bi._hd or _uc,      _zd.valid._uc)
 local _di     = _zd.check("\85\115\101\114\110\97\109\101", _bi._i,              _zd.valid._bp)
 local _ei  = _zd.check("\67\114\101\97\116\101\100",  _bi._ze,           _zd.valid.isoDate)
 local _fi  = _zd.check("\68\105\115\112\108\97\121\78\97\109\101", _bi._rr or _bi._i, _zd.valid._rr)
 local _gi     = _zd.check("\68\101\115\99\114\105\112\116\105\111\110", _bi.description or "",
 function(v) return _zd.valid._hb(v, 4000) end)
 if _ci == nil or _di == nil then
 _zd.finish()
 return nil, "\112\101\114\102\105\108\95\105\110\118\97\108\105\100\111"
 end
 local _hi, accountAge, accountAgeDays, accountAgeYears = formatAge(_ei)
 local _ii = {}
 local _ud = 8
 local function task_fetch(_jd, _s)
 task.spawn(function()
 local _g, _ab = pcall(_s)
 _ii[_jd] = _g and _ab or nil
 _ud = _ud - 1
 end)
 end
 task_fetch("\70\114\105\101\110\100\115",      function() return simpleCount("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc .. "\47\102\114\105\101\110\100\115\47\99\111\117\110\116", "\99\111\117\110\116") end)
 task_fetch("\70\111\108\108\111\119\101\114\115",    function() return simpleCount("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc .. "\47\102\111\108\108\111\119\101\114\115\47\99\111\117\110\116", "\99\111\117\110\116") end)
 task_fetch("\70\111\108\108\111\119\105\110\103",    function() return simpleCount("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc .. "\47\102\111\108\108\111\119\105\110\103\115\47\99\111\117\110\116", "\99\111\117\110\116") end)
 task_fetch("\71\114\111\117\112\115",       function() return countPaged("\104\116\116\112\115\58\47\47\103\114\111\117\112\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc .. "\47\103\114\111\117\112\115\47\114\111\108\101\115") end)
 task_fetch("\66\97\100\103\101\115",       function() return countPaged("\104\116\116\112\115\58\47\47\98\97\100\103\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc .. "\47\98\97\100\103\101\115") end)
 task_fetch("\70\97\118\111\114\105\116\101\115",    function() return countPaged("\104\116\116\112\115\58\47\47\103\97\109\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\50\47\117\115\101\114\115\47" .. _uc .. "\47\102\97\118\111\114\105\116\101\47\103\97\109\101\115", 50) end)
 task_fetch("\67\114\101\97\116\101\100\71\97\109\101\115", function() return countPaged("\104\116\116\112\115\58\47\47\103\97\109\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\50\47\117\115\101\114\115\47" .. _uc .. "\47\103\97\109\101\115", 50) end)
 task_fetch("\80\114\111\102\105\108\101\65\112\105", function()
 local _wf = apiPost("\104\116\116\112\115\58\47\47\97\112\105\115\46\114\111\98\108\111\120\46\99\111\109\47\117\115\101\114\45\112\114\111\102\105\108\101\45\97\112\105\47\118\49\47\117\115\101\114\47\112\114\111\102\105\108\101\115\47\103\101\116\45\112\114\111\102\105\108\101\115", {
 userIds = { _uc },
 fields  = { "\110\97\109\101\115\46\117\115\101\114\110\97\109\101", "\110\97\109\101\115\46\100\105\115\112\108\97\121\78\97\109\101", "\110\97\109\101\115\46\99\111\109\98\105\110\101\100\78\97\109\101", "\105\115\86\101\114\105\102\105\101\100", "\105\115\68\101\108\101\116\101\100" },
 })
 if type(_wf) ~= "\116\97\98\108\101" or type(_wf.profileDetails) ~= "\116\97\98\108\101" then return nil end
 local d = _wf.profileDetails[1]
 if type(d) ~= "\116\97\98\108\101" then return nil end
 return d
 end)
 local _ji = os.clock()
 while _ud > 0 and (os.clock() - _ji) < 15 do
 task.wait(0.05)
 end
 local _ki = (_ud > 0)
 local _li, presColor, presPlaceId, presGameId, presType = getPresence(_uc)
 local _mi   = _zd.check("\70\114\105\101\110\100\115",      _ii.Friends,      _zd.valid.count)
 local _ni = _zd.check("\70\111\108\108\111\119\101\114\115",    _ii.Followers,    _zd.valid.count)
 local _oi = _zd.check("\70\111\108\108\111\119\105\110\103",    _ii.Following,    _zd.valid.count)
 local _pi    = _zd.check("\71\114\111\117\112\115",       _ii.Groups,       _zd.valid.count)
 local _qi    = _zd.check("\66\97\100\103\101\115",       _ii.Badges,       _zd.valid.count)
 local _ri = _zd.check("\70\97\118\111\114\105\116\101\115",    _ii.Favorites,    _zd.valid.count)
 local _si     = _zd.check("\67\114\101\97\116\101\100\71\97\109\101\115", _ii.CreatedGames, _zd.valid.count)
 local _ti    = _zd.check("\65\118\97\116\97\114\85\114\108",    getAvatar(_uc),    _zd.valid.image)
 local _ui = _ii.ProfileApi
 local _vi = (type(_ui) == "\116\97\98\108\101")
 local _wi, paVerified, paCombined
 if _vi then
 if type(_ui.isDeleted)  == "\98\111\111\108\101\97\110" then _wi  = _ui.isDeleted  end
 if type(_ui.isVerified) == "\98\111\111\108\101\97\110" then paVerified = _ui.isVerified end
 if type(_ui._sx) == "\116\97\98\108\101" and type(_ui._sx.combinedName) == "\115\116\114\105\110\103" then
 paCombined = _ui._sx.combinedName
 end
 end
 local _xi = _zd.finish()
 return {
 IsDeleted      = _wi,
 VerifiedApi    = paVerified,
 CombinedName   = paCombined,
 ProfileApiOk   = _vi,
 UserId         = _ci,
 ProfileUrl     = "\104\116\116\112\115\58\47\47\119\119\119\46\114\111\98\108\111\120\46\99\111\109\47\117\115\101\114\115\47" .. _ci .. "\47\112\114\111\102\105\108\101",
 Username       = _di,
 DisplayName    = _fi or _di,
 Description    = (_gi and _gi ~= "" and _gi) or "\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110",
 Banned         = _bi.isBanned and "\83\237" or "\78\111",
 Verified       = _bi.hasVerifiedBadge and "\83\237" or "\78\111",
 Created        = _hi or "\78\111\32\100\105\115\112\111\110\105\98\108\101",
 AccountAge     = accountAge or "\78\111\32\100\105\115\112\111\110\105\98\108\101",
 AccountAgeDays  = accountAgeDays or 0,
 AccountAgeYears = accountAgeYears or 0,
 Subscription   = getSubscription(_uc),
 Presence       = _li,
 PresenceColor  = presColor,
 PresencePlace  = presPlaceId,
 PresenceGame   = presGameId,
 PresenceType   = presType,
 AvatarUrl      = _ti or "\114\98\120\97\115\115\101\116\105\100\58\47\47\48",
 Friends        = _mi,
 Followers      = _ni,
 Following      = _oi,
 Groups         = _pi,
 Badges         = _qi,
 Favorites      = _ri,
 CreatedGames   = _si,
 _integrity     = _zd.run,
 _state         = _xi,
 _timedOut      = _ki,
 _fetchedAt     = os.time(),
 }
end
local _yi = {}
local _zi = Instance.new("\83\99\114\101\101\110\71\117\105")
_zi.Name = "\85\116\105\108\105\116\121\80\97\110\101\108"
_zi.ResetOnSpawn = false
_zi.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_zi.IgnoreGuiInset = true
_zi.DisplayOrder = 2147483
_zi.Parent = _b
task.defer(function()
 pcall(function()
 local _aj = _b.ChildAdded:Connect(function(_bj)
 if _bj ~= _zi and _bj:IsA("\83\99\114\101\101\110\71\117\105") and _bj.DisplayOrder >= _zi.DisplayOrder then
 _zi.DisplayOrder = _bj.DisplayOrder + 1
 end
 end)
 table.insert(_yi, _aj)
 end)
end)
if (_d.introEnabled ~= false) and (_d.introSeen ~= true) then
 _zi.Enabled = false
end
local function track(_aj)
 table.insert(_yi, _aj)
 return _aj
end
local _cj
local function cleanupAll()
 for _, c in ipairs(_yi) do
 pcall(function() c:Disconnect() end)
 end
 table.clear(_yi)
 _cj()
 pcall(function() if _G.NXScan and _G.NXScan.stop then _G.NXScan.stop() end end)
 pcall(function() if _G.NXV2 and _G.NXV2.stop then _G.NXV2.stop() end end)
 pcall(function() if _G._chb and _G._chb.Stop then _G._chb.Stop() end end)
 pcall(function()
 local _yf = _b:FindFirstChild("\76\105\115\116\97\74\117\103\97\100\111\114\101\115\77\111\100\101\114\110\97")
 if _yf then _yf:Destroy() end
 end)
end
track(_zi.AncestryChanged:Connect(function(_, _ij)
 if not _ij then cleanupAll() end
end))
local _dj = Enum.KeyCode.RightShift
local _ej = false
local _fj = {}
local function setHidden(h)
 _ej = h
 _zi.Enabled = not h
 if (not h) and _fj.playOpenAnim then pcall(_fj.playOpenAnim) end
end
track(UserInputService.InputBegan:Connect(function(_jj, _kj)
 if _kj or UserInputService:GetFocusedTextBox() then return end
 if _jj.KeyCode == _dj then
 setHidden(not _ej)
 end
end))
local _gj = { enabled = (_d.animations ~= false), infinites = {} }
local function motionTween(_p, _xe, _lj, _df)
 if _gj.enabled then
 local _hj = TweenService:Create(_p, _xe, _lj)
 _hj:Play()
 if _df then _hj.Completed:Once(_df) end
 return _hj
 end
 for k, v in pairs(_lj) do pcall(function() _p[k] = v end) end
 if _df then task.defer(_df) end
 return nil
end
local function registerInfiniteTween(_hj)
 if _hj then table.insert(_gj.infinites, _hj) end
 return _hj
end
_cj = function()
 for i, _hj in ipairs(_gj.infinites) do
 pcall(function() _hj:Cancel() end)
 _gj.infinites[i] = nil
 end
 _gj.infinites = {}
end
local function setAnimationsEnabled(_pb)
 _gj.enabled = _pb and true or false
 if not _gj.enabled then _cj() end
 if _G._chb and _G._chb.SetAnimationsEnabled then
 pcall(_G._chb.SetAnimationsEnabled, _gj.enabled)
 end
end
local function addHoverStroke(_gb)
 _gb.AutoButtonColor = false
 _gb:SetAttribute("\78\88\72\111\118\101\114\68\111\110\101", true)
 local _lb = _gb:FindFirstChildOfClass("\85\73\83\99\97\108\101") or Instance.new("\85\73\83\99\97\108\101", _gb)
 local function to(s, d)
 motionTween(_lb, TweenInfo.new(d, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = s })
 end
 _gb.MouseButton1Down:Connect(function() to(0.97, 0.07) end)
 _gb.MouseButton1Up:Connect(function() to(1, 0.12) end)
 _gb.MouseLeave:Connect(function() _lb.Scale = 1 end)
end
local function addShineHover(_gb)
 local _mj = Instance.new("\85\73\83\99\97\108\101", _gb)
 _mj.Name = "\72\111\118\101\114\83\99\97\108\101"
 local _v = _gb:FindFirstChildOfClass("\85\73\83\116\114\111\107\101")
 local _nj = _v and _v.Transparency or 0.5
 local _oj = _gb.BackgroundColor3
 local _pj = false
 _gb.MouseEnter:Connect(function()
 if not _gj.enabled then return end
 _pj = true
 motionTween(_mj, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.045 })
 if _v then
 motionTween(_v, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Transparency = math._de(_nj - 0.35, 0),
 Color = C._idb
 })
 end
 motionTween(_gb, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 BackgroundColor3 = Color3.new(
 math.min(_oj.R + 0.06, 1),
 math.min(_oj.G + 0.06, 1),
 math.min(_oj.B + 0.06, 1))
 })
 end)
 _gb.MouseLeave:Connect(function()
 _pj = false
 motionTween(_mj, TweenInfo.new(0.30, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Scale = 1 })
 if _v then
 motionTween(_v, TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Transparency = _nj,
 Color = C._whb
 })
 end
 motionTween(_gb, TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 BackgroundColor3 = _oj
 })
 end)
 _gb.MouseButton1Down:Connect(function()
 motionTween(_mj, TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.92 })
 end)
 _gb.MouseButton1Up:Connect(function()
 motionTween(_mj, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = _pj and 1.045 or 1 })
 end)
end
local function addDepth(_qj)
 local _v = Instance.new("\85\73\83\116\114\111\107\101", _qj)
 _v.Color = C._whb; _v.Transparency = 0.6; _v.Thickness = 1
 themed(_v, "\67\111\108\111\114", "\98\111\114\100\101\114")
 return nil, _v
end
local function addDropShadow(_cc, _t, _sj, _tj, _uj)
 _tj = _tj or 26
 local _rj = Instance.new("\73\109\97\103\101\76\97\98\101\108")
 _rj.Name = "\68\114\111\112\83\104\97\100\111\119"
 _rj.Active = false
 _rj.BackgroundTransparency = 1
 _rj.Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\51\49\54\48\52\53\50\49\55"
 _rj.ImageColor3 = Color3.fromRGB(0, 0, 0)
 _rj.ImageTransparency = _uj or 0.4
 _rj.ScaleType = Enum.ScaleType.Slice
 _rj.SliceCenter = Rect.new(10, 10, 118, 118)
 _rj.AnchorPoint = _cc.AnchorPoint
 _rj.Position = _cc.Position
 _rj.Size = _cc.Size + UDim2.fromOffset(_tj * 2, _tj * 2)
 _rj.ZIndex = _sj or 0
 _rj.Parent = _t
 return _rj
end
function _zd.makeSwitch(_t, _pb, _qb)
 local W, H = 40, 20
 local _vj = H - 4
 local _wj = 4
 local _xj = Instance.new("\84\101\120\116\66\117\116\116\111\110", _t)
 _xj.Size = UDim2.fromOffset(W, H)
 _xj.AutoButtonColor = false
 _xj.Text = ""
 _xj.BorderSizePixel = 0
 _xj.BackgroundColor3 = _pb and C.good or C._whb
 Instance.new("\85\73\67\111\114\110\101\114", _xj).CornerRadius = UDim.new(1, 0)
 local _yj = Instance.new("\70\114\97\109\101", _xj)
 _yj.Size = UDim2.fromOffset(_vj, _vj)
 _yj.Position = _pb and UDim2.new(1, -(_vj + 2), 0, 2) or UDim2.new(0, 2, 0, 2)
 _yj.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 _yj.BorderSizePixel = 0
 _yj.ZIndex = 2
 Instance.new("\85\73\67\111\114\110\101\114", _yj).CornerRadius = UDim.new(1, 0)
 local _zj = Instance.new("\85\73\83\99\97\108\101", _yj)
 _zj.Scale = 1
 local _xi, ocupado = _pb, false
 local _ak
 local function pintar(_fk)
 local _bk = ocupado and C.warn or (_xi and C.good or C._whb)
 if _fk and _gj.enabled then
 motionTween(_xj, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundColor3 = _bk })
 else
 _xj.BackgroundColor3 = _bk
 end
 end
 local function setOn(v, _gk)
 _xi = v and true or false
 local _ck = _xi and UDim2.new(1, -(_vj + 2), 0, 2) or UDim2.new(0, 2, 0, 2)
 if _gk == false then
 _yj.Position = _ck
 _yj.Size = UDim2.fromOffset(_vj, _vj)
 elseif _gj.enabled then
 _yj.Size = UDim2.fromOffset(_vj + _wj, _vj)
 motionTween(_yj, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = _ck })
 task.delay(0.12, function()
 if _yj and _yj.Parent then
 motionTween(_yj, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(_vj, _vj) })
 end
 end)
 else
 _yj.Position = _ck
 end
 pintar(_gk ~= false)
 end
 local function setBusy(b)
 ocupado = b and true or false
 pintar(true)
 if _ak then pcall(function() _ak:Cancel() end); _ak = nil end
 if ocupado and _gj.enabled then
 _yj.BackgroundTransparency = 0
 _ak = TweenService:Create(_yj,
 TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
 { BackgroundTransparency = 0.55 })
 _ak:Play()
 registerInfiniteTween(_ak)
 else
 _yj.BackgroundTransparency = 0
 end
 end
 _xj.MouseEnter:Connect(function()
 if ocupado then return end
 if _gj.enabled then
 motionTween(_zj, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1.12 })
 end
 end)
 _xj.MouseLeave:Connect(function()
 if _gj.enabled then
 motionTween(_zj, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 })
 end
 end)
 _xj.MouseButton1Down:Connect(function()
 if ocupado then return end
 if _gj.enabled then
 motionTween(_zj, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.9 })
 end
 end)
 _xj.MouseButton1Up:Connect(function()
 if _gj.enabled then
 motionTween(_zj, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
 end
 end)
 _xj.MouseButton1Click:Connect(function()
 if ocupado then return end
 setOn(not _xi)
 if _qb then _qb(_xi) end
 end)
 onRepaint(pintar)
 return _xj, setOn, setBusy
end
_G.NXDS._makeSwitch = _zd.makeSwitch
local _dk, MIN_H = 420, 360
local _ek = Instance.new("\70\114\97\109\101")
_ek.Name = "\109\97\105\110"
_ek.Size = UDim2.new(0, 620, 0, 500)
_ek.Position = UDim2.new(0.5, -310, 0.5, -250)
_ek.BackgroundColor3 = C.bg
_ek.BackgroundTransparency = 0.02
_ek.BorderSizePixel = 0
_ek.Active = true
_ek.ClipsDescendants = true
_ek.Parent = _zi
Instance.new("\85\73\67\111\114\110\101\114", _ek).CornerRadius = UDim.new(0, 12)
themed(_ek, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\103")
local _hk = Instance.new("\85\73\83\116\114\111\107\101", _ek)
_hk.Color = C._whb
_hk.Transparency = 0.5
_hk.Thickness = 1
themed(_hk, "\67\111\108\111\114", "\98\111\114\100\101\114")
local _ik = Instance.new("\73\109\97\103\101\76\97\98\101\108")
_ik.Name = "\87\105\110\100\111\119\83\104\97\100\111\119"
_ik.Active = false
_ik.BackgroundTransparency = 1
_ik.Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\54\48\49\52\50\54\49\57\57\51"
_ik.ImageColor3 = Color3.fromRGB(0, 0, 0)
_ik.ImageTransparency = 0.6
_ik.ScaleType = Enum.ScaleType.Slice
_ik.SliceCenter = Rect.new(49, 49, 450, 450)
_ik.ZIndex = 0
_ik.Parent = _zi
local function syncWindowShadow()
 _ik.Size = _ek.Size + UDim2.fromOffset(28, 28)
 _ik.Position = _ek.Position - UDim2.fromOffset(14, 14)
end
syncWindowShadow()
track(_ek:GetPropertyChangedSignal("\83\105\122\101"):Connect(syncWindowShadow))
track(_ek:GetPropertyChangedSignal("\80\111\115\105\116\105\111\110"):Connect(syncWindowShadow))
local _jk = Instance.new("\70\114\97\109\101", _ek)
_jk.Size = UDim2.new(1, 0, 0, 36)
_jk.BackgroundColor3 = C.headerBg
_jk.BackgroundTransparency = 0
_jk.BorderSizePixel = 0
themed(_jk, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\104\101\97\100\101\114\66\103")
local _kk = Instance.new("\70\114\97\109\101", _ek)
_kk.Size = UDim2.new(1, 0, 0, 1)
_kk.Position = UDim2.new(0, 0, 0, 36)
_kk.BackgroundColor3 = C._jq
_kk.BackgroundTransparency = 0.4
_kk.BorderSizePixel = 0
themed(_kk, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\100\105\118\105\100\101\114")
local _lk = Instance.new("\84\101\120\116\76\97\98\101\108", _jk)
_lk.Size = UDim2.new(1, -100, 1, 0)
_lk.Position = UDim2.new(0, 56, 0, 0)
_lk.BackgroundTransparency = 1
_lk.Font = Enum.Font.GothamBold
_lk.Text = "\82\111\98\108\111\120\32\80\114\111\102\105\108\101\32\65\110\97\108\121\122\101\114"
_lk.TextColor3 = C._hb
_lk.TextSize = 15
_lk.TextXAlignment = Enum.TextXAlignment.Left
_lk.TextTruncate = Enum.TextTruncate.AtEnd
themed(_lk, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
do
local _mk = _lk:Clone()
_mk.Name = "\84\105\116\108\101\83\104\105\110\101"
_mk.TextColor3 = Color3.fromRGB(255, 255, 255)
_mk.TextTransparency = 0.4
_mk.ZIndex = _lk.ZIndex + 1
_mk.Parent = _lk.Parent
local _nk = Instance.new("\85\73\71\114\97\100\105\101\110\116", _mk)
_nk.Rotation = 18
_nk.Transparency = NumberSequence.new({
 NumberSequenceKeypoint.new(0.00, 1),
 NumberSequenceKeypoint.new(0.44, 1),
 NumberSequenceKeypoint.new(0.50, 0.15),
 NumberSequenceKeypoint.new(0.56, 1),
 NumberSequenceKeypoint.new(1.00, 1),
})
local function syncShine()
 _mk.Size = _lk.Size
 _mk.Position = _lk.Position
 _mk.TextXAlignment = _lk.TextXAlignment
end
syncShine()
track(_lk:GetPropertyChangedSignal("\83\105\122\101"):Connect(syncShine))
track(_lk:GetPropertyChangedSignal("\80\111\115\105\116\105\111\110"):Connect(syncShine))
if _gj.enabled then
 _nk.Offset = Vector2.new(-1, 0)
 local _ok = TweenService:Create(_nk,
 TweenInfo.new(2.0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, false, 2.0),
 { Offset = Vector2.new(1, 0) })
 _ok:Play()
 registerInfiniteTween(_ok)
else
 _nk.Offset = Vector2.new(2, 0)
end
end
do
 local _pk = Instance.new("\85\73\83\99\97\108\101", _ek)
 _pk.Scale = 1
 local _qk, prevSize, prevPos = false, nil, nil
 local _rk, savedCollapseSize = false, nil
 function _fj.playOpenAnim()
 if not _gj.enabled then
 _pk.Scale = 1
 _ik.ImageTransparency = 0.6
 return
 end
 _pk.Scale = 0.94
 _ik.ImageTransparency = 0.6
 motionTween(_pk, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
 end
 function _fj.setDragSquish(_pb)
 if not _gj.enabled then return end
 if _pb then
 motionTween(_pk, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.985 })
 else
 motionTween(_pk, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
 end
 end
 function _fj.animatedClose()
 if not _gj.enabled then _zi:Destroy(); return end
 motionTween(_ik, TweenInfo.new(0.18), { ImageTransparency = 1 })
 motionTween(_pk, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.02 }, function()
 _zi:Destroy()
 end)
 end
 function _fj.toggleCollapse()
 if _rk then
 _rk = false
 motionTween(_ek, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = savedCollapseSize or _ek.Size })
 else
 savedCollapseSize = _ek.Size
 _rk = true
 motionTween(_ek, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
 { Size = UDim2.new(_ek.Size.X.Scale, _ek.Size.X.Offset, 0, 36) })
 end
 end
 function _fj.toggleMaximize()
 local _sk, _zl
 if _qk then
 _sk = prevSize or _ek.Size
 _zl  = prevPos  or _ek.Position
 _qk = false
 else
 prevSize = (_rk and savedCollapseSize) or _ek.Size
 prevPos  = _ek.Position
 local _tk = workspace.CurrentCamera
 local _uk = (_tk and _tk.ViewportSize) or Vector2.new(1280, 720)
 local w = math._de(_dk, math.floor(_uk.X * 0.9))
 local h = math._de(MIN_H, math.floor(_uk.Y * 0.9))
 _sk = UDim2.new(0, w, 0, h)
 _zl  = UDim2.new(0.5, -w/2, 0.5, -h/2)
 _qk = true
 end
 _rk = false
 motionTween(_ek, TweenInfo.new(0.34, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = _sk, Position = _zl })
 end
end
_fj.playOpenAnim()
local function makeTrafficLight(x, _xb)
 local b = Instance.new("\70\114\97\109\101", _jk)
 b.Size = UDim2.new(0, 10, 0, 10)
 b.Position = UDim2.new(0, x, 0.5, -5)
 b.BackgroundColor3 = _xb
 b.BorderSizePixel = 0
 b.ZIndex = 3
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new(1, 0)
 return b
end
makeTrafficLight(14, Color3.fromRGB(255, 95, 86))
makeTrafficLight(30, Color3.fromRGB(255, 189, 46))
makeTrafficLight(46, Color3.fromRGB(39, 201, 63))
local _vk = Instance.new("\70\114\97\109\101", _ek)
_vk.Size = UDim2.new(1, -24, 0, 52)
_vk.Position = UDim2.new(0, 12, 0, 42)
_vk.BackgroundTransparency = 1
local _wk = Instance.new("\84\101\120\116\66\111\120", _vk)
_wk.Size = UDim2.new(1, -122, 0, 32)
_wk.PlaceholderText = "\85\115\117\97\114\105\111\32\111\32\73\68"
_wk.PlaceholderColor3 = C.textDisabled
_wk.Text = ""
_wk.Font = Enum.Font.Gotham
_wk.TextSize = 13
_wk.BackgroundColor3 = C._jj
_wk.TextColor3 = C._hb
_wk.ClearTextOnFocus = false
_wk.BorderSizePixel = 0
_wk.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("\85\73\67\111\114\110\101\114", _wk).CornerRadius = UDim.new(0, 8)
local _xk = Instance.new("\85\73\80\97\100\100\105\110\103", _wk)
_xk.PaddingLeft = UDim.new(0, 32)
_xk.PaddingRight = UDim.new(0, 8)
themed(_wk, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\105\110\112\117\116")
themed(_wk, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
local _yk = Instance.new("\85\73\83\116\114\111\107\101", _wk)
_yk.Thickness = 1; _yk.Transparency = 0.7; _yk.Color = C._whb
_yk.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
themed(_yk, "\67\111\108\111\114", "\98\111\114\100\101\114")
do
 local _zk = Instance.new("\85\73\83\99\97\108\101", _wk)
 _wk.MouseEnter:Connect(function()
 if not _gj.enabled then return end
 motionTween(_yk, TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Transparency = 0.35, Color = C._idb
 })
 end)
 _wk.MouseLeave:Connect(function()
 if _wk:IsFocused() then return end
 motionTween(_yk, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Transparency = 0.7, Color = C._whb
 })
 end)
 _wk.Focused:Connect(function()
 if not _gj.enabled then return end
 motionTween(_yk, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Transparency = 0.1, Color = C._idb, Thickness = 1.5
 })
 motionTween(_zk, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.015 })
 motionTween(_wk, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 BackgroundColor3 = Color3.new(
 math.min(C._jj.R + 0.03, 1),
 math.min(C._jj.G + 0.03, 1),
 math.min(C._jj.B + 0.03, 1))
 })
 end)
 _wk.FocusLost:Connect(function()
 motionTween(_yk, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Transparency = 0.7, Color = C._whb, Thickness = 1
 })
 motionTween(_zk, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Scale = 1 })
 motionTween(_wk, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 BackgroundColor3 = C._jj
 })
 end)
end
local _al = Instance.new("\70\114\97\109\101", _vk)
_al.Name = "\83\101\97\114\99\104\73\99\111\110"
_al.Size = UDim2.new(0, 16, 0, 32)
_al.Position = UDim2.new(0, 8, 0, 0)
_al.BackgroundTransparency = 1
_al.ZIndex = 2
do
 local _bl = Instance.new("\70\114\97\109\101", _al)
 _bl.AnchorPoint = Vector2.new(0.5, 0.5)
 _bl.Position = UDim2.new(0.42, 0, 0.5, -1)
 _bl.Size = UDim2.fromOffset(10, 10)
 _bl.BackgroundTransparency = 1; _bl.BorderSizePixel = 0; _bl.ZIndex = 2
 Instance.new("\85\73\67\111\114\110\101\114", _bl).CornerRadius = UDim.new(1, 0)
 local _cl = Instance.new("\85\73\83\116\114\111\107\101", _bl)
 _cl.Thickness = 1.6; _cl.Color = C.subtext
 themed(_cl, "\67\111\108\111\114", "\115\117\98\116\101\120\116")
 local _dl = Instance.new("\70\114\97\109\101", _al)
 _dl.AnchorPoint = Vector2.new(0.5, 0.5)
 _dl.Position = UDim2.new(0.74, 0, 0.78, -1)
 _dl.Size = UDim2.fromOffset(5, 1.8)
 _dl.Rotation = 45; _dl.BorderSizePixel = 0
 _dl.BackgroundColor3 = C.subtext; _dl.ZIndex = 2
 Instance.new("\85\73\67\111\114\110\101\114", _dl).CornerRadius = UDim.new(1, 0)
 themed(_dl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
end
local _el
local function hideAllSuggestions() end
local function showSuggestions(_) end
local function ensureSuggestionItem(_) return nil end
local _fl = Instance.new("\84\101\120\116\66\117\116\116\111\110", _vk)
_fl.Size = UDim2.new(0, 110, 0, 32)
_fl.AnchorPoint = Vector2.new(1, 0)
_fl.Position = UDim2.new(1, 0, 0, 0)
_fl.BackgroundColor3 = C._idb
_fl.Text = "\65\110\97\108\105\122\97\114"
_fl.Font = Enum.Font.GothamBold
_fl.TextSize = 13
_fl.TextColor3 = C.onAccent
_fl.BorderSizePixel = 0
Instance.new("\85\73\67\111\114\110\101\114", _fl).CornerRadius = UDim.new(0, 8)
themed(_fl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
themed(_fl, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
addHoverStroke(_fl)
local _gl = Instance.new("\84\101\120\116\76\97\98\101\108", _vk)
_gl.Size = UDim2.new(1, 0, 0, 16)
_gl.Position = UDim2.new(0, 0, 0, 35)
_gl.BackgroundTransparency = 1
_gl.Font = Enum.Font.Gotham
_gl.TextSize = 11
_gl.TextColor3 = C.subtext
_gl.Text = ""
_gl.TextXAlignment = Enum.TextXAlignment.Left
_gl.TextTruncate = Enum.TextTruncate.AtEnd
themed(_gl, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
local _hl = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _ek)
_hl.Size = UDim2.new(1, -24, 0, 30)
_hl.Position = UDim2.new(0, 12, 0, 96)
_hl.BackgroundColor3 = C.bg
_hl.BackgroundTransparency = 1
themed(_hl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\103")
_hl.BorderSizePixel = 0
_hl.ZIndex = 3
_hl.ScrollBarThickness = 2
_hl.ScrollBarImageColor3 = C._idb
themed(_hl, "\83\99\114\111\108\108\66\97\114\73\109\97\103\101\67\111\108\111\114\51", "\97\99\99\101\110\116")
_hl.ScrollingDirection = Enum.ScrollingDirection.X
_hl.CanvasSize = UDim2.new(0, 0, 0, 0)
_hl.AutomaticCanvasSize = Enum.AutomaticSize.X
local _il = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _hl)
_il.FillDirection = Enum.FillDirection.Horizontal
_il.Padding = UDim.new(0, 6)
_il.SortOrder = Enum.SortOrder.LayoutOrder
_il.VerticalAlignment = Enum.VerticalAlignment.Center
local _jl = Instance.new("\70\114\97\109\101", _ek)
_jl.Size = UDim2.new(1, -24, 1, -134)
_jl.Position = UDim2.new(0, 12, 0, 128)
_jl.BackgroundTransparency = 1
local _kl, pages = {}, {}
local _ll = {}
local _ml = {}
local _nl = nil
local _ol = Instance.new("\70\114\97\109\101", _ek)
_ol.Name = "\84\97\98\65\99\116\105\118\101\73\110\100\105\99\97\116\111\114"
_ol.Size = UDim2.fromOffset(0, 0)
_ol.Position = UDim2.fromOffset(0, 0)
_ol.BackgroundColor3 = C._idb
_ol.BorderSizePixel = 0
_ol.Active = false
_ol.ZIndex = 2
Instance.new("\85\73\67\111\114\110\101\114", _ol).CornerRadius = UDim.new(0, 6)
themed(_ol, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
local function syncTabIndicator(_fk)
 if not _nl or not _nl.Parent then return end
 local _pl = _ek.AbsoluteSize
 local _ql = _ek.AbsolutePosition
 local _rl = _nl.AbsolutePosition
 local _sl = _nl.AbsoluteSize
 if _pl.X <= 0 or _pl.Y <= 0 or _sl.X <= 0 then return end
 local _tl = _hl.AbsolutePosition
 local _ul = _hl.AbsoluteSize
 if _rl.X < _tl.X or (_rl.X + _sl.X) > (_tl.X + _ul.X) then
 _ol.Visible = false
 return
 end
 _ol.Visible = true
 local _vl = _ek.Size.X.Offset
 local _wl = _ek.Size.Y.Offset
 if _vl <= 0 or _wl <= 0 then return end
 local _xl = _pl.X / _vl
 local _yl = _pl.Y / _wl
 if _xl <= 0 or _yl <= 0 then return end
 local _zl = UDim2.fromOffset(
 math.round((_rl.X - _ql.X) / _xl),
 math.round((_rl.Y - _ql.Y) / _yl)
 )
 local _sk = UDim2.fromOffset(
 math.round(_sl.X / _xl),
 math.round(_sl.Y / _yl)
 )
 if _fk and _gj.enabled then
 motionTween(_ol,
 TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { Position = _zl, Size = _sk })
 else
 _ol.Position = _zl
 _ol.Size = _sk
 end
end
local function paintTabs(_fk)
 for _, t in ipairs(_kl) do
 local _am = (t == _nl)
 local _bk = _am and C.onAccent or C.subtext
 local _bm = _am and C._idb or C.bg
 if _fk and _gj.enabled then
 motionTween(t, TweenInfo.new(0.26, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 BackgroundColor3 = _bm,
 BackgroundTransparency = 1,
 TextColor3 = _bk,
 TextTransparency = 0,
 })
 else
 t.BackgroundColor3 = _bm
 t.BackgroundTransparency = 1
 t.TextColor3 = _bk
 t.TextTransparency = 0
 end
 end
 _ol.BackgroundColor3 = C._idb
 syncTabIndicator(_fk)
end
onRepaint(paintTabs)
track(_hl:GetPropertyChangedSignal("\67\97\110\118\97\115\80\111\115\105\116\105\111\110"):Connect(function() syncTabIndicator(false) end))
track(_il:GetPropertyChangedSignal("\65\98\115\111\108\117\116\101\67\111\110\116\101\110\116\83\105\122\101"):Connect(function()
 task.defer(function() syncTabIndicator(false) end)
end))
track(_ek:GetPropertyChangedSignal("\65\98\115\111\108\117\116\101\83\105\122\101"):Connect(function() syncTabIndicator(false) end))
local function showPage(_dm)
 if _gj.enabled then
 local _cm
 for _, p in pairs(pages) do
 if p.Visible and p ~= _dm then _cm = p; break end
 end
 if _cm then
 task.delay(0.1, function()
 if _cm and _cm.Parent then _cm.Visible = false end
 end)
 end
 for _, p in pairs(pages) do if p ~= _cm then p.Visible = false end end
 _dm.Visible = true
 local _lb = _dm:FindFirstChild("\80\97\103\101\83\99\97\108\101")
 if not _lb then _lb = Instance.new("\85\73\83\99\97\108\101", _dm); _lb.Name = "\80\97\103\101\83\99\97\108\101" end
 _lb.Scale = 0.99
 _dm.Position = UDim2.new(0, 0, 0, 8)
 for _, _xt in ipairs(_dm:GetChildren()) do
 if _xt:IsA("\67\97\110\118\97\115\71\114\111\117\112") then
 _xt.GroupTransparency = 1
 end
 end
 motionTween(_dm, TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
 { Position = UDim2.new(0, 0, 0, 0) })
 motionTween(_lb, TweenInfo.new(0.28, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { Scale = 1 })
 else
 for _, p in pairs(pages) do p.Visible = false end
 _dm.Visible = true
 _dm.Position = UDim2.new(0, 0, 0, 0)
 end
 _nl = _ll[_dm]
 paintTabs(true)
 local _em = _ml[_dm]
 if _em then pcall(_em) end
end
local function createTab(_i, _dm, _fm)
 local _gb = Instance.new("\84\101\120\116\66\117\116\116\111\110", _hl)
 _gb.Size = UDim2.new(0, 0, 0, 28)
 _gb.AutomaticSize = Enum.AutomaticSize.X
 _gb.LayoutOrder = #_kl
 _gb.BackgroundColor3 = C.bg
 _gb.BackgroundTransparency = 1
 _gb.Text = _i
 _gb.Font = Enum.Font.GothamMedium
 _gb.TextSize = 13
 _gb.TextColor3 = C.subtext
 _gb.BorderSizePixel = 0
 _gb.ZIndex = 3
 Instance.new("\85\73\67\111\114\110\101\114", _gb).CornerRadius = UDim.new(0, 6)
 local _gm = Instance.new("\85\73\80\97\100\100\105\110\103", _gb)
 _gm.PaddingLeft = UDim.new(0, 16); _gm.PaddingRight = UDim.new(0, 16)
 addHoverStroke(_gb)
 track(_gb.MouseEnter:Connect(function()
 if _gb ~= _nl then
 motionTween(_gb, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { TextColor3 = C._hb })
 end
 end))
 track(_gb.MouseLeave:Connect(function()
 if _gb ~= _nl then
 motionTween(_gb, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { TextColor3 = C.subtext })
 end
 end))
 _ll[_dm] = _gb
 if _fm then _ml[_dm] = _fm end
 track(_gb.MouseButton1Click:Connect(function() showPage(_dm) end))
 table.insert(_kl, _gb)
 table.insert(pages, _dm)
 if #_kl == 1 then
 _nl = _gb
 _dm.Visible = true
 end
 paintTabs(false)
 task.defer(function() syncTabIndicator(false) end)
 return _gb
end
local function makeScroll(_t)
 local _hm = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _t)
 _hm.Size = UDim2.new(1, 0, 1, 0)
 _hm.BackgroundTransparency = 1
 _hm.BorderSizePixel = 0
 _hm.ScrollBarThickness = 3
 _hm.ScrollBarImageColor3 = C._idb
 _hm.CanvasSize = UDim2.new(0, 0, 0, 0)
 _hm.AutomaticCanvasSize = Enum.AutomaticSize.Y
 _hm.ClipsDescendants = true
 themed(_hm, "\83\99\114\111\108\108\66\97\114\73\109\97\103\101\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _im = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _hm)
 _im.Padding = UDim.new(0, 10)
 _im.SortOrder = Enum.SortOrder.LayoutOrder
 local _tj = Instance.new("\85\73\80\97\100\100\105\110\103", _hm)
 _tj.PaddingRight = UDim.new(0, 8)
 _tj.PaddingTop = UDim.new(0, 4)
 _tj.PaddingBottom = UDim.new(0, 8)
 return _hm
end
local _jm = Instance.new("\70\114\97\109\101", _jl)
_jm.Size = UDim2.new(1, 0, 1, 0)
_jm.BackgroundTransparency = 1
_jm.Visible = false
local _km = makeScroll(_jm)
local _lm = Instance.new("\70\114\97\109\101", _jl)
_lm.Size = UDim2.new(1, 0, 1, 0)
_lm.BackgroundTransparency = 1
_lm.Visible = false
local _mm = makeScroll(_lm)
local _nm = Instance.new("\70\114\97\109\101", _jl)
_nm.Size = UDim2.new(1, 0, 1, 0)
_nm.BackgroundTransparency = 1
_nm.Visible = false
local _om = makeScroll(_nm)
local _pm = Instance.new("\70\114\97\109\101", _jl)
_pm.Size = UDim2.new(1, 0, 1, 0)
_pm.BackgroundTransparency = 1
_pm.Visible = false
local _qm = makeScroll(_pm)
local _rm = Instance.new("\70\114\97\109\101", _jl)
_rm.Size = UDim2.new(1, 0, 1, 0)
_rm.BackgroundTransparency = 1
_rm.Visible = false
local _sm = makeScroll(_rm)
local GuiService = game:GetService("\71\117\105\83\101\114\118\105\99\101")
local function openURL(_gc)
 local _g = pcall(function() GuiService:OpenBrowserWindow(_gc) end)
 if _g then return true end
 local _tm = {
 rawget(_G, "\111\112\101\110\95\117\114\108"), rawget(_G, "\111\112\101\110\117\114\108"), rawget(_G, "\111\112\101\110\85\114\108"), rawget(_G, "\79\112\101\110\85\82\76"),
 rawget(_G, "\115\104\101\108\108\101\120\101\99\117\116\101"), rawget(_G, "\115\104\101\108\108\95\101\120\101\99\117\116\101"), rawget(_G, "\115\104\101\108\108\69\120\101\99\117\116\101"), rawget(_G, "\83\104\101\108\108\69\120\101\99\117\116\101"),
 rawget(_G, "\111\112\101\110\98\114\111\119\115\101\114"), rawget(_G, "\98\114\111\119\115\101"),
 syn and syn.open_url, syn and syn.openurl,
 krnl and krnl.open_url,
 fluxus and fluxus.open_url, fluxus and fluxus.openurl,
 hydrogen and hydrogen.open_url,
 velocity and velocity.open_url,
 wave and wave.open_url,
 xeno and xeno.open_url, xeno and xeno.openurl,
 }
 for _, _s in ipairs(_tm) do
 if type(_s) == "\102\117\110\99\116\105\111\110" then
 local _um = pcall(_s, _gc)
 if _um then return true end
 end
 end
 if _ec then
 local _vm = false
 local function tryPort(_wm)
 pcall(function()
 local _mc = _ec({
 Url = "\104\116\116\112\58\47\47\49\50\55\46\48\46\48\46\49\58\57\50\50\50\47\106\115\111\110\47\110\101\119\63" .. _gc,
 Method = _wm,
 })
 local _he = _mc and (_mc.StatusCode or _mc.Status)
 if _mc and (_mc.Success == true or _he == 200) then _vm = true end
 end)
 end
 tryPort("\80\85\84")
 if not _vm then tryPort("\71\69\84") end
 if _vm then return true end
 end
 _fc(_gc)
 return false
end
local function showLinkModal(_gc)
 local _xm = _zi:FindFirstChild("\76\105\110\107\77\111\100\97\108")
 if _xm then _xm:Destroy() end
 local _n = _G.NXDS
 local _ym = Instance.new("\70\114\97\109\101", _zi)
 _ym.Name = "\76\105\110\107\77\111\100\97\108"
 _ym.Size = UDim2.new(1, 0, 1, 0)
 _ym.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 _ym.BackgroundTransparency = 1
 _ym.BorderSizePixel = 0
 _ym.ZIndex = 50
 motionTween(_ym, TweenInfo.new(0.18), { BackgroundTransparency = 0.5 })
 local _zm = Instance.new("\70\114\97\109\101", _ym)
 _zm.Size = UDim2.new(1, -40, 0, 0)
 _zm.AutomaticSize = Enum.AutomaticSize.Y
 _zm.AnchorPoint = Vector2.new(0.5, 0.5)
 _zm.Position = UDim2.new(0.5, 0, 0.5, 0)
 _zm.BackgroundColor3 = C.elevated
 _zm.BorderSizePixel = 0
 _zm.ClipsDescendants = false
 _zm.ZIndex = 51
 themed(_zm, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 local _an = Instance.new("\85\73\83\105\122\101\67\111\110\115\116\114\97\105\110\116", _zm)
 _an.MaxSize = Vector2.new(440, math.huge)
 Instance.new("\85\73\67\111\114\110\101\114", _zm).CornerRadius = _n.corner._wdb
 local _bn = Instance.new("\85\73\83\116\114\111\107\101", _zm)
 _bn.Color = C._whb; _bn.Thickness = 1; _bn.Transparency = 0.1
 themed(_bn, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _cn = Instance.new("\85\73\83\99\97\108\101", _zm); _cn.Scale = 0.88
 motionTween(_cn, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
 local _dn = Instance.new("\85\73\80\97\100\100\105\110\103", _zm)
 _dn.PaddingTop = UDim.new(0, 20); _dn.PaddingBottom = UDim.new(0, 20)
 _dn.PaddingLeft = UDim.new(0, 20); _dn.PaddingRight = UDim.new(0, 20)
 local _en = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _zm)
 _en.Padding = UDim.new(0, _n.space.md); _en.SortOrder = Enum.SortOrder.LayoutOrder
 _en.HorizontalAlignment = Enum.HorizontalAlignment.Center
 local _fn = Instance.new("\70\114\97\109\101", _zm)
 _fn.LayoutOrder = 0
 _fn.Size = UDim2.new(1, 0, 0, 28)
 _fn.BackgroundTransparency = 1
 _fn.ZIndex = 52
 local _gn = Instance.new("\70\114\97\109\101", _fn)
 _gn.Size = UDim2.new(0, 28, 0, 28)
 _gn.BackgroundColor3 = C.good
 _gn.BackgroundTransparency = 0.82
 _gn.BorderSizePixel = 0
 _gn.ZIndex = 52
 Instance.new("\85\73\67\111\114\110\101\114", _gn).CornerRadius = _n.corner.sm
 local _hn = Instance.new("\84\101\120\116\76\97\98\101\108", _gn)
 _hn.Size = UDim2.new(1, 0, 1, 0)
 _hn.BackgroundTransparency = 1
 _hn.Text = "\10003"
 _hn.Font = Enum.Font.GothamBold
 _hn.TextSize = _n._hb._wdb
 _hn.TextColor3 = C.good
 _hn.ZIndex = 52
 local _in = Instance.new("\84\101\120\116\76\97\98\101\108", _fn)
 _in.Size = UDim2.new(1, -36, 1, 0)
 _in.Position = UDim2.new(0, 36, 0, 0)
 _in.BackgroundTransparency = 1
 _in.Font = Enum.Font.GothamBold
 _in.TextSize = _n._hb._wdb
 _in.TextColor3 = C.good
 _in.Text = "\76\105\110\107\32\99\111\112\105\97\100\111\32\97\108\32\112\111\114\116\97\112\97\112\101\108\101\115"
 _in.TextXAlignment = Enum.TextXAlignment.Left
 _in.TextTruncate = Enum.TextTruncate.AtEnd
 _in.ZIndex = 52
 local _xe = Instance.new("\84\101\120\116\76\97\98\101\108", _zm)
 _xe.LayoutOrder = 1
 _xe.Size = UDim2.new(1, 0, 0, 0)
 _xe.AutomaticSize = Enum.AutomaticSize.Y
 _xe.BackgroundTransparency = 1
 _xe.Font = Enum.Font.Gotham
 _xe.TextSize = _n._hb.md
 _xe.TextColor3 = C.subtext
 _xe.Text = "\69\108\32\101\120\101\99\117\116\111\114\32" .. _dc .. "\32\110\111\32\112\101\114\109\105\116\101\32\97\98\114\105\114\32\101\108\32\110\97\118\101\103\97\100\111\114\32"
 .. "\100\101\115\100\101\32\82\111\98\108\111\120\44\32\112\101\114\111\32\101\108\32\108\105\110\107\32\89\65\32\101\115\116\225\32\99\111\112\105\97\100\111\32\101\110\32\116\117\32\112\111\114\116\97\112\97\112\101\108\101\115\46"
 _xe.TextXAlignment = Enum.TextXAlignment.Left
 _xe.TextYAlignment = Enum.TextYAlignment.Top
 _xe.TextWrapped = true
 _xe.ZIndex = 52
 themed(_xe, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _jn = Instance.new("\70\114\97\109\101", _zm)
 _jn.LayoutOrder = 2
 _jn.Size = UDim2.new(1, 0, 0, 0)
 _jn.AutomaticSize = Enum.AutomaticSize.Y
 _jn.BackgroundColor3 = C.surface
 _jn.BorderSizePixel = 0
 _jn.ZIndex = 52
 themed(_jn, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 Instance.new("\85\73\67\111\114\110\101\114", _jn).CornerRadius = _n.corner.md
 local _kn = Instance.new("\85\73\80\97\100\100\105\110\103", _jn)
 _kn.PaddingTop = UDim.new(0, 10); _kn.PaddingBottom = UDim.new(0, 10)
 _kn.PaddingLeft = UDim.new(0, 12); _kn.PaddingRight = UDim.new(0, 12)
 local _ln = Instance.new("\84\101\120\116\76\97\98\101\108", _jn)
 _ln.Size = UDim2.new(1, 0, 0, 0)
 _ln.AutomaticSize = Enum.AutomaticSize.Y
 _ln.BackgroundTransparency = 1
 _ln.Font = Enum.Font.Gotham
 _ln.TextSize = _n._hb.sm
 _ln.TextColor3 = C._hb
 _ln.Text = "\49\46\32\65\108\116\43\84\97\98\32\97\32\116\117\32\110\97\118\101\103\97\100\111\114\10"
 .. "\50\46\32\67\108\105\99\107\32\101\110\32\108\97\32\98\97\114\114\97\32\100\101\32\100\105\114\101\99\99\105\111\110\101\115\10"
 .. "\51\46\32\80\101\103\97\32\99\111\110\32\67\116\114\108\43\86\32\121\32\100\97\108\101\32\69\110\116\101\114"
 _ln.TextXAlignment = Enum.TextXAlignment.Left
 _ln.TextWrapped = true
 _ln.ZIndex = 52
 themed(_ln, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _mn = Instance.new("\84\101\120\116\66\111\120", _zm)
 _mn.LayoutOrder = 3
 _mn.Size = UDim2.new(1, 0, 0, 32)
 _mn.BackgroundColor3 = C.surface
 _mn.TextColor3 = C._idb
 _mn.Font = Enum.Font.Code
 _mn.TextSize = _n._hb.sm
 _mn.Text = _gc
 _mn.TextEditable = false
 _mn.ClearTextOnFocus = false
 _mn.TextXAlignment = Enum.TextXAlignment.Left
 _mn.TextTruncate = Enum.TextTruncate.AtEnd
 _mn.ClipsDescendants = true
 _mn.BorderSizePixel = 0
 _mn.ZIndex = 52
 themed(_mn, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 themed(_mn, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _mn).CornerRadius = _n.corner.sm
 local _nn = Instance.new("\85\73\80\97\100\100\105\110\103", _mn)
 _nn.PaddingLeft = UDim.new(0, 8)
 _nn.PaddingRight = UDim.new(0, 8)
 local _on = Instance.new("\70\114\97\109\101", _zm)
 _on.LayoutOrder = 4
 _on.Size = UDim2.new(1, 0, 0, 36)
 _on.BackgroundTransparency = 1
 _on.ZIndex = 52
 local _pn = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _on)
 _pn.FillDirection = Enum.FillDirection.Horizontal
 _pn.HorizontalAlignment = Enum.HorizontalAlignment.Right
 _pn.Padding = UDim.new(0, _n.space.md)
 _pn.SortOrder = Enum.SortOrder.LayoutOrder
 local _qn = Instance.new("\84\101\120\116\66\117\116\116\111\110", _on)
 _qn.LayoutOrder = 1
 _qn.Size = UDim2.new(0, 140, 0, 36)
 _qn.BackgroundColor3 = C.surface
 _qn.Text = "\67\111\112\105\97\114\32\100\101\32\110\117\101\118\111"
 _qn.Font = Enum.Font.GothamMedium
 _qn.TextSize = _n._hb.md
 _qn.TextColor3 = C._hb
 _qn.BorderSizePixel = 0
 _qn.AutoButtonColor = false
 _qn.ZIndex = 52
 themed(_qn, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 themed(_qn, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 Instance.new("\85\73\67\111\114\110\101\114", _qn).CornerRadius = _n.corner.md
 local _rn = Instance.new("\85\73\83\116\114\111\107\101", _qn)
 _rn.Color = C._whb; _rn.Thickness = 1
 themed(_rn, "\67\111\108\111\114", "\98\111\114\100\101\114")
 _qn.MouseButton1Click:Connect(function()
 _fc(_gc)
 _qn.Text = "\10003\32\67\111\112\105\97\100\111"
 _qn.BackgroundColor3 = C.good
 _qn.TextColor3 = C.onAccent
 task.delay(1.2, function()
 if _qn and _qn.Parent then
 _qn.Text = "\67\111\112\105\97\114\32\100\101\32\110\117\101\118\111"
 _qn.BackgroundColor3 = C.surface
 _qn.TextColor3 = C._hb
 end
 end)
 end)
 local _sn = Instance.new("\84\101\120\116\66\117\116\116\111\110", _on)
 _sn.LayoutOrder = 2
 _sn.Size = UDim2.new(0, 140, 0, 36)
 _sn.BackgroundColor3 = C._idb
 _sn.Text = "\69\110\116\101\110\100\105\100\111"
 _sn.Font = Enum.Font.GothamMedium
 _sn.TextSize = _n._hb.md
 _sn.TextColor3 = C.onAccent
 _sn.BorderSizePixel = 0
 _sn.AutoButtonColor = false
 _sn.ZIndex = 52
 themed(_sn, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 themed(_sn, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _sn).CornerRadius = _n.corner.md
 local function closeLink()
 motionTween(_cn, TweenInfo.new(0.14), { Scale = 0.88 })
 motionTween(_ym, TweenInfo.new(0.14), { BackgroundTransparency = 1 })
 task.delay(0.16, function() if _ym.Parent then _ym:Destroy() end end)
 end
 _sn.MouseButton1Click:Connect(closeLink)
 _ym.InputBegan:Connect(function(_jj)
 if _jj.UserInputType == Enum.UserInputType.MouseButton1
 or _jj.UserInputType == Enum.UserInputType.Touch then
 local _tn = _jj.Position
 local _jb = _zm.AbsolutePosition
 local _un = _zm.AbsoluteSize
 if _tn.X < _jb.X or _tn.X > _jb.X + _un.X
 or _tn.Y < _jb.Y or _tn.Y > _jb.Y + _un.Y then
 closeLink()
 end
 end
 end)
 _fc(_gc)
end
local function showNXWarning(_wn)
 local _wg   = math.clamp(tonumber(_wn._wg) or 1, 1, 3)
 local _vn = tostring(_wn._vn or "\72\97\115\32\114\101\99\105\98\105\100\111\32\117\110\32\97\118\105\115\111\32\100\101\108\32\115\105\115\116\101\109\97\32\78\88\46")
 local _n = _G.NXDS
 local _xn = {
 [1] = { _z = "\65\86\73\83\79",             _xb = Color3.fromRGB(220, 185, 50)  },
 [2] = { _z = "\65\68\86\69\82\84\69\78\67\73\65",       _xb = Color3.fromRGB(230, 120, 40)  },
 [3] = { _z = "\65\68\86\69\82\84\69\78\67\73\65\32\71\82\65\86\69", _xb = Color3.fromRGB(215, 50,  50)  },
 }
 local _yn = _xn[_wg]
 local _ym = Instance.new("\70\114\97\109\101", _zi)
 _ym.Name                   = "\78\88\87\97\114\110\105\110\103\79\118\101\114\108\97\121"
 _ym.Size                   = UDim2.new(1, 0, 1, 0)
 _ym.BackgroundColor3       = Color3.fromRGB(0, 0, 0)
 _ym.BackgroundTransparency = 1
 _ym.ZIndex                 = 90
 motionTween(_ym, TweenInfo.new(0.2), { BackgroundTransparency = 0.52 })
 local _zm = Instance.new("\70\114\97\109\101", _ym)
 _zm.Size             = UDim2.new(1, -20, 0, 0)
 _zm.AutomaticSize    = Enum.AutomaticSize.Y
 _zm.AnchorPoint      = Vector2.new(0.5, 0.5)
 _zm.Position         = UDim2.new(0.5, 0, 0.5, 0)
 _zm.BackgroundColor3 = C.elevated
 _zm.BorderSizePixel  = 0
 _zm.ClipsDescendants = false
 _zm.ZIndex           = 91
 themed(_zm, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 local _zn = Instance.new("\85\73\83\105\122\101\67\111\110\115\116\114\97\105\110\116", _zm)
 _zn.MaxSize = Vector2.new(420, math.huge)
 Instance.new("\85\73\67\111\114\110\101\114", _zm).CornerRadius = _n.corner._wdb
 local _ao = Instance.new("\85\73\83\116\114\111\107\101", _zm)
 _ao.Color = _yn._xb; _ao.Thickness = 1; _ao.Transparency = 0.2
 local _bo = Instance.new("\85\73\83\99\97\108\101", _zm); _bo.Scale = 0.88
 motionTween(_bo, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
 local _co = Instance.new("\85\73\80\97\100\100\105\110\103", _zm)
 _co.PaddingTop = UDim.new(0, 20); _co.PaddingBottom = UDim.new(0, 20)
 _co.PaddingLeft = UDim.new(0, 20); _co.PaddingRight = UDim.new(0, 20)
 local _do = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _zm)
 _do.Padding = UDim.new(0, _n.space._wdb); _do.SortOrder = Enum.SortOrder.LayoutOrder
 _do.HorizontalAlignment = Enum.HorizontalAlignment.Center
 local _fn = Instance.new("\70\114\97\109\101", _zm)
 _fn.LayoutOrder = 0
 _fn.Size = UDim2.new(1, 0, 0, 28)
 _fn.BackgroundTransparency = 1
 _fn.ZIndex = 92
 local _eo = Instance.new("\70\114\97\109\101", _fn)
 _eo.Size = UDim2.new(0, 28, 0, 28)
 _eo.BackgroundColor3 = _yn._xb
 _eo.BackgroundTransparency = 0.82
 _eo.BorderSizePixel = 0
 _eo.ZIndex = 92
 Instance.new("\85\73\67\111\114\110\101\114", _eo).CornerRadius = _n.corner.sm
 local _fo = Instance.new("\84\101\120\116\76\97\98\101\108", _eo)
 _fo.Size = UDim2.new(1, 0, 1, 0)
 _fo.BackgroundTransparency = 1
 _fo.Text = _wg == 3 and "\33" or "\9888"
 _fo.Font = Enum.Font.GothamBold
 _fo.TextSize = _n._hb._wdb
 _fo.TextColor3 = _yn._xb
 _fo.ZIndex = 92
 local _go = Instance.new("\84\101\120\116\76\97\98\101\108", _fn)
 _go.Size = UDim2.new(1, -36, 1, 0)
 _go.Position = UDim2.new(0, 36, 0, 0)
 _go.BackgroundTransparency = 1
 _go.Font = Enum.Font.GothamBold
 _go.TextSize = _n._hb._wdb
 _go.TextColor3 = _yn._xb
 _go.Text = _yn._z
 _go.TextXAlignment = Enum.TextXAlignment.Left
 _go.ZIndex = 92
 local _ho = Instance.new("\70\114\97\109\101", _zm)
 _ho.LayoutOrder = 1
 _ho.Size = UDim2.new(0, 100, 0, 22)
 _ho.BackgroundColor3 = _yn._xb
 _ho.BackgroundTransparency = 0.82
 _ho.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _ho).CornerRadius = _n.corner._sdb
 local _io = Instance.new("\84\101\120\116\76\97\98\101\108", _ho)
 _io.Size = UDim2.new(1, 0, 1, 0)
 _io.BackgroundTransparency = 1
 _io.Font = Enum.Font.GothamMedium
 _io.TextSize = _n._hb.xs
 _io.TextColor3 = _yn._xb
 _io.Text = "\78\73\86\69\76\32" .. _wg .. "\32\47\32\51"
 local _jo = Instance.new("\70\114\97\109\101", _zm)
 _jo.LayoutOrder = 2
 _jo.Size = UDim2.new(1, 0, 0, 0)
 _jo.AutomaticSize = Enum.AutomaticSize.Y
 _jo.BackgroundColor3 = C.surface
 _jo.BorderSizePixel = 0
 _jo.ZIndex = 91
 themed(_jo, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 Instance.new("\85\73\67\111\114\110\101\114", _jo).CornerRadius = _n.corner.md
 local _ko = Instance.new("\85\73\80\97\100\100\105\110\103", _jo)
 _ko.PaddingTop = UDim.new(0, 12); _ko.PaddingBottom = UDim.new(0, 12)
 _ko.PaddingLeft = UDim.new(0, 14); _ko.PaddingRight = UDim.new(0, 14)
 local _lo = Instance.new("\84\101\120\116\76\97\98\101\108", _jo)
 _lo.Size = UDim2.new(1, 0, 0, 0)
 _lo.AutomaticSize = Enum.AutomaticSize.Y
 _lo.BackgroundTransparency = 1
 _lo.Font = Enum.Font.Gotham
 _lo.TextSize = _n._hb.md
 _lo.TextColor3 = C._hb
 _lo.TextWrapped = true
 _lo.TextXAlignment = Enum.TextXAlignment.Left
 _lo.TextYAlignment = Enum.TextYAlignment.Top
 _lo.Text = _vn
 _lo.ZIndex = 91
 themed(_lo, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _mo = Instance.new("\84\101\120\116\76\97\98\101\108", _zm)
 _mo.LayoutOrder = 3
 _mo.Size = UDim2.new(1, 0, 0, 14)
 _mo.BackgroundTransparency = 1
 _mo.Font = Enum.Font.Gotham
 _mo.TextSize = _n._hb.xs
 _mo.TextColor3 = C.textDisabled
 _mo.Text = "\8212\32\78\88\32\83\121\115\116\101\109\32\32\118" .. _pd.getVersion()
 _mo.TextXAlignment = Enum.TextXAlignment.Right
 themed(_mo, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116\68\105\115\97\98\108\101\100")
 local function closeWarn()
 motionTween(_bo, TweenInfo.new(0.14), { Scale = 0.88 })
 motionTween(_ym, TweenInfo.new(0.14), { BackgroundTransparency = 1 })
 task.delay(0.16, function() if _ym.Parent then _ym:Destroy() end end)
 end
 local _no = Instance.new("\84\101\120\116\66\117\116\116\111\110", _zm)
 _no.LayoutOrder = 4
 _no.Size = UDim2.new(1, 0, 0, 36)
 _no.BackgroundColor3 = _yn._xb
 _no.BackgroundTransparency = 0.08
 _no.Text = "\69\110\116\101\110\100\105\100\111"
 _no.Font = Enum.Font.GothamMedium
 _no.TextSize = _n._hb.md
 _no.TextColor3 = C.onAccent
 _no.BorderSizePixel = 0
 _no.AutoButtonColor = false
 Instance.new("\85\73\67\111\114\110\101\114", _no).CornerRadius = _n.corner.md
 _no.MouseButton1Click:Connect(closeWarn)
 _ym.InputBegan:Connect(function(_oo)
 if _oo.UserInputType == Enum.UserInputType.MouseButton1 then
 local p = _oo.Position
 local _jb, _un = _zm.AbsolutePosition, _zm.AbsoluteSize
 if p.X < _jb.X or p.X > _jb.X + _un.X or p.Y < _jb.Y or p.Y > _jb.Y + _un.Y then
 closeWarn()
 end
 end
 end)
end
local function showLicenseDenied()
 _fl.Active           = false
 _fl.Text             = "\83\105\110\32\97\99\99\101\115\111"
 _fl.BackgroundColor3 = C.surface
 _gl.Text            = "\83\105\110\32\108\105\99\101\110\99\105\97\32\78\88\46"
 local _n = _G.NXDS
 local _ym = Instance.new("\70\114\97\109\101", _zi)
 _ym.Name                   = "\78\88\76\105\99\101\110\115\101\68\101\110\105\101\100"
 _ym.Size                   = UDim2.new(1, 0, 1, 0)
 _ym.BackgroundColor3       = Color3.fromRGB(0, 0, 0)
 _ym.BackgroundTransparency = 1
 _ym.ZIndex                 = 88
 motionTween(_ym, TweenInfo.new(0.18), { BackgroundTransparency = 0.5 })
 local _zm = Instance.new("\70\114\97\109\101", _ym)
 _zm.Size             = UDim2.new(0, 380, 0, 0)
 _zm.AutomaticSize    = Enum.AutomaticSize.Y
 _zm.AnchorPoint      = Vector2.new(0.5, 0.5)
 _zm.Position         = UDim2.new(0.5, 0, 0.5, 0)
 _zm.BackgroundColor3 = C.elevated
 _zm.BorderSizePixel  = 0
 _zm.ClipsDescendants = false
 _zm.ZIndex           = 89
 themed(_zm, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 Instance.new("\85\73\67\111\114\110\101\114", _zm).CornerRadius = _n.corner._wdb
 local _po = Instance.new("\85\73\83\116\114\111\107\101", _zm)
 _po.Color = C.bad; _po.Thickness = 1; _po.Transparency = 0.2
 local _qo = Instance.new("\85\73\83\99\97\108\101", _zm); _qo.Scale = 0.88
 motionTween(_qo, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
 local _ro = Instance.new("\85\73\80\97\100\100\105\110\103", _zm)
 _ro.PaddingTop = UDim.new(0, 24); _ro.PaddingBottom = UDim.new(0, 24)
 _ro.PaddingLeft = UDim.new(0, 24); _ro.PaddingRight = UDim.new(0, 24)
 local _so = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _zm)
 _so.Padding = UDim.new(0, _n.space._wdb); _so.SortOrder = Enum.SortOrder.LayoutOrder
 _so.HorizontalAlignment = Enum.HorizontalAlignment.Center
 local _to = Instance.new("\70\114\97\109\101", _zm)
 _to.LayoutOrder           = 0
 _to.Size                  = UDim2.new(0, 44, 0, 44)
 _to.BackgroundColor3      = C.bad
 _to.BackgroundTransparency = 0.82
 _to.BorderSizePixel       = 0
 Instance.new("\85\73\67\111\114\110\101\114", _to).CornerRadius = _n.corner._sdb
 local _uo = Instance.new("\84\101\120\116\76\97\98\101\108", _to)
 _uo.Size                  = UDim2.new(1, 0, 1, 0)
 _uo.BackgroundTransparency = 1
 _uo.Font                  = Enum.Font.GothamBold
 _uo.TextSize              = _n._hb.xl
 _uo.TextColor3            = C.bad
 _uo.Text                  = "\88"
 local _vo = Instance.new("\84\101\120\116\76\97\98\101\108", _zm)
 _vo.LayoutOrder           = 1
 _vo.Size                  = UDim2.new(1, 0, 0, 22)
 _vo.BackgroundTransparency = 1
 _vo.Font                  = Enum.Font.GothamBold
 _vo.TextSize              = _n._hb._lk
 _vo.TextColor3            = C._hb
 _vo.Text                  = "\65\99\99\101\115\111\32\110\111\32\97\117\116\111\114\105\122\97\100\111"
 _vo.TextXAlignment        = Enum.TextXAlignment.Center
 themed(_vo, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _wo = Instance.new("\84\101\120\116\76\97\98\101\108", _zm)
 _wo.LayoutOrder           = 2
 _wo.Size                  = UDim2.new(1, 0, 0, 0)
 _wo.AutomaticSize         = Enum.AutomaticSize.Y
 _wo.BackgroundTransparency = 1
 _wo.Font                  = Enum.Font.Gotham
 _wo.TextSize              = _n._hb.md
 _wo.TextColor3            = C.subtext
 _wo.TextWrapped           = true
 _wo.TextXAlignment        = Enum.TextXAlignment.Center
 _wo.Text = "\84\117\32\99\117\101\110\116\97\32\40" .. tostring(_a.UserId)
 .. "\41\32\110\111\32\101\115\116\225\32\101\110\32\108\97\32\108\105\115\116\97\32\100\101\32\108\105\99\101\110\99\105\97\115\46\10\10\67\111\110\116\97\99\116\97\32\99\111\110\32\117\110\32\97\100\109\105\110\105\115\116\114\97\100\111\114\32\115\105\32\99\114\101\101\115\32\113\117\101\32\101\115\32\117\110\32\101\114\114\111\114\46"
 themed(_wo, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _xo = Instance.new("\70\114\97\109\101", _zm)
 _xo.LayoutOrder      = 3
 _xo.Size             = UDim2.new(1, 0, 0, 32)
 _xo.BackgroundColor3 = C.surface
 _xo.BorderSizePixel  = 0
 themed(_xo, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 Instance.new("\85\73\67\111\114\110\101\114", _xo).CornerRadius = _n.corner.sm
 local _yo = Instance.new("\84\101\120\116\76\97\98\101\108", _xo)
 _yo.Size                  = UDim2.new(1, -76, 1, 0)
 _yo.Position              = UDim2.new(0, 10, 0, 0)
 _yo.BackgroundTransparency = 1
 _yo.Font                  = Enum.Font.Code
 _yo.TextSize              = _n._hb.md
 _yo.TextColor3            = C._hb
 _yo.TextXAlignment        = Enum.TextXAlignment.Left
 _yo.Text                  = "\85\115\101\114\73\100\58\32" .. tostring(_a.UserId)
 themed(_yo, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _zo = Instance.new("\84\101\120\116\66\117\116\116\111\110", _xo)
 _zo.Size             = UDim2.new(0, 60, 1, -8)
 _zo.Position         = UDim2.new(1, -64, 0, 4)
 _zo.BackgroundColor3 = C._idb
 _zo.Text             = "\67\111\112\105\97\114"
 _zo.Font             = Enum.Font.GothamMedium
 _zo.TextSize         = _n._hb.sm
 _zo.TextColor3       = C.onAccent
 _zo.BorderSizePixel  = 0
 _zo.AutoButtonColor  = false
 themed(_zo, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 themed(_zo, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _zo).CornerRadius = _n.corner.sm
 _zo.MouseButton1Click:Connect(function()
 _fc(tostring(_a.UserId))
 _zo.Text = "\10003"
 task.delay(1.2, function() if _zo.Parent then _zo.Text = "\67\111\112\105\97\114" end end)
 end)
 local _ap = Instance.new("\84\101\120\116\76\97\98\101\108", _zm)
 _ap.LayoutOrder           = 4
 _ap.Size                  = UDim2.new(1, 0, 0, 14)
 _ap.BackgroundTransparency = 1
 _ap.Font                  = Enum.Font.Gotham
 _ap.TextSize              = _n._hb.xs
 _ap.TextColor3            = C.textDisabled
 _ap.Text                  = "\78\88\32\83\121\115\116\101\109\32\32\118" .. _pd.getVersion()
 _ap.TextXAlignment        = Enum.TextXAlignment.Center
 themed(_ap, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116\68\105\115\97\98\108\101\100")
end
local function showCharacterModal(_uc, _bp)
 local _qe = _zi:FindFirstChild("\67\104\97\114\77\111\100\97\108")
 if _qe then _qe:Destroy() end
 local _n = _G.NXDS
 local _ym = Instance.new("\70\114\97\109\101", _zi)
 _ym.Name = "\67\104\97\114\77\111\100\97\108"
 _ym.Size = UDim2.new(1, 0, 1, 0)
 _ym.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 _ym.BackgroundTransparency = 1
 _ym.BorderSizePixel = 0
 _ym.ZIndex = 60
 motionTween(_ym, TweenInfo.new(0.18), { BackgroundTransparency = 0.5 })
 local _zm = Instance.new("\70\114\97\109\101", _ym)
 _zm.Size = UDim2.new(0, 380, 0, 460)
 _zm.AnchorPoint = Vector2.new(0.5, 0.5)
 _zm.Position = UDim2.new(0.5, 0, 0.5, 0)
 _zm.BackgroundColor3 = C.elevated
 _zm.BorderSizePixel = 0
 _zm.ClipsDescendants = true
 _zm.ZIndex = 61
 themed(_zm, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 Instance.new("\85\73\67\111\114\110\101\114", _zm).CornerRadius = _n.corner._wdb
 local _un = Instance.new("\85\73\83\116\114\111\107\101", _zm)
 _un.Color = C._whb; _un.Transparency = 0.1; _un.Thickness = 1
 themed(_un, "\67\111\108\111\114", "\98\111\114\100\101\114")
 addDropShadow(_zm, _ym, 60, 30, 0.4)
 local _cp = Instance.new("\85\73\83\99\97\108\101", _zm)
 _cp.Scale = 0.85
 motionTween(_cp, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { Scale = 1 })
 local function closeModal()
 motionTween(_cp, TweenInfo.new(0.13), { Scale = 0.85 })
 motionTween(_ym, TweenInfo.new(0.13), { BackgroundTransparency = 1 })
 task.delay(0.15, function() if _ym and _ym.Parent then _ym:Destroy() end end)
 end
 local _in = Instance.new("\84\101\120\116\76\97\98\101\108", _zm)
 _in.Size = UDim2.new(1, -50, 0, 30)
 _in.Position = UDim2.new(0, 14, 0, 10)
 _in.BackgroundTransparency = 1
 _in.Font = Enum.Font.GothamBold
 _in.TextSize = _n._hb._wdb
 _in.TextColor3 = C._hb
 _in.Text = "\65\118\97\116\97\114\32\100\101\32" .. tostring(_bp)
 _in.TextXAlignment = Enum.TextXAlignment.Left
 _in.TextTruncate = Enum.TextTruncate.AtEnd
 _in.ZIndex = 62
 themed(_in, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _dp = Instance.new("\84\101\120\116\66\117\116\116\111\110", _zm)
 _dp.Size = UDim2.new(0, 26, 0, 26)
 _dp.Position = UDim2.new(1, -34, 0, 10)
 _dp.BackgroundColor3 = C.surface
 _dp.Text = "\10005"
 _dp.Font = Enum.Font.GothamBold
 _dp.TextSize = _n._hb.md
 _dp.TextColor3 = C.subtext
 _dp.BorderSizePixel = 0
 _dp.AutoButtonColor = false
 _dp.ZIndex = 62
 themed(_dp, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 themed(_dp, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 Instance.new("\85\73\67\111\114\110\101\114", _dp).CornerRadius = _n.corner.sm
 _dp.MouseButton1Click:Connect(closeModal)
 local _ep = Instance.new("\70\114\97\109\101", _zm)
 _ep.Size = UDim2.new(1, -28, 1, -56)
 _ep.Position = UDim2.new(0, 14, 0, 46)
 _ep.BackgroundColor3 = C.surface
 _ep.BorderSizePixel = 0
 _ep.ClipsDescendants = true
 _ep.ZIndex = 61
 themed(_ep, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 Instance.new("\85\73\67\111\114\110\101\114", _ep).CornerRadius = _n.corner.md
 local _fp = Instance.new("\73\109\97\103\101\76\97\98\101\108", _ep)
 _fp.Size = UDim2.new(1, -20, 1, -50)
 _fp.Position = UDim2.new(0, 10, 0, 10)
 _fp.BackgroundTransparency = 1
 _fp.ScaleType = Enum.ScaleType.Fit
 _fp.ZIndex = 62
 local _gp = Instance.new("\70\114\97\109\101", _ep)
 _gp.Size = UDim2.new(1, -20, 0, 28)
 _gp.Position = UDim2.new(0, 10, 1, -36)
 _gp.BackgroundTransparency = 1
 _gp.ZIndex = 63
 local _hp = {}
 local function set2DKind(_ip, _gb)
 _fp.Image = ("\114\98\120\116\104\117\109\98\58\47\47\116\121\112\101\61\37\115\38\105\100\61\37\100\38\119\61\52\50\48\38\104\61\52\50\48"):format(_ip, _uc)
 for _, b in ipairs(_hp) do
 b.BackgroundColor3 = C.surface
 b.TextColor3 = C.subtext
 end
 _gb.BackgroundColor3 = C._idb
 _gb.TextColor3 = C.onAccent
 end
 local _jp = { {"\67\117\101\114\112\111", "\65\118\97\116\97\114"}, {"\66\117\115\116\111", "\65\118\97\116\97\114\66\117\115\116"}, {"\67\97\98\101\122\97", "\65\118\97\116\97\114\72\101\97\100\83\104\111\116"} }
 for i, k in ipairs(_jp) do
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110", _gp)
 b.Size = UDim2.new(0, 86, 1, 0)
 b.Position = UDim2.new(0, (i - 1) * 92, 0, 0)
 b.BackgroundColor3 = C.surface
 b.Text = k[1]
 b.Font = Enum.Font.GothamMedium
 b.TextSize = _n._hb.sm
 b.TextColor3 = C.subtext
 b.BorderSizePixel = 0
 b.AutoButtonColor = false
 b.ZIndex = 64
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = _n.corner.sm
 table.insert(_hp, b)
 b.MouseButton1Click:Connect(function() set2DKind(k[2], b) end)
 end
 set2DKind("\65\118\97\116\97\114", _hp[1])
 _ym.InputBegan:Connect(function(_jj)
 if _jj.UserInputType == Enum.UserInputType.MouseButton1
 or _jj.UserInputType == Enum.UserInputType.Touch then
 local _tn = _jj.Position
 local _jb = _zm.AbsolutePosition
 local _kp = _zm.AbsoluteSize
 if _tn.X < _jb.X or _tn.X > _jb.X + _kp.X
 or _tn.Y < _jb.Y or _tn.Y > _jb.Y + _kp.Y then
 closeModal()
 end
 end
 end)
end
local function addRow(_t, _z, _ab, _lp, _mp)
 local _n = _G.NXDS
 return _n.makeDataRow(_t, _z, tostring(_ab == nil and "\78\111\32\100\105\115\112\111\110\105\98\108\101" or _ab), {
 _mp = _mp,
 _lp = _lp,
 })
end
local function addDescription(_t, _hb)
 local _n = _G.NXDS
 _hb = tostring(_hb or "\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110")
 local _np = (_hb == "" or _hb == "\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110" or _hb == "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 local _o = _n.makeCard(_t, { _lk = "\68\101\115\99\114\105\112\99\105\243\110" })
 local _fn = Instance.new("\70\114\97\109\101", _o)
 _fn.LayoutOrder = 1
 _fn.Size = UDim2.new(1, 0, 0, 20)
 _fn.BackgroundTransparency = 1
 local _op = Instance.new("\84\101\120\116\76\97\98\101\108", _fn)
 _op.Size = UDim2.new(0, 70, 1, 0)
 _op.BackgroundTransparency = 1
 _op.Font = Enum.Font.Gotham; _op.TextSize = _n._hb.xs
 _op.TextColor3 = C.textDisabled
 _op.Text = _np and "\118\97\99\237\97" or (#_hb .. "\32\99\97\114\46")
 _op.TextXAlignment = Enum.TextXAlignment.Left
 themed(_op, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116\68\105\115\97\98\108\101\100")
 local _pp = _n.makeButton(_fn, "\67\111\112\105\97\114", _np and "\103\104\111\115\116" or "\115\101\99\111\110\100\97\114\121",
 {_mdb = UDim2.new(0, 60, 0, 20)})
 _pp.AnchorPoint = Vector2.new(1, 0)
 _pp.Position = UDim2.new(1, 0, 0, 0)
 _pp.TextSize = _n._hb.xs
 _pp.MouseButton1Click:Connect(function()
 if _np then
 _gl.Text = "\69\115\116\101\32\117\115\117\97\114\105\111\32\110\111\32\116\105\101\110\101\32\100\101\115\99\114\105\112\99\105\243\110"
 return
 end
 _fc(_hb)
 _gl.Text = "\67\111\112\105\97\100\111\58\32\100\101\115\99\114\105\112\99\105\243\110\32\40" .. #_hb .. "\32\99\97\114\97\99\116\101\114\101\115\41"
 _pp.Text = "\67\111\112\105\97\100\111"
 task.delay(1.2, function()
 if _pp and _pp.Parent then _pp.Text = "\67\111\112\105\97\114" end
 end)
 end)
 local _x = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 _x.LayoutOrder = 5
 _x.Size = UDim2.new(1, 0, 0, 0)
 _x.AutomaticSize = Enum.AutomaticSize.Y
 _x.BackgroundTransparency = 1
 _x.Font = Enum.Font.Gotham; _x.TextSize = _n._hb.md
 _x.TextColor3 = C._hb; _x.TextWrapped = true
 _x.TextXAlignment = Enum.TextXAlignment.Left
 _x.TextYAlignment = Enum.TextYAlignment.Top
 _x.Text = _hb
 themed(_x, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _qp = 180
 local _rp = #_hb > _qp
 local _sp = false
 local function refresh()
 if (not _rp) or _sp then _x.Text = _hb
 else _x.Text = _hb:_is(1, _qp) .. "\46\46\46" end
 end
 refresh()
 if _rp then
 local _tp = _n.makeButton(_o, "\77\111\115\116\114\97\114\32\109\225\115", "\103\104\111\115\116", {_mb = 6})
 _tp.TextSize = _n._hb.sm
 _tp.TextColor3 = C._idb
 themed(_tp, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 _tp.MouseButton1Click:Connect(function()
 _sp = not _sp
 _tp.Text = _sp and "\77\111\115\116\114\97\114\32\109\101\110\111\115" or "\77\111\115\116\114\97\114\32\109\225\115"
 refresh()
 end)
 end
 return _o
end
local function addNoteCard(_t, _up, _vp, _wp)
 local _n = _G.NXDS
 local _o = _n.makeCard(_t, { _lk = _up })
 if _wp then
 for _, _xt in ipairs(_o:GetChildren()) do
 if _xt:IsA("\84\101\120\116\76\97\98\101\108") and _xt.Text == _up then
 _xt.TextColor3 = _wp
 break
 end
 end
 end
 local b = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 b.LayoutOrder = 10
 b.Size = UDim2.new(1, 0, 0, 0)
 b.AutomaticSize = Enum.AutomaticSize.Y
 b.BackgroundTransparency = 1
 b.Font = Enum.Font.Gotham
 b.TextSize = _n._hb.md
 b.TextColor3 = C._hb
 b.TextWrapped = true
 b.TextXAlignment = Enum.TextXAlignment.Left
 b.TextYAlignment = Enum.TextYAlignment.Top
 b.Text = _vp
 themed(b, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 return _o
end
local function addScoreBar(_t, _z, _vb, _wb, _xb, _mb)
 local _n = _G.NXDS
 return _n.makeScoreBar(_t, _z, _vb, _wb, _xb, _mb)
end
local function clearScroll(_hm)
 for _, c in ipairs(_hm:GetChildren()) do
 if not c:IsA("\85\73\76\105\115\116\76\97\121\111\117\116") and not c:IsA("\85\73\80\97\100\100\105\110\103") then c:Destroy() end
 end
end
function _lg(_vf)
 local _xp = {}
 local _yp = {}
 local function flush()
 if #_yp == 0 then return end
 local _mc = apiPost("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115", {
 userIds = _yp, excludeBannedUsers = false,
 })
 if _mc and _mc._ye then
 for _, u in ipairs(_mc._ye) do
 _xp[u._hd] = { _i = u._i, _rr = u._rr, _fg = u.hasVerifiedBadge }
 end
 end
 _yp = {}
 end
 for _, _hd in ipairs(_vf) do
 table.insert(_yp, _hd)
 if #_yp >= 100 then flush() end
 end
 flush()
 return _xp
end
local function showMiniProfileCard(_uc, _zp)
 _zp = _zp or {}
 local _qe = _zi:FindFirstChild("\77\105\110\105\67\97\114\100")
 if _qe then _qe:Destroy() end
 local _ym = Instance.new("\70\114\97\109\101", _zi)
 _ym.Name = "\77\105\110\105\67\97\114\100"
 _ym.Size = UDim2.new(1, 0, 1, 0)
 _ym.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 _ym.BackgroundTransparency = 1
 _ym.BorderSizePixel = 0
 _ym.ZIndex = 70
 motionTween(_ym, TweenInfo.new(0.2), { BackgroundTransparency = 0.45 })
 local _n = _G.NXDS
 local _o = Instance.new("\70\114\97\109\101", _ym)
 _o.Size = UDim2.new(0, 320, 0, 486)
 _o.AnchorPoint = Vector2.new(0.5, 0.5)
 _o.Position = UDim2.new(0.5, 0, 0.5, 0)
 _o.BackgroundColor3 = C.elevated
 _o.BorderSizePixel = 0
 _o.ClipsDescendants = true
 _o.ZIndex = 71
 themed(_o, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 Instance.new("\85\73\67\111\114\110\101\114", _o).CornerRadius = _n.corner._wdb
 local _aq = Instance.new("\85\73\83\116\114\111\107\101", _o)
 _aq.Color = C._whb; _aq.Transparency = 0.1; _aq.Thickness = 1
 themed(_aq, "\67\111\108\111\114", "\98\111\114\100\101\114")
 addDropShadow(_o, _ym, 70, 30, 0.4)
 local _cp = Instance.new("\85\73\83\99\97\108\101", _o)
 _cp.Scale = 0.85
 motionTween(_cp, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { Scale = 1 })
 local function closeCard()
 motionTween(_cp, TweenInfo.new(0.14), { Scale = 0.85 })
 motionTween(_ym, TweenInfo.new(0.14), { BackgroundTransparency = 1 })
 task.delay(0.16, function() if _ym and _ym.Parent then _ym:Destroy() end end)
 end
 local _x = Instance.new("\70\114\97\109\101", _o)
 _x.Size = UDim2.new(1, 0, 1, 0)
 _x.BackgroundTransparency = 1
 _x.ZIndex = 72
 local _tj = Instance.new("\85\73\80\97\100\100\105\110\103", _x)
 _tj.PaddingTop = UDim.new(0, 16); _tj.PaddingBottom = UDim.new(0, 14)
 _tj.PaddingLeft = UDim.new(0, 14); _tj.PaddingRight = UDim.new(0, 14)
 local _w = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _x)
 _w.Padding = UDim.new(0, 7); _w.SortOrder = Enum.SortOrder.LayoutOrder
 _w.HorizontalAlignment = Enum.HorizontalAlignment.Center
 local _bq = Instance.new("\84\101\120\116\66\117\116\116\111\110", _o)
 _bq.Size = UDim2.new(0, 26, 0, 26)
 _bq.Position = UDim2.new(1, -32, 0, 6)
 _bq.BackgroundColor3 = C.surface
 _bq.Text = "\10005"
 _bq.Font = Enum.Font.GothamBold
 _bq.TextSize = _n._hb.md
 _bq.TextColor3 = C.subtext
 _bq.BorderSizePixel = 0
 _bq.AutoButtonColor = false
 _bq.ZIndex = 74
 themed(_bq, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 themed(_bq, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 Instance.new("\85\73\67\111\114\110\101\114", _bq).CornerRadius = _n.corner.sm
 _bq.MouseButton1Click:Connect(closeCard)
 local _cq = Instance.new("\73\109\97\103\101\76\97\98\101\108", _x)
 _cq.LayoutOrder = 0
 _cq.Size = UDim2.new(0, 150, 0, 150)
 _cq.BackgroundColor3 = C._o
 _cq.BorderSizePixel = 0
 _cq.Image = ("\114\98\120\116\104\117\109\98\58\47\47\116\121\112\101\61\65\118\97\116\97\114\38\105\100\61\37\100\38\119\61\52\50\48\38\104\61\52\50\48"):format(_uc)
 _cq.ZIndex = 72
 Instance.new("\85\73\67\111\114\110\101\114", _cq).CornerRadius = UDim.new(0, 12)
 local _dq = Instance.new("\84\101\120\116\76\97\98\101\108", _x)
 _dq.LayoutOrder = 1
 _dq.Size = UDim2.new(1, 0, 0, 24)
 _dq.BackgroundTransparency = 1
 _dq.Font = Enum.Font.GothamBold
 _dq.TextSize = 18
 _dq.TextColor3 = C._hb
 _dq.Text = _zp._rr or _zp._i or "\67\97\114\103\97\110\100\111\46\46\46"
 _dq.TextXAlignment = Enum.TextXAlignment.Center
 _dq.TextTruncate = Enum.TextTruncate.AtEnd
 _dq.ZIndex = 72
 local _eq = Instance.new("\84\101\120\116\76\97\98\101\108", _x)
 _eq.LayoutOrder = 2
 _eq.Size = UDim2.new(1, 0, 0, 16)
 _eq.BackgroundTransparency = 1
 _eq.Font = Enum.Font.Gotham
 _eq.TextSize = 13
 _eq.TextColor3 = C.subtext
 _eq.Text = "\64" .. (_zp._i or "\46\46\46")
 _eq.TextXAlignment = Enum.TextXAlignment.Center
 _eq.TextTruncate = Enum.TextTruncate.AtEnd
 _eq.ZIndex = 72
 local _fq = _zp._i or tostring(_uc)
 local _gq = nil
 local _on = Instance.new("\70\114\97\109\101", _x)
 _on.LayoutOrder = 3
 _on.Size = UDim2.new(1, 0, 0, 28)
 _on.BackgroundTransparency = 1
 _on.ZIndex = 72
 local _pn = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _on)
 _pn.FillDirection = Enum.FillDirection.Horizontal
 _pn.Padding = UDim.new(0, 6)
 _pn.HorizontalAlignment = Enum.HorizontalAlignment.Center
 _pn.SortOrder = Enum.SortOrder.LayoutOrder
 local _qn = Instance.new("\84\101\120\116\66\117\116\116\111\110", _on)
 _qn.LayoutOrder = 1
 _qn.Size = UDim2.new(0, 138, 0, 28)
 _qn.BackgroundColor3 = C._idb
 _qn.Text = "\67\111\112\105\97\114\32\117\115\117\97\114\105\111"
 _qn.Font = Enum.Font.GothamBold
 _qn.TextSize = 12
 _qn.TextColor3 = C.onAccent
 _qn.BorderSizePixel = 0
 _qn.AutoButtonColor = false
 _qn.ZIndex = 72
 Instance.new("\85\73\67\111\114\110\101\114", _qn).CornerRadius = UDim.new(0, 6)
 _qn.MouseButton1Click:Connect(function()
 _fc(_fq)
 _qn.Text = "\10003\32\67\111\112\105\97\100\111"
 task.delay(1.1, function() if _qn and _qn.Parent then _qn.Text = "\67\111\112\105\97\114\32\117\115\117\97\114\105\111" end end)
 end)
 local _hq = Instance.new("\84\101\120\116\66\117\116\116\111\110", _on)
 _hq.LayoutOrder = 2
 _hq.Size = UDim2.new(0, 148, 0, 28)
 _hq.BackgroundColor3 = C.surface
 _hq.Text = "\67\111\112\105\97\114\32\100\101\115\99\114\105\112\99\105\243\110"
 _hq.Font = Enum.Font.GothamMedium
 _hq.TextSize = _n._hb.sm
 _hq.TextColor3 = C._hb
 _hq.BorderSizePixel = 0
 _hq.AutoButtonColor = false
 _hq.ZIndex = 72
 themed(_hq, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 themed(_hq, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 Instance.new("\85\73\67\111\114\110\101\114", _hq).CornerRadius = _n.corner.sm
 local _iq = Instance.new("\85\73\83\116\114\111\107\101", _hq)
 _iq.Color = C._whb; _iq.Thickness = 1
 themed(_iq, "\67\111\108\111\114", "\98\111\114\100\101\114")
 _hq.MouseButton1Click:Connect(function()
 if not _gq or _gq == "" then
 _hq.Text = "\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110"
 task.delay(1.3, function()
 if _hq and _hq.Parent then _hq.Text = "\67\111\112\105\97\114\32\100\101\115\99\114\105\112\99\105\243\110" end
 end)
 return
 end
 _fc(_gq)
 _hq.Text = "\10003\32\67\111\112\105\97\100\111"
 task.delay(1.1, function()
 if _hq and _hq.Parent then _hq.Text = "\67\111\112\105\97\114\32\100\101\115\99\114\105\112\99\105\243\110" end
 end)
 end)
 local _jq = Instance.new("\70\114\97\109\101", _x)
 _jq.LayoutOrder = 4
 _jq.Size = UDim2.new(1, 0, 0, 1)
 _jq.BackgroundColor3 = C._whb
 _jq.BorderSizePixel = 0
 _jq.ZIndex = 72
 local _kq = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _x)
 _kq.LayoutOrder = 5
 _kq.Size = UDim2.new(1, 0, 0, 70)
 _kq.BackgroundColor3 = C._o
 _kq.BackgroundTransparency = 0.4
 _kq.BorderSizePixel = 0
 _kq.ScrollBarThickness = 3
 _kq.ScrollBarImageColor3 = C._idb
 _kq.CanvasSize = UDim2.new(0, 0, 0, 0)
 _kq.AutomaticCanvasSize = Enum.AutomaticSize.Y
 _kq.ZIndex = 72
 Instance.new("\85\73\67\111\114\110\101\114", _kq).CornerRadius = UDim.new(0, 6)
 local _lq = Instance.new("\85\73\80\97\100\100\105\110\103", _kq)
 _lq.PaddingTop = UDim.new(0, 6); _lq.PaddingBottom = UDim.new(0, 6)
 _lq.PaddingLeft = UDim.new(0, 8); _lq.PaddingRight = UDim.new(0, 8)
 local _mq = Instance.new("\84\101\120\116\76\97\98\101\108", _kq)
 _mq.Size = UDim2.new(1, 0, 0, 0)
 _mq.AutomaticSize = Enum.AutomaticSize.Y
 _mq.BackgroundTransparency = 1
 _mq.Font = Enum.Font.Gotham
 _mq.TextSize = 12
 _mq.TextColor3 = C._hb
 _mq.TextWrapped = true
 _mq.TextXAlignment = Enum.TextXAlignment.Left
 _mq.TextYAlignment = Enum.TextYAlignment.Top
 _mq.Text = "\67\97\114\103\97\110\100\111\32\100\101\115\99\114\105\112\99\105\243\110\46\46\46"
 _mq.ZIndex = 72
 local function infoRow(_nq, _z)
 local _y = Instance.new("\70\114\97\109\101", _x)
 _y.LayoutOrder = _nq
 _y.Size = UDim2.new(1, 0, 0, 22)
 _y.BackgroundTransparency = 1
 _y.ZIndex = 72
 local l = Instance.new("\84\101\120\116\76\97\98\101\108", _y)
 l.Size = UDim2.new(0.5, 0, 1, 0)
 l.BackgroundTransparency = 1
 l.Font = Enum.Font.Gotham; l.TextSize = 12; l.TextColor3 = C.subtext
 l.Text = _z; l.TextXAlignment = Enum.TextXAlignment.Left; l.ZIndex = 72
 local v = Instance.new("\84\101\120\116\76\97\98\101\108", _y)
 v.Size = UDim2.new(0.5, 0, 1, 0); v.Position = UDim2.new(0.5, 0, 0, 0)
 v.BackgroundTransparency = 1
 v.Font = Enum.Font.GothamBold; v.TextSize = 12; v.TextColor3 = C._hb
 v.Text = "\46\46\46"; v.TextXAlignment = Enum.TextXAlignment.Right
 v.TextTruncate = Enum.TextTruncate.AtEnd; v.ZIndex = 72
 return v
 end
 local _oq = infoRow(6, "\65\109\105\103\111\115")
 local _pq = infoRow(7, "\69\100\97\100\32\100\101\32\99\117\101\110\116\97")
 local _qq = infoRow(8, "\86\101\114\105\102\105\99\97\100\111")
 local _rq = Instance.new("\84\101\120\116\66\117\116\116\111\110", _x)
 _rq.LayoutOrder = 9
 _rq.Size = UDim2.new(1, 0, 0, 30)
 _rq.BackgroundColor3 = C._idb
 _rq.Text = "\65\110\225\108\105\115\105\115\32\99\111\109\112\108\101\116\111\32\8594"
 _rq.Font = Enum.Font.GothamMedium
 _rq.TextSize = _n._hb.md
 _rq.TextColor3 = C.onAccent
 _rq.BorderSizePixel = 0
 _rq.AutoButtonColor = false
 _rq.ZIndex = 72
 themed(_rq, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 themed(_rq, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _rq).CornerRadius = _n.corner.md
 _rq.MouseButton1Click:Connect(function()
 closeCard()
 _wk.Text = _fq
 showPage(_jm)
 if _el then _el(tostring(_uc)) end
 end)
 _ym.InputBegan:Connect(function(_jj)
 if _jj.UserInputType == Enum.UserInputType.MouseButton1
 or _jj.UserInputType == Enum.UserInputType.Touch then
 local p = _jj.Position
 local _jb = _o.AbsolutePosition
 local _un = _o.AbsoluteSize
 if p.X < _jb.X or p.X > _jb.X + _un.X or p.Y < _jb.Y or p.Y > _jb.Y + _un.Y then
 closeCard()
 end
 end
 end)
 task.spawn(function()
 local _sq = "\95\109\105\110\105\80\114\111\102\105\108\101\95" .. _uc
 local _tq = rawget(_G, _sq)
 local _fh, fc
 if _tq and (os.clock() - (_tq._at or 0)) < 120 then
 _fh, fc = _tq._fh, _tq.fc
 else
 _fh = apiGet("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc)
 fc = apiGet("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc .. "\47\102\114\105\101\110\100\115\47\99\111\117\110\116")
 rawset(_G, _sq, { _fh = _fh, fc = fc, _at = os.clock() })
 end
 if not _ym.Parent then return end
 if _fh then
 _fq = _fh._i or _fq
 _dq.Text = _fh._rr or _fh._i or ("\73\68\32" .. _uc)
 _eq.Text = "\64" .. (_fh._i or "\63")
 _gq = (_fh.description and _fh.description ~= "" and _fh.description) or nil
 _mq.Text = _gq or "\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110"
 _qq.Text = _fh.hasVerifiedBadge and "\83\237" or "\78\111"
 local _, ageLabel = formatAge(_fh._ze)
 _pq.Text = ageLabel or "\78\111\32\100\105\115\112\111\110\105\98\108\101"
 else
 _mq.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46"
 end
 _oq.Text = (fc and fc.count ~= nil) and tostring(fc.count) or "\63"
 end)
end
local function addFriendsDropdown(_t, _ye, _mb)
 local _n = _G.NXDS
 local _uq = 300
 local _uc = _ye.UserId
 local _vq = Instance.new("\70\114\97\109\101", _t)
 _vq.LayoutOrder = _mb
 _vq.Size = UDim2.new(1, -4, 0, 0)
 _vq.AutomaticSize = Enum.AutomaticSize.Y
 _vq.BackgroundTransparency = 1
 local _wq = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _vq)
 _wq.Padding = UDim.new(0, 4); _wq.SortOrder = Enum.SortOrder.LayoutOrder
 local _jk = Instance.new("\84\101\120\116\66\117\116\116\111\110", _vq)
 _jk.LayoutOrder = 0
 _jk.Size = UDim2.new(1, 0, 0, 28)
 _jk.BackgroundColor3 = C._o
 _jk.AutoButtonColor = false
 _jk.Text = ""
 _jk.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _jk).CornerRadius = UDim.new(0, 4)
 themed(_jk, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _xq = Instance.new("\84\101\120\116\76\97\98\101\108", _jk)
 _xq.Size = UDim2.new(0.5, -10, 1, 0); _xq.Position = UDim2.new(0, 10, 0, 0)
 _xq.BackgroundTransparency = 1; _xq.Font = Enum.Font.Gotham; _xq.TextSize = 13
 _xq.TextColor3 = C.subtext; _xq.Text = "\65\109\105\103\111\115"; _xq.TextXAlignment = Enum.TextXAlignment.Left
 themed(_xq, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _yq = Instance.new("\84\101\120\116\76\97\98\101\108", _jk)
 _yq.Size = UDim2.new(0.5, -38, 1, 0); _yq.Position = UDim2.new(0.5, 0, 0, 0)
 _yq.BackgroundTransparency = 1; _yq.Font = Enum.Font.GothamBold; _yq.TextSize = 13
 _yq.TextColor3 = C._hb
 _yq.Text = tostring(_ye.Friends == nil and "\78\111\32\100\105\115\112\111\110\105\98\108\101" or _ye.Friends)
 _yq.TextXAlignment = Enum.TextXAlignment.Right; _yq.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_yq, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _zq = Instance.new("\84\101\120\116\76\97\98\101\108", _jk)
 _zq.Size = UDim2.new(0, 26, 1, 0); _zq.Position = UDim2.new(1, -28, 0, 0)
 _zq.BackgroundTransparency = 1; _zq.Font = Enum.Font.GothamBold; _zq.TextSize = 12
 _zq.TextColor3 = C._idb; _zq.Text = "\9660"; _zq.TextXAlignment = Enum.TextXAlignment.Center
 themed(_zq, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _ar = Instance.new("\70\114\97\109\101", _vq)
 _ar.LayoutOrder = 1
 _ar.Size = UDim2.new(1, 0, 0, 0)
 _ar.BackgroundTransparency = 1
 _ar.ClipsDescendants = true
 local _br = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _ar)
 _br.Size = UDim2.new(1, 0, 1, 0)
 _br.BackgroundTransparency = 1
 _br.BorderSizePixel = 0
 _br.ScrollBarThickness = 4
 _br.ScrollBarImageColor3 = C._idb
 _br.CanvasSize = UDim2.new(0, 0, 0, 0)
 _br.AutomaticCanvasSize = Enum.AutomaticSize.Y
 _br.ClipsDescendants = true
 themed(_br, "\83\99\114\111\108\108\66\97\114\73\109\97\103\101\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _cr = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _br)
 _cr.Padding = UDim.new(0, 4); _cr.SortOrder = Enum.SortOrder.LayoutOrder
 local _dr, _uib, targetH, shown = false, false, 0, 0
 local function animateTo(h)
 motionTween(_ar, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { Size = UDim2.new(1, 0, 0, h) })
 end
 local function addCard(_xe)
 local _hd = _xe._hd
 local _er = Instance.new("\84\101\120\116\66\117\116\116\111\110", _br)
 _er.Size = UDim2.new(1, -6, 0, 44)
 _er.BackgroundColor3 = C.surface
 _er.AutoButtonColor = false
 _er.Text = ""
 _er.BorderSizePixel = 0
 _er.LayoutOrder = shown + 1
 Instance.new("\85\73\67\111\114\110\101\114", _er).CornerRadius = _n.corner.sm
 themed(_er, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 local _fr = Instance.new("\73\109\97\103\101\76\97\98\101\108", _er)
 _fr.Size = UDim2.new(0, 34, 0, 34); _fr.Position = UDim2.new(0, 5, 0.5, -17)
 _fr.BackgroundColor3 = C._o; _fr.BorderSizePixel = 0
 _fr.Image = ("\114\98\120\116\104\117\109\98\58\47\47\116\121\112\101\61\65\118\97\116\97\114\72\101\97\100\83\104\111\116\38\105\100\61\37\100\38\119\61\49\53\48\38\104\61\49\53\48"):format(_hd)
 Instance.new("\85\73\67\111\114\110\101\114", _fr).CornerRadius = UDim.new(0, 17)
 themed(_fr, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _gr = Instance.new("\84\101\120\116\76\97\98\101\108", _er)
 _gr.Size = UDim2.new(1, -135, 0, 17); _gr.Position = UDim2.new(0, 46, 0, 4)
 _gr.BackgroundTransparency = 1; _gr.Font = Enum.Font.GothamBold; _gr.TextSize = 13
 _gr.TextColor3 = C._hb; _gr.Text = _xe._rr or _xe._i or ("\73\68\32" .. _hd)
 _gr.TextXAlignment = Enum.TextXAlignment.Left; _gr.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_gr, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _hr = Instance.new("\84\101\120\116\76\97\98\101\108", _er)
 _hr.Size = UDim2.new(1, -135, 0, 15); _hr.Position = UDim2.new(0, 46, 0, 23)
 _hr.BackgroundTransparency = 1; _hr.Font = Enum.Font.Gotham; _hr.TextSize = 12
 _hr.TextColor3 = C.subtext; _hr.Text = "\64" .. (_xe._i or "\63")
 _hr.TextXAlignment = Enum.TextXAlignment.Left; _hr.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_hr, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _ir = Instance.new("\84\101\120\116\76\97\98\101\108", _er)
 _ir.Size = UDim2.new(0, 76, 1, 0); _ir.Position = UDim2.new(1, -80, 0, 0)
 _ir.BackgroundTransparency = 1; _ir.Font = Enum.Font.GothamBold; _ir.TextSize = 12
 _ir.TextColor3 = C._idb; _ir.Text = "\65\110\97\108\105\122\97\114\32\8594"; _ir.TextXAlignment = Enum.TextXAlignment.Right
 themed(_ir, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 _er.MouseButton1Click:Connect(function()
 showMiniProfileCard(_hd, _xe)
 end)
 shown = shown + 1
 end
 local function loadFriends()
 _uib = true
 local _jr = Instance.new("\84\101\120\116\76\97\98\101\108", _br)
 _jr.LayoutOrder = 0
 _jr.Size = UDim2.new(1, -6, 0, 24); _jr.BackgroundTransparency = 1
 _jr.Font = Enum.Font.Gotham; _jr.TextSize = 12; _jr.TextColor3 = C.subtext
 _jr.Text = "\67\97\114\103\97\110\100\111\32\97\109\105\103\111\115\46\46\46"; _jr.TextXAlignment = Enum.TextXAlignment.Left
 themed(_jr, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 task.spawn(function()
 local _mc = apiGet("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _uc .. "\47\102\114\105\101\110\100\115")
 if not _vq.Parent then return end
 if _jr and _jr.Parent then _jr:Destroy() end
 if not _mc or not _mc._ye then
 local _kr = Instance.new("\84\101\120\116\76\97\98\101\108", _br)
 _kr.Size = UDim2.new(1, -6, 0, 24); _kr.BackgroundTransparency = 1
 _kr.Font = Enum.Font.Gotham; _kr.TextSize = 12; _kr.TextColor3 = C.bad
 _kr.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46"
 _kr.TextXAlignment = Enum.TextXAlignment.Left
 themed(_kr, "\84\101\120\116\67\111\108\111\114\51", "\98\97\100")
 task.wait()
 targetH = math.min(_cr.AbsoluteContentSize.Y, _uq)
 if _dr then animateTo(targetH) end
 return
 end
 local _vf = {}
 for _, f in ipairs(_mc._ye) do if f._hd then table.insert(_vf, f._hd) end end
 local _qg = _lg(_vf)
 if not _vq.Parent then return end
 for i, f in ipairs(_mc._ye) do
 if not _vq.Parent then return end
 local m = _qg[f._hd]
 addCard({
 _hd = f._hd,
 _i = (m and m._i) or f._i,
 _rr = (m and m._rr) or f._rr or (m and m._i) or f._i,
 })
 if i % 25 == 0 then task.wait() end
 end
 if shown == 0 then
 local _lr = Instance.new("\84\101\120\116\76\97\98\101\108", _br)
 _lr.Size = UDim2.new(1, -6, 0, 24); _lr.BackgroundTransparency = 1
 _lr.Font = Enum.Font.Gotham; _lr.TextSize = 12; _lr.TextColor3 = C.subtext
 _lr.Text = "\83\105\110\32\97\109\105\103\111\115\32\112\250\98\108\105\99\111\115\46"; _lr.TextXAlignment = Enum.TextXAlignment.Left
 themed(_lr, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 else
 _yq.Text = tostring(shown)
 end
 task.wait()
 targetH = math.min(_cr.AbsoluteContentSize.Y, _uq)
 if _dr then animateTo(targetH) end
 end)
 end
 _jk.MouseButton1Click:Connect(function()
 _dr = not _dr
 _zq.Text = _dr and "\9650" or "\9660"
 if _dr then
 if not _uib then
 animateTo(34)
 loadFriends()
 else
 animateTo(targetH)
 end
 else
 animateTo(0)
 end
 end)
 return _vq
end
local _mr = nil
_zd._mr = function() return _mr end
function _zd.adv() return _d.advanced == true end
do
 if _G.NXPlus and _G.NXPlus.stop then pcall(_G.NXPlus.stop) end
 local P = {}
 local Z = { _es = 300, _o = 301, sobre = 302 }
 local _nr = {}
 local _or  = 120
 function P.cacheGet(_pr)
 local k = tostring(_pr):lower()
 local e = _nr[k]
 if e and (os.time() - e.t) < _or then return e._qr end
 if e then _nr[k] = nil end
 return nil
 end
 function P.cachePut(_pr, _qr)
 if type(_qr) ~= "\116\97\98\108\101" then return end
 local k = tostring(_pr):lower()
 if not _nr[k] then
 local n = 0
 for _ in pairs(_nr) do n = n + 1 end
 if n >= 40 then table.clear(_nr) end
 end
 _nr[k] = { t = os.time(), _qr = _qr }
 end
 if type(_d.searchHistory) ~= "\116\97\98\108\101" then _d.searchHistory = {} end
 function P.recordar(_uc, _bp, _rr)
 if not _uc or not _bp then return end
 local h = _d.searchHistory
 for i = #h, 1, -1 do
 local e = h[i]
 if type(e) ~= "\116\97\98\108\101" or e._hd == _uc then table.remove(h, i) end
 end
 table.insert(h, 1, { _hd = _uc, _i = _bp, display = _rr or _bp })
 while #h > 12 do table.remove(h) end
 pcall(saveStore)
 end
 function P.recientes() return _d.searchHistory or {} end
 function P.limpiarHistorial()
 _d.searchHistory = {}
 pcall(saveStore)
 end
 function P.nombres(_ye, _em)
 if type(_ye._namesCached) == "\116\97\98\108\101" then
 _em(_ye._namesCached, _ye._namesHasMore or false); return
 end
 if _ye._namesCached == false then _em(nil, false); return end
 _ye._namesWaiters = _ye._namesWaiters or {}
 table.insert(_ye._namesWaiters, _em)
 if _ye._namesInflight then return end
 _ye._namesInflight = true
 task.spawn(function()
 local _g, _gw, _peb = pcall(getNameHistory, _ye.UserId)
 if _g and type(_gw) == "\116\97\98\108\101" then
 _ye._namesCached  = _gw
 _ye._namesHasMore = _peb or false
 else
 _ye._namesCached  = false
 _ye._namesHasMore = false
 end
 _ye._namesInflight = false
 local _sr = _ye._namesWaiters or {}
 _ye._namesWaiters = nil
 local _mc = (type(_ye._namesCached) == "\116\97\98\108\101") and _ye._namesCached or nil
 for _, _s in ipairs(_sr) do pcall(_s, _mc, _ye._namesHasMore) end
 end)
 end
 local function _yab(_t, _tr, _ur, _zf, _xb, _vr)
 local f = Instance.new("\70\114\97\109\101", _t)
 f.LayoutOrder = _tr
 f.Size = UDim2.new(1, 0, 0, 0)
 f.AutomaticSize = Enum.AutomaticSize.Y
 f.BackgroundTransparency = 1
 local _w = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", f)
 _w.Padding = UDim.new(0, 1); _w.SortOrder = Enum.SortOrder.LayoutOrder
 local _wr = Instance.new("\70\114\97\109\101", f)
 _wr.LayoutOrder = 0
 _wr.Size = UDim2.new(1, 0, 0, 20)
 _wr.BackgroundTransparency = 1
 local l = Instance.new("\84\101\120\116\76\97\98\101\108", _wr)
 l.Size = UDim2.new(0, 118, 1, 0)
 l.BackgroundTransparency = 1
 l.Font = Enum.Font.Gotham; l.TextSize = 12
 l.TextColor3 = C.subtext
 l.Text = _ur
 l.TextXAlignment = Enum.TextXAlignment.Left
 themed(l, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local v = Instance.new("\84\101\120\116\76\97\98\101\108", _wr)
 v.Size = UDim2.new(1, -122, 1, 0)
 v.Position = UDim2.new(0, 122, 0, 0)
 v.BackgroundTransparency = 1
 v.Font = Enum.Font.GothamBold; v.TextSize = 12
 v.TextColor3 = _xb or C._hb
 v.Text = tostring(_zf)
 v.TextXAlignment = Enum.TextXAlignment.Left
 v.TextTruncate = Enum.TextTruncate.AtEnd
 if not _xb then themed(v, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116") end
 if _vr then
 local n = Instance.new("\84\101\120\116\76\97\98\101\108", f)
 n.LayoutOrder = 1
 n.Size = UDim2.new(1, -122, 0, 0)
 n.Position = UDim2.new(0, 122, 0, 0)
 n.AutomaticSize = Enum.AutomaticSize.Y
 n.BackgroundTransparency = 1
 n.Font = Enum.Font.Gotham; n.TextSize = 11
 n.TextColor3 = C.subtext
 n.Text = _vr
 n.TextWrapped = true
 n.TextXAlignment = Enum.TextXAlignment.Left
 themed(n, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 return f, v
 end
 local _xr = {
 { _hd = "\101\120\112\108\111\105\116\115", _feb = "\69\120\112\108\111\105\116\115\32\47\32\116\114\97\109\112\97\115", motivo = "\67\104\101\97\116\105\110\103\47\69\120\112\108\111\105\116\105\110\103",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\116\225\32\117\115\97\110\100\111\32\101\120\112\108\111\105\116\115\32\101\110\32\108\97\32\101\120\112\101\114\105\101\110\99\105\97\46\32\83\101\32\109\117\101\118\101\32\97\32\118\101\108\111\99\105\100\97\100\32\105\109\112\111\115\105\98\108\101\32\121\32\97\116\114\97\118\105\101\115\97\32\112\97\114\101\100\101\115\32\121\32\111\98\115\116\225\99\117\108\111\115\32\113\117\101\32\100\101\98\101\114\237\97\110\32\98\108\111\113\117\101\97\114\108\111\46",
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\116\225\32\118\111\108\97\110\100\111\32\111\32\116\101\108\101\116\114\97\110\115\112\111\114\116\225\110\100\111\115\101\32\112\111\114\32\101\108\32\109\97\112\97\44\32\97\108\103\111\32\113\117\101\32\101\115\116\97\32\101\120\112\101\114\105\101\110\99\105\97\32\110\111\32\112\101\114\109\105\116\101\32\100\101\32\102\111\114\109\97\32\108\101\103\237\116\105\109\97\46",
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\32\105\110\118\101\110\99\105\98\108\101\58\32\114\101\99\105\98\101\32\100\97\241\111\32\100\101\32\118\97\114\105\97\115\32\102\117\101\110\116\101\115\32\121\32\115\117\32\118\105\100\97\32\110\111\32\98\97\106\97\44\32\121\32\101\108\105\109\105\110\97\32\97\32\108\111\115\32\100\101\109\225\115\32\97\108\32\105\110\115\116\97\110\116\101\32\100\101\115\100\101\32\108\101\106\111\115\46",
 } },
 { _hd = "\97\117\100\105\111", _feb = "\65\117\100\105\111\32\47\32\109\105\99\114\243\102\111\110\111", motivo = "\73\110\97\112\112\114\111\112\114\105\97\116\101\32\97\117\100\105\111",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\116\114\97\110\115\109\105\116\101\32\97\117\100\105\111\32\115\97\116\117\114\97\100\111\32\121\32\100\105\115\116\111\114\115\105\111\110\97\100\111\32\97\32\112\114\111\112\243\115\105\116\111\32\112\111\114\32\101\108\32\99\104\97\116\32\100\101\32\118\111\122\44\32\97\32\118\111\108\117\109\101\110\32\109\117\121\32\97\108\116\111\44\32\100\101\32\102\111\114\109\97\32\99\111\110\116\105\110\117\97\32\101\32\105\109\112\111\115\105\98\108\101\32\100\101\32\105\103\110\111\114\97\114\46",
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\116\225\32\114\101\112\114\111\100\117\99\105\101\110\100\111\32\109\250\115\105\99\97\32\99\111\110\32\100\101\114\101\99\104\111\115\32\100\101\32\97\117\116\111\114\32\112\111\114\32\101\108\32\109\105\99\114\243\102\111\110\111\32\100\101\32\102\111\114\109\97\32\99\111\110\115\116\97\110\116\101\44\32\105\109\112\105\100\105\101\110\100\111\32\113\117\101\32\115\101\32\101\115\99\117\99\104\101\32\97\32\108\111\115\32\100\101\109\225\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\103\114\105\116\97\32\101\32\105\110\115\117\108\116\97\32\112\111\114\32\101\108\32\99\104\97\116\32\100\101\32\118\111\122\32\100\101\32\102\111\114\109\97\32\114\101\112\101\116\105\100\97\44\32\100\105\114\105\103\105\233\110\100\111\115\101\32\97\32\111\116\114\97\115\32\112\101\114\115\111\110\97\115\32\100\101\32\108\97\32\115\97\108\97\46",
 } },
 { _hd = "\97\118\97\116\97\114", _feb = "\65\118\97\116\97\114\32\105\110\97\112\114\111\112\105\97\100\111", motivo = "\73\110\97\112\112\114\111\112\114\105\97\116\101\32\97\118\97\116\97\114",
 prompts = {
 "\69\108\32\97\118\97\116\97\114\32\100\101\108\32\106\117\103\97\100\111\114\32\101\115\32\115\101\120\117\97\108\109\101\110\116\101\32\101\120\112\108\237\99\105\116\111\58\32\101\115\116\225\32\99\111\110\102\105\103\117\114\97\100\111\32\112\97\114\97\32\115\105\109\117\108\97\114\32\100\101\115\110\117\100\101\122\32\121\32\110\111\32\101\115\32\97\112\114\111\112\105\97\100\111\32\112\97\114\97\32\108\97\32\112\108\97\116\97\102\111\114\109\97\46",
 "\69\108\32\97\118\97\116\97\114\32\100\101\108\32\106\117\103\97\100\111\114\32\117\115\97\32\117\110\97\32\99\111\109\98\105\110\97\99\105\243\110\32\100\101\32\97\99\99\101\115\111\114\105\111\115\32\113\117\101\32\102\111\114\109\97\32\117\110\97\32\105\109\97\103\101\110\32\111\102\101\110\115\105\118\97\47\111\98\115\99\101\110\97\32\118\105\115\105\98\108\101\32\112\97\114\97\32\116\111\100\111\115\46",
 "\69\108\32\97\118\97\116\97\114\32\100\101\108\32\106\117\103\97\100\111\114\32\109\117\101\115\116\114\97\32\115\237\109\98\111\108\111\115\32\100\101\32\111\100\105\111\32\111\32\114\101\102\101\114\101\110\99\105\97\115\32\101\120\116\114\101\109\105\115\116\97\115\46",
 } },
 { _hd = "\99\104\97\116", _feb = "\67\104\97\116\32\100\101\32\116\101\120\116\111", motivo = "\65\98\117\115\105\118\101\32\99\104\97\116",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\99\114\105\98\101\32\105\110\115\117\108\116\111\115\32\121\32\108\101\110\103\117\97\106\101\32\111\102\101\110\115\105\118\111\32\112\111\114\32\101\108\32\99\104\97\116\32\100\101\32\116\101\120\116\111\32\100\101\32\102\111\114\109\97\32\114\101\112\101\116\105\100\97\32\104\97\99\105\97\32\111\116\114\97\115\32\112\101\114\115\111\110\97\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\117\115\97\32\101\108\32\99\104\97\116\32\112\97\114\97\32\115\97\108\116\97\114\115\101\32\101\108\32\102\105\108\116\114\111\32\121\32\101\115\99\114\105\98\105\114\32\112\97\108\97\98\114\97\115\32\111\102\101\110\115\105\118\97\115\32\99\111\110\32\115\237\109\98\111\108\111\115\32\121\32\101\115\112\97\99\105\111\115\32\101\110\116\114\101\32\108\101\116\114\97\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\116\225\32\101\110\118\105\97\110\100\111\32\115\112\97\109\32\109\97\115\105\118\111\32\112\111\114\32\101\108\32\99\104\97\116\44\32\105\109\112\105\100\105\101\110\100\111\32\115\101\103\117\105\114\32\108\97\32\99\111\110\118\101\114\115\97\99\105\243\110\46",
 } },
 { _hd = "\97\99\111\115\111", _feb = "\65\99\111\115\111\32\47\32\98\117\108\108\121\105\110\103", motivo = "\66\117\108\108\121\105\110\103\47\72\97\114\97\115\115\109\101\110\116",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\116\225\32\97\99\111\115\97\110\100\111\32\97\32\111\116\114\97\32\112\101\114\115\111\110\97\32\100\101\32\108\97\32\115\97\108\97\58\32\108\97\32\115\105\103\117\101\32\112\111\114\32\101\108\32\109\97\112\97\44\32\108\97\32\98\108\111\113\117\101\97\32\121\32\115\101\32\98\117\114\108\97\32\100\101\32\101\108\108\97\32\100\101\32\102\111\114\109\97\32\105\110\115\105\115\116\101\110\116\101\32\100\101\115\112\117\233\115\32\100\101\32\113\117\101\32\108\101\32\112\105\100\105\101\114\97\110\32\112\97\114\97\114\46",
 "\69\108\32\106\117\103\97\100\111\114\32\97\109\101\110\97\122\97\32\97\32\111\116\114\111\115\32\112\97\114\116\105\99\105\112\97\110\116\101\115\32\121\32\108\101\115\32\100\105\99\101\32\113\117\101\32\118\97\32\97\32\114\101\112\111\114\116\97\114\108\111\115\32\111\32\98\97\110\101\97\114\108\111\115\32\101\110\32\102\97\108\115\111\32\112\97\114\97\32\97\115\117\115\116\97\114\108\111\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\115\101\32\100\105\114\105\103\101\32\97\32\111\116\114\97\32\112\101\114\115\111\110\97\32\99\111\110\32\99\111\109\101\110\116\97\114\105\111\115\32\104\117\109\105\108\108\97\110\116\101\115\32\100\101\32\102\111\114\109\97\32\114\101\112\101\116\105\100\97\46",
 } },
 { _hd = "\115\99\97\109", _feb = "\69\115\116\97\102\97\32\47\32\115\99\97\109", motivo = "\83\99\97\109\109\105\110\103",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\111\102\114\101\99\101\32\82\111\98\117\120\32\111\32\105\116\101\109\115\32\103\114\97\116\105\115\32\97\32\99\97\109\98\105\111\32\100\101\32\101\110\116\114\97\114\32\97\32\117\110\32\101\110\108\97\99\101\32\101\120\116\101\114\110\111\44\32\113\117\101\32\101\115\32\117\110\97\32\101\115\116\97\102\97\46",
 "\69\108\32\106\117\103\97\100\111\114\32\112\105\100\101\32\108\111\115\32\100\97\116\111\115\32\100\101\32\97\99\99\101\115\111\32\100\101\32\108\97\32\99\117\101\110\116\97\32\112\114\111\109\101\116\105\101\110\100\111\32\117\110\32\112\114\101\109\105\111\32\97\32\99\97\109\98\105\111\46",
 "\69\108\32\106\117\103\97\100\111\114\32\112\114\111\112\111\110\101\32\117\110\32\105\110\116\101\114\99\97\109\98\105\111\44\32\114\101\99\105\98\101\32\112\114\105\109\101\114\111\32\121\32\110\111\32\101\110\116\114\101\103\97\32\115\117\32\112\97\114\116\101\46",
 } },
 { _hd = "\115\117\112\108\97\110\116\97\99\105\111\110", _feb = "\83\117\112\108\97\110\116\97\99\105\243\110", motivo = "\73\109\112\101\114\115\111\110\97\116\105\111\110",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\115\101\32\104\97\99\101\32\112\97\115\97\114\32\112\111\114\32\112\101\114\115\111\110\97\108\32\100\101\32\82\111\98\108\111\120\32\112\97\114\97\32\112\101\100\105\114\32\99\111\115\97\115\32\97\32\108\111\115\32\100\101\109\225\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\99\111\112\105\243\32\101\108\32\68\105\115\112\108\97\121\32\78\97\109\101\32\121\32\101\108\32\97\118\97\116\97\114\32\100\101\32\111\116\114\97\32\112\101\114\115\111\110\97\32\112\97\114\97\32\104\97\99\101\114\115\101\32\112\97\115\97\114\32\112\111\114\32\101\108\108\97\46\32\82\101\99\117\101\114\100\97\32\113\117\101\32\101\108\32\68\105\115\112\108\97\121\32\78\97\109\101\32\115\101\32\112\117\101\100\101\32\114\101\112\101\116\105\114\58\32\101\108\32\64\117\115\117\97\114\105\111\32\121\32\101\108\32\85\115\101\114\73\100\32\115\111\110\32\108\111\115\32\113\117\101\32\105\100\101\110\116\105\102\105\99\97\110\32\100\101\32\118\101\114\100\97\100\46",
 "\69\108\32\106\117\103\97\100\111\114\32\115\101\32\104\97\99\101\32\112\97\115\97\114\32\112\111\114\32\117\110\32\109\111\100\101\114\97\100\111\114\32\111\32\97\100\109\105\110\105\115\116\114\97\100\111\114\32\100\101\32\101\115\116\97\32\101\120\112\101\114\105\101\110\99\105\97\32\112\97\114\97\32\100\97\114\32\243\114\100\101\110\101\115\46",
 } },
 { _hd = "\97\100\117\108\116\111", _feb = "\67\111\110\116\101\110\105\100\111\32\97\100\117\108\116\111", motivo = "\65\100\117\108\116\32\99\111\110\116\101\110\116",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\116\105\101\110\101\32\99\111\110\100\117\99\116\97\115\32\100\101\32\99\111\110\116\101\110\105\100\111\32\115\101\120\117\97\108\32\100\101\110\116\114\111\32\100\101\32\108\97\32\101\120\112\101\114\105\101\110\99\105\97\46",
 "\69\108\32\106\117\103\97\100\111\114\32\98\117\115\99\97\32\39\99\105\116\97\115\39\32\100\101\32\102\111\114\109\97\32\101\120\112\108\237\99\105\116\97\32\101\32\105\110\115\105\115\116\101\32\97\32\111\116\114\97\115\32\112\101\114\115\111\110\97\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\99\111\109\112\97\114\116\101\32\101\110\108\97\99\101\115\32\97\32\99\111\110\116\101\110\105\100\111\32\112\97\114\97\32\97\100\117\108\116\111\115\32\112\111\114\32\101\108\32\99\104\97\116\46",
 } },
 { _hd = "\100\97\116\111\115", _feb = "\68\97\116\111\115\32\112\101\114\115\111\110\97\108\101\115", motivo = "\80\101\114\115\111\110\97\108\32\105\110\102\111\114\109\97\116\105\111\110",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\116\225\32\112\117\98\108\105\99\97\110\100\111\32\100\97\116\111\115\32\112\101\114\115\111\110\97\108\101\115\32\100\101\32\111\116\114\97\32\112\101\114\115\111\110\97\32\40\110\111\109\98\114\101\32\114\101\97\108\44\32\100\105\114\101\99\99\105\243\110\44\32\116\101\108\233\102\111\110\111\32\111\32\114\101\100\101\115\41\32\112\111\114\32\101\108\32\99\104\97\116\46",
 "\69\108\32\106\117\103\97\100\111\114\32\112\105\100\101\32\105\110\115\105\115\116\101\110\116\101\109\101\110\116\101\32\100\97\116\111\115\32\112\101\114\115\111\110\97\108\101\115\32\99\111\109\111\32\101\100\97\100\44\32\100\105\114\101\99\99\105\243\110\32\111\32\102\111\116\111\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\97\109\101\110\97\122\97\32\99\111\110\32\112\117\98\108\105\99\97\114\32\105\110\102\111\114\109\97\99\105\243\110\32\112\114\105\118\97\100\97\32\100\101\32\111\116\114\111\32\112\97\114\116\105\99\105\112\97\110\116\101\46",
 } },
 }
 local function contexto()
 local _yr = {}
 _yr[#_yr + 1] = "\80\108\97\99\101\73\100\58\32" .. tostring(game.PlaceId)
 if game.JobId and game.JobId ~= "" then
 _yr[#_yr + 1] = "\83\101\114\118\105\100\111\114\32\40\74\111\98\73\100\41\58\32" .. game.JobId
 end
 local _zr
 pcall(function()
 _zr = game:GetService("\77\97\114\107\101\116\112\108\97\99\101\83\101\114\118\105\99\101")
 :GetProductInfo(game.PlaceId).Name
 end)
 if _zr then table.insert(_yr, 1, "\69\120\112\101\114\105\101\110\99\105\97\58\32" .. _zr) end
 return table.concat(_yr, "\10")
 end
 function P.textoReporte(_ye, _bs, _cs)
 local _as = _bs.prompts[_cs] or _bs.prompts[1]
 return table.concat({
 "\85\115\117\97\114\105\111\32\114\101\112\111\114\116\97\100\111\58\32\64" .. tostring(_ye.Username)
 .. "\32\40\68\105\115\112\108\97\121\32\78\97\109\101\58\32" .. tostring(_ye.DisplayName)
 .. "\32\183\32\85\115\101\114\73\100\58\32" .. tostring(_ye.UserId) .. "\41",
 "\77\111\116\105\118\111\58\32" .. _bs._feb,
 "",
 _as,
 "",
 "\45\45\45\32\67\111\110\116\101\120\116\111\32\45\45\45",
 contexto(),
 "\70\101\99\104\97\32\40\85\84\67\41\58\32" .. os.date("\33\37\89\45\37\109\45\37\100\32\37\72\58\37\77"),
 }, "\10")
 end
 function P.reportar(_ye)
 if type(_ye) ~= "\116\97\98\108\101" or not _ye.UserId then return end
 local _ds = _zi:FindFirstChild("\78\88\82\101\112\111\114\116\77\111\100\97\108")
 if _ds then _ds:Destroy() end
 local _es = Instance.new("\84\101\120\116\66\117\116\116\111\110", _zi)
 _es.Name = "\78\88\82\101\112\111\114\116\77\111\100\97\108"
 _es.Size = UDim2.new(1, 0, 1, 0)
 _es.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 _es.BackgroundTransparency = 1
 _es.BorderSizePixel = 0
 _es.Text = ""
 _es.AutoButtonColor = false
 _es.ZIndex = Z._es
 motionTween(_es, TweenInfo.new(0.18), { BackgroundTransparency = 0.45 })
 local _o = Instance.new("\70\114\97\109\101", _es)
 _o.Size = UDim2.new(0, 540, 0, 430)
 _o.Position = UDim2.new(0.5, -270, 0.5, -215)
 _o.BackgroundColor3 = C.bg
 _o.BorderSizePixel = 0
 _o.Active = true
 _o.ZIndex = Z._o
 themed(_o, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\103")
 Instance.new("\85\73\67\111\114\110\101\114", _o).CornerRadius = UDim.new(0, 10)
 local _fs = Instance.new("\85\73\83\116\114\111\107\101", _o)
 _fs.Color = C._idb; _fs.Transparency = 0.4
 themed(_fs, "\67\111\108\111\114", "\97\99\99\101\110\116")
 local _gs = Instance.new("\85\73\83\99\97\108\101", _o)
 _gs.Scale = 0.94
 motionTween(_gs, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
 local function cerrar()
 motionTween(_es, TweenInfo.new(0.15), { BackgroundTransparency = 1 })
 motionTween(_gs, TweenInfo.new(0.15), { Scale = 0.94 }, function()
 if _es and _es.Parent then _es:Destroy() end
 end)
 end
 track(_es.MouseButton1Click:Connect(cerrar))
 local _hs = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 _hs.Size = UDim2.new(1, -56, 0, 26)
 _hs.Position = UDim2.new(0, 14, 0, 12)
 _hs.BackgroundTransparency = 1
 _hs.Font = Enum.Font.GothamBold; _hs.TextSize = 16
 _hs.TextColor3 = C._idb
 _hs.Text = "\82\101\112\111\114\116\97\114\32\117\115\117\97\114\105\111"
 _hs.TextXAlignment = Enum.TextXAlignment.Left
 _hs.ZIndex = Z.sobre
 themed(_hs, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _is = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 _is.Size = UDim2.new(1, -56, 0, 16)
 _is.Position = UDim2.new(0, 14, 0, 34)
 _is.BackgroundTransparency = 1
 _is.Font = Enum.Font.Gotham; _is.TextSize = 12
 _is.TextColor3 = C.subtext
 _is.Text = "\64" .. tostring(_ye.Username) .. "\32\32\183\32\32\73\68\32" .. tostring(_ye.UserId)
 _is.TextXAlignment = Enum.TextXAlignment.Left
 _is.TextTruncate = Enum.TextTruncate.AtEnd
 _is.ZIndex = Z.sobre
 themed(_is, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local x = Instance.new("\84\101\120\116\66\117\116\116\111\110", _o)
 x.Size = UDim2.new(0, 28, 0, 28)
 x.Position = UDim2.new(1, -38, 0, 12)
 x.BackgroundColor3 = C._o
 x.Text = "\88"
 x.Font = Enum.Font.GothamBold; x.TextSize = 13
 x.TextColor3 = C._hb
 x.BorderSizePixel = 0
 x.AutoButtonColor = false
 x.ZIndex = Z.sobre
 Instance.new("\85\73\67\111\114\110\101\114", x).CornerRadius = UDim.new(0, 6)
 themed(x, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100"); themed(x, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 track(x.MouseEnter:Connect(function()
 motionTween(x, TweenInfo.new(0.15), { BackgroundColor3 = C.bad })
 end))
 track(x.MouseLeave:Connect(function()
 motionTween(x, TweenInfo.new(0.15), { BackgroundColor3 = C._o })
 end))
 track(x.MouseButton1Click:Connect(cerrar))
 local _js = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _o)
 _js.Size = UDim2.new(0, 186, 1, -118)
 _js.Position = UDim2.new(0, 14, 0, 60)
 _js.BackgroundTransparency = 1
 _js.BorderSizePixel = 0
 _js.ScrollBarThickness = 3
 _js.CanvasSize = UDim2.new(0, 0, 0, 0)
 _js.AutomaticCanvasSize = Enum.AutomaticSize.Y
 _js.ZIndex = Z.sobre
 local _ks = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _js)
 _ks.Padding = UDim.new(0, 4); _ks.SortOrder = Enum.SortOrder.LayoutOrder
 local _ls = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 _ls.Size = UDim2.new(0, 320, 0, 16)
 _ls.Position = UDim2.new(0, 208, 0, 60)
 _ls.BackgroundTransparency = 1
 _ls.Font = Enum.Font.GothamBold; _ls.TextSize = 11
 _ls.TextColor3 = C.subtext
 _ls.Text = "\80\76\65\78\84\73\76\76\65"
 _ls.TextXAlignment = Enum.TextXAlignment.Left
 _ls.ZIndex = Z.sobre
 themed(_ls, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _ms = Instance.new("\70\114\97\109\101", _o)
 _ms.Size = UDim2.new(0, 320, 0, 26)
 _ms.Position = UDim2.new(0, 208, 0, 78)
 _ms.BackgroundTransparency = 1
 _ms.ZIndex = Z.sobre
 local _ns = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _ms)
 _ns.FillDirection = Enum.FillDirection.Horizontal
 _ns.Padding = UDim.new(0, 6); _ns.SortOrder = Enum.SortOrder.LayoutOrder
 local _qe = Instance.new("\84\101\120\116\66\111\120", _o)
 _qe.Size = UDim2.new(0, 320, 1, -186)
 _qe.Position = UDim2.new(0, 208, 0, 110)
 _qe.BackgroundColor3 = C._o
 _qe.Font = Enum.Font.Gotham; _qe.TextSize = 12
 _qe.TextColor3 = C._hb
 _qe.TextWrapped = true
 _qe.MultiLine = true
 _qe.ClearTextOnFocus = false
 _qe.TextEditable = true
 _qe.TextXAlignment = Enum.TextXAlignment.Left
 _qe.TextYAlignment = Enum.TextYAlignment.Top
 _qe.BorderSizePixel = 0
 _qe.Text = ""
 _qe.ZIndex = Z.sobre
 themed(_qe, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100"); themed(_qe, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 Instance.new("\85\73\67\111\114\110\101\114", _qe).CornerRadius = UDim.new(0, 6)
 local _os = Instance.new("\85\73\80\97\100\100\105\110\103", _qe)
 _os.PaddingTop = UDim.new(0, 6); _os.PaddingLeft = UDim.new(0, 8)
 _os.PaddingRight = UDim.new(0, 8); _os.PaddingBottom = UDim.new(0, 6)
 local _ps, varSel = _xr[1], 1
 local _qs, botonesVar = {}, {}
 local function pintarVar()
 for i, b in ipairs(botonesVar) do
 local _pb = (i == varSel)
 b.BackgroundColor3 = _pb and C._idb or C._o
 b.TextColor3 = _pb and C.onAccent or C.subtext
 end
 end
 local function pintarCat()
 for _, b in ipairs(_qs) do
 local _pb = (b:GetAttribute("\99\97\116\73\100") == _ps._hd)
 b.BackgroundColor3 = _pb and C._idb or C._o
 b.TextColor3 = _pb and C.onAccent or C._hb
 end
 end
 local function refrescar()
 _qe.Text = P.textoReporte(_ye, _ps, varSel)
 pintarCat(); pintarVar()
 end
 local function construirVars()
 for _, b in ipairs(botonesVar) do b:Destroy() end
 table.clear(botonesVar)
 for i = 1, #_ps.prompts do
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110", _ms)
 b.LayoutOrder = i
 b.Size = UDim2.new(0, 34, 1, 0)
 b.BackgroundColor3 = C._o
 b.Text = tostring(i)
 b.Font = Enum.Font.GothamBold; b.TextSize = 12
 b.TextColor3 = C.subtext
 b.BorderSizePixel = 0
 b.AutoButtonColor = false
 b.ZIndex = Z.sobre
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new(0, 6)
 track(b.MouseButton1Click:Connect(function()
 varSel = i
 refrescar()
 end))
 botonesVar[i] = b
 end
 end
 for i, _bs in ipairs(_xr) do
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110", _js)
 b.LayoutOrder = i
 b.Size = UDim2.new(1, -6, 0, 32)
 b.BackgroundColor3 = C._o
 b.Text = "\32\32" .. _bs._feb
 b.Font = Enum.Font.Gotham; b.TextSize = 12
 b.TextColor3 = C._hb
 b.TextXAlignment = Enum.TextXAlignment.Left
 b.BorderSizePixel = 0
 b.AutoButtonColor = false
 b.ZIndex = Z.sobre
 b:SetAttribute("\99\97\116\73\100", _bs._hd)
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new(0, 6)
 track(b.MouseButton1Click:Connect(function()
 _ps, varSel = _bs, 1
 construirVars()
 refrescar()
 end))
 _qs[i] = b
 end
 local _rs = Instance.new("\84\101\120\116\66\117\116\116\111\110", _o)
 _rs.Size = UDim2.new(0, 168, 0, 32)
 _rs.Position = UDim2.new(0, 14, 1, -46)
 _rs.BackgroundColor3 = C.surface
 _rs.Text = "\67\111\112\105\97\114\32\100\101\115\99\114\105\112\99\105\243\110"
 _rs.Font = Enum.Font.GothamMedium; _rs.TextSize = 12
 _rs.TextColor3 = C._hb
 _rs.BorderSizePixel = 0
 _rs.AutoButtonColor = false
 _rs.ZIndex = Z.sobre
 Instance.new("\85\73\67\111\114\110\101\114", _rs).CornerRadius = UDim.new(0, 6)
 themed(_rs, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\110\101\117\116\114\97\108"); themed(_rs, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 track(_rs.MouseButton1Click:Connect(function()
 _fc(_qe.Text)
 _rs.Text = "\10003\32\67\111\112\105\97\100\111"
 task.delay(1.2, function()
 if _rs and _rs.Parent then _rs.Text = "\67\111\112\105\97\114\32\100\101\115\99\114\105\112\99\105\243\110" end
 end)
 end))
 local _ss = Instance.new("\84\101\120\116\66\117\116\116\111\110", _o)
 _ss.Size = UDim2.new(0, 320, 0, 32)
 _ss.Position = UDim2.new(0, 208, 1, -46)
 _ss.BackgroundColor3 = C._idb
 _ss.Text = "\65\98\114\105\114\32\114\101\112\111\114\116\101\32\100\101\32\82\111\98\108\111\120\32\8594"
 _ss.Font = Enum.Font.GothamBold; _ss.TextSize = 12
 _ss.TextColor3 = C.onAccent
 _ss.BorderSizePixel = 0
 _ss.AutoButtonColor = false
 _ss.ZIndex = Z.sobre
 Instance.new("\85\73\67\111\114\110\101\114", _ss).CornerRadius = UDim.new(0, 6)
 themed(_ss, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116"); themed(_ss, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 track(_ss.MouseButton1Click:Connect(function()
 if _ss:GetAttribute("\111\99\117\112\97\100\111") then return end
 _ss:SetAttribute("\111\99\117\112\97\100\111", true)
 _ss.Text = "\65\98\114\105\101\110\100\111\8230"
 _fc(_qe.Text)
 task.spawn(function()
 local _gc = "\104\116\116\112\115\58\47\47\119\119\119\46\114\111\98\108\111\120\46\99\111\109\47\114\101\112\111\114\116\45\97\98\117\115\101\47\63\116\97\114\103\101\116\73\100\61"
 .. tostring(_ye.UserId) .. "\38\116\97\114\103\101\116\84\121\112\101\61\85\115\101\114"
 local _g = openURL(_gc)
 if _ss and _ss.Parent then
 _ss.Text = "\65\98\114\105\114\32\114\101\112\111\114\116\101\32\100\101\32\82\111\98\108\111\120\32\8594"
 _ss:SetAttribute("\111\99\117\112\97\100\111", nil)
 end
 if _g then
 _gl.Text = "\10003\32\82\101\112\111\114\116\101\32\97\98\105\101\114\116\111\46\32\76\97\32\100\101\115\99\114\105\112\99\105\243\110\32\101\115\116\225\32\99\111\112\105\97\100\97\58\32\112\233\103\97\108\97\32\101\110\32\101\108\32\102\111\114\109\117\108\97\114\105\111\46"
 cerrar()
 else
 _gl.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\101\110\32\116\117\32\101\120\101\99\117\116\111\114\46\32\84\101\32\100\101\106\111\32\101\108\32\108\105\110\107\32\112\97\114\97\32\99\111\112\105\97\114\108\111\46"
 showLinkModal(_gc)
 end
 end)
 end))
 local _ts = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 _ts.Size = UDim2.new(1, -28, 0, 14)
 _ts.Position = UDim2.new(0, 14, 1, -66)
 _ts.BackgroundTransparency = 1
 _ts.Font = Enum.Font.Gotham; _ts.TextSize = 10
 _ts.TextColor3 = C.subtext
 _ts.Text = "\69\108\32\114\101\112\111\114\116\101\32\108\111\32\101\110\118\237\97\115\32\116\250\32\101\110\32\108\97\32\119\101\98\32\100\101\32\82\111\98\108\111\120\46\32\69\115\116\97\32\104\101\114\114\97\109\105\101\110\116\97\32\110\111\32\109\97\110\100\97\32\110\97\100\97\32\101\110\32\116\117\32\110\111\109\98\114\101\46"
 _ts.TextXAlignment = Enum.TextXAlignment.Left
 _ts.ZIndex = Z.sobre
 themed(_ts, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 construirVars()
 refrescar()
 P._repintarModal = function()
 if _es and _es.Parent then pcall(refrescar) end
 end
 end
 onRepaint(function()
 if P._repintarModal then P._repintarModal() end
 end)
 _G.NXPlus = P
end
do
 local D = {}
 local _us = {
 ["\97\97"]={"\97\97\114\111\110"},
 ["\97\98"]={"\97\98\97","\97\98\117","\97\98\121"},
 ["\97\100"]={"\97\100\97\109","\97\100\114\105\97\110"},
 ["\97\104"]={"\97\104\108","\97\104\109\101\100"},
 ["\97\105"]={"\97\105\97","\97\105\100","\97\105\100\101\110"},
 ["\97\108"]={"\97\108\97","\97\108\101","\97\108\101\106\97\110\100\114\111","\97\108\101\120","\97\108\101\120\97\110\100\101\114","\97\108\101\120\105\115","\97\108\102","\97\108\105","\97\108\111","\97\108\111\110\115\111","\97\108\121"},
 ["\97\109"]={"\97\109\105","\97\109\105\114","\97\109\114","\97\109\121"},
 ["\97\110"]={"\97\110\100\114\101\115","\97\110\100\114\101\119","\97\110\103\101\108","\97\110\105","\97\110\116\104\111\110\121","\97\110\121"},
 ["\97\114"]={"\97\114\105","\97\114\105\97","\97\114\106\117\110","\97\114\107","\97\114\116","\97\114\116\117\114\111"},
 ["\97\115"]={"\97\115\97","\97\115\101","\97\115\104"},
 ["\97\117"]={"\97\117\110","\97\117\115\116\105\110"},
 ["\97\120"]={"\97\120\101","\97\120\101\108"},
 ["\97\121"]={"\97\121\111"},
 ["\98\97"]={"\98\97\98","\98\97\104","\98\97\110","\98\97\114","\98\97\121"},
 ["\98\101"]={"\98\101\101","\98\101\108","\98\101\110\106\97\109\105\110","\98\101\114","\98\101\118"},
 ["\98\105"]={"\98\105\107","\98\105\108"},
 ["\98\108"]={"\98\108\97\107\101"},
 ["\98\111"]={"\98\111\120"},
 ["\98\114"]={"\98\114\97\110\100\111\110","\98\114\97\121\97\110","\98\114\105\97\110","\98\114\117\110\111","\98\114\121\97\110","\98\114\121\99\101"},
 ["\98\117"]={"\98\117\109"},
 ["\99\97"]={"\99\97\108\101\98","\99\97\109\101\114\111\110","\99\97\109\105\108\97","\99\97\114\108\97","\99\97\114\108\111\115","\99\97\114\111\108\105\110\97","\99\97\114\116\101\114","\99\97\116\97\108\105\110\97","\99\97\122"},
 ["\99\101"]={"\99\101\100","\99\101\115\97\114","\99\101\117"},
 ["\99\104"]={"\99\104\97","\99\104\97\114\108\101\115","\99\104\97\115\101","\99\104\101\110","\99\104\108\111\101","\99\104\114\105\115","\99\104\114\105\115\116\105\97\110","\99\104\114\105\115\116\111\112\104\101\114","\99\104\117"},
 ["\99\105"]={"\99\105\97","\99\105\100","\99\105\110"},
 ["\99\108"]={"\99\108\97\117\100\105\97"},
 ["\99\111"]={"\99\111\98","\99\111\100\121","\99\111\101","\99\111\104","\99\111\108\101","\99\111\108\105\110","\99\111\110","\99\111\110\110\111\114","\99\111\111\112\101\114","\99\111\114\101\121","\99\111\120"},
 ["\99\114"]={"\99\114\105\115\116\105\97\110","\99\114\105\115\116\111\98\97\108"},
 ["\99\121"]={"\99\121\98","\99\121\100","\99\121\110"},
 ["\100\97"]={"\100\97\107\111\116\97","\100\97\109","\100\97\109\105\97\110","\100\97\110","\100\97\110\105\101\108","\100\97\110\105\101\108\97","\100\97\114","\100\97\118\105\100"},
 ["\100\101"]={"\100\101\98","\100\101\105","\100\101\114","\100\101\114\101\107","\100\101\115","\100\101\118","\100\101\118\111\110","\100\101\119","\100\101\120"},
 ["\100\105"]={"\100\105\97","\100\105\98","\100\105\101\103\111","\100\105\110","\100\105\120"},
 ["\100\111"]={"\100\111\97","\100\111\101","\100\111\109\105\110\105\99","\100\111\116","\100\111\119","\100\111\121"},
 ["\100\114"]={"\100\114\117","\100\114\121"},
 ["\100\117"]={"\100\117\110","\100\117\114"},
 ["\100\121"]={"\100\121\108\97\110"},
 ["\101\98"]={"\101\98\97"},
 ["\101\100"]={"\101\100\97","\101\100\117\97\114\100\111","\101\100\119\97\114\100"},
 ["\101\107"]={"\101\107\97","\101\107\105"},
 ["\101\108"]={"\101\108\97","\101\108\105","\101\108\105\106\97\104","\101\108\108\97","\101\108\115"},
 ["\101\109"]={"\101\109\105","\101\109\105\108\105\97\110\111","\101\109\105\108\121","\101\109\109\97"},
 ["\101\110"]={"\101\110\97","\101\110\101","\101\110\103","\101\110\105","\101\110\111","\101\110\122\111"},
 ["\101\114"]={"\101\114\97","\101\114\105","\101\114\105\99","\101\114\110","\101\114\111","\101\114\118"},
 ["\101\115"]={"\101\115\116\101\98\97\110"},
 ["\101\116"]={"\101\116\97","\101\116\104\97\110","\101\116\122"},
 ["\101\118"]={"\101\118\97","\101\118\97\110","\101\118\105"},
 ["\101\119"]={"\101\119\97"},
 ["\102\97"]={"\102\97\98\105\97\110","\102\97\110","\102\97\116\105\109\97","\102\97\120","\102\97\121"},
 ["\102\99"]={"\102\99\111"},
 ["\102\101"]={"\102\101\105","\102\101\108\105\112\101","\102\101\108\105\120","\102\101\114\110\97\110\100\97","\102\101\114\110\97\110\100\111"},
 ["\102\105"]={"\102\105\97","\102\105\110\110","\102\105\122"},
 ["\102\111"]={"\102\111\120","\102\111\121"},
 ["\102\114"]={"\102\114\97\110\99\105\115\99\111","\102\114\121"},
 ["\102\117"]={"\102\117\108"},
 ["\103\97"]={"\103\97\98\114\105\101\108","\103\97\100","\103\97\101","\103\97\101\108","\103\97\108","\103\97\110","\103\97\118","\103\97\118\105\110","\103\97\119","\103\97\121"},
 ["\103\101"]={"\103\101\110","\103\101\111\114\103\101"},
 ["\103\105"]={"\103\105\97"},
 ["\103\111"]={"\103\111\110\122\97\108\111"},
 ["\103\114"]={"\103\114\97\99\101","\103\114\97\110\116","\103\114\97\121\115\111\110","\103\114\111"},
 ["\103\117"]={"\103\117\105\108\108\101\114\109\111","\103\117\115\116\97\118\111","\103\117\116"},
 ["\104\97"]={"\104\97\101","\104\97\105","\104\97\105\108\101\121","\104\97\106","\104\97\107","\104\97\109","\104\97\110\97","\104\97\110\110\97\104","\104\97\114\114\105\115\111\110","\104\97\115\115\97\110","\104\97\121\100\101\110"},
 ["\104\101"]={"\104\101\99\116\111\114","\104\101\110","\104\101\110\114\121"},
 ["\104\105"]={"\104\105\109"},
 ["\104\111"]={"\104\111\105","\104\111\111","\104\111\122"},
 ["\104\114"]={"\104\114\97"},
 ["\104\117"]={"\104\117\103","\104\117\103\111","\104\117\105","\104\117\110\116\101\114","\104\117\116"},
 ["\104\119"]={"\104\119\117"},
 ["\105\97"]={"\105\97\110"},
 ["\105\98"]={"\105\98\111","\105\98\114\97\104\105\109"},
 ["\105\99"]={"\105\99\111"},
 ["\105\100"]={"\105\100\97","\105\100\121"},
 ["\105\101"]={"\105\101\114","\105\101\121"},
 ["\105\103"]={"\105\103\110\97\99\105\111"},
 ["\105\109"]={"\105\109\97"},
 ["\105\110"]={"\105\110\97"},
 ["\105\111"]={"\105\111\110","\105\111\119"},
 ["\105\114"]={"\105\114\118"},
 ["\105\115"]={"\105\115\97","\105\115\97\97\99","\105\115\97\98\101\108\108\97","\105\115\97\105\97\104","\105\115\108\97"},
 ["\105\116"]={"\105\116\97"},
 ["\105\118"]={"\105\118\97\110","\105\118\101","\105\118\111"},
 ["\106\97"]={"\106\97\99","\106\97\99\107","\106\97\99\107\115\111\110","\106\97\99\111\98","\106\97\100","\106\97\105","\106\97\107\101","\106\97\109\101\115","\106\97\114\101\100","\106\97\115\111\110","\106\97\118\105\101\114","\106\97\121","\106\97\121\100\101\110"},
 ["\106\101"]={"\106\101\102\102\114\101\121","\106\101\109","\106\101\114\101\109\121","\106\101\115\115\101","\106\101\115\117\115"},
 ["\106\105"]={"\106\105\97","\106\105\97\110\103","\106\105\116"},
 ["\106\111"]={"\106\111\97\113\117\105\110","\106\111\101","\106\111\101\108","\106\111\104\110","\106\111\110","\106\111\110\97\116\104\97\110","\106\111\114\100\97\110","\106\111\114\103\101","\106\111\115\101","\106\111\115\101\102\97","\106\111\115\101\112\104","\106\111\115\104","\106\111\115\104\117\97","\106\111\121"},
 ["\106\117"]={"\106\117\97\110","\106\117\100","\106\117\101","\106\117\108\105\97\110","\106\117\108\105\101\116\97","\106\117\110","\106\117\115\116\105\110"},
 ["\107\97"]={"\107\97\105","\107\97\109","\107\97\110","\107\97\121\100\101\110"},
 ["\107\101"]={"\107\101\101","\107\101\105\116\104","\107\101\108\108\121","\107\101\110","\107\101\110\100\97\108\108","\107\101\110\110\101\116\104","\107\101\114","\107\101\118","\107\101\118\105\110"},
 ["\107\104"]={"\107\104\97\108\105\100"},
 ["\107\105"]={"\107\105\97","\107\105\110","\107\105\116"},
 ["\107\111"]={"\107\111\97","\107\111\104"},
 ["\107\117"]={"\107\117\109"},
 ["\107\121"]={"\107\121\100","\107\121\108","\107\121\108\101"},
 ["\108\97"]={"\108\97\100","\108\97\104","\108\97\105","\108\97\108","\108\97\110","\108\97\110\100\111\110","\108\97\116","\108\97\117\114\97","\108\97\119"},
 ["\108\101"]={"\108\101\97","\108\101\101","\108\101\105","\108\101\111","\108\101\111\110\97\114\100\111","\108\101\115","\108\101\116","\108\101\119","\108\101\121"},
 ["\108\105"]={"\108\105\97","\108\105\97\109","\108\105\101","\108\105\108\121","\108\105\110","\108\105\117"},
 ["\108\111"]={"\108\111\103\97\110","\108\111\116","\108\111\117","\108\111\119","\108\111\121"},
 ["\108\117"]={"\108\117\97","\108\117\99","\108\117\99\97","\108\117\99\97\115","\108\117\99\105\97","\108\117\99\105\97\110\97","\108\117\101","\108\117\105\115","\108\117\107\101","\108\117\110\97","\108\117\111","\108\117\114","\108\117\120"},
 ["\108\121"]={"\108\121\115"},
 ["\109\97"]={"\109\97\99","\109\97\100\100\105\101","\109\97\100\105\115\111\110","\109\97\106","\109\97\107","\109\97\110","\109\97\110\117\101\108","\109\97\114","\109\97\114\99\111","\109\97\114\99\111\115","\109\97\114\99\117\115","\109\97\114\105\97","\109\97\114\105\97\110\97","\109\97\114\105\111","\109\97\114\107","\109\97\114\116\105\110","\109\97\115\111\110","\109\97\116\101\111","\109\97\116\105\97\115","\109\97\116\116\104\101\119","\109\97\117\114\105\99\105\111","\109\97\120","\109\97\120\119\101\108\108"},
 ["\109\101"]={"\109\101\101","\109\101\105","\109\101\108\105\115\115\97"},
 ["\109\105"]={"\109\105\97","\109\105\99\104\97\101\108","\109\105\103\117\101\108","\109\105\108","\109\105\108\101\115","\109\105\108\111","\109\105\114"},
 ["\109\111"]={"\109\111\101","\109\111\104\97\109\109\101\100","\109\111\110\105\99\97","\109\111\114"},
 ["\109\117"]={"\109\117\105","\109\117\110","\109\117\114"},
 ["\110\97"]={"\110\97\116","\110\97\116\97\108\105\97","\110\97\116\104\97\110","\110\97\116\104\97\110\105\101\108"},
 ["\110\101"]={"\110\101\97","\110\101\100","\110\101\121"},
 ["\110\103"]={"\110\103\97","\110\103\111"},
 ["\110\105"]={"\110\105\99","\110\105\99\104\111\108\97\115","\110\105\99\111","\110\105\99\111\108\97\115","\110\105\111","\110\105\116","\110\105\117"},
 ["\110\111"]={"\110\111\97","\110\111\97\104","\110\111\101","\110\111\108\97\110","\110\111\114\97","\110\111\118\97"},
 ["\110\117"]={"\110\117\111","\110\117\114","\110\117\116"},
 ["\111\98"]={"\111\98\97","\111\98\101"},
 ["\111\100"]={"\111\100\100","\111\100\111","\111\100\121"},
 ["\111\103"]={"\111\103\103"},
 ["\111\108"]={"\111\108\97","\111\108\105\118\101\114"},
 ["\111\109"]={"\111\109\97\114"},
 ["\111\110"]={"\111\110\97","\111\110\103","\111\110\105"},
 ["\111\114"]={"\111\114\105","\111\114\109","\111\114\111","\111\114\114","\111\114\118"},
 ["\111\115"]={"\111\115\99\97\114","\111\115\105","\111\115\121"},
 ["\111\116"]={"\111\116\111","\111\116\116\111"},
 ["\111\117"]={"\111\117\109"},
 ["\111\119"]={"\111\119\101\110"},
 ["\112\97"]={"\112\97\98\108\111","\112\97\110","\112\97\114","\112\97\114\107\101\114","\112\97\115","\112\97\116","\112\97\116\114\105\99\107","\112\97\117","\112\97\117\108","\112\97\117\108\97","\112\97\117\108\105\110\97"},
 ["\112\101"]={"\112\101\97","\112\101\100\114\111","\112\101\103","\112\101\110","\112\101\112","\112\101\114","\112\101\116","\112\101\116\101\114"},
 ["\112\104"]={"\112\104\105"},
 ["\112\105"]={"\112\105\97","\112\105\108\97\114","\112\105\111"},
 ["\112\111"]={"\112\111\110"},
 ["\112\114"]={"\112\114\121"},
 ["\112\117"]={"\112\117\108","\112\117\121"},
 ["\113\105"]={"\113\105\117"},
 ["\113\117"]={"\113\117\110"},
 ["\114\97"]={"\114\97\98","\114\97\102","\114\97\102\97\101\108","\114\97\106","\114\97\109","\114\97\109\105\114\111","\114\97\110","\114\97\111","\114\97\112","\114\97\115","\114\97\117\108","\114\97\118\105","\114\97\121\109\111\110\100"},
 ["\114\101"]={"\114\101\97","\114\101\101","\114\101\109\121","\114\101\110","\114\101\111","\114\101\119","\114\101\120","\114\101\121"},
 ["\114\105"]={"\114\105\99\97\114\100\111","\114\105\99\104\97\114\100","\114\105\108\101\121","\114\105\111"},
 ["\114\111"]={"\114\111\97","\114\111\98\101\114\116","\114\111\98\101\114\116\111","\114\111\99","\114\111\99\105\111","\114\111\100\114\105\103\111","\114\111\101","\114\111\109\97\110","\114\111\110","\114\111\115","\114\111\115\97","\114\111\119","\114\111\120","\114\111\122"},
 ["\114\117"]={"\114\117\98\101\110"},
 ["\114\121"]={"\114\121\97\110","\114\121\101","\114\121\109"},
 ["\115\97"]={"\115\97\108\118\97\100\111\114","\115\97\109","\115\97\109\105","\115\97\109\117\101\108","\115\97\110","\115\97\110\116\105\97\103\111","\115\97\114\97","\115\97\117","\115\97\119","\115\97\120"},
 ["\115\101"]={"\115\101\97\110","\115\101\98\97\115\116\105\97\110","\115\101\101","\115\101\109","\115\101\110","\115\101\114\103\105\111","\115\101\116","\115\101\116\104","\115\101\118"},
 ["\115\105"]={"\115\105\97","\115\105\98","\115\105\103","\115\105\109\111\110"},
 ["\115\108"]={"\115\108\121"},
 ["\115\111"]={"\115\111\102\105\97","\115\111\109","\115\111\119"},
 ["\115\112"]={"\115\112\101\110\99\101\114"},
 ["\115\116"]={"\115\116\101\118\101\110","\115\116\117"},
 ["\115\117"]={"\115\117\101","\115\117\104","\115\117\110","\115\117\112"},
 ["\115\121"]={"\115\121\100","\115\121\108"},
 ["\116\97"]={"\116\97\105","\116\97\108","\116\97\116","\116\97\121","\116\97\121\108\111\114"},
 ["\116\101"]={"\116\101\109","\116\101\110","\116\101\111"},
 ["\116\104"]={"\116\104\101","\116\104\101\111","\116\104\105\97\103\111","\116\104\111\109\97\115"},
 ["\116\105"]={"\116\105\109\111\116\104\121"},
 ["\116\111"]={"\116\111\104","\116\111\105","\116\111\109","\116\111\109\97\115","\116\111\110\121","\116\111\114","\116\111\121"},
 ["\116\114"]={"\116\114\97\118\105\115","\116\114\101\118\111\114","\116\114\105","\116\114\105\115\116\97\110"},
 ["\116\115"]={"\116\115\101"},
 ["\116\117"]={"\116\117\116"},
 ["\116\121"]={"\116\121\101","\116\121\108\101\114"},
 ["\117\100"]={"\117\100\111"},
 ["\117\101"]={"\117\101\108"},
 ["\117\103"]={"\117\103\111"},
 ["\117\105"]={"\117\105\115"},
 ["\117\108"]={"\117\108\97","\117\108\101"},
 ["\117\109"]={"\117\109\101"},
 ["\117\114"]={"\117\114\105","\117\114\115"},
 ["\117\116"]={"\117\116\101"},
 ["\118\97"]={"\118\97\108","\118\97\108\101\110\116\105\110","\118\97\108\101\110\116\105\110\97","\118\97\108\101\114\105\97","\118\97\110","\118\97\115"},
 ["\118\101"]={"\118\101\114"},
 ["\118\105"]={"\118\105\99\116\111\114","\118\105\99\116\111\114\105\97","\118\105\110\99\101\110\116"},
 ["\118\111"]={"\118\111\101"},
 ["\119\97"]={"\119\97\110","\119\97\110\103","\119\97\116","\119\97\121"},
 ["\119\101"]={"\119\101\105"},
 ["\119\105"]={"\119\105\108\108\105\97\109"},
 ["\119\117"]={"\119\117\110"},
 ["\119\121"]={"\119\121\97\116\116","\119\121\101","\119\121\110"},
 ["\120\97"]={"\120\97\110","\120\97\118\105\101\114"},
 ["\120\105"]={"\120\105\109\101\110\97","\120\105\110","\120\105\117"},
 ["\121\97"]={"\121\97\110","\121\97\110\103","\121\97\115\109\105\110"},
 ["\121\101"]={"\121\101\111","\121\101\114"},
 ["\121\105"]={"\121\105\109","\121\105\110"},
 ["\121\111"]={"\121\111\111"},
 ["\121\117"]={"\121\117\107\105","\121\117\112","\121\117\117"},
 ["\122\97"]={"\122\97\99\104\97\114\121","\122\97\110\101","\122\97\114\97"},
 ["\122\101"]={"\122\101\108"},
 ["\122\104"]={"\122\104\97\110\103","\122\104\101","\122\104\105"},
 ["\122\111"]={"\122\111\101\121"},
 }
 local _vs = {
 ["\97\97"]={"\97\97\115"},
 ["\97\98"]={"\97\98\111"},
 ["\97\99"]={"\97\99\111\115\116\97"},
 ["\97\100"]={"\97\100\97\109\115"},
 ["\97\103"]={"\97\103\101","\97\103\117\105\108\97\114"},
 ["\97\104"]={"\97\104\110"},
 ["\97\105"]={"\97\105\100","\97\105\115"},
 ["\97\107"]={"\97\107\101","\97\107\105"},
 ["\97\108"]={"\97\108\108\101\110","\97\108\118\97\114\101\122"},
 ["\97\110"]={"\97\110\100\101\114\115\111\110","\97\110\105"},
 ["\97\112"]={"\97\112\101","\97\112\111","\97\112\116"},
 ["\97\114"]={"\97\114\101\108\108\97\110\111","\97\114\112","\97\114\116"},
 ["\97\115"]={"\97\115\104"},
 ["\97\116"]={"\97\116\111"},
 ["\97\117"]={"\97\117\108","\97\117\110"},
 ["\97\121"]={"\97\121\97\108\97","\97\121\111"},
 ["\98\97"]={"\98\97\105","\98\97\105\108\101\121","\98\97\107\101\114","\98\97\114","\98\97\121"},
 ["\98\101"]={"\98\101\101","\98\101\108\116\114\97\110","\98\101\110\110\101\116\116"},
 ["\98\108"]={"\98\108\97\110\99\111"},
 ["\98\111"]={"\98\111\120"},
 ["\98\114"]={"\98\114\111\111\107\115","\98\114\111\119\110"},
 ["\98\117"]={"\98\117\110"},
 ["\99\97"]={"\99\97\98\114\101\114\97","\99\97\109\112\98\101\108\108","\99\97\109\112\111\115","\99\97\114\100\101\110\97\115","\99\97\114\114\105\108\108\111","\99\97\114\116\101\114","\99\97\115\116\105\108\108\111","\99\97\115\116\114\111","\99\97\121"},
 ["\99\101"]={"\99\101\111"},
 ["\99\104"]={"\99\104\97","\99\104\97\118\101\122"},
 ["\99\108"]={"\99\108\97\114\107"},
 ["\99\111"]={"\99\111\108\108\105\110\115","\99\111\110\116\114\101\114\97\115","\99\111\111\107","\99\111\111\112\101\114","\99\111\120"},
 ["\99\114"]={"\99\114\117\122"},
 ["\99\117"]={"\99\117\105"},
 ["\100\97"]={"\100\97\101","\100\97\105","\100\97\109","\100\97\110","\100\97\118\105\115"},
 ["\100\101"]={"\100\101\108\103\97\100\111"},
 ["\100\105"]={"\100\105\97\122","\100\105\110"},
 ["\100\111"]={"\100\111\109\105\110\103\117\101\122"},
 ["\100\114"]={"\100\114\121"},
 ["\100\117"]={"\100\117\114\97\110"},
 ["\101\97"]={"\101\97\114"},
 ["\101\98"]={"\101\98\121"},
 ["\101\100"]={"\101\100\111","\101\100\119\97\114\100\115"},
 ["\101\105"]={"\101\105\100"},
 ["\101\108"]={"\101\108\97","\101\108\107"},
 ["\101\110"]={"\101\110\97","\101\110\101","\101\110\103","\101\110\122"},
 ["\101\114"]={"\101\114\111"},
 ["\101\115"]={"\101\115\112\105\110\111\122\97"},
 ["\101\118"]={"\101\118\97\110\115"},
 ["\101\121"]={"\101\121\101"},
 ["\102\97"]={"\102\97\122"},
 ["\102\101"]={"\102\101\114\110\97\110\100\101\122"},
 ["\102\105"]={"\102\105\122"},
 ["\102\108"]={"\102\108\111\114\101\115"},
 ["\102\111"]={"\102\111\115\116\101\114","\102\111\120"},
 ["\102\114"]={"\102\114\97"},
 ["\102\117"]={"\102\117\101\110\116\101\115","\102\117\115"},
 ["\103\97"]={"\103\97\98","\103\97\108\108\101\103\111\115","\103\97\114\99\105\97","\103\97\117","\103\97\119"},
 ["\103\105"]={"\103\105\110","\103\105\112"},
 ["\103\111"]={"\103\111\104","\103\111\108","\103\111\109\101\122","\103\111\110\122\97\108\101\122","\103\111\117","\103\111\121"},
 ["\103\114"]={"\103\114\97\121","\103\114\101\101\110"},
 ["\103\117"]={"\103\117\101\114\114\101\114\111","\103\117\116\105\101\114\114\101\122"},
 ["\104\97"]={"\104\97\108\108","\104\97\109","\104\97\113","\104\97\114\114\105\115","\104\97\122"},
 ["\104\101"]={"\104\101\109","\104\101\114\110\97\110\100\101\122","\104\101\114\114\101\114\97"},
 ["\104\105"]={"\104\105\108\108","\104\105\109","\104\105\110"},
 ["\104\111"]={"\104\111\119\97\114\100","\104\111\122"},
 ["\104\117"]={"\104\117\103\104\101\115","\104\117\104"},
 ["\105\98"]={"\105\98\97\114\114\97"},
 ["\105\110"]={"\105\110\97"},
 ["\105\111"]={"\105\111\110"},
 ["\105\116"]={"\105\116\111"},
 ["\106\97"]={"\106\97\99\107\115\111\110","\106\97\109\101\115"},
 ["\106\101"]={"\106\101\120"},
 ["\106\105"]={"\106\105\109\101\110\101\122"},
 ["\106\111"]={"\106\111\104\110\115\111\110","\106\111\110\101\115","\106\111\121"},
 ["\106\117"]={"\106\117\110"},
 ["\107\97"]={"\107\97\110","\107\97\112"},
 ["\107\101"]={"\107\101\101","\107\101\108\108\121","\107\101\119"},
 ["\107\104"]={"\107\104\97","\107\104\117"},
 ["\107\105"]={"\107\105\100","\107\105\101","\107\105\109","\107\105\110\103"},
 ["\107\111"]={"\107\111\116"},
 ["\107\117"]={"\107\117\97","\107\117\101","\107\117\116"},
 ["\108\97"]={"\108\97\98","\108\97\104","\108\97\105","\108\97\108","\108\97\116","\108\97\119"},
 ["\108\101"]={"\108\101\101","\108\101\111\110","\108\101\119\105\115"},
 ["\108\105"]={"\108\105\97"},
 ["\108\111"]={"\108\111\101","\108\111\105","\108\111\110\103","\108\111\112\101\122","\108\111\119","\108\111\121"},
 ["\108\117"]={"\108\117\99","\108\117\111","\108\117\117"},
 ["\108\121"]={"\108\121\109"},
 ["\109\97"]={"\109\97\107","\109\97\114\116\105\110","\109\97\114\116\105\110\101\122","\109\97\117","\109\97\120"},
 ["\109\101"]={"\109\101\100\105\110\97","\109\101\101","\109\101\106\105\97","\109\101\110","\109\101\110\100\101\122","\109\101\110\100\111\122\97"},
 ["\109\105"]={"\109\105\108\108\101\114","\109\105\115","\109\105\116\99\104\101\108\108"},
 ["\109\111"]={"\109\111\108\105\110\97","\109\111\109","\109\111\110\116\111\121\97","\109\111\111\114\101","\109\111\114","\109\111\114\97\108\101\115","\109\111\114\101\110\111","\109\111\114\103\97\110","\109\111\114\114\105\115","\109\111\119"},
 ["\109\117"]={"\109\117\110","\109\117\110\111\122","\109\117\114","\109\117\114\112\104\121"},
 ["\109\121"]={"\109\121\101\114\115"},
 ["\110\97"]={"\110\97\118\97\114\114\111"},
 ["\110\101"]={"\110\101\108\115\111\110","\110\101\121","\110\101\122"},
 ["\110\103"]={"\110\103\117\121\101\110"},
 ["\110\105"]={"\110\105\107","\110\105\117"},
 ["\111\97"]={"\111\97\115"},
 ["\111\98"]={"\111\98\105"},
 ["\111\99"]={"\111\99\104","\111\99\104\111\97"},
 ["\111\101"]={"\111\101\110"},
 ["\111\103"]={"\111\103\101"},
 ["\111\104"]={"\111\104\109","\111\104\115"},
 ["\111\106"]={"\111\106\111"},
 ["\111\108"]={"\111\108\112"},
 ["\111\109"]={"\111\109\115"},
 ["\111\110"]={"\111\110\103"},
 ["\111\114"]={"\111\114\105","\111\114\107","\111\114\116\105\122","\111\114\121"},
 ["\111\116"]={"\111\116\115"},
 ["\111\117"]={"\111\117\109"},
 ["\112\97"]={"\112\97\99\104\101\99\111","\112\97\110","\112\97\111","\112\97\114\107\101\114","\112\97\116","\112\97\116\101\108"},
 ["\112\101"]={"\112\101\97","\112\101\100","\112\101\110","\112\101\114\101\122","\112\101\116\101\114\115\111\110","\112\101\119","\112\101\121"},
 ["\112\104"]={"\112\104\105","\112\104\105\108\108\105\112\115"},
 ["\112\105"]={"\112\105\111"},
 ["\112\108"]={"\112\108\111"},
 ["\112\111"]={"\112\111\110"},
 ["\112\114"]={"\112\114\105\99\101"},
 ["\112\117"]={"\112\117\97","\112\117\99","\112\117\121"},
 ["\112\121"]={"\112\121\101","\112\121\111"},
 ["\113\105"]={"\113\105\117"},
 ["\114\97"]={"\114\97\109\105\114\101\122","\114\97\109\111\115","\114\97\110","\114\97\118","\114\97\122"},
 ["\114\101"]={"\114\101\101","\114\101\101\100","\114\101\115","\114\101\119","\114\101\120","\114\101\121","\114\101\121\101\115"},
 ["\114\105"]={"\114\105\99\104\97\114\100\115\111\110","\114\105\111\115","\114\105\118\97\115","\114\105\118\101\114\97"},
 ["\114\111"]={"\114\111\98\101\114\116\115","\114\111\98\105\110\115\111\110","\114\111\100\114\105\103\117\101\122","\114\111\101","\114\111\103\101\114\115","\114\111\106\97\115","\114\111\109\101\114\111","\114\111\115\115","\114\111\119"},
 ["\114\117"]={"\114\117\105\122"},
 ["\115\97"]={"\115\97\97","\115\97\108\97\122\97\114","\115\97\110\99\104\101\122","\115\97\110\100\101\114\115","\115\97\110\100\111\118\97\108","\115\97\110\116\111\115","\115\97\114","\115\97\115","\115\97\120"},
 ["\115\99"]={"\115\99\111\116\116"},
 ["\115\101"]={"\115\101\114\114\97\110\111","\115\101\117"},
 ["\115\105"]={"\115\105\108\118\97","\115\105\110"},
 ["\115\109"]={"\115\109\105\116\104"},
 ["\115\111"]={"\115\111\108\105\115","\115\111\114","\115\111\116\111"},
 ["\115\116"]={"\115\116\101\119\97\114\116"},
 ["\115\117"]={"\115\117\104","\115\117\115","\115\117\116"},
 ["\116\97"]={"\116\97\106","\116\97\121\108\111\114"},
 ["\116\101"]={"\116\101\111"},
 ["\116\104"]={"\116\104\111\109\97\115","\116\104\111\109\112\115\111\110"},
 ["\116\105"]={"\116\105\110","\116\105\111","\116\105\120"},
 ["\116\111"]={"\116\111\107","\116\111\114\114\101\115"},
 ["\116\114"]={"\116\114\101","\116\114\105"},
 ["\116\115"]={"\116\115\101"},
 ["\116\117"]={"\116\117\114\110\101\114"},
 ["\117\104"]={"\117\104\108"},
 ["\117\111"]={"\117\111\121"},
 ["\117\114"]={"\117\114\97","\117\114\101"},
 ["\117\121"]={"\117\121\97"},
 ["\118\97"]={"\118\97\108\100\101\122","\118\97\110","\118\97\114\103\97\115","\118\97\115\113\117\101\122","\118\97\121"},
 ["\118\101"]={"\118\101\103\97","\118\101\108\97\115\113\117\101\122","\118\101\110","\118\101\114"},
 ["\119\97"]={"\119\97\108\107\101\114","\119\97\114\100","\119\97\116\115\111\110"},
 ["\119\104"]={"\119\104\105\116\101"},
 ["\119\105"]={"\119\105\108\108\105\97\109\115","\119\105\108\115\111\110"},
 ["\119\111"]={"\119\111\111\100"},
 ["\119\114"]={"\119\114\105\103\104\116"},
 ["\121\97"]={"\121\97\112","\121\97\117"},
 ["\121\101"]={"\121\101\109"},
 ["\121\105"]={"\121\105\110","\121\105\112","\121\105\117"},
 ["\121\111"]={"\121\111\104","\121\111\117\110\103"},
 ["\121\117"]={"\121\117\115"},
 ["\122\97"]={"\122\97\114"},
 ["\122\111"]={"\122\111\117"},
 ["\122\117"]={"\122\117\107","\122\117\110\105\103\97"},
 }
 local _ws = {
 yt=true, ytb=true, ttv=true, tv=true, rblx=true, rbx=true, roblox=true,
 pro=true, gamer=true, gaming=true, real=true, oficial=true, official=true,
 its=true, im=true, the=true, xd=true, ff=true, op=true, god=true, king=true,
 queen=true, boss=true, lord=true, mr=true, mrs=true, itz=true, iam=true, yes=true,
 dev=true, noob=true, dark=true, shadow=true, fire=true, ice=true, epic=true,
 super=true, mega=true, ultra=true, mini=true, big=true, lil=true, _kgb=true,
 new=true, red=true, blue=true, black=true, _thb=true, gold=true, toxic=true,
 cool=true, fast=true, crazy=true, ninja=true, sniper=true, beast=true, killer=true,
 legend=true, alpha=true, beta=true, omega=true, clan=true, team=true, squad=true,
 vip=true, og=true, ez=true, gg=true, _s=true, mc=true, cod=true, fps=true,
 }
 local _xs = { "\99\104\105\116\111","\99\104\105\116\97","\99\105\116\111","\99\105\116\97","\105\108\108\111","\105\108\108\97","\105\116\111","\105\116\97" }
 local _ys = { "\122\122","\120\120","\120\100","\103\103","\115\115","\116\116","\110\110","\108\108","\114\114","\121\121","\105\105","\111\111","\101\101","\97\97" }
 local _zs = { z=true, x=true, o=true, q=true, v=true, w=true, y=true }
 local _at = { "\120\120","\120\100","\105\105","\101\108","\108\97","\108\111\115","\108\97\115","\109\99","\100\114","\100\106" }
 local _bt = { i=true, x=true, o=true }
 local _ct = {
 ["\52"]={"\97"}, ["\51"]={"\101"}, ["\48"]={"\111"}, ["\55"]={"\116"}, ["\56"]={"\98"},
 ["\64"]={"\97"}, ["\36"]={"\115"}, ["\43"]={"\116"},
 ["\49"]={"\105","\108"}, ["\53"]={"\115"}, ["\57"]={"\103"}, ["\54"]={"\103"}, ["\50"]={"\122"},
 ["\33"]={"\105","\108"}, ["\124"]={"\105","\108"},
 }
 local _dt = {
 { pat="\112\104", rep="\102" },
 { pat="\118\118", rep="\119" },
 { pat="\107\107", rep="\107" },
 { pat="\99\99", rep="\107" },
 { pat="\110\110", rep="\110" },
 { pat="\108\108", rep="\108" },
 { pat="\115\115", rep="\115" },
 { pat="\116\116", rep="\116" },
 { pat="\114\114", rep="\114" },
 { pat="\101\101", rep="\101" },
 { pat="\111\111", rep="\111" },
 { pat="\105\105", rep="\105" },
 }
 local _et = {
 ["\97\204\129"]="\97",["\101\204\129"]="\101",["\105\204\129"]="\105",["\111\204\129"]="\111",
 ["\117\204\129"]="\117",["\117\204\136"]="\117",["\110\204\131"]="\110",
 }
 local function normalize(s)
 s = tostring(s):lower()
 for _mt, to in pairs(_et) do s = s:gsub(_mt, to) end
 return s
 end
 local function editDistance(a, b)
 local _ft, _lv = #a, #b
 if math.abs(_ft - _lv) > 2 then return 99 end
 local _qe = {}
 for j = 0, _lv do _qe[j] = j end
 for i = 1, _ft do
 local _gt = { [0] = i }
 local _ht = a:_cqb(i)
 for j = 1, _lv do
 local _it = (_ht == b:_cqb(j)) and 0 or 1
 _gt[j] = math.min(_qe[j] + 1, _gt[j-1] + 1, _qe[j-1] + _it)
 end
 _qe = _gt
 end
 return _qe[_lv]
 end
 local function inDict(_kt, _cs)
 if #_kt < 2 then return false end
 local _jt = _cs[_kt:_is(1,2)]
 if not _jt then return false end
 for _, n in ipairs(_jt) do
 if n == _kt then return true end
 end
 return false
 end
 local function matchNameIdx(_lt, _cs)
 local n = #_lt
 if n < 2 then return nil, 99, nil end
 if inDict(_lt, _cs) then return _lt, 0, "\101\120\97\99\116" end
 if n < 3 then return nil, 99, nil end
 local _nt = _lt:_is(1, 1)
 local _ot, bestD = nil, 3
 local _pt, pfxLen = nil, math.huge
 for b = string._cqb("\97"), string._cqb("\122") do
 local _jt = _cs[_nt .. string._ojb(b)]
 if _jt then
 for _, _i in ipairs(_jt) do
 if #_i > n and _i:_is(1, n) == _lt and #_i < pfxLen then
 _pt, pfxLen = _i, #_i
 end
 if math.abs(#_i - n) <= 2 then
 local d = editDistance(_lt, _i)
 if d < bestD then _ot, bestD = _i, d end
 end
 end
 end
 end
 local _qt = _ot and ((bestD == 1 and n >= 4) or (bestD == 2 and n >= 6))
 if _qt and bestD == 1 then return _ot, 1, "\102\117\122\122\121" end
 if _pt then return _pt, 0, "\112\114\101\102\105\120" end
 if _qt then return _ot, bestD, "\102\117\122\122\121" end
 return nil, 99, nil
 end
 local function applyClusters(_lc)
 local _rt = _lc
 local _st = {}
 for _, cl in ipairs(_dt) do
 if _rt:find(cl.pat, 1, true) then
 _rt = _rt:gsub(cl.pat, cl.rep)
 _st[#_st+1] = cl.pat .. "\32\8594\32" .. cl.rep
 end
 end
 return _rt, _st
 end
 local function stripStyleSuffix(w)
 local _tt = {}
 for _, suf in ipairs(_ys) do
 if #w >= #suf + 3 and w:_is(-#suf) == suf then
 w = w:_is(1, #w - #suf)
 _tt[#_tt+1] = suf
 break
 end
 end
 if #w >= 4 and _zs[w:_is(-1)] then
 local _ut = w:_is(-1)
 w = w:_is(1, -2)
 _tt[#_tt+1] = _ut
 end
 return w, _tt
 end
 local function stripStylePrefix(w)
 local _tt = {}
 for _, pre in ipairs(_at) do
 if #w >= #pre + 3 and w:_is(1, #pre) == pre then
 w = w:_is(#pre + 1)
 _tt[#_tt+1] = pre
 break
 end
 end
 if #w >= 4 and _bt[w:_is(1,1)] then
 local _vt = w:_is(1,1)
 w = w:_is(2)
 _tt[#_tt+1] = _vt
 end
 return w, _tt
 end
 local _wt = 24
 local function deLeet(_lc)
 local _mc = { { _hb = "", _au = {}, ambig = 0, solid = 0 } }
 for i = 1, #_lc do
 local _xt = _lc:_is(i, i)
 local _u = _ct[_xt]
 local _yt = {}
 if _u then
 local _zt = #_u > 1
 for _, r in ipairs(_mc) do
 for _, letter in ipairs(_u) do
 if #_yt < _wt then
 local _au = {}
 for _, x in ipairs(r._au) do _au[#_au + 1] = x end
 _au[#_au + 1] = _xt .. "\32\8594\32" .. letter
 _yt[#_yt + 1] = {
 _hb = r._hb .. letter, _au = _au,
 ambig = r.ambig + (_zt and 1 or 0),
 solid = r.solid + (_zt and 0 or 1),
 }
 end
 end
 end
 else
 local _bu = _xt:match("\37\97") and _xt or ""
 for _, r in ipairs(_mc) do
 r._hb = r._hb .. _bu
 _yt[#_yt + 1] = r
 end
 end
 _mc = _yt
 if #_mc == 0 then break end
 end
 return _mc
 end
 local function stripDiminutive(w)
 for _, suf in ipairs(_xs) do
 if #w >= #suf + 3 and w:_is(-#suf) == suf then
 return w:_is(1, #w - #suf), suf
 end
 end
 return w, nil
 end
 local function splitNameYear(s)
 local _i, year = s:match("\94\40\46\45\41\40\37\100\37\100\37\100\37\100\41\36")
 if _i and #_i >= 3 then
 local y = tonumber(year)
 if y and y >= 1980 and y <= 2026 then
 return _i, y
 end
 end
 _i, year = s:match("\94\40\46\45\41\40\37\100\37\100\41\36")
 if _i and #_i >= 3 then
 local y = tonumber(year)
 if y then
 local _cu = y >= 80 and (1900 + y) or (2000 + y)
 if _cu >= 1980 and _cu <= 2026 then
 return _i, _cu
 end
 end
 end
 return s, nil
 end
 local function smartTokenize(s)
 local _du = {}
 for _yp in s:gmatch("\91\94\95\37\46\37\45\93\43") do
 _du[#_du+1] = _yp
 end
 local _eu = {}
 for _, part in ipairs(_du) do
 local _fu = ""
 for i = 1, #part do
 local _xt = part:_is(i,i)
 local _qe = _fu:_is(-1)
 local _gu = false
 if #_fu > 0 then
 if (_qe:match("\37\97") and _xt:match("\37\100")) or (_qe:match("\37\100") and _xt:match("\37\97")) then
 _gu = true
 elseif _qe:match("\37\108") and _xt:match("\37\117") then
 _gu = true
 end
 end
 if _gu then
 if #_fu >= 2 then _eu[#_eu+1] = _fu end
 _fu = _xt:lower()
 else
 _fu = _fu .. _xt:lower()
 end
 end
 if #_fu >= 2 then _eu[#_eu+1] = _fu end
 end
 return _eu
 end
 local function trySplitCompound(_kt)
 local _ii = {}
 for i = 3, #_kt - 3 do
 local _hu = _kt:_is(1, i)
 local _iu = _kt:_is(i + 1)
 local _ju, lDist, lType = matchNameIdx(_hu, _us)
 if _ju and lType ~= "\112\114\101\102\105\120" and lDist <= 1 then
 local _ku, rDist, rType = matchNameIdx(_iu, _vs)
 if not _ku or rType == "\112\114\101\102\105\120" or rDist > 1 then
 _ku, rDist, rType = matchNameIdx(_iu, _us)
 end
 if _ku and rType ~= "\112\114\101\102\105\120" and rDist <= 1 then
 local _vb = 100 - 20*(lDist + rDist)
 _ii[#_ii+1] = {
 _vt = _ju, second = _ku,
 _vb = math.clamp(_vb, 0, 100),
 _rjb = lDist + rDist,
 }
 end
 end
 end
 if #_ii > 0 then
 table.sort(_ii, function(a,b) return a._vb > b._vb end)
 return _ii[1]
 end
 return nil
 end
 local _lu = { Insuficiente = 0, Baja = 1, Media = 2, Alta = 3 }
 local function capLevel(_mu, _nu)
 if not _nu then return _mu end
 if _lu[_mu] > _lu[_nu] then return _nu end
 return _mu
 end
 local function levelOf(_lb, _ou)
 if not _ou then return "\73\110\115\117\102\105\99\105\101\110\116\101" end
 if _lb >= 75 then return "\65\108\116\97"
 elseif _lb >= 50 then return "\77\101\100\105\97"
 elseif _lb >= 30 then return "\66\97\106\97"
 else return "\73\110\115\117\102\105\99\105\101\110\116\101" end
 end
 function D._el(_bp)
 local _fe = {
 _bp = tostring(_bp or ""),
 _au = {}, _tm = {}, hasEvidence = false,
 yearGuess = nil,
 compound = nil,
 }
 if _fe._bp == "" then return _fe end
 local s = normalize(_fe._bp)
 local _pu = {}
 local _qu = nil
 do
 local _, y = splitNameYear(s)
 if not y then
 for _yp in s:gmatch("\91\94\95\37\46\37\45\93\43") do
 local _, yy = splitNameYear(_yp)
 if yy then y = yy; break end
 end
 end
 if y then _fe.yearGuess = y end
 end
 local _eu = smartTokenize(s)
 if #_eu == 0 then _eu = { s } end
 for _wu, tok in ipairs(_eu) do
 local _ru = (_wu == 1) and 8 or 0
 local _su, yearGuess = splitNameYear(tok)
 if yearGuess and not _fe.yearGuess then _fe.yearGuess = yearGuess end
 local _tt, _ = stripStylePrefix(_su)
 _tt, _ = stripStyleSuffix(_tt)
 local _tu, clusterSubs = applyClusters(_tt)
 local _uu = { tok, _su, _tt, _tu }
 local _yh = {}
 local _vu = {}
 for _, b in ipairs(_uu) do
 if #b >= 2 and b:match("\37\97") and not _yh[b] then
 _yh[b] = true
 _vu[#_vu+1] = b
 end
 end
 for _, _shb in ipairs(_vu) do
 local _xu = _shb:gsub("\91\94\97\45\122\93", "")
 if not _ws[_xu] and #_xu >= 2 then
 if not _qu and #_xu >= 2 then _qu = _xu end
 if #_xu >= 6 and not _fe.compound then
 local _yu = trySplitCompound(_xu)
 if _yu and _yu._vb >= 60 then
 _fe.compound = _yu
 local _zu = _yu._vt
 local _qe = _pu[_zu]
 local _lb = _yu._vb + _ru
 if not _qe or _lb > _qe._vb then
 _pu[_zu] = { _vb = _lb, _wg = levelOf(_lb, true), _au = clusterSubs, compound = _yu }
 end
 end
 end
 for _, c in ipairs(deLeet(_shb)) do
 local _av = { { c._hb, false } }
 local _bv, dim = stripDiminutive(c._hb)
 if dim then _av[#_av + 1] = { _bv, true } end
 for _, v in ipairs(_av) do
 local _lt, _rjb, _xfb = matchNameIdx(v[1], _us)
 local _cv = true
 if not _lt then
 _lt, _rjb, _xfb = matchNameIdx(v[1], _vs)
 _cv = false
 end
 if _lt then
 local L = #v[1]
 local _lb, _nu
 if _xfb == "\101\120\97\99\116" then
 _lb, _nu = 100, "\65\108\116\97"
 elseif _xfb == "\112\114\101\102\105\120" then
 _lb = 52 + math.min(L - 3, 3) * 6
 _nu = "\77\101\100\105\97"
 else
 _lb = 100 - math.floor(_rjb * (140 / L))
 if L >= 8 then _nu = "\65\108\116\97"
 elseif L >= 6 and _rjb <= 1 then _nu = "\65\108\116\97"
 elseif L >= 4 then _nu = "\77\101\100\105\97"
 else _nu = "\66\97\106\97" end
 end
 _lb = _lb - 22*c.ambig - 4*c.solid
 if v[2] then _lb = _lb - 12 end
 if not _cv then _lb = _lb - 6 end
 _lb = _lb + _ru
 _lb = math.clamp(_lb, 0, 100)
 local _mu = capLevel(levelOf(_lb, true), _nu)
 local _dv = {}
 for _, x in ipairs(clusterSubs) do _dv[#_dv+1] = x end
 for _, x in ipairs(c._au) do _dv[#_dv+1] = x end
 local _qe = _pu[_lt]
 if not _qe or _lb > _qe._vb then
 _pu[_lt] = { _vb = _lb, _wg = _mu, _au = _dv }
 end
 end
 end
 end
 end
 end
 end
 local _yf = {}
 for _i, _xe in pairs(_pu) do
 _yf[#_yf + 1] = { _i = _i, _vb = _xe._vb, _wg = _xe._wg, _au = _xe._au, compound = _xe.compound }
 end
 table.sort(_yf, function(a, b) return a._vb > b._vb end)
 if _yf[1] then _fe._au = _yf[1]._au; _fe.hasEvidence = true end
 for i = 1, math.min(4, #_yf) do _fe._tm[#_fe._tm + 1] = _yf[i] end
 if #_fe._tm == 0 and _qu then
 _fe._tm[1] = { _i = _qu, _vb = 15, _wg = "\73\110\115\117\102\105\99\105\101\110\116\101", _au = {} }
 end
 return _fe
 end
 _G.NXDecoder = D
end
do
 if _G.NXIntel and _G.NXIntel.stop then pcall(_G.NXIntel.stop) end
 local I = {}
 local _ev = "\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\105\110\116\101\108\46\106\115\111\110"
 local _fv  = "\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\105\110\116\101\108\46\98\97\107\46\106\115\111\110"
 local _gv  = 50
 local _hv = 20
 local _iv = {}
 local _jv = 0
 local function saveIntel()
 if not _c then return end
 pcall(function()
 local _e = HttpService:JSONEncode(_iv)
 writefile(_ev, _e)
 writefile(_fv, _e)
 end)
 end
 local function loadIntel()
 if not _c then return end
 pcall(function()
 local _f
 if isfile(_ev) then _f = readfile(_ev) end
 local _g, _ie = pcall(function() return HttpService:JSONDecode(_f) end)
 if (not _g or type(_ie) ~= "\116\97\98\108\101") and isfile(_fv) then
 _g, _ie = pcall(function() return HttpService:JSONDecode(readfile(_fv)) end)
 end
 if _g and type(_ie) == "\116\97\98\108\101" then _iv = _ie end
 end)
 end
 loadIntel()
 local function evictLRU()
 local _kv = {}
 for k in pairs(_iv) do _kv[#_kv + 1] = k end
 if #_kv <= _gv then return end
 table.sort(_kv, function(a, b)
 local _ft = _iv[a] and _iv[a].lastSeen or 0
 local _lv = _iv[b] and _iv[b].lastSeen or 0
 return _ft < _lv
 end)
 while #_kv > _gv do
 _iv[_kv[1]] = nil
 table.remove(_kv, 1)
 end
 end
 local _mv = { "\117\115\101\114\110\97\109\101", "\100\105\115\112\108\97\121\78\97\109\101", "\118\101\114\105\102\105\101\100", "\98\97\110\110\101\100", "\100\101\108\101\116\101\100",
 "\102\114\105\101\110\100\115", "\102\111\108\108\111\119\101\114\115", "\102\111\108\108\111\119\105\110\103", "\103\114\111\117\112\115", "\98\97\100\103\101\115" }
 local function snapEqual(a, b)
 if not a or not b then return false end
 for _, f in ipairs(_mv) do
 if tostring(a[f] or "") ~= tostring(b[f] or "") then return false end
 end
 return true
 end
 local function buildSnapshot(_ye)
 local _nv = os.time()
 return {
 _bp    = _ye.Username,
 _rr = _ye.DisplayName,
 _ag     = _ye.Friends,
 _sg   = _ye.Followers,
 _tg   = _ye.Following,
 _bg      = _ye.Groups,
 _cg      = _ye.Badges,
 _fg    = (_ye.Verified == "\83\237"),
 banned      = (_ye.Banned == "\83\237"),
 deleted     = (_ye.IsDeleted == true),
 collected_at = _nv,
 first_seen   = _nv,
 last_seen    = _nv,
 sources = {
 _bp  = "\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\123\105\100\125",
 _ag   = "\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\123\105\100\125\47\102\114\105\101\110\100\115\47\99\111\117\110\116",
 _sg = "\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\123\105\100\125\47\102\111\108\108\111\119\101\114\115\47\99\111\117\110\116",
 _tg = "\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\123\105\100\125\47\102\111\108\108\111\119\105\110\103\115\47\99\111\117\110\116",
 _bg    = "\103\114\111\117\112\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\123\105\100\125\47\103\114\111\117\112\115\47\114\111\108\101\115",
 _cg    = "\98\97\100\103\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\123\105\100\125\47\98\97\100\103\101\115",
 },
 }
 end
 local function mergeTimeline(_k, _uv)
 local _ov = _k.usernameTimeline or {}
 local _yh = {}
 for i, t in ipairs(_ov) do _yh[t._i] = i end
 if _uv then
 for _, n in ipairs(_uv) do
 if not _yh[n] then
 _ov[#_ov + 1] = { _i = n, first_seen = 0, last_seen = 0 }
 _yh[n] = #_ov
 end
 end
 end
 for _, _qv in ipairs(_k.snapshots or {}) do
 if _qv._bp then
 local _cs = _yh[_qv._bp]
 if not _cs then
 _ov[#_ov + 1] = { _i = _qv._bp, first_seen = _qv.first_seen or 0, last_seen = _qv.last_seen or 0 }
 _yh[_qv._bp] = #_ov
 else
 local t = _ov[_cs]
 if _qv.first_seen and (t.first_seen == 0 or _qv.first_seen < t.first_seen) then
 t.first_seen = _qv.first_seen
 end
 if _qv.last_seen and _qv.last_seen > t.last_seen then
 t.last_seen = _qv.last_seen
 end
 end
 end
 end
 _k.usernameTimeline = _ov
 return _ov
 end
 function I.record(_ye, _uv)
 if not _ye or not _ye.UserId then return end
 local _pv = tostring(_ye.UserId)
 local _k = _iv[_pv] or { snapshots = {}, usernameTimeline = {} }
 _iv[_pv] = _k
 local _qv = buildSnapshot(_ye)
 local _rv = _k.snapshots or {}
 _k.snapshots = _rv
 local _ut = _rv[#_rv]
 if snapEqual(_ut, _qv) then
 _ut.last_seen = _qv.last_seen
 else
 if _ut then _qv.first_seen = _qv.collected_at end
 _rv[#_rv + 1] = _qv
 while #_rv > _hv do table.remove(_rv, 1) end
 end
 _k.lastSeen = os.time()
 mergeTimeline(_k, _uv)
 evictLRU()
 saveIntel()
 end
 function I.getChanges(_ye)
 if not _ye or not _ye.UserId then return {} end
 local _pv = tostring(_ye.UserId)
 local _k = _iv[_pv]
 if not _k then return {} end
 local _rv = _k.snapshots or {}
 if #_rv < 2 then return {} end
 local _qe = _rv[#_rv - 1]
 local _sv = _rv[#_rv]
 local _tv = {}
 for _, f in ipairs(_mv) do
 local o = _qe[f]
 local n = _sv[f]
 if tostring(o or "") ~= tostring(n or "") then
 _tv[#_tv + 1] = {
 _se = f, _kgb = o, new = n,
 detected_at = _sv.collected_at or os.time(),
 }
 end
 end
 return _tv
 end
 function I.getTimeline(_ye)
 if not _ye or not _ye.UserId then return {} end
 local _pv = tostring(_ye.UserId)
 local _k = _iv[_pv]
 if not _k then return {} end
 return _k.usernameTimeline or {}
 end
 function I.getEntry(_ye)
 if not _ye or not _ye.UserId then return nil end
 return _iv[tostring(_ye.UserId)]
 end
 function I.reset()
 _jv = _jv + 1
 end
 function I.stop()
 _jv = _jv + 1
 end
 function I.buildCard(_t, _ye, _wv)
 local _vv = _jv
 local _pv = _ye.UserId
 local _o = Instance.new("\70\114\97\109\101", _t)
 _o.Name = "\78\88\73\110\116\101\108\67\97\114\100"
 _o.LayoutOrder = _wv
 _o.Size = UDim2.new(1, -4, 0, 0)
 _o.AutomaticSize = Enum.AutomaticSize.Y
 _o.BackgroundColor3 = C._o
 _o.BorderSizePixel = 0
 _o.ClipsDescendants = true
 Instance.new("\85\73\67\111\114\110\101\114", _o).CornerRadius = UDim.new(0, 8)
 themed(_o, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _xv = Instance.new("\85\73\83\116\114\111\107\101", _o)
 _xv.Color = C._idb; _xv.Thickness = 1.2; _xv.Transparency = 0.35
 themed(_xv, "\67\111\108\111\114", "\97\99\99\101\110\116")
 local _yv = Instance.new("\85\73\80\97\100\100\105\110\103", _o)
 _yv.PaddingTop = UDim.new(0, 8); _yv.PaddingBottom = UDim.new(0, 8)
 _yv.PaddingLeft = UDim.new(0, 10); _yv.PaddingRight = UDim.new(0, 10)
 local _zv = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _o)
 _zv.Padding = UDim.new(0, 4); _zv.SortOrder = Enum.SortOrder.LayoutOrder
 local h = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 h.LayoutOrder = 0; h.Size = UDim2.new(1, 0, 0, 20)
 h.BackgroundTransparency = 1
 h.Font = Enum.Font.GothamBold; h.TextSize = 14
 h.TextColor3 = C._idb; h.Text = "\85\115\101\114\110\97\109\101\32\72\105\115\116\111\114\121\32\43\32\73\110\116\101\108\108\105\103\101\110\99\101"
 h.TextXAlignment = Enum.TextXAlignment.Left
 themed(h, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _x = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 _x.Name = "\73\110\116\101\108\66\111\100\121"
 _x.LayoutOrder = 1
 _x.Size = UDim2.new(1, 0, 0, 0)
 _x.AutomaticSize = Enum.AutomaticSize.Y
 _x.BackgroundTransparency = 1
 _x.Font = Enum.Font.Gotham; _x.TextSize = 13
 _x.TextColor3 = C._hb; _x.TextWrapped = true
 _x.TextXAlignment = Enum.TextXAlignment.Left
 _x.TextYAlignment = Enum.TextYAlignment.Top
 _x.Text = "\82\101\99\111\112\105\108\97\110\100\111\46\46\46"
 themed(_x, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local function actualizar(_uv)
 if _jv ~= _vv then return end
 if not _o.Parent then return end
 if _mr == nil or _mr.UserId ~= _pv then return end
 I.record(_ye, _uv)
 local _ov = I.getTimeline(_ye)
 local _tv = I.getChanges(_ye)
 local _aw = {}
 if #_ov > 0 then
 _aw[#_aw + 1] = "\84\105\109\101\108\105\110\101\32\100\101\32\117\115\101\114\110\97\109\101\115\58"
 for _, t in ipairs(_ov) do
 local _bw = (t._i == _ye.Username) and "\9679" or "\9675"
 local _cw = ""
 if t.first_seen and t.first_seen > 0 then
 _cw = _cw .. "\32\32\111\98\115\101\114\118\97\100\111\58\32" .. os.date("\37\89\45\37\109\45\37\100", t.first_seen)
 if t.last_seen and t.last_seen > 0 and t.last_seen ~= t.first_seen then
 _cw = _cw .. "\32\8212\32" .. os.date("\37\89\45\37\109\45\37\100", t.last_seen)
 end
 end
 _aw[#_aw + 1] = "\32\32" .. _bw .. "\32" .. t._i .. _cw
 end
 else
 _aw[#_aw + 1] = "\83\105\110\32\104\105\115\116\111\114\105\97\108\32\100\101\32\117\115\101\114\110\97\109\101\115\32\114\101\103\105\115\116\114\97\100\111\46"
 end
 if #_tv > 0 then
 _aw[#_aw + 1] = ""
 _aw[#_aw + 1] = "\67\97\109\98\105\111\115\32\100\101\116\101\99\116\97\100\111\115\32\101\110\116\114\101\32\115\110\97\112\115\104\111\116\115\58"
 for _, _xt in ipairs(_tv) do
 local o = (_xt._kgb == nil or _xt._kgb == "") and "\8212" or tostring(_xt._kgb)
 local n = (_xt.new == nil or _xt.new == "") and "\8212" or tostring(_xt.new)
 if type(_xt._kgb) == "\98\111\111\108\101\97\110" then o = _xt._kgb and "\115\237" or "\110\111" end
 if type(_xt.new) == "\98\111\111\108\101\97\110" then n = _xt.new and "\115\237" or "\110\111" end
 _aw[#_aw + 1] = "\32\32" .. _xt._se .. "\58\32" .. o .. "\32\8594\32" .. n
 end
 end
 local _k = I.getEntry(_ye)
 if _k and _k.snapshots and #_k.snapshots > 0 then
 local _dw = _k.snapshots[#_k.snapshots]
 _aw[#_aw + 1] = ""
 _aw[#_aw + 1] = "\82\101\99\111\108\101\99\99\105\243\110\58\32" .. os.date("\37\89\45\37\109\45\37\100\32\37\72\58\37\77", _dw.collected_at or 0)
 if _dw.sources then
 local _ew = {}
 for k, v in pairs(_dw.sources) do _ew[#_ew + 1] = k .. "\58\32" .. v end
 table.sort(_ew)
 _aw[#_aw + 1] = "\70\117\101\110\116\101\115\58\32" .. table.concat(_ew, "\32\183\32")
 end
 _aw[#_aw + 1] = "\83\110\97\112\115\104\111\116\115\32\97\108\109\97\99\101\110\97\100\111\115\58\32" .. #_k.snapshots
 end
 _aw[#_aw + 1] = ""
 _aw[#_aw + 1] = "\76\97\115\32\102\101\99\104\97\115\32\115\111\110\32\100\101\32\111\98\115\101\114\118\97\99\105\243\110\32\100\101\108\32\115\99\114\105\112\116\44\32\110\111\32\100\101\32\82\111\98\108\111\120\46"
 _x.Text = table.concat(_aw, "\10")
 end
 if _ye._namesCached ~= nil then
 actualizar(_ye._namesCached or nil)
 elseif _G.NXPlus and type(_G.NXPlus.nombres) == "\102\117\110\99\116\105\111\110" then
 _G.NXPlus.nombres(_ye, function(_gw)
 actualizar(_gw)
 end)
 else
 task.spawn(function()
 local _g, _gw = pcall(getNameHistory, _ye.UserId)
 _ye._namesCached = (_g and _gw) or false
 actualizar(_g and _gw or nil)
 end)
 end
 if _gj.enabled then
 _o.BackgroundTransparency = 1
 _xv.Transparency = 1
 h.TextTransparency = 1
 _x.TextTransparency = 1
 task.defer(function()
 if not _o.Parent then return end
 motionTween(_o, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { BackgroundTransparency = 0 })
 motionTween(_xv, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { Transparency = 0.4 })
 motionTween(h, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { TextTransparency = 0 })
 motionTween(_x, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { TextTransparency = 0 })
 end)
 end
 return _o
 end
 _G.NXIntel = I
end
local function staggerCards(_hw)
 if not _gj.enabled then return end
 local _fw = {}
 for _, _xt in ipairs(_hw:GetChildren()) do
 if _xt:IsA("\70\114\97\109\101") and not _xt:IsA("\85\73\76\105\115\116\76\97\121\111\117\116") then
 _fw[#_fw + 1] = _xt
 end
 end
 table.sort(_fw, function(a, b) return a.LayoutOrder < b.LayoutOrder end)
 for _cs, _o in ipairs(_fw) do
 local _iw = (_cs - 1) * 0.06
 local _jw = _o.BackgroundTransparency
 if _jw < 1 then
 _o.BackgroundTransparency = 1
 end
 local _kw = _o.Position.Y.Offset
 _o.Position = _o.Position + UDim2.fromOffset(0, 8)
 local _lw = {}
 for _, _xt in ipairs(_o:GetChildren()) do
 if _xt:IsA("\84\101\120\116\76\97\98\101\108") or _xt:IsA("\84\101\120\116\66\117\116\116\111\110") then
 _lw[#_lw + 1] = { _p = _xt, orig = _xt.TextTransparency }
 _xt.TextTransparency = 1
 end
 end
 task.delay(_iw, function()
 if not _o.Parent then return end
 motionTween(_o, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
 { Position = UDim2.new(_o.Position.X.Scale, _o.Position.X.Offset, _o.Position.Y.Scale, _kw),
 BackgroundTransparency = _jw })
 task.delay(0.05, function()
 for _, t in ipairs(_lw) do
 if t._p.Parent then
 motionTween(t._p, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { TextTransparency = t.orig })
 end
 end
 end)
 end)
 end
end
local function render(_ye, _mw)
 clearScroll(_km)
 clearScroll(_mm)
 clearScroll(_om)
 clearScroll(_qm)
 _mr = _ye
 if _G.NXOSINT and _G.NXOSINT.reset then pcall(_G.NXOSINT.reset) end
 if _G.NXIntel and _G.NXIntel.reset then pcall(_G.NXIntel.reset) end
 if #_j > 800 then
 local n = 0
 for i = 1, #_j do
 local e = _j[i]
 if e._p then n = n + 1; _j[n] = e end
 end
 for i = #_j, n + 1, -1 do _j[i] = nil end
 end
 if not _ye then return end
 if _gj.enabled and not _mw then
 for _, _dcb in ipairs({ _jm, _lm, _nm, _pm }) do
 if _dcb.Visible then
 local _lb = _dcb:FindFirstChild("\80\97\103\101\83\99\97\108\101")
 if not _lb then _lb = Instance.new("\85\73\83\99\97\108\101", _dcb); _lb.Name = "\80\97\103\101\83\99\97\108\101" end
 _lb.Scale = 0.98
 _dcb.Position = UDim2.new(0, 0, 0, 14)
 motionTween(_dcb, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
 { Position = UDim2.new(0, 0, 0, 0) })
 motionTween(_lb, TweenInfo.new(0.38, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { Scale = 1 })
 end
 end
 end
 local _n = _G.NXDS
 local _nw = _n.makeCard(_km, {_mb = 0})
 local _ow = Instance.new("\70\114\97\109\101", _nw)
 _ow.LayoutOrder = 10
 _ow.Size = UDim2.new(1, 0, 0, 110)
 _ow.AutomaticSize = Enum.AutomaticSize.Y
 _ow.BackgroundTransparency = 1
 local _cq = Instance.new("\73\109\97\103\101\66\117\116\116\111\110", _ow)
 _cq.Size = UDim2.new(0, 100, 0, 100)
 _cq.Position = UDim2.new(0, 0, 0, 0)
 _cq.BackgroundColor3 = C.elevated
 _cq.Image = _ye.AvatarUrl
 _cq.AutoButtonColor = false
 _cq.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _cq).CornerRadius = UDim.new(1, 0)
 themed(_cq, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 _cq.MouseButton1Click:Connect(function()
 showCharacterModal(_ye.UserId, _ye.Username)
 end)
 if _gj.enabled and not _mw then
 _cq.ImageTransparency = 1
 motionTween(_cq, TweenInfo.new(0.32, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { ImageTransparency = 0 })
 end
 local _pw = Instance.new("\70\114\97\109\101", _ow)
 _pw.Size = UDim2.new(1, -116, 0, 100)
 _pw.Position = UDim2.new(0, 116, 0, 0)
 _pw.BackgroundTransparency = 1
 local _qw = Instance.new("\84\101\120\116\76\97\98\101\108", _pw)
 _qw.Size = UDim2.new(1, 0, 0, 22)
 _qw.Position = UDim2.new(0, 0, 0, 4)
 _qw.BackgroundTransparency = 1
 _qw.Font = Enum.Font.GothamBold
 _qw.TextSize = _n._hb.xl
 _qw.TextColor3 = C._hb
 _qw.Text = _ye.DisplayName or _ye.Username
 _qw.TextXAlignment = Enum.TextXAlignment.Left
 _qw.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_qw, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _eq = Instance.new("\84\101\120\116\76\97\98\101\108", _pw)
 _eq.Size = UDim2.new(1, 0, 0, 16)
 _eq.Position = UDim2.new(0, 0, 0, 28)
 _eq.BackgroundTransparency = 1
 _eq.Font = Enum.Font.Gotham
 _eq.TextSize = _n._hb.md
 _eq.TextColor3 = C.subtext
 _eq.Text = "\64" .. (_ye.Username or "")
 _eq.TextXAlignment = Enum.TextXAlignment.Left
 _eq.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_eq, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _rw = Instance.new("\70\114\97\109\101", _pw)
 _rw.Size = UDim2.new(1, 0, 0, 16)
 _rw.Position = UDim2.new(0, 0, 0, 50)
 _rw.BackgroundTransparency = 1
 local _sw = Instance.new("\70\114\97\109\101", _rw)
 _sw.Size = UDim2.fromOffset(8, 8)
 _sw.Position = UDim2.new(0, 0, 0.5, -4)
 _sw.BackgroundColor3 = presenceColorFor(_ye.PresenceType)
 _sw.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _sw).CornerRadius = UDim.new(1, 0)
 local _tw = Instance.new("\84\101\120\116\76\97\98\101\108", _rw)
 _tw.Size = UDim2.new(1, -14, 1, 0)
 _tw.Position = UDim2.new(0, 14, 0, 0)
 _tw.BackgroundTransparency = 1
 _tw.Font = Enum.Font.Gotham
 _tw.TextSize = _n._hb.sm
 _tw.TextColor3 = presenceColorFor(_ye.PresenceType)
 _tw.Text = _ye.Presence or ""
 _tw.TextXAlignment = Enum.TextXAlignment.Left
 _tw.TextTruncate = Enum.TextTruncate.AtEnd
 local _uw = Instance.new("\70\114\97\109\101", _nw)
 _uw.LayoutOrder = 20
 _uw.Size = UDim2.new(1, 0, 0, 34)
 _uw.BackgroundTransparency = 1
 local _vw = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _uw)
 _vw.FillDirection = Enum.FillDirection.Horizontal
 _vw.Padding = UDim.new(0, 8)
 _vw.SortOrder = Enum.SortOrder.LayoutOrder
 _vw.VerticalAlignment = Enum.VerticalAlignment.Center
 _uw.ClipsDescendants = true
 local _ww = _n.makeButton(_uw, "\86\101\114\32\97\118\97\116\97\114", "\115\101\99\111\110\100\97\114\121", {_mb = 1, _mdb = UDim2.new(0.3, -8, 0, 28)})
 _ww.MouseButton1Click:Connect(function()
 showCharacterModal(_ye.UserId, _ye.Username)
 end)
 local _xw = _n.makeButton(_uw, "\65\98\114\105\114\32\112\101\114\102\105\108", "\115\101\99\111\110\100\97\114\121", {_mb = 2, _mdb = UDim2.new(0.35, -8, 0, 28)})
 _xw.MouseButton1Click:Connect(function()
 local _yw = openURL(_ye.ProfileUrl)
 if _yw then
 _gl.Text = "\80\101\114\102\105\108\32\97\98\105\101\114\116\111\32\101\110\32\101\108\32\110\97\118\101\103\97\100\111\114\46"
 else
 _gl.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\101\110\32\116\117\32\101\120\101\99\117\116\111\114\46"
 showLinkModal(_ye.ProfileUrl)
 end
 end)
 local _zw = _n.makeButton(_uw, "\67\111\112\105\97\114\32\108\105\110\107", "\112\114\105\109\97\114\121", {_mb = 3, _mdb = UDim2.new(0.35, -8, 0, 28)})
 _zw.MouseButton1Click:Connect(function()
 _fc(_ye.ProfileUrl)
 _gl.Text = "\76\105\110\107\32\100\101\108\32\112\101\114\102\105\108\32\99\111\112\105\97\100\111"
 _zw.Text = "\67\111\112\105\97\100\111\33"
 task.delay(1.2, function()
 if _zw and _zw.Parent then _zw.Text = "\67\111\112\105\97\114\32\108\105\110\107" end
 end)
 end)
 addShineHover(_ww)
 addShineHover(_xw)
 addShineHover(_zw)
 if _ye.PresenceType == 2 and _ye.PresencePlace and _ye.PresenceGame then
 _ww.Size = UDim2.new(0.25, -8, 0, 28)
 _xw.Size = UDim2.new(0.25, -8, 0, 28)
 _zw.Size = UDim2.new(0.25, -8, 0, 28)
 local _ax = _n.makeButton(_uw, "\85\110\105\114\115\101", "\112\114\105\109\97\114\121", {_mb = 4, _mdb = UDim2.new(0.25, -8, 0, 28)})
 _ax.BackgroundColor3 = C.good
 themed(_ax, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\103\111\111\100")
 _ax.MouseButton1Click:Connect(function()
 _gl.Text = "\73\110\116\101\110\116\97\110\100\111\32\117\110\105\114\115\101\46\46\46"
 local _bx = game:GetService("\84\101\108\101\112\111\114\116\83\101\114\118\105\99\101")
 local _g = pcall(function()
 _bx:TeleportToPlaceInstance(_ye.PresencePlace, _ye.PresenceGame, _a)
 end)
 if not _g then
 _gl.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\115\101\114\118\105\100\111\114\32\108\108\101\110\111\44\32\112\114\105\118\97\100\111\32\111\32\115\105\110\32\97\99\99\101\115\111\41\46"
 end
 end)
 end
 local _cx = Instance.new("\70\114\97\109\101", _nw)
 _cx.Name = "\78\88\84\97\103"
 _cx.LayoutOrder = 15
 _cx.Size = UDim2.new(0, 0, 0, 24)
 _cx.AutomaticSize = Enum.AutomaticSize.X
 _cx.BackgroundColor3 = C.elevated
 _cx.BackgroundTransparency = 1
 _cx.BorderSizePixel = 0
 _cx.Visible = false
 Instance.new("\85\73\67\111\114\110\101\114", _cx).CornerRadius = UDim.new(0, 12)
 themed(_cx, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 local _dx = Instance.new("\85\73\83\116\114\111\107\101", _cx)
 _dx.Thickness = 1; _dx.Transparency = 1
 local _ex = Instance.new("\85\73\80\97\100\100\105\110\103", _cx)
 _ex.PaddingLeft = UDim.new(0, 10); _ex.PaddingRight = UDim.new(0, 10)
 local _fx = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _cx)
 _fx.FillDirection = Enum.FillDirection.Horizontal
 _fx.VerticalAlignment = Enum.VerticalAlignment.Center
 _fx.HorizontalAlignment = Enum.HorizontalAlignment.Left
 _fx.SortOrder = Enum.SortOrder.LayoutOrder
 _fx.Padding = UDim.new(0, 6)
 local _gx = Instance.new("\73\109\97\103\101\76\97\98\101\108", _cx)
 _gx.Name = "\78\88\73\99\111\110"
 _gx.BackgroundTransparency = 1
 _gx.Size = UDim2.fromOffset(16, 16)
 _gx.LayoutOrder = 1
 _gx.Visible = false
 local _hx = Instance.new("\84\101\120\116\76\97\98\101\108", _cx)
 _hx.LayoutOrder = 2
 _hx.AutomaticSize = Enum.AutomaticSize.X
 _hx.Size = UDim2.new(0, 0, 1, 0)
 _hx.BackgroundTransparency = 1
 _hx.Font = Enum.Font.GothamBold
 _hx.TextSize = _n._hb.sm
 _hx.TextColor3 = C._hb
 _hx.Text = ""
 do
 local _ix = _ye.UserId
 local function applyTag(t)
 if not t or not _cx.Parent then return end
 if _mr == nil or _mr.UserId ~= _ix then return end
 local _jx  = _G.NXV2 and _G.NXV2.image
 local _md = t._jhb and _jx and _jx.normalize(t._jhb)
 if _md and _jx.usable(_md) then
 _gx.Image = _md; _gx.Visible = true
 _hx.Text = t._kib
 _jx.preload(_md)
 task.spawn(function()
 local n = 0
 while n < 50 and _jx.usable(_md) and not _gx.IsLoaded do task.wait(0.1); n = n + 1 end
 if (not _jx.usable(_md)) and _mr and _mr.UserId == _ix then
 _gx.Visible = false
 _hx.Text = ((t._nd ~= "" and (t._nd .. "\32")) or "") .. t._kib
 end
 end)
 else
 _gx.Visible = false
 _hx.Text = ((t._nd ~= "" and (t._nd .. "\32")) or "") .. t._kib
 end
 _hx.TextColor3 = t._xb
 _dx.Color = t._xb
 _dx.Transparency = 0.3
 _cx.BackgroundTransparency = 0.1
 _cx.Visible = true
 end
 local _nv = getNXTag(_ye.UserId)
 if _nv then
 applyTag(_nv)
 else
 local function reintentar()
 if _mr == nil or _mr.UserId ~= _ix then return end
 if not _cx.Parent then return end
 applyTag(getNXTag(_ix))
 end
 _G.NXTagKit.alCargarLegacy(reintentar)
 if _G.NXV2 and _G.NXV2.onReady then _G.NXV2.onReady(reintentar) end
 end
 end
 local _kx = _n.makeCard(_km, {_mb = 1, _lk = "\73\100\101\110\116\105\100\97\100"})
 _n.makeDataRow(_kx, "\85\115\101\114\110\97\109\101", _ye.Username, {_mb = 1, _lp = true})
 _n.makeDataRow(_kx, "\68\105\115\112\108\97\121\32\78\97\109\101", _ye.DisplayName, {_mb = 2})
 _n.makeDataRow(_kx, "\85\115\101\114\73\100", tostring(_ye.UserId), {_mb = 3, _lp = true})
 _n.makeDataRow(_kx, "\83\117\115\99\114\105\112\99\105\243\110", _ye.Subscription or "\8212", {_mb = 4})
 _n.makeDataRow(_kx, "\66\97\110\101\97\100\111", _ye.Banned or "\78\111",
 {_mb = 5, _mp = (_ye.Banned == "\83\237") and C.bad or nil})
 _n.makeDataRow(_kx, "\67\114\101\97\99\105\243\110", _ye.Created or "\8212", {_mb = 6})
 _n.makeDataRow(_kx, "\69\100\97\100\32\100\101\32\99\117\101\110\116\97", _ye.AccountAge or "\8212", {_mb = 7})
 local _lx = Instance.new("\70\114\97\109\101", _kx)
 _lx.LayoutOrder = 8
 _lx.Size = UDim2.new(1, 0, 0, 28)
 _lx.BackgroundTransparency = 1
 local _mx = Instance.new("\84\101\120\116\66\111\120", _lx)
 _mx.Size = UDim2.new(1, 0, 1, 0)
 _mx.BackgroundColor3 = C.link
 _mx.BackgroundTransparency = 0.5
 _mx.Font = Enum.Font.Code
 _mx.TextSize = 11
 _mx.TextColor3 = C._idb
 _mx.Text = _ye.ProfileUrl
 _mx.ClearTextOnFocus = false
 _mx.TextEditable = false
 _mx.TextXAlignment = Enum.TextXAlignment.Left
 _mx.TextTruncate = Enum.TextTruncate.AtEnd
 _mx.BorderSizePixel = 0
 themed(_mx, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\108\105\110\107")
 themed(_mx, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _mx).CornerRadius = _n.corner.sm
 local _nx = Instance.new("\85\73\80\97\100\100\105\110\103", _mx)
 _nx.PaddingLeft = UDim.new(0, 8); _nx.PaddingRight = UDim.new(0, 8)
 addDescription(_km, _ye.Description).LayoutOrder = 2
 local _ox = _n.makeCard(_km, {_mb = 15, _lk = "\72\105\115\116\111\114\105\97\108\32\100\101\32\110\111\109\98\114\101\115"})
 _ox.Name = "\78\97\109\101\72\105\115\116\111\114\121"
 local _px = Instance.new("\84\101\120\116\76\97\98\101\108", _ox)
 _px.LayoutOrder = 5
 _px.Size = UDim2.new(1, 0, 0, 18)
 _px.BackgroundTransparency = 1
 _px.Font = Enum.Font.Gotham
 _px.TextSize = _n._hb.sm
 _px.TextColor3 = C.subtext
 _px.Text = "\67\97\114\103\97\110\100\111\46\46\46"
 _px.TextXAlignment = Enum.TextXAlignment.Left
 themed(_px, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _qx = _ye.UserId
 local function conNombres(_em)
 if _ye._namesCached ~= nil then
 _em(_ye._namesCached or nil, _ye._namesHasMore or false)
 return
 end
 local _rx
 pcall(function()
 if _G.NXPlus and type(_G.NXPlus.nombres) == "\102\117\110\99\116\105\111\110" then
 _rx = _G.NXPlus.nombres
 end
 end)
 if _rx then _rx(_ye, _em); return end
 task.spawn(function()
 local _sx, _xh = getNameHistory(_ye.UserId)
 _ye._namesCached = _sx or false
 _ye._namesHasMore = _xh or false
 _em(_sx, _xh)
 end)
 end
 conNombres(function(_sx, _xh)
 if _mr == nil or _mr.UserId ~= _qx then return end
 if not _ox.Parent then return end
 if _px and _px.Parent then _px:Destroy() end
 if not _sx then
 local _kr = Instance.new("\84\101\120\116\76\97\98\101\108", _ox)
 _kr.LayoutOrder = 10
 _kr.Size = UDim2.new(1, 0, 0, 18)
 _kr.BackgroundTransparency = 1
 _kr.Font = Enum.Font.Gotham
 _kr.TextSize = _n._hb.sm
 _kr.TextColor3 = C.bad
 _kr.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46"
 _kr.TextXAlignment = Enum.TextXAlignment.Left
 return
 end
 local _tx = Instance.new("\70\114\97\109\101", _ox)
 _tx.LayoutOrder = 10
 _tx.Size = UDim2.new(1, 0, 0, 24)
 _tx.BackgroundColor3 = C._idb
 _tx.BackgroundTransparency = 0.85
 _tx.BorderSizePixel = 0
 _tx.ClipsDescendants = true
 Instance.new("\85\73\67\111\114\110\101\114", _tx).CornerRadius = _n.corner.sm
 local _ux = Instance.new("\84\101\120\116\76\97\98\101\108", _tx)
 _ux.Size = UDim2.new(1, -10, 1, 0)
 _ux.Position = UDim2.new(0, 5, 0, 0)
 _ux.BackgroundTransparency = 1
 _ux.Font = Enum.Font.GothamBold
 _ux.TextSize = _n._hb.md
 _ux.TextColor3 = C._hb
 _ux.Text = "\65\99\116\117\97\108\58\32" .. _ye.Username
 _ux.TextXAlignment = Enum.TextXAlignment.Left
 _ux.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_ux, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 if #_sx > 0 then
 local _vx = Instance.new("\84\101\120\116\76\97\98\101\108", _ox)
 _vx.LayoutOrder = 11
 _vx.Size = UDim2.new(1, 0, 0, 18)
 _vx.BackgroundTransparency = 1
 _vx.Font = Enum.Font.Gotham
 _vx.TextSize = _n._hb.sm
 _vx.TextColor3 = C.subtext
 _vx.Text = "\78\111\109\98\114\101\115\32\97\110\116\101\114\105\111\114\101\115\32\40" .. #_sx .. "\41\58"
 _vx.TextXAlignment = Enum.TextXAlignment.Left
 themed(_vx, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 for i, _i in ipairs(_sx) do
 local _k = Instance.new("\70\114\97\109\101", _ox)
 _k.LayoutOrder = 11 + i
 _k.Size = UDim2.new(1, 0, 0, 18)
 _k.BackgroundTransparency = 1
 _k.ClipsDescendants = true
 local _wx = Instance.new("\84\101\120\116\76\97\98\101\108", _k)
 _wx.Size = UDim2.new(1, -10, 1, 0)
 _wx.Position = UDim2.new(0, 5, 0, 0)
 _wx.BackgroundTransparency = 1
 _wx.Font = Enum.Font.Gotham
 _wx.TextSize = _n._hb.sm
 _wx.TextColor3 = C._hb
 _wx.Text = "\8226\32" .. _i
 _wx.TextXAlignment = Enum.TextXAlignment.Left
 _wx.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_wx, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 end
 if _xh then
 local _xx = Instance.new("\84\101\120\116\76\97\98\101\108", _ox)
 _xx.LayoutOrder = 100 + #_sx
 _xx.Size = UDim2.new(1, 0, 0, 16)
 _xx.BackgroundTransparency = 1
 _xx.Font = Enum.Font.Gotham
 _xx.TextSize = _n._hb.xs
 _xx.TextColor3 = C.textDisabled
 _xx.Text = "\72\97\121\32\109\225\115\32\110\111\109\98\114\101\115\32\40\115\111\108\111\32\115\101\32\109\117\101\115\116\114\97\110\32\108\111\115\32\112\114\105\109\101\114\111\115\32\49\48\48\48\41\46"
 _xx.TextXAlignment = Enum.TextXAlignment.Left
 themed(_xx, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116\68\105\115\97\98\108\101\100")
 end
 else
 local _lr = Instance.new("\84\101\120\116\76\97\98\101\108", _ox)
 _lr.LayoutOrder = 11
 _lr.Size = UDim2.new(1, 0, 0, 18)
 _lr.BackgroundTransparency = 1
 _lr.Font = Enum.Font.Gotham
 _lr.TextSize = _n._hb.sm
 _lr.TextColor3 = C.subtext
 _lr.Text = "\83\105\110\32\110\111\109\98\114\101\115\32\97\110\116\101\114\105\111\114\101\115\46"
 _lr.TextXAlignment = Enum.TextXAlignment.Left
 themed(_lr, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 end)
 local _yx = _n.makeCard(_mm, {_mb = 0, _lk = "\69\115\116\97\100\237\115\116\105\99\97\115"})
 _n.makeDataRow(_yx, "\65\109\105\103\111\115", tostring(_ye.Friends or "\8212"), {_mb = 1})
 addFriendsDropdown(_mm, _ye, 5)
 _n.makeDataRow(_yx, "\83\101\103\117\105\100\111\114\101\115", tostring(_ye.Followers or "\8212"), {_mb = 2})
 _n.makeDataRow(_yx, "\83\105\103\117\105\101\110\100\111", tostring(_ye.Following or "\8212"), {_mb = 3})
 _n.makeDataRow(_yx, "\71\114\117\112\111\115", tostring(_ye.Groups or "\8212"), {_mb = 4})
 _n.makeDataRow(_yx, "\66\97\100\103\101\115", tostring(_ye.Badges or "\8212"), {_mb = 5})
 _n.makeDataRow(_yx, "\70\97\118\111\114\105\116\111\115", tostring(_ye.Favorites or "\8212"), {_mb = 6})
 _n.makeDataRow(_yx, "\69\120\112\101\114\105\101\110\99\105\97\115\32\99\114\101\97\100\97\115", tostring(_ye.CreatedGames or "\8212"), {_mb = 7})
 local _zx = Instance.new("\70\114\97\109\101", _mm)
 _zx.LayoutOrder = 50
 _zx.Size = UDim2.new(1, 0, 0, 32)
 _zx.BackgroundTransparency = 1
 local _ay = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _zx)
 _ay.FillDirection = Enum.FillDirection.Horizontal
 _ay.Padding = UDim.new(0, 8)
 _ay.SortOrder = Enum.SortOrder.LayoutOrder
 local function mkBtn(_hb, _by)
 return _n.makeButton(_zx, _hb, "\115\101\99\111\110\100\97\114\121", {_mb = _by})
 end
 local _mb = {
 {"\85\115\101\114\110\97\109\101","\85\115\101\114\110\97\109\101"},{"\68\105\115\112\108\97\121\32\78\97\109\101","\68\105\115\112\108\97\121\78\97\109\101"},{"\85\115\101\114\73\100","\85\115\101\114\73\100"},{"\76\105\110\107","\80\114\111\102\105\108\101\85\114\108"},
 {"\83\117\115\99\114\105\112\99\105\243\110","\83\117\98\115\99\114\105\112\116\105\111\110"},{"\69\115\116\97\100\111","\80\114\101\115\101\110\99\101"},{"\86\101\114\105\102\105\99\97\100\111","\86\101\114\105\102\105\101\100"},{"\66\97\110\101\97\100\111","\66\97\110\110\101\100"},
 {"\67\114\101\97\99\105\243\110","\67\114\101\97\116\101\100"},{"\69\100\97\100\32\100\101\32\99\117\101\110\116\97","\65\99\99\111\117\110\116\65\103\101"},{"\68\101\115\99\114\105\112\99\105\243\110","\68\101\115\99\114\105\112\116\105\111\110"},
 {"\65\109\105\103\111\115","\70\114\105\101\110\100\115"},{"\83\101\103\117\105\100\111\114\101\115","\70\111\108\108\111\119\101\114\115"},{"\83\105\103\117\105\101\110\100\111","\70\111\108\108\111\119\105\110\103"},
 {"\71\114\117\112\111\115","\71\114\111\117\112\115"},{"\66\97\100\103\101\115","\66\97\100\103\101\115"},{"\70\97\118\111\114\105\116\111\115","\70\97\118\111\114\105\116\101\115"},
 {"\69\120\112\101\114\105\101\110\99\105\97\115\32\99\114\101\97\100\97\115","\67\114\101\97\116\101\100\71\97\109\101\115"},
 }
 local function buildTxtLines()
 local _aw = {}
 for _, pair in ipairs(_mb) do
 table.insert(_aw, pair[1] .. "\58\32" .. tostring(_ye[pair[2]] == nil and "\78\111\32\100\105\115\112\111\110\105\98\108\101" or _ye[pair[2]]))
 end
 if type(_ye._namesCached) == "\116\97\98\108\101" and #_ye._namesCached > 0 then
 local _cy = _ye._namesHasMore and "\32\40\121\32\109\225\115\41" or ""
 _aw[#_aw+1] = "\78\111\109\98\114\101\115\32\97\110\116\101\114\105\111\114\101\115\58\32" .. table.concat(_ye._namesCached, "\44\32") .. _cy
 elseif _ye._namesCached == false then
 _aw[#_aw+1] = "\78\111\109\98\114\101\115\32\97\110\116\101\114\105\111\114\101\115\58\32\110\111\32\100\105\115\112\111\110\105\98\108\101"
 else
 _aw[#_aw+1] = "\78\111\109\98\114\101\115\32\97\110\116\101\114\105\111\114\101\115\58\32\110\105\110\103\117\110\111"
 end
 return _aw
 end
 local function buildExportData()
 local _fe = {}
 for k, v in pairs(_ye) do
 if type(k) ~= "\115\116\114\105\110\103" or k:_is(1, 1) ~= "\95" then
 _fe[k] = v
 end
 end
 _fe.NombresAnteriores = (type(_ye._namesCached) == "\116\97\98\108\101") and _ye._namesCached or {}
 return _fe
 end
 local function withNames(_fy, _gy)
 if _ye._namesCached ~= nil then
 _gy()
 return
 end
 _gl.Text = _fy
 local _dy = _ye.UserId
 task.spawn(function()
 local _sx, _xh = getNameHistory(_ye.UserId)
 _ye._namesCached = _sx or false
 _ye._namesHasMore = _xh or false
 if _mr and _mr.UserId ~= _dy then return end
 _gy()
 end)
 end
 local function flashBtn(_gb, _le)
 local _qe = _gb.Text
 _gb.Text = _le
 task.delay(1.1, function()
 if _gb and _gb.Parent then _gb.Text = _qe end
 end)
 end
 local _ey = mkBtn("\67\111\112\105\97\114\32\84\88\84", 1)
 _ey.MouseButton1Click:Connect(function()
 withNames("\80\114\101\112\97\114\97\110\100\111\32\84\88\84\32\40\104\105\115\116\111\114\105\97\108\32\100\101\32\110\111\109\98\114\101\115\41\46\46\46", function()
 local _g = pcall(function() _fc(table.concat(buildTxtLines(), "\10")) end)
 if _g then
 _gl.Text = "\10003\32\67\111\112\105\97\100\111\32\97\32\112\111\114\116\97\112\97\112\101\108\101\115\32\40\84\88\84\41"
 flashBtn(_ey, "\67\111\112\105\97\100\111\32\10003")
 else
 _gl.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\116\117\32\101\120\101\99\117\116\111\114\32\110\111\32\100\97\32\97\99\99\101\115\111\32\97\108\32\112\111\114\116\97\112\97\112\101\108\101\115\41\46"
 flashBtn(_ey, "\69\114\114\111\114")
 end
 end)
 end)
 local _hy = mkBtn("\67\111\112\105\97\114\32\74\83\79\78", 2)
 _hy.MouseButton1Click:Connect(function()
 withNames("\80\114\101\112\97\114\97\110\100\111\32\74\83\79\78\32\40\104\105\115\116\111\114\105\97\108\32\100\101\32\110\111\109\98\114\101\115\41\46\46\46", function()
 local _g = pcall(function() _fc(HttpService:JSONEncode(buildExportData())) end)
 if _g then
 _gl.Text = "\10003\32\67\111\112\105\97\100\111\32\97\32\112\111\114\116\97\112\97\112\101\108\101\115\32\40\74\83\79\78\41"
 flashBtn(_hy, "\67\111\112\105\97\100\111\32\10003")
 else
 _gl.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\116\117\32\101\120\101\99\117\116\111\114\32\110\111\32\100\97\32\97\99\99\101\115\111\32\97\108\32\112\111\114\116\97\112\97\112\101\108\101\115\41\46"
 flashBtn(_hy, "\69\114\114\111\114")
 end
 end)
 end)
 local _iy = addNoteCard(_om, "\80\114\101\99\105\111\32\100\101\108\32\97\118\97\116\97\114", "\67\97\108\99\117\108\97\110\100\111\46\46\46", C.good)
 _iy.LayoutOrder = 1
 local _jy = addNoteCard(_om, "\73\116\101\109\115\32\101\113\117\105\112\97\100\111\115", "\67\97\114\103\97\110\100\111\46\46\46", C._idb)
 _jy.LayoutOrder = 2
 local _ky = addNoteCard(_om, "\71\114\117\112\111\115", "\67\97\114\103\97\110\100\111\46\46\46", C._idb)
 _ky.LayoutOrder = 3
 local _ly = addNoteCard(_om, "\66\97\100\103\101\115\32\114\101\99\105\101\110\116\101\115", "\67\97\114\103\97\110\100\111\46\46\46", C._idb)
 _ly.LayoutOrder = 4
 local _my = addNoteCard(_om, "\82\65\80\32\40\118\97\108\111\114\32\108\105\109\105\116\101\100\115\41",
 "\67\111\110\115\117\108\116\97\110\100\111\32\82\111\108\105\109\111\110\39\115\32\40\119\101\98\32\101\120\116\101\114\110\97\41\46\46\46", C.warn)
 _my.LayoutOrder = 5
 local function bodyOf(_o)
 for _, _xt in ipairs(_o:GetChildren()) do
 if _xt:IsA("\84\101\120\116\76\97\98\101\108") and _xt.LayoutOrder == 10 then return _xt end
 end
 end
 local _ny = _ye.UserId
 task.spawn(function()
 local _tf, _uf
 if _ye._itemsCached ~= nil then
 _tf = _ye._itemsCached or nil
 _uf = _ye._itemsTotalCached or 0
 else
 _tf, _uf = getWornItems(_ye.UserId)
 _ye._itemsCached = _tf or false
 _ye._itemsTotalCached = _uf or 0
 end
 if _mr == nil or _mr.UserId ~= _ny then return end
 if not _jy.Parent then return end
 local b = bodyOf(_jy)
 local _oy = bodyOf(_iy)
 if not _tf then
 if b then b.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46" end
 if _oy then _oy.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46" end
 return
 end
 if #_tf == 0 then
 if b then b.Text = "\78\111\32\108\108\101\118\97\32\105\116\101\109\115\32\101\113\117\105\112\97\100\111\115\46" end
 if _oy then _oy.Text = "\48\32\82\36\32\40\115\105\110\32\105\116\101\109\115\32\99\111\110\32\112\114\101\99\105\111\41\46" end
 return
 end
 if _oy then
 _oy.Text = "\8776\32" .. tostring(_uf) .. "\32\82\36\32\101\110\32\116\111\116\97\108\10"
 .. "\40\83\117\109\97\32\100\101\108\32\112\114\101\99\105\111\32\100\101\32\99\97\116\225\108\111\103\111\32\100\101\32\108\111\32\101\113\117\105\112\97\100\111\46\32\65\112\114\111\120\105\109\97\100\111\58\32"
 .. "\108\111\115\32\105\116\101\109\115\32\103\114\97\116\105\115\32\111\32\115\105\110\32\112\114\101\99\105\111\32\99\117\101\110\116\97\110\32\99\111\109\111\32\48\46\41"
 end
 local _sx = {}
 for _, _ge in ipairs(_tf) do
 local _py = (_ge.price and _ge.price > 0) and ("\32\8212\32" .. _ge.price .. "\32\82\36") or ""
 table.insert(_sx, "\8226\32" .. (_ge._i or ("\65\115\115\101\116\32" .. _ge._hd)) .. _py)
 end
 if b then b.Text = #_tf .. "\32\105\116\101\109\40\115\41\58\10" .. table.concat(_sx, "\10") end
 local _qy = Instance.new("\70\114\97\109\101", _jy)
 _qy.LayoutOrder = 2
 _qy.Size = UDim2.new(1, 0, 0, 0)
 _qy.AutomaticSize = Enum.AutomaticSize.Y
 _qy.BackgroundTransparency = 1
 local _ry = Instance.new("\85\73\71\114\105\100\76\97\121\111\117\116", _qy)
 _ry.CellSize = UDim2.new(0, 56, 0, 56)
 _ry.CellPadding = UDim2.new(0, 6, 0, 6)
 for _, _ge in ipairs(_tf) do
 local _sy = Instance.new("\73\109\97\103\101\76\97\98\101\108", _qy)
 _sy.Size = UDim2.new(0, 56, 0, 56)
 _sy.BackgroundColor3 = C.surface
 _sy.BorderSizePixel = 0
 _sy.Image = ("\114\98\120\116\104\117\109\98\58\47\47\116\121\112\101\61\65\115\115\101\116\38\105\100\61\37\100\38\119\61\49\53\48\38\104\61\49\53\48"):format(_ge._hd)
 Instance.new("\85\73\67\111\114\110\101\114", _sy).CornerRadius = UDim.new(0, 6)
 end
 end)
 task.spawn(function()
 local _bg
 if _ye._groupsCached ~= nil then
 _bg = _ye._groupsCached or nil
 else
 _bg = getGroupsDetailed(_ye.UserId)
 _ye._groupsCached = _bg or false
 end
 if _mr == nil or _mr.UserId ~= _ny then return end
 if not _ky.Parent then return end
 local b = bodyOf(_ky); if not b then return end
 if not _bg then b.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46" ; return end
 local _ty = 0
 if _zd.flags._ye then
 _bg, _ty = _zd.valid._yf(_bg, _zd.shape.group)
 end
 if #_bg == 0 then
 b.Text = (_ty > 0)
 and ("\83\105\110\32\103\114\117\112\111\115\32\118\225\108\105\100\111\115\32\40" .. _ty .. "\32\101\110\116\114\97\100\97\40\115\41\32\100\101\115\99\97\114\116\97\100\97\40\115\41\32\112\111\114\32\100\97\116\111\115\32\99\111\114\114\117\112\116\111\115\41\46")
 or  "\78\111\32\101\115\116\225\32\101\110\32\110\105\110\103\250\110\32\103\114\117\112\111\46"
 return
 end
 local _aw = {}
 for _, g in ipairs(_bg) do
 table.insert(_aw, "\8226\32" .. g._i .. "\32\32\8212\32\32" .. g._r)
 end
 b.Text = #_bg .. "\32\103\114\117\112\111\40\115\41\58\10" .. table.concat(_aw, "\10")
 .. ((_ty > 0) and ("\10" .. _ty .. "\32\101\110\116\114\97\100\97\40\115\41\32\100\101\115\99\97\114\116\97\100\97\40\115\41\32\112\111\114\32\78\88\32\83\104\105\101\108\100\115\46") or "")
 end)
 task.spawn(function()
 local _cg
 if _ye._badgesCached ~= nil then
 _cg = _ye._badgesCached or nil
 else
 _cg = getRecentBadges(_ye.UserId, 12)
 _ye._badgesCached = _cg or false
 end
 if _mr == nil or _mr.UserId ~= _ny then return end
 if not _ly.Parent then return end
 local b = bodyOf(_ly); if not b then return end
 if not _cg then b.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46" ; return end
 local _ty = 0
 if _zd.flags._ye then
 _cg, _ty = _zd.valid._yf(_cg, _zd.shape.badge)
 end
 if #_cg == 0 then
 b.Text = (_ty > 0)
 and ("\83\105\110\32\98\97\100\103\101\115\32\118\225\108\105\100\111\115\32\40" .. _ty .. "\32\100\101\115\99\97\114\116\97\100\111\40\115\41\32\112\111\114\32\100\97\116\111\115\32\99\111\114\114\117\112\116\111\115\41\46")
 or  "\83\105\110\32\98\97\100\103\101\115\32\114\101\99\105\101\110\116\101\115\46"
 return
 end
 local _aw = {}
 for _, _bab in ipairs(_cg) do table.insert(_aw, "\8226\32" .. _bab._i) end
 b.Text = "\218\108\116\105\109\111\115\32" .. #_cg .. "\58\10" .. table.concat(_aw, "\10")
 .. ((_ty > 0) and ("\10" .. _ty .. "\32\100\101\115\99\97\114\116\97\100\111\40\115\41\32\112\111\114\32\78\88\32\83\104\105\101\108\100\115\46") or "")
 end)
 local function withRAP(_em)
 if _ye._rapCached ~= nil then
 _em(_ye._rapCached or nil)
 return
 end
 _ye._rapWaiters = _ye._rapWaiters or {}
 table.insert(_ye._rapWaiters, _em)
 if _ye._rapInflight then return end
 _ye._rapInflight = true
 task.spawn(function()
 local _ug, motivo = getRAP(_ye.UserId)
 _ye._rapMotivo = motivo
 local _eb = _ug and tonumber(_ug._ug) or nil
 if _zd.flags._ye and _eb ~= nil and (_eb < 0 or _eb ~= math.floor(_eb)) then
 _eb = nil
 end
 _ye._rapCached  = _eb or false
 _ye._rapInflight = false
 local _uy = _ye._rapWaiters or {}
 _ye._rapWaiters = nil
 for _, _s in ipairs(_uy) do pcall(_s, _eb) end
 end)
 end
 task.spawn(function()
 local _vy
 do
 local _wy, _zf = false, nil
 withRAP(function(v) _wy, _zf = true, v end)
 while not _wy do task.wait(0.05) end
 _vy = _zf
 end
 if _mr == nil or _mr.UserId ~= _ny then return end
 local b = bodyOf(_my); if not b then return end
 if not _vy or _vy <= 0 then
 local m = _ye._rapMotivo
 if m == "\109\111\118\105\100\97" then
 b.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\183\32\82\111\108\105\109\111\110\39\115\32\114\101\116\105\114\243\32\115\117\32\65\80\73\32\112\250\98\108\105\99\97\46"
 elseif m == "\115\105\110\95\114\101\115\112\117\101\115\116\97" then
 b.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\183\32\108\97\32\102\117\101\110\116\101\32\101\120\116\101\114\110\97\32\110\111\32\114\101\115\112\111\110\100\105\243\46"
 else
 b.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\183\32\115\105\110\32\108\105\109\105\116\101\100\115\32\111\32\115\105\110\32\118\97\108\111\114\32\112\117\98\108\105\99\97\100\111\46"
 end
 return
 end
 b.Text = "\82\65\80\32\101\115\116\105\109\97\100\111\58\32" .. tostring(_vy) .. "\32\82\36\10\40\70\117\101\110\116\101\58\32\82\111\108\105\109\111\110\39\115\44\32\118\97\108\111\114\32\97\112\114\111\120\105\109\97\100\111\44\32\78\79\32\111\102\105\99\105\97\108\46\41"
 end)
 do
 local _v = _ye._state or "\118\101\114\105\102\105\101\100"
 local _xy = {
 _fg   = { "\68\97\116\111\115\32\118\101\114\105\102\105\99\97\100\111\115",     C.good, "\84\111\100\97\115\32\108\97\115\32\114\101\115\112\117\101\115\116\97\115\32\112\97\115\97\114\111\110\32\108\97\32\118\97\108\105\100\97\99\105\243\110\46" },
 partial    = { "\68\97\116\111\115\32\112\97\114\99\105\97\108\101\115",       C.warn, "\65\108\103\117\110\97\115\32\99\111\110\115\117\108\116\97\115\32\110\111\32\114\101\115\112\111\110\100\105\101\114\111\110\46\32\76\111\32\113\117\101\32\102\97\108\116\97\32\97\112\97\114\101\99\101\32\99\111\109\111\32\34\78\111\32\100\105\115\112\111\110\105\98\108\101\34\46" },
 incomplete = { "\68\97\116\111\115\32\105\110\99\111\109\112\108\101\116\111\115",     C.warn, "\70\97\108\116\97\110\32\99\97\109\112\111\115\32\99\108\97\118\101\32\100\101\108\32\112\101\114\102\105\108\46" },
 error      = { "\68\97\116\111\115\32\110\111\32\118\101\114\105\102\105\99\97\98\108\101\115", C.bad,  "\80\97\114\116\101\32\100\101\32\108\97\32\114\101\115\112\117\101\115\116\97\32\110\111\32\112\97\115\243\32\108\97\32\118\97\108\105\100\97\99\105\243\110\32\121\32\110\111\32\115\101\32\109\117\101\115\116\114\97\46" },
 }
 local e = _xy[_v] or _xy._fg
 if _v ~= "\118\101\114\105\102\105\101\100" or _zd.adv() then
 local _as = e[3]
 if _zd.adv() then
 local _yy = _zd.problemas(_ye)
 if #_yy > 0 then
 _as = _as .. "\10\10\68\101\116\97\108\108\101\58\10\8226\32" .. table.concat(_yy, "\10\8226\32")
 end
 if _ye._timedOut then
 _as = _as .. "\10\10\65\108\103\117\110\97\32\99\111\110\115\117\108\116\97\32\115\117\112\101\114\243\32\101\108\32\116\105\101\109\112\111\32\108\237\109\105\116\101\32\100\101\32\49\53\32\115\46"
 end
 if not _zd.flags._wd or not _zd.flags._ye then
 local _zy = {}
 if not _zd.flags._wd  then _zy[#_zy + 1] = "\86\101\114\105\102\105\99\97\99\105\243\110\32\65\80\73" end
 if not _zd.flags._ye then _zy[#_zy + 1] = "\86\97\108\105\100\97\99\105\243\110\32\100\101\32\100\97\116\111\115" end
 _as = _as .. "\10\10\80\114\111\116\101\99\99\105\243\110\32\100\101\115\97\99\116\105\118\97\100\97\58\32" .. table.concat(_zy, "\32\183\32")
 .. "\46\32\76\111\115\32\100\97\116\111\115\32\115\101\32\109\117\101\115\116\114\97\110\32\115\105\110\32\99\97\112\97\32\100\101\32\118\101\114\105\102\105\99\97\99\105\243\110\46"
 end
 end
 addNoteCard(_qm, e[1], _as, e[2]).LayoutOrder = 7
 end
 end
 do
 local _az = _G.NXDecoder
 if _az then
 local function _feb(_i)
 return _i:_is(1, 1):upper() .. _i:_is(2)
 end
 local function fmtOne(_mc)
 local _aw = {}
 if #_mc._au > 0 then
 _aw[#_aw + 1] = "\83\117\115\116\105\116\117\99\105\111\110\101\115\58\32" .. table.concat(_mc._au, "\44\32")
 end
 if #_mc._tm == 0 then
 _aw[#_aw + 1] = "\83\105\110\32\100\97\116\111\115\32\115\117\102\105\99\105\101\110\116\101\115\32\112\97\114\97\32\105\110\102\101\114\105\114\32\117\110\32\110\111\109\98\114\101\46"
 else
 _aw[#_aw + 1] = "\80\111\115\105\98\108\101\115\32\110\111\109\98\114\101\115\58"
 for i, c in ipairs(_mc._tm) do
 _aw[#_aw + 1] = string.format("\32\32\37\100\46\32\37\115\32\8212\32\37\115", i, _feb(c._i), c._wg)
 end
 end
 if _mc.compound then
 _aw[#_aw + 1] = string.format("\78\111\109\98\114\101\43\65\112\101\108\108\105\100\111\58\32\37\115\32\37\115\32\40\115\99\111\114\101\32\37\100\41",
 _feb(_mc.compound._vt), _feb(_mc.compound.second), _mc.compound._vb)
 end
 if _mc.yearGuess then
 _aw[#_aw + 1] = "\80\111\115\105\98\108\101\32\97\241\111\32\100\101\32\110\97\99\105\109\105\101\110\116\111\58\32" .. tostring(_mc.yearGuess)
 end
 return table.concat(_aw, "\10")
 end
 local _gt = _az._el(_ye.Username)
 local function buildBody(_bz)
 local _du = { "\85\115\101\114\110\97\109\101\58\32" .. tostring(_ye.Username), fmtOne(_gt) }
 if _bz and #_bz > 0 then
 _du[#_du + 1] = "\10\78\111\109\98\114\101\115\32\112\114\101\118\105\111\115\32\40\104\105\115\116\111\114\105\97\108\41\58\10" .. table.concat(_bz, "\10")
 end
 _du[#_du + 1] = "\10\9888\32\69\115\32\117\110\97\32\73\78\70\69\82\69\78\67\73\65\32\115\111\98\114\101\32\116\101\120\116\111\32\112\250\98\108\105\99\111\44\32\78\79\32\117\110\97\32\105\100\101\110\116\105\100\97\100\32\99\111\110\102\105\114\109\97\100\97\46"
 return table.concat(_du, "\10")
 end
 local _cz = (_gt._tm[1] and _gt._tm[1]._wg) or "\73\110\115\117\102\105\99\105\101\110\116\101"
 local _dz = (_cz == "\65\108\116\97") and C.good
 or ((_cz == "\77\101\100\105\97") and C._idb or C.subtext)
 local _ez = addNoteCard(_qm, "\9656\32\85\115\101\114\110\97\109\101\32\68\101\99\111\100\101\114", buildBody(nil), _dz)
 _ez.LayoutOrder = 1
 if _G.NXPlus and type(_G.NXPlus.nombres) == "\102\117\110\99\116\105\111\110" then
 local _fz = _ye.UserId
 _G.NXPlus.nombres(_ye, function(_gw)
 if _mr == nil or _mr.UserId ~= _fz then return end
 if not _ez.Parent then return end
 local _gz
 for _, _xt in ipairs(_ez:GetChildren()) do
 if _xt:IsA("\84\101\120\116\76\97\98\101\108") and _xt.LayoutOrder == 10 then _gz = _xt end
 end
 if not _gz then return end
 local _cy, shown = {}, 0
 for _, prevName in ipairs(_gw or {}) do
 if prevName ~= _ye.Username and shown < 6 then
 local r = _az._el(prevName)
 local _wr = r._tm[1]
 if _wr then
 _cy[#_cy + 1] = string.format("\8226\32\37\115\32\8594\32\37\115\32\40\37\115\41", prevName, _feb(_wr._i), _wr._wg)
 else
 _cy[#_cy + 1] = string.format("\8226\32\37\115\32\8594\32\115\105\110\32\100\97\116\111\115", prevName)
 end
 shown = shown + 1
 end
 end
 if #_cy > 0 then _gz.Text = buildBody(_cy) end
 end)
 end
 end
 end
 if _G.NXIntel then
 _G.NXIntel.buildCard(_qm, _ye, 2)
 end
 local _hz, faltantes = _zd.scoresFiables(_ye)
 if not _hz then
 addNoteCard(_qm,
 "\65\110\225\108\105\115\105\115\32\110\111\32\99\97\108\99\117\108\97\98\108\101",
 "\70\97\108\116\97\110\32\100\97\116\111\115\32\113\117\101\32\115\111\110\32\112\105\108\97\114\101\115\32\100\101\108\32\109\111\100\101\108\111\58\10\8226\32"
 .. table.concat(faltantes, "\10\8226\32")
 .. "\10\10\83\105\110\32\101\108\108\111\115\32\101\108\32\114\101\115\117\108\116\97\100\111\32\110\111\32\115\101\114\237\97\32\102\105\97\98\108\101\44\32\97\115\237\32\113\117\101\32\110\111\32\115\101\32\112\117\98\108\105\99\97\46",
 C.bad).LayoutOrder = 1
 return
 end
 local _iz, _nh, trustColor, trustReasons = computeTrust(_ye)
 local _jz,   _ph,   altColor,   altSignals, altBreakdown = computeAltRisk(_ye)
 local _kz,   _sh,   actColor                 = computeActivity(_ye)
 local _lz,  _rh,  inflColor                = computeInfluence(_ye, nil)
 local _mz = _n.makeCard(_qm, {_mb = 3, _lk = "\80\117\110\116\117\97\99\105\111\110\101\115"})
 addScoreBar(_mz, "\67\111\110\102\105\97\110\122\97", _iz, _nh, trustColor, 1)
 addScoreBar(_mz, "\65\99\116\105\118\105\100\97\100", _kz, _sh, actColor, 2)
 local _, inflFill, inflVal = addScoreBar(_mz, "\73\110\102\108\117\101\110\99\105\97", _lz, _rh, inflColor, 3)
 addScoreBar(_mz, "\82\105\101\115\103\111\32\65\76\84", _jz, _ph, altColor, 4)
 local _nz = Instance.new("\84\101\120\116\76\97\98\101\108", _mz)
 _nz.LayoutOrder = 5
 _nz.Size = UDim2.new(1, 0, 0, 0)
 _nz.AutomaticSize = Enum.AutomaticSize.Y
 _nz.BackgroundTransparency = 1
 _nz.Font = Enum.Font.Gotham; _nz.TextSize = 12
 _nz.TextColor3 = C._hb
 _nz.TextWrapped = true
 _nz.TextXAlignment = Enum.TextXAlignment.Left
 _nz.TextYAlignment = Enum.TextYAlignment.Top
 _nz.Text = buildSummary(_ye, _iz, _nh, _jz, _ph, _lz, _rh, _sh)
 themed(_nz, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _oz = _ye.UserId
 withRAP(function(_vy)
 if _mr == nil or _mr.UserId ~= _oz then return end
 if not _mz.Parent then return end
 if _vy and _vy > 0 then
 local _pz, nl, nc = computeInfluence(_ye, _vy)
 inflFill.Size = UDim2.new(math.clamp(_pz/100, 0, 1), 0, 1, 0)
 inflFill.BackgroundColor3 = nc
 inflVal.Text = string.format("\37\100\47\49\48\48\32\183\32\37\115\32\40\105\110\99\108\46\32\82\65\80\41", _pz, nl)
 inflVal.TextColor3 = nc
 _nz.Text = buildSummary(_ye, _iz, _nh, _jz, _ph, _pz, nl, _sh)
 end
 end)
 if _zd.adv() then
 do
 local _qz = "\80\117\110\116\97\106\101\32\104\101\117\114\237\115\116\105\99\111\44\32\110\111\32\111\102\105\99\105\97\108\46\32\68\101\115\103\108\111\115\101\58\10\8226\32" .. table.concat(trustReasons, "\10\8226\32")
 local _rz = Instance.new("\70\114\97\109\101", _qm)
 _rz.LayoutOrder = 4
 _rz.Size = UDim2.new(1, -4, 0, 0)
 _rz.AutomaticSize = Enum.AutomaticSize.Y
 _rz.BackgroundColor3 = C._o
 _rz.BorderSizePixel = 0
 _rz.ClipsDescendants = true
 Instance.new("\85\73\67\111\114\110\101\114", _rz).CornerRadius = UDim.new(0, 8)
 themed(_rz, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _sz = Instance.new("\85\73\83\116\114\111\107\101", _rz)
 _sz.Color = C._whb; _sz.Thickness = 1; _sz.Transparency = 0.5
 themed(_sz, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _tz = Instance.new("\85\73\80\97\100\100\105\110\103", _rz)
 _tz.PaddingTop = UDim.new(0, 8); _tz.PaddingBottom = UDim.new(0, 8)
 _tz.PaddingLeft = UDim.new(0, 10); _tz.PaddingRight = UDim.new(0, 10)
 local _uz = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _rz)
 _uz.Padding = UDim.new(0, 4); _uz.SortOrder = Enum.SortOrder.LayoutOrder
 local _vz = Instance.new("\84\101\120\116\76\97\98\101\108", _rz)
 _vz.LayoutOrder = 0; _vz.Size = UDim2.new(1, 0, 0, 20)
 _vz.BackgroundTransparency = 1
 _vz.Font = Enum.Font.GothamBold; _vz.TextSize = 14
 _vz.TextColor3 = trustColor
 _vz.Text = "\67\111\110\102\105\97\110\122\97\58\32" .. _iz .. "\47\49\48\48\32\32\40" .. _nh .. "\41"
 _vz.TextXAlignment = Enum.TextXAlignment.Left
 local _wz = Instance.new("\84\101\120\116\66\117\116\116\111\110", _rz)
 _wz.LayoutOrder = 1; _wz.Size = UDim2.new(1, 0, 0, 16)
 _wz.BackgroundTransparency = 1
 _wz.Font = Enum.Font.Gotham; _wz.TextSize = 11
 _wz.TextColor3 = C.subtext
 _wz.Text = "\68\101\116\97\108\108\101\32\9656"
 _wz.TextXAlignment = Enum.TextXAlignment.Left
 themed(_wz, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _xz = Instance.new("\84\101\120\116\76\97\98\101\108", _rz)
 _xz.LayoutOrder = 2; _xz.Size = UDim2.new(1, 0, 0, 0)
 _xz.AutomaticSize = Enum.AutomaticSize.Y
 _xz.BackgroundTransparency = 1
 _xz.Font = Enum.Font.Gotham; _xz.TextSize = 13
 _xz.TextColor3 = C._hb; _xz.TextWrapped = true
 _xz.TextXAlignment = Enum.TextXAlignment.Left
 _xz.TextYAlignment = Enum.TextYAlignment.Top
 _xz.Text = _qz
 _xz.Visible = false
 themed(_xz, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _yz = false
 _wz.MouseButton1Click:Connect(function()
 _yz = not _yz
 _xz.Visible = _yz
 _wz.Text = _yz and "\9662\32\79\99\117\108\116\97\114" or "\68\101\116\97\108\108\101\32\9656"
 end)
 end
 do
 local _zz
 if _jz >= 61 then
 _zz = "\69\115\116\97\32\99\117\101\110\116\97\32\112\114\101\115\101\110\116\97\32\118\97\114\105\97\115\32\99\97\114\97\99\116\101\114\237\115\116\105\99\97\115\32\99\111\109\117\110\101\115\32\101\110\32\99\117\101\110\116\97\115\32"
 .. "\115\101\99\117\110\100\97\114\105\97\115\32\40\97\108\116\41\46"
 elseif _jz >= 41 then
 _zz = "\83\101\241\97\108\101\115\32\109\105\120\116\97\115\58\32\112\111\100\114\237\97\32\115\101\114\32\117\110\32\97\108\116\32\111\32\117\110\97\32\99\117\101\110\116\97\32\110\117\101\118\97\47\112\111\99\111\32\97\99\116\105\118\97\32"
 .. "\112\101\114\111\32\108\101\103\237\116\105\109\97\46"
 else
 _zz = "\76\97\32\99\117\101\110\116\97\32\78\79\32\109\117\101\115\116\114\97\32\112\97\116\114\111\110\101\115\32\116\237\112\105\99\111\115\32\100\101\32\99\117\101\110\116\97\32\115\101\99\117\110\100\97\114\105\97\46"
 end
 local _aab = (#altSignals == 0)
 and "\70\97\99\116\111\114\101\115\32\100\101\116\101\99\116\97\100\111\115\58\10\40\110\105\110\103\117\110\111\32\114\101\108\101\118\97\110\116\101\41"
 or  ("\70\97\99\116\111\114\101\115\32\100\101\116\101\99\116\97\100\111\115\58\10\10003\32" .. table.concat(altSignals, "\10\10003\32"))
 local _bab = {}
 for _, b in ipairs(altBreakdown) do
 _bab[#_bab + 1] = string.format("\8226\32\37\115\58\32\37\100\47\49\48\48\32\40\112\101\115\111\32\37\100\37\37\41", b[1], b[2], b[3])
 end
 local _cab = _zz .. "\10\10" .. _aab
 .. "\10\10\68\101\115\103\108\111\115\101\32\112\111\110\100\101\114\97\100\111\32\40\114\105\101\115\103\111\32\112\111\114\32\225\114\101\97\41\58\10" .. table.concat(_bab, "\10")
 .. "\10\10\72\101\117\114\237\115\116\105\99\97\32\115\111\98\114\101\32\100\97\116\111\115\32\112\250\98\108\105\99\111\115\58\32\110\111\32\112\114\117\101\98\97\32\113\117\101\32\108\97\32\99\117\101\110\116\97\32\115\101\97\32\117\110\32\97\108\116\46"
 local _dab = Instance.new("\70\114\97\109\101", _qm)
 _dab.LayoutOrder = 5
 _dab.Size = UDim2.new(1, -4, 0, 0)
 _dab.AutomaticSize = Enum.AutomaticSize.Y
 _dab.BackgroundColor3 = C._o
 _dab.BorderSizePixel = 0
 _dab.ClipsDescendants = true
 Instance.new("\85\73\67\111\114\110\101\114", _dab).CornerRadius = UDim.new(0, 8)
 themed(_dab, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _eab = Instance.new("\85\73\83\116\114\111\107\101", _dab)
 _eab.Color = C._whb; _eab.Thickness = 1; _eab.Transparency = 0.5
 themed(_eab, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _fab = Instance.new("\85\73\80\97\100\100\105\110\103", _dab)
 _fab.PaddingTop = UDim.new(0, 8); _fab.PaddingBottom = UDim.new(0, 8)
 _fab.PaddingLeft = UDim.new(0, 10); _fab.PaddingRight = UDim.new(0, 10)
 local _gab = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _dab)
 _gab.Padding = UDim.new(0, 4); _gab.SortOrder = Enum.SortOrder.LayoutOrder
 local _hab = Instance.new("\84\101\120\116\76\97\98\101\108", _dab)
 _hab.LayoutOrder = 0; _hab.Size = UDim2.new(1, 0, 0, 20)
 _hab.BackgroundTransparency = 1
 _hab.Font = Enum.Font.GothamBold; _hab.TextSize = 14
 _hab.TextColor3 = altColor
 _hab.Text = "\82\105\101\115\103\111\32\100\101\32\65\76\84\58\32" .. _jz .. "\47\49\48\48\32\32\40" .. _ph .. "\41"
 _hab.TextXAlignment = Enum.TextXAlignment.Left
 local _iab = Instance.new("\84\101\120\116\66\117\116\116\111\110", _dab)
 _iab.LayoutOrder = 1; _iab.Size = UDim2.new(1, 0, 0, 16)
 _iab.BackgroundTransparency = 1
 _iab.Font = Enum.Font.Gotham; _iab.TextSize = 11
 _iab.TextColor3 = C.subtext
 _iab.Text = "\68\101\116\97\108\108\101\32\9656"
 _iab.TextXAlignment = Enum.TextXAlignment.Left
 themed(_iab, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _jab = Instance.new("\84\101\120\116\76\97\98\101\108", _dab)
 _jab.LayoutOrder = 2; _jab.Size = UDim2.new(1, 0, 0, 0)
 _jab.AutomaticSize = Enum.AutomaticSize.Y
 _jab.BackgroundTransparency = 1
 _jab.Font = Enum.Font.Gotham; _jab.TextSize = 13
 _jab.TextColor3 = C._hb; _jab.TextWrapped = true
 _jab.TextXAlignment = Enum.TextXAlignment.Left
 _jab.TextYAlignment = Enum.TextYAlignment.Top
 _jab.Text = _cab
 _jab.Visible = false
 themed(_jab, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _kab = false
 _iab.MouseButton1Click:Connect(function()
 _kab = not _kab
 _jab.Visible = _kab
 _iab.Text = _kab and "\9662\32\79\99\117\108\116\97\114" or "\68\101\116\97\108\108\101\32\9656"
 end)
 end
 end
 local _lab = addNoteCard(_qm,
 "\65\109\105\103\111\115\32\101\110\32\99\111\109\250\110",
 (_ye.UserId == _a.UserId) and "\69\115\116\225\115\32\118\105\101\110\100\111\32\116\117\32\112\114\111\112\105\97\32\99\117\101\110\116\97\46" or "\67\97\108\99\117\108\97\110\100\111\46\46\46",
 C._idb)
 _lab.LayoutOrder = 6
 if _ye.UserId ~= _a.UserId then
 local _ix = _ye.UserId
 task.spawn(function()
 local _rg
 if _ye._mutualCached ~= nil then
 _rg = _ye._mutualCached or nil
 else
 _rg = getMutualFriends(_ye.UserId)
 _ye._mutualCached = _rg or false
 end
 if _mr == nil or _mr.UserId ~= _ix then return end
 if not _lab.Parent then return end
 local _gz
 for _, _xt in ipairs(_lab:GetChildren()) do
 if _xt:IsA("\84\101\120\116\76\97\98\101\108") and _xt.LayoutOrder == 10 then _gz = _xt end
 end
 if not _gz then return end
 if not _rg then
 _gz.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46"
 elseif #_rg == 0 then
 _gz.Text = "\78\111\32\116\105\101\110\101\110\32\97\109\105\103\111\115\32\101\110\32\99\111\109\250\110\46"
 else
 _gz.Text = "\84\105\101\110\101\115\32" .. #_rg .. "\32\97\109\105\103\111\40\115\41\32\101\110\32\99\111\109\250\110\58\10\8226\32"
 .. table.concat(_rg, "\10\8226\32")
 end
 end)
 end
 if not _mw then
 staggerCards(_km)
 staggerCards(_mm)
 staggerCards(_om)
 staggerCards(_qm)
 end
end
_m = function()
 if _mr then
 pcall(render, _mr, true)
 end
end
do
 local _n = _G.NXDS
 local function titleCase(s)
 s = tostring(s)
 return s:_is(1, 1):upper() .. s:_is(2)
 end
 local _mab = _n.makeCard(_sm, {_mb = 1, _lk = "\84\101\109\97"})
 local _nab = Instance.new("\70\114\97\109\101", _mab)
 _nab.LayoutOrder = 5
 _nab.Size = UDim2.new(1, 0, 0, 0)
 _nab.AutomaticSize = Enum.AutomaticSize.Y
 _nab.BackgroundTransparency = 1
 local _oab = Instance.new("\85\73\71\114\105\100\76\97\121\111\117\116", _nab)
 _oab.CellSize = UDim2.new(0, 68, 0, 28)
 _oab.CellPadding = UDim2.new(0, 6, 0, 6)
 _oab.SortOrder = Enum.SortOrder.LayoutOrder
 _oab.HorizontalAlignment = Enum.HorizontalAlignment.Left
 local _pab = Instance.new("\84\101\120\116\76\97\98\101\108", _mab)
 _pab.LayoutOrder = 6; _pab.Size = UDim2.new(1, 0, 0, 14); _pab.BackgroundTransparency = 1
 _pab.Font = Enum.Font.Gotham; _pab.TextSize = _n._hb.xs; _pab.TextColor3 = C.subtext
 _pab.Text = "\84\101\109\97\32\97\99\116\117\97\108\58\32" .. titleCase(_d.theme); _pab.TextXAlignment = Enum.TextXAlignment.Left
 themed(_pab, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _qab = {}
 local function paintThemeButtons(_fk)
 for _, b in ipairs(_qab) do
 local _rab = b:GetAttribute("\84\104\101\109\101\75\101\121")
 local _sab = (_d.theme == _rab)
 local _tab = _h[_rab]
 local _bm = _sab and C._idb or C.surface
 local _uab = _sab and C.onAccent or ((_tab and _tab._idb) or C._hb)
 if _fk and _gj.enabled then
 local _lb = b:FindFirstChild("\95\84\104\101\109\101\83\99\97\108\101")
 if not _lb then _lb = Instance.new("\85\73\83\99\97\108\101", b); _lb.Name = "\95\84\104\101\109\101\83\99\97\108\101" end
 if _sab then
 _lb.Scale = 0.88
 motionTween(_lb, TweenInfo.new(0.38, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
 else
 motionTween(_lb, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 })
 end
 motionTween(b, TweenInfo.new(0.30, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 BackgroundColor3 = _bm,
 TextColor3 = _uab,
 })
 else
 b.BackgroundColor3 = _bm
 b.TextColor3 = _uab
 end
 end
 end
 onRepaint(paintThemeButtons)
 local _vab = { "\110\101\103\114\111", "\97\122\117\108", "\118\101\114\100\101", "\116\111\114", "\114\111\106\111", "\109\111\114\97\100\111", "\99\121\97\110", "\114\111\115\97", "\110\97\114\97\110\106\97", "\99\108\97\114\111" }
 for i, _rab in ipairs(_vab) do
 local _wab = Instance.new("\84\101\120\116\66\117\116\116\111\110", _nab)
 _wab.LayoutOrder = i
 _wab.BackgroundColor3 = C.surface
 _wab.Text = titleCase(_rab); _wab.Font = Enum.Font.GothamMedium; _wab.TextSize = _n._hb.sm; _wab.BorderSizePixel = 0
 _wab.TextTruncate = Enum.TextTruncate.AtEnd
 _wab:SetAttribute("\84\104\101\109\101\75\101\121", _rab)
 Instance.new("\85\73\67\111\114\110\101\114", _wab).CornerRadius = _n.corner.sm
 addHoverStroke(_wab)
 table.insert(_qab, _wab)
 _wab.MouseButton1Click:Connect(function()
 setTheme(_rab)
 _pab.Text = "\84\101\109\97\32\97\99\116\117\97\108\58\32" .. titleCase(_rab)
 paintThemeButtons(true)
 end)
 end
 paintThemeButtons(false)
 _n.makeToggleRow(_sm,
 "\78\88\32\72\101\97\100\32\84\97\103\115",
 "\77\117\101\115\116\114\97\47\111\99\117\108\116\97\32\108\111\115\32\116\97\103\115\32\100\101\32\116\111\100\111\115\32\108\111\115\32\106\117\103\97\100\111\114\101\115\46\32\80\97\114\97\32\111\99\117\108\116\97\114\32\115\111\108\111\32\101\108\32\116\117\121\111\44\32\117\115\97\32\101\108\32\105\110\116\101\114\114\117\112\116\111\114\32\100\101\32\116\117\32\116\97\103\46",
 _d.headTags ~= false, 2, function(_pb)
 _d.headTags = _pb
 saveStore()
 if _G._chb then
 _G._chb.SetEnabled(_pb)
 end
 end)
 _n.makeToggleRow(_sm,
 "\65\110\105\109\97\99\105\111\110\101\115",
 "\84\114\97\110\115\105\99\105\111\110\101\115\32\121\32\101\102\101\99\116\111\115\32\100\101\32\108\97\32\105\110\116\101\114\102\97\122\32\40\121\32\101\108\32\98\114\105\108\108\111\32\100\101\32\108\111\115\32\104\101\97\100\32\116\97\103\115\41\46",
 _d.animations ~= false, 3, function(_pb)
 _d.animations = _pb
 saveStore()
 setAnimationsEnabled(_pb)
 end)
 local _xab = _n.makeCard(_sm, {_mb = 4, _lk = "\78\88\32\83\104\105\101\108\100\115", subtitle = "\86\101\114\105\102\105\99\97\99\105\243\110\32\100\101\32\65\80\73\115\32\121\32\100\97\116\111\115\32\97\110\116\101\115\32\100\101\32\109\111\115\116\114\97\114\108\111\115\46"})
 local function filaProteccion(_tr, _zr, _zab)
 local _yab = Instance.new("\70\114\97\109\101", _xab)
 _yab.LayoutOrder = _tr; _yab.Size = UDim2.new(1, 0, 0, 28); _yab.BackgroundTransparency = 1
 local _abb = Instance.new("\84\101\120\116\76\97\98\101\108", _yab)
 _abb.Size = UDim2.new(0.4, 0, 1, 0)
 _abb.BackgroundTransparency = 1
 _abb.Font = Enum.Font.GothamMedium; _abb.TextSize = _n._hb.md; _abb.TextColor3 = C._hb
 _abb.Text = _zr; _abb.TextXAlignment = Enum.TextXAlignment.Left
 _abb.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_abb, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _bbb = Instance.new("\84\101\120\116\76\97\98\101\108", _yab)
 _bbb.AnchorPoint = Vector2.new(1, 0.5)
 _bbb.Position = UDim2.new(1, -46, 0.5, 0)
 _bbb.Size = UDim2.new(0.5, -46, 1, 0)
 _bbb.BackgroundTransparency = 1
 _bbb.Font = Enum.Font.GothamBold; _bbb.TextSize = _n._hb.xs
 _bbb.TextXAlignment = Enum.TextXAlignment.Right
 _bbb.TextTruncate = Enum.TextTruncate.AtEnd
 local _tb, setOn, setBusy
 _tb, setOn, setBusy = _zd.makeSwitch(_yab, _zd.flags[_zab], function(_pb)
 setBusy(true)
 _bbb.Text = "\118\101\114\105\102\105\99\97\110\100\111\8230"; _bbb.TextColor3 = C.warn
 _zd.setFlag(_zab, _pb, function(_g, _cbb)
 setBusy(false)
 if not _pb then
 _bbb.Text = "\68\101\115\97\99\116\105\118\97\100\111"; _bbb.TextColor3 = C.subtext
 elseif _g then
 _bbb.Text = "\65\99\116\105\118\111"; _bbb.TextColor3 = C.good
 else
 _bbb.Text = "\70\97\108\108\243"; _bbb.TextColor3 = C.bad
 _gl.Text = _zr .. "\58\32\78\111\32\100\105\115\112\111\110\105\98\108\101"
 end
 end)
 end)
 _tb.AnchorPoint = Vector2.new(1, 0.5)
 _tb.Position = UDim2.new(1, 0, 0.5, 0)
 local function refrescar()
 local _pb = _zd.flags[_zab]
 setOn(_pb, false)
 if _zd.busy == _zab then
 _bbb.Text = "\118\101\114\105\102\105\99\97\110\100\111\8230"; _bbb.TextColor3 = C.warn
 elseif not _pb then
 _bbb.Text = "\68\101\115\97\99\116\105\118\97\100\111"; _bbb.TextColor3 = C.subtext
 else
 local t = _zd.lastTest and _zd.lastTest[_zab]
 if t and not t._g then
 _bbb.Text = "\70\97\108\108\243"; _bbb.TextColor3 = C.bad
 else
 _bbb.Text = "\65\99\116\105\118\111"; _bbb.TextColor3 = C.good
 end
 end
 end
 refrescar()
 _zd.onChange(refrescar)
 onRepaint(refrescar)
 end
 filaProteccion(10, "\86\101\114\105\102\105\99\97\99\105\243\110\32\65\80\73",    "\97\112\105")
 filaProteccion(11, "\86\97\108\105\100\97\99\105\243\110\32\100\101\32\100\97\116\111\115", "\100\97\116\97")
 local _dbb = Instance.new("\84\101\120\116\76\97\98\101\108", _xab)
 _dbb.LayoutOrder = 12; _dbb.Size = UDim2.new(1, 0, 0, 0)
 _dbb.AutomaticSize = Enum.AutomaticSize.Y
 _dbb.BackgroundTransparency = 1
 _dbb.Font = Enum.Font.Gotham; _dbb.TextSize = _n._hb.xs; _dbb.TextColor3 = C.textDisabled
 _dbb.Text = "\65\112\97\103\97\114\108\97\115\32\110\111\32\101\115\32\99\111\115\109\233\116\105\99\111\58\32\108\111\115\32\100\97\116\111\115\32\112\97\115\97\110\32\115\105\110\32\102\105\108\116\114\97\114\32\121\32\108\111\115\32\97\110\225\108\105\115\105\115\32\100\101\106\97\110\32\100\101\32\98\108\111\113\117\101\97\114\115\101\46"
 _dbb.TextXAlignment = Enum.TextXAlignment.Left
 _dbb.TextWrapped = true
 themed(_dbb, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116\68\105\115\97\98\108\101\100")
end
do
 local _n = _G.NXDS
 _n.makeToggleRow(_sm,
 "\77\111\100\111\32\97\118\97\110\122\97\100\111",
 "\68\101\115\103\108\111\115\101\115\32\100\101\32\112\117\110\116\117\97\99\105\111\110\101\115\32\121\32\114\101\99\111\108\101\99\99\105\243\110\32\112\114\111\102\117\110\100\97\32\101\110\32\108\97\32\112\101\115\116\97\241\97\32\72\117\101\108\108\97\46",
 _d.advanced == true, 5, function(_pb)
 _d.advanced = _pb
 saveStore()
 if _m then pcall(_m) end
 if _G.NXOSINT and _G.NXOSINT.reset then pcall(_G.NXOSINT.reset) end
 end)
end
do
 local _n = _G.NXDS
 local _ebb = _n.makeCard(_sm, {_mb = 6, _lk = "\82\101\112\97\114\97\114\32\82\80\65", subtitle = "\68\101\116\101\99\116\97\32\121\32\99\111\114\114\105\103\101\32\112\114\111\98\108\101\109\97\115\32\99\111\109\117\110\101\115\32\100\101\108\32\65\110\97\108\121\122\101\114\46"})
 local _fbb = Instance.new("\84\101\120\116\76\97\98\101\108", _ebb)
 _fbb.LayoutOrder = 2
 _fbb.Size = UDim2.new(1, 0, 0, 0)
 _fbb.AutomaticSize = Enum.AutomaticSize.Y
 _fbb.BackgroundTransparency = 1
 _fbb.Font = Enum.Font.Gotham
 _fbb.TextSize = _n._hb.xs
 _fbb.TextColor3 = C.subtext
 _fbb.Text = ""
 _fbb.TextWrapped = true
 _fbb.TextXAlignment = Enum.TextXAlignment.Left
 _fbb.Visible = false
 themed(_fbb, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _gbb = _n.makeButton(_ebb, "\82\101\112\97\114\97\114\32\82\80\65", "\112\114\105\109\97\114\121", {_mb = 1, _mdb = UDim2.new(1, 0, 0, 32)})
 local _hbb = false
 _gbb.MouseButton1Click:Connect(function()
 if _hbb then return end
 _hbb = true
 _fbb.Visible = true
 _fbb.TextColor3 = C.warn
 _gbb.Text = "\82\101\112\97\114\97\110\100\111\8230"
 local _ibb
 if _gj.enabled then
 local _lb = _gbb:FindFirstChildOfClass("\85\73\83\99\97\108\101")
 if _lb then
 _ibb = TweenService:Create(_lb,
 TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
 { Scale = 0.97 })
 _ibb:Play()
 end
 end
 local _jbb = {}
 local _kbb = 0
 task.defer(function()
 local _lbb = #_j
 local n = 0
 for i = 1, #_j do
 local e = _j[i]
 if e._p then n = n + 1; _j[n] = e end
 end
 for i = #_j, n + 1, -1 do _j[i] = nil end
 local _mbb = _lbb - #_j
 if _mbb > 0 then
 _kbb = _kbb + 1
 _jbb[#_jbb + 1] = "\10003\32\114\111\108\101\77\97\112\58\32" .. _mbb .. "\32\101\110\116\114\97\100\97\115\32\109\117\101\114\116\97\115\32\101\108\105\109\105\110\97\100\97\115"
 end
 _fbb.Text = "\86\101\114\105\102\105\99\97\110\100\111\32\116\119\101\101\110\115\8230"
 task.wait()
 local _nbb = #_gj.infinites
 local _obb = 0
 for i = _nbb, 1, -1 do
 local _hj = _gj.infinites[i]
 local _p = nil
 pcall(function() _p = _hj.Instance end)
 if not _p or not _p.Parent then
 pcall(function() _hj:Cancel() end)
 table.remove(_gj.infinites, i)
 _obb = _obb + 1
 end
 end
 if _obb > 0 then
 _kbb = _kbb + 1
 _jbb[#_jbb + 1] = "\10003\32\84\119\101\101\110\115\58\32" .. _obb .. "\32\116\119\101\101\110\115\32\104\117\233\114\102\97\110\111\115\32\99\97\110\99\101\108\97\100\111\115"
 end
 _fbb.Text = "\86\101\114\105\102\105\99\97\110\100\111\32\99\111\110\101\120\105\111\110\101\115\8230"
 task.wait()
 local _pbb = #_yi
 local _qbb = 0
 for i = _pbb, 1, -1 do
 local c = _yi[i]
 local _rbb = true
 pcall(function() _rbb = c.Connected end)
 if not _rbb then
 table.remove(_yi, i)
 _qbb = _qbb + 1
 end
 end
 if _qbb > 0 then
 _kbb = _kbb + 1
 _jbb[#_jbb + 1] = "\10003\32\67\111\110\101\120\105\111\110\101\115\58\32" .. _qbb .. "\32\100\101\115\99\111\110\101\99\116\97\100\97\115\32\101\108\105\109\105\110\97\100\97\115"
 end
 _fbb.Text = "\86\101\114\105\102\105\99\97\110\100\111\32\115\116\111\114\101\8230"
 task.wait()
 local _sbb = { theme = "\116\111\114", headTags = true, animations = true, ownTag = true, introEnabled = true, introSeen = false, advanced = false }
 local _tbb = 0
 for k, v in pairs(_sbb) do
 if _d[k] == nil then
 _d[k] = v
 _tbb = _tbb + 1
 end
 end
 if type(_d.theme) ~= "\115\116\114\105\110\103" or not _h[_d.theme] then
 _d.theme = "\116\111\114"
 _tbb = _tbb + 1
 end
 if _tbb > 0 then
 _kbb = _kbb + 1
 _jbb[#_jbb + 1] = "\10003\32\83\116\111\114\101\58\32" .. _tbb .. "\32\99\97\109\112\111\115\32\114\101\112\97\114\97\100\111\115"
 saveStore()
 end
 _fbb.Text = "\83\105\110\99\114\111\110\105\122\97\110\100\111\32\85\73\8230"
 task.wait()
 pcall(function() syncTabIndicator(false) end)
 pcall(paintTabs, false)
 pcall(repaint)
 if _mr then
 _kbb = _kbb + 1
 _jbb[#_jbb + 1] = "\10003\32\80\101\114\102\105\108\32\114\101\45\114\101\110\100\101\114\105\122\97\100\111"
 pcall(render, _mr, true)
 end
 local _ubb = 0
 pcall(function()
 for _, _xt in ipairs(_b:GetChildren()) do
 if _xt ~= _zi and _xt:IsA("\83\99\114\101\101\110\71\117\105") and _xt.Name == "\85\116\105\108\105\116\121\80\97\110\101\108" then
 _xt:Destroy()
 _ubb = _ubb + 1
 end
 end
 end)
 if _ubb > 0 then
 _kbb = _kbb + 1
 _jbb[#_jbb + 1] = "\10003\32\71\85\73\115\32\104\117\233\114\102\97\110\97\115\58\32" .. _ubb .. "\32\101\108\105\109\105\110\97\100\97\115"
 end
 if _ibb then pcall(function() _ibb:Cancel() end) end
 local _lb = _gbb:FindFirstChildOfClass("\85\73\83\99\97\108\101")
 if _lb then _lb.Scale = 1 end
 if _kbb == 0 then
 _jbb[#_jbb + 1] = "\83\105\110\32\112\114\111\98\108\101\109\97\115\32\100\101\116\101\99\116\97\100\111\115\46"
 _fbb.TextColor3 = C.good
 _gbb.Text = "\84\111\100\111\32\101\110\32\111\114\100\101\110"
 else
 _fbb.TextColor3 = C.good
 _gbb.Text = _kbb .. "\32\114\101\112\97\114\97\99\105\243\110" .. (_kbb > 1 and "\101\115" or "") .. "\32\97\112\108\105\99\97\100\97" .. (_kbb > 1 and "\115" or "")
 end
 _fbb.Text = table.concat(_jbb, "\10")
 if _gj.enabled then
 motionTween(_gbb, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { BackgroundColor3 = C.good })
 task.delay(2.5, function()
 if _gbb and _gbb.Parent then
 motionTween(_gbb, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { BackgroundColor3 = C._idb })
 _gbb.Text = "\82\101\112\97\114\97\114\32\82\80\65"
 _hbb = false
 end
 end)
 else
 _gbb.BackgroundColor3 = C._idb
 _gbb.Text = "\82\101\112\97\114\97\114\32\82\80\65"
 _hbb = false
 end
 end)
 end)
end
local function buildAdminPanel()
 local d = _pd.getData()
 local _vbb = Instance.new("\70\114\97\109\101", _jl)
 _vbb.Size                = UDim2.new(1, 0, 1, 0)
 _vbb.BackgroundTransparency = 1
 _vbb.Visible             = false
 createTab("\65\100\109\105\110", _vbb)
 local _wbb = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _vbb)
 _wbb.Size                  = UDim2.new(1, 0, 0, 28)
 _wbb.BackgroundTransparency = 1
 _wbb.BorderSizePixel       = 0
 _wbb.ScrollBarThickness    = 2
 _wbb.ScrollBarImageColor3  = C._idb
 _wbb.ScrollingDirection    = Enum.ScrollingDirection.X
 _wbb.CanvasSize            = UDim2.new(0, 0, 0, 0)
 _wbb.AutomaticCanvasSize   = Enum.AutomaticSize.X
 themed(_wbb, "\83\99\114\111\108\108\66\97\114\73\109\97\103\101\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _xbb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _wbb)
 _xbb.FillDirection = Enum.FillDirection.Horizontal
 _xbb.Padding       = UDim.new(0, 5)
 _xbb.SortOrder     = Enum.SortOrder.LayoutOrder
 local _ybb = Instance.new("\70\114\97\109\101", _vbb)
 _ybb.Size                = UDim2.new(1, 0, 1, -34)
 _ybb.Position            = UDim2.new(0, 0, 0, 34)
 _ybb.BackgroundTransparency = 1
 local _zbb   = {}
 local _acb    = {}
 local _bcb  = nil
 local function showSub(_hd)
 for k, _dcb in pairs(_zbb) do _dcb.Visible = (k == _hd) end
 _bcb = _hd
 for k, b in pairs(_acb) do
 b.BackgroundColor3 = (k == _hd) and C._idb or C.surface
 b.TextColor3       = (k == _hd) and C.onAccent or C.subtext
 end
 end
 local _ccb = {
 { _hd = "\100\97\115\104\98\111\97\114\100", _z = "\68\97\115\104\98\111\97\114\100"  },
 { _hd = "\108\105\99\101\110\115\101\115",  _z = "\76\105\99\101\110\99\105\97\115"  },
 { _hd = "\119\97\114\110\105\110\103\115",  _z = "\65\118\105\115\111\115"      },
 { _hd = "\116\97\103\115",      _z = "\84\97\103\115"         },
 { _hd = "\112\101\114\109\115",     _z = "\80\101\114\109\105\115\111\115"     },
 }
 for i, sec in ipairs(_ccb) do
 local _gb = Instance.new("\84\101\120\116\66\117\116\116\111\110", _wbb)
 _gb.Size             = UDim2.new(0, 84, 0, 24)
 _gb.LayoutOrder      = i
 _gb.BackgroundColor3 = C.surface
 _gb.Text             = sec._z
 _gb.Font             = Enum.Font.GothamMedium
 _gb.TextSize         = 12
 _gb.TextColor3       = C.subtext
 _gb.BorderSizePixel  = 0
 _gb.AutoButtonColor  = false
 Instance.new("\85\73\67\111\114\110\101\114", _gb).CornerRadius = UDim.new(0, 6)
 _acb[sec._hd] = _gb
 _gb.MouseButton1Click:Connect(function() showSub(sec._hd) end)
 local _dcb = Instance.new("\70\114\97\109\101", _ybb)
 _dcb.Size                = UDim2.new(1, 0, 1, 0)
 _dcb.BackgroundTransparency = 1
 _dcb.Visible             = false
 _zbb[sec._hd] = _dcb
 end
 onRepaint(function()
 for k, b in pairs(_acb) do
 b.BackgroundColor3 = (k == _bcb) and C._idb or C.surface
 b.TextColor3       = (k == _bcb) and C.onAccent or C.subtext
 end
 end)
 local function aScroll(_t)
 local _hm = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _t)
 _hm.Size                  = UDim2.new(1, 0, 1, 0)
 _hm.BackgroundTransparency = 1
 _hm.BorderSizePixel       = 0
 _hm.ScrollBarThickness    = 4
 _hm.ScrollBarImageColor3  = C._idb
 _hm.CanvasSize            = UDim2.new(0, 0, 0, 0)
 _hm.AutomaticCanvasSize   = Enum.AutomaticSize.Y
 _hm.ClipsDescendants      = true
 themed(_hm, "\83\99\114\111\108\108\66\97\114\73\109\97\103\101\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _ecb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _hm)
 _ecb.Padding = UDim.new(0, 7); _ecb.SortOrder = Enum.SortOrder.LayoutOrder
 Instance.new("\85\73\80\97\100\100\105\110\103", _hm).PaddingRight = UDim.new(0, 6)
 return _hm
 end
 local function statCard(_t, _z, _ab, _xb, _mb)
 local _o = Instance.new("\70\114\97\109\101", _t)
 _o.BackgroundColor3 = C._o; _o.BorderSizePixel = 0; _o.LayoutOrder = _mb
 Instance.new("\85\73\67\111\114\110\101\114", _o).CornerRadius = UDim.new(0, 8)
 local _v = Instance.new("\85\73\83\116\114\111\107\101", _o)
 _v.Color = _xb or C._idb; _v.Transparency = 0.45; _v.Thickness = 1
 themed(_o, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _fcb = _xb and nil or "\97\99\99\101\110\116"
 if _fcb then themed(_v, "\67\111\108\111\114", _fcb) end
 local _gcb = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 _gcb.Size                  = UDim2.new(1, 0, 0, 34)
 _gcb.Position              = UDim2.new(0, 0, 0, 8)
 _gcb.BackgroundTransparency = 1
 _gcb.Font                  = Enum.Font.GothamBold
 _gcb.TextSize              = 24
 _gcb.TextColor3            = _xb or C._idb
 _gcb.Text                  = tostring(_ab)
 _gcb.TextXAlignment        = Enum.TextXAlignment.Center
 if _fcb then themed(_gcb, "\84\101\120\116\67\111\108\111\114\51", _fcb) end
 local _hcb = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 _hcb.Size                  = UDim2.new(1, 0, 0, 16)
 _hcb.Position              = UDim2.new(0, 0, 0, 42)
 _hcb.BackgroundTransparency = 1
 _hcb.Font                  = Enum.Font.Gotham
 _hcb.TextSize              = 11
 _hcb.TextColor3            = C.subtext
 _hcb.Text                  = _z
 _hcb.TextXAlignment        = Enum.TextXAlignment.Center
 themed(_hcb, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 return _o
 end
 local function tRow(_t, _icb, _jcb, _mb)
 local _y = Instance.new("\70\114\97\109\101", _t)
 _y.Size             = UDim2.new(1, -4, 0, _jcb and 22 or 26)
 _y.BackgroundColor3 = _jcb and C.surface or C._o
 _y.BorderSizePixel  = 0
 _y.LayoutOrder      = _mb
 Instance.new("\85\73\67\111\114\110\101\114", _y).CornerRadius = UDim.new(0, 4)
 themed(_y, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", _jcb and "\115\117\114\102\97\99\101" or "\99\97\114\100")
 local _kcb = 1 / #_icb
 for i, _hg in ipairs(_icb) do
 local c = Instance.new("\84\101\120\116\76\97\98\101\108", _y)
 c.Size                  = UDim2.new(_kcb, -4, 1, 0)
 c.Position              = UDim2.new((i - 1) * _kcb, 2, 0, 0)
 c.BackgroundTransparency = 1
 c.Font                  = _jcb and Enum.Font.GothamBold or Enum.Font.Gotham
 c.TextSize              = _jcb and 11 or 12
 c.TextColor3            = _jcb and C.subtext or C._hb
 c.Text                  = tostring(_hg)
 c.TextXAlignment        = i == 1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center
 c.TextTruncate          = Enum.TextTruncate.AtEnd
 themed(c, "\84\101\120\116\67\111\108\111\114\51", _jcb and "\115\117\98\116\101\120\116" or "\116\101\120\116")
 end
 return _y
 end
 local function emptyNote(_t, _le, _mb)
 local _bb = Instance.new("\84\101\120\116\76\97\98\101\108", _t)
 _bb.LayoutOrder           = _mb
 _bb.Size                  = UDim2.new(1, -4, 0, 22)
 _bb.BackgroundTransparency = 1
 _bb.Font                  = Enum.Font.Gotham
 _bb.TextSize              = 12
 _bb.TextColor3            = C.subtext
 _bb.Text                  = _le
 _bb.TextXAlignment        = Enum.TextXAlignment.Left
 themed(_bb, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 do
 local _hm = aScroll(_zbb.dashboard)
 local _lcb = Instance.new("\84\101\120\116\76\97\98\101\108", _hm)
 _lcb.LayoutOrder           = 0; _lcb.Size = UDim2.new(1, -4, 0, 28)
 _lcb.BackgroundTransparency = 1; _lcb.Font = Enum.Font.GothamBold
 _lcb.TextSize              = 16; _lcb.TextColor3 = C._idb
 _lcb.Text                  = "\78\88\32\67\111\110\116\114\111\108\32\67\101\110\116\101\114\32\32\118" .. _pd.getVersion()
 _lcb.TextXAlignment        = Enum.TextXAlignment.Left
 themed(_lcb, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _qy = Instance.new("\70\114\97\109\101", _hm)
 _qy.LayoutOrder           = 1
 _qy.Size                  = UDim2.new(1, -4, 0, 136)
 _qy.BackgroundTransparency = 1
 local _ry = Instance.new("\85\73\71\114\105\100\76\97\121\111\117\116", _qy)
 _ry.CellSize    = UDim2.new(0.5, -5, 0, 62)
 _ry.CellPadding = UDim2.new(0, 6, 0, 6)
 _ry.SortOrder   = Enum.SortOrder.LayoutOrder
 statCard(_qy, "\76\105\99\101\110\99\105\97\115",  _pd.countOf("\108\105\99\101\110\115\101\115"),    C.good,    1)
 statCard(_qy, "\65\118\105\115\111\115",     _pd.countOf("\119\97\114\110\105\110\103\115"),     C.warn,    2)
 statCard(_qy, "\84\97\103\115\32\78\88",    _pd.countTags(),             C._idb,  3)
 statCard(_qy, "\80\101\114\109\105\115\111\115",   _pd.countOf("\112\101\114\109\105\115\115\105\111\110\115"),  C.subtext, 4)
 local _mcb = Instance.new("\70\114\97\109\101", _hm)
 _mcb.LayoutOrder      = 2
 _mcb.Size             = UDim2.new(1, -4, 0, 0)
 _mcb.AutomaticSize    = Enum.AutomaticSize.Y
 _mcb.BackgroundColor3 = C._o; _mcb.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _mcb).CornerRadius = UDim.new(0, 8)
 themed(_mcb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _ncb = Instance.new("\85\73\80\97\100\100\105\110\103", _mcb)
 _ncb.PaddingTop = UDim.new(0,10); _ncb.PaddingBottom = UDim.new(0,10)
 _ncb.PaddingLeft = UDim.new(0,12); _ncb.PaddingRight = UDim.new(0,12)
 local _ocb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _mcb)
 _ocb.Padding = UDim.new(0, 5); _ocb.SortOrder = Enum.SortOrder.LayoutOrder
 local _pcb = Instance.new("\84\101\120\116\76\97\98\101\108", _mcb)
 _pcb.LayoutOrder = 0; _pcb.Size = UDim2.new(1,0,0,20)
 _pcb.BackgroundTransparency = 1; _pcb.Font = Enum.Font.GothamBold
 _pcb.TextSize = 13; _pcb.TextColor3 = C._idb
 _pcb.Text = "\65\114\99\104\105\118\111\115\32\114\101\109\111\116\111\115"; _pcb.TextXAlignment = Enum.TextXAlignment.Left
 themed(_pcb, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 for i, f in ipairs({ {"\108\105\99\101\110\115\101\115\46\106\115\111\110","\108\105\99\101\110\115\101\115"}, {"\119\97\114\110\105\110\103\115\46\106\115\111\110","\119\97\114\110\105\110\103\115"}, {"\112\101\114\109\105\115\115\105\111\110\115\46\106\115\111\110","\112\101\114\109\105\115\115\105\111\110\115"} }) do
 local _g = not d.failed[f[2]]
 local _qcb = Instance.new("\70\114\97\109\101", _mcb)
 _qcb.LayoutOrder = i; _qcb.Size = UDim2.new(1,0,0,22); _qcb.BackgroundTransparency = 1
 local _rcb = Instance.new("\84\101\120\116\76\97\98\101\108", _qcb)
 _rcb.Size = UDim2.new(1,-70,1,0); _rcb.BackgroundTransparency = 1
 _rcb.Font = Enum.Font.Gotham; _rcb.TextSize = 12; _rcb.TextColor3 = C._hb
 _rcb.Text = f[1]; _rcb.TextXAlignment = Enum.TextXAlignment.Left
 themed(_rcb, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _scb = Instance.new("\84\101\120\116\76\97\98\101\108", _qcb)
 _scb.Size = UDim2.new(0,66,1,0); _scb.Position = UDim2.new(1,-68,0,0)
 _scb.BackgroundTransparency = 1; _scb.Font = Enum.Font.GothamBold; _scb.TextSize = 12
 _scb.TextColor3 = _g and C.good or C.bad
 _scb.Text = _g and "\79\75" or "\69\114\114\111\114"
 _scb.TextXAlignment = Enum.TextXAlignment.Right
 end
 local _tcb  = _pd.getPermissions(_a.UserId)
 local _ucb = Instance.new("\70\114\97\109\101", _hm)
 _ucb.LayoutOrder = 3; _ucb.Size = UDim2.new(1,-4,0,0)
 _ucb.AutomaticSize = Enum.AutomaticSize.Y
 _ucb.BackgroundColor3 = C._o; _ucb.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _ucb).CornerRadius = UDim.new(0, 8)
 themed(_ucb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _vcb = Instance.new("\85\73\80\97\100\100\105\110\103", _ucb)
 _vcb.PaddingTop = UDim.new(0,10); _vcb.PaddingBottom = UDim.new(0,10)
 _vcb.PaddingLeft = UDim.new(0,12); _vcb.PaddingRight = UDim.new(0,12)
 local _wcb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _ucb)
 _wcb.Padding = UDim.new(0, 5); _wcb.SortOrder = Enum.SortOrder.LayoutOrder
 local _xcb = Instance.new("\84\101\120\116\76\97\98\101\108", _ucb)
 _xcb.LayoutOrder = 0; _xcb.Size = UDim2.new(1,0,0,20)
 _xcb.BackgroundTransparency = 1; _xcb.Font = Enum.Font.GothamBold
 _xcb.TextSize = 13; _xcb.TextColor3 = C._idb
 _xcb.Text = "\84\117\115\32\112\101\114\109\105\115\111\115\32\32\40" .. _a.DisplayName .. "\41"
 _xcb.TextXAlignment = Enum.TextXAlignment.Left
 themed(_xcb, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 for i, pDef in ipairs({
 {"\97\100\109\105\110","\65\100\109\105\110\105\115\116\114\97\100\111\114"},{"\99\97\110\87\97\114\110","\80\117\101\100\101\32\97\100\118\101\114\116\105\114"},
 {"\99\97\110\77\97\110\97\103\101\84\97\103\115","\71\101\115\116\105\111\110\97\114\32\84\97\103\115"},{"\99\97\110\65\99\99\101\115\115\66\101\116\97","\65\99\99\101\115\111\32\66\101\116\97"},
 }) do
 local _ycb = _tcb[pDef[1]] == true
 local _zcb = Instance.new("\70\114\97\109\101", _ucb)
 _zcb.LayoutOrder = i; _zcb.Size = UDim2.new(1,0,0,22); _zcb.BackgroundTransparency = 1
 local _adb = Instance.new("\84\101\120\116\76\97\98\101\108", _zcb)
 _adb.Size = UDim2.new(1,-50,1,0); _adb.BackgroundTransparency = 1
 _adb.Font = Enum.Font.Gotham; _adb.TextSize = 12; _adb.TextColor3 = C._hb
 _adb.Text = pDef[2]; _adb.TextXAlignment = Enum.TextXAlignment.Left
 themed(_adb, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _bdb = Instance.new("\84\101\120\116\76\97\98\101\108", _zcb)
 _bdb.Size = UDim2.new(0,46,1,0); _bdb.Position = UDim2.new(1,-48,0,0)
 _bdb.BackgroundTransparency = 1; _bdb.Font = Enum.Font.GothamBold; _bdb.TextSize = 12
 _bdb.TextColor3 = _ycb and C.good or C.subtext
 _bdb.Text = _ycb and "\83\105" or "\78\111"
 _bdb.TextXAlignment = Enum.TextXAlignment.Right
 end
 end
 do
 local _hm = aScroll(_zbb.licenses)
 local _lcb = Instance.new("\84\101\120\116\76\97\98\101\108", _hm)
 _lcb.LayoutOrder = 0; _lcb.Size = UDim2.new(1,-4,0,24)
 _lcb.BackgroundTransparency = 1; _lcb.Font = Enum.Font.GothamBold
 _lcb.TextSize = 14; _lcb.TextColor3 = C._idb
 _lcb.Text = "\76\105\99\101\110\99\105\97\115\32\97\99\116\105\118\97\115\32\32\40" .. _pd.countOf("\108\105\99\101\110\115\101\115") .. "\41"
 _lcb.TextXAlignment = Enum.TextXAlignment.Left
 themed(_lcb, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 tRow(_hm, {"\85\115\101\114\73\100", "\69\115\116\97\100\111", "\67\97\114\103\97\100\111"}, true, 1)
 local _cdb = d._cdb > 0 and os.date("\37\72\58\37\77\58\37\83", d._cdb) or "\8212"
 local _ddb = 2
 for _pv, _zgb in pairs(d.licenses) do
 tRow(_hm, {_pv, _zgb and "\65\99\116\105\118\97" or "\73\110\97\99\116\105\118\97", _cdb}, false, _ddb)
 _ddb = _ddb + 1
 end
 if _ddb == 2 then emptyNote(_hm, "\83\105\110\32\100\97\116\111\115\32\40\97\114\99\104\105\118\111\32\118\97\99\237\111\32\111\32\110\111\32\100\105\115\112\111\110\105\98\108\101\41\46", 2) end
 end
 do
 local _hm = aScroll(_zbb.warnings)
 local _lcb = Instance.new("\84\101\120\116\76\97\98\101\108", _hm)
 _lcb.LayoutOrder = 0; _lcb.Size = UDim2.new(1,-4,0,24)
 _lcb.BackgroundTransparency = 1; _lcb.Font = Enum.Font.GothamBold
 _lcb.TextSize = 14; _lcb.TextColor3 = C.warn
 _lcb.Text = "\65\100\118\101\114\116\101\110\99\105\97\115\32\32\40" .. _pd.countOf("\119\97\114\110\105\110\103\115") .. "\41"
 _lcb.TextXAlignment = Enum.TextXAlignment.Left
 tRow(_hm, {"\85\115\101\114\73\100", "\78\105\118\101\108", "\77\101\110\115\97\106\101"}, true, 1)
 local _ddb = 2
 for _pv, w in pairs(d.warnings) do
 if type(w) == "\116\97\98\108\101" then
 tRow(_hm, {_pv, tostring(w._wg or "\63"), tostring(w._vn or "\8212")}, false, _ddb)
 _ddb = _ddb + 1
 end
 end
 if _ddb == 2 then emptyNote(_hm, "\83\105\110\32\97\100\118\101\114\116\101\110\99\105\97\115\32\97\99\116\105\118\97\115\46", 2) end
 end
 do
 local _hm = aScroll(_zbb._ld)
 local _lcb = Instance.new("\84\101\120\116\76\97\98\101\108", _hm)
 _lcb.LayoutOrder = 0; _lcb.Size = UDim2.new(1,-4,0,24)
 _lcb.BackgroundTransparency = 1; _lcb.Font = Enum.Font.GothamBold
 _lcb.TextSize = 14; _lcb.TextColor3 = C._idb
 _lcb.Text = "\84\97\103\115\32\78\88\32\32\40" .. _pd.countTags() .. "\41"
 _lcb.TextXAlignment = Enum.TextXAlignment.Left
 themed(_lcb, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 tRow(_hm, {"\85\115\101\114\73\100", "\84\97\103", "\80\114\105\111\114\105\100\97\100", "\67\111\108\111\114"}, true, 1)
 local _ddb = 2
 if type(_oc) == "\116\97\98\108\101" then
 for _pv, t in pairs(_oc) do
 if type(t) == "\116\97\98\108\101" then
 tRow(_hm, {
 _pv,
 tostring(t._kib or "\8212"),
 tostring(t._lhb or "\8212"),
 tostring(t._xb or "\8212"),
 }, false, _ddb)
 _ddb = _ddb + 1
 end
 end
 end
 if _ddb == 2 then emptyNote(_hm, "\84\97\103\115\32\97\250\110\32\99\97\114\103\97\110\100\111\32\111\32\115\105\110\32\100\97\116\111\115\46", 2) end
 end
 do
 local _hm = aScroll(_zbb.perms)
 local _lcb = Instance.new("\84\101\120\116\76\97\98\101\108", _hm)
 _lcb.LayoutOrder = 0; _lcb.Size = UDim2.new(1,-4,0,24)
 _lcb.BackgroundTransparency = 1; _lcb.Font = Enum.Font.GothamBold
 _lcb.TextSize = 14; _lcb.TextColor3 = C._idb
 _lcb.Text = "\80\101\114\109\105\115\111\115\32\32\40" .. _pd.countOf("\112\101\114\109\105\115\115\105\111\110\115") .. "\41"
 _lcb.TextXAlignment = Enum.TextXAlignment.Left
 themed(_lcb, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 tRow(_hm, {"\85\115\101\114\73\100", "\65\100\109\105\110", "\65\100\118\101\114\116\105\114", "\84\97\103\115", "\66\101\116\97"}, true, 1)
 local _ddb = 2
 for _pv, p in pairs(d.permissions) do
 if type(p) == "\116\97\98\108\101" then
 tRow(_hm, {
 _pv,
 p.admin         and "\83\105" or "\8212",
 p.canWarn       and "\83\105" or "\8212",
 p.canManageTags and "\83\105" or "\8212",
 p.canAccessBeta and "\83\105" or "\8212",
 }, false, _ddb)
 _ddb = _ddb + 1
 end
 end
 if _ddb == 2 then emptyNote(_hm, "\83\105\110\32\112\101\114\109\105\115\111\115\32\99\111\110\102\105\103\117\114\97\100\111\115\46", 2) end
 end
 showSub("\100\97\115\104\98\111\97\114\100")
end
local _edb = false
do
 local _fdb = {
 { _z = "\82\101\113\117\101\115\116",    _mkb = 0.22, cy = 0.46 },
 { _z = "\80\114\111\99\101\115\115\105\110\103", _mkb = 0.50, cy = 0.46 },
 { _z = "\67\111\109\112\108\101\116\101",   _mkb = 0.78, cy = 0.46 },
 }
 local _gdb = 2
 local _ym, stage, statusLbl, sizeConn
 local _hdb, _aw, packet = {}, {}, nil
 local _yc, finishing, startedAt, _jv = false, false, 0, 0
 local function makeRack(_t, w, h, _idb)
 local _x = Instance.new("\70\114\97\109\101", _t)
 _x.AnchorPoint = Vector2.new(0.5, 0)
 _x.Position = UDim2.new(0.5, 0, 0, 0)
 _x.Size = UDim2.fromOffset(w, h)
 _x.BackgroundColor3 = C._o
 _x.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _x).CornerRadius = UDim.new(0, 6)
 local _jdb = Instance.new("\85\73\71\114\97\100\105\101\110\116", _x)
 _jdb.Rotation = 90
 _jdb.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(220, 220, 228))
 _jdb.Transparency = NumberSequence.new(0.85)
 local _v = Instance.new("\85\73\83\116\114\111\107\101", _x)
 _v.Color = _idb; _v.Thickness = 1.2; _v.Transparency = 0.35
 for i = 1, 2 do
 local _kdb = Instance.new("\70\114\97\109\101", _x)
 _kdb.AnchorPoint = Vector2.new(0, 0.5)
 _kdb.Size = UDim2.new(0, math.floor(w * 0.42), 0, 3)
 _kdb.Position = UDim2.new(0, 8, i / 3, 0)
 _kdb.BackgroundColor3 = C.subtext
 _kdb.BackgroundTransparency = 0.4
 _kdb.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _kdb).CornerRadius = UDim.new(1, 0)
 end
 local _ldb = Instance.new("\70\114\97\109\101", _x)
 _ldb.AnchorPoint = Vector2.new(1, 0.5)
 _ldb.Size = UDim2.fromOffset(5, 5)
 _ldb.Position = UDim2.new(1, -8, 0.5, 0)
 _ldb.BackgroundColor3 = _idb
 _ldb.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _ldb).CornerRadius = UDim.new(1, 0)
 return _x, _v
 end
 local function makeLabel(_t, y, _mdb, _xb, _hg)
 local l = Instance.new("\84\101\120\116\76\97\98\101\108", _t)
 l.AnchorPoint = Vector2.new(0.5, 0)
 l.Position = UDim2.new(0.5, 0, 0, y)
 l.Size = UDim2.new(1, 12, 0, _mdb + 4)
 l.BackgroundTransparency = 1
 l.Font = Enum.Font.GothamMedium
 l.TextSize = _mdb
 l.TextColor3 = _xb
 l.Text = _hg
 l.TextXAlignment = Enum.TextXAlignment.Center
 l.TextTruncate = Enum.TextTruncate.AtEnd
 return l
 end
 local function _im()
 if not stage then return end
 local _ndb = stage.AbsoluteSize
 if _ndb.X < 10 or _ndb.Y < 10 then return end
 for _, n in ipairs(_hdb) do
 n.px = Vector2.new(n.def._mkb * _ndb.X, n.def.cy * _ndb.Y)
 n._pmb = Vector2.new(n.px.X, n.px.Y - 11)
 n._udb.Position = UDim2.fromOffset(n.px.X, n.px.Y)
 end
 for _, ln in ipairs(_aw) do
 local a, b = _hdb[ln._mt]._pmb, _hdb[ln.to]._pmb
 local d = b - a
 ln.len = d.Magnitude
 ln._qj.Position = UDim2.fromOffset(a.X, a.Y)
 ln._qj.Rotation = math.deg(math.atan(d.Y, d.X))
 if ln.grown then ln._qj.Size = UDim2.fromOffset(ln.len, _gdb) end
 end
 end
 local function lightNode(i, _xb)
 local n = _hdb[i]
 if not n then return end
 motionTween(n._hk, TweenInfo.new(0.2), { Transparency = 0, Color = _xb or C._idb })
 end
 local function dimNode(i)
 local n = _hdb[i]
 if not n then return end
 motionTween(n._hk, TweenInfo.new(0.2), { Transparency = 0.35 })
 end
 local function setStatus(_hg, _xb)
 if statusLbl then statusLbl.Text = _hg; statusLbl.TextColor3 = _xb or C._idb end
 end
 local function travel(_rdb, _pdb)
 if not _yc or _pdb ~= _jv or finishing then return end
 local a, b = _hdb[_rdb]._pmb, _hdb[_rdb + 1]._pmb
 packet.Position = UDim2.fromOffset(a.X, a.Y)
 packet.BackgroundTransparency = 0.05
 packet.Visible = true
 local _odb = math.clamp((b - a).Magnitude / 220, 0.35, 0.7)
 motionTween(packet, TweenInfo.new(_odb, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
 { Position = UDim2.fromOffset(b.X, b.Y) }, function()
 if not _yc or _pdb ~= _jv or finishing then return end
 lightNode(_rdb + 1)
 if _rdb + 1 < #_hdb then
 travel(_rdb + 1, _pdb)
 else
 task.delay(0.35, function()
 if not _yc or finishing or _pdb ~= _jv then return end
 dimNode(2); dimNode(3)
 travel(1, _pdb)
 end)
 end
 end)
 end
 local function destroyNow()
 _yc = false
 _jv = _jv + 1
 if sizeConn then sizeConn:Disconnect(); sizeConn = nil end
 if _ym then _ym:Destroy() end
 _ym, stage, statusLbl, packet = nil, nil, nil, nil
 _hdb, _aw = {}, {}
 end
 local M = {}
 function M.finish(_em)
 local function done() if _em then task.spawn(_em) end end
 if not _yc then done(); return end
 if finishing then done(); return end
 finishing = true
 local _pdb = _jv
 task.spawn(function()
 local _qdb = os.clock() - startedAt
 if _qdb < 1.0 then task.wait(1.0 - _qdb) end
 if _pdb ~= _jv then done(); return end
 for _, ln in ipairs(_aw) do
 motionTween(ln._qj, TweenInfo.new(0.3), { BackgroundColor3 = C.good })
 end
 for i = 1, #_hdb do lightNode(i, C.good) end
 if _hdb[3] and _hdb[3]._z then _hdb[3]._z.TextColor3 = C.good end
 if packet then
 packet.BackgroundColor3 = C.good
 local b = _hdb[#_hdb]._pmb
 motionTween(packet, TweenInfo.new(0.3), { Position = UDim2.fromOffset(b.X, b.Y) })
 end
 setStatus("\67\111\109\112\108\101\116\101\100", C.good)
 task.wait(0.45)
 if _pdb ~= _jv then done(); return end
 motionTween(stage, TweenInfo.new(0.3), { GroupTransparency = 1 })
 motionTween(_ym, TweenInfo.new(0.3), { BackgroundTransparency = 1 }, function()
 destroyNow()
 done()
 end)
 end)
 end
 function M.stop() destroyNow() end
 function M.start()
 destroyNow()
 _jv = _jv + 1
 local _pdb = _jv
 _yc, finishing, startedAt = true, false, os.clock()
 _ym = Instance.new("\70\114\97\109\101")
 _ym.Name = "\83\99\97\110\79\118\101\114\108\97\121"
 _ym.Position = UDim2.new(0, 0, 0, 0)
 _ym.Size = UDim2.new(1, 0, 1, 0)
 _ym.BackgroundColor3 = C.bg
 _ym.BackgroundTransparency = 0.03
 _ym.BorderSizePixel = 0
 _ym.ClipsDescendants = true
 _ym.Active = true
 _ym.ZIndex = 50
 _ym.Parent = _jl
 stage = Instance.new("\67\97\110\118\97\115\71\114\111\117\112")
 stage.Size = UDim2.new(1, 0, 1, 0)
 stage.BackgroundTransparency = 1
 stage.BorderSizePixel = 0
 stage.GroupTransparency = 0
 stage.ZIndex = 51
 stage.Parent = _ym
 local _sdb = Instance.new("\70\114\97\109\101", stage)
 _sdb.AnchorPoint = Vector2.new(0.5, 0)
 _sdb.Position = UDim2.new(0.5, 0, 0, 10)
 _sdb.Size = UDim2.fromOffset(180, 24)
 _sdb.BackgroundColor3 = C._o
 _sdb.BackgroundTransparency = 0.1
 _sdb.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _sdb).CornerRadius = UDim.new(1, 0)
 local _tdb = Instance.new("\85\73\83\116\114\111\107\101", _sdb)
 _tdb.Color = C._idb; _tdb.Transparency = 0.4
 statusLbl = Instance.new("\84\101\120\116\76\97\98\101\108", _sdb)
 statusLbl.Size = UDim2.new(1, -16, 1, 0)
 statusLbl.Position = UDim2.new(0, 8, 0, 0)
 statusLbl.BackgroundTransparency = 1
 statusLbl.Font = Enum.Font.GothamBold
 statusLbl.TextSize = 12
 statusLbl.TextColor3 = C._idb
 statusLbl.Text = "\82\101\113\117\101\115\116\105\110\103\32\68\97\116\97\46\46\46"
 statusLbl.TextXAlignment = Enum.TextXAlignment.Center
 _hdb, _aw = {}, {}
 for _, def in ipairs(_fdb) do
 local _udb = Instance.new("\70\114\97\109\101", stage)
 _udb.AnchorPoint = Vector2.new(0.5, 0.5)
 _udb.Size = UDim2.fromOffset(92, 62)
 _udb.BackgroundTransparency = 1
 _udb.ZIndex = 3
 local _lb = Instance.new("\85\73\83\99\97\108\101", _udb); _lb.Scale = 0
 local _, _v = makeRack(_udb, 84, 40, C._idb)
 local _bb = makeLabel(_udb, 44, 12, C.subtext, def._z)
 _hdb[#_hdb + 1] = { def = def, _udb = _udb, _cp = _lb, _hk = _v, _z = _bb }
 end
 for i = 1, #_hdb - 1 do
 local _vdb = Instance.new("\70\114\97\109\101", stage)
 _vdb.AnchorPoint = Vector2.new(0, 0.5)
 _vdb.Size = UDim2.fromOffset(0, _gdb)
 _vdb.BackgroundColor3 = C._idb
 _vdb.BackgroundTransparency = 0.2
 _vdb.BorderSizePixel = 0
 _vdb.ZIndex = 2
 local _wdb = Instance.new("\85\73\71\114\97\100\105\101\110\116", _vdb)
 _wdb.Transparency = NumberSequence.new({
 NumberSequenceKeypoint.new(0, 0.5),
 NumberSequenceKeypoint.new(0.5, 0),
 NumberSequenceKeypoint.new(1, 0.5),
 })
 _aw[#_aw + 1] = { _qj = _vdb, _mt = i, to = i + 1, grown = false }
 end
 packet = Instance.new("\70\114\97\109\101", stage)
 packet.AnchorPoint = Vector2.new(0.5, 0.5)
 packet.Size = UDim2.fromOffset(8, 8)
 packet.BackgroundColor3 = C._idb
 packet.BorderSizePixel = 0
 packet.Visible = false
 packet.ZIndex = 5
 Instance.new("\85\73\67\111\114\110\101\114", packet).CornerRadius = UDim.new(1, 0)
 local _xdb = Instance.new("\85\73\83\116\114\111\107\101", packet)
 _xdb.Color = Color3.fromRGB(255, 255, 255); _xdb.Transparency = 0.4
 _im()
 sizeConn = stage:GetPropertyChangedSignal("\65\98\115\111\108\117\116\101\83\105\122\101"):Connect(_im)
 for i, n in ipairs(_hdb) do
 task.delay(0.12 * (i - 1), function()
 if _pdb ~= _jv or not _yc then return end
 motionTween(n._cp, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
 end)
 end
 for i, ln in ipairs(_aw) do
 task.delay(0.12 * i, function()
 if _pdb ~= _jv or not _yc then return end
 ln.grown = true
 motionTween(ln._qj, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { Size = UDim2.fromOffset(ln.len, _gdb) })
 end)
 end
 task.delay(0.42, function()
 if _pdb ~= _jv or not _yc then return end
 lightNode(1)
 travel(1, _pdb)
 end)
 end
 _G.NXScan = M
end
function _fj.startScan()
 if _G.NXScan then _G.NXScan.start() end
end
function _zd.textoEstado(_ye)
 local _v = _ye and _ye._state
 if _v == "\118\101\114\105\102\105\101\100" then return "\10003\32\86\101\114\105\102\105\99\97\100\111\46" end
 if _v == "\112\97\114\116\105\97\108" then
 local n = #_zd.problemas(_ye)
 return "\9681\32\80\97\114\99\105\97\108\32\183\32" .. n .. "\32\100\97\116\111\40\115\41\32\110\111\32\100\105\115\112\111\110\105\98\108\101\115\46"
 end
 if _v == "\105\110\99\111\109\112\108\101\116\101" then return "\68\97\116\111\115\32\105\110\99\111\109\112\108\101\116\111\115\32\40\102\97\108\116\97\110\32\99\97\109\112\111\115\32\99\108\97\118\101\41\46" end
 if _v == "\101\114\114\111\114"      then return "\10005\32\69\114\114\111\114\32\100\101\32\118\97\108\105\100\97\99\105\243\110\32\101\110\32\108\111\115\32\100\97\116\111\115\46" end
 return "\10003\32\76\105\115\116\111\46"
end
local _ydb = 0
_el = function(_jj)
 if _edb then return end
 _jj = (_jj or ""):gsub("\37\115", "")
 if _jj == "" then return end
 _edb = true
 _ydb = _ydb + 1
 local _zdb = _ydb
 hideAllSuggestions()
 _gl.Text = "\66\117\115\99\97\110\100\111\46\46\46"
 _fj.startScan()
 task.spawn(function()
 local _aeb, outStatus = nil, "\78\111\32\100\105\115\112\111\110\105\98\108\101\46"
 local _g, _kr = pcall(function()
 local _uc = tonumber(_jj)
 if not _uc then
 local _hd, _, errType = getUserIdByName(_jj)
 if not _hd then
 if errType == "\110\111\116\95\102\111\117\110\100" then outStatus = "\85\115\117\97\114\105\111\32\110\111\32\101\110\99\111\110\116\114\97\100\111\46"
 elseif errType == "\97\112\105\95\101\114\114\111\114" then outStatus = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46\32\86\117\101\108\118\101\32\97\32\105\110\116\101\110\116\97\114\108\111\32\101\110\32\117\110\32\109\111\109\101\110\116\111\46"
 else outStatus = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46" end
 return
 end
 _uc = _hd
 end
 if _zd.flags._ye and _zd.valid._uc(_uc) == nil then
 outStatus = "\85\115\101\114\73\100\32\110\111\32\118\225\108\105\100\111\46"
 return
 end
 local _beb = _zh[_uc]
 if _beb and (os.time() - (_beb._fetchedAt or 0)) < _zd._ad then
 _zd.run = _beb._integrity or _zd.run
 _aeb = _beb
 outStatus = _zd.textoEstado(_beb) .. "\32\40\99\97\99\104\233\41"
 return
 end
 _gl.Text = "\67\111\110\115\117\108\116\97\110\100\111\32\65\80\73\115\46\46\46"
 local _ye, motivo = gatherData(_uc)
 if not _ye then
 outStatus = (motivo == "\112\101\114\102\105\108\95\105\110\118\97\108\105\100\111" or motivo == "\115\105\110\95\114\101\115\112\117\101\115\116\97")
 and "\78\111\32\100\105\115\112\111\110\105\98\108\101\46" or "\85\115\117\97\114\105\111\32\110\111\32\101\110\99\111\110\116\114\97\100\111\46"
 else
 setCached(_uc, _ye)
 _aeb = _ye
 outStatus = _zd.textoEstado(_ye)
 pcall(function()
 if _G.NXPlus and _G.NXPlus.recordar then
 _G.NXPlus.recordar(_ye.UserId, _ye.Username, _ye.DisplayName)
 end
 end)
 end
 end)
 if not _g then
 _aeb, outStatus = nil, "\78\111\32\100\105\115\112\111\110\105\98\108\101\46"
 warn("\91\78\88\32\65\110\97\108\121\122\101\114\93\32\101\114\114\111\114\32\101\110\32\97\110\97\108\121\122\101\58\32" .. tostring(_kr))
 end
 _gl.Text = ""
 local function paint()
 if _zdb ~= _ydb then _edb = false; return end
 _zd.emit()
 local _ceb, renderErr = pcall(render, _aeb)
 if not _ceb then
 warn("\91\78\88\32\65\110\97\108\121\122\101\114\93\32\114\101\110\100\101\114\32\101\114\114\111\114\58\32" .. tostring(renderErr))
 end
 _gl.Text = outStatus
 _edb = false
 end
 if _G.NXScan then _G.NXScan.finish(paint) else paint() end
 end)
end
track(_fl.MouseButton1Click:Connect(function() _el(_wk.Text) end))
track(_wk.FocusLost:Connect(function(_deb)
 if _deb then _el(_wk.Text) end
end))
do
 if _G.NXOSINT and _G.NXOSINT.stop then pcall(_G.NXOSINT.stop) end
 local _dm = Instance.new("\70\114\97\109\101", _jl)
 _dm.Size = UDim2.new(1, 0, 1, 0)
 _dm.BackgroundTransparency = 1
 _dm.Visible = false
 local _hw = makeScroll(_dm)
 local _eeb = nil
 local _jv = 0
 local _mc = {}
 local function getJSON(_gc)
 local _x, _v = rawGet(_gc)
 if not _x then return nil, tonumber(_v) end
 local _g, t = pcall(function() return HttpService:JSONDecode(_x) end)
 if not _g or type(t) ~= "\116\97\98\108\101" then return nil, tonumber(_v) end
 return t, tonumber(_v)
 end
 local function _wqb(_tr, _feb, _geb)
 local _o = Instance.new("\70\114\97\109\101", _hw)
 _o.LayoutOrder = _tr
 _o.Size = UDim2.new(1, -4, 0, 0)
 _o.AutomaticSize = Enum.AutomaticSize.Y
 _o.BackgroundColor3 = C._o
 _o.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _o).CornerRadius = UDim.new(0, 8)
 themed(_o, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 addDepth(_o)
 local _tj = Instance.new("\85\73\80\97\100\100\105\110\103", _o)
 _tj.PaddingTop = UDim.new(0, 9); _tj.PaddingBottom = UDim.new(0, 9)
 _tj.PaddingLeft = UDim.new(0, 10); _tj.PaddingRight = UDim.new(0, 10)
 local _w = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _o)
 _w.Padding = UDim.new(0, 5); _w.SortOrder = Enum.SortOrder.LayoutOrder
 local h = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 h.LayoutOrder = 0; h.Size = UDim2.new(1, 0, 0, 20)
 h.BackgroundTransparency = 1
 h.Font = Enum.Font.GothamBold; h.TextSize = 14; h.TextColor3 = C._idb
 h.Text = _feb; h.TextXAlignment = Enum.TextXAlignment.Left
 themed(h, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 if _geb then
 local s = Instance.new("\84\101\120\116\76\97\98\101\108", _o)
 s.LayoutOrder = 1; s.Size = UDim2.new(1, 0, 0, 0)
 s.AutomaticSize = Enum.AutomaticSize.Y
 s.BackgroundTransparency = 1
 s.Font = Enum.Font.Gotham; s.TextSize = 11; s.TextColor3 = C.subtext
 s.Text = _geb; s.TextXAlignment = Enum.TextXAlignment.Left
 s.TextWrapped = true
 themed(s, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 return _o
 end
 local function _yab(_o, _tr, _ur, _gc)
 local f = Instance.new("\70\114\97\109\101", _o)
 f.LayoutOrder = _tr
 f.Size = UDim2.new(1, 0, 0, 24)
 f.BackgroundTransparency = 1
 local _abb = Instance.new("\84\101\120\116\76\97\98\101\108", f)
 _abb.Size = UDim2.new(0, 150, 1, 0)
 _abb.BackgroundTransparency = 1
 _abb.Font = Enum.Font.Gotham; _abb.TextSize = 12; _abb.TextColor3 = C.subtext
 _abb.Text = _ur; _abb.TextXAlignment = Enum.TextXAlignment.Left
 _abb.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_abb, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _heb = _gc and 62 or 0
 local v = Instance.new("\84\101\120\116\76\97\98\101\108", f)
 v.Size = UDim2.new(1, -154 - _heb, 1, 0)
 v.Position = UDim2.new(0, 154, 0, 0)
 v.BackgroundTransparency = 1
 v.Font = Enum.Font.GothamBold; v.TextSize = 12; v.TextColor3 = C.subtext
 v.Text = "\67\111\109\112\114\111\98\97\110\100\111\8230"; v.TextXAlignment = Enum.TextXAlignment.Left
 v.TextTruncate = Enum.TextTruncate.AtEnd
 if _gc then
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110", f)
 b.AnchorPoint = Vector2.new(1, 0.5)
 b.Position = UDim2.new(1, 0, 0.5, 0)
 b.Size = UDim2.new(0, 58, 0, 20)
 b.BackgroundColor3 = C.surface
 b.Text = "\65\98\114\105\114"
 b.Font = Enum.Font.GothamMedium; b.TextSize = 11; b.TextColor3 = C._hb
 b.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new(0, 6)
 themed(b, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 themed(b, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 b.MouseButton1Click:Connect(function()
 if openURL(_gc) then
 _gl.Text = "\65\98\105\101\114\116\111\32\101\110\32\101\108\32\110\97\118\101\103\97\100\111\114\46"
 else
 _fc(_gc)
 _gl.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\101\110\32\116\117\32\101\120\101\99\117\116\111\114\46\32\76\105\110\107\32\99\111\112\105\97\100\111\46"
 end
 end)
 end
 return v
 end
 local function marcar(_bb, _zab, _ieb)
 if not _bb or not _bb.Parent then return end
 if _zab == "\115\105" then
 _bb.Text = _ieb or "\80\114\101\115\101\110\116\101";      _bb.TextColor3 = C.good
 elseif _zab == "\110\111" then
 _bb.Text = _ieb or "\78\111\32\101\110\99\111\110\116\114\97\100\111"; _bb.TextColor3 = C.subtext
 else
 _bb.Text = _ieb or "\78\111\32\100\105\115\112\111\110\105\98\108\101"; _bb.TextColor3 = C.warn
 end
 end
 local function comprobar(_pdb, _bb, _zab, _s)
 task.spawn(function()
 local _g, _xi, _ieb, crudo = pcall(_s)
 if not _g then _xi, _ieb = "\110\100", nil end
 if _pdb ~= _jv then return end
 _mc[_zab] = { _xi = _xi, _ieb = _ieb, _qr = crudo }
 marcar(_bb, _xi, _ieb)
 end)
 end
 local function construir()
 local _ye = _mr
 clearScroll(_hw)
 _mc = {}
 _jv = _jv + 1
 local _pdb = _jv
 if not _ye then
 _eeb = nil
 local _jeb = Instance.new("\84\101\120\116\76\97\98\101\108", _hw)
 _jeb.LayoutOrder = 0
 _jeb.Size = UDim2.new(1, -4, 0, 40)
 _jeb.BackgroundTransparency = 1
 _jeb.Font = Enum.Font.Gotham; _jeb.TextSize = 12; _jeb.TextColor3 = C.subtext
 _jeb.Text = "\65\110\97\108\105\122\97\32\117\110\32\112\101\114\102\105\108\32\112\97\114\97\32\118\101\114\32\115\117\32\104\117\101\108\108\97\32\112\250\98\108\105\99\97\46"
 _jeb.TextXAlignment = Enum.TextXAlignment.Left
 themed(_jeb, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 return
 end
 _eeb = _ye.UserId
 local _pv  = _ye.UserId
 local _keb = tostring(_ye.Username or "")
 local _leb = _wqb(0, "\80\114\101\115\101\110\99\105\97",
 "\69\115\112\97\99\105\111\115\32\100\101\32\82\111\98\108\111\120\32\100\111\110\100\101\32\101\115\116\97\32\99\117\101\110\116\97\32\100\101\106\97\32\104\117\101\108\108\97\32\112\250\98\108\105\99\97\46")
 marcar(_yab(_leb, 2, "\80\101\114\102\105\108\32\100\101\32\82\111\98\108\111\120", _ye.ProfileUrl), "\115\105")
 local _meb = _yab(_leb, 3, "\68\101\118\70\111\114\117\109",
 "\104\116\116\112\115\58\47\47\100\101\118\102\111\114\117\109\46\114\111\98\108\111\120\46\99\111\109\47\117\47" .. _keb)
 comprobar(_pdb, _meb, "\100\101\118\102\111\114\117\109", function()
 if _keb == "" then return "\110\100" end
 local t, _he = getJSON("\104\116\116\112\115\58\47\47\100\101\118\102\111\114\117\109\46\114\111\98\108\111\120\46\99\111\109\47\117\47" .. _keb .. "\46\106\115\111\110")
 if t and type(t._keb) == "\116\97\98\108\101" then
 local _neb = tonumber(t._keb.trust_level)
 return "\115\105", _neb and ("\80\114\101\115\101\110\116\101\32\183\32\110\105\118\101\108\32\100\101\32\99\111\110\102\105\97\110\122\97\32" .. _neb) or "\80\114\101\115\101\110\116\101", t._keb
 end
 if _he == 404 then return "\110\111" end
 return "\110\100"
 end)
 local _oeb = _yab(_leb, 4, "\69\120\112\101\114\105\101\110\99\105\97\115\32\112\117\98\108\105\99\97\100\97\115",
 "\104\116\116\112\115\58\47\47\119\119\119\46\114\111\98\108\111\120\46\99\111\109\47\117\115\101\114\115\47" .. _pv .. "\47\112\114\111\102\105\108\101")
 comprobar(_pdb, _oeb, "\106\117\101\103\111\115", function()
 local t = getJSON("\104\116\116\112\115\58\47\47\103\97\109\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\50\47\117\115\101\114\115\47" .. _pv
 .. "\47\103\97\109\101\115\63\97\99\99\101\115\115\70\105\108\116\101\114\61\80\117\98\108\105\99\38\108\105\109\105\116\61\53\48\38\115\111\114\116\79\114\100\101\114\61\68\101\115\99")
 if not t or type(t._ye) ~= "\116\97\98\108\101" then return "\110\100" end
 local n = #t._ye
 if n == 0 then return "\110\111", "\78\105\110\103\117\110\97\32\112\250\98\108\105\99\97" end
 local _peb = (t.nextPageCursor and t.nextPageCursor ~= "") and "\43" or ""
 return "\115\105", n .. _peb .. "\32\101\120\112\101\114\105\101\110\99\105\97\40\115\41", t._ye
 end)
 local _qeb = _yab(_leb, 5, "\71\114\117\112\111\115\32\113\117\101\32\100\105\114\105\103\101")
 comprobar(_pdb, _qeb, "\103\114\117\112\111\115", function()
 local t = getJSON("\104\116\116\112\115\58\47\47\103\114\111\117\112\115\46\114\111\98\108\111\120\46\99\111\109\47\118\50\47\117\115\101\114\115\47" .. _pv .. "\47\103\114\111\117\112\115\47\114\111\108\101\115")
 if not t or type(t._ye) ~= "\116\97\98\108\101" then return "\110\100" end
 local _reb, _uf = {}, #t._ye
 for _, e in ipairs(t._ye) do
 local g = e.group
 if type(g) == "\116\97\98\108\101" and type(g.owner) == "\116\97\98\108\101"
 and tonumber(g.owner._uc) == tonumber(_pv) then
 _reb[#_reb + 1] = g._i or ("\71\114\117\112\111\32" .. tostring(g._hd))
 end
 end
 if #_reb == 0 then
 return "\110\111", (_uf == 0) and "\69\110\32\110\105\110\103\250\110\32\103\114\117\112\111" or ("\77\105\101\109\98\114\111\32\100\101\32" .. _uf .. "\44\32\100\117\101\241\111\32\100\101\32\48")
 end
 return "\115\105", "\68\117\101\241\111\32\100\101\32" .. #_reb .. "\32\100\101\32" .. _uf, { _reb = _reb, todos = t._ye }
 end)
 local _seb = _yab(_leb, 6, "\73\116\101\109\115\32\101\110\32\101\108\32\99\97\116\225\108\111\103\111")
 comprobar(_pdb, _seb, "\99\97\116\97\108\111\103\111", function()
 local t = getJSON("\104\116\116\112\115\58\47\47\99\97\116\97\108\111\103\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\115\101\97\114\99\104\47\105\116\101\109\115\63\99\97\116\101\103\111\114\121\61\65\108\108"
 .. "\38\99\114\101\97\116\111\114\84\97\114\103\101\116\73\100\61" .. _pv .. "\38\99\114\101\97\116\111\114\84\121\112\101\61\85\115\101\114\38\108\105\109\105\116\61\49\48")
 if not t or type(t._ye) ~= "\116\97\98\108\101" then return "\110\100" end
 if #t._ye == 0 then return "\110\111", "\78\97\100\97\32\97\32\108\97\32\118\101\110\116\97" end
 local _peb = (t.nextPageCursor and t.nextPageCursor ~= "") and "\43" or ""
 return "\115\105", #t._ye .. _peb .. "\32\105\116\101\109\40\115\41\32\99\114\101\97\100\111\115", t._ye
 end)
 local _teb = _yab(_leb, 7, "\73\110\118\101\110\116\97\114\105\111\32\112\250\98\108\105\99\111",
 "\104\116\116\112\115\58\47\47\119\119\119\46\114\111\98\108\111\120\46\99\111\109\47\117\115\101\114\115\47" .. _pv .. "\47\105\110\118\101\110\116\111\114\121")
 comprobar(_pdb, _teb, "\105\110\118\101\110\116\97\114\105\111", function()
 local t = getJSON("\104\116\116\112\115\58\47\47\105\110\118\101\110\116\111\114\121\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _pv
 .. "\47\99\97\110\45\118\105\101\119\45\105\110\118\101\110\116\111\114\121")
 if not t or type(t.canView) ~= "\98\111\111\108\101\97\110" then return "\110\100" end
 if t.canView then return "\115\105", "\86\105\115\105\98\108\101" end
 return "\110\111", "\80\114\105\118\97\100\111"
 end)
 local _ueb = _yab(_leb, 8, "\82\111\108\105\109\111\110\39\115",
 "\104\116\116\112\115\58\47\47\119\119\119\46\114\111\108\105\109\111\110\115\46\99\111\109\47\112\108\97\121\101\114\47" .. _pv)
 marcar(_ueb, "\110\100", "\78\111\32\118\101\114\105\102\105\99\97\98\108\101\32\100\101\115\100\101\32\101\108\32\115\99\114\105\112\116")
 _mc.rolimons = { _xi = "\110\100", _ieb = "\65\80\73\32\112\250\98\108\105\99\97\32\114\101\116\105\114\97\100\97" }
 local _veb = _wqb(1, "\69\115\116\97\100\111\32\100\101\32\108\97\32\99\117\101\110\116\97",
 "\82\111\98\108\111\120\32\110\111\32\112\117\98\108\105\99\97\32\101\108\32\99\111\114\114\101\111\32\100\101\32\110\97\100\105\101\44\32\97\115\237\32\113\117\101\32\101\110\32\118\101\122\32\100\101\32\114\97\115\116\114\101\97\114\32"
 .. "\100\105\114\101\99\99\105\111\110\101\115\32\115\101\32\99\114\117\122\97\32\101\108\32\101\115\116\97\100\111\32\100\101\32\108\97\32\99\117\101\110\116\97\32\101\110\116\114\101\32\100\111\115\32\102\117\101\110\116\101\115\46")
 local _web = _yab(_veb, 2, "\69\115\116\97\100\111")
 if _ye.Banned == "\83\237" then
 marcar(_web, "\110\111", "\66\97\110\101\97\100\97")
 _web.TextColor3 = C.bad
 elseif _ye.IsDeleted == true then
 marcar(_web, "\110\111", "\66\111\114\114\97\100\97")
 _web.TextColor3 = C.bad
 elseif _ye.IsDeleted == false then
 marcar(_web, "\115\105", "\65\99\116\105\118\97")
 else
 marcar(_web, "\110\100", "\78\111\32\99\111\109\112\114\111\98\97\98\108\101")
 end
 _mc._xi = { _ieb = _web.Text }
 local _xeb = _yab(_veb, 3, "\73\110\115\105\103\110\105\97\32\118\101\114\105\102\105\99\97\100\97")
 local _yeb = (_ye.Verified == "\83\237")
 if _ye.VerifiedApi ~= nil and _ye.VerifiedApi ~= _yeb then
 marcar(_xeb, "\110\100", "\76\97\115\32\100\111\115\32\102\117\101\110\116\101\115\32\110\111\32\99\111\105\110\99\105\100\101\110")
 elseif _yeb then
 marcar(_xeb, "\115\105", "\83\237")
 else
 marcar(_xeb, "\110\111", "\78\111")
 end
 _mc.verificada = { _ieb = _xeb.Text }
 local _zeb = _yab(_veb, 4, "\78\111\109\98\114\101\32\118\105\115\105\98\108\101")
 if tostring(_ye.DisplayName):lower() ~= tostring(_ye.Username):lower() then
 marcar(_zeb, "\110\111", "\68\105\115\116\105\110\116\111\32\100\101\108\32\64\117\115\117\97\114\105\111")
 else
 marcar(_zeb, "\115\105", "\73\103\117\97\108\32\97\108\32\64\117\115\117\97\114\105\111")
 end
 local _afb = _yab(_veb, 5, "\78\111\109\98\114\101\115\32\112\114\101\118\105\111\115")
 do
 local _bfb = _pv
 local function recibir(_gw)
 if _pdb ~= _jv or _bfb ~= _pv then return end
 if _gw == nil then
 marcar(_afb, "\110\100")
 elseif #_gw == 0 then
 marcar(_afb, "\110\111", "\78\105\110\103\117\110\111")
 else
 marcar(_afb, "\115\105", #_gw .. "\32\97\110\116\101\114\105\111\114\40\101\115\41")
 end
 _mc.nombres = { _qr = _gw }
 end
 if _G.NXPlus and type(_G.NXPlus.nombres) == "\102\117\110\99\116\105\111\110" then
 _G.NXPlus.nombres(_ye, recibir)
 else
 task.spawn(function() recibir(getNameHistory(_pv)) end)
 end
 end
 if _zd.adv() then
 local _cfb = _wqb(2, "\82\101\99\111\108\101\99\99\105\243\110\32\112\114\111\102\117\110\100\97",
 "\67\105\102\114\97\115\32\99\111\109\112\108\101\116\97\115\44\32\110\111\32\108\97\115\32\109\117\101\115\116\114\97\115\32\100\101\32\49\48\32\100\101\32\108\97\32\112\101\115\116\97\241\97\32\73\116\101\109\115\46")
 local _dfb = _yab(_cfb, 2, "\66\97\100\103\101\115\32\40\116\111\116\97\108\41")
 comprobar(_pdb, _dfb, "\98\97\100\103\101\115\84\111\116\97\108", function()
 local n = countPaged("\104\116\116\112\115\58\47\47\98\97\100\103\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _pv .. "\47\98\97\100\103\101\115", 100)
 if n == nil then return "\110\100" end
 return "\115\105", tostring(n)
 end)
 local _efb = _yab(_cfb, 3, "\82\101\100\32\115\111\99\105\97\108")
 marcar(_efb, "\115\105", string.format("\37\115\32\97\109\105\103\111\115\32\183\32\37\115\32\115\101\103\117\105\100\111\114\101\115\32\183\32\115\105\103\117\101\32\97\32\37\115",
 tostring(_ye.Friends or "\63"), tostring(_ye.Followers or "\63"),
 tostring(_ye.Following or "\63")))
 local _ffb = _yab(_cfb, 4, "\69\120\112\101\114\105\101\110\99\105\97\32\109\225\115\32\118\105\115\105\116\97\100\97")
 comprobar(_pdb, _ffb, "\116\111\112\74\117\101\103\111", function()
 local t = _mc.juegos and _mc.juegos._qr
 if not t then
 local _f = getJSON("\104\116\116\112\115\58\47\47\103\97\109\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\50\47\117\115\101\114\115\47" .. _pv
 .. "\47\103\97\109\101\115\63\97\99\99\101\115\115\70\105\108\116\101\114\61\80\117\98\108\105\99\38\108\105\109\105\116\61\53\48\38\115\111\114\116\79\114\100\101\114\61\68\101\115\99")
 t = _f and type(_f._ye) == "\116\97\98\108\101" and _f._ye or nil
 end
 if not t or #t == 0 then return "\110\100" end
 local _gfb, visitas = nil, -1
 for _, g in ipairs(t._ye) do
 local v = tonumber(g.placeVisits) or 0
 if v > visitas then _gfb, visitas = g._i, v end
 end
 if not _gfb then return "\110\100" end
 return "\115\105", string.format("\37\115\32\40\37\100\32\118\105\115\105\116\97\115\41", tostring(_gfb), visitas)
 end)
 local _hfb = _yab(_cfb, 5, "\67\117\101\110\116\97\32\99\114\101\97\100\97")
 marcar(_hfb, "\115\105", tostring(_ye.Created or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 .. "\32\183\32" .. tostring(_ye.AccountAge or ""))
 end
 local _ifb = _wqb(3, "\73\110\102\111\114\109\101",
 "\86\117\101\108\99\97\32\97\32\116\101\120\116\111\32\116\111\100\111\32\108\111\32\113\117\101\32\104\97\121\32\101\110\32\101\115\116\97\32\112\101\115\116\97\241\97\44\32\121\97\32\114\101\115\117\101\108\116\111\46")
 local _gb = Instance.new("\84\101\120\116\66\117\116\116\111\110", _ifb)
 _gb.LayoutOrder = 2
 _gb.Size = UDim2.new(1, 0, 0, 28)
 _gb.BackgroundColor3 = C._idb
 _gb.Text = "\67\111\112\105\97\114\32\105\110\102\111\114\109\101"
 _gb.Font = Enum.Font.GothamBold; _gb.TextSize = 12; _gb.TextColor3 = C.onAccent
 _gb.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _gb).CornerRadius = UDim.new(0, 6)
 themed(_gb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 themed(_gb, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 _gb.MouseButton1Click:Connect(function()
 local l = {}
 l[#l + 1] = "\72\85\69\76\76\65\32\80\85\66\76\73\67\65\32\183\32" .. tostring(_ye.Username)
 .. "\32\40\85\115\101\114\73\100\32" .. tostring(_pv) .. "\41"
 l[#l + 1] = "\80\101\114\102\105\108\58\32" .. tostring(_ye.ProfileUrl)
 l[#l + 1] = ""
 l[#l + 1] = "\80\82\69\83\69\78\67\73\65"
 for _, k in ipairs({ "\100\101\118\102\111\114\117\109", "\106\117\101\103\111\115", "\103\114\117\112\111\115", "\99\97\116\97\108\111\103\111",
 "\105\110\118\101\110\116\97\114\105\111", "\114\111\108\105\109\111\110\115" }) do
 local r = _mc[k]
 local v = r and (r._ieb or ({ si = "\80\114\101\115\101\110\116\101", no = "\78\111\32\101\110\99\111\110\116\114\97\100\111" })[r._xi])
 l[#l + 1] = "\32\32" .. k .. "\58\32" .. tostring(v or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 end
 l[#l + 1] = ""
 l[#l + 1] = "\69\83\84\65\68\79\32\68\69\32\76\65\32\67\85\69\78\84\65"
 l[#l + 1] = "\32\32\101\115\116\97\100\111\58\32" .. tostring(_mc._xi and _mc._xi._ieb or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 l[#l + 1] = "\32\32\105\110\115\105\103\110\105\97\32\118\101\114\105\102\105\99\97\100\97\58\32"
 .. tostring(_mc.verificada and _mc.verificada._ieb or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 local _jfb = _mc.nombres and _mc.nombres._qr
 l[#l + 1] = "\32\32\110\111\109\98\114\101\115\32\112\114\101\118\105\111\115\58\32"
 .. (_jfb and ((#_jfb > 0) and table.concat(_jfb, "\44\32") or "\110\105\110\103\117\110\111") or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 if _mc.badgesTotal then
 l[#l + 1] = ""
 l[#l + 1] = "\82\69\67\79\76\69\67\67\73\79\78"
 l[#l + 1] = "\32\32\98\97\100\103\101\115\58\32" .. tostring(_mc.badgesTotal._ieb or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 if _mc.topJuego then
 l[#l + 1] = "\32\32\101\120\112\101\114\105\101\110\99\105\97\32\116\111\112\58\32" .. tostring(_mc.topJuego._ieb or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 end
 end
 _fc(table.concat(l, "\10"))
 _gl.Text = "\73\110\102\111\114\109\101\32\99\111\112\105\97\100\111\46"
 _gb.Text = "\67\111\112\105\97\100\111"
 task.delay(1.2, function()
 if _gb and _gb.Parent then _gb.Text = "\67\111\112\105\97\114\32\105\110\102\111\114\109\101" end
 end)
 end)
 end
 local function alMostrar()
 local _pv = _mr and _mr.UserId or nil
 if _pv == _eeb and (_pv ~= nil or _eeb ~= nil) then return end
 construir()
 end
 _G.NXOSINT = {
 _dm  = _dm,
 _fm = alMostrar,
 reset = function()
 _jv = _jv + 1
 _eeb = nil
 if _dm.Visible then construir() end
 end,
 stop = function() _jv = _jv + 1 end,
 }
end
createTab("\80\101\114\102\105\108", _jm)
createTab("\69\115\116\97\100\237\115\116\105\99\97\115", _lm)
createTab("\73\116\101\109\115", _nm)
createTab("\65\110\225\108\105\115\105\115", _pm)
createTab("\72\117\101\108\108\97", _G.NXOSINT._dm, _G.NXOSINT._fm)
createTab("\65\106\117\115\116\101\115", _rm)
_G.NXAnalyze = function(_jj)
 _jj = tostring(_jj or ""):gsub("\37\115", "")
 if _jj == "" then return end
 pcall(function()
 setHidden(false)
 _wk.Text = _jj
 showPage(_jm)
 end)
 _el(_jj)
end
_pd.onReady(function()
 local _pv = _a.UserId
 if not _pd.isLicensed(_pv) then
 showLicenseDenied()
 end
 local _wn = _pd.getWarning(_pv)
 if _wn then
 task.delay(1.2, function() showNXWarning(_wn) end)
 end
 if _pd.isAdmin(_pv) then
 buildAdminPanel()
 end
end)
local _kfb, dragEndedConn
local function stopDrag()
 if _kfb then _kfb:Disconnect(); _kfb = nil end
 if dragEndedConn then dragEndedConn:Disconnect(); dragEndedConn = nil end
end
track(_jk.InputBegan:Connect(function(_jj)
 local t = _jj.UserInputType
 if t ~= Enum.UserInputType.MouseButton1 and t ~= Enum.UserInputType.Touch then return end
 local _lfb = _jj.Position
 local _mfb = _ek.Position
 stopDrag()
 _fj.setDragSquish(true)
 _kfb = UserInputService.InputChanged:Connect(function(i)
 if i.UserInputType == Enum.UserInputType.MouseMovement
 or i.UserInputType == Enum.UserInputType.Touch then
 local d = i.Position - _lfb
 _ek.Position = UDim2.new(
 _mfb.X.Scale, _mfb.X.Offset + d.X,
 _mfb.Y.Scale, _mfb.Y.Offset + d.Y
 )
 end
 end)
 dragEndedConn = _jj.Changed:Connect(function()
 if _jj.UserInputState == Enum.UserInputState.End then
 stopDrag(); _fj.setDragSquish(false)
 end
 end)
end))
local _nfb = Instance.new("\84\101\120\116\66\117\116\116\111\110", _ek)
_nfb.Name = "\82\101\115\105\122\101\71\114\105\112"
_nfb.Size = UDim2.new(0, 18, 0, 18)
_nfb.Position = UDim2.new(1, -20, 1, -20)
_nfb.BackgroundColor3 = C._idb
_nfb.BackgroundTransparency = 0.25
_nfb.Text = "\10529"
_nfb.Font = Enum.Font.GothamBold
_nfb.TextSize = 14
_nfb.TextColor3 = C.onAccent
_nfb.AutoButtonColor = false
_nfb.BorderSizePixel = 0
_nfb.ZIndex = 5
Instance.new("\85\73\67\111\114\110\101\114", _nfb).CornerRadius = UDim.new(0, 4)
themed(_nfb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
themed(_nfb, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
local _ofb, resEndedConn
local function stopResize()
 if _ofb then _ofb:Disconnect(); _ofb = nil end
 if resEndedConn then resEndedConn:Disconnect(); resEndedConn = nil end
end
track(_nfb.InputBegan:Connect(function(_jj)
 local t = _jj.UserInputType
 if t ~= Enum.UserInputType.MouseButton1 and t ~= Enum.UserInputType.Touch then return end
 local _lfb = _jj.Position
 local _pfb = _ek.AbsoluteSize
 stopResize()
 _ofb = UserInputService.InputChanged:Connect(function(i)
 if i.UserInputType == Enum.UserInputType.MouseMovement
 or i.UserInputType == Enum.UserInputType.Touch then
 local d = i.Position - _lfb
 local _qfb = math._de(_dk, _pfb.X + d.X)
 local _rfb = math._de(MIN_H, _pfb.Y + d.Y)
 _ek.Size = UDim2.new(0, _qfb, 0, _rfb)
 end
 end)
 resEndedConn = _jj.Changed:Connect(function()
 if _jj.UserInputState == Enum.UserInputState.End then stopResize() end
 end)
end))
if not _ec then
 _gl.Text = "\65\118\105\115\111\58\32" .. _dc .. "\32\110\111\32\101\120\112\111\110\101\32\39\114\101\113\117\101\115\116\39\59\32\115\101\32\117\115\97\114\225\32\103\97\109\101\58\72\116\116\112\71\101\116\46"
end
do
 local _sfb = {
 URL     = "\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\100\114\101\101\110\110\120\47\110\120\45\109\101\115\115\97\103\101\115\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\109\101\115\115\97\103\101\115\46\106\115\111\110",
 REFRESH = 120,
 RETRY   = 20,
 WIDTH   = 330,
 DEFAULT_DURATION = 8,
 MAX_VISIBLE = 4,
 GAP = 0.18,
 }
 local _tfb = "\78\88\95\109\115\103\115\95\115\101\101\110\46\106\115\111\110"
 local _yh = {}
 if _c then
 pcall(function()
 if isfile(_tfb) then
 local d = HttpService:JSONDecode(readfile(_tfb))
 if type(d) == "\116\97\98\108\101" then _yh = d end
 end
 end)
 end
 local function markSeen(_hd)
 if not _hd then return end
 _yh[tostring(_hd)] = true
 if _c then
 pcall(function() writefile(_tfb, HttpService:JSONEncode(_yh)) end)
 end
 end
 local function typeRole(t)
 t = tostring(t or "\105\110\102\111"):lower()
 if t == "\119\97\114\110" or t == "\119\97\114\110\105\110\103" then return "\119\97\114\110" end
 if t == "\101\114\114\111\114" or t == "\98\97\100" or t == "\100\97\110\103\101\114" then return "\98\97\100" end
 if t == "\115\117\99\99\101\115\115" or t == "\111\107" or t == "\103\111\111\100" then return "\103\111\111\100" end
 return "\97\99\99\101\110\116"
 end
 local function typeColor(t) return C[typeRole(t)] or C._idb end
 local function typeEmoji(t)
 t = tostring(t or "\105\110\102\111"):lower()
 if t == "\119\97\114\110" or t == "\119\97\114\110\105\110\103" then return "" end
 if t == "\101\114\114\111\114" or t == "\98\97\100" or t == "\100\97\110\103\101\114" then return "" end
 if t == "\115\117\99\99\101\115\115" or t == "\111\107" or t == "\103\111\111\100" then return "" end
 return ""
 end
 local _fd = game:GetService("\67\111\110\116\101\110\116\80\114\111\118\105\100\101\114")
 local function normImg(v)
 if v == nil then return nil end
 if type(v) == "\110\117\109\98\101\114" then v = "\114\98\120\97\115\115\101\116\105\100\58\47\47" .. v end
 v = tostring(v)
 if v == "" or v == "\114\98\120\97\115\115\101\116\105\100\58\47\47\48" then return nil end
 local d = v:match("\94\40\37\100\43\41\36"); if d then v = "\114\98\120\97\115\115\101\116\105\100\58\47\47" .. d end
 return (v:match("\94\114\98\120\97\115\115\101\116\105\100\58\47\47\37\100\43\36") or v:match("\94\114\98\120\116\104\117\109\98") or v:match("\94\104\116\116\112")) and v or nil
 end
 local _udb = Instance.new("\70\114\97\109\101")
 _udb.Name = "\78\88\66\114\111\97\100\99\97\115\116"
 _udb.AnchorPoint = Vector2.new(1, 0)
 _udb.Position = UDim2.new(1, -16, 0, 16)
 _udb.Size = UDim2.new(0, _sfb.WIDTH, 1, -32)
 _udb.BackgroundTransparency = 1
 _udb.ClipsDescendants = false
 _udb.ZIndex = 300
 _udb.Parent = _zi
 local _ufb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _udb)
 _ufb.FillDirection = Enum.FillDirection.Vertical
 _ufb.HorizontalAlignment = Enum.HorizontalAlignment.Right
 _ufb.VerticalAlignment = Enum.VerticalAlignment.Top
 _ufb.SortOrder = Enum.SortOrder.LayoutOrder
 _ufb.Padding = UDim.new(0, 10)
 local _vfb = {}
 local _mb = 0
 onRepaint(function()
 for _, ti in ipairs(_vfb) do
 local _wfb = typeColor(ti.type)
 for _, el in ipairs(ti.accentEls) do
 pcall(function() el._p[el._q] = _wfb end)
 end
 end
 end)
 local function reflowLimit()
 while #_vfb > _sfb.MAX_VISIBLE do
 local _kf = _vfb[1]
 if _kf and _kf.dismiss then _kf.dismiss() else table.remove(_vfb, 1) end
 end
 end
 local function showToast(_u)
 _u = _u or {}
 local _xfb = _u.type or "\105\110\102\111"
 local _wfb   = typeColor(_xfb)
 _mb = _mb + 1
 local _yfb = Instance.new("\70\114\97\109\101")
 _yfb.Name = "\83\108\111\116"
 _yfb.BackgroundTransparency = 1
 _yfb.Size = UDim2.new(0, _sfb.WIDTH, 0, 0)
 _yfb.AutomaticSize = Enum.AutomaticSize.Y
 _yfb.ClipsDescendants = false
 _yfb.LayoutOrder = -_mb
 _yfb.ZIndex = 301
 _yfb.Parent = _udb
 local _o = Instance.new("\67\97\110\118\97\115\71\114\111\117\112")
 _o.Name = "\67\97\114\100"
 _o.Size = UDim2.new(1, 0, 0, 0)
 _o.AutomaticSize = Enum.AutomaticSize.Y
 _o.BackgroundColor3 = C._o
 _o.BackgroundTransparency = 0.02
 _o.BorderSizePixel = 0
 _o.GroupTransparency = _gj.enabled and 1 or 0
 _o.Position = _gj.enabled and UDim2.new(0, _sfb.WIDTH, 0, 0) or UDim2.new(0, 0, 0, 0)
 _o.ZIndex = 301
 _o.Parent = _yfb
 themed(_o, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 Instance.new("\85\73\67\111\114\110\101\114", _o).CornerRadius = UDim.new(0, 12)
 local _hk = Instance.new("\85\73\83\116\114\111\107\101", _o)
 _hk.Color = C._whb; _hk.Transparency = 0.05; _hk.Thickness = 1
 themed(_hk, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _kdb = Instance.new("\70\114\97\109\101", _o)
 _kdb.Size = UDim2.new(0, 4, 1, 0)
 _kdb.BackgroundColor3 = _wfb
 _kdb.BorderSizePixel = 0
 _kdb.ZIndex = 303
 Instance.new("\85\73\67\111\114\110\101\114", _kdb).CornerRadius = UDim.new(0, 4)
 local _zfb = Instance.new("\84\101\120\116\66\117\116\116\111\110", _o)
 _zfb.AnchorPoint = Vector2.new(1, 0)
 _zfb.Position = UDim2.new(1, -8, 0, 8)
 _zfb.Size = UDim2.new(0, 20, 0, 20)
 _zfb.BackgroundTransparency = 1
 _zfb.Text = "\10005"
 _zfb.Font = Enum.Font.GothamBold
 _zfb.TextSize = 14
 _zfb.TextColor3 = C.subtext
 _zfb.AutoButtonColor = false
 _zfb.ZIndex = 305
 themed(_zfb, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _jl = Instance.new("\70\114\97\109\101", _o)
 _jl.BackgroundTransparency = 1
 _jl.Size = UDim2.new(1, 0, 0, 0)
 _jl.AutomaticSize = Enum.AutomaticSize.Y
 _jl.ZIndex = 302
 local _agb = Instance.new("\85\73\80\97\100\100\105\110\103", _jl)
 _agb.PaddingLeft = UDim.new(0, 16)
 _agb.PaddingRight = UDim.new(0, 30)
 _agb.PaddingTop = UDim.new(0, 12)
 _agb.PaddingBottom = UDim.new(0, 12)
 local _bgb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _jl)
 _bgb.FillDirection = Enum.FillDirection.Vertical
 _bgb.SortOrder = Enum.SortOrder.LayoutOrder
 _bgb.Padding = UDim.new(0, 6)
 local _hs = Instance.new("\70\114\97\109\101", _jl)
 _hs.BackgroundTransparency = 1
 _hs.Size = UDim2.new(1, 0, 0, 24)
 _hs.LayoutOrder = 1
 _hs.ZIndex = 302
 local _cgb = Instance.new("\70\114\97\109\101", _hs)
 _cgb.Size = UDim2.new(0, 24, 0, 24)
 _cgb.BackgroundColor3 = _wfb
 _cgb.BackgroundTransparency = 0.82
 _cgb.BorderSizePixel = 0
 _cgb.ZIndex = 302
 Instance.new("\85\73\67\111\114\110\101\114", _cgb).CornerRadius = UDim.new(0, 7)
 local _dgb = Instance.new("\84\101\120\116\76\97\98\101\108", _cgb)
 _dgb.BackgroundTransparency = 1
 _dgb.Size = UDim2.new(1, 0, 1, 0)
 _dgb.Text = typeEmoji(_xfb)
 _dgb.Font = Enum.Font.GothamBold
 _dgb.TextSize = 14
 _dgb.ZIndex = 303
 local _md = Instance.new("\73\109\97\103\101\76\97\98\101\108", _cgb)
 _md.BackgroundTransparency = 1
 _md.Size = UDim2.new(1, 0, 1, 0)
 _md.Visible = false
 _md.ScaleType = Enum.ScaleType.Fit
 _md.ZIndex = 303
 Instance.new("\85\73\67\111\114\110\101\114", _md).CornerRadius = UDim.new(0, 7)
 local _lk = Instance.new("\84\101\120\116\76\97\98\101\108", _hs)
 _lk.BackgroundTransparency = 1
 _lk.Position = UDim2.new(0, 32, 0, 0)
 _lk.Size = UDim2.new(1, -32, 1, 0)
 _lk.Text = tostring(_u._lk or "\65\118\105\115\111")
 _lk.Font = Enum.Font.GothamBold
 _lk.TextSize = 15
 _lk.TextColor3 = C._hb
 _lk.TextXAlignment = Enum.TextXAlignment.Left
 _lk.TextYAlignment = Enum.TextYAlignment.Center
 _lk.TextTruncate = Enum.TextTruncate.AtEnd
 _lk.ZIndex = 302
 themed(_lk, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _x = Instance.new("\84\101\120\116\76\97\98\101\108", _jl)
 _x.BackgroundTransparency = 1
 _x.Size = UDim2.new(1, 0, 0, 0)
 _x.AutomaticSize = Enum.AutomaticSize.Y
 _x.Text = tostring(_u._x or "")
 _x.Font = Enum.Font.Gotham
 _x.TextSize = 13
 _x.TextColor3 = C.subtext
 _x.TextWrapped = true
 _x.TextXAlignment = Enum.TextXAlignment.Left
 _x.TextYAlignment = Enum.TextYAlignment.Top
 _x.LayoutOrder = 2
 _x.ZIndex = 302
 themed(_x, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 if _x.Text == "" then _x.Visible = false end
 local _egb = normImg(_u.image)
 if _egb then
 task.spawn(function()
 local _fgb = Instance.new("\73\109\97\103\101\76\97\98\101\108"); _fgb.Image = _egb
 local _g = pcall(function() _fd:PreloadAsync({ _fgb }) end)
 _fgb:Destroy()
 if _g and _md.Parent then
 _md.Image = _egb; _md.Visible = true; _dgb.Visible = false
 end
 end)
 end
 local _ggb = tonumber(_u._ggb) or _sfb.DEFAULT_DURATION
 local _hgb
 if _ggb and _ggb > 0 then
 local _igb = Instance.new("\70\114\97\109\101", _jl)
 _igb.Size = UDim2.new(1, 0, 0, 3)
 _igb.BackgroundColor3 = C.neutral
 _igb.BackgroundTransparency = 0.3
 _igb.BorderSizePixel = 0
 _igb.LayoutOrder = 3
 _igb.ZIndex = 302
 themed(_igb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\110\101\117\116\114\97\108")
 Instance.new("\85\73\67\111\114\110\101\114", _igb).CornerRadius = UDim.new(1, 0)
 _hgb = Instance.new("\70\114\97\109\101", _igb)
 _hgb.Size = UDim2.new(1, 0, 1, 0)
 _hgb.BackgroundColor3 = _wfb
 _hgb.BorderSizePixel = 0
 _hgb.ZIndex = 303
 Instance.new("\85\73\67\111\114\110\101\114", _hgb).CornerRadius = UDim.new(1, 0)
 end
 local _k = {
 _yfb = _yfb, _o = _o, type = _xfb, _pj = false, _dead = false,
 accentEls = {
 { _p = _kdb, _q = "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51" },
 { _p = _cgb, _q = "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51" },
 },
 }
 if _hgb then table.insert(_k.accentEls, { _p = _hgb, _q = "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51" }) end
 local function dismiss()
 if _k._dead then return end
 _k._dead = true
 for i, v in ipairs(_vfb) do if v == _k then table.remove(_vfb, i) break end end
 motionTween(_o, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
 { GroupTransparency = 1, Position = UDim2.new(0, _sfb.WIDTH, 0, 0) }, function()
 if _yfb and _yfb.Parent then _yfb:Destroy() end
 end)
 end
 _k.dismiss = dismiss
 _zfb.MouseButton1Click:Connect(dismiss)
 _o.MouseEnter:Connect(function() _k._pj = true end)
 _o.MouseLeave:Connect(function() _k._pj = false end)
 table.insert(_vfb, _k)
 reflowLimit()
 motionTween(_o, TweenInfo.new(0.34, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
 { GroupTransparency = 0, Position = UDim2.new(0, 0, 0, 0) })
 if _ggb and _ggb > 0 then
 task.spawn(function()
 local _qdb = 0
 while _qdb < _ggb and not _k._dead and _yfb.Parent do
 task.wait(0.05)
 if not _k._pj then
 _qdb = _qdb + 0.05
 if _hgb then
 local _jgb = math.clamp(1 - (_qdb / _ggb), 0, 1)
 _hgb.Size = UDim2.new(_jgb, 0, 1, 0)
 end
 end
 end
 if not _k._dead then dismiss() end
 end)
 end
 return _k
 end
 local function showRobloxModal(_u)
 _u = _u or {}
 local _kgb = _zi:FindFirstChild("\78\88\66\114\111\97\100\99\97\115\116\77\111\100\97\108")
 if _kgb then _kgb:Destroy() end
 local _lgb = Instance.new("\70\114\97\109\101")
 _lgb.Name = "\78\88\66\114\111\97\100\99\97\115\116\77\111\100\97\108"
 _lgb.Size = UDim2.new(1, 0, 1, 0)
 _lgb.Position = UDim2.new(0, 0, 0, 0)
 _lgb.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 _lgb.BackgroundTransparency = _gj.enabled and 1 or 0.45
 _lgb.BorderSizePixel = 0
 _lgb.Active = true
 _lgb.ZIndex = 400
 _lgb.Parent = _zi
 local _mgb = Instance.new("\67\97\110\118\97\115\71\114\111\117\112")
 _mgb.Name = "\80\97\110\101\108"
 _mgb.AnchorPoint = Vector2.new(0.5, 0.5)
 _mgb.Position = UDim2.new(0.5, 0, 0.5, 0)
 _mgb.Size = UDim2.new(0, 420, 0, 0)
 _mgb.AutomaticSize = Enum.AutomaticSize.Y
 _mgb.BackgroundColor3 = Color3.fromRGB(40, 42, 51)
 _mgb.BackgroundTransparency = 0.02
 _mgb.BorderSizePixel = 0
 _mgb.GroupTransparency = _gj.enabled and 1 or 0
 _mgb.ZIndex = 401
 _mgb.Parent = _lgb
 Instance.new("\85\73\67\111\114\110\101\114", _mgb).CornerRadius = UDim.new(0, 10)
 local _tdb = Instance.new("\85\73\83\116\114\111\107\101", _mgb)
 _tdb.Color = Color3.fromRGB(70, 73, 85); _tdb.Transparency = 0.4; _tdb.Thickness = 1
 local _cp = Instance.new("\85\73\83\99\97\108\101", _mgb)
 _cp.Scale = _gj.enabled and 0.9 or 1
 local _tj = Instance.new("\85\73\80\97\100\100\105\110\103", _mgb)
 _tj.PaddingTop = UDim.new(0, 22); _tj.PaddingBottom = UDim.new(0, 18)
 _tj.PaddingLeft = UDim.new(0, 26); _tj.PaddingRight = UDim.new(0, 26)
 local _ngb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _mgb)
 _ngb.FillDirection = Enum.FillDirection.Vertical
 _ngb.HorizontalAlignment = Enum.HorizontalAlignment.Center
 _ngb.SortOrder = Enum.SortOrder.LayoutOrder
 _ngb.Padding = UDim.new(0, 14)
 local _lk = Instance.new("\84\101\120\116\76\97\98\101\108", _mgb)
 _lk.BackgroundTransparency = 1
 _lk.Size = UDim2.new(1, 0, 0, 26)
 _lk.Text = tostring(_u._lk or "\69\114\114\111\114\32\97\108\32\117\110\105\114\115\101")
 _lk.Font = Enum.Font.GothamBold
 _lk.TextSize = 21
 _lk.TextColor3 = Color3.fromRGB(255, 255, 255)
 _lk.TextXAlignment = Enum.TextXAlignment.Center
 _lk.LayoutOrder = 1
 _lk.ZIndex = 402
 local _jq = Instance.new("\70\114\97\109\101", _mgb)
 _jq.Size = UDim2.new(1, -10, 0, 1)
 _jq.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 _jq.BackgroundTransparency = 0.82
 _jq.BorderSizePixel = 0
 _jq.LayoutOrder = 2
 _jq.ZIndex = 402
 local _vp = tostring(_u._x or "")
 local _he = tonumber(_u.errorCode)
 if _he then _vp = _vp .. "\10\40\67\243\100\105\103\111\32\100\101\32\101\114\114\111\114\58\32" .. tostring(_he) .. "\41" end
 local _x = Instance.new("\84\101\120\116\76\97\98\101\108", _mgb)
 _x.BackgroundTransparency = 1
 _x.Size = UDim2.new(1, 0, 0, 0)
 _x.AutomaticSize = Enum.AutomaticSize.Y
 _x.Text = _vp
 _x.Font = Enum.Font.Gotham
 _x.TextSize = 15
 _x.TextColor3 = Color3.fromRGB(225, 226, 232)
 _x.TextWrapped = true
 _x.TextXAlignment = Enum.TextXAlignment.Center
 _x.TextYAlignment = Enum.TextYAlignment.Top
 _x.LineHeight = 1.1
 _x.LayoutOrder = 3
 _x.ZIndex = 402
 local _gb = Instance.new("\84\101\120\116\66\117\116\116\111\110", _mgb)
 _gb.Size = UDim2.new(1, 0, 0, 42)
 _gb.BackgroundColor3 = Color3.fromRGB(228, 229, 234)
 _gb.AutoButtonColor = true
 _gb.Text = tostring(_u.button or "\83\97\108\105\114")
 _gb.Font = Enum.Font.GothamMedium
 _gb.TextSize = 16
 _gb.TextColor3 = Color3.fromRGB(60, 62, 70)
 _gb.LayoutOrder = 4
 _gb.ZIndex = 402
 Instance.new("\85\73\67\111\114\110\101\114", _gb).CornerRadius = UDim.new(0, 8)
 local _ogb = false
 local function dismiss()
 if _ogb then return end
 _ogb = true
 motionTween(_lgb, TweenInfo.new(0.18), { BackgroundTransparency = 1 })
 motionTween(_cp, TweenInfo.new(0.18), { Scale = 0.9 })
 motionTween(_mgb, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
 { GroupTransparency = 1 }, function()
 if _lgb and _lgb.Parent then _lgb:Destroy() end
 end)
 end
 _gb.MouseButton1Click:Connect(function()
 dismiss()
 if type(_u.onButton) == "\102\117\110\99\116\105\111\110" then pcall(_u.onButton) end
 end)
 motionTween(_lgb, TweenInfo.new(0.18), { BackgroundTransparency = 0.45 })
 motionTween(_mgb, TweenInfo.new(0.26, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { GroupTransparency = 0 })
 motionTween(_cp, TweenInfo.new(0.26, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
 local _ggb = tonumber(_u._ggb) or 0
 if _ggb > 0 then
 task.delay(_ggb, function() if not _ogb then dismiss() end end)
 end
 return { dismiss = dismiss }
 end
 local _pgb = "\78\88\95\108\111\99\107\46\106\115\111\110"
 local function getLock()
 local _ot
 local function consider(d)
 if type(d) == "\116\97\98\108\101" then
 local u = tonumber(d["\117\110\116\105\108"])
 if u and u > os.time() and (not _ot or u > tonumber(_ot["\117\110\116\105\108"])) then _ot = d end
 end
 end
 if type(_G.NX_LOCK) == "\116\97\98\108\101" then consider(_G.NX_LOCK) end
 if _c then
 pcall(function()
 if isfile(_pgb) then consider(HttpService:JSONDecode(readfile(_pgb))) end
 end)
 end
 return _ot
 end
 local function setLock(d)
 _G.NX_LOCK = d
 if _c then pcall(function() writefile(_pgb, HttpService:JSONEncode(d)) end) end
 end
 local function clearLock()
 _G.NX_LOCK = nil
 if _c then pcall(function() writefile(_pgb, HttpService:JSONEncode({ ["\117\110\116\105\108"] = 0 })) end) end
 end
 local function fmtRemaining(_qgb)
 _qgb = math._de(0, math.floor(_qgb))
 local m = math.floor(_qgb / 60)
 local s = _qgb % 60
 if m > 0 then return string.format("\37\100\32\109\105\110\32\37\100\32\115\101\103", m, s) end
 return string.format("\37\100\32\115\101\103", s)
 end
 local _rgb = false
 local function closeTool()
 if _rgb then return end
 _rgb = true
 pcall(function() _zi.Enabled = false end)
 task.delay(0.2, function() pcall(function() _zi:Destroy() end) end)
 end
 local function showLockPopup(d)
 end
 local function triggerLockout(_qgb, _tgb)
 end
 local function lockSecondsOf(m)
 local s = tonumber(m.lock) or tonumber(m.lockSeconds)
 if not s and tonumber(m.lockMinutes) then s = tonumber(m.lockMinutes) * 60 end
 return tonumber(s) or 0
 end
 local _sgb = {}
 local function eligible(m)
 if type(m) ~= "\116\97\98\108\101" then return false end
 if m.enabled == false then return false end
 local _ugb = tonumber(m.expires)
 if _ugb and _ugb > 0 and os.time() > _ugb then return false end
 local _vgb = m.targets
 if type(_vgb) == "\116\97\98\108\101" and #_vgb > 0 then
 local _wgb, _g = _a.UserId, false
 for _, u in ipairs(_vgb) do if tonumber(u) == _wgb then _g = true break end end
 if not _g then return false end
 end
 local _hd = m._hd and tostring(m._hd) or nil
 if _hd then
 if _sgb[_hd] then return false end
 if m.once and _yh[_hd] then return false end
 end
 return true
 end
 local function consume(_ie)
 local _yf = _ie
 if type(_ie) == "\116\97\98\108\101" and _ie.messages then _yf = _ie.messages end
 if type(_yf) ~= "\116\97\98\108\101" then return end
 local _xgb = {}
 if #_yf > 0 then
 _xgb = _yf
 else
 for k, v in pairs(_yf) do
 if type(v) == "\116\97\98\108\101" then v._hd = v._hd or k; table.insert(_xgb, v) end
 end
 end
 task.spawn(function()
 for _, m in ipairs(_xgb) do
 if m.unlock == true then
 if eligible(m) then clearLock() end
 elseif eligible(m) then
 local _hd = m._hd and tostring(m._hd) or nil
 if _hd then _sgb[_hd] = true; if m.once then markSeen(_hd) end end
 local _ygb = lockSecondsOf(m)
 if _ygb > 0 then
 local _zgb = getLock()
 if _zgb then
 showLockPopup(_zgb)
 elseif not (_hd and _yh[_hd]) then
 triggerLockout(_ygb, {
 _hd = _hd, _lk = m._lk, _x = m._x,
 button = m.button, errorCode = m.errorCode or m._he,
 })
 if _hd then markSeen(_hd) end
 end
 else
 pcall(showToast, {
 type = m.type, _lk = m._lk, _x = m._x, image = m.image,
 _ggb = tonumber(m._ggb) or _sfb.DEFAULT_DURATION,
 })
 end
 task.wait(_sfb.GAP)
 end
 end
 end)
 end
 local function fetchNow()
 task.spawn(function()
 local _x = rawGet(_sfb.URL)
 if not _x then return end
 local _g, _ie = pcall(function() return HttpService:JSONDecode(_x) end)
 if _g and type(_ie) == "\116\97\98\108\101" then consume(_ie) end
 end)
 end
 do
 clearLock()
 end
 task.spawn(function()
 local _ahb = false
 while not _ahb and _zi.Parent do
 local _x = rawGet(_sfb.URL)
 if _x then
 local _g, _ie = pcall(function() return HttpService:JSONDecode(_x) end)
 if _g and type(_ie) == "\116\97\98\108\101" then _ahb = true; consume(_ie) end
 end
 if not _ahb then task.wait(_sfb.RETRY) end
 end
 if _sfb.REFRESH and _sfb.REFRESH > 0 then
 while _zi.Parent do
 task.wait(_sfb.REFRESH)
 if _zi.Parent then fetchNow() end
 end
 end
 end)
 _G.NXBroadcast = {
 show    = function(o) pcall(showToast, o or {}) end,
 modal   = function(o) pcall(showRobloxModal, o or {}) end,
 refresh = function() fetchNow() end,
 clearSeen = function()
 _yh = {}
 if _c then pcall(function() writefile(_tfb, HttpService:JSONEncode(_yh)) end) end
 end,
 test = function()
 pcall(showToast, { type = "\105\110\102\111",    _lk = "\65\118\105\115\111\32\100\101\32\112\114\117\101\98\97", _x = "\69\115\116\111\32\101\115\32\117\110\32\109\101\110\115\97\106\101\32\105\110\102\111\114\109\97\116\105\118\111\32\100\101\32\78\88\46", _ggb = 6 })
 task.delay(0.2, function() pcall(showToast, { type = "\115\117\99\99\101\115\115", _lk = "\161\76\105\115\116\111\33",  _x = "\79\112\101\114\97\99\105\243\110\32\99\111\109\112\108\101\116\97\100\97\32\99\111\110\32\233\120\105\116\111\46",      _ggb = 6 }) end)
 task.delay(0.4, function() pcall(showToast, { type = "\119\97\114\110",    _lk = "\67\117\105\100\97\100\111",  _x = "\69\115\116\111\32\101\115\32\117\110\97\32\97\100\118\101\114\116\101\110\99\105\97\32\105\109\112\111\114\116\97\110\116\101\46",   _ggb = 6 }) end)
 task.delay(0.6, function() pcall(showToast, { type = "\101\114\114\111\114",   _lk = "\69\114\114\111\114",    _x = "\65\108\103\111\32\115\97\108\105\243\32\109\97\108\46\32\82\101\118\105\115\97\32\108\97\32\99\111\110\115\111\108\97\46",    _ggb = 0 }) end)
 end,
 testBan = function()
 pcall(showRobloxModal, {
 _lk = "\69\114\114\111\114\32\97\108\32\117\110\105\114\115\101",
 _x  = "\69\115\116\97\32\101\120\112\101\114\105\101\110\99\105\97\32\111\32\115\117\115\32\109\111\100\101\114\97\100\111\114\101\115\32\116\101\32\101\120\112\117\108\115\97\114\111\110\32\112\111\114\32\52\32\109\105\110\117\116\111\115\46\32\77\101\110\115\97\106\101\32\100\101\32\109\111\100\101\114\97\99\105\243\110\58\10\10\82\111\98\108\111\120\32\104\97\115\32\100\101\116\101\114\109\105\110\101\100\32\116\104\97\116\32\99\111\110\116\101\110\116\32\105\110\32\116\104\105\115\32\101\120\112\101\114\105\101\110\99\101\32\118\105\111\108\97\116\101\100\32\111\117\114\32\67\111\109\109\117\110\105\116\121\32\83\116\97\110\100\97\114\100\115\46\32\89\111\117\32\104\97\118\101\32\98\101\101\110\32\116\101\109\112\111\114\97\114\105\108\121\32\114\101\109\111\118\101\100\46",
 button = "\83\97\108\105\114",
 errorCode = 600,
 _ggb = 0,
 })
 end,
 lock = function(_qgb, _u)
 _u = _u or {}
 _u._lk = _u._lk or "\69\114\114\111\114\32\97\108\32\117\110\105\114\115\101"
 _u.errorCode = _u.errorCode or 600
 triggerLockout(tonumber(_qgb) or 60, _u)
 end,
 unlock     = function() clearLock() end,
 lockStatus = function() return getLock() end,
 testLock   = function(_qgb)
 triggerLockout(tonumber(_qgb) or 30, {
 _lk = "\69\114\114\111\114\32\97\108\32\117\110\105\114\115\101",
 _x  = "\69\115\116\97\32\101\120\112\101\114\105\101\110\99\105\97\32\111\32\115\117\115\32\109\111\100\101\114\97\100\111\114\101\115\32\116\101\32\101\120\112\117\108\115\97\114\111\110\32\116\101\109\112\111\114\97\108\109\101\110\116\101\46\32\77\101\110\115\97\106\101\32\100\101\32\109\111\100\101\114\97\99\105\243\110\58\10\10\82\111\98\108\111\120\32\104\97\115\32\100\101\116\101\114\109\105\110\101\100\32\116\104\97\116\32\99\111\110\116\101\110\116\32\105\110\32\116\104\105\115\32\101\120\112\101\114\105\101\110\99\101\32\118\105\111\108\97\116\101\100\32\111\117\114\32\67\111\109\109\117\110\105\116\121\32\83\116\97\110\100\97\114\100\115\46\32\89\111\117\32\104\97\118\101\32\98\101\101\110\32\116\101\109\112\111\114\97\114\105\108\121\32\114\101\109\111\118\101\100\46",
 button = "\83\97\108\105\114", errorCode = 600,
 })
 end,
 }
end
print(("\91\80\114\111\102\105\108\101\32\65\110\97\108\121\122\101\114\32\118\51\46\57\46\51\93\32\67\97\114\103\97\100\111\32\99\111\114\114\101\99\116\97\109\101\110\116\101\46\32\69\120\101\99\117\116\111\114\58\32\37\115"):format(_dc))
do
 if _G._chb and _G._chb.Stop then
 pcall(_G._chb.Stop)
 end
 local Players       = game:GetService("\80\108\97\121\101\114\115")
 local RunService    = game:GetService("\82\117\110\83\101\114\118\105\99\101")
 local HttpService   = game:GetService("\72\116\116\112\83\101\114\118\105\99\101")
 local TweenService  = game:GetService("\84\119\101\101\110\83\101\114\118\105\99\101")
 local _bhb = Players._bhb
 if not _bhb then
 Players:GetPropertyChangedSignal("\76\111\99\97\108\80\108\97\121\101\114"):Wait()
 _bhb = Players._bhb
 end
 local _chb = {}
 _chb._running = false
 _chb._anim    = true
 local function lerp(a, b, t) return a + (b - a) * t end
 local _sfb = {
 TAGS_URL          = _G.NXTagRepo._ld,
 REFRESH_INTERVAL  = 300,
 RETRY_INTERVAL    = 10,
 HEAD_WAIT_TIMEOUT = 10,
 SHOW_OWN_TAG      = true,
 ALWAYS_ON_TOP     = true,
 MAX_DISTANCE      = 0,
 STUDS_OFFSET_Y    = 2.6,
 CIRCLE_DISTANCE   = 65,
 CIRCLE_SIZE       = 46,
 CIRCLE_BG_TRANSPARENCY = 0.04,
 CIRCLE_LOGO       = "\78\88",
 CIRCLE_LOGO_IMAGE = "",
 GLOW_ALL          = false,
 TP_ON_CLICK       = false,
 TP_COOLDOWN       = 0.4,
 PILL_BG               = Color3.fromRGB(8, 8, 14),
 PILL_BG_TRANSPARENCY  = 0.02,
 PILL_GRADIENT_TOP     = Color3.fromRGB(28, 28, 38),
 PILL_GRADIENT_BOTTOM  = Color3.fromRGB(4, 4, 6),
 USERNAME_COLOR        = Color3.fromRGB(255, 255, 255),
 ROLE_FONT       = Enum.Font.GothamBlack,
 ICON_FONT       = Enum.Font.GothamBold,
 USERNAME_FONT   = Enum.Font.GothamMedium,
 ICON_TEXT_SIZE      = 21,
 ICON_IMAGE_SIZE     = 24,
 ROLE_TEXT_SIZE      = 19,
 USERNAME_TEXT_SIZE  = 14,
 DEFAULT_ANIMATION = "\103\114\97\100\105\101\110\116",
 SHOW_USERNAME     = false,
 }
 local _dhb = _G.NXTagKit._xb
 local function httpGet(_gc)
 return (rawGet(_gc))
 end
 local _ehb = {
 _resolved = {},
 _loaded   = false,
 _lastFetch = 0,
 }
 local _fhb = _G.NXTagKit.imagen
 local function normalizeRole(s)
 s = tostring(s or ""):gsub("\37\115\43", "\32")
 return string.upper(s:match("\94\37\115\42\40\46\45\41\37\115\42\36") or s)
 end
 local _ghb = {}
 function _ehb:_resolveEntry(_f)
 local _hhb  = _f._kib or _f._r or "\77\69\77\66\69\82"
 local _ihb    = _ghb[normalizeRole(_hhb)] or {}
 local _xb     = _dhb(_f._xb, _ihb._xb or Color3.fromRGB(255, 255, 255))
 local _nd      = _G.NXTagKit.icono(_f._nd or _ihb._nd)
 local _jhb = _fhb(_f._jhb or _f.image or _ihb._jhb)
 local _khb = _f._khb or _ihb._khb or _sfb.DEFAULT_ANIMATION
 _khb       = string.lower(tostring(_khb))
 local _lhb  = tonumber(_f._lhb) or _ihb._lhb or 0
 return {
 _kib       = tostring(_hhb),
 _nd      = tostring(_nd),
 _jhb = _jhb,
 _xb     = _xb,
 _khb = _khb,
 _lhb  = _lhb,
 }
 end
 function _ehb:Load(_ed)
 if self._loaded and not _ed then
 return true
 end
 local _x = httpGet(_sfb.TAGS_URL)
 if not _x then
 warn("\91\78\88\32\72\101\97\100\32\84\97\103\115\93\32\67\111\117\108\100\32\110\111\116\32\100\111\119\110\108\111\97\100\32\116\104\101\32\116\97\103\32\100\97\116\97\98\97\115\101\46")
 return false
 end
 local _g, _ie = pcall(function()
 return HttpService:JSONDecode(_x)
 end)
 if not _g or type(_ie) ~= "\116\97\98\108\101" then
 warn("\91\78\88\32\72\101\97\100\32\84\97\103\115\93\32\67\111\117\108\100\32\110\111\116\32\112\97\114\115\101\32\116\104\101\32\116\97\103\32\74\83\79\78\46")
 return false
 end
 local _mhb = {}
 for _uc, _ye in pairs(_ie) do
 if type(_ye) == "\116\97\98\108\101" and not tostring(_uc):match("\94\95") then
 _mhb[tostring(_uc)] = self:_resolveEntry(_ye)
 end
 end
 self._resolved  = _mhb
 self._loaded    = true
 self._lastFetch = os.clock()
 return true
 end
 function _ehb:Get(_uc)
 if _G.NXResolve then
 local v = _G.NXResolve(_uc)
 if v then return v end
 end
 return self._resolved[tostring(_uc)]
 end
 local _nhb = {}
 _nhb._lr = {
 update = function() end,
 }
 _nhb._zhb = {
 update = function(_phb, t)
 _phb._cp.Scale = 1 + 0.07 * math.sin(t * 4)
 end,
 }
 _nhb.bounce = {
 update = function(_phb, t)
 local y = math.abs(math.sin(t * 3)) * 0.35
 _phb._hib.StudsOffset = Vector3.new(0, _sfb.STUDS_OFFSET_Y + y, 0)
 end,
 }
 _nhb.glow = {
 update = function(_phb, t)
 local a = 0.5 + 0.5 * math.sin(t * 3)
 _phb._hk.Transparency  = lerp(0.05, 0.7, a)
 _phb._hk.Thickness     = lerp(1.5, 3.2, a)
 _phb._vib.Transparency = lerp(0.0, 0.55, a)
 end,
 }
 _nhb.rainbow = {
 update = function(_phb, t)
 local _ohb = (t * 0.18) % 1
 local c = Color3.fromHSV(_ohb, 0.85, 1)
 _phb._r.TextColor3 = c
 if _phb._nd:IsA("\73\109\97\103\101\76\97\98\101\108") then
 _phb._nd.ImageColor3 = c
 else
 _phb._nd.TextColor3 = c
 end
 _phb._hk.Color    = c
 end,
 }
 _nhb.gradient = {
 init = function(_phb)
 local g = Instance.new("\85\73\71\114\97\100\105\101\110\116")
 g.Name = "\70\108\111\119\71\114\97\100\105\101\110\116"
 local h, s = Color3.toHSV(_phb._r.TextColor3)
 local _nt = Color3.fromHSV((h + 0.08) % 1, math.min(s + 0.1, 1), 1)
 local _qhb = _phb._r.TextColor3
 local _rhb = Color3.fromHSV((h + 0.92) % 1, math.min(s + 0.1, 1), 1)
 g.Color = ColorSequence.new({
 ColorSequenceKeypoint.new(0,   _nt),
 ColorSequenceKeypoint.new(0.5, _qhb),
 ColorSequenceKeypoint.new(1,   _rhb),
 })
 g.Parent = _phb._r
 _phb.gradient = g
 end,
 update = function(_phb, t)
 _phb.gradient.Rotation = math.sin(t * 0.8) * 25
 _phb.gradient.Offset   = Vector2.new(math.sin(t * 0.6) * 0.4, 0)
 end,
 }
 _nhb._mnb = {
 init = function(_phb)
 local g = Instance.new("\85\73\71\114\97\100\105\101\110\116")
 g.Name = "\83\104\105\110\101\71\114\97\100\105\101\110\116"
 local _shb  = _phb._r.TextColor3
 local _thb = Color3.fromRGB(255, 255, 255)
 g.Color = ColorSequence.new({
 ColorSequenceKeypoint.new(0.0,  _shb),
 ColorSequenceKeypoint.new(0.42, _shb),
 ColorSequenceKeypoint.new(0.50, _thb),
 ColorSequenceKeypoint.new(0.58, _shb),
 ColorSequenceKeypoint.new(1.0,  _shb),
 })
 g.Parent = _phb._r
 _phb._mnb = g
 end,
 update = function(_phb, t)
 _phb._mnb.Offset = Vector2.new(((t * 0.6) % 1.6) - 0.8, 0)
 end,
 }
_nhb.luxe = {
 init = function(_phb)
 local g = Instance.new("\85\73\71\114\97\100\105\101\110\116")
 g.Name = "\76\117\120\101\66\111\114\100\101\114"
 local h, s, v = Color3.toHSV(_phb._r.TextColor3)
 local _uhb = Color3.fromHSV(h, math._de(s - 0.30, 0), math.min(v + 0.18, 1))
 local _vhb  = Color3.fromHSV(h, math.min(s + 0.15, 1), math._de(v - 0.28, 0.15))
 g.Color = ColorSequence.new({
 ColorSequenceKeypoint.new(0.0, _uhb),
 ColorSequenceKeypoint.new(0.5, _phb._r.TextColor3),
 ColorSequenceKeypoint.new(1.0, _vhb),
 })
 g.Parent = _phb._hk
 _phb.luxeBorder = g
 end,
 update = function(_phb, t)
 _phb.luxeBorder.Rotation = (t * 55) % 360
 local a = 0.5 + 0.5 * math.sin(t * 2.2)
 _phb._hk.Thickness =
 lerp(2.0, 3.0, a)
 _phb._hk.Transparency =
 lerp(0.0, 0.22, a)
 end,
}
 local function buildEliteGradients(_phb, _xhb, _yhb)
 local _shb = _phb._r.TextColor3
 local h, s, v = Color3.toHSV(_shb)
 local _uhb = Color3.fromHSV(h, math._de(s - _xhb, 0), math.min(v + 0.22, 1))
 local _vhb  = Color3.fromHSV(h, math.min(s + _yhb, 1), math._de(v - 0.32, 0.12))
 local _whb = Instance.new("\85\73\71\114\97\100\105\101\110\116")
 _whb.Name = "\69\108\105\116\101\66\111\114\100\101\114"
 _whb.Color = ColorSequence.new({
 ColorSequenceKeypoint.new(0.00, _vhb),
 ColorSequenceKeypoint.new(0.30, _shb),
 ColorSequenceKeypoint.new(0.50, _uhb),
 ColorSequenceKeypoint.new(0.70, _shb),
 ColorSequenceKeypoint.new(1.00, _vhb),
 })
 _whb.Parent = _phb._hk
 local _hb = Instance.new("\85\73\71\114\97\100\105\101\110\116")
 _hb.Name = "\69\108\105\116\101\84\101\120\116"
 _hb.Color = ColorSequence.new({
 ColorSequenceKeypoint.new(0.0, _shb),
 ColorSequenceKeypoint.new(0.5, _uhb),
 ColorSequenceKeypoint.new(1.0, _shb),
 })
 _hb.Rotation = 90
 _hb.Parent = _phb._r
 return _whb, _hb, _shb, _uhb, _vhb
 end
 _nhb.elite_gold = {
 init = function(_phb)
 local _whb, _hb = buildEliteGradients(_phb, 0.35, 0.10)
 _phb.eliteBorder = _whb
 _phb.eliteText   = _hb
 _phb.pillBaseTransparency = _phb._sdb.BackgroundTransparency
 end,
 update = function(_phb, t)
 _phb.eliteBorder.Rotation = (t * 70) % 360
 _phb.eliteText.Offset     = Vector2.new(((t * 0.55) % 2) - 1, 0)
 local a = 0.5 + 0.5 * math.sin(t * 2.0)
 _phb._hk.Thickness     = lerp(2.4, 3.6, a)
 _phb._hk.Transparency  = lerp(0.00, 0.18, a)
 _phb._vib.Transparency = lerp(0.05, 0.45, a)
 _phb._sdb.BackgroundTransparency = lerp(
 math._de(_phb.pillBaseTransparency - 0.04, 0),
 _phb.pillBaseTransparency + 0.04, a)
 end,
 }
 _nhb.elite_platinum = {
 init = function(_phb)
 local _whb, _hb = buildEliteGradients(_phb, 0.55, 0.05)
 _phb.eliteBorder = _whb
 _phb.eliteText   = _hb
 end,
 update = function(_phb, t)
 _phb.eliteBorder.Rotation = (t * 55) % 360
 _phb.eliteText.Offset     = Vector2.new(((t * 0.45) % 2) - 1, 0)
 local a = 0.5 + 0.5 * math.sin(t * 1.8)
 _phb._hk.Thickness    = lerp(2.2, 3.2, a)
 _phb._hk.Transparency = lerp(0.00, 0.20, a)
 end,
 }
 _nhb.elite_cyan = {
 init = function(_phb)
 local _whb, _hb = buildEliteGradients(_phb, 0.40, 0.10)
 _phb.eliteBorder = _whb
 _phb.eliteText   = _hb
 end,
 update = function(_phb, t)
 _phb.eliteBorder.Rotation = (t * 90) % 360
 _phb.eliteText.Offset     = Vector2.new(((t * 0.7) % 2) - 1, 0)
 local a = 0.5 + 0.5 * math.sin(t * 2.4)
 _phb._hk.Thickness    = lerp(2.0, 3.0, a)
 _phb._hk.Transparency = lerp(0.05, 0.25, a)
 end,
 }
 _nhb.elite_cyber = {
 init = function(_phb)
 local _whb, _hb, _shb, _uhb = buildEliteGradients(_phb, 0.30, 0.15)
 _phb.eliteBorder = _whb
 _phb.eliteText   = _hb
 _phb.eliteAccent = _uhb
 _phb.eliteBase   = _shb
 end,
 update = function(_phb, t)
 _phb.eliteBorder.Rotation = (t * 100) % 360
 _phb.eliteText.Offset     = Vector2.new(((t * 0.8) % 2) - 1, 0)
 local _zhb   = 0.5 + 0.5 * math.sin(t * 3.0)
 local _aib = (math.sin(t * 17) > 0.985) and 1 or 0
 _phb._hk.Thickness    = lerp(2.2, 3.4, _zhb) + _aib * 0.6
 _phb._hk.Transparency = lerp(0.00, 0.22, _zhb) - _aib * 0.15
 _phb._vib.Transparency = lerp(0.10, 0.45, _zhb)
 end,
 }
 _nhb.elite_crystal = {
 init = function(_phb)
 local _whb, _hb, _shb = buildEliteGradients(_phb, 0.35, 0.12)
 _phb.eliteBorder = _whb
 _phb.eliteText   = _hb
 _phb.eliteBase   = _shb
 end,
 update = function(_phb, t)
 _phb.eliteBorder.Rotation = (t * 60) % 360
 _phb.eliteText.Offset     = Vector2.new(((t * 0.5) % 2) - 1, 0)
 local a = 0.5 + 0.5 * math.sin(t * 2.0)
 _phb._hk.Thickness    = lerp(2.2, 3.3, a)
 _phb._hk.Transparency = lerp(0.00, 0.20, a)
 local h, s, v = Color3.toHSV(_phb.eliteBase)
 local _bib  = math.sin(t * 0.9) * 0.04
 _phb._r.TextColor3 = Color3.fromHSV((h + _bib) % 1, s, v)
 end,
 }
 _nhb.elite_supreme = {
 init = function(_phb)
 local _whb, _hb, _shb, _uhb, _vhb = buildEliteGradients(_phb, 0.40, 0.15)
 _phb.eliteBorder = _whb
 _phb.eliteText   = _hb
 _phb.eliteBase   = _shb
 _phb.eliteLight  = _uhb
 _phb.eliteDeep   = _vhb
 _phb.pillBaseTransparency = _phb._sdb.BackgroundTransparency
 end,
 update = function(_phb, t)
 _phb.eliteBorder.Rotation = (t * 80) % 360
 _phb.eliteText.Offset     = Vector2.new(((t * 0.65) % 2) - 1, 0)
 local a = 0.5 + 0.5 * math.sin(t * 2.4)
 local b = 0.5 + 0.5 * math.sin(t * 1.6 + 1.2)
 _phb._hk.Thickness     = lerp(2.4, 3.8, a)
 _phb._hk.Transparency  = lerp(0.00, 0.12, a)
 _phb._vib.Transparency = lerp(0.02, 0.35, a)
 _phb._sdb.BackgroundTransparency = lerp(
 math._de(_phb.pillBaseTransparency - 0.05, 0),
 _phb.pillBaseTransparency + 0.03, b)
 if _phb.glow then
 _phb.glow.Thickness    = lerp(4, 8, a)
 _phb.glow.Transparency = lerp(0.30, 0.65, a)
 end
 local h, s, v = Color3.toHSV(_phb.eliteBase)
 local _bib = math.sin(t * 0.7) * 0.06
 _phb._r.TextColor3 = Color3.fromHSV((h + _bib) % 1, s, v)
 if _phb._nd and not _phb._nd:IsA("\73\109\97\103\101\76\97\98\101\108") then
 _phb._nd.TextColor3 = Color3.fromHSV((h + _bib + 0.5) % 1, s * 0.8, math.min(v + 0.15, 1))
 end
 end,
 }
 local _cib = 0
 local function rootOf(_dib)
 if not _dib then return nil end
 return _dib:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
 or _dib:FindFirstChild("\85\112\112\101\114\84\111\114\115\111")
 or _dib:FindFirstChild("\84\111\114\115\111")
 end
 local function teleportToPlayer(_iib)
 if not _sfb.TP_ON_CLICK then return end
 if not _iib or _iib == _bhb then return end
 local _eib = rootOf(_bhb.Character)
 local _fib  = rootOf(_iib.Character)
 if not _eib or not _fib then return end
 _eib.CFrame = _fib.CFrame
 end
 local function flashTag(_phb)
 local s = _phb.isFar and _phb._cjb or _phb._djb
 if not s then return end
 if not _chb._anim then s.Scale = 1; return end
 local _gib = TweenService:Create(s,
 TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { Scale = 1.28 })
 _gib:Play()
 _gib.Completed:Once(function()
 TweenService:Create(s,
 TweenInfo.new(0.20, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { Scale = 1 }):Play()
 end)
 end
 local function onTagClicked(_phb)
 if not _sfb.TP_ON_CLICK then return end
 local _nv = os.clock()
 if _nv - _cib < (_sfb.TP_COOLDOWN or 0.4) then return end
 _cib = _nv
 flashTag(_phb)
 teleportToPlayer(_phb._a)
 end
 local function makeClickable(_jib, _phb)
 _jib.Active = true
 _jib.InputBegan:Connect(function(_jj)
 if _jj.UserInputType == Enum.UserInputType.MouseButton1
 or _jj.UserInputType == Enum.UserInputType.Touch then
 onTagClicked(_phb)
 end
 end)
 end
 local function buildBillboard(_a, _kib)
 local _hib = Instance.new("\66\105\108\108\98\111\97\114\100\71\117\105")
 _hib.Name          = "\78\88\72\101\97\100\84\97\103\95" .. _a.UserId
 _hib.Size          = UDim2.fromOffset(360, 90)
 _hib.StudsOffset   = Vector3.new(0, _sfb.STUDS_OFFSET_Y + (_kib._lhb or 0) * 0.003, 0)
 _hib.AlwaysOnTop   = _sfb.ALWAYS_ON_TOP
 _hib.LightInfluence = 0
 _hib.MaxDistance   = (_sfb.MAX_DISTANCE > 0) and _sfb.MAX_DISTANCE or 1e4
 _hib.ClipsDescendants = false
 local _vq = Instance.new("\70\114\97\109\101")
 _vq.Name                 = "\67\111\110\116\97\105\110\101\114"
 _vq.BackgroundTransparency = 1
 _vq.Size                 = UDim2.fromScale(1, 1)
 _vq.AnchorPoint          = Vector2.new(0.5, 0.5)
 _vq.Position             = UDim2.fromScale(0.5, 0.5)
 _vq.Parent               = _hib
 local _cp = Instance.new("\85\73\83\99\97\108\101")
 _cp.Scale = 1
 _cp.Parent = _vq
 local _lib = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116")
 _lib.FillDirection       = Enum.FillDirection.Vertical
 _lib.HorizontalAlignment = Enum.HorizontalAlignment.Center
 _lib.VerticalAlignment   = Enum.VerticalAlignment.Center
 _lib.SortOrder           = Enum.SortOrder.LayoutOrder
 _lib.Padding             = UDim.new(0, 2)
 _lib.Parent              = _vq
 local _sdb = Instance.new("\70\114\97\109\101")
 _sdb.Name                 = "\82\111\108\101\80\105\108\108"
 _sdb.BackgroundColor3     = _sfb.PILL_BG
 _sdb.BackgroundTransparency = _sfb.PILL_BG_TRANSPARENCY
 _sdb.AutomaticSize        = Enum.AutomaticSize.XY
 _sdb.Size                 = UDim2.fromOffset(0, 0)
 _sdb.LayoutOrder          = 1
 _sdb.Parent               = _vq
 local _mib = Instance.new("\85\73\67\111\114\110\101\114")
 _mib.CornerRadius = UDim.new(1, 0)
 _mib.Parent = _sdb
 local _nib = Instance.new("\85\73\83\116\114\111\107\101")
 _nib.Thickness       = 2.2
 _nib.Color           = _kib._xb
 _nib.Transparency    = 0.05
 _nib.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 _nib.Parent          = _sdb
 local _oib = Instance.new("\85\73\83\116\114\111\107\101")
 _oib.Thickness       = 4
 _oib.Color           = _kib._xb
 _oib.Transparency    = 0.40
 _oib.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 _oib.Parent          = _sdb
 local h, s, v = Color3.toHSV(_kib._xb)
 local _pib = Color3.fromHSV(h, math.min(s + 0.08, 1), math._de(v * 0.12, 0.04))
 local _qib = Instance.new("\85\73\71\114\97\100\105\101\110\116")
 _qib.Rotation = 90
 _qib.Color = ColorSequence.new({
 ColorSequenceKeypoint.new(0.0, _sfb.PILL_GRADIENT_TOP),
 ColorSequenceKeypoint.new(0.35, _pib),
 ColorSequenceKeypoint.new(0.65, _sfb.PILL_GRADIENT_BOTTOM),
 ColorSequenceKeypoint.new(1.0, Color3.fromRGB(2, 2, 4)),
 })
 _qib.Parent = _sdb
 local _rib = Instance.new("\85\73\80\97\100\100\105\110\103")
 _rib.PaddingLeft   = UDim.new(0, 14)
 _rib.PaddingRight  = UDim.new(0, 14)
 _rib.PaddingTop    = UDim.new(0, 6)
 _rib.PaddingBottom = UDim.new(0, 6)
 _rib.Parent        = _sdb
 local _ufb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116")
 _ufb.FillDirection       = Enum.FillDirection.Horizontal
 _ufb.VerticalAlignment   = Enum.VerticalAlignment.Center
 _ufb.HorizontalAlignment = Enum.HorizontalAlignment.Center
 _ufb.SortOrder           = Enum.SortOrder.LayoutOrder
 _ufb.Padding             = UDim.new(0, 6)
 _ufb.Parent              = _sdb
 local _nd
 if _kib._jhb and _kib._jhb ~= "" then
 _nd = Instance.new("\73\109\97\103\101\76\97\98\101\108")
 _nd.Name                   = "\73\99\111\110"
 _nd.BackgroundTransparency = 1
 _nd.Image                  = _kib._jhb
 _nd.Size                   = UDim2.fromOffset(_sfb.ICON_IMAGE_SIZE, _sfb.ICON_IMAGE_SIZE)
 _nd.ScaleType              = Enum.ScaleType.Fit
 _nd.LayoutOrder            = 1
 _nd.Visible                = true
 _nd.Parent                 = _sdb
 do
 local _sib = _nd
 task.spawn(function()
 local _tib = os.clock() + 4
 while os.clock() < _tib do
 local _uib = true
 pcall(function() _uib = _sib.IsLoaded end)
 if _uib then return end
 task.wait(0.25)
 end
 if _sib and _sib.Parent then _sib.Visible = false end
 end)
 end
 else
 _nd = Instance.new("\84\101\120\116\76\97\98\101\108")
 _nd.Name                   = "\73\99\111\110"
 _nd.BackgroundTransparency = 1
 _nd.AutomaticSize          = Enum.AutomaticSize.XY
 _nd.Font                   = _sfb.ICON_FONT
 _nd.Text                   = _kib._nd
 _nd.TextSize               = _sfb.ICON_TEXT_SIZE
 _nd.TextColor3             = Color3.fromRGB(255, 255, 255)
 _nd.LayoutOrder            = 1
 _nd.Visible                = (_kib._nd ~= "")
 _nd.Parent                 = _sdb
 end
 local _r = Instance.new("\84\101\120\116\76\97\98\101\108")
 _r.Name                 = "\82\111\108\101"
 _r.BackgroundTransparency = 1
 _r.AutomaticSize        = Enum.AutomaticSize.XY
 _r.Font                 = _sfb.ROLE_FONT
 _r.Text                 = _kib._kib
 _r.TextSize             = _sfb.ROLE_TEXT_SIZE
 _r.TextColor3           = _kib._xb
 _r.LayoutOrder          = 2
 _r.Parent               = _sdb
 local _vib = Instance.new("\85\73\83\116\114\111\107\101")
 _vib.Thickness    = 1.6
 _vib.Color        = Color3.fromRGB(0, 0, 0)
 _vib.Transparency = 0.15
 _vib.Parent       = _r
 local _bp
 if _sfb.SHOW_USERNAME then
 _bp = Instance.new("\84\101\120\116\76\97\98\101\108")
 _bp.Name                 = "\85\115\101\114\110\97\109\101"
 _bp.BackgroundTransparency = 1
 _bp.AutomaticSize        = Enum.AutomaticSize.XY
 _bp.Font                 = _sfb.USERNAME_FONT
 _bp.Text                 = _a.DisplayName
 _bp.TextSize             = _sfb.USERNAME_TEXT_SIZE
 _bp.TextColor3           = _sfb.USERNAME_COLOR
 _bp.LayoutOrder          = 2
 _bp.Parent               = _vq
 local _wib = Instance.new("\85\73\83\116\114\111\107\101")
 _wib.Thickness    = 1.2
 _wib.Color        = Color3.fromRGB(0, 0, 0)
 _wib.Transparency = 0.3
 _wib.Parent       = _bp
 end
 local _xib = Instance.new("\70\114\97\109\101")
 _xib.Name                 = "\67\105\114\99\108\101"
 _xib.AnchorPoint          = Vector2.new(0.5, 0.5)
 _xib.Position             = UDim2.fromScale(0.5, 0.5)
 _xib.Size                 = UDim2.fromOffset(_sfb.CIRCLE_SIZE, _sfb.CIRCLE_SIZE)
 _xib.BackgroundColor3     = _sfb.PILL_BG
 _xib.BackgroundTransparency = _sfb.CIRCLE_BG_TRANSPARENCY
 _xib.Visible              = false
 _xib.Parent               = _hib
 local _yib = Instance.new("\85\73\67\111\114\110\101\114")
 _yib.CornerRadius = UDim.new(1, 0)
 _yib.Parent = _xib
 local _zib = Instance.new("\85\73\83\116\114\111\107\101")
 _zib.Thickness    = 3.5
 _zib.Color        = _kib._xb
 _zib.Transparency = 0.20
 _zib.Parent       = _xib
 local _ajb
 if _sfb.CIRCLE_LOGO_IMAGE and _sfb.CIRCLE_LOGO_IMAGE ~= "" then
 _ajb = Instance.new("\73\109\97\103\101\76\97\98\101\108")
 _ajb.BackgroundTransparency = 1
 _ajb.Image                  = _sfb.CIRCLE_LOGO_IMAGE
 _ajb.Size                   = UDim2.fromScale(0.70, 0.70)
 _ajb.Position               = UDim2.fromScale(0.5, 0.5)
 _ajb.AnchorPoint            = Vector2.new(0.5, 0.5)
 _ajb.ScaleType              = Enum.ScaleType.Fit
 _ajb.ImageColor3            = _kib._xb
 _ajb.Parent                 = _xib
 else
 _ajb = Instance.new("\84\101\120\116\76\97\98\101\108")
 _ajb.BackgroundTransparency = 1
 _ajb.Size                   = UDim2.fromScale(0.82, 0.82)
 _ajb.Position               = UDim2.fromScale(0.5, 0.5)
 _ajb.AnchorPoint            = Vector2.new(0.5, 0.5)
 _ajb.Font                   = Enum.Font.GothamBlack
 _ajb.TextScaled             = true
 _ajb.TextColor3             = _kib._xb
 _ajb.Text                   = _sfb.CIRCLE_LOGO
 local _bjb = Instance.new("\85\73\83\116\114\111\107\101")
 _bjb.Thickness = 1.5; _bjb.Color = Color3.fromRGB(0, 0, 0); _bjb.Transparency = 0.3
 _bjb.Parent = _ajb
 _ajb.Parent = _xib
 end
 local _cjb = Instance.new("\85\73\83\99\97\108\101")
 _cjb.Scale = 1
 _cjb.Parent = _xib
 local _djb = Instance.new("\85\73\83\99\97\108\101")
 _djb.Scale = 1
 _djb.Parent = _sdb
 local _phb = {
 _a     = _a,
 _hib  = _hib,
 _vq  = _vq,
 _cp      = _cp,
 _sdb       = _sdb,
 _hk     = _nib,
 glow        = _oib,
 _xib      = _xib,
 _zib  = _zib,
 _ajb  = _ajb,
 _cjb = _cjb,
 _djb   = _djb,
 isFar       = false,
 transitioning = false,
 _nd       = _nd,
 _r       = _r,
 _vib = _vib,
 _bp   = _bp,
 _kib        = _kib,
 _qdb    = 0,
 }
 makeClickable(_sdb, _phb)
 makeClickable(_xib, _phb)
 local _ejb = _nhb[_kib._khb] or _nhb._lr
 if _ejb.init then
 pcall(_ejb.init, _phb, _kib)
 end
 _phb._ejb = _ejb
 return _phb
 end
 local function tagSignature(t)
 if not t then return "\110\105\108" end
 local c = t._xb
 return string.format("\37\115\124\37\115\124\37\115\124\37\115\124\37\100\124\37\100\44\37\100\44\37\100",
 t._kib, t._nd, tostring(t._jhb), t._khb, t._lhb or 0,
 math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5))
 end
 local _fjb = {
 _zgb    = {},
 _vq = nil,
 }
 function _fjb:_getContainer()
 if self._vq and self._vq.Parent then
 return self._vq
 end
 local _dcb = _bhb:FindFirstChildOfClass("\80\108\97\121\101\114\71\117\105") or _bhb:WaitForChild("\80\108\97\121\101\114\71\117\105")
 local _gjb = _dcb:FindFirstChild("\78\88\72\101\97\100\84\97\103\115")
 if not _gjb then
 _gjb = Instance.new("\70\111\108\100\101\114")
 _gjb.Name = "\78\88\72\101\97\100\84\97\103\115"
 _gjb.Parent = _dcb
 end
 self._vq = _gjb
 return _gjb
 end
 function _fjb:remove(_a)
 local _phb = self._zgb[_a]
 if _phb then
 if _phb._hib then
 _phb._hib:Destroy()
 end
 self._zgb[_a] = nil
 end
 end
 function _fjb:apply(_a)
 if (not _sfb.SHOW_OWN_TAG) and _a == _bhb then
 self:remove(_a)
 return
 end
 local _kib = _ehb:Get(_a.UserId)
 if not _kib then
 self:remove(_a)
 return
 end
 local _dib = _a.Character
 if not _dib then
 return
 end
 local _hs = _dib:FindFirstChild("\72\101\97\100")
 if not _hs then
 return
 end
 local _phb = self._zgb[_a]
 if _phb and tagSignature(_phb._kib) == tagSignature(_kib) then
 _phb._hib.Adornee = _hs
 _phb._hib.Enabled = true
 _phb.adornee = _hs
 if _phb._bp then
 _phb._bp.Text = _a.DisplayName
 end
 return
 end
 if _phb then
 self:remove(_a)
 end
 local _hjb = buildBillboard(_a, _kib)
 _hjb.adornee = _hs
 _hjb._hib.Adornee = _hs
 _hjb._hib.Parent  = self:_getContainer()
 self._zgb[_a] = _hjb
 end
 function _fjb:refreshAll()
 for _, _a in ipairs(Players:GetPlayers()) do
 self:apply(_a)
 end
 end
 function _fjb:clearAll()
 for _, _phb in pairs(self._zgb) do
 if _phb._hib then
 _phb._hib:Destroy()
 end
 end
 table.clear(self._zgb)
 end
 local _yi = {}
 local function hookCharacter(_a, _dib)
 task.spawn(function()
 local _hs = _dib:FindFirstChild("\72\101\97\100")
 or _dib:WaitForChild("\72\101\97\100", _sfb.HEAD_WAIT_TIMEOUT)
 if _hs and _a.Character == _dib then
 _fjb:apply(_a)
 end
 end)
 end
 local function hookPlayer(_a)
 _yi[_a] = _yi[_a] or {}
 if _a.Character then
 hookCharacter(_a, _a.Character)
 end
 table.insert(_yi[_a], _a.CharacterAdded:Connect(function(_dib)
 hookCharacter(_a, _dib)
 end))
 table.insert(_yi[_a], _a.CharacterRemoving:Connect(function()
 local _phb = _fjb._zgb[_a]
 if _phb and _phb._hib then
 _phb._hib.Enabled = false
 _phb._hib.Adornee = nil
 _phb.adornee = nil
 end
 end))
 end
 local function unhookPlayer(_a)
 if _yi[_a] then
 for _, c in ipairs(_yi[_a]) do
 pcall(function() c:Disconnect() end)
 end
 _yi[_a] = nil
 end
 _fjb:remove(_a)
 end
 local _ijb    = TweenInfo.new(0.42, Enum.EasingStyle.Back,  Enum.EasingDirection.Out)
 local _jjb = TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
 local _kjb   = TweenInfo.new(0.26, Enum.EasingStyle.Quad,  Enum.EasingDirection.Out)
 local _ljb   = TweenInfo.new(0.5,  Enum.EasingStyle.Back,  Enum.EasingDirection.Out)
 local function setLOD(_phb, _pjb)
 _phb.transitioning = true
 if not _chb._anim then
 if _pjb then
 _phb._xib.Visible = true
 _phb._cjb.Scale = 1
 _phb._xib.BackgroundTransparency = _sfb.CIRCLE_BG_TRANSPARENCY
 if _phb._zib then _phb._zib.Transparency = 0.25 end
 if _phb._ajb then _phb._ajb.Rotation = 0 end
 _phb._djb.Scale = 0
 if _phb._vq then _phb._vq.Visible = false end
 else
 _phb._vq.Visible = true
 _phb._djb.Scale = 1
 _phb._xib.BackgroundTransparency = 1
 if _phb._zib then _phb._zib.Transparency = 1 end
 _phb._cjb.Scale = 0
 if _phb._xib then _phb._xib.Visible = false end
 end
 _phb.transitioning = false
 return
 end
 if _pjb then
 _phb._xib.Visible              = true
 _phb._cjb.Scale           = 0.0
 _phb._xib.BackgroundTransparency = 1
 if _phb._zib then _phb._zib.Transparency = 1 end
 if _phb._ajb then _phb._ajb.Rotation = -90 end
 TweenService:Create(_phb._cjb, _ijb, { Scale = 1 }):Play()
 TweenService:Create(_phb._xib, _kjb,
 { BackgroundTransparency = _sfb.CIRCLE_BG_TRANSPARENCY }):Play()
 if _phb._zib then
 TweenService:Create(_phb._zib, _kjb, { Transparency = 0.25 }):Play()
 end
 if _phb._ajb then
 TweenService:Create(_phb._ajb, _ljb, { Rotation = 0 }):Play()
 end
 local t = TweenService:Create(_phb._djb, _jjb, { Scale = 0.0 })
 t:Play()
 t.Completed:Once(function()
 if _phb.isFar and _phb._vq then _phb._vq.Visible = false end
 _phb.transitioning = false
 end)
 else
 _phb._vq.Visible = true
 _phb._djb.Scale   = 0.0
 TweenService:Create(_phb._djb, _ijb, { Scale = 1 }):Play()
 TweenService:Create(_phb._xib, _kjb, { BackgroundTransparency = 1 }):Play()
 if _phb._zib then
 TweenService:Create(_phb._zib, _kjb, { Transparency = 1 }):Play()
 end
 local t = TweenService:Create(_phb._cjb, _jjb, { Scale = 0.0 })
 t:Play()
 t.Completed:Once(function()
 if not _phb.isFar and _phb._xib then _phb._xib.Visible = false end
 _phb.transitioning = false
 end)
 end
 end
 local _mjb
 local function startLoop()
 if _mjb then return end
 _mjb = RunService.RenderStepped:Connect(function(_qjb)
 local _tk = workspace.CurrentCamera
 local _njb = _tk and _tk.CFrame.Position
 for _, _phb in pairs(_fjb._zgb) do
 if not _phb.adornee or not _phb.adornee.Parent then
 _phb._reacquireAt = _phb._reacquireAt or 0
 if os.clock() >= _phb._reacquireAt then
 _phb._reacquireAt = os.clock() + 0.25
 local _ojb = _phb._a and _phb._a.Character
 local _hs = _ojb and _ojb:FindFirstChild("\72\101\97\100")
 if _hs then
 _phb.adornee           = _hs
 _phb._hib.Adornee = _hs
 _phb._hib.Enabled = true
 else
 _phb._hib.Enabled = false
 end
 end
 elseif _phb._hib.Enabled then
 _phb._qdb += _qjb
 if _njb and _phb._xib and _phb._vq then
 local _rjb = (_njb - _phb.adornee.Position).Magnitude
 local _pjb = _phb.isFar
 if _phb.isFar and _rjb < (_sfb.CIRCLE_DISTANCE - 8) then
 _pjb = false
 elseif (not _phb.isFar) and _rjb > (_sfb.CIRCLE_DISTANCE + 8) then
 _pjb = true
 end
 if _pjb ~= _phb.isFar then
 _phb.isFar = _pjb
 setLOD(_phb, _pjb)
 end
 end
 if _sfb.GLOW_ALL and not _phb.transitioning and _chb._anim then
 local g = 0.5 + 0.5 * math.sin(_phb._qdb * 2.5)
 if _phb.glow then
 _phb.glow.Transparency = lerp(0.30, 0.72, g)
 _phb.glow.Thickness    = lerp(3.5, 7, g)
 end
 if _phb._zib then
 _phb._zib.Transparency = lerp(0.15, 0.6, g)
 _phb._zib.Thickness    = lerp(2.5, 5.5, g)
 end
 end
 if (not _phb.isFar) and _phb._ejb and _phb._ejb.update and _chb._anim then
 pcall(_phb._ejb.update, _phb, _phb._qdb)
 end
 end
 end
 end)
 end
 local function startRefreshLoop()
 task.spawn(function()
 while _chb._running do
 if not _ehb._loaded then
 if _ehb:Load(false) then
 _fjb:refreshAll()
 end
 task.wait(_sfb.RETRY_INTERVAL)
 elseif _sfb.REFRESH_INTERVAL > 0 then
 task.wait(_sfb.REFRESH_INTERVAL)
 if _chb._running and _ehb:Load(true) then
 _fjb:refreshAll()
 end
 else
 task.wait(5)
 end
 end
 end)
 end
 function _chb.Start()
 if _chb._running then return end
 _chb._running = true
 task.spawn(function()
 if _ehb:Load(false) then
 _fjb:refreshAll()
 end
 end)
 for _, _a in ipairs(Players:GetPlayers()) do
 hookPlayer(_a)
 end
 _chb._playerAdded    = Players.PlayerAdded:Connect(hookPlayer)
 _chb._playerRemoving = Players.PlayerRemoving:Connect(unhookPlayer)
 startLoop()
 startRefreshLoop()
 end
 function _chb.Stop()
 _chb._running = false
 if _chb._playerAdded then _chb._playerAdded:Disconnect() end
 if _chb._playerRemoving then _chb._playerRemoving:Disconnect() end
 _chb._playerAdded, _chb._playerRemoving = nil, nil
 if _mjb then _mjb:Disconnect() _mjb = nil end
 for _a in pairs(_yi) do
 unhookPlayer(_a)
 end
 _fjb:clearAll()
 end
 function _chb.Refresh()
 task.spawn(function()
 if _ehb:Load(true) then
 _fjb:refreshAll()
 end
 end)
 end
 function _chb.SetEnabled(_pb)
 if _pb then _chb.Start() else _chb.Stop() end
 end
 function _chb.SetTeleportEnabled(_pb)
 _sfb.TP_ON_CLICK = _pb and true or false
 end
 function _chb.SetShowOwnTag(_pb)
 _sfb.SHOW_OWN_TAG = _pb and true or false
 pcall(function() _fjb:apply(_bhb) end)
 end
 function _chb.SetAnimationsEnabled(_pb)
 _chb._anim = _pb and true or false
 end
 function _chb.SetLocalOverride(_uc, _ye)
 _ehb._resolved[tostring(_uc)] = _ehb:_resolveEntry(_ye or {})
 local p = Players:GetPlayerByUserId(tonumber(_uc))
 if p then
 _fjb:apply(p)
 end
 end
 _G._chb = _chb
 _chb.Start()
end
if _G._chb and not _d.headTags then
 _G._chb.SetEnabled(false)
end
if _G._chb and _G._chb.SetShowOwnTag and _d.ownTag == false then
 _G._chb.SetShowOwnTag(false)
end
if _G._chb and _G._chb.SetAnimationsEnabled and _d.animations == false then
 _G._chb.SetAnimationsEnabled(false)
end
;(function()
 local RunService = game:GetService("\82\117\110\83\101\114\118\105\99\101")
 local Lighting   = game:GetService("\76\105\103\104\116\105\110\103")
 local _sjb = {
 neonBorder   = true,
 titleShimmer = true,
 headerLine   = true,
 glassBlur    = false,
 popOpen      = true,
 ripple       = true,
 blurSize     = 12,
 spinSpeed    = 18,
 strokeAlpha  = 0.55,
 strokeWidth  = 1.4,
 }
 local function lerp(a, b, t) return a + (b - a) * t end
 local function lighten(c, f) return Color3.new(lerp(c.R,1,f), lerp(c.G,1,f), lerp(c.B,1,f)) end
 local function darken(c, f)  return Color3.new(lerp(c.R,0,f), lerp(c.G,0,f), lerp(c.B,0,f)) end
 local function neonSeq()
 local a = C._idb
 return ColorSequence.new({
 ColorSequenceKeypoint.new(0.0, darken(a, 0.12)),
 ColorSequenceKeypoint.new(0.5, lighten(a, 0.55)),
 ColorSequenceKeypoint.new(1.0, darken(a, 0.12)),
 })
 end
 local function titleSeq()
 local a = C._idb
 return ColorSequence.new({
 ColorSequenceKeypoint.new(0.0, lighten(a, 0.05)),
 ColorSequenceKeypoint.new(0.5, lighten(a, 0.85)),
 ColorSequenceKeypoint.new(1.0, lighten(a, 0.05)),
 })
 end
 local _tjb
 if _sjb.neonBorder then
 pcall(function()
 local _ujb = _ek:FindFirstChildOfClass("\85\73\83\116\114\111\107\101")
 if _ujb then
 _ujb.Transparency = _sjb.strokeAlpha
 _ujb.Thickness    = _sjb.strokeWidth
 _tjb = Instance.new("\85\73\71\114\97\100\105\101\110\116", _ujb)
 _tjb.Color = neonSeq()
 end
 end)
 end
 local _vjb
 if _sjb.titleShimmer then
 pcall(function()
 _vjb = Instance.new("\85\73\71\114\97\100\105\101\110\116", _lk)
 _vjb.Color = titleSeq()
 end)
 end
 if _sjb.headerLine then
 pcall(function()
 local _vdb = Instance.new("\70\114\97\109\101", _jk)
 _vdb.Size = UDim2.new(1, 0, 0, 1)
 _vdb.Position = UDim2.new(0, 0, 1, -1)
 _vdb.BorderSizePixel = 0
 _vdb.BackgroundColor3 = C._idb
 _vdb.BackgroundTransparency = 0.5
 _vdb.ZIndex = 2
 themed(_vdb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local g = Instance.new("\85\73\71\114\97\100\105\101\110\116", _vdb)
 g.Transparency = NumberSequence.new({
 NumberSequenceKeypoint.new(0, 1),
 NumberSequenceKeypoint.new(0.5, 0),
 NumberSequenceKeypoint.new(1, 1),
 })
 end)
 end
 for _, v in ipairs(Lighting:GetChildren()) do
 if v.Name == "\80\114\105\115\109\71\108\97\115\115" then v:Destroy() end
 end
 local _wjb
 if _sjb.glassBlur then
 _wjb = Instance.new("\66\108\117\114\69\102\102\101\99\116")
 _wjb.Name = "\80\114\105\115\109\71\108\97\115\115"
 _wjb.Size = 0
 _wjb.Parent = Lighting
 track(_zi.Destroying:Connect(function()
 if _wjb then _wjb:Destroy() end
 end))
 end
 local _xjb
 if _sjb.popOpen then
 _xjb = Instance.new("\85\73\83\99\97\108\101", _ek)
 _xjb.Scale = 1
 end
 local _yjb  = TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
 local _zjb  = TweenInfo.new(0.30, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
 local _akb = TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
 local function playOpen()
 if _xjb then
 _xjb.Scale = 0.9
 motionTween(_xjb, _yjb, { Scale = 1 })
 end
 if _wjb then motionTween(_wjb, _zjb, { Size = _sjb.blurSize }) end
 end
 local function playClose()
 if _wjb then motionTween(_wjb, _akb, { Size = 0 }) end
 end
 track(_zi:GetPropertyChangedSignal("\69\110\97\98\108\101\100"):Connect(function()
 if _zi.Enabled then playOpen() else playClose() end
 end))
 if _zi.Enabled then task.defer(playOpen) end
 local _bkb = _a:GetMouse()
 local function attachRipple(_gb)
 local _ckb = _gb.Size.X
 if _ckb.Scale <= 0 and _ckb.Offset < 50 then return end
 if _gb:GetAttribute("\80\114\105\115\109\82\105\112\112\108\101") then return end
 _gb:SetAttribute("\80\114\105\115\109\82\105\112\112\108\101", true)
 _gb.ClipsDescendants = true
 track(_gb.MouseButton1Down:Connect(function()
 if not _gj.enabled then return end
 local _xib = Instance.new("\70\114\97\109\101")
 _xib.AnchorPoint = Vector2.new(0.5, 0.5)
 _xib.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 _xib.BackgroundTransparency = 0.78
 _xib.BorderSizePixel = 0
 _xib.Position = UDim2.fromOffset(_bkb.X - _gb.AbsolutePosition.X,
 _bkb.Y - _gb.AbsolutePosition.Y)
 _xib.Size = UDim2.fromOffset(0, 0)
 _xib.ZIndex = _gb.ZIndex + 5
 Instance.new("\85\73\67\111\114\110\101\114", _xib).CornerRadius = UDim.new(1, 0)
 _xib.Parent = _gb
 local d = math._de(_gb.AbsoluteSize.X, _gb.AbsoluteSize.Y) * 2
 motionTween(_xib,
 TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { Size = UDim2.fromOffset(d, d), BackgroundTransparency = 1 })
 task.delay(0.5, function() if _xib then _xib:Destroy() end end)
 end))
 end
 if _sjb.ripple then
 for _, d in ipairs(_ek:GetDescendants()) do
 if d:IsA("\84\101\120\116\66\117\116\116\111\110") then pcall(attachRipple, d) end
 end
 track(_ek.DescendantAdded:Connect(function(d)
 if d:IsA("\84\101\120\116\66\117\116\116\111\110") then task.defer(function() pcall(attachRipple, d) end) end
 end))
 end
 local _dkb = 0
 track(RunService.Heartbeat:Connect(function(_qjb)
 if not _zi.Enabled or not _gj.enabled then return end
 if _tjb then _tjb.Rotation = (_tjb.Rotation + _qjb * _sjb.spinSpeed) % 360 end
 if _vjb then
 _dkb = (_dkb + _qjb * 0.25) % 2
 _vjb.Offset = Vector2.new(_dkb - 1, 0)
 end
 end))
 onRepaint(function()
 if _tjb  then pcall(function() _tjb.Color  = neonSeq()  end) end
 if _vjb then pcall(function() _vjb.Color = titleSeq() end) end
 end)
end)()
;(function()
 local RunService = game:GetService("\82\117\110\83\101\114\118\105\99\101")
 local _ekb        = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
 local Players    = game:GetService("\80\108\97\121\101\114\115")
 local _fkb
 local function attachTip(_gkb, _hb)
 track(_gkb.MouseEnter:Connect(function()
 if not _fkb then
 _fkb = Instance.new("\84\101\120\116\76\97\98\101\108")
 _fkb.Name = "\80\114\105\115\109\84\105\112"
 _fkb.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
 _fkb.BackgroundTransparency = 0.05
 _fkb.TextColor3 = Color3.fromRGB(240, 240, 240)
 _fkb.Font = Enum.Font.GothamMedium
 _fkb.TextSize = 12
 _fkb.AutomaticSize = Enum.AutomaticSize.XY
 _fkb.ZIndex = 60
 _fkb.Parent = _zi
 local _hkb = Instance.new("\85\73\67\111\114\110\101\114", _fkb); _hkb.CornerRadius = UDim.new(0, 6)
 local _ikb = Instance.new("\85\73\80\97\100\100\105\110\103", _fkb)
 _ikb.PaddingLeft = UDim.new(0, 8); _ikb.PaddingRight = UDim.new(0, 8)
 _ikb.PaddingTop = UDim.new(0, 3); _ikb.PaddingBottom = UDim.new(0, 3)
 local _jkb = Instance.new("\85\73\83\116\114\111\107\101", _fkb); _jkb.Color = C._idb; _jkb.Transparency = 0.3
 themed(_jkb, "\67\111\108\111\114", "\97\99\99\101\110\116")
 end
 _fkb.Text = _hb
 _fkb.Visible = true
 _fkb.AnchorPoint = Vector2.new(0.5, 0)
 local _kkb = _gkb.AbsolutePosition
 local _tk = workspace.CurrentCamera
 local _lkb = (_tk and _tk.ViewportSize.X) or 1280
 local _mkb = math.clamp(_kkb.X + _gkb.AbsoluteSize.X / 2, 70, _lkb - 70)
 _fkb.Position = UDim2.fromOffset(_mkb, _kkb.Y + _gkb.AbsoluteSize.Y + 6)
 end))
 track(_gkb.MouseLeave:Connect(function()
 if _fkb then _fkb.Visible = false end
 end))
 end
 pcall(function()
 local _nkb = Color3.fromRGB(255, 255, 255)
 local function lighten(c, _pkb)
 return Color3.new(c.R + (1 - c.R) * _pkb, c.G + (1 - c.G) * _pkb, c.B + (1 - c.B) * _pkb)
 end
 local _okb = Instance.new("\70\114\97\109\101")
 _okb.Name = "\78\88\87\105\110\100\111\119\67\111\110\116\114\111\108\115"
 _okb.AnchorPoint = Vector2.new(1, 0.5)
 _okb.Position = UDim2.new(1, -10, 0.5, 0)
 _okb.Size = UDim2.fromOffset(24 * 3 + 6 * 2, 24)
 _okb.BackgroundTransparency = 1
 _okb.ZIndex = 4
 _okb.Parent = _jk
 local _w = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _okb)
 _w.FillDirection = Enum.FillDirection.Horizontal
 _w.HorizontalAlignment = Enum.HorizontalAlignment.Right
 _w.VerticalAlignment = Enum.VerticalAlignment.Center
 _w.Padding = UDim.new(0, 6)
 _w.SortOrder = Enum.SortOrder.LayoutOrder
 local function ctrlButton(_mb, _qkb, _rkb, _skb)
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110")
 b.Name = "\67\116\114\108" .. _mb
 b.LayoutOrder = _mb
 b.Size = UDim2.fromOffset(24, 24)
 b.AutoButtonColor = false
 b.Text = ""
 b.BorderSizePixel = 0
 b.Active = true
 b.ZIndex = 5
 b.BackgroundColor3 = C[_qkb]
 b.Parent = _okb
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new(0, 6)
 themed(b, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", _qkb)
 local _v = Instance.new("\85\73\83\116\114\111\107\101", b)
 _v.Thickness = 1; _v.Transparency = 0.35
 themed(_v, "\67\111\108\111\114", "\98\111\114\100\101\114")
 track(b.MouseEnter:Connect(function()
 motionTween(b, TweenInfo.new(0.12), { BackgroundColor3 = lighten(C[_qkb], 0.12) })
 end))
 track(b.MouseLeave:Connect(function()
 motionTween(b, TweenInfo.new(0.16), { BackgroundColor3 = C[_qkb] })
 end))
 track(b.MouseButton1Click:Connect(_skb))
 attachTip(b, _rkb)
 return b
 end
 local _tkb = ctrlButton(1, "\110\101\117\116\114\97\108", "\77\105\110\105\109\105\122\97\114", function() _fj.toggleCollapse() end)
 do
 local _kdb = Instance.new("\70\114\97\109\101", _tkb)
 _kdb.AnchorPoint = Vector2.new(0.5, 0.5)
 _kdb.Position = UDim2.new(0.5, 0, 0.5, 0)
 _kdb.Size = UDim2.new(0, 11, 0, 2)
 _kdb.BorderSizePixel = 0
 _kdb.ZIndex = 6
 Instance.new("\85\73\67\111\114\110\101\114", _kdb).CornerRadius = UDim.new(1, 0)
 themed(_kdb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\116\101\120\116")
 end
 local _ukb = ctrlButton(2, "\110\101\117\116\114\97\108", "\69\120\112\97\110\100\105\114\32\47\32\82\101\115\116\97\117\114\97\114", function() _fj.toggleMaximize() end)
 do
 local _zm = Instance.new("\70\114\97\109\101", _ukb)
 _zm.AnchorPoint = Vector2.new(0.5, 0.5)
 _zm.Position = UDim2.new(0.5, 0, 0.5, 0)
 _zm.Size = UDim2.new(0, 12, 0, 11)
 _zm.BackgroundTransparency = 1
 _zm.BorderSizePixel = 0
 _zm.ZIndex = 6
 Instance.new("\85\73\67\111\114\110\101\114", _zm).CornerRadius = UDim.new(0, 2)
 local _kb = Instance.new("\85\73\83\116\114\111\107\101", _zm)
 _kb.Thickness = 1.6
 themed(_kb, "\67\111\108\111\114", "\116\101\120\116")
 end
 local _vkb = ctrlButton(3, "\98\97\100", "\67\101\114\114\97\114", function() _fj.animatedClose() end)
 do
 local x = Instance.new("\84\101\120\116\76\97\98\101\108", _vkb)
 x.Size = UDim2.new(1, 0, 1, 0)
 x.BackgroundTransparency = 1
 x.Font = Enum.Font.GothamBold
 x.TextSize = 14
 x.Text = "\88"
 x.TextColor3 = _nkb
 x.ZIndex = 6
 end
 end)
 pcall(function()
 local _wkb = { _g = "\80\114\111\116\101\103\105\100\111", partial = "\80\97\114\99\105\97\108", error = "\69\114\114\111\114", loading = "\86\101\114\105\102\105\99\97\110\100\111\8230" }
 local function paleta()
 local e = _zd._xi()
 local _xkb = { _g = C.good, partial = C.warn, error = C.bad, loading = C._idb }
 return _xkb[e] or C.good, _wkb[e] or _wkb._g, e
 end
 local _ykb = Instance.new("\84\101\120\116\66\117\116\116\111\110")
 _ykb.Name = "\78\88\83\104\105\101\108\100\66\117\116\116\111\110"
 _ykb.AnchorPoint = Vector2.new(1, 0.5)
 _ykb.Position = UDim2.new(1, -100, 0.5, 0)
 _ykb.Size = UDim2.fromOffset(26, 24)
 _ykb.AutoButtonColor = false
 _ykb.Text = ""
 _ykb.BorderSizePixel = 0
 _ykb.BackgroundColor3 = C.surface
 _ykb.BackgroundTransparency = 0.15
 _ykb.ZIndex = 5
 _ykb.Parent = _jk
 themed(_ykb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 Instance.new("\85\73\67\111\114\110\101\114", _ykb).CornerRadius = UDim.new(0, 7)
 local _zkb = Instance.new("\85\73\83\116\114\111\107\101", _ykb)
 _zkb.Thickness = 1.3
 _zkb.Transparency = 0.25
 local _alb = Instance.new("\70\114\97\109\101", _ykb)
 _alb.AnchorPoint = Vector2.new(0.5, 0)
 _alb.Position = UDim2.new(0.5, 0, 0.5, -8)
 _alb.Size = UDim2.fromOffset(14, 9)
 _alb.BorderSizePixel = 0
 _alb.BackgroundColor3 = C.good
 _alb.ZIndex = 6
 local _blb = Instance.new("\85\73\67\111\114\110\101\114", _alb); _blb.CornerRadius = UDim.new(0, 3)
 local _clb = Instance.new("\70\114\97\109\101", _ykb)
 _clb.AnchorPoint = Vector2.new(0.5, 0)
 _clb.Position = UDim2.new(0.5, 0, 0.5, -2)
 _clb.Size = UDim2.fromOffset(10, 10)
 _clb.Rotation = 45
 _clb.BorderSizePixel = 0
 _clb.BackgroundColor3 = C.good
 _clb.ZIndex = 6
 local _dlb = Instance.new("\85\73\67\111\114\110\101\114", _clb); _dlb.CornerRadius = UDim.new(0, 3)
 local _elb = Instance.new("\84\101\120\116\76\97\98\101\108", _ykb)
 _elb.BackgroundTransparency = 1
 _elb.AnchorPoint = Vector2.new(0.5, 0.5)
 _elb.Position = UDim2.new(0.5, 0, 0.5, -1)
 _elb.Size = UDim2.fromOffset(24, 12)
 _elb.Font = Enum.Font.GothamBold
 _elb.Text = "\78\88"
 _elb.TextSize = 9
 _elb.TextColor3 = Color3.fromRGB(255, 255, 255)
 _elb.ZIndex = 8
 local _flb = Instance.new("\70\114\97\109\101", _ykb)
 _flb.AnchorPoint = Vector2.new(1, 0)
 _flb.Position = UDim2.new(1, 1, 0, -1)
 _flb.Size = UDim2.fromOffset(8, 8)
 _flb.BorderSizePixel = 0
 _flb.BackgroundColor3 = C.good
 _flb.ZIndex = 9
 Instance.new("\85\73\67\111\114\110\101\114", _flb).CornerRadius = UDim.new(1, 0)
 local _glb = Instance.new("\85\73\83\116\114\111\107\101", _flb)
 _glb.Thickness = 1.2
 _glb.Color = Color3.fromRGB(15, 15, 18)
 local _mgb = Instance.new("\70\114\97\109\101")
 _mgb.Name = "\78\88\83\104\105\101\108\100\80\97\110\101\108"
 _mgb.AnchorPoint = Vector2.new(1, 0)
 _mgb.Position = UDim2.new(1, -12, 0, 38)
 _mgb.Size = UDim2.fromOffset(268, 0)
 _mgb.AutomaticSize = Enum.AutomaticSize.Y
 _mgb.BackgroundColor3 = C._o
 _mgb.BackgroundTransparency = 0.04
 _mgb.BorderSizePixel = 0
 _mgb.Visible = false
 _mgb.ZIndex = 120
 _mgb.ClipsDescendants = true
 _mgb.Parent = _ek
 local _hlb = Instance.new("\85\73\83\105\122\101\67\111\110\115\116\114\97\105\110\116", _mgb)
 _hlb.MaxSize = Vector2.new(268, 440)
 themed(_mgb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 Instance.new("\85\73\67\111\114\110\101\114", _mgb).CornerRadius = UDim.new(0, 12)
 local _ilb = Instance.new("\85\73\83\116\114\111\107\101", _mgb)
 _ilb.Thickness = 1.4
 _ilb.Transparency = 0.35
 themed(_ilb, "\67\111\108\111\114", "\97\99\99\101\110\116")
 local _jlb = Instance.new("\85\73\83\99\97\108\101", _mgb)
 local _klb = Instance.new("\85\73\80\97\100\100\105\110\103", _mgb)
 _klb.PaddingTop = UDim.new(0, 10); _klb.PaddingBottom = UDim.new(0, 10)
 _klb.PaddingLeft = UDim.new(0, 12); _klb.PaddingRight = UDim.new(0, 12)
 local _wcb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _mgb)
 _wcb.Padding = UDim.new(0, 8); _wcb.SortOrder = Enum.SortOrder.LayoutOrder
 local function _ur(_tr, _ieb, _mdb, _r, _llb, _mlb)
 local l = Instance.new("\84\101\120\116\76\97\98\101\108", _mgb)
 l.LayoutOrder = _tr
 l.Size = UDim2.new(1, 0, 0, _mlb or 16)
 l.BackgroundTransparency = 1
 l.Font = _llb and Enum.Font.GothamBold or Enum.Font.Gotham
 l.TextSize = _mdb
 l.TextColor3 = C[_r]
 l.TextXAlignment = Enum.TextXAlignment.Left
 l.TextWrapped = (_mlb ~= nil)
 l.TextYAlignment = Enum.TextYAlignment.Top
 l.Text = _ieb
 l.ZIndex = 121
 themed(l, "\84\101\120\116\67\111\108\111\114\51", _r)
 return l
 end
 local _nlb = Instance.new("\70\114\97\109\101", _mgb)
 _nlb.LayoutOrder = 0; _nlb.Size = UDim2.new(1, 0, 0, 22); _nlb.BackgroundTransparency = 1
 _nlb.ZIndex = 121
 local _olb = Instance.new("\70\114\97\109\101", _nlb)
 _olb.AnchorPoint = Vector2.new(0, 0.5)
 _olb.Position = UDim2.new(0, 0, 0.5, 0)
 _olb.Size = UDim2.fromOffset(9, 9)
 _olb.BorderSizePixel = 0
 _olb.BackgroundColor3 = C.good
 _olb.ZIndex = 122
 Instance.new("\85\73\67\111\114\110\101\114", _olb).CornerRadius = UDim.new(1, 0)
 local _plb = Instance.new("\84\101\120\116\76\97\98\101\108", _nlb)
 _plb.Position = UDim2.new(0, 16, 0, 0)
 _plb.Size = UDim2.new(1, -16, 1, 0)
 _plb.BackgroundTransparency = 1
 _plb.Font = Enum.Font.GothamBold
 _plb.TextSize = 14
 _plb.TextColor3 = C._hb
 _plb.Text = "\78\88\32\83\104\105\101\108\100\115"
 _plb.TextXAlignment = Enum.TextXAlignment.Left
 _plb.ZIndex = 122
 themed(_plb, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _qlb = Instance.new("\84\101\120\116\76\97\98\101\108", _nlb)
 _qlb.AnchorPoint = Vector2.new(1, 0.5)
 _qlb.Position = UDim2.new(1, 0, 0.5, 0)
 _qlb.Size = UDim2.new(0, 110, 1, 0)
 _qlb.BackgroundTransparency = 1
 _qlb.Font = Enum.Font.GothamBold
 _qlb.TextSize = 11
 _qlb.TextXAlignment = Enum.TextXAlignment.Right
 _qlb.ZIndex = 122
 local function linea(_tr)
 local d = Instance.new("\70\114\97\109\101", _mgb)
 d.LayoutOrder = _tr
 d.Size = UDim2.new(1, 0, 0, 1)
 d.BackgroundColor3 = C._whb
 d.BackgroundTransparency = 0.4
 d.BorderSizePixel = 0
 d.ZIndex = 121
 themed(d, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\111\114\100\101\114")
 end
 linea(1)
 _ur(2, "\85\115\117\97\114\105\111\32\82\111\98\108\111\120", 12, "\115\117\98\116\101\120\116", true)
 local _rlb   = _zd.valid._bp(_a.Name) ~= nil
 local _slb    = _zd.valid._uc(_a.UserId) ~= nil
 local _tlb  = _ur(3, "", 12, "\116\101\120\116", true)
 _tlb.Text   = (_rlb and "\10003\32" or "\10005\32") .. _a.Name .. "\32\32\183\32\32" .. tostring(_a.UserId)
 _tlb.TextColor3 = (_rlb and _slb) and C.good or C.bad
 local _ulb = _ur(4, "\69\120\101\99\117\116\111\114\58\32" .. _dc, 10, "\115\117\98\116\101\120\116")
 linea(5)
 _ur(6, "\86\101\114\105\102\105\99\97\99\105\111\110\101\115", 12, "\115\117\98\116\101\120\116", true)
 local _vlb = {}
 local function filaProt(_tr, _zr, _zab, _ob)
 local f = Instance.new("\70\114\97\109\101", _mgb)
 f.LayoutOrder = _tr
 f.Size = UDim2.new(1, 0, 0, 44)
 f.BackgroundTransparency = 1
 f.ZIndex = 121
 local _wlb = Instance.new("\84\101\120\116\76\97\98\101\108", f)
 _wlb.Size = UDim2.new(1, -56, 0, 18)
 _wlb.BackgroundTransparency = 1
 _wlb.Font = Enum.Font.GothamBold
 _wlb.TextSize = 12
 _wlb.TextColor3 = C._hb
 _wlb.Text = _zr
 _wlb.TextXAlignment = Enum.TextXAlignment.Left
 _wlb.TextTruncate = Enum.TextTruncate.AtEnd
 _wlb.ZIndex = 122
 themed(_wlb, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _bbb = Instance.new("\84\101\120\116\76\97\98\101\108", f)
 _bbb.Position = UDim2.new(0, 0, 0, 18)
 _bbb.Size = UDim2.new(1, -56, 0, 24)
 _bbb.BackgroundTransparency = 1
 _bbb.Font = Enum.Font.Gotham
 _bbb.TextSize = 10
 _bbb.Text = _ob
 _bbb.TextColor3 = C.subtext
 _bbb.TextXAlignment = Enum.TextXAlignment.Left
 _bbb.TextWrapped = true
 _bbb.TextYAlignment = Enum.TextYAlignment.Top
 _bbb.ZIndex = 122
 local _tb, setOn, setBusy
 _tb, setOn, setBusy = _zd.makeSwitch(f, _zd.flags[_zab], function(_pb)
 setBusy(true)
 _bbb.Text = "\69\106\101\99\117\116\97\110\100\111\32\118\101\114\105\102\105\99\97\99\105\243\110\8230"
 _bbb.TextColor3 = C.warn
 _zd.setFlag(_zab, _pb, function(_g, _cbb)
 setBusy(false)
 if not _pb then
 _bbb.Text = (_zab == "\97\112\105") and "\86\101\114\105\102\105\99\97\99\105\243\110\32\65\80\73\32\100\101\115\97\99\116\105\118\97\100\97"
 or "\86\97\108\105\100\97\99\105\243\110\32\100\101\32\100\97\116\111\115\32\100\101\115\97\99\116\105\118\97\100\97"
 _bbb.TextColor3 = C.subtext
 elseif _g then
 _bbb.Text = (_zab == "\97\112\105") and ("\65\80\73\32\118\101\114\105\102\105\99\97\100\97\32\99\111\114\114\101\99\116\97\109\101\110\116\101\32\183\32" .. tostring(_cbb))
 or ("\68\97\116\111\115\32\118\97\108\105\100\97\100\111\115\32\183\32" .. tostring(_cbb))
 _bbb.TextColor3 = C.good
 else
 _bbb.Text = "\70\97\108\108\243\58\32" .. tostring(_cbb)
 _bbb.TextColor3 = C.bad
 end
 end)
 end)
 _tb.AnchorPoint = Vector2.new(1, 0)
 _tb.Position = UDim2.new(1, 0, 0, 4)
 _tb.ZIndex = 122
 _vlb[_zab] = { _bbb = _bbb, setOn = setOn, setBusy = setBusy, _ob = _ob }
 end
 filaProt(7, "\65\80\73\32\86\97\108\105\100\97\116\105\111\110",  "\97\112\105",
 "\67\111\109\112\114\117\101\98\97\32\101\115\116\114\117\99\116\117\114\97\44\32\101\114\114\111\114\101\115\32\121\32\99\243\100\105\103\111\115\32\72\84\84\80\32\100\101\32\99\97\100\97\32\114\101\115\112\117\101\115\116\97\46")
 filaProt(8, "\68\97\116\97\32\86\97\108\105\100\97\116\105\111\110", "\100\97\116\97",
 "\86\97\108\105\100\97\32\117\115\101\114\110\97\109\101\44\32\85\115\101\114\73\100\44\32\102\101\99\104\97\115\44\32\99\111\110\116\97\100\111\114\101\115\44\32\97\118\97\116\97\114\32\101\32\105\116\101\109\115\46")
 linea(9)
 local _ts = _ur(10, "", 10, "\115\117\98\116\101\120\116", false, 44)
 local function refrescar()
 local _xb, _ieb, _bbb = paleta()
 _flb.BackgroundColor3   = _xb
 _alb.BackgroundColor3   = _xb
 _clb.BackgroundColor3   = _xb
 _zkb.Color           = _xb
 _olb.BackgroundColor3 = _xb
 _qlb.TextColor3    = _xb
 _qlb.Text          = _ieb
 for _zab, f in pairs(_vlb) do
 local _pb = _zd.flags[_zab]
 f.setOn(_pb, false)
 f.setBusy(_zd.busy == _zab)
 if _zd.busy ~= _zab then
 if not _pb then
 f._bbb.Text = (_zab == "\97\112\105") and "\86\101\114\105\102\105\99\97\99\105\243\110\32\65\80\73\32\100\101\115\97\99\116\105\118\97\100\97"
 or "\86\97\108\105\100\97\99\105\243\110\32\100\101\32\100\97\116\111\115\32\100\101\115\97\99\116\105\118\97\100\97"
 f._bbb.TextColor3 = C.subtext
 else
 local t = _zd.lastTest and _zd.lastTest[_zab]
 if t and not t._g then
 f._bbb.Text = "\70\97\108\108\243\58\32" .. tostring(t._cbb)
 f._bbb.TextColor3 = C.bad
 elseif t and t._g then
 f._bbb.Text = (_zab == "\97\112\105")
 and ("\65\80\73\32\118\101\114\105\102\105\99\97\100\97\32\99\111\114\114\101\99\116\97\109\101\110\116\101\32\183\32" .. tostring(t._cbb))
 or  ("\68\97\116\111\115\32\118\97\108\105\100\97\100\111\115\32\183\32" .. tostring(t._cbb))
 f._bbb.TextColor3 = C.good
 else
 f._bbb.Text = f._ob
 f._bbb.TextColor3 = C.subtext
 end
 end
 end
 end
 local r = _zd.run
 local _xlb = {
 _fg = "\86\101\114\105\102\105\99\97\100\111", partial = "\80\97\114\99\105\97\108",
 incomplete = "\68\97\116\111\115\32\105\110\99\111\109\112\108\101\116\111\115", error = "\69\114\114\111\114", loading = "\67\97\114\103\97\110\100\111\8230",
 }
 local _ylb = r and (_xlb[r._sd] or r._sd) or "\115\105\110\32\97\110\225\108\105\115\105\115\32\97\250\110"
 _ts.Text = string.format(
 "\82\101\115\112\117\101\115\116\97\115\32\105\110\115\112\101\99\99\105\111\110\97\100\97\115\58\32\37\100\32\32\183\32\32\98\108\111\113\117\101\97\100\97\115\58\32\37\100\10\67\97\109\112\111\115\32\118\97\108\105\100\97\100\111\115\58\32\37\100\32\32\183\32\32\114\101\99\104\97\122\97\100\111\115\58\32\37\100\10\218\108\116\105\109\111\32\97\110\225\108\105\115\105\115\58\32\37\115",
 _zd.stats.checks, _zd.stats.blocked,
 _zd.stats.fields, _zd.stats.rejected, _ylb)
 _elb.TextTransparency = (_bbb == "\108\111\97\100\105\110\103") and 0.35 or 0
 end
 refrescar()
 _zd.onChange(refrescar)
 onRepaint(refrescar)
 local _zlb = false
 local function setAbierto(v)
 _zlb = v
 if v then
 refrescar()
 _mgb.Visible = true
 if _gj.enabled then
 _jlb.Scale = 0.92
 _mgb.BackgroundTransparency = 1
 motionTween(_jlb, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
 motionTween(_mgb, TweenInfo.new(0.16), { BackgroundTransparency = 0.04 })
 else
 _jlb.Scale = 1
 _mgb.BackgroundTransparency = 0.04
 end
 else
 if _gj.enabled then
 motionTween(_jlb, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.92 })
 motionTween(_mgb, TweenInfo.new(0.14), { BackgroundTransparency = 1 }, function()
 if not _zlb then _mgb.Visible = false end
 end)
 else
 _mgb.Visible = false
 end
 end
 end
 track(_ykb.MouseButton1Click:Connect(function() setAbierto(not _zlb) end))
 track(_ykb.MouseEnter:Connect(function()
 motionTween(_ykb, TweenInfo.new(0.12), { BackgroundTransparency = 0 })
 end))
 track(_ykb.MouseLeave:Connect(function()
 motionTween(_ykb, TweenInfo.new(0.16), { BackgroundTransparency = 0.15 })
 end))
 attachTip(_ykb, "\78\88\32\83\104\105\101\108\100\115\32\183\32\101\115\116\97\100\111\32\100\101\32\118\101\114\105\102\105\99\97\99\105\243\110")
 track(UserInputService.InputBegan:Connect(function(_jj)
 if not _zlb then return end
 if _jj.UserInputType ~= Enum.UserInputType.MouseButton1
 and _jj.UserInputType ~= Enum.UserInputType.Touch then return end
 local p = _jj.Position
 local function dentro(_gkb)
 local a, b = _gkb.AbsolutePosition, _gkb.AbsoluteSize
 return p.X >= a.X and p.X <= a.X + b.X and p.Y >= a.Y and p.Y <= a.Y + b.Y
 end
 if not dentro(_mgb) and not dentro(_ykb) then setAbierto(false) end
 end))
 end)
 local _amb  = "\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\103\103\47\74\103\115\87\50\77\54\51\50\50"
 local _bmb = ""
 local _cmb, fpsLabel, playersLabel
 pcall(function()
 local _dmb = Instance.new("\70\114\97\109\101")
 _dmb.Name = "\80\114\105\115\109\72\85\68"
 _dmb.AnchorPoint = Vector2.new(1, 0)
 _dmb.Position = UDim2.new(1, -12, 0, 10)
 _dmb.Size = UDim2.fromOffset(60, 40)
 _dmb.AutomaticSize = Enum.AutomaticSize.X
 _dmb.BackgroundColor3 = C.bg
 themed(_dmb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\103")
 _dmb.BackgroundTransparency = 0.1
 _dmb.BorderSizePixel = 0
 _dmb.Parent = _zi
 local _emb = Instance.new("\85\73\67\111\114\110\101\114", _dmb); _emb.CornerRadius = UDim.new(0, 20)
 local _fmb = Instance.new("\85\73\83\116\114\111\107\101", _dmb); _fmb.Thickness = 1.6; _fmb.Color = C._idb; _fmb.Transparency = 0.1
 themed(_fmb, "\67\111\108\111\114", "\97\99\99\101\110\116")
 local _w = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _dmb)
 _w.FillDirection = Enum.FillDirection.Horizontal
 _w.VerticalAlignment = Enum.VerticalAlignment.Center
 _w.Padding = UDim.new(0, 9)
 _w.SortOrder = Enum.SortOrder.LayoutOrder
 local _gmb = Instance.new("\85\73\80\97\100\100\105\110\103", _dmb)
 _gmb.PaddingLeft = UDim.new(0, 13); _gmb.PaddingRight = UDim.new(0, 13)
 _gmb.PaddingTop = UDim.new(0, 5); _gmb.PaddingBottom = UDim.new(0, 5)
 local _mb = 0
 local function cell(_dgb, _hb, _mp, _hmb)
 _mb += 1
 local _udb = Instance.new("\70\114\97\109\101", _dmb)
 _udb.BackgroundTransparency = 1
 _udb.AutomaticSize = Enum.AutomaticSize.X
 _udb.Size = UDim2.fromOffset(0, 24)
 _udb.LayoutOrder = _mb
 local _imb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _udb)
 _imb.FillDirection = Enum.FillDirection.Horizontal
 _imb.VerticalAlignment = Enum.VerticalAlignment.Center
 _imb.Padding = UDim.new(0, 5)
 local _jmb = Instance.new("\84\101\120\116\76\97\98\101\108", _udb)
 _jmb.BackgroundTransparency = 1
 _jmb.AutomaticSize = Enum.AutomaticSize.X
 _jmb.Size = UDim2.fromOffset(0, 24)
 _jmb.Font = Enum.Font.GothamBold
 _jmb.TextSize = 15
 _jmb.TextColor3 = C._idb
 _jmb.LayoutOrder = 1
 themed(_jmb, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 if _hmb then
 _jmb.Text = ""
 _jmb.AutomaticSize = Enum.AutomaticSize.None
 _jmb.Size = UDim2.fromOffset(16, 16)
 pcall(_hmb, _jmb)
 else
 _jmb.Text = _dgb
 end
 local v = Instance.new("\84\101\120\116\76\97\98\101\108", _udb)
 v.BackgroundTransparency = 1
 v.AutomaticSize = Enum.AutomaticSize.X
 v.Size = UDim2.fromOffset(0, 24)
 v.Font = Enum.Font.GothamBold
 v.Text = _hb
 v.TextSize = 14
 v.TextColor3 = _mp or Color3.fromRGB(236, 238, 242)
 v.LayoutOrder = 2
 return v
 end
 local function _jq()
 _mb += 1
 local d = Instance.new("\70\114\97\109\101", _dmb)
 d.Size = UDim2.fromOffset(1, 18)
 d.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 d.BackgroundTransparency = 0.8
 d.BorderSizePixel = 0
 d.LayoutOrder = _mb
 end
 local function drawBars(_t)
 local _kmb = { 6, 10, 14 }
 for i = 1, 3 do
 local _kdb = Instance.new("\70\114\97\109\101", _t)
 _kdb.AnchorPoint = Vector2.new(0, 1)
 _kdb.Position = UDim2.new(0, (i - 1) * 5 + 1, 1, -1)
 _kdb.Size = UDim2.fromOffset(3, _kmb[i])
 _kdb.BorderSizePixel = 0
 _kdb.BackgroundColor3 = C._idb
 themed(_kdb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _kdb).CornerRadius = UDim.new(0, 1)
 end
 end
 local function drawBubble(_t)
 local _x = Instance.new("\70\114\97\109\101", _t)
 _x.AnchorPoint = Vector2.new(0.5, 0.5)
 _x.Position = UDim2.new(0.5, 0, 0.42, 0)
 _x.Size = UDim2.fromScale(0.78, 0.56)
 _x.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 _x.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _x).CornerRadius = UDim.new(0.42, 0)
 local _lmb = Instance.new("\70\114\97\109\101", _t)
 _lmb.AnchorPoint = Vector2.new(0.5, 0.5)
 _lmb.Position = UDim2.new(0.38, 0, 0.7, 0)
 _lmb.Size = UDim2.fromScale(0.18, 0.18)
 _lmb.Rotation = 45
 _lmb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 _lmb.BorderSizePixel = 0
 for i = 1, 3 do
 local _ldb = Instance.new("\70\114\97\109\101", _x)
 _ldb.AnchorPoint = Vector2.new(0.5, 0.5)
 _ldb.Position = UDim2.new(0.27 + (i - 1) * 0.23, 0, 0.5, 0)
 _ldb.Size = UDim2.fromScale(0.14, 0.2)
 _ldb.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
 _ldb.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _ldb).CornerRadius = UDim.new(1, 0)
 end
 end
 playersLabel = cell("", "\8212\47\8212", C._hb)
 _jq()
 _cmb    = cell("", "\8212\32\109\115", C._hb)
 _jq()
 fpsLabel     = cell(nil, "\8212\32\102\112\115", C.good, drawBars)
 onRepaint(function()
 if playersLabel and playersLabel.Parent then playersLabel.TextColor3 = C._hb end
 if _cmb and _cmb.Parent then _cmb.TextColor3 = C._hb end
 if fpsLabel and fpsLabel.Parent then fpsLabel.TextColor3 = C.good end
 end)
 local function iconButton(_dgb, _mmb, _skb, _nmb, _hmb)
 _mb += 1
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110", _dmb)
 b.Size = UDim2.fromOffset(28, 28)
 b.AutoButtonColor = false
 b.Text = ""
 b.LayoutOrder = _mb
 if _nmb then
 b.BackgroundColor3 = _nmb
 else
 b.BackgroundColor3 = C.surface
 themed(b, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 end
 local _omb = Instance.new("\85\73\67\111\114\110\101\114", b); _omb.CornerRadius = UDim.new(0, 14)
 local _jl
 if _mmb and _mmb ~= "" then
 _jl = Instance.new("\73\109\97\103\101\76\97\98\101\108", b)
 _jl.BackgroundTransparency = 1
 _jl.AnchorPoint = Vector2.new(0.5, 0.5)
 _jl.Position = UDim2.fromScale(0.5, 0.5)
 _jl.Size = UDim2.fromScale(0.64, 0.64)
 _jl.Image = _mmb
 elseif _hmb then
 _jl = Instance.new("\70\114\97\109\101", b)
 _jl.BackgroundTransparency = 1
 _jl.AnchorPoint = Vector2.new(0.5, 0.5)
 _jl.Position = UDim2.fromScale(0.5, 0.5)
 _jl.Size = UDim2.fromScale(0.82, 0.82)
 pcall(_hmb, _jl)
 else
 _jl = Instance.new("\84\101\120\116\76\97\98\101\108", b)
 _jl.BackgroundTransparency = 1
 _jl.Size = UDim2.fromScale(1, 1)
 _jl.Font = Enum.Font.GothamBold
 _jl.Text = _dgb or "\63"
 _jl.TextSize = 14
 end
 track(b.MouseButton1Click:Connect(_skb))
 return b, _jl
 end
 local function openDiscord()
 if _amb == "" then return end
 pcall(function() if _fc then _fc(_amb) end end)
 local _he = _amb:match("\40\91\37\119\37\45\95\93\43\41\37\115\42\36")
 if not _he or not _ec then return end
 task.spawn(function()
 for _pmb = 6463, 6472 do
 pcall(function()
 _ec({
 Url = "\104\116\116\112\58\47\47\49\50\55\46\48\46\48\46\49\58" .. _pmb .. "\47\114\112\99\63\118\61\49",
 Method = "\80\79\83\84",
 Headers = {
 ["\67\111\110\116\101\110\116\45\84\121\112\101"] = "\97\112\112\108\105\99\97\116\105\111\110\47\106\115\111\110",
 ["\79\114\105\103\105\110"] = "\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\99\111\109",
 },
 Body = HttpService:JSONEncode({
 cmd = "\73\78\86\73\84\69\95\66\82\79\87\83\69\82",
 args = { _he = _he },
 nonce = HttpService:GenerateGUID(false),
 }),
 })
 end)
 end
 end)
 end
 local _qmb = iconButton(nil, _bmb, openDiscord, Color3.fromRGB(88, 101, 242), drawBubble)
 attachTip(_qmb, "\68\105\115\99\111\114\100\32\78\88")
 local _rmb = (_d.ownTag ~= false)
 local _smb
 local function setOwnTag(_pb)
 _rmb = _pb
 _d.ownTag = _pb
 pcall(saveStore)
 if _G._chb and _G._chb.SetShowOwnTag then
 pcall(_G._chb.SetShowOwnTag, _pb)
 end
 if _smb then _smb.Text = _pb and "" or "" end
 end
 local _tmb, oi = iconButton(_rmb and "" or "", nil, function() setOwnTag(not _rmb) end)
 _smb = oi
 attachTip(_tmb, _rmb and "\84\117\32\116\97\103\58\32\118\105\115\105\98\108\101\32\40\99\108\105\99\107\32\61\32\111\99\117\108\116\97\114\41" or "\84\117\32\116\97\103\58\32\111\99\117\108\116\111\32\40\99\108\105\99\107\32\61\32\109\111\115\116\114\97\114\41")
 pcall(function()
 local _nu = rawget(getfenv(), "\115\101\116\102\112\115\99\97\112") or setfpscap
 if type(_nu) == "\102\117\110\99\116\105\111\110" then _nu(1000) end
 end)
 local _umb, acc = 0, 0
 track(RunService.RenderStepped:Connect(function(_qjb)
 _umb += 1; acc += _qjb
 if acc >= 0.5 then
 if fpsLabel then fpsLabel.Text = math.floor(_umb / acc + 0.5) .. "\32\102\112\115" end
 _umb, acc = 0, 0
 end
 end))
 task.spawn(function()
 while _dmb.Parent do
 local _g, ms = pcall(function() return math.floor((_a:GetNetworkPing() or 0) * 1000 + 0.5) end)
 if _cmb then _cmb.Text = (_g and ms or 0) .. "\32\109\115" end
 if playersLabel then
 local _vmb = Players.MaxPlayers
 local _wmb = #Players:GetPlayers()
 playersLabel.Text = (_vmb and _vmb > 0) and (_wmb .. "\47" .. _vmb) or tostring(_wmb)
 end
 task.wait(1)
 end
 end)
 end)
 local function restyleCircle(_xib)
 if not _xib or _xib:GetAttribute("\80\114\105\115\109\83\116\121\108\101\100") then return end
 _xib:SetAttribute("\80\114\105\115\109\83\116\121\108\101\100", true)
 local _v = _xib:FindFirstChildOfClass("\85\73\83\116\114\111\107\101")
 local _xmb = (_v and _v.Color) or Color3.fromRGB(255, 255, 255)
 _xib.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
 _xib.BackgroundTransparency = 0
 if _v then
 _v.Color = _xmb
 _v.Thickness = 3
 _v.Transparency = 0
 end
 for _, _xt in ipairs(_xib:GetChildren()) do
 if _xt:IsA("\84\101\120\116\76\97\98\101\108") then
 _xt.TextColor3 = Color3.fromRGB(255, 255, 255)
 _xt.Size = UDim2.fromScale(0.62, 0.62)
 local _cw = _xt:FindFirstChildOfClass("\85\73\83\116\114\111\107\101")
 if _cw then _cw.Transparency = 1 end
 elseif _xt:IsA("\73\109\97\103\101\76\97\98\101\108") then
 _xt.ImageColor3 = Color3.fromRGB(255, 255, 255)
 _xt.Size = UDim2.fromScale(0.55, 0.55)
 end
 end
 end
 task.spawn(function()
 local _dcb = _a:FindFirstChildOfClass("\80\108\97\121\101\114\71\117\105") or _a:WaitForChild("\80\108\97\121\101\114\71\117\105")
 local _gjb = _dcb:FindFirstChild("\78\88\72\101\97\100\84\97\103\115")
 local _ymb = os.clock()
 while not _gjb and (os.clock() - _ymb) < 20 do
 task.wait(0.5); _gjb = _dcb:FindFirstChild("\78\88\72\101\97\100\84\97\103\115")
 end
 if not _gjb then return end
 for _, _zmb in ipairs(_gjb:GetChildren()) do
 local c = _zmb:FindFirstChild("\67\105\114\99\108\101"); if c then restyleCircle(c) end
 end
 track(_gjb.ChildAdded:Connect(function(_zmb)
 task.defer(function()
 local c = _zmb:FindFirstChild("\67\105\114\99\108\101"); if c then restyleCircle(c) end
 end)
 end))
 end)
 local _anb = 0
 local function rootOf(_xt)
 return _xt and (_xt:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
 or _xt:FindFirstChild("\85\112\112\101\114\84\111\114\115\111") or _xt:FindFirstChild("\84\111\114\115\111"))
 end
 track(_ekb.InputBegan:Connect(function(_jj, _bnb)
 if _bnb then return end
 if _jj.UserInputType ~= Enum.UserInputType.MouseButton1
 and _jj.UserInputType ~= Enum.UserInputType.Touch then return end
 local _nv = os.clock()
 if _nv - _anb < 0.4 then return end
 local _tk = workspace.CurrentCamera
 if not _tk then return end
 local _dcb = _a:FindFirstChildOfClass("\80\108\97\121\101\114\71\117\105")
 local _gjb = _dcb and _dcb:FindFirstChild("\78\88\72\101\97\100\84\97\103\115")
 local _cnb = _ekb:GetMouseLocation()
 local _ot, bestD
 for _, _rqb in ipairs(Players:GetPlayers()) do
 if _rqb ~= _a and _rqb.Character then
 local _hs = _rqb.Character:FindFirstChild("\72\101\97\100")
 local _dnb = _gjb and _gjb:FindFirstChild("\78\88\72\101\97\100\84\97\103\95" .. _rqb.UserId)
 if _hs and _dnb then
 local _enb, _pb = _tk:WorldToViewportPoint(_hs.Position + Vector3.new(0, 2.6, 0))
 if _pb then
 local d = (Vector2.new(_enb.X, _enb.Y) - _cnb).Magnitude
 if not bestD or d < bestD then bestD = d; _ot = _rqb end
 end
 end
 end
 end
 if _ot and bestD and bestD <= 60 then
 local _fnb, tR = rootOf(_a.Character), rootOf(_ot.Character)
 if _fnb and tR then
 _fnb.CFrame = tR.CFrame
 _anb = _nv
 end
 end
 end))
end)()
;(function()
 local RunService  = game:GetService("\82\117\110\83\101\114\118\105\99\101")
 local TextService = game:GetService("\84\101\120\116\83\101\114\118\105\99\101")
 local function lerp(a, b, t) return a + (b - a) * t end
 local function lighten(c, f) return Color3.new(lerp(c.R,1,f), lerp(c.G,1,f), lerp(c.B,1,f)) end
 local function darken(c, f)  return Color3.new(lerp(c.R,0,f), lerp(c.G,0,f), lerp(c.B,0,f)) end
 pcall(function()
 local _wr = Instance.new("\70\114\97\109\101", _jk)
 _wr.Name = "\84\111\112\83\112\101\99\117\108\97\114"
 _wr.Size = UDim2.new(1, -24, 0, 1)
 _wr.Position = UDim2.new(0, 12, 0, 1)
 _wr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 _wr.BackgroundTransparency = 0.55
 _wr.BorderSizePixel = 0
 _wr.ZIndex = 3
 local g = Instance.new("\85\73\71\114\97\100\105\101\110\116", _wr)
 g.Transparency = NumberSequence.new({
 NumberSequenceKeypoint.new(0, 1),
 NumberSequenceKeypoint.new(0.5, 0),
 NumberSequenceKeypoint.new(1, 1),
 })
 end)
 local function vdivider(_i, _tn)
 local d = Instance.new("\70\114\97\109\101", _jk)
 d.Name = _i
 d.AnchorPoint = Vector2.new(0.5, 0.5)
 d.Position = _tn
 d.Size = UDim2.fromOffset(1, 18)
 d.BackgroundColor3 = C._idb
 d.BackgroundTransparency = 0.5
 d.BorderSizePixel = 0
 d.ZIndex = 3
 themed(d, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local g = Instance.new("\85\73\71\114\97\100\105\101\110\116", d)
 g.Rotation = 90
 g.Transparency = NumberSequence.new({
 NumberSequenceKeypoint.new(0, 1),
 NumberSequenceKeypoint.new(0.5, 0.15),
 NumberSequenceKeypoint.new(1, 1),
 })
 return d
 end
 vdivider("\68\105\118\76\101\102\116",  UDim2.new(0, 74, 0.5, 0))
 vdivider("\68\105\118\82\105\103\104\116", UDim2.new(1, -146, 0.5, 0))
 local _gnb, gemStroke
 pcall(function()
 local _hnb = Instance.new("\70\114\97\109\101", _jk)
 _hnb.Name = "\78\88\71\101\109"
 _hnb.AnchorPoint = Vector2.new(0.5, 0.5)
 _hnb.Position = UDim2.new(0, 90, 0.5, 0)
 _hnb.Size = UDim2.fromOffset(15, 15)
 _hnb.Rotation = 45
 _hnb.BackgroundColor3 = C._idb
 _hnb.BorderSizePixel = 0
 _hnb.ZIndex = 3
 themed(_hnb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _hnb).CornerRadius = UDim.new(0, 3)
 _gnb = Instance.new("\85\73\71\114\97\100\105\101\110\116", _hnb)
 _gnb.Rotation = 90
 _gnb.Color = ColorSequence.new(lighten(C._idb, 0.45), darken(C._idb, 0.12))
 gemStroke = Instance.new("\85\73\83\116\114\111\107\101", _hnb)
 gemStroke.Thickness = 1.2
 gemStroke.Color = lighten(C._idb, 0.55)
 gemStroke.Transparency = 0.15
 local _inb = Instance.new("\70\114\97\109\101", _hnb)
 _inb.AnchorPoint = Vector2.new(0.5, 0.5)
 _inb.Position = UDim2.fromScale(0.5, 0.5)
 _inb.Size = UDim2.fromScale(0.42, 0.42)
 _inb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 _inb.BackgroundTransparency = 0.35
 _inb.BorderSizePixel = 0
 _inb.ZIndex = 4
 Instance.new("\85\73\67\111\114\110\101\114", _inb).CornerRadius = UDim.new(0, 2)
 end)
 local _jnb = { "\82\111\98\108\111\120\32\80\114\111\102\105\108\101\32\65\110\97\108\121\122\101\114", "\80\114\111\102\105\108\101\32\65\110\97\108\121\122\101\114", "\65\110\97\108\121\122\101\114", "\78\88" }
 _lk.Position       = UDim2.new(0, 106, 0, 0)
 _lk.Size           = UDim2.new(1, -140, 1, 0)
 _lk.TextTruncate   = Enum.TextTruncate.AtEnd
 _lk.TextXAlignment = Enum.TextXAlignment.Left
 local function widthOf(s)
 local _g, _ndb = pcall(function()
 return TextService:GetTextSize(s, _lk.TextSize, _lk.Font, Vector2.new(9999, 100)).X
 end)
 return _g and _ndb or (#s * 9)
 end
 local function fitTitle()
 local _knb = _lk.AbsoluteSize.X - 4
 local _lnb = _jnb[#_jnb]
 for _, t in ipairs(_jnb) do
 if widthOf(t) <= _knb then _lnb = t; break end
 end
 if _lk.Text ~= _lnb then _lk.Text = _lnb end
 local _mnb = _lk.Parent:FindFirstChild("\84\105\116\108\101\83\104\105\110\101")
 if _mnb then _mnb.Text = _lnb end
 end
 track(_lk:GetPropertyChangedSignal("\65\98\115\111\108\117\116\101\83\105\122\101"):Connect(function() pcall(fitTitle) end))
 task.defer(function() pcall(fitTitle) end)
 pcall(function()
 local _mnb = _lk.Parent:FindFirstChild("\84\105\116\108\101\83\104\105\110\101")
 if _mnb then _mnb.TextTransparency = 0.6 end
 end)
 local _nnb
 pcall(function()
 _nnb = Instance.new("\85\73\83\116\114\111\107\101", _lk)
 _nnb.Thickness = 1
 _nnb.Color = lighten(C._idb, 0.1)
 _nnb.Transparency = 0.72
 _nnb.LineJoinMode = Enum.LineJoinMode.Round
 end)
 local _onb, sheenGrad
 pcall(function()
 _onb = Instance.new("\70\114\97\109\101", _jk)
 _onb.Name = "\72\101\97\100\101\114\83\104\101\101\110"
 _onb.Size = UDim2.new(1, 0, 0, 2)
 _onb.Position = UDim2.new(0, 0, 1, -2)
 _onb.BackgroundColor3 = C._idb
 _onb.BackgroundTransparency = 0.4
 _onb.BorderSizePixel = 0
 _onb.ZIndex = 3
 themed(_onb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 sheenGrad = Instance.new("\85\73\71\114\97\100\105\101\110\116", _onb)
 sheenGrad.Transparency = NumberSequence.new({
 NumberSequenceKeypoint.new(0.00, 1),
 NumberSequenceKeypoint.new(0.42, 1),
 NumberSequenceKeypoint.new(0.50, 0.45),
 NumberSequenceKeypoint.new(0.58, 1),
 NumberSequenceKeypoint.new(1.00, 1),
 })
 sheenGrad.Offset = Vector2.new(-1, 0)
 end)
 local t = 0
 track(RunService.Heartbeat:Connect(function(_qjb)
 if not _zi.Enabled or not _gj.enabled then return end
 t += _qjb
 if sheenGrad then
 local p = (t * 0.30) % 2
 sheenGrad.Offset = Vector2.new(p - 1, 0)
 end
 if _nnb then
 _nnb.Transparency = 0.7 + 0.08 * math.sin(t * 1.4)
 end
 end))
 onRepaint(function()
 if _gnb     then pcall(function() _gnb.Color     = ColorSequence.new(lighten(C._idb,0.45), darken(C._idb,0.12)) end) end
 if gemStroke   then pcall(function() gemStroke.Color   = lighten(C._idb, 0.55) end) end
 if _nnb then pcall(function() _nnb.Color = lighten(C._idb, 0.1)  end) end
 end)
 pcall(function()
 local _dmb = _zi:FindFirstChild("\80\114\105\115\109\72\85\68")
 if _dmb then _dmb.Position = UDim2.new(1, -16, 0, 28) end
 end)
 local function polishButton(b)
 if b:GetAttribute("\78\88\80\111\108\105\115\104\101\100") then return end
 if b:GetAttribute("\78\88\72\111\118\101\114\68\111\110\101") then return end
 b:SetAttribute("\78\88\80\111\108\105\115\104\101\100", true)
 if not b:FindFirstChildOfClass("\85\73\67\111\114\110\101\114") then
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new(0, 6)
 end
 local _lb = b:FindFirstChildOfClass("\85\73\83\99\97\108\101") or Instance.new("\85\73\83\99\97\108\101", b)
 local _pj, pressId = false, 0
 local function to(_cp, _odb, _ib, _qnb)
 if _gj.enabled then
 motionTween(_lb, TweenInfo.new(_odb, _ib or Enum.EasingStyle.Quad,
 _qnb or Enum.EasingDirection.Out), { Scale = _cp })
 else _lb.Scale = _cp end
 end
 track(b.MouseEnter:Connect(function()
 _pj = true
 to(1.028, 0.16, Enum.EasingStyle.Back)
 end))
 track(b.MouseLeave:Connect(function()
 _pj = false
 pressId = pressId + 1
 to(1, 0.14)
 end))
 track(b.MouseButton1Down:Connect(function()
 pressId = pressId + 1
 to(0.91, 0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
 end))
 track(b.MouseButton1Up:Connect(function()
 pressId = pressId + 1
 local _pnb = pressId
 to(1.055, 0.18, Enum.EasingStyle.Back)
 task.delay(0.13, function()
 if b.Parent and _pnb == pressId then
 to(_pj and 1.028 or 1, 0.12)
 end
 end)
 end))
 end
 pcall(function()
 for _, d in ipairs(_ek:GetDescendants()) do
 if d:IsA("\84\101\120\116\66\117\116\116\111\110") then pcall(polishButton, d) end
 end
 track(_ek.DescendantAdded:Connect(function(d)
 if d:IsA("\84\101\120\116\66\117\116\116\111\110") then task.defer(function() pcall(polishButton, d) end) end
 end))
 end)
end)()
;(function()
 local SoundService = game:GetService("\83\111\117\110\100\83\101\114\118\105\99\101")
 local _rnb       = game:GetService("\68\101\98\114\105\115")
 local _snb     = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\55\57\55\52\55\48\50\57\48\50\56\49\52"
 local _tnb = {
 suave    = { _hd = "\114\98\120\97\115\115\101\116\58\47\47\115\111\117\110\100\115\47\98\117\116\116\111\110\46\119\97\118",              _hob = 0.22, _iob = 0.95 },
 pop      = { _hd = "\114\98\120\97\115\115\101\116\58\47\47\115\111\117\110\100\115\47\101\108\101\99\116\114\111\110\105\99\112\105\110\103\115\104\111\114\116\46\119\97\118", _hob = 0.22, _iob = 0.60 },
 profundo = { _hd = "\114\98\120\97\115\115\101\116\58\47\47\115\111\117\110\100\115\47\98\97\115\115\46\119\97\118",               _hob = 0.26, _iob = 1.05 },
 click    = { _hd = "\114\98\120\97\115\115\101\116\58\47\47\115\111\117\110\100\115\47\99\108\105\99\107\102\97\115\116\46\119\97\118",          _hob = 0.22, _iob = 0.95 },
 _lr     = { _hd = "",                                          _hob = 0.00, _iob = 1.00 },
 }
 local _unb  = "\115\117\97\118\101"
 local _vnb = "\85\116\105\108\105\116\121\73\110\116\114\111"
 local _idb      = (C and C._idb) or Color3.fromRGB(120, 220, 255)
 local function _hj(_p, t, _ib, _wnb, _lj)
 local _xe = TweenInfo.new(t, _ib or Enum.EasingStyle.Quad, _wnb or Enum.EasingDirection.Out)
 local x = TweenService:Create(_p, _xe, _lj)
 x:Play()
 return x
 end
 local function setListaEnabled(_pb)
 pcall(function()
 local _gw = _b:FindFirstChild("\76\105\115\116\97\74\117\103\97\100\111\114\101\115\77\111\100\101\114\110\97")
 if _gw then _gw.Enabled = _pb end
 end)
 end
 local function hidePanels()
 pcall(function() _zi.Enabled = false end)
 task.defer(setListaEnabled, false)
 end
 local function popIn(_qj)
 if not _qj then return end
 pcall(function()
 local _xnb = _qj:FindFirstChildOfClass("\85\73\83\99\97\108\101") or Instance.new("\85\73\83\99\97\108\101", _qj)
 _xnb.Scale = 0.9
 TweenService:Create(_xnb, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
 end)
 end
 local function revealPanels()
 pcall(function()
 _zi.Enabled = true
 if _fj and _fj.playOpenAnim then _fj.playOpenAnim() end
 end)
 setListaEnabled(true)
 pcall(function()
 local _gw = _b:FindFirstChild("\76\105\115\116\97\74\117\103\97\100\111\114\101\115\77\111\100\101\114\110\97")
 if _gw then popIn(_gw:FindFirstChild("\86\101\110\116\97\110\97")) end
 end)
 end
 local _ynb = {}
 local _kh = false
 local _znb = false
 function _ynb.play()
 if _znb then return end
 if _kh then return end
 _kh = true
 hidePanels()
 task.delay(6, function()
 pcall(function() if not _zi.Enabled then _zi.Enabled = true end end)
 setListaEnabled(true)
 end)
 pcall(function()
 local _kgb = _b:FindFirstChild(_vnb)
 if _kgb then _kgb:Destroy() end
 end)
 task.spawn(function()
 local _aob = Instance.new("\83\99\114\101\101\110\71\117\105")
 _aob.Name = _vnb
 _aob.ResetOnSpawn = false
 _aob.IgnoreGuiInset = true
 _aob.DisplayOrder = 100000
 _aob.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 _aob.Parent = _b
 local _bob = Instance.new("\70\114\97\109\101")
 _bob.AnchorPoint = Vector2.new(0.5, 0.5)
 _bob.Position = UDim2.fromScale(0.5, 0.46)
 _bob.Size = UDim2.fromOffset(180, 200)
 _bob.BackgroundTransparency = 1
 _bob.ZIndex = 2
 _bob.Parent = _aob
 local _cob = Instance.new("\85\73\83\99\97\108\101", _bob)
 _cob.Scale = 0.6
 local _zc = 124
 local _dob = Instance.new("\70\114\97\109\101")
 _dob.AnchorPoint = Vector2.new(0.5, 0.5)
 _dob.Position = UDim2.new(0.5, 0, 0, 70)
 _dob.Size = UDim2.fromOffset(_zc + 18, _zc + 18)
 _dob.BackgroundColor3 = _idb
 _dob.BackgroundTransparency = 1
 _dob.BorderSizePixel = 0
 _dob.ZIndex = 1
 _dob.Parent = _bob
 Instance.new("\85\73\67\111\114\110\101\114", _dob).CornerRadius = UDim.new(1, 0)
 local _eob = Instance.new("\70\114\97\109\101")
 _eob.AnchorPoint = Vector2.new(0.5, 0.5)
 _eob.Position = UDim2.new(0.5, 0, 0, 70)
 _eob.Size = UDim2.fromOffset(_zc, _zc)
 _eob.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
 _eob.BackgroundTransparency = 1
 _eob.BorderSizePixel = 0
 _eob.ClipsDescendants = true
 _eob.ZIndex = 2
 _eob.Parent = _bob
 Instance.new("\85\73\67\111\114\110\101\114", _eob).CornerRadius = UDim.new(1, 0)
 local _xv = Instance.new("\85\73\83\116\114\111\107\101", _eob)
 _xv.Color = _idb
 _xv.Thickness = 1.5
 _xv.Transparency = 1
 local _fob = Instance.new("\84\101\120\116\76\97\98\101\108", _eob)
 _fob.AnchorPoint = Vector2.new(0.5, 0.5)
 _fob.Position = UDim2.fromScale(0.5, 0.5)
 _fob.Size = UDim2.fromScale(0.72, 0.72)
 _fob.BackgroundTransparency = 1
 _fob.Text = "\78\88"
 _fob.Font = Enum.Font.GothamBlack
 _fob.TextColor3 = Color3.fromRGB(255, 255, 255)
 _fob.TextScaled = true
 _fob.TextTransparency = 1
 _fob.ZIndex = 3
 local _kib = Instance.new("\84\101\120\116\76\97\98\101\108")
 _kib.AnchorPoint = Vector2.new(0.5, 0)
 _kib.Position = UDim2.new(0.5, 0, 0, 142)
 _kib.Size = UDim2.fromOffset(280, 18)
 _kib.BackgroundTransparency = 1
 _kib.Font = Enum.Font.GothamMedium
 _kib.Text = "\80\32\82\32\79\32\70\32\73\32\76\32\69\32\32\32\65\32\78\32\65\32\76\32\89\32\90\32\69\32\82"
 _kib.TextSize = 12
 _kib.TextColor3 = _idb
 _kib.TextTransparency = 1
 _kib.ZIndex = 3
 _kib.Parent = _bob
 local _gob = _tnb[_unb] or _tnb.suave
 local function playTone(_hd, _hob, _iob)
 if not _hd or _hd == "" then return end
 pcall(function()
 local _job = Instance.new("\83\111\117\110\100")
 _job.SoundId       = _hd
 _job.Volume        = _hob or 0.5
 _job.PlaybackSpeed = _iob or 1
 _job.Parent        = SoundService
 SoundService:PlayLocalSound(_job)
 _rnb:AddItem(_job, 5)
 end)
 end
 local RunService = game:GetService("\82\117\110\83\101\114\118\105\99\101")
 local _kob, SPINS = 1.25, 1
 local _lob = 0.35
 local _mob
 local function startSpin()
 local _ymb = os.clock()
 _mob = RunService.RenderStepped:Connect(function()
 local p = (os.clock() - _ymb) / _kob
 if p >= 1 then
 _cob.Scale = 1
 _eob.Size = UDim2.fromOffset(_zc, _zc)
 _dob.Size = UDim2.fromOffset(_zc + 18, _zc + 18)
 _eob.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
 _fob.TextColor3   = Color3.fromRGB(255, 255, 255)
 playTone(_gob._hd, _gob._hob, _gob._iob)
 if _mob then _mob:Disconnect(); _mob = nil end
 return
 end
 local s = 1 - (1 - p) ^ 3
 _cob.Scale = _lob + (1 - _lob) * s
 local _nob = math.cos(s * SPINS * 2 * math.pi)
 local w    = math.abs(_nob)
 local n    = (_nob + 1) * 0.5
 _eob.Size = UDim2.fromOffset(math._de(_zc * w, _zc * 0.03), _zc)
 _dob.Size = UDim2.fromOffset(math._de((_zc + 18) * w, (_zc + 18) * 0.03), _zc + 18)
 local _rj = 0.18 + 0.82 * n
 _eob.BackgroundColor3 = Color3.fromRGB(math.floor(14 * _rj), math.floor(14 * _rj), math.floor(18 * _rj))
 _fob.TextColor3   = Color3.fromRGB(math.floor(255 * _rj), math.floor(255 * _rj), math.floor(255 * _rj))
 end)
 end
 _cob.Scale = _lob
 _hj(_dob,    0.30, Enum.EasingStyle.Quad, nil, { BackgroundTransparency = 0.72 })
 _hj(_eob,    0.28, Enum.EasingStyle.Quad, nil, { BackgroundTransparency = 0 })
 _hj(_xv, 0.32, Enum.EasingStyle.Quad, nil, { Transparency = 0.18 })
 _hj(_fob,0.28, Enum.EasingStyle.Quad, nil, { TextTransparency = 0 })
 startSpin()
 task.delay(_kob * 0.72, function()
 _hj(_kib, 0.45, Enum.EasingStyle.Quad, nil, { TextTransparency = 0.12 })
 end)
 task.wait(_kob + 0.2)
 if _mob then _mob:Disconnect(); _mob = nil end
 _eob.Size = UDim2.fromOffset(_zc, _zc)
 revealPanels()
 _hj(_cob,  0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.In, { Scale = 1.14 })
 _hj(_xv, 0.40, Enum.EasingStyle.Quad, nil, { Transparency = 1 })
 _hj(_fob, 0.40, Enum.EasingStyle.Quad, nil, { TextTransparency = 1 })
 _hj(_eob,    0.40, Enum.EasingStyle.Quad, nil, { BackgroundTransparency = 1 })
 _hj(_kib,     0.35, Enum.EasingStyle.Quad, nil, { TextTransparency = 1 })
 _hj(_dob,    0.40, Enum.EasingStyle.Quad, nil, { BackgroundTransparency = 1 })
 task.wait(0.5)
 if _mob then _mob:Disconnect(); _mob = nil end
 pcall(function() _aob:Destroy() end)
 _kh = false
 end)
 end
 function _ynb.reset()
 _d.introSeen = false
 pcall(saveStore)
 end
 function _ynb.setEnabled(_pb)
 _d.introEnabled = _pb and true or false
 pcall(saveStore)
 end
 _G._ynb = _ynb
 local _oob = false
 if (not _znb) and (_d.introEnabled ~= false) and (_oob or _d.introSeen ~= true) then
 _d.introSeen = true
 pcall(saveStore)
 _ynb.play()
 end
end)()
;(function()
 local Players = game:GetService("\80\108\97\121\101\114\115")
 local UserInputService = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
 local TweenService = game:GetService("\84\119\101\101\110\83\101\114\118\105\99\101")
 local HttpService = game:GetService("\72\116\116\112\83\101\114\118\105\99\101")
 local _a = Players._bhb
 local _b = _a:WaitForChild("\80\108\97\121\101\114\71\117\105")
 local _pob = rawget(_G, "\78\88\84\104\101\109\101")
 local C = _pob and _pob.C or nil
 local _nkb = Color3.fromRGB(255, 255, 255)
 local _qob = {
 bg=Color3.fromRGB(20,15,28), _jk=Color3.fromRGB(33,24,46), _o=Color3.fromRGB(36,27,50),
 _jj=Color3.fromRGB(26,19,38), neutral=Color3.fromRGB(42,31,58), _whb=Color3.fromRGB(60,45,82),
 _idb=Color3.fromRGB(160,100,210), accent2=Color3.fromRGB(122,82,178), onAccent=_nkb,
 _hb=Color3.fromRGB(238,233,246), subtext=Color3.fromRGB(158,143,176),
 good=Color3.fromRGB(80,190,110), bad=Color3.fromRGB(196,78,92),
 avatarBg=Color3.fromRGB(52,40,72), scrollbar=Color3.fromRGB(108,86,140),
 globe=Color3.fromRGB(160,100,210),
 }
 local function lighten(c, k) return Color3.new(math.min(c.R+k,1), math.min(c.G+k,1), math.min(c.B+k,1)) end
 local function darken(c, k) return Color3.new(c.R*k, c.G*k, c.B*k) end
 local function _wfb(_r)
 if _r == "\119\104\105\116\101" then return _nkb end
 if C then
 local _rob = C[_r]
 if _rob ~= nil then return _rob end
 if _r == "\104\101\97\100\101\114"    then return C.surface end
 if _r == "\97\118\97\116\97\114\66\103"  then return C.surface end
 if _r == "\115\99\114\111\108\108\98\97\114" then return C._idb end
 if _r == "\103\108\111\98\101"     then return C._idb end
 if _r == "\97\99\99\101\110\116\50"   then return darken(C._idb, 0.78) end
 end
 return _qob[_r] or _qob._idb
 end
 local _sob = {}
 local _tob = true
 local function pthemed(_p, _q, _r)
 local _k = { _p = _p, _q = _q, _r = _r }
 table.insert(_sob, _k)
 pcall(function() _p.Destroying:Connect(function() _k._p = nil end) end)
 pcall(function() _p[_q] = _wfb(_r) end)
 return _p
 end
 local _uob = {}
 local function onPrepaint(_s)
 table.insert(_uob, _s)
 return function()
 for i = #_uob, 1, -1 do
 if _uob[i] == _s then table.remove(_uob, i) end
 end
 end
 end
 local function prepaint()
 if not _tob then return end
 local n = 0
 for i = 1, #_sob do
 local e = _sob[i]
 if e._p then
 n = n + 1
 _sob[n] = e
 pcall(function() e._p[e._q] = _wfb(e._r) end)
 end
 end
 for i = #_sob, n + 1, -1 do _sob[i] = nil end
 for _, _s in ipairs(_uob) do pcall(_s) end
 end
 if _pob and _pob.onRepaint then pcall(_pob.onRepaint, prepaint) end
 local _vob = setmetatable({}, { __index = function(_, k) return _wfb(k) end })
 local function _rs(_ieb)
 local _wob = { (getgenv and getgenv().setclipboard), setclipboard, (syn and syn.write_clipboard), toclipboard }
 for _, _s in ipairs(_wob) do
 if type(_s) == "\102\117\110\99\116\105\111\110" then
 local _g = pcall(_s, _ieb)
 if _g then return true end
 end
 end
 warn("\91\76\105\115\116\97\93\32\78\111\32\115\101\32\101\110\99\111\110\116\114\243\32\117\110\97\32\102\117\110\99\105\243\110\32\100\101\32\112\111\114\116\97\112\97\112\101\108\101\115\32\100\105\115\112\111\110\105\98\108\101\46")
 return false
 end
 local _ec = (syn and syn.request) or http_request or request or (http and http.request)
 local function apiGet(_gc)
 local _x
 if _ec then
 local _g, _mc = pcall(_ec, { Url = _gc, Method = "\71\69\84" })
 if _g and _mc and _mc.Body then _x = _mc.Body end
 end
 if not _x then
 local _g, _mc = pcall(function() return game:HttpGet(_gc) end)
 if _g then _x = _mc end
 end
 if not _x then return nil end
 local _g, _ie = pcall(function() return HttpService:JSONDecode(_x) end)
 return _g and _ie or nil
 end
 local function apiPost(_gc, _xob)
 if not _ec then return nil end
 local _g, _mc = pcall(_ec, {
 Url = _gc, Method = "\80\79\83\84",
 Headers = { ["\67\111\110\116\101\110\116\45\84\121\112\101"] = "\97\112\112\108\105\99\97\116\105\111\110\47\106\115\111\110" },
 Body = HttpService:JSONEncode(_xob),
 })
 if not (_g and _mc and _mc.Body) then return nil end
 local _ic, _ie = pcall(function() return HttpService:JSONDecode(_mc.Body) end)
 return _ic and _ie or nil
 end
 local _if = {}
 local _yob = "\114\98\120\97\115\115\101\116\105\100\58\47\47\48"
 local function cargarAvatarAsync(_uc, _zob)
 if _if[_uc] then
 _zob.Image = _if[_uc]
 return
 end
 task.spawn(function()
 local _g, _sy = pcall(function()
 return Players:GetUserThumbnailAsync(_uc, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
 end)
 local _jl = (_g and _sy ~= "" and _sy) or _yob
 _if[_uc] = _jl
 if _zob and _zob.Parent then
 _zob.Image = _jl
 end
 end)
 end
 if _b:FindFirstChild("\76\105\115\116\97\74\117\103\97\100\111\114\101\115\77\111\100\101\114\110\97") then
 _b.ListaJugadoresModerna:Destroy()
 end
 local _zi = Instance.new("\83\99\114\101\101\110\71\117\105")
 _zi.Name = "\76\105\115\116\97\74\117\103\97\100\111\114\101\115\77\111\100\101\114\110\97"
 _zi.ResetOnSpawn = false
 _zi.IgnoreGuiInset = true
 _zi.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 _zi.DisplayOrder = 2147482
 _zi.Parent = _b
 local _apb = {}
 local function ltrack(_aj) table.insert(_apb, _aj); return _aj end
 _zi.AncestryChanged:Connect(function(_, _dpb)
 if not _dpb then
 _tob = false
 for _, c in ipairs(_apb) do pcall(function() c:Disconnect() end) end
 table.clear(_apb)
 table.clear(_sob)
 table.clear(_uob)
 end
 end)
 local _bpb, ALTO = 380, 480
 local _cpb = Instance.new("\70\114\97\109\101")
 _cpb.Name = "\86\101\110\116\97\110\97"
 _cpb.Size = UDim2.new(0, _bpb, 0, ALTO)
 _cpb.Position = UDim2.new(0.5, 308, 0.5, -ALTO/2)
 _cpb.BorderSizePixel = 0
 _cpb.ClipsDescendants = true
 _cpb.Parent = _zi
 pthemed(_cpb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\103")
 Instance.new("\85\73\67\111\114\110\101\114", _cpb).CornerRadius = UDim.new(0, 10)
 local _epb = Instance.new("\85\73\83\116\114\111\107\101", _cpb)
 _epb.Thickness = 1.2
 _epb.Transparency = 0.4
 pthemed(_epb, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _fpb = Instance.new("\70\114\97\109\101", _cpb)
 _fpb.Name = "\69\110\99\97\98\101\122\97\100\111"
 _fpb.Size = UDim2.new(1, 0, 0, 34)
 _fpb.BorderSizePixel = 0
 pthemed(_fpb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\104\101\97\100\101\114")
 Instance.new("\85\73\67\111\114\110\101\114", _fpb).CornerRadius = UDim.new(0, 10)
 local _feb = Instance.new("\84\101\120\116\76\97\98\101\108", _fpb)
 _feb.Size = UDim2.new(1, -110, 1, 0)
 _feb.Position = UDim2.new(0, 14, 0, 0)
 _feb.BackgroundTransparency = 1
 _feb.Font = Enum.Font.GothamBold
 _feb.Text = "\74\117\103\97\100\111\114\101\115\58\32\48"
 _feb.TextSize = 14
 _feb.TextXAlignment = Enum.TextXAlignment.Left
 _feb.TextTruncate = Enum.TextTruncate.AtEnd
 pthemed(_feb, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _gpb = Instance.new("\70\114\97\109\101", _fpb)
 _gpb.Name = "\67\111\110\116\114\111\108\101\115"
 _gpb.AnchorPoint = Vector2.new(1, 0.5)
 _gpb.Position = UDim2.new(1, -8, 0.5, 0)
 _gpb.Size = UDim2.new(0, 24*3 + 6*2, 0, 24)
 _gpb.BackgroundTransparency = 1
 local _hpb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _gpb)
 _hpb.FillDirection = Enum.FillDirection.Horizontal
 _hpb.Padding = UDim.new(0, 6)
 _hpb.SortOrder = Enum.SortOrder.LayoutOrder
 _hpb.VerticalAlignment = Enum.VerticalAlignment.Center
 local function crearControl(_tr, _qkb, _skb)
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110", _gpb)
 b.Size = UDim2.new(0, 24, 0, 24)
 b.LayoutOrder = _tr
 b.AutoButtonColor = false
 b.Text = ""
 b.BorderSizePixel = 0
 b.Active = true
 b:SetAttribute("\114\111\108\66\97\115\101", _qkb)
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new(0, 6)
 pthemed(b, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", _qkb)
 local _v = Instance.new("\85\73\83\116\114\111\107\101", b)
 _v.Thickness = 1
 _v.Transparency = 0.35
 pthemed(_v, "\67\111\108\111\114", "\98\111\114\100\101\114")
 b.MouseEnter:Connect(function()
 TweenService:Create(b, TweenInfo.new(0.12), { BackgroundColor3 = lighten(_wfb(_qkb), 0.10) }):Play()
 end)
 b.MouseLeave:Connect(function()
 TweenService:Create(b, TweenInfo.new(0.16), { BackgroundColor3 = _wfb(_qkb) }):Play()
 end)
 b.MouseButton1Click:Connect(_skb)
 return b
 end
 local _ipb, maximizado = false, false
 local _jpb = UDim2.new(0, _bpb, 0, ALTO)
 local _kpb = _cpb.Position
 local function aplicarVentana(_mpb)
 local _mdb, _tn
 if maximizado then
 _mdb = UDim2.new(0.96, 0, 0.92, 0)
 _tn  = UDim2.new(0.02, 0, 0.04, 0)
 else
 _mdb = _jpb
 _tn  = _kpb
 end
 if _ipb then
 _mdb = UDim2.new(_mdb.X.Scale, _mdb.X.Offset, 0, 34)
 end
 local _odb = _mpb == false and 0 or 0.3
 local _xe = TweenInfo.new(_odb, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
 TweenService:Create(_cpb, _xe, { Size = _mdb, Position = _tn }):Play()
 if _odb > 0 then
 local _lpb = _cpb:FindFirstChild("\68\114\97\103\83\99\97\108\101")
 if _lpb then
 _lpb.Scale = 0.98
 TweenService:Create(_lpb, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
 end
 end
 end
 local _tkb = crearControl(1, "\110\101\117\116\114\97\108", function()
 _ipb = not _ipb
 aplicarVentana(true)
 end)
 do
 local _kdb = Instance.new("\70\114\97\109\101", _tkb)
 _kdb.AnchorPoint = Vector2.new(0.5, 0.5)
 _kdb.Position = UDim2.new(0.5, 0, 0.5, 0)
 _kdb.Size = UDim2.new(0, 11, 0, 2)
 _kdb.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _kdb).CornerRadius = UDim.new(1, 0)
 pthemed(_kdb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\116\101\120\116")
 end
 local _ukb = crearControl(2, "\110\101\117\116\114\97\108", function()
 maximizado = not maximizado
 if maximizado then _ipb = false end
 aplicarVentana(true)
 end)
 do
 local _zm = Instance.new("\70\114\97\109\101", _ukb)
 _zm.AnchorPoint = Vector2.new(0.5, 0.5)
 _zm.Position = UDim2.new(0.5, 0, 0.5, 0)
 _zm.Size = UDim2.new(0, 12, 0, 11)
 _zm.BackgroundTransparency = 1
 _zm.BorderSizePixel = 0
 Instance.new("\85\73\67\111\114\110\101\114", _zm).CornerRadius = UDim.new(0, 2)
 local _kb = Instance.new("\85\73\83\116\114\111\107\101", _zm)
 _kb.Thickness = 1.6
 pthemed(_kb, "\67\111\108\111\114", "\116\101\120\116")
 end
 local _npb = crearControl(3, "\98\97\100", function()
 _tob = false
 local _lpb = _cpb:FindFirstChild("\68\114\97\103\83\99\97\108\101")
 if _lpb then
 TweenService:Create(_lpb, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.9 }):Play()
 TweenService:Create(_cpb, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { BackgroundTransparency = 1 }):Play()
 task.delay(0.2, function() _zi:Destroy() end)
 else
 _zi:Destroy()
 end
 end)
 do
 local x = Instance.new("\84\101\120\116\76\97\98\101\108", _npb)
 x.Size = UDim2.new(1, 0, 1, 0)
 x.BackgroundTransparency = 1
 x.Font = Enum.Font.GothamBold
 x.TextSize = 14
 x.Text = "\88"
 x.TextColor3 = _nkb
 end
 local _opb = Instance.new("\84\101\120\116\66\111\120", _cpb)
 _opb.Size = UDim2.new(1, -16, 0, 30)
 _opb.Position = UDim2.new(0, 8, 0, 42)
 _opb.PlaceholderText = "\66\117\115\99\97\114\32\101\110\32\101\108\32\115\101\114\118\105\100\111\114\32\111\32\101\110\32\116\111\100\111\32\82\111\98\108\111\120\46\46\46"
 _opb.Font = Enum.Font.Gotham
 _opb.TextSize = 13
 _opb.BorderSizePixel = 0
 _opb.ClearTextOnFocus = false
 _opb.Text = ""
 _opb.TextXAlignment = Enum.TextXAlignment.Left
 pthemed(_opb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\105\110\112\117\116")
 pthemed(_opb, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 pthemed(_opb, "\80\108\97\99\101\104\111\108\100\101\114\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 Instance.new("\85\73\67\111\114\110\101\114", _opb).CornerRadius = UDim.new(0, 14)
 local _ppb = Instance.new("\85\73\80\97\100\100\105\110\103", _opb)
 _ppb.PaddingLeft = UDim.new(0, 30)
 _ppb.PaddingRight = UDim.new(0, 8)
 local _al = Instance.new("\70\114\97\109\101", _opb)
 _al.Name = "\83\101\97\114\99\104\73\99\111\110"
 _al.Size = UDim2.new(0, 16, 0, 16)
 _al.Position = UDim2.new(0, 9, 0.5, -8)
 _al.BackgroundTransparency = 1
 _al.ZIndex = 2
 do
 local _bl = Instance.new("\70\114\97\109\101", _al)
 _bl.AnchorPoint = Vector2.new(0.5, 0.5)
 _bl.Position = UDim2.new(0.42, 0, 0.42, 0)
 _bl.Size = UDim2.fromOffset(10, 10)
 _bl.BackgroundTransparency = 1
 _bl.BorderSizePixel = 0
 _bl.ZIndex = 2
 Instance.new("\85\73\67\111\114\110\101\114", _bl).CornerRadius = UDim.new(1, 0)
 local _cl = Instance.new("\85\73\83\116\114\111\107\101", _bl)
 _cl.Thickness = 1.6
 pthemed(_cl, "\67\111\108\111\114", "\115\117\98\116\101\120\116")
 local _dl = Instance.new("\70\114\97\109\101", _al)
 _dl.AnchorPoint = Vector2.new(0.5, 0.5)
 _dl.Position = UDim2.new(0.72, 0, 0.72, 0)
 _dl.Size = UDim2.fromOffset(5, 1.8)
 _dl.Rotation = 45
 _dl.BorderSizePixel = 0
 _dl.ZIndex = 2
 Instance.new("\85\73\67\111\114\110\101\114", _dl).CornerRadius = UDim.new(1, 0)
 pthemed(_dl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 local _qpb = Instance.new("\85\73\83\116\114\111\107\101", _opb)
 _qpb.Thickness = 1
 _qpb.Transparency = 0.45
 pthemed(_qpb, "\67\111\108\111\114", "\98\111\114\100\101\114")
 _opb.Focused:Connect(function()
 TweenService:Create(_qpb, TweenInfo.new(0.15), { Transparency = 0, Color = _wfb("\97\99\99\101\110\116") }):Play()
 end)
 _opb:GetPropertyChangedSignal("\67\117\114\115\111\114\80\111\115\105\116\105\111\110"):Connect(function()
 if _opb:IsFocused() then return end
 TweenService:Create(_qpb, TweenInfo.new(0.2), { Transparency = 0.45, Color = _wfb("\98\111\114\100\101\114") }):Play()
 end)
 local function onSearchBlur()
 TweenService:Create(_qpb, TweenInfo.new(0.2), { Transparency = 0.45, Color = _wfb("\98\111\114\100\101\114") }):Play()
 end
 local _rpb = Instance.new("\70\114\97\109\101", _cpb)
 _rpb.Size = UDim2.new(1, -16, 0, 0)
 _rpb.Position = UDim2.new(0, 8, 0, 74)
 _rpb.BorderSizePixel = 0
 _rpb.Visible = false
 _rpb.ZIndex = 5
 _rpb.ClipsDescendants = true
 pthemed(_rpb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 Instance.new("\85\73\67\111\114\110\101\114", _rpb).CornerRadius = UDim.new(0, 6)
 local _spb = Instance.new("\85\73\83\116\114\111\107\101", _rpb)
 _spb.Thickness = 1
 _spb.Transparency = 0.4
 pthemed(_spb, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _tpb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _rpb)
 _tpb.SortOrder = Enum.SortOrder.LayoutOrder
 _tpb.Padding = UDim.new(0, 0)
 local _hw = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _cpb)
 _hw.Size = UDim2.new(1, -8, 1, -80)
 _hw.Position = UDim2.new(0, 4, 0, 78)
 _hw.BackgroundTransparency = 0.5
 _hw.BorderSizePixel = 0
 _hw.ScrollBarThickness = 5
 _hw.ScrollingDirection = Enum.ScrollingDirection.Y
 _hw.CanvasSize = UDim2.new(0, 0, 0, 0)
 _hw.AutomaticCanvasSize = Enum.AutomaticSize.Y
 pthemed(_hw, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\105\110\112\117\116")
 pthemed(_hw, "\83\99\114\111\108\108\66\97\114\73\109\97\103\101\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _upb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _hw)
 _upb.Padding = UDim.new(0, 4)
 _upb.FillDirection = Enum.FillDirection.Vertical
 _upb.HorizontalAlignment = Enum.HorizontalAlignment.Center
 _upb.SortOrder = Enum.SortOrder.LayoutOrder
 local _vpb = Instance.new("\85\73\80\97\100\100\105\110\103", _hw)
 _vpb.PaddingTop = UDim.new(0, 4)
 _vpb.PaddingBottom = UDim.new(0, 4)
 local _wpb = Instance.new("\84\101\120\116\76\97\98\101\108", _cpb)
 _wpb.Size = UDim2.new(1, -20, 0, 30)
 _wpb.Position = UDim2.new(0, 10, 0.5, -15)
 _wpb.BackgroundTransparency = 1
 _wpb.Font = Enum.Font.Gotham
 _wpb.TextSize = 13
 _wpb.Text = "\78\111\32\115\101\32\101\110\99\111\110\116\114\97\114\111\110\32\106\117\103\97\100\111\114\101\115"
 _wpb.Visible = false
 pthemed(_wpb, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _xpb = {}
 local _ypb = false
 local _zpb = 0
 local _aqb = false
 local function obtenerCategoriaYClave(_rr)
 if _rr == "" then return 2, "" end
 local _bqb = _rr:_is(1,1)
 local _cqb = _bqb:_cqb()
 if not _cqb then return 3, _rr:lower() end
 if _cqb >= 48 and _cqb <= 57 then
 return 0, _rr:lower()
 elseif (_cqb >= 65 and _cqb <= 90) or (_cqb >= 97 and _cqb <= 122) then
 return 1, _rr:lower()
 elseif _cqb >= 32 and _cqb <= 126 then
 return 2, _rr:lower()
 else
 return 3, _rr:lower()
 end
 end
 local function obtenerSeccion(_rr)
 local _bqb = _rr:_is(1,1)
 local _cqb = _bqb:_cqb()
 if not _cqb then return "\79\116\104\101\114" end
 if _cqb >= 48 and _cqb <= 57 then
 return "\48\45\57"
 elseif (_cqb >= 65 and _cqb <= 90) or (_cqb >= 97 and _cqb <= 122) then
 return string.upper(_bqb)
 elseif _cqb >= 32 and _cqb <= 126 then
 return "\35"
 else
 return "\79\116\104\101\114"
 end
 end
 local function compararJugadores(_hqb, _iqb)
 local _dqb = _xpb[_hqb]
 local _eqb = _xpb[_iqb]
 if not _dqb or not _eqb then return false end
 local _fqb, clave1 = obtenerCategoriaYClave(_dqb._rr)
 local _gqb, clave2 = obtenerCategoriaYClave(_eqb._rr)
 if _fqb ~= _gqb then return _fqb < _gqb end
 return clave1 < clave2
 end
 local function animarCopiado(_gb, _jqb)
 _gb.Text = "\67\111\112\105\97\100\111"
 TweenService:Create(_gb, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = _wfb("\103\111\111\100") }):Play()
 local _lb = _gb:FindFirstChild("\67\111\112\121\83\99\97\108\101")
 if not _lb then _lb = Instance.new("\85\73\83\99\97\108\101", _gb); _lb.Name = "\67\111\112\121\83\99\97\108\101" end
 _lb.Scale = 1.12
 TweenService:Create(_lb, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
 task.delay(1.0, function()
 if _gb and _gb.Parent then
 _gb.Text = _jqb
 local _r = _gb:GetAttribute("\114\111\108\66\97\115\101") or "\97\99\99\101\110\116"
 TweenService:Create(_gb, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = _wfb(_r) }):Play()
 end
 end)
 end
 local function crearBotonTarjeta(_t, _ieb, _tr, _r, _kqb)
 local _gb = Instance.new("\84\101\120\116\66\117\116\116\111\110", _t)
 _gb.Size = UDim2.new(1, 0, 0, 26)
 _gb.LayoutOrder = _tr
 _gb.Text = _ieb
 _gb.Font = Enum.Font.GothamBold
 _gb.TextSize = 12
 _gb.TextTruncate = Enum.TextTruncate.AtEnd
 _gb.BorderSizePixel = 0
 _gb.AutoButtonColor = false
 _gb:SetAttribute("\114\111\108\66\97\115\101", _r)
 Instance.new("\85\73\67\111\114\110\101\114", _gb).CornerRadius = UDim.new(0, 6)
 pthemed(_gb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", _r)
 pthemed(_gb, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 local _lqb = Instance.new("\85\73\83\116\114\111\107\101", _gb)
 _lqb.Thickness = 1; _lqb.Transparency = 0.7
 pthemed(_lqb, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _mqb = Instance.new("\85\73\83\99\97\108\101", _gb)
 _mqb.Scale = 1
 local _pj, pressId = false, 0
 _gb.MouseEnter:Connect(function()
 _pj = true
 TweenService:Create(_gb, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = lighten(_wfb(_r), 0.10) }):Play()
 TweenService:Create(_lqb, TweenInfo.new(0.12), { Transparency = 0.3 }):Play()
 TweenService:Create(_mqb, TweenInfo.new(0.16, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.028 }):Play()
 end)
 _gb.MouseLeave:Connect(function()
 _pj = false
 pressId = pressId + 1
 TweenService:Create(_gb, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = _wfb(_r) }):Play()
 TweenService:Create(_lqb, TweenInfo.new(0.18), { Transparency = 0.7 }):Play()
 TweenService:Create(_mqb, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 }):Play()
 end)
 _gb.MouseButton1Down:Connect(function()
 pressId = pressId + 1
 TweenService:Create(_mqb, TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.90 }):Play()
 end)
 _gb.MouseButton1Up:Connect(function()
 pressId = pressId + 1
 local _pnb = pressId
 TweenService:Create(_mqb, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.055 }):Play()
 task.delay(0.13, function()
 if _gb.Parent and _pnb == pressId then
 TweenService:Create(_mqb, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = _pj and 1.028 or 1 }):Play()
 end
 end)
 end)
 _gb.MouseButton1Click:Connect(function() _kqb(_gb, _ieb) end)
 return _gb
 end
 local function analizarEnAnalyzer(_nqb)
 if type(_G.NXAnalyze) == "\102\117\110\99\116\105\111\110" then
 pcall(_G.NXAnalyze, _nqb)
 return true
 end
 warn("\91\76\105\115\116\97\93\32\69\108\32\65\110\97\108\121\122\101\114\32\110\111\32\101\115\116\225\32\99\97\114\103\97\100\111\32\40\115\105\110\32\95\71\46\78\88\65\110\97\108\121\122\101\41\46")
 return false
 end
 local _oqb
 local function actualizarLista()
 local _pqb = {}
 for _rqb, _ in pairs(_xpb) do table.insert(_pqb, _rqb) end
 table.sort(_pqb, compararJugadores)
 local _ieb = _opb.Text:lower()
 local _qqb = (_ieb ~= "")
 local _sqb = {}
 for _, _rqb in ipairs(_pqb) do
 local _qr = _xpb[_rqb]
 if not _qqb
 or string.find(_qr._bp:lower(), _ieb, 1, true)
 or string.find(_qr._rr:lower(), _ieb, 1, true) then
 table.insert(_sqb, _rqb)
 end
 end
 for _, _bj in ipairs(_hw:GetChildren()) do
 if _bj:IsA("\70\114\97\109\101") and _bj.Name:find("\94\83\101\99\99\105\111\110\95") then
 _bj:Destroy()
 end
 end
 for _rqb, _qr in pairs(_xpb) do
 _qr._qj.Visible = false
 _qr._qj.LayoutOrder = 9999
 end
 local _tr = 1
 local _tqb = nil
 for _, _rqb in ipairs(_sqb) do
 local _qr = _xpb[_rqb]
 local _uqb = _qqb and "\69\110\32\101\115\116\101\32\115\101\114\118\105\100\111\114" or obtenerSeccion(_qr._rr)
 if _uqb ~= _tqb then
 local _jk = Instance.new("\70\114\97\109\101", _hw)
 _jk.Name = "\83\101\99\99\105\111\110\95" .. _uqb
 _jk.Size = UDim2.new(1, -16, 0, 24)
 _jk.BorderSizePixel = 0
 _jk.LayoutOrder = _tr
 pthemed(_jk, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\104\101\97\100\101\114")
 Instance.new("\85\73\67\111\114\110\101\114", _jk).CornerRadius = UDim.new(0, 6)
 local _z = Instance.new("\84\101\120\116\76\97\98\101\108", _jk)
 _z.Size = UDim2.new(1, -16, 1, 0)
 _z.Position = UDim2.new(0, 10, 0, 0)
 _z.BackgroundTransparency = 1
 _z.Font = Enum.Font.GothamBold
 _z.TextSize = 13
 _z.Text = _uqb
 _z.TextXAlignment = Enum.TextXAlignment.Left
 pthemed(_z, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 _tr = _tr + 1
 _tqb = _uqb
 end
 _qr._qj.Visible = true
 _qr._qj.LayoutOrder = _tr
 _tr = _tr + 1
 end
 _ypb = (#_sqb > 0)
 _oqb()
 local _uf = 0
 for _ in pairs(_xpb) do _uf = _uf + 1 end
 if _qqb then
 _feb.Text = "\74\117\103\97\100\111\114\101\115\58\32" .. #_sqb .. "\32\47\32" .. _uf
 else
 _feb.Text = "\74\117\103\97\100\111\114\101\115\58\32" .. _uf
 end
 end
 function _oqb()
 local _qqb = (_opb.Text ~= "")
 local _vqb = (next(_xpb) ~= nil)
 _wpb.Visible =
 (not _aqb) and (not _ypb) and (_vqb or _qqb)
 end
 local function crearTarjeta(_rqb, _xqb)
 if _xpb[_rqb] then return end
 local _uc = _rqb.UserId
 local _wqb = Instance.new("\70\114\97\109\101", _hw)
 _wqb.Name = "\84\97\114\106\101\116\97\95" .. _rqb.Name
 _wqb.Size = UDim2.new(1, -16, 0, 82)
 _wqb.BorderSizePixel = 0
 _wqb.LayoutOrder = 0
 _wqb.ClipsDescendants = true
 pthemed(_wqb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 Instance.new("\85\73\67\111\114\110\101\114", _wqb).CornerRadius = UDim.new(0, 8)
 local _yqb = Instance.new("\85\73\83\116\114\111\107\101", _wqb)
 _yqb.Thickness = 1; _yqb.Transparency = 0.6
 pthemed(_yqb, "\67\111\108\111\114", "\98\111\114\100\101\114")
 _wqb.InputBegan:Connect(function(i)
 if i.UserInputType == Enum.UserInputType.MouseMovement then
 TweenService:Create(_yqb, TweenInfo.new(0.12), { Transparency = 0.2 }):Play()
 TweenService:Create(_wqb, TweenInfo.new(0.12), { BackgroundColor3 = lighten(_wfb("\99\97\114\100"), 0.03) }):Play()
 end
 end)
 _wqb.InputEnded:Connect(function(i)
 if i.UserInputType == Enum.UserInputType.MouseMovement then
 TweenService:Create(_yqb, TweenInfo.new(0.18), { Transparency = 0.6 }):Play()
 TweenService:Create(_wqb, TweenInfo.new(0.18), { BackgroundColor3 = _wfb("\99\97\114\100") }):Play()
 end
 end)
 local _zqb = onPrepaint(function()
 if _wqb.Parent then
 pcall(function() _yqb.Color = _wfb("\98\111\114\100\101\114") end)
 pcall(function() _wqb.BackgroundColor3 = _wfb("\99\97\114\100") end)
 end
 end)
 _wqb.Destroying:Connect(_zqb)
 local _cq = Instance.new("\73\109\97\103\101\76\97\98\101\108", _wqb)
 _cq.Size = UDim2.new(0, 44, 0, 44)
 _cq.Position = UDim2.new(0, 10, 0, 8)
 _cq.Image = _if[_uc] or _yob
 _cq.BorderSizePixel = 0
 pthemed(_cq, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\118\97\116\97\114\66\103")
 Instance.new("\85\73\67\111\114\110\101\114", _cq).CornerRadius = UDim.new(0, 22)
 cargarAvatarAsync(_uc, _cq)
 local _arb = Instance.new("\84\101\120\116\76\97\98\101\108", _wqb)
 _arb.Size = UDim2.new(1, -68, 0, 20)
 _arb.Position = UDim2.new(0, 64, 0, 8)
 _arb.BackgroundTransparency = 1
 _arb.Font = Enum.Font.GothamBold
 _arb.TextSize = 14
 _arb.Text = _rqb.DisplayName
 _arb.TextXAlignment = Enum.TextXAlignment.Left
 _arb.TextTruncate = Enum.TextTruncate.AtEnd
 pthemed(_arb, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _brb = Instance.new("\84\101\120\116\76\97\98\101\108", _wqb)
 _brb.Size = UDim2.new(1, -68, 0, 16)
 _brb.Position = UDim2.new(0, 64, 0, 28)
 _brb.BackgroundTransparency = 1
 _brb.Font = Enum.Font.Gotham
 _brb.TextSize = 12
 _brb.Text = "\64" .. _rqb.Name
 _brb.TextXAlignment = Enum.TextXAlignment.Left
 _brb.TextTruncate = Enum.TextTruncate.AtEnd
 pthemed(_brb, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _crb = Instance.new("\70\114\97\109\101", _wqb)
 _crb.Size = UDim2.new(1, -20, 0, 26)
 _crb.Position = UDim2.new(0, 10, 0, 50)
 _crb.BackgroundTransparency = 1
 local _drb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _crb)
 _drb.FillDirection = Enum.FillDirection.Horizontal
 _drb.SortOrder = Enum.SortOrder.LayoutOrder
 _drb.Padding = UDim.new(0, 6)
 _drb.VerticalAlignment = Enum.VerticalAlignment.Center
 local _erb = crearBotonTarjeta(_crb, "\78\111\109\98\114\101", 1, "\97\99\99\101\110\116", function(_gb, _hg)
 if _rs(_rqb.DisplayName) then animarCopiado(_gb, _hg) end
 end)
 local _frb = crearBotonTarjeta(_crb, "\85\115\117\97\114\105\111", 2, "\97\99\99\101\110\116\50", function(_gb, _hg)
 if _rs(_rqb.Name) then animarCopiado(_gb, _hg) end
 end)
 local _grb = crearBotonTarjeta(_crb, "\65\110\97\108\105\122\97\114", 3, "\103\111\111\100", function()
 analizarEnAnalyzer(_rqb.Name)
 end)
 _erb.Size = UDim2.new(0, 80, 1, 0)
 _frb.Size = UDim2.new(0, 80, 1, 0)
 _grb.Size = UDim2.new(1, -172, 1, 0)
 local _qr = {
 _qj = _wqb, _uc = _uc,
 _arb = _arb, _brb = _brb,
 _bp = _rqb.Name, _rr = _rqb.DisplayName,
 }
 _xpb[_rqb] = _qr
 _qr.displayNameConn = _rqb:GetPropertyChangedSignal("\68\105\115\112\108\97\121\78\97\109\101"):Connect(function()
 _qr._rr = _rqb.DisplayName
 _arb.Text = _rqb.DisplayName
 actualizarLista()
 end)
 if not _xqb then actualizarLista() end
 end
 local function eliminarTarjeta(_rqb)
 local _qr = _xpb[_rqb]
 if _qr then
 if _qr.displayNameConn then
 pcall(function() _qr.displayNameConn:Disconnect() end)
 end
 if _qr._qj then _qr._qj:Destroy() end
 _xpb[_rqb] = nil
 actualizarLista()
 end
 end
 local _hrb = "\83\101\99\99\105\111\110\71\108\111\98\97\108"
 local _irb = 100000
 local _jrb = 12
 local _krb = nil
 local _lrb = 0
 local _mrb = nil
 local function limpiarGlobales()
 for _, _bj in ipairs(_hw:GetChildren()) do
 if _bj:IsA("\70\114\97\109\101") and (_bj.Name == _hrb or _bj.Name:find("\94\71\108\111\98\97\108\95")) then
 _bj:Destroy()
 end
 end
 _krb = nil
 _zpb = 0
 _aqb = false
 end
 local function crearHeaderGlobal(_ieb)
 local _jk = Instance.new("\70\114\97\109\101", _hw)
 _jk.Name = _hrb
 _jk.Size = UDim2.new(1, -16, 0, 24)
 _jk.BorderSizePixel = 0
 _jk.LayoutOrder = _irb
 pthemed(_jk, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\104\101\97\100\101\114")
 Instance.new("\85\73\67\111\114\110\101\114", _jk).CornerRadius = UDim.new(0, 6)
 local _z = Instance.new("\84\101\120\116\76\97\98\101\108", _jk)
 _z.Size = UDim2.new(1, -16, 1, 0)
 _z.Position = UDim2.new(0, 10, 0, 0)
 _z.BackgroundTransparency = 1
 _z.Font = Enum.Font.GothamBold
 _z.TextSize = 13
 _z.Text = _ieb
 _z.TextXAlignment = Enum.TextXAlignment.Left
 pthemed(_z, "\84\101\120\116\67\111\108\111\114\51", "\103\108\111\98\101")
 _krb = _z
 _aqb = true
 end
 local function crearTarjetaGlobal(_xe, _tr)
 local _wqb = Instance.new("\70\114\97\109\101", _hw)
 _wqb.Name = "\71\108\111\98\97\108\95" .. _xe._hd
 _wqb.Size = UDim2.new(1, -16, 0, 82)
 _wqb.BorderSizePixel = 0
 _wqb.LayoutOrder = _tr
 _wqb.ClipsDescendants = true
 pthemed(_wqb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 Instance.new("\85\73\67\111\114\110\101\114", _wqb).CornerRadius = UDim.new(0, 8)
 local _nrb = Instance.new("\85\73\83\116\114\111\107\101", _wqb)
 _nrb.Thickness = 1; _nrb.Transparency = 0.6
 pthemed(_nrb, "\67\111\108\111\114", "\98\111\114\100\101\114")
 _wqb.InputBegan:Connect(function(i)
 if i.UserInputType == Enum.UserInputType.MouseMovement then
 TweenService:Create(_nrb, TweenInfo.new(0.12), { Transparency = 0.2 }):Play()
 TweenService:Create(_wqb, TweenInfo.new(0.12), { BackgroundColor3 = lighten(_wfb("\99\97\114\100"), 0.03) }):Play()
 end
 end)
 _wqb.InputEnded:Connect(function(i)
 if i.UserInputType == Enum.UserInputType.MouseMovement then
 TweenService:Create(_nrb, TweenInfo.new(0.18), { Transparency = 0.6 }):Play()
 TweenService:Create(_wqb, TweenInfo.new(0.18), { BackgroundColor3 = _wfb("\99\97\114\100") }):Play()
 end
 end)
 local _orb = Instance.new("\70\114\97\109\101", _wqb)
 _orb.Size = UDim2.new(0, 3, 1, -12)
 _orb.Position = UDim2.new(0, 0, 0, 6)
 _orb.BorderSizePixel = 0
 pthemed(_orb, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\103\108\111\98\101")
 Instance.new("\85\73\67\111\114\110\101\114", _orb).CornerRadius = UDim.new(0, 2)
 local _cq = Instance.new("\73\109\97\103\101\76\97\98\101\108", _wqb)
 _cq.Size = UDim2.new(0, 44, 0, 44)
 _cq.Position = UDim2.new(0, 10, 0, 8)
 _cq.Image = _if[_xe._hd] or _yob
 _cq.BorderSizePixel = 0
 pthemed(_cq, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\118\97\116\97\114\66\103")
 Instance.new("\85\73\67\111\114\110\101\114", _cq).CornerRadius = UDim.new(0, 22)
 cargarAvatarAsync(_xe._hd, _cq)
 local _arb = Instance.new("\84\101\120\116\76\97\98\101\108", _wqb)
 _arb.Size = UDim2.new(1, -68, 0, 20)
 _arb.Position = UDim2.new(0, 64, 0, 8)
 _arb.BackgroundTransparency = 1
 _arb.Font = Enum.Font.GothamBold
 _arb.TextSize = 14
 _arb.Text = _xe._rr
 _arb.TextXAlignment = Enum.TextXAlignment.Left
 _arb.TextTruncate = Enum.TextTruncate.AtEnd
 pthemed(_arb, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _brb = Instance.new("\84\101\120\116\76\97\98\101\108", _wqb)
 _brb.Size = UDim2.new(1, -68, 0, 16)
 _brb.Position = UDim2.new(0, 64, 0, 28)
 _brb.BackgroundTransparency = 1
 _brb.Font = Enum.Font.Gotham
 _brb.TextSize = 12
 _brb.Text = "\64" .. _xe._i
 _brb.TextXAlignment = Enum.TextXAlignment.Left
 _brb.TextTruncate = Enum.TextTruncate.AtEnd
 pthemed(_brb, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _crb = Instance.new("\70\114\97\109\101", _wqb)
 _crb.Size = UDim2.new(1, -20, 0, 26)
 _crb.Position = UDim2.new(0, 10, 0, 50)
 _crb.BackgroundTransparency = 1
 local _drb = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _crb)
 _drb.FillDirection = Enum.FillDirection.Horizontal
 _drb.SortOrder = Enum.SortOrder.LayoutOrder
 _drb.Padding = UDim.new(0, 6)
 _drb.VerticalAlignment = Enum.VerticalAlignment.Center
 local _prb = crearBotonTarjeta(_crb, "\78\111\109\98\114\101", 1, "\97\99\99\101\110\116", function(_gb, _hg)
 if _rs(_xe._rr) then animarCopiado(_gb, _hg) end
 end)
 local _qrb = crearBotonTarjeta(_crb, "\85\115\117\97\114\105\111", 2, "\97\99\99\101\110\116\50", function(_gb, _hg)
 if _rs(_xe._i) then animarCopiado(_gb, _hg) end
 end)
 local _rrb = crearBotonTarjeta(_crb, "\65\110\97\108\105\122\97\114", 3, "\103\111\111\100", function()
 analizarEnAnalyzer(_xe._i)
 end)
 _prb.Size = UDim2.new(0, 80, 1, 0)
 _qrb.Size = UDim2.new(0, 80, 1, 0)
 _rrb.Size = UDim2.new(1, -172, 1, 0)
 end
 local function buscarGlobal(_trb)
 _lrb = _lrb + 1
 local _srb = _lrb
 if _mrb then pcall(task.cancel, _mrb); _mrb = nil end
 local _ieb = (_trb or ""):gsub("\94\37\115\43", ""):gsub("\37\115\43\36", "")
 if #_ieb < 3 then
 limpiarGlobales()
 _oqb()
 return
 end
 limpiarGlobales()
 crearHeaderGlobal("\82\111\98\108\111\120\32\8212\32\98\117\115\99\97\110\100\111\8230")
 _oqb()
 _mrb = task.delay(0.45, function()
 _mrb = nil
 if _srb ~= _lrb then return end
 local _urb = {}
 for _rqb, _ in pairs(_xpb) do _urb[_rqb.UserId] = true end
 local _vrb, vistos = {}, {}
 local function add(u, _wrb)
 local _hd = u and u._hd
 if not _hd or _urb[_hd] or vistos[_hd] then return end
 vistos[_hd] = true
 table.insert(_vrb, {
 _hd = _hd,
 _i = u._i or u.requestedUsername or "\63",
 _rr = u._rr or u._i or "\63",
 _wrb = _wrb and true or false,
 })
 end
 local _xrb = apiPost("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\110\97\109\101\115\47\117\115\101\114\115", {
 usernames = { _ieb }, excludeBannedUsers = false,
 })
 if _srb ~= _lrb then return end
 if _xrb and type(_xrb._ye) == "\116\97\98\108\101" then
 for _, u in ipairs(_xrb._ye) do add(u, true) end
 end
 local _gc = "\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\115\101\97\114\99\104\63\107\101\121\119\111\114\100\61"
 .. HttpService:UrlEncode(_ieb) .. "\38\108\105\109\105\116\61\50\53"
 local _ye = apiGet(_gc)
 if _srb ~= _lrb then return end
 if _ye and type(_ye._ye) == "\116\97\98\108\101" then
 for _, u in ipairs(_ye._ye) do
 if #_vrb >= _jrb then break end
 add(u, false)
 end
 end
 table.sort(_vrb, function(a, b)
 if a._wrb ~= b._wrb then return a._wrb end
 return false
 end)
 limpiarGlobales()
 if #_vrb == 0 then
 if not _xrb and not _ye then
 crearHeaderGlobal("\82\111\98\108\111\120\32\8212\32\115\105\110\32\99\111\110\101\120\105\243\110\32\97\32\108\97\32\65\80\73")
 else
 crearHeaderGlobal("\82\111\98\108\111\120\32\8212\32\115\105\110\32\114\101\115\117\108\116\97\100\111\115")
 end
 _zpb = 0
 else
 crearHeaderGlobal("\82\111\98\108\111\120\32\40" .. #_vrb .. "\41")
 local _tr = _irb + 1
 for _, u in ipairs(_vrb) do
 crearTarjetaGlobal(u, _tr)
 _tr = _tr + 1
 end
 _zpb = #_vrb
 end
 _oqb()
 end)
 end
 local function limpiarSugerencias()
 for _, _bj in ipairs(_rpb:GetChildren()) do
 if _bj:IsA("\84\101\120\116\66\117\116\116\111\110") then _bj:Destroy() end
 end
 end
 local function mostrarSugerencias(_ieb)
 limpiarSugerencias()
 if _ieb == "" then _rpb.Visible = false; return end
 local _yrb = _ieb:lower()
 local _zrb = {}
 for _rqb, _qr in pairs(_xpb) do
 local _asb    = string.find(_qr._bp:lower(),    _yrb, 1, true)
 local _bsb = string.find(_qr._rr:lower(), _yrb, 1, true)
 if _asb or _bsb then
 local _csb = math.min(_asb or 999, _bsb or 999)
 table.insert(_zrb, { _rqb = _rqb, _qr = _qr, _csb = _csb })
 end
 end
 if #_zrb == 0 then _rpb.Visible = false; return end
 table.sort(_zrb, function(a, b) return a._csb < b._csb end)
 local _dsb = math.min(#_zrb, 5)
 local _esb = 28
 for i = 1, _dsb do
 local _qr = _zrb[i]._qr
 local _yab = Instance.new("\84\101\120\116\66\117\116\116\111\110", _rpb)
 _yab.Size = UDim2.new(1, 0, 0, _esb)
 _yab.BackgroundTransparency = 1
 _yab.Text = ""
 _yab.AutoButtonColor = false
 _yab.BorderSizePixel = 0
 _yab.LayoutOrder = i
 _yab.ZIndex = 6
 pthemed(_yab, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\110\101\117\116\114\97\108")
 local _hg = Instance.new("\84\101\120\116\76\97\98\101\108", _yab)
 _hg.Size = UDim2.new(1, -16, 1, 0)
 _hg.Position = UDim2.new(0, 10, 0, 0)
 _hg.BackgroundTransparency = 1
 _hg.Font = Enum.Font.Gotham
 _hg.TextSize = 12
 _hg.Text = _qr._rr .. "\32\32\183\32\32\64" .. _qr._bp
 _hg.TextXAlignment = Enum.TextXAlignment.Left
 _hg.TextTruncate = Enum.TextTruncate.AtEnd
 _hg.ZIndex = 7
 pthemed(_hg, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 _yab.MouseEnter:Connect(function()
 TweenService:Create(_yab, TweenInfo.new(0.1), { BackgroundTransparency = 0 }):Play()
 end)
 _yab.MouseLeave:Connect(function()
 TweenService:Create(_yab, TweenInfo.new(0.15), { BackgroundTransparency = 1 }):Play()
 end)
 _yab.MouseButton1Click:Connect(function()
 _opb.Text = _qr._bp
 _rpb.Visible = false
 actualizarLista()
 end)
 end
 _rpb.Size = UDim2.new(1, -16, 0, _dsb * _esb)
 _rpb.Visible = true
 end
 _opb:GetPropertyChangedSignal("\84\101\120\116"):Connect(function()
 actualizarLista()
 mostrarSugerencias(_opb.Text)
 buscarGlobal(_opb.Text)
 end)
 _opb.FocusLost:Connect(function()
 onSearchBlur()
 task.delay(0.15, function()
 if _rpb and _rpb.Parent then
 _rpb.Visible = false
 end
 end)
 end)
 ltrack(Players.PlayerAdded:Connect(function(_rqb) crearTarjeta(_rqb) end))
 ltrack(Players.PlayerRemoving:Connect(function(_rqb) eliminarTarjeta(_rqb) end))
 local _fsb, inicioInput, inicioPos = false, nil, nil
 local _gsb = Instance.new("\85\73\83\99\97\108\101", _cpb)
 _gsb.Name = "\68\114\97\103\83\99\97\108\101"; _gsb.Scale = 1
 local function esInputArrastre(_jj)
 return _jj.UserInputType == Enum.UserInputType.MouseButton1
 or _jj.UserInputType == Enum.UserInputType.Touch
 end
 local function esMovimientoArrastre(_jj)
 return _jj.UserInputType == Enum.UserInputType.MouseMovement
 or _jj.UserInputType == Enum.UserInputType.Touch
 end
 ltrack(_fpb.InputBegan:Connect(function(_jj)
 if esInputArrastre(_jj) then
 _fsb = true
 inicioInput = _jj.Position
 inicioPos = _cpb.Position
 TweenService:Create(_gsb, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.97 }):Play()
 _jj.Changed:Connect(function()
 if _jj.UserInputState == Enum.UserInputState.End then
 _fsb = false
 TweenService:Create(_gsb, TweenInfo.new(0.38, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
 end
 end)
 end
 end))
 ltrack(UserInputService.InputChanged:Connect(function(_jj)
 if _fsb and esMovimientoArrastre(_jj) then
 local _hsb = _jj.Position - inicioInput
 _cpb.Position = UDim2.new(
 inicioPos.X.Scale, inicioPos.X.Offset + _hsb.X,
 inicioPos.Y.Scale, inicioPos.Y.Offset + _hsb.Y
 )
 if not maximizado then _kpb = _cpb.Position end
 end
 end))
 for _, _rqb in ipairs(Players:GetPlayers()) do
 crearTarjeta(_rqb, true)
 end
 actualizarLista()
 local _isb = _cpb:FindFirstChild("\68\114\97\103\83\99\97\108\101")
 if _isb then
 _isb.Scale = 0.92
 _cpb.BackgroundTransparency = 0.4
 TweenService:Create(_isb, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
 TweenService:Create(_cpb, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0 }):Play()
 end
 local _jsb = 8
 local function dockNextToAnalyzer()
 local _ksb = _b:FindFirstChild("\85\116\105\108\105\116\121\80\97\110\101\108")
 local _lsb = _ksb and _ksb:FindFirstChild("\109\97\105\110")
 if not _lsb then return false end
 local _mdb = _lsb.AbsoluteSize
 if _mdb.X <= 0 or _mdb.Y <= 0 then return false end
 local _tn = _lsb.AbsolutePosition
 _cpb.Position = UDim2.fromOffset(_tn.X + _mdb.X + _jsb, _tn.Y)
 _kpb = _cpb.Position
 return true
 end
 task.defer(function()
 if not dockNextToAnalyzer() then
 task.wait(0.1)
 dockNextToAnalyzer()
 end
 end)
 print("\91\76\105\115\116\97\32\100\101\32\74\117\103\97\100\111\114\101\115\32\118\50\46\53\93\32\67\97\114\103\97\100\97\32\183\32\85\73\32\114\101\100\105\115\101\241\97\100\97\32\43\32\97\110\105\109\97\99\105\111\110\101\115\46")
end)()
