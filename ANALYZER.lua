do local _wm="\78\88\95\109\116\113\121\53\112\116\110\95\100\53\119\118";_G["__".._wm]=(function()return true end)()end
local _P199x={}
_P199x._ys5r=math["random"]
_P199x._8x6q=math["floor"]
_P199x._bp3j=math["ceil"]
_P199x._tl3k=math["abs"]
_P199x._5x5j=math["clamp"]
_P199x._6zt5=math["max"]
_P199x._7ofy=math["min"]
_P199x._xlag=math["sqrt"]
_P199x._o0ym=math["huge"]
_P199x._h0an=string["sub"]
_P199x._hdn4=string["len"]
_P199x._lc3i=string["find"]
_P199x._opmi=string["format"]
_P199x._86ky=string["lower"]
_P199x._0y2i=string["upper"]
_P199x._qg5w=string["rep"]
_P199x._oiau=string["byte"]
_P199x._jc6f=string["char"]
_P199x._aq6e=string["gsub"]
_P199x._sizb=string["match"]
_P199x._59n4=string["gmatch"]
_P199x._6ev0=string["reverse"]
_P199x._l50o=table["insert"]
_P199x._otn1=table["remove"]
_P199x._c9pr=table["sort"]
_P199x._oy4i=table["concat"]
_P199x._eg2g=table["create"]
_P199x._hdmh=table["find"]
_P199x._pggn=table["freeze"]
_P199x._jo4n=table["clone"]
_P199x._v9ec=table["move"]
_P199x._xvgl=table["unpack"]
_P199x._yp3z=(tostring)
_P199x._p02a=(tonumber)
_P199x._iy38=(type)
_P199x._4xzj=(rawget)
_P199x._wnek=(rawset)
local Players = game:GetService("\80\108\97\121\101\114\115")
local HttpService = game:GetService("\72\116\116\112\83\101\114\118\105\99\101")
local UserInputService = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
local TweenService = game:GetService("\84\119\101\101\110\83\101\114\118\105\99\101")
local _l = Players._III1
local _I = _l:WaitForChild("\80\108\97\121\101\114\71\117\105")
local _ll = (_P199x._iy38(writefile) == "\102\117\110\99\116\105\111\110")
 and (_P199x._iy38(readfile) == "\102\117\110\99\116\105\111\110")
 and (_P199x._iy38(isfile) == "\102\117\110\99\116\105\111\110")
local _Il = { theme = "\116\111\114", headTags = true, animations = true, ownTag = true, introEnabled = true, introSeen = false, advanced = false }
local function saveStore()
 if not _ll then return end
 pcall(function()
 local _lI = HttpService:JSONEncode(_Il)
 writefile("\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\100\97\116\97\46\106\115\111\110", _lI)
 writefile("\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\100\97\116\97\46\98\97\107\46\106\115\111\110", _lI)
 end)
end
local function loadStore()
 if not _ll then return end
 pcall(function()
 local _II
 if isfile("\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\100\97\116\97\46\106\115\111\110") then _II = readfile("\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\100\97\116\97\46\106\115\111\110") end
 local _l1, _lllIl = pcall(function() return HttpService:JSONDecode(_II) end)
 if (not _l1 or _P199x._iy38(_lllIl) ~= "\116\97\98\108\101") and isfile("\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\100\97\116\97\46\98\97\107\46\106\115\111\110") then
 _l1, _lllIl = pcall(function() return HttpService:JSONDecode(readfile("\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\100\97\116\97\46\98\97\107\46\106\115\111\110")) end)
 end
 if _l1 and _P199x._iy38(_lllIl) == "\116\97\98\108\101" then
 for k, v in pairs(_lllIl) do _Il[k] = v end
 end
 end)
end
loadStore()
local _I1 = {
 negro = {
 bg=Color3.fromRGB(bit32.bxor(177,0xAB),(141-114),bit32.bxor(181,0xAB)), _IlI=Color3.fromRGB((299+-265),(257+-221),(370-331)), _Illl=Color3.fromRGB((432-402),(123-92),(262+-228)),
 surface=Color3.fromRGB(_P199x._8x6q(884/26),_P199x._8x6q(7128/198),bit32.bxor(140,0xAB)), surfaceHover=Color3.fromRGB(bit32.bxor(129,0xAB),bit32.bxor(135,0xAB),(463-415)), elevated=Color3.fromRGB(bit32.bxor(133,0xAB),_P199x._8x6q(3936/82),bit32.bxor(158,0xAB)),
 link=Color3.fromRGB(bit32.bxor(177,0xAB),bit32.bxor(176,0xAB),(258+-228)), neutral=Color3.fromRGB(_P199x._8x6q(8000/200),(182-140),(540-494)), _lIlI1=Color3.fromRGB((204+-146),_P199x._8x6q(7740/129),_P199x._8x6q(12012/182)),
 _I1IIIl=Color3.fromRGB((10+40),(148+-96),_P199x._8x6q(3770/65)), headerBg=Color3.fromRGB((63-33),bit32.bxor(180,0xAB),(324-290)), textDisabled=Color3.fromRGB((58+27),(238+-151),(114-20)),
 _IlIll1=Color3.fromRGB((28+196),_P199x._8x6q(4972/22),(613-383)), onAccent=Color3.fromRGB((53+-27),(204+-177),(97+-67)),
 good=Color3.fromRGB(_P199x._8x6q(16356/188),(260+-50),(187+-44)), warn=Color3.fromRGB(_P199x._8x6q(43680/182),(285-107),(510-460)), bad=Color3.fromRGB((70+167),_P199x._8x6q(1980/30),_P199x._8x6q(13248/192)),
 _lIl=Color3.fromRGB(bit32.bxor(75,0xAB),(99+126),_P199x._8x6q(20292/89)), subtext=Color3.fromRGB((347-208),_P199x._8x6q(21714/154),bit32.bxor(63,0xAB)),
 modalBg=Color3.fromRGB((232+-202),_P199x._8x6q(1550/50),(83+-49)), modalStep=Color3.fromRGB((174+-148),_P199x._8x6q(1215/45),bit32.bxor(181,0xAB)),
 },
 azul = {
 bg=Color3.fromRGB((112+-94),(134+-110),(111-69)), _IlI=Color3.fromRGB((159+-131),_P199x._8x6q(4932/137),(226+-164)), _Illl=Color3.fromRGB((298+-274),(73+-43),_P199x._8x6q(7074/131)),
 surface=Color3.fromRGB((300+-272),_P199x._8x6q(6660/185),(171-109)), surfaceHover=Color3.fromRGB((411-375),(471-427),_P199x._8x6q(1656/23)), elevated=Color3.fromRGB(_P199x._8x6q(1840/46),_P199x._8x6q(4950/99),(271+-189)),
 link=Color3.fromRGB((222+-204),_P199x._8x6q(2640/110),(188+-146)), neutral=Color3.fromRGB((142-104),_P199x._8x6q(7296/152),bit32.bxor(251,0xAB)), _lIlI1=Color3.fromRGB((201+-149),_P199x._8x6q(1664/26),bit32.bxor(207,0xAB)),
 _I1IIIl=Color3.fromRGB((47+-3),_P199x._8x6q(280/5),(251+-161)), headerBg=Color3.fromRGB(_P199x._8x6q(4158/189),_P199x._8x6q(4928/176),_P199x._8x6q(7550/151)), textDisabled=Color3.fromRGB((378-298),bit32.bxor(241,0xAB),(428-308)),
 _IlIll1=Color3.fromRGB((497-409),(213+-112),(499-257)), onAccent=Color3.fromRGB(_P199x._8x6q(24990/98),_P199x._8x6q(43605/171),(13+242)),
 good=Color3.fromRGB((581-494),bit32.bxor(121,0xAB),(635-492)), warn=Color3.fromRGB(bit32.bxor(91,0xAB),_P199x._8x6q(1780/10),(201-151)), bad=Color3.fromRGB((337-100),_P199x._8x6q(3234/49),(273+-204)),
 _lIl=Color3.fromRGB((78+162),bit32.bxor(91,0xAB),_P199x._8x6q(24990/102)), subtext=Color3.fromRGB(_P199x._8x6q(30240/189),(19+146),(264+-79)),
 modalBg=Color3.fromRGB(_P199x._8x6q(242/11),(189+-161),_P199x._8x6q(4150/83)), modalStep=Color3.fromRGB((160+-144),_P199x._8x6q(2596/118),_P199x._8x6q(4560/114)),
 },
 verde = {
 bg=Color3.fromRGB(bit32.bxor(165,0xAB),_P199x._8x6q(4180/190),bit32.bxor(187,0xAB)), _IlI=Color3.fromRGB((148-126),(66-32),bit32.bxor(177,0xAB)), _Illl=Color3.fromRGB(_P199x._8x6q(3520/176),(389-359),bit32.bxor(188,0xAB)),
 surface=Color3.fromRGB(_P199x._8x6q(3212/146),bit32.bxor(137,0xAB),_P199x._8x6q(806/31)), surfaceHover=Color3.fromRGB((512-482),(506-462),_P199x._8x6q(1632/48)), elevated=Color3.fromRGB(bit32.bxor(137,0xAB),bit32.bxor(153,0xAB),(263+-225)),
 link=Color3.fromRGB((207+-193),_P199x._8x6q(1980/90),(96-80)), neutral=Color3.fromRGB(bit32.bxor(181,0xAB),_P199x._8x6q(690/15),(52-18)), _lIlI1=Color3.fromRGB((330-286),bit32.bxor(233,0xAB),(339-289)),
 _I1IIIl=Color3.fromRGB((218-180),bit32.bxor(147,0xAB),(3+39)), headerBg=Color3.fromRGB((30+-12),bit32.bxor(183,0xAB),(63-43)), textDisabled=Color3.fromRGB(bit32.bxor(224,0xAB),(280+-185),(217+-137)),
 _IlIll1=Color3.fromRGB(bit32.bxor(151,0xAB),bit32.bxor(119,0xAB),(572-442)), onAccent=Color3.fromRGB((53+-45),(215+-199),(93+-83)),
 good=Color3.fromRGB(bit32.bxor(252,0xAB),_P199x._8x6q(40320/192),bit32.bxor(36,0xAB)), warn=Color3.fromRGB(bit32.bxor(77,0xAB),(257-67),(413-323)), bad=Color3.fromRGB((295+-65),_P199x._8x6q(17400/174),bit32.bxor(207,0xAB)),
 _lIl=Color3.fromRGB((476-251),(538-303),_P199x._8x6q(26220/115)), subtext=Color3.fromRGB((286+-166),_P199x._8x6q(5460/39),bit32.bxor(43,0xAB)),
 modalBg=Color3.fromRGB(bit32.bxor(185,0xAB),(159-131),_P199x._8x6q(2880/144)), modalStep=Color3.fromRGB(_P199x._8x6q(1400/100),_P199x._8x6q(1760/80),bit32.bxor(187,0xAB)),
 },
 tor = {
 bg=Color3.fromRGB((235+-211),bit32.bxor(185,0xAB),(129+-95)), _IlI=Color3.fromRGB(_P199x._8x6q(1610/46),(107+-81),(198-150)), _Illl=Color3.fromRGB(bit32.bxor(181,0xAB),_P199x._8x6q(2046/93),bit32.bxor(129,0xAB)),
 surface=Color3.fromRGB(_P199x._8x6q(2345/67),bit32.bxor(177,0xAB),bit32.bxor(155,0xAB)), surfaceHover=Color3.fromRGB((371-327),(210+-176),(195-137)), elevated=Color3.fromRGB((217-167),_P199x._8x6q(5890/155),_P199x._8x6q(6138/93)),
 link=Color3.fromRGB((176+-152),(152-134),_P199x._8x6q(3366/99)), neutral=Color3.fromRGB((472-426),(477-443),(211-149)), _lIlI1=Color3.fromRGB((91+-26),(130+-80),(250+-162)),
 _I1IIIl=Color3.fromRGB(_P199x._8x6q(7810/142),bit32.bxor(129,0xAB),bit32.bxor(225,0xAB)), headerBg=Color3.fromRGB((173-145),(390-369),_P199x._8x6q(5880/147)), textDisabled=Color3.fromRGB(_P199x._8x6q(8010/89),_P199x._8x6q(468/6),(118-8)),
 _IlIll1=Color3.fromRGB((278+-118),(210-110),(252+-42)), onAccent=Color3.fromRGB((214+41),(281+-26),bit32.bxor(84,0xAB)),
 good=Color3.fromRGB(_P199x._8x6q(14964/172),(191+19),(577-434)), warn=Color3.fromRGB(bit32.bxor(77,0xAB),_P199x._8x6q(13500/75),(569-479)), bad=Color3.fromRGB(_P199x._8x6q(13050/58),_P199x._8x6q(17765/187),(428-333)),
 _lIl=Color3.fromRGB(_P199x._8x6q(24205/103),(13+217),(636-394)), subtext=Color3.fromRGB(_P199x._8x6q(20400/136),(615-480),bit32.bxor(3,0xAB)),
 modalBg=Color3.fromRGB(_P199x._8x6q(5600/200),(235+-214),bit32.bxor(131,0xAB)), modalStep=Color3.fromRGB(_P199x._8x6q(1144/52),(108+-92),(416-384)),
 },
 rojo = {
 bg=Color3.fromRGB(_P199x._8x6q(4224/176),(143+-129),(106+-90)), _IlI=Color3.fromRGB((267-229),_P199x._8x6q(2486/113),(216+-191)), _Illl=Color3.fromRGB(_P199x._8x6q(3744/117),(249-231),bit32.bxor(190,0xAB)),
 surface=Color3.fromRGB((346-308),_P199x._8x6q(946/43),(80-55)), surfaceHover=Color3.fromRGB(_P199x._8x6q(7584/158),bit32.bxor(181,0xAB),bit32.bxor(137,0xAB)), elevated=Color3.fromRGB((297-243),_P199x._8x6q(3570/105),(115+-77)),
 link=Color3.fromRGB((243+-219),(168-154),_P199x._8x6q(1680/105)), neutral=Color3.fromRGB(bit32.bxor(153,0xAB),(10+18),(516-484)), _lIlI1=Color3.fromRGB((166+-90),_P199x._8x6q(1638/39),_P199x._8x6q(5184/108)),
 _I1IIIl=Color3.fromRGB(bit32.bxor(149,0xAB),(75+-39),(205+-165)), headerBg=Color3.fromRGB(_P199x._8x6q(1624/58),(47+-31),(312-293)), textDisabled=Color3.fromRGB(_P199x._8x6q(3200/32),(134-62),(254+-176)),
 _IlIll1=Color3.fromRGB((237+0),bit32.bxor(233,0xAB),(192-123)), onAccent=Color3.fromRGB((319-64),(437-182),bit32.bxor(84,0xAB)),
 good=Color3.fromRGB(bit32.bxor(252,0xAB),_P199x._8x6q(7140/34),(630-487)), warn=Color3.fromRGB((20+210),(224+-44),bit32.bxor(241,0xAB)), bad=Color3.fromRGB((563-308),(82+8),bit32.bxor(241,0xAB)),
 _lIl=Color3.fromRGB((222+18),(189+39),(271-41)), subtext=Color3.fromRGB((263-98),(280-145),(238-98)),
 modalBg=Color3.fromRGB((181+-153),(492-476),bit32.bxor(184,0xAB)), modalStep=Color3.fromRGB((514-492),(163+-151),(96+-82)),
 },
 morado = {
 bg=Color3.fromRGB((227-207),(150-134),bit32.bxor(139,0xAB)), _IlI=Color3.fromRGB((106-76),_P199x._8x6q(4512/188),(487-439)), _Illl=Color3.fromRGB(_P199x._8x6q(3744/144),bit32.bxor(191,0xAB),_P199x._8x6q(1806/43)),
 surface=Color3.fromRGB(bit32.bxor(181,0xAB),_P199x._8x6q(4152/173),_P199x._8x6q(6048/126)), surfaceHover=Color3.fromRGB(_P199x._8x6q(8000/200),(47+-15),_P199x._8x6q(9720/162)), elevated=Color3.fromRGB((267+-221),(145+-107),_P199x._8x6q(4420/65)),
 link=Color3.fromRGB((119-99),(480-464),_P199x._8x6q(2656/83)), neutral=Color3.fromRGB(_P199x._8x6q(7602/181),_P199x._8x6q(960/30),(136+-70)), _lIlI1=Color3.fromRGB((64-2),bit32.bxor(155,0xAB),_P199x._8x6q(7546/77)),
 _I1IIIl=Color3.fromRGB((156-104),(176+-136),bit32.bxor(251,0xAB)), headerBg=Color3.fromRGB((162+-138),bit32.bxor(185,0xAB),(72+-34)), textDisabled=Color3.fromRGB(_P199x._8x6q(1496/17),bit32.bxor(231,0xAB),(108+7)),
 _IlIll1=Color3.fromRGB(bit32.bxor(1,0xAB),bit32.bxor(197,0xAB),bit32.bxor(84,0xAB)), onAccent=Color3.fromRGB(bit32.bxor(84,0xAB),(40+215),_P199x._8x6q(39780/156)),
 good=Color3.fromRGB((359-272),bit32.bxor(121,0xAB),_P199x._8x6q(15730/110)), warn=Color3.fromRGB(_P199x._8x6q(24150/105),(667-487),(424-334)), bad=Color3.fromRGB((35+200),_P199x._8x6q(13015/137),_P199x._8x6q(10355/109)),
 _lIl=Color3.fromRGB(bit32.bxor(67,0xAB),_P199x._8x6q(28702/127),_P199x._8x6q(4900/20)), subtext=Color3.fromRGB(bit32.bxor(61,0xAB),(636-498),_P199x._8x6q(27825/159)),
 modalBg=Color3.fromRGB((74+-50),(138-120),(316-278)), modalStep=Color3.fromRGB((117+-99),(399-385),(458-430)),
 },
 cyan = {
 bg=Color3.fromRGB((206+-194),bit32.bxor(189,0xAB),(98-74)), _IlI=Color3.fromRGB((278-260),bit32.bxor(137,0xAB),_P199x._8x6q(6993/189)), _Illl=Color3.fromRGB((43+-27),(106+-76),_P199x._8x6q(6402/194)),
 surface=Color3.fromRGB(bit32.bxor(185,0xAB),(369-335),(214+-177)), surfaceHover=Color3.fromRGB(_P199x._8x6q(1456/56),(426-382),(20+28)), elevated=Color3.fromRGB((178+-148),bit32.bxor(153,0xAB),_P199x._8x6q(270/5)),
 link=Color3.fromRGB(bit32.bxor(167,0xAB),(245+-223),(1+23)), neutral=Color3.fromRGB((288+-262),bit32.bxor(133,0xAB),(15+35)), _lIlI1=Color3.fromRGB((371-333),(207-139),(111-37)),
 _I1IIIl=Color3.fromRGB(_P199x._8x6q(2368/74),(155+-99),(74+-12)), headerBg=Color3.fromRGB(_P199x._8x6q(1932/138),_P199x._8x6q(5070/195),(272+-244)), textDisabled=Color3.fromRGB(bit32.bxor(239,0xAB),(551-455),bit32.bxor(207,0xAB)),
 _IlIll1=Color3.fromRGB(_P199x._8x6q(0/108),bit32.bxor(119,0xAB),_P199x._8x6q(35280/168)), onAccent=Color3.fromRGB(bit32.bxor(173,0xAB),(165-147),_P199x._8x6q(126/7)),
 good=Color3.fromRGB((454-367),bit32.bxor(121,0xAB),_P199x._8x6q(1716/12)), warn=Color3.fromRGB((639-409),(114+66),_P199x._8x6q(8100/90)), bad=Color3.fromRGB((537-302),_P199x._8x6q(8835/93),_P199x._8x6q(4655/49)),
 _lIl=Color3.fromRGB(_P199x._8x6q(36960/165),(98+140),_P199x._8x6q(39746/167)), subtext=Color3.fromRGB((86+34),(581-431),_P199x._8x6q(27300/182)),
 modalBg=Color3.fromRGB((3+11),bit32.bxor(177,0xAB),_P199x._8x6q(3276/117)), modalStep=Color3.fromRGB((147-137),(193+-173),(379-357)),
 },
 rosa = {
 bg=Color3.fromRGB(_P199x._8x6q(676/26),_P199x._8x6q(1936/121),(99+-77)), _IlI=Color3.fromRGB((509-469),(216+-192),bit32.bxor(137,0xAB)), _Illl=Color3.fromRGB((198-164),bit32.bxor(191,0xAB),_P199x._8x6q(2296/82)),
 surface=Color3.fromRGB(bit32.bxor(131,0xAB),bit32.bxor(179,0xAB),bit32.bxor(137,0xAB)), surfaceHover=Color3.fromRGB(bit32.bxor(159,0xAB),(397-365),(168+-124)), elevated=Color3.fromRGB(_P199x._8x6q(4292/74),(521-485),(170+-120)),
 link=Color3.fromRGB((169+-143),bit32.bxor(187,0xAB),bit32.bxor(189,0xAB)), neutral=Color3.fromRGB((90+-38),(96+-66),(386-342)), _lIlI1=Color3.fromRGB(bit32.bxor(229,0xAB),_P199x._8x6q(8326/181),bit32.bxor(233,0xAB)),
 _I1IIIl=Color3.fromRGB((214+-150),bit32.bxor(141,0xAB),(314-260)), headerBg=Color3.fromRGB(_P199x._8x6q(3210/107),_P199x._8x6q(1854/103),(69+-43)), textDisabled=Color3.fromRGB(bit32.bxor(194,0xAB),bit32.bxor(229,0xAB),_P199x._8x6q(4968/54)),
 _IlIll1=Color3.fromRGB(bit32.bxor(84,0xAB),_P199x._8x6q(2970/27),bit32.bxor(21,0xAB)), onAccent=Color3.fromRGB(bit32.bxor(183,0xAB),(116-106),_P199x._8x6q(3900/195)),
 good=Color3.fromRGB((90-3),(629-419),(206+-63)), warn=Color3.fromRGB((694-464),(231+-51),(272+-182)), bad=Color3.fromRGB(bit32.bxor(64,0xAB),(355-260),bit32.bxor(244,0xAB)),
 _lIl=Color3.fromRGB((573-328),_P199x._8x6q(6612/29),(32+206)), subtext=Color3.fromRGB((292+-122),_P199x._8x6q(6345/47),bit32.bxor(48,0xAB)),
 modalBg=Color3.fromRGB(bit32.bxor(181,0xAB),_P199x._8x6q(3060/170),_P199x._8x6q(1092/42)), modalStep=Color3.fromRGB((19+5),_P199x._8x6q(994/71),(158+-138)),
 },
 naranja = {
 bg=Color3.fromRGB((475-449),_P199x._8x6q(1368/76),_P199x._8x6q(30/3)), _IlI=Color3.fromRGB((325-285),(359-331),(8+8)), _Illl=Color3.fromRGB(bit32.bxor(137,0xAB),(54+-30),(367-353)),
 surface=Color3.fromRGB((44-4),bit32.bxor(183,0xAB),(152+-136)), surfaceHover=Color3.fromRGB((157+-105),(460-424),(182-160)), elevated=Color3.fromRGB((490-432),(213-171),bit32.bxor(177,0xAB)),
 link=Color3.fromRGB(bit32.bxor(177,0xAB),bit32.bxor(185,0xAB),bit32.bxor(161,0xAB)), neutral=Color3.fromRGB(bit32.bxor(159,0xAB),(358-322),_P199x._8x6q(1760/88)), _lIlI1=Color3.fromRGB(bit32.bxor(229,0xAB),_P199x._8x6q(224/4),_P199x._8x6q(3136/98)),
 _I1IIIl=Color3.fromRGB((184+-120),(90-44),(24+2)), headerBg=Color3.fromRGB(_P199x._8x6q(2460/82),bit32.bxor(189,0xAB),(293+-281)), textDisabled=Color3.fromRGB(bit32.bxor(194,0xAB),(174-86),_P199x._8x6q(13328/196)),
 _IlIll1=Color3.fromRGB(bit32.bxor(84,0xAB),(181+-31),_P199x._8x6q(8100/162)), onAccent=Color3.fromRGB((343-315),_P199x._8x6q(1856/116),_P199x._8x6q(48/8)),
 good=Color3.fromRGB(_P199x._8x6q(957/11),bit32.bxor(121,0xAB),(51+92)), warn=Color3.fromRGB((310-80),(274+-94),bit32.bxor(241,0xAB)), bad=Color3.fromRGB((472-237),(275+-180),bit32.bxor(244,0xAB)),
 _lIl=Color3.fromRGB((699-455),bit32.bxor(65,0xAB),_P199x._8x6q(22866/103)), subtext=Color3.fromRGB(_P199x._8x6q(4200/25),bit32.bxor(63,0xAB),bit32.bxor(215,0xAB)),
 modalBg=Color3.fromRGB(_P199x._8x6q(3150/105),(477-455),(169-157)), modalStep=Color3.fromRGB(bit32.bxor(179,0xAB),bit32.bxor(187,0xAB),bit32.bxor(163,0xAB)),
 },
 claro = {
 bg=Color3.fromRGB(bit32.bxor(69,0xAB),(292+-52),bit32.bxor(95,0xAB)), _IlI=Color3.fromRGB(_P199x._8x6q(24225/95),(4+251),(335-80)), _Illl=Color3.fromRGB((299-51),(110+139),_P199x._8x6q(40913/163)),
 surface=Color3.fromRGB(bit32.bxor(84,0xAB),bit32.bxor(84,0xAB),(70+185)), surfaceHover=Color3.fromRGB((135+107),(155+88),_P199x._8x6q(41002/166)), elevated=Color3.fromRGB(bit32.bxor(84,0xAB),(267+-12),_P199x._8x6q(23460/92)),
 link=Color3.fromRGB(_P199x._8x6q(31178/131),(221+19),(19+225)), neutral=Color3.fromRGB(bit32.bxor(79,0xAB),bit32.bxor(76,0xAB),(401-164)), _lIlI1=Color3.fromRGB(_P199x._8x6q(27880/136),(24+186),(170+50)),
 _I1IIIl=Color3.fromRGB((24+194),(287+-65),(630-400)), headerBg=Color3.fromRGB((368-120),(282+-33),_P199x._8x6q(6777/27)), textDisabled=Color3.fromRGB(bit32.bxor(1,0xAB),(74+101),(101+84)),
 _IlIll1=Color3.fromRGB((577-489),_P199x._8x6q(17271/171),bit32.bxor(89,0xAB)), onAccent=Color3.fromRGB((680-425),_P199x._8x6q(5865/23),_P199x._8x6q(39270/154)),
 good=Color3.fromRGB((227+-187),(105+55),(249+-159)), warn=Color3.fromRGB((243-38),bit32.bxor(44,0xAB),_P199x._8x6q(3840/128)), bad=Color3.fromRGB(bit32.bxor(119,0xAB),(264-194),(299+-229)),
 _lIl=Color3.fromRGB(bit32.bxor(189,0xAB),_P199x._8x6q(4082/157),_P199x._8x6q(1734/51)), subtext=Color3.fromRGB((548-453),(467-362),(187+-67)),
 modalBg=Color3.fromRGB(_P199x._8x6q(10200/40),bit32.bxor(84,0xAB),bit32.bxor(84,0xAB)), modalStep=Color3.fromRGB(_P199x._8x6q(43554/183),(57+183),_P199x._8x6q(1464/6)),
 },
}
local C = {}
local function applyTheme(_lll)
 local t = _I1[_lll] or _I1.negro
 for k, v in pairs(t) do C[k] = v end
end
if _Il.theme == "\107\97\108\105" then _Il.theme = "\116\111\114" end
applyTheme(_Il.theme)
local _IIl = {}
local function themed(_lII, _III, _l1I)
 local _lIl = { _lII = _lII, _III = _III, _l1I = _l1I }
 _P199x._l50o(_IIl, _lIl)
 pcall(function()
 _lII.Destroying:Connect(function() _lIl._lII = nil end)
 end)
 pcall(function() _lII[_III] = C[_l1I] end)
 return _lII
end
local _lI = {}
local function onRepaint(_I1I) _P199x._l50o(_lI, _I1I) end
local function repaint()
 local n = (107-107)
 for i = _P199x._8x6q(180/180), #_IIl do
 local e = _IIl[i]
 if e._lII then
 n = n + (64+-63)
 _IIl[n] = e
 pcall(function() e._lII[e._III] = C[e._l1I] end)
 end
 end
 for i = #_IIl, n + (446-445), -(209+-208) do _IIl[i] = nil end
 for _, _I1I in ipairs(_lI) do pcall(_I1I) end
end
local _II
local function setTheme(_lll)
 applyTheme(_lll)
 _Il.theme = _lll
 saveStore()
 repaint()
 if _II then pcall(_II) end
end
_G.NXTheme = {
 C = C,
 onRepaint = onRepaint,
 themed = themed,
 getTheme = function() return _Il.theme end,
}
do
 local _llI = {}
 _llI.corner = { sm = UDim.new((145+-145), bit32.bxor(173,0xAB)), md = UDim.new(_P199x._8x6q(0/127), _P199x._8x6q(744/93)), _l1lIl1 = UDim.new((112+-112), bit32.bxor(167,0xAB)), _lllIl1 = UDim.new((35+-34), (12+-12)) }
 _llI._lIl   = { xs = _P199x._8x6q(100/10), sm = (336-325), md = (62-49), _l1lIl1 = bit32.bxor(164,0xAB), xl = (296+-278), _I1llll = bit32.bxor(187,0xAB) }
 _llI.space  = { xs = (255+-251), sm = (430-424), md = (486-478), _l1lIl1 = (380-368), xl = (100+-84) }
 _llI._lIll    = { _IlI = (161+-149), section = (172+-158) }
 function _llI.makeCard(_lllI, _IIlI)
 _IIlI = _IIlI or {}
 local _IlI = Instance.new("\70\114\97\109\101", _lllI)
 if _IIlI._IIIl then _IlI.LayoutOrder = _IIlI._IIIl end
 _IlI.Size = UDim2.new(_P199x._8x6q(170/170), bit32.bxor(171,0xAB), (20+-20), (64+-64))
 _IlI.AutomaticSize = Enum.AutomaticSize.Y
 _IlI.BackgroundColor3 = C.surface
 _IlI.BorderSizePixel = _P199x._8x6q(0/169)
 _IlI.ClipsDescendants = true
 Instance.new("\85\73\67\111\114\110\101\114", _IlI).CornerRadius = _llI.corner.md
 themed(_IlI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 local _lIlI = Instance.new("\85\73\83\116\114\111\107\101", _IlI)
 _lIlI.Color = C._lIlI1; _lIlI.Transparency = 0.6; _lIlI.Thickness = _P199x._8x6q(88/88)
 themed(_lIlI, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local p = Instance.new("\85\73\80\97\100\100\105\110\103", _IlI)
 p.PaddingTop = UDim.new((128-128), _llI._lIll._IlI); p.PaddingBottom = UDim.new((44-44), _llI._lIll._IlI)
 p.PaddingLeft = UDim.new((70+-70), _llI._lIll._IlI); p.PaddingRight = UDim.new(bit32.bxor(171,0xAB), _llI._lIll._IlI)
 local _lll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _IlI)
 _lll.Padding = UDim.new((215+-215), _llI.space.md); _lll.SortOrder = Enum.SortOrder.LayoutOrder
 local _Ill = _IlI
 if _IIlI._I1llll then
 local h = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 h.LayoutOrder = bit32.bxor(171,0xAB); h.Size = UDim2.new((360-359), (412-412), (32+-32), _P199x._8x6q(3040/152)); h.BackgroundTransparency = (180+-179)
 h.Font = Enum.Font.GothamBold; h.TextSize = _llI._lIl.md; h.TextColor3 = C._lIl
 h.Text = _IIlI._I1llll; h.TextXAlignment = Enum.TextXAlignment.Left
 themed(h, "\84\101\120\116\67\111\108\111\114\51", _IIlI._IlIll1 and "\97\99\99\101\110\116" or "\116\101\120\116")
 end
 if _IIlI.subtitle then
 local s = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 s.LayoutOrder = _P199x._8x6q(128/128); s.Size = UDim2.new((8+-7), (444-444), bit32.bxor(171,0xAB), (9+-9)); s.AutomaticSize = Enum.AutomaticSize.Y
 s.BackgroundTransparency = bit32.bxor(170,0xAB); s.Font = Enum.Font.Gotham; s.TextSize = _llI._lIl.sm
 s.TextColor3 = C.subtext; s.Text = _IIlI.subtitle; s.TextWrapped = true
 s.TextXAlignment = Enum.TextXAlignment.Left
 themed(s, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 return _IlI, _Ill
 end
 function _llI.makeDataRow(_lllI, _Illl, _lIll, _IIlI)
 _IIlI = _IIlI or {}
 local _llll = Instance.new("\70\114\97\109\101", _lllI)
 if _IIlI._IIIl then _llll.LayoutOrder = _IIlI._IIIl end
 _llll.Size = UDim2.new((450-449), (331-331), bit32.bxor(171,0xAB), (278+-252))
 _llll.BackgroundTransparency = bit32.bxor(170,0xAB)
 _llll.ClipsDescendants = true
 local _IIll = Instance.new("\84\101\120\116\76\97\98\101\108", _llll)
 _IIll.Size = UDim2.new((75-75), bit32.bxor(171,0xAB), (264-263), (237-237)); _IIll.AutomaticSize = Enum.AutomaticSize.X
 _IIll.BackgroundTransparency = _P199x._8x6q(197/197)
 _IIll.Font = Enum.Font.Gotham; _IIll.TextSize = _llI._lIl.sm; _IIll.TextColor3 = C.subtext
 _IIll.Text = _Illl; _IIll.TextXAlignment = Enum.TextXAlignment.Left
 themed(_IIll, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _l1ll = _IIlI.important and Enum.Font.GothamBold or Enum.Font.GothamMedium
 local _I1ll = _IIlI.important and _llI._lIl._l1lIl1 or _llI._lIl.md
 local _lllll = Instance.new("\84\101\120\116\76\97\98\101\108", _llll)
 _lllll.Size = UDim2.new((499-498), (127+-127), (22-21), bit32.bxor(171,0xAB))
 _lllll.BackgroundTransparency = (423-422)
 _lllll.Font = _l1ll; _lllll.TextSize = _I1ll
 _lllll.TextColor3 = _IIlI._l1IlIl or C._lIl
 if not _IIlI._l1IlIl then themed(_lllll, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116") end
 _lllll.Text = _P199x._yp3z(_lIll == nil and "\8212" or _lIll)
 _lllll.TextXAlignment = Enum.TextXAlignment.Right
 _lllll.TextTruncate = Enum.TextTruncate.AtEnd
 if _IIlI._IIIlIl and _lIll then
 local _IIlll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _llll)
 _IIlll.Size = UDim2.fromOffset((121+-99), (465-443)); _IIlll.AnchorPoint = Vector2.new((300+-299), 0.5)
 _IIlll.Position = UDim2.new(bit32.bxor(170,0xAB), bit32.bxor(171,0xAB), 0.5, (21+-21))
 _IIlll.BackgroundTransparency = (186-185); _IIlll.Text = "\55357\56523"
 _IIlll.Font = Enum.Font.Gotham; _IIlll.TextSize = (437-425)
 _IIlll.AutoButtonColor = false; _IIlll.ZIndex = (499-496)
 _IIlll.TextTransparency = 0.6
 _IIlll.MouseEnter:Connect(function() _IIlll.TextTransparency = (136+-136) end)
 _IIlll.MouseLeave:Connect(function() _IIlll.TextTransparency = 0.6 end)
 _IIlll.MouseButton1Click:Connect(function()
 if _llII then _llII(_P199x._yp3z(_lIll)) end
 if _l1lIll then _l1lIll.Text = "\67\111\112\105\97\100\111\58\32" .. _Illl end
 _IIlll.Text = "\10003"
 task.delay((74-73), function() if _IIlll and _IIlll.Parent then _IIlll.Text = "\55357\56523" end end)
 end)
 _lllll.Size = UDim2.new(_P199x._8x6q(129/129), -(297+-269), (183+-182), (269-269))
 end
 return _llll
 end
 function _llI.makeButton(_lllI, _lIl, _IIl, _IIlI)
 _IIlI = _IIlI or {}
 local _lIlll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _lllI)
 if _IIlI._IIIl then _lIlll.LayoutOrder = _IIlI._IIIl end
 _lIlll.Size = _IIlI._I1Ill1 or UDim2.new((139+-139), _P199x._8x6q(0/135), (200-200), _P199x._8x6q(3360/112))
 if not _IIlI._I1Ill1 then _lIlll.AutomaticSize = Enum.AutomaticSize.X end
 _lIlll.BackgroundColor3 = (_IIl == "\112\114\105\109\97\114\121" and C._IlIll1) or (_IIl == "\115\101\99\111\110\100\97\114\121" and C.surface) or Color3.new((131+-131),(98-98),(468-468))
 _lIlll.BackgroundTransparency = (_IIl == "\103\104\111\115\116") and _P199x._8x6q(58/58) or bit32.bxor(171,0xAB)
 _lIlll.Text = _lIl; _lIlll.Font = Enum.Font.GothamBold; _lIlll.TextSize = _llI._lIl.md
 _lIlll.TextColor3 = (_IIl == "\112\114\105\109\97\114\121" and C.onAccent) or C._lIl
 _lIlll.BorderSizePixel = (19+-19); _lIlll.AutoButtonColor = false
 Instance.new("\85\73\67\111\114\110\101\114", _lIlll).CornerRadius = _llI.corner.sm
 local _llIl = Instance.new("\85\73\80\97\100\100\105\110\103", _lIlll)
 _llIl.PaddingLeft = UDim.new(_P199x._8x6q(0/5), (198+-182)); _llIl.PaddingRight = UDim.new((379-379), bit32.bxor(187,0xAB))
 if _IIl == "\112\114\105\109\97\114\121" then
 themed(_lIlll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116"); themed(_lIlll, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 elseif _IIl == "\115\101\99\111\110\100\97\114\121" then
 themed(_lIlll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101"); themed(_lIlll, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _IlIl = Instance.new("\85\73\83\116\114\111\107\101", _lIlll)
 _IlIl.Thickness = bit32.bxor(170,0xAB); _IlIl.Color = C._lIlI1; _IlIl.Transparency = 0.5
 themed(_IlIl, "\67\111\108\111\114", "\98\111\114\100\101\114")
 else
 themed(_lIlll, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 local _lIIl = Instance.new("\85\73\83\99\97\108\101", _lIlll)
 _lIlll.MouseEnter:Connect(function()
 if _IIl ~= "\103\104\111\115\116" then
 _lIlll.BackgroundTransparency = (_IIl == "\103\104\111\115\116") and 0.85 or (375-375)
 end
 end)
 _lIlll.MouseButton1Down:Connect(function()
 motionTween(_lIIl, TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.97 })
 end)
 _lIlll.MouseButton1Up:Connect(function()
 motionTween(_lIIl, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = bit32.bxor(170,0xAB) })
 end)
 _lIlll.MouseLeave:Connect(function()
 _lIIl.Scale = (89-88)
 if _IIl == "\103\104\111\115\116" then _lIlll.BackgroundTransparency = bit32.bxor(170,0xAB) end
 end)
 if _IIlI._lllIIlI1 then _lIlll.MouseButton1Click:Connect(_IIlI._lllIIlI1) end
 return _lIlll
 end
 function _llI.makeSectionHeader(_lllI, _lIl, _IIIl)
 local h = Instance.new("\84\101\120\116\76\97\98\101\108", _lllI)
 h.LayoutOrder = _IIIl or (173+-173)
 h.Size = UDim2.new((494-493), (50+-50), (125+-125), bit32.bxor(189,0xAB)); h.BackgroundTransparency = (55+-54)
 h.Font = Enum.Font.GothamBold; h.TextSize = _llI._lIl.sm; h.TextColor3 = C.subtext
 h.Text = _P199x._0y2i(_lIl); h.TextXAlignment = Enum.TextXAlignment.Left
 themed(h, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 return h
 end
 function _llI.makeToggleRow(_lllI, _Illl, _I1Il, _lllIl, _IIIl, _IIlIl)
 local _IlI, _ = _llI.makeCard(_lllI, { _IIIl = _IIIl })
 local _l1Il = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 _l1Il.LayoutOrder = (220+-220); _l1Il.Size = UDim2.new(_P199x._8x6q(19/19), (404-404), bit32.bxor(171,0xAB), bit32.bxor(191,0xAB))
 _l1Il.BackgroundTransparency = _P199x._8x6q(158/158); _l1Il.Font = Enum.Font.GothamBold
 _l1Il.TextSize = _llI._lIl.md; _l1Il.TextColor3 = C._lIl
 _l1Il.Text = _Illl; _l1Il.TextXAlignment = Enum.TextXAlignment.Left
 themed(_l1Il, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 if _I1Il then
 local d = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 d.LayoutOrder = (30+-29); d.Size = UDim2.new((393-392), (12+-12), (415-415), (142+-142))
 d.AutomaticSize = Enum.AutomaticSize.Y; d.BackgroundTransparency = bit32.bxor(170,0xAB)
 d.Font = Enum.Font.Gotham; d.TextSize = _llI._lIl.xs; d.TextColor3 = C.subtext
 d.Text = _I1Il; d.TextWrapped = true; d.TextXAlignment = Enum.TextXAlignment.Left
 themed(d, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 local _llll = Instance.new("\70\114\97\109\101", _IlI)
 _llll.LayoutOrder = bit32.bxor(169,0xAB); _llll.Size = UDim2.new(bit32.bxor(170,0xAB), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB), _P199x._8x6q(1296/54)); _llll.BackgroundTransparency = (262-261)
 local _lIlIl = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _llll)
 _lIlIl.FillDirection = Enum.FillDirection.Horizontal
 _lIlIl.VerticalAlignment = Enum.VerticalAlignment.Center
 _lIlIl.Padding = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(1470/147))
 local _llI = Instance.new("\84\101\120\116\76\97\98\101\108", _llll)
 _llI.LayoutOrder = (214+-212); _llI.Size = UDim2.new((32+-32), bit32.bxor(39,0xAB), (419-419), (84-64))
 _llI.BackgroundTransparency = (144+-143); _llI.Font = Enum.Font.GothamBold
 _llI.TextSize = _llI._lIl.sm; _llI.TextXAlignment = Enum.TextXAlignment.Left
 local function paint()
 _llI.Text = _lllIl and "\65\99\116\105\118\97\100\111" or "\68\101\115\97\99\116\105\118\97\100\111"
 _llI.TextColor3 = _lllIl and C.good or C.subtext
 end
 local _IlI, setOn, setBusy = _llI._makeSwitch(_llll, _lllIl, function(_lllI)
 _lllIl = _lllI
 paint()
 if _IIlIl then _IIlIl(_lllI) end
 end)
 _IlI.LayoutOrder = bit32.bxor(170,0xAB)
 paint()
 onRepaint(paint)
 return _IlI, _IlI, setOn, setBusy, _llI
 end
 function _llI.makeScoreBar(_lllI, _Illl, _IllI, _lIlI, _IIlI, _IIIl)
 local _llll = Instance.new("\70\114\97\109\101", _lllI)
 _llll.LayoutOrder = _IIIl or _P199x._8x6q(0/47)
 _llll.Size = UDim2.new(bit32.bxor(170,0xAB), bit32.bxor(171,0xAB), (299+-299), _P199x._8x6q(3444/123))
 _llll.BackgroundTransparency = bit32.bxor(170,0xAB)
 local _l1lI = Instance.new("\84\101\120\116\76\97\98\101\108", _llll)
 _l1lI.Size = UDim2.new((233+-233), (86+4), _P199x._8x6q(66/66), _P199x._8x6q(0/114))
 _l1lI.BackgroundTransparency = (337-336); _l1lI.Font = Enum.Font.Gotham
 _l1lI.TextSize = _llI._lIl.sm; _l1lI.TextColor3 = C.subtext
 _l1lI.Text = _Illl; _l1lI.TextXAlignment = Enum.TextXAlignment.Left
 themed(_l1lI, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _I1lI = Instance.new("\70\114\97\109\101", _llll)
 _I1lI.Position = UDim2.new(bit32.bxor(171,0xAB), (30+66), 0.5, -bit32.bxor(168,0xAB))
 _I1lI.Size = UDim2.new(bit32.bxor(170,0xAB), -bit32.bxor(119,0xAB), (153+-153), bit32.bxor(173,0xAB))
 _I1lI.BackgroundColor3 = C._lIlI1; _I1lI.BorderSizePixel = _P199x._8x6q(0/150)
 Instance.new("\85\73\67\111\114\110\101\114", _I1lI).CornerRadius = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(471/157))
 themed(_I1lI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\111\114\100\101\114")
 local _llllI = Instance.new("\70\114\97\109\101", _I1lI)
 local _IIllI = _P199x._5x5j(_IllI / _P199x._8x6q(5800/58), _P199x._8x6q(0/118), bit32.bxor(170,0xAB))
 _llllI.Size = UDim2.new(_P199x._8x6q(0/140), bit32.bxor(171,0xAB), bit32.bxor(170,0xAB), (286+-286))
 _llllI.BackgroundColor3 = _IIlI; _llllI.BorderSizePixel = (204+-204)
 _llllI.ClipsDescendants = true
 Instance.new("\85\73\67\111\114\110\101\114", _llllI).CornerRadius = UDim.new(bit32.bxor(171,0xAB), (8+-5))
 local _lIllI = math._lllIIl(_IIllI, _IllI > (203+-203) and 0.04 or (10-10))
 motionTween(_llllI, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
 { Size = UDim2.new(_lIllI, (212-212), _P199x._8x6q(89/89), _P199x._8x6q(0/68)) })
 local _lllll = Instance.new("\84\101\120\116\76\97\98\101\108", _llll)
 _lllll.Position = UDim2.new(bit32.bxor(170,0xAB), -(196-78), (483-483), (162-162))
 _lllll.Size = UDim2.new(_P199x._8x6q(0/79), bit32.bxor(221,0xAB), _P199x._8x6q(23/23), (294-294))
 _lllll.BackgroundTransparency = (253-252); _lllll.Font = Enum.Font.GothamBold
 _lllll.TextSize = _llI._lIl.sm; _lllll.TextColor3 = _IIlI
 _lllll.Text = _P199x._opmi("\37\100\37\37\32\183\32\37\115", _IllI, _lIlI)
 _lllll.TextXAlignment = Enum.TextXAlignment.Right
 return _llll, _llllI, _lllll
 end
 _G.NXDS = _llI
end
local function detectExecutor()
 if identifyexecutor then
 local _l1, _lll = pcall(identifyexecutor)
 if _l1 and _P199x._iy38(_lll) == "\115\116\114\105\110\103" and _lll ~= "" then return _lll end
 end
 if getexecutorname then
 local _l1, _lll = pcall(getexecutorname)
 if _l1 and _P199x._iy38(_lll) == "\115\116\114\105\110\103" and _lll ~= "" then return _lll end
 end
 if _P199x._4xzj(_G, "\120\101\110\111") then return "\88\101\110\111" end
 if _P199x._4xzj(_G, "\83\121\110\97\112\115\101") or _P199x._4xzj(_G, "\115\121\110") then return "\83\121\110\97\112\115\101\32\88" end
 if _P199x._4xzj(_G, "\75\82\78\76\95\76\79\65\68\69\68") or _P199x._4xzj(_G, "\107\114\110\108") then return "\75\82\78\76" end
 if _P199x._4xzj(_G, "\102\108\117\120\117\115") then return "\70\108\117\120\117\115" end
 if _P199x._4xzj(_G, "\104\121\100\114\111\103\101\110") then return "\72\121\100\114\111\103\101\110" end
 if _P199x._4xzj(_G, "\119\97\118\101") then return "\87\97\118\101" end
 if _P199x._4xzj(_G, "\118\101\108\111\99\105\116\121") then return "\86\101\108\111\99\105\116\121" end
 if _P199x._4xzj(_G, "\83\111\108\97\114\97") then return "\83\111\108\97\114\97" end
 if _P199x._4xzj(_G, "\80\82\79\84\79\83\77\65\83\72\69\82\95\76\79\65\68\69\68") then return "\80\114\111\116\111\83\109\97\115\104\101\114" end
 if _P199x._4xzj(_G, "\83\105\114\104\117\114\116") then return "\83\105\114\72\117\114\116" end
 if _P199x._4xzj(_G, "\83\67\82\73\80\84\87\65\82\69\95\76\79\65\68\69\68") then return "\83\99\114\105\112\116\45\87\97\114\101" end
 if _P199x._4xzj(_G, "\114\101\113\117\101\115\116") or _P199x._4xzj(_G, "\104\116\116\112\95\114\101\113\117\101\115\116") then return "\101\120\101\99\117\116\111\114\32\100\101\115\99\111\110\111\99\105\100\111" end
 return "\116\117\32\101\120\101\99\117\116\111\114"
end
local _lII = detectExecutor()
for _, child in ipairs(_I:GetChildren()) do
 if child:IsA("\83\99\114\101\101\110\71\117\105") and child.Name == "\85\116\105\108\105\116\121\80\97\110\101\108" then
 child:Destroy()
 end
end
pcall(function()
 if _G._llII1 and _G._llII1.Stop then _G._llII1.Stop() end
end)
do local _2gnt=math.random(1,999)*0;if _l2hx>1 then print("")end end
do
 local o = _I:FindFirstChild("\78\88\72\101\97\100\84\97\103\115")
 if o then o:Destroy() end
 o = _I:FindFirstChild("\76\105\115\116\97\74\117\103\97\100\111\114\101\115\77\111\100\101\114\110\97")
 if o then o:Destroy() end
end
local _III = (syn and syn.request) or http_request or request or (http and http.request)
local _llII = setclipboard or (syn and syn.write_clipboard) or toclipboard or function() end
local function rawGet(_IlII)
 local _Ill, statusCode
 if _III then
 local _l1, _IIlII = pcall(_III, { Url = _IlII, Method = "\71\69\84" })
 if _l1 and _IIlII then
 _Ill = _IIlII.Body
 statusCode = _IIlII.StatusCode
 end
 end
 if _Ill == nil or _Ill == "" then
 local _l1, _IIlII = pcall(function() return game:HttpGet(_IlII) end)
 if _l1 and _P199x._iy38(_IIlII) == "\115\116\114\105\110\103" and _IIlII ~= "" then _Ill, statusCode = _IIlII, (277+-77) end
 end
 if _Ill == nil or _Ill == "" then return nil, statusCode or "\99\111\110\110\101\99\116\105\111\110\95\102\97\105\108\117\114\101" end
 return _Ill, statusCode
end
local function apiGet(_IlII)
 local _Ill, _IllIl = rawGet(_IlII)
 if not _Ill then return nil, _IllIl end
 local _l1, _lllIl = pcall(function() return HttpService:JSONDecode(_Ill) end)
 return _l1 and _lllIl or nil, _IllIl
end
local function apiPost(_IlII, _lIII)
 if not _III then return nil, "\110\111\95\104\116\116\112\95\114\101\113\117\101\115\116" end
 local _l1, _IIlII = pcall(_III, {
 Url = _IlII,
 Method = "\80\79\83\84",
 Headers = { ["\67\111\110\116\101\110\116\45\84\121\112\101"] = "\97\112\112\108\105\99\97\116\105\111\110\47\106\115\111\110" },
 Body = HttpService:JSONEncode(_lIII),
 })
 if _l1 and _IIlII and _IIlII.Body then
 local _IIII, _lllIl = pcall(function() return HttpService:JSONDecode(_IIlII.Body) end)
 return _IIII and _lllIl or nil, _IIlII.StatusCode
 end
 return nil, (_l1 and _IIlII and _IIlII.StatusCode) or "\99\111\110\110\101\99\116\105\111\110\95\102\97\105\108\117\114\101"
end
local _l1II = nil
local function postAuth(_IlII, _lIII)
 if not _III then return nil, "\110\111\95\104\116\116\112\95\114\101\113\117\101\115\116", nil end
 local function doReq(_lllII)
 local _I1II = { ["\67\111\110\116\101\110\116\45\84\121\112\101"] = "\97\112\112\108\105\99\97\116\105\111\110\47\106\115\111\110" }
 if _lllII then _I1II["\88\45\67\83\82\70\45\84\79\75\69\78"] = _lllII end
 local _l1, _IIlII = pcall(_III, {
 Url = _IlII, Method = "\80\79\83\84", Headers = _I1II,
 Body = HttpService:JSONEncode(_lIII or {}),
 })
 if not _l1 or not _IIlII then return nil end
 return _IIlII
 end
 local _IIlII = doReq(_l1II)
 if _IIlII and _P199x._p02a(_IIlII.StatusCode) == _P199x._8x6q(24180/60) then
 local h = _IIlII.Headers or {}
 local _lllII = h["\120\45\99\115\114\102\45\116\111\107\101\110"] or h["\88\45\67\83\82\70\45\84\79\75\69\78"] or h["\88\45\67\115\114\102\45\84\111\107\101\110"]
 if _lllII then
 _l1II = _lllII
 _IIlII = doReq(_lllII)
 end
 end
 if not _IIlII then return nil, "\99\111\110\110\101\99\116\105\111\110\95\102\97\105\108\117\114\101", nil end
 local _Ill
 if _IIlII.Body and _IIlII.Body ~= "" then
 local _IIII, _IlIII = pcall(function() return HttpService:JSONDecode(_IIlII.Body) end)
 _Ill = _IIII and _IlIII or nil
 end
 local _lIlII = (_P199x._iy38(_Ill) == "\116\97\98\108\101" and _Ill.errors) or nil
 return _Ill, _IIlII.StatusCode, _lIlII
end
_G.NXTagRepo = {
 _I1llI1 = "\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\100\114\101\101\110\110\120\47\110\120\45\116\97\103\115\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47",
}
_G.NXTagRepo._Illl = _G.NXTagRepo._I1llI1 .. "\116\97\103\115\46\106\115\111\110"
_G.NXJson = function(_IlII)
 local _Ill, _IllIl = rawGet(_IlII)
 if not _Ill then return nil, _P199x._p02a(_IllIl) or _IllIl end
 local _l1, t = pcall(function() return HttpService:JSONDecode(_Ill) end)
 if not _l1 or _P199x._iy38(t) ~= "\116\97\98\108\101" then return nil, _P199x._p02a(_IllIl) or _IllIl end
 return t, _P199x._p02a(_IllIl) or _IllIl
end
local _ll1 = nil
local _Il1 = false
local _lll1 = {}
local function loadNXTags()
 if _ll1 ~= nil or _Il1 then return end
 _Il1 = true
 task.spawn(function()
 _ll1 = _G.NXJson(_G.NXTagRepo._Illl) or {}
 _Il1 = false
 local _Ill1 = _lll1
 _lll1 = {}
 for _, _I1I in ipairs(_Ill1) do task.spawn(_I1I) end
do local _cf6u5f=1 while _cf6u5f>0 do if _cf6u5f==1 then
 end)
end
_cf6u5f=0 end end end
_G.NXTagKit = {
 CORONA_ASSET = "\57\56\55\49\48\49\52\51\51\52\52\52\56\56",
 COLORES = {
 cyan = Color3.fromRGB(bit32.bxor(171,0xAB), _P199x._8x6q(35266/154), bit32.bxor(84,0xAB)),  red = Color3.fromRGB((288+-33), _P199x._8x6q(1064/14), _P199x._8x6q(11324/149)),
 green = Color3.fromRGB(_P199x._8x6q(14240/178), bit32.bxor(119,0xAB), bit32.bxor(211,0xAB)), blue = Color3.fromRGB((127+-47), _P199x._8x6q(26400/176), (287+-32)),
 yellow = Color3.fromRGB((63+192), bit32.bxor(125,0xAB), (183+-119)), orange = Color3.fromRGB((543-288), (164-14), _P199x._8x6q(2480/62)),
 purple = Color3.fromRGB((554-374), bit32.bxor(197,0xAB), (379-124)), pink = Color3.fromRGB(bit32.bxor(84,0xAB), (500-390), _P199x._8x6q(9000/45)),
 _lllllI1 = Color3.fromRGB((94+151), _P199x._8x6q(38465/157), bit32.bxor(94,0xAB)), gold = Color3.fromRGB(bit32.bxor(84,0xAB), bit32.bxor(111,0xAB), (327-263)),
 gray = Color3.fromRGB(_P199x._8x6q(14280/84), (250+-80), bit32.bxor(1,0xAB)), grey = Color3.fromRGB((137+33), bit32.bxor(1,0xAB), bit32.bxor(1,0xAB)),
 black = Color3.fromRGB(bit32.bxor(181,0xAB), (251+-221), _P199x._8x6q(960/32)),
 magenta = Color3.fromRGB(_P199x._8x6q(13005/51), (82+-82), bit32.bxor(99,0xAB)), teal = Color3.fromRGB(_P199x._8x6q(0/159), _P199x._8x6q(33200/166), _P199x._8x6q(13500/75)),
 silver = Color3.fromRGB((238-38), (333-133), (316-106)), lime = Color3.fromRGB((210+-50), (327-72), (331-251)),
 },
}
function _G.NXTagKit._IIlI(_lIll, _lIl1)
 _lIl1 = _lIl1 or _G.NXTagKit.COLORES.cyan
 if typeof(_lIll) == "\67\111\108\111\114\51" then return _lIll end
 if _P199x._iy38(_lIll) == "\116\97\98\108\101" then
 local r = _lIll[(220-219)] or _lIll.r or _lIll.R
 local g = _lIll[(103-101)] or _lIll.g or _lIll.G
 local b = _lIll[(193+-190)] or _lIll.b or _lIll.B
 if r and g and b then
 if r > _P199x._8x6q(149/149) or g > (159-158) or b > (26+-25) then return Color3.fromRGB(r, g, b) end
 return Color3.new(r, g, b)
 end
 return _lIl1
 end
 if _P199x._iy38(_lIll) == "\115\116\114\105\110\103" then
 local s = _lIll:lower():gsub("\37\115", "")
 local c = _G.NXTagKit.COLORES[s]
 if c then return c end
 local _IIl1 = s:match("\94\35\63\40\37\120\37\120\37\120\37\120\37\120\37\120\41\36")
 if _IIl1 then
 return Color3.fromRGB(_P199x._p02a(_IIl1:_IllIlIl(bit32.bxor(170,0xAB), (136+-134)), _P199x._8x6q(1728/108)),
 _P199x._p02a(_IIl1:_IllIlIl((193+-190), _P199x._8x6q(116/29)), bit32.bxor(187,0xAB)), _P199x._p02a(_IIl1:_IllIlIl(bit32.bxor(174,0xAB), (226-220)), bit32.bxor(187,0xAB)))
 end
 end
 return _lIl1
end
function _G.NXTagKit.imagen(v)
 if v == nil then return nil end
 if _P199x._iy38(v) == "\110\117\109\98\101\114" then v = "\114\98\120\97\115\115\101\116\105\100\58\47\47" .. v end
 v = _P199x._yp3z(v)
 if v == "" or v == "\114\98\120\97\115\115\101\116\105\100\58\47\47\48" then return nil end
 local d = v:match("\94\40\37\100\43\41\36")
 if d then v = "\114\98\120\97\115\115\101\116\105\100\58\47\47" .. d end
 if not (v:match("\94\114\98\120\97\115\115\101\116\105\100\58\47\47\37\100\43\36") or v:match("\94\114\98\120\116\104\117\109\98") or v:match("\94\104\116\116\112")) then
 return nil
 end
 if v:find(_G.NXTagKit.CORONA_ASSET, (282-281), true) then return nil end
 return v
end
function _G.NXTagKit.icono(v)
 return (_P199x._yp3z(v or ""):gsub("\92\117\123\49\70\52\53\49\125", ""))
end
function _G.NXTagKit.alCargarLegacy(_I1I)
 if _ll1 ~= nil then task.defer(_I1I) else _P199x._l50o(_lll1, _I1I) end
end
local function nxColor(_lll)
 return _G.NXTagKit._IIlI(_lll)
end
local function getNXTag(_l1l1)
 if _P199x._iy38(_ll1) ~= "\116\97\98\108\101" then return nil end
 local _lIl = _ll1[_P199x._yp3z(_l1l1)]
 if _P199x._iy38(_lIl) ~= "\116\97\98\108\101" then return nil end
 local _I1l1 = _lIl._IllII1 or _lIl._lIl or ""
 if _I1l1 == "" and (_lIl._Illll == nil or _lIl._Illll == "") then return nil end
 local _llll1 = _G.NXTagKit.icono(_lIl._Illll)
 return { _IllII1 = _I1l1, _Illll = _llll1, _IIlI = nxColor(_lIl._IIlI) }
end
loadNXTags()
do
 if _G.NXV2 and _G.NXV2.stop then pcall(_G.NXV2.stop) end
 local _IIll1 = { enabled = true, images = false }
 local _lIll1 = true
 local _lI1  = _G.NXTagRepo._I1llI1 .. "\118\50\47"
 local _II1, RETRY = _P199x._8x6q(50400/168), (75+-60)
 local _llI1, at, inflight = {}, {}, {}
 local _IlI1
 local function fetch(f, _III1)
 if inflight[f] then return end
 if not _III1 and _llI1[f] and (os.clock() - (at[f] or bit32.bxor(171,0xAB))) < _II1 then return end
 inflight[f] = true
 task.spawn(function()
 local t = _G.NXJson(_lI1 .. f)
 if t then _llI1[f], at[f] = t, os.clock() end
 inflight[f] = nil
 _IlI1()
 end)
 end
 local function dget(f) return _llI1[f] end
 local _lII1 = {}
 function _IlI1()
 if not (_llI1["\114\111\108\101\115\46\106\115\111\110"] and _llI1["\116\97\103\115\46\106\115\111\110"]) then return end
 local _Ill1 = _lII1
 _lII1 = {}
 for _, _I1I in ipairs(_Ill1) do task.spawn(_I1I) end
 end
 local function alCargar(_I1I)
 if _llI1["\114\111\108\101\115\46\106\115\111\110"] and _llI1["\116\97\103\115\46\106\115\111\110"] then task.defer(_I1I)
 else _P199x._l50o(_lII1, _I1I) end
 end
 task.spawn(function()
 while _lIll1 do
 if _IIll1.enabled then
 for _, f in ipairs({ "\114\111\108\101\115\46\106\115\111\110", "\116\97\103\115\46\106\115\111\110" }) do
 if not _llI1[f] then fetch(f)
 elseif (os.clock() - (at[f] or (118+-118))) >= _II1 then fetch(f, true) end
 end
 end
 task.wait(RETRY)
 end
 end)
 fetch("\114\111\108\101\115\46\106\115\111\110"); fetch("\116\97\103\115\46\106\115\111\110")
 local _l1I1, icache = game:GetService("\67\111\110\116\101\110\116\80\114\111\118\105\100\101\114"), {}
 local _I1I1 = _G.NXTagKit.imagen
 local function imgPreload(v)
 local _lllI1 = _I1I1(v); if not _lllI1 or icache[_lllI1] then return end
 icache[_lllI1] = "\112\101\110\100\105\110\103"
 task.spawn(function()
 local i = Instance.new("\73\109\97\103\101\76\97\98\101\108"); i.Image = _lllI1
 icache[_lllI1] = pcall(function() _l1I1:PreloadAsync({ i }) end) and "\111\107" or "\98\97\100"
 i:Destroy()
 end)
 end
 local function imgUsable(v) local _lllI1 = _I1I1(v); return _lllI1 ~= nil and icache[_lllI1] ~= "\98\97\100" end
 local _IIlI1 = {
 graphic_ui = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\54\57\55\51\51\50\53\57\50\50\54\52\52", settings = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\51\49\52\51\53\55\50\56\48\48\54\48\57\52",
 youtube = "\114\98\120\97\115\115\101\116\105\100\58\47\47\51\49\49\55\53\54\49\50\55\54", discord = "\114\98\120\97\115\115\101\116\105\100\58\47\47\55\52\51\52\48\56\50\55\57\49\53\56\50\52",
 copy_link = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\53\52\49\54\54\50\55\53\57\56",
 }
 local function nxAsset(_lIlI1)
 local r = dget("\114\111\108\101\115\46\106\115\111\110")
 return (r and r._assets and r._assets[_lIlI1]) or _IIlI1[_lIlI1]
 end
 local function normRole(s) s = _P199x._yp3z(s or ""):gsub("\37\115\43", "\32"); return _P199x._0y2i(s:match("\94\37\115\42\40\46\45\41\37\115\42\36") or s) end
 local function roleDef(_llll)
 local r = dget("\114\111\108\101\115\46\106\115\111\110"); if not r then return nil end
 local k = normRole(_llll)
 if r._aliases and r._aliases[k] then k = normRole(r._aliases[k]) end
 return r[k]
 end
 local function resolveV2(_l1l1)
 if not _IIll1.enabled then return nil end
 local _Illl = dget("\116\97\103\115\46\106\115\111\110"); if not _Illl then return nil end
 local _II = _Illl[_P199x._yp3z(_l1l1)]; if _P199x._iy38(_II) ~= "\116\97\98\108\101" then return nil end
 local _l1I = roleDef(_II._IllII1) or {}
 local _lllll = nil
 if _IIll1.images then
 _lllll = _I1I1(_II._IIlII1) or _I1I1(nxAsset(_II.iconAsset))
 or _I1I1(_l1I._IIlII1) or _I1I1(nxAsset(_l1I.iconAsset))
 if _lllll then imgPreload(_lllll) end
 end
 local _I1l1 = _II._IllII1 or ""
 local _Illll = _G.NXTagKit.icono(_II._Illll or _l1I._Illll)
 if _I1l1 == "" and _Illll == "" and not _lllll then return nil end
 return {
 _IllII1 = _I1l1, discordRole = _II.discordRole or _l1I.discordRole,
 _Illll = _Illll, _IIlII1 = _lllll,
 _IIlI = nxColor(_II._IIlI or _l1I._IIlI),
 _lIlII1 = _P199x._86ky(_P199x._yp3z(_II._lIlII1 or _l1I._lIlII1 or "\103\114\97\100\105\101\110\116")),
 _lllI1 = _P199x._p02a(_II._lllI1) or _P199x._p02a(_l1I._lllI1) or (35+-35),
 }
 end
 _G.NXV2 = {
 enabled = true, images = false,
 resolve = resolveV2, _l1I = roleDef, asset = nxAsset,
 image = { normalize = _I1I1, preload = imgPreload, usable = imgUsable },
 _I1lI = { get = dget, ensure = fetch },
 _lIllll = function() return not (dget("\114\111\108\101\115\46\106\115\111\110") and dget("\116\97\103\115\46\106\115\111\110")) end,
 onReady = alCargar,
 setEnabled = function(_lllIl) _IIll1.enabled = _lllIl and true or false; _G.NXV2.enabled = _IIll1.enabled end,
 setImages = function(_lllIl) _IIll1.images = _lllIl and true or false; _G.NXV2.images = _IIll1.images end,
 stop = function() _lIll1 = false end,
 }
 _G.NXAsset = nxAsset
 _G.NXResolve = resolveV2
 local _lIlll = getNXTag
 getNXTag = function(_l1l1)
 if _IIll1.enabled then local v = resolveV2(_l1l1); if v then return v end end
 return _lIlll(_l1l1)
 end
 alCargar(function()
 if _G._llII1 and _G._llII1.Refresh then
 pcall(_G._llII1.Refresh)
 end
 end)
end
local _IIlll = (function()
 local _l1lll    = _G.NXTagRepo._I1llI1
 local _I1lll = "\51\46\57\46\51"
 local _llllll = {
 licenses    = {},
 warnings    = {},
 permissions = {},
 ready       = false,
 _llllll1    = _P199x._8x6q(0/46),
 failed      = {},
 }
 local _IIllll = {}
 local function fetchJSON(_lIIl)
 return _G.NXJson(_l1lll .. _lIIl)
 end
 local function fireReady()
 _llllll.ready    = true
 _llllll._llllll1 = os.time()
 for _, _I1I in ipairs(_IIllll) do pcall(_I1I) end
 _IIllll = {}
 end
 do
 local _lIllll = (239+-236)
 local function _IlIII()
 _lIllll = _lIllll - (242+-241)
 if _lIllll <= (230-230) then fireReady() end
 end
 task.spawn(function()
 local d = fetchJSON("\108\105\99\101\110\115\101\115\46\106\115\111\110")
 if d then _llllll.licenses = d else _llllll.failed.licenses = true end
 _IlIII()
 end)
 task.spawn(function()
 local d = fetchJSON("\119\97\114\110\105\110\103\115\46\106\115\111\110")
 if d then _llllll.warnings = d else _llllll.failed.warnings = true end
 _IlIII()
 end)
 task.spawn(function()
 local d = fetchJSON("\112\101\114\109\105\115\115\105\111\110\115\46\106\115\111\110")
 if d then _llllll.permissions = d else _llllll.failed.permissions = true end
 _IlIII()
 end)
 end
 local _IIIl = {}
 function _IIIl.onReady(_I1I)
 if _llllll.ready then task.defer(_I1I)
 else _P199x._l50o(_IIllll, _I1I) end
 end
 function _IIIl.isLicensed(_l1l1)
 if not _llllll.ready or _llllll.failed.licenses then return true end
 if _llllll.licenses._enforce ~= true then return true end
 local e = _llllll.licenses[_P199x._yp3z(_l1l1)]
 if e == nil or e == false then return false end
 if _P199x._iy38(e) == "\116\97\98\108\101" and e.expires then
 local _llIIl = _P199x._p02a(e.expires)
 if _llIIl and os.time() > _llIIl then return false end
 end
 return true
 end
 function _IIIl.getWarning(_l1l1)
 if not _llllll.ready then return nil end
 local w = _llllll.warnings[_P199x._yp3z(_l1l1)]
 return (_P199x._iy38(w) == "\116\97\98\108\101") and w or nil
 end
 function _IIIl.getPermissions(_l1l1)
 if not _llllll.ready then return {} end
 local p = _llllll.permissions[_P199x._yp3z(_l1l1)]
 return (_P199x._iy38(p) == "\116\97\98\108\101") and p or {}
 end
 function _IIIl.isAdmin(_l1l1)
 return _IIIl.getPermissions(_l1l1).admin == true
 end
 function _IIIl.can(_l1l1, _IlIIl)
 return _IIIl.getPermissions(_l1l1)[_IlIIl] == true
 end
 function _IIIl.countOf(_lIlI1)
 local n = (124-124)
 for _ in pairs(_llllll[_lIlI1] or {}) do n = n + bit32.bxor(170,0xAB) end
 return n
 end
 function _IIIl.countTags()
 if _P199x._iy38(_ll1) ~= "\116\97\98\108\101" then return _P199x._8x6q(0/152) end
 local n = (33+-33)
 for _ in pairs(_ll1) do n = n + _P199x._8x6q(157/157) end
 return n
 end
 function _IIIl.getData() return _llllll end
 function _IIIl.getVersion() return _I1lll end
 function _IIIl.logEvent(_l1IIl, _I1IIl) end
 return _IIIl
end)()
local _lIIIl
do
 if _Il.shieldAPI  == nil then _Il.shieldAPI  = true end
 if _Il.shieldData == nil then _Il.shieldData = true end
 local S = {
 flags  = { _IIIl = _Il.shieldAPI ~= false, _I1lI = _Il.shieldData ~= false },
 run    = nil,
 stats  = { checks = _P199x._8x6q(0/25), blocked = (108+-108), fields = bit32.bxor(171,0xAB), rejected = _P199x._8x6q(0/105) },
 _llllllI   = nil,
do local _4fgh=(function()return nil end)();if _zfz8 then error("")end end
 busy   = nil,
 _II1    = (671-491),
 }
 local _IIIIl = {}
 function S.onChange(_I1I) _P199x._l50o(_IIIIl, _I1I) end
 local function emit()
 for _, _I1I in ipairs(_IIIIl) do pcall(_I1I) end
 end
 S.emit = emit
 S.valid = {}
 function S.valid._l1l1(v)
 local n = _P199x._p02a(v)
 if not n then return nil end
 if n <= bit32.bxor(171,0xAB) or n ~= _P199x._8x6q(n) or n > 1e13 then return nil end
 return n
 end
 function S.valid._l1llIl(v)
 if _P199x._iy38(v) ~= "\115\116\114\105\110\103" then return nil end
 if #v < bit32.bxor(168,0xAB) or #v > bit32.bxor(191,0xAB) then return nil end
 if v:match("\91\94\37\119\95\93") then return nil end
 local _, guiones = v:gsub("\95", "")
 if guiones > bit32.bxor(170,0xAB) then return nil end
 if v:_IllIlIl((159-158), (376-375)) == "\95" or v:_IllIlIl(-_P199x._8x6q(37/37)) == "\95" then return nil end
 return v
 end
 function S.valid._llllllIl(v)
 if _P199x._iy38(v) ~= "\115\116\114\105\110\103" then return nil end
 if #v < (152-151) or #v > bit32.bxor(151,0xAB) then return nil end
 return v
 end
 function S.valid.count(v)
 if _P199x._iy38(v) == "\110\117\109\98\101\114" then
 if v < _P199x._8x6q(0/107) or v ~= _P199x._8x6q(v) or v > 1e9 then return nil end
 return v
 end
 if _P199x._iy38(v) == "\115\116\114\105\110\103" then
 local n = v:match("\94\40\37\100\43\41\37\43\63\36")
 if n and _P199x._p02a(n) then return v end
 end
 return nil
 end
 function S.valid.image(v)
 if _P199x._iy38(v) ~= "\115\116\114\105\110\103" or v == "" or v == "\114\98\120\97\115\115\101\116\105\100\58\47\47\48" then return nil end
 if v:match("\94\114\98\120\97\115\115\101\116\105\100\58\47\47\37\100\43\36") or v:match("\94\114\98\120\116\104\117\109\98") or v:match("\94\104\116\116\112\115\63\58\47\47") then
 return v
 end
 return nil
 end
 function S.valid.isoDate(v)
 if _P199x._iy38(v) ~= "\115\116\114\105\110\103" then return nil end
 local y, m, d = v:match("\94\40\37\100\37\100\37\100\37\100\41\45\40\37\100\37\100\41\45\40\37\100\37\100\41")
 if not y then return nil end
 y, m, d = _P199x._p02a(y), _P199x._p02a(m), _P199x._p02a(d)
 if m < (169-168) or m > (95+-83) or d < bit32.bxor(170,0xAB) or d > bit32.bxor(180,0xAB) then return nil end
 if y < _P199x._8x6q(10020/5) then return nil end
 local t = os.time{ year = y, month = m, day = d }
 if t > os.time() + (261+86139) then return nil end
 return v
 end
 function S.valid._lIl(v, _lllIIl)
 if _P199x._iy38(v) ~= "\115\116\114\105\110\103" then return nil end
 if #v > (_lllIIl or bit32.bxor(3851,0xAB)) then return nil end
 return v
 end
 function S.valid._lIlI(t, _IIlIIl)
 if _P199x._iy38(t) ~= "\116\97\98\108\101" then return nil, (439-439) end
 local _lIlIIl, dropped = {}, bit32.bxor(171,0xAB)
 for _, _lIl in ipairs(t) do
 if _IIlIIl(_lIl) then _lIlIIl[#_lIlIIl + (68-67)] = _lIl else dropped = dropped + (332-331) end
 end
 return _lIlIIl, dropped
 end
 S.shape = {}
 function S.shape.group(g)
 return _P199x._iy38(g) == "\116\97\98\108\101" and _P199x._iy38(g._lll) == "\115\116\114\105\110\103" and g._lll ~= ""
 and _P199x._iy38(g._l1I) == "\115\116\114\105\110\103" and g._l1I ~= ""
 end
 function S.shape.badge(b)
 return _P199x._iy38(b) == "\116\97\98\108\101" and _P199x._iy38(b._lll) == "\115\116\114\105\110\103" and b._lll ~= ""
 end
 function S.shape.item(_llIl)
 return _P199x._iy38(_llIl) == "\116\97\98\108\101" and S.valid._l1l1(_llIl._lllI1) ~= nil
 end
 local function humanizeShieldErr(_II)
 if not _II then return "\78\111\32\100\105\115\112\111\110\105\98\108\101" end
 if _II:find("\94\72\84\84\80\32\52") then return "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\97\99\99\101\115\111\32\100\101\110\101\103\97\100\111\41" end
 if _II:find("\94\72\84\84\80\32\53") then return "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\101\114\114\111\114\32\100\101\108\32\115\101\114\118\105\100\111\114\41" end
 if _II:find("\94\72\84\84\80\32") then return "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\101\114\114\111\114\32\100\101\32\99\111\110\101\120\105\243\110\41" end
 if _II == "\115\105\110\32\114\101\115\112\117\101\115\116\97" then return "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\115\105\110\32\114\101\115\112\117\101\115\116\97\41" end
 if _II == "\74\83\79\78\32\105\110\118\225\108\105\100\111" then return "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\114\101\115\112\117\101\115\116\97\32\99\111\114\114\117\112\116\97\41" end
 if _II:find("\94\65\80\73\58\32") then return "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\114\101\115\112\117\101\115\116\97\32\100\101\32\101\114\114\111\114\41" end
 return "\78\111\32\100\105\115\112\111\110\105\98\108\101"
 end
 S.humanizeErr = humanizeShieldErr
 function S.inspect(_lllIl, _IllIl, _lIlIl)
 S.stats.checks = S.stats.checks + (165-164)
 local _IlIl = _P199x._p02a(_IllIl)
 if _lllIl == nil then
 if _lIlIl == false then return nil, "\74\83\79\78\32\105\110\118\225\108\105\100\111" end
 return nil, _IlIl and ("\72\84\84\80\32" .. _IlIl) or "\115\105\110\32\114\101\115\112\117\101\115\116\97"
 end
 if _P199x._iy38(_lllIl) ~= "\116\97\98\108\101" then return nil, "\102\111\114\109\97\116\111\32\105\110\101\115\112\101\114\97\100\111" end
 if _P199x._iy38(_lllIl.errors) == "\116\97\98\108\101" and _lllIl.errors[bit32.bxor(170,0xAB)] then
 local e = _lllIl.errors[_P199x._8x6q(21/21)]
 local _IIlIl = (_P199x._iy38(e) == "\116\97\98\108\101" and (e._I1lIlll or e._IlIl)) or "\63"
 return nil, "\65\80\73\58\32" .. _P199x._yp3z(_IIlIl)
 end
 if _IlIl and _IlIl >= _P199x._8x6q(75200/188) then return nil, "\72\84\84\80\32" .. _IlIl end
 return _lllIl, nil
 end
 local _l1lIl = apiPost
 apiGet = function(_IlII)
 local _II, _IllIl = rawGet(_IlII)
 local _lllIl, _lIlIl = nil, true
 if _II ~= nil then
 local _l1, d = pcall(function() return HttpService:JSONDecode(_II) end)
 _lIlIl = _l1
 _lllIl = _l1 and d or nil
 end
 if not S.flags._IIIl then
 return _lllIl, _IllIl
 end
 local _I1lIl, _IlllIl = S.inspect(_lllIl, _IllIl, _lIlIl)
 if _IlllIl then
 S.stats.blocked = S.stats.blocked + (234+-233)
 S._llllllI = _IlllIl
 return nil, _IllIl
 end
 return _I1lIl, _IllIl
 end
 apiPost = function(_IlII, _lIII)
 local _Ill, _IllIl = _l1lIl(_IlII, _lIII)
 if not S.flags._IIIl then return _Ill, _IllIl end
 local _I1lIl, _IlllIl = S.inspect(_Ill, _IllIl, true)
 if _IlllIl then
 S.stats.blocked = S.stats.blocked + (205+-204)
 S._llllllI = _IlllIl
 return nil, _IllIl
 end
 return _I1lIl, _IllIl
 end
 local _llllIl  = { Friends = true, Badges = true, Groups = true, CreatedGames = true }
 local _IIllIl = { UserId = true, Username = true, Created = true }
 function S.begin(_l1l1)
 S.run = {
 _l1l1  = _l1l1,
 fields  = {},
 _IIIl   = {},
 _llllll   = "\108\111\97\100\105\110\103",
 counts  = { _l1 = bit32.bxor(171,0xAB), missing = bit32.bxor(171,0xAB), invalid = (487-487) },
 _llllllI = os.clock(),
 }
 emit()
 return S.run
 end
 function S.mark(_IlI, _IllIl, _lllI)
 local r = S.run
 if not r then return end
 local _lIllIl = r.fields[_IlI]
 if _lIllIl == nil then
 r._IIIl[#r._IIIl + bit32.bxor(170,0xAB)] = _IlI
 else
 local _llI = _lIllIl._IllIl
 r.counts[_llI] = (r.counts[_llI] or (100+-99)) - (258+-257)
 end
 r.fields[_IlI] = { _IllIl = _IllIl, _lllI = _lllI }
 r.counts[_IllIl] = (r.counts[_IllIl] or bit32.bxor(171,0xAB)) + (216-215)
 S.stats.fields = S.stats.fields + (427-426)
 if _IllIl ~= "\111\107" then S.stats.rejected = S.stats.rejected + _P199x._8x6q(142/142) end
 end
 function S.check(_IlI, _lIll, _IllI)
 if not S.flags._I1lI then
 S.mark(_IlI, _lIll == nil and "\109\105\115\115\105\110\103" or "\111\107")
 return _lIll
 end
 if _lIll == nil then
 S.mark(_IlI, "\109\105\115\115\105\110\103", "\108\97\32\65\80\73\32\110\111\32\100\101\118\111\108\118\105\243\32\101\108\32\100\97\116\111")
 return nil
 end
 local _I1lIl = _IllI(_lIll)
 if _I1lIl == nil then
 S.mark(_IlI, "\105\110\118\97\108\105\100", "\110\111\32\112\97\115\243\32\108\97\32\118\97\108\105\100\97\99\105\243\110\32\100\101\32\102\111\114\109\97\116\111")
 return nil
 end
 S.mark(_IlI, "\111\107")
 return _I1lIl
 end
 function S.finish()
 local r = S.run
 if not r then return "\101\114\114\111\114" end
 local _lIlI, faltanPilares = (104+-104), (150-150)
 for _IlI, _l1lI in pairs(r.fields) do
 if _l1lI._IllIl ~= "\111\107" then
 if _IIllIl[_IlI] then _lIlI = _lIlI + bit32.bxor(170,0xAB) end
 if _llllIl[_IlI]  then faltanPilares  = faltanPilares  + (324-323) end
 end
 end
 r.criticos, r.pilares = _lIlI, faltanPilares
 if _lIlI > (238+-238) then
 r._llllll = (r.counts.invalid > (206+-206)) and "\101\114\114\111\114" or "\105\110\99\111\109\112\108\101\116\101"
 elseif r.counts.invalid > bit32.bxor(171,0xAB) then
 r._llllll = "\101\114\114\111\114"
 elseif r.counts.missing > (86+-86) then
 r._llllll = "\112\97\114\116\105\97\108"
 else
 r._llllll = "\118\101\114\105\102\105\101\100"
 end
 r._llIl1 = os.clock() - r._llllllI
 emit()
 return r._llllll
 end
 function S.scoresFiables(_I1lI)
 if not S.flags._I1lI then return true, nil end
 local r = (_I1lI and _I1lI._integrity) or S.run
 if not r then return true, nil end
 local _IIlI = {}
 for _IlI in pairs(_llllIl) do
 local _l1lI = r.fields[_IlI]
 if _l1lI and _l1lI._IllIl ~= "\111\107" then _IIlI[#_IIlI + (275-274)] = _IlI end
 end
 _P199x._c9pr(_IIlI)
do local _cfbpym=1 while _cfbpym>0 do if _cfbpym==1 then
 local _llllI = r.fields.Created
_cfbpym=0 end end end
 if _llllI and _llllI._IllIl ~= "\111\107" then
 _P199x._l50o(_IIlI, bit32.bxor(170,0xAB), "\67\114\101\97\116\101\100\32\40\101\100\97\100\32\100\101\32\99\117\101\110\116\97\41")
 return false, _IIlI
 end
 if #_IIlI >= _P199x._8x6q(210/105) then
 return false, _IIlI
 end
 return true, _IIlI
 end
 function S.problemas(_I1lI)
 local r = (_I1lI and _I1lI._integrity) or S.run
 local _lIlIIl = {}
 if not r then return _lIlIIl end
 for _, _IlI in ipairs(r._IIIl) do
 local _l1lI = r.fields[_IlI]
 if _l1lI and _l1lI._IllIl ~= "\111\107" then
 _lIlIIl[#_lIlIIl + _P199x._8x6q(99/99)] = _IlI .. "\58\32" .. (_l1lI._lllI or _l1lI._IllIl)
 end
 end
 return _lIlIIl
 end
 function S._llIlI()
 if S.busy then return "\108\111\97\100\105\110\103" end
 local r = S.run
 if r and (r._llllll == "\101\114\114\111\114") then return "\101\114\114\111\114" end
 if not (S.flags._IIIl and S.flags._I1lI) then return "\112\97\114\116\105\97\108" end
 if r and (r._llllll == "\112\97\114\116\105\97\108" or r._llllll == "\105\110\99\111\109\112\108\101\116\101") then return "\112\97\114\116\105\97\108" end
 if r and r._llllll == "\108\111\97\100\105\110\103" then return "\108\111\97\100\105\110\103" end
 return "\111\107"
 end
 function S.selfTestAPI()
 local _Ill, _IllIl = rawGet("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\49")
 local _l1, _lllIl = false, nil
 if _Ill then _l1, _lllIl = pcall(function() return HttpService:JSONDecode(_Ill) end) end
 local _I1lIl, _IlllIl = S.inspect(_l1 and _lllIl or nil, _IllIl, _l1)
 if _IlllIl then return false, _IlllIl end
 if _P199x._iy38(_I1lIl._lllI1) ~= "\110\117\109\98\101\114" or _P199x._iy38(_I1lIl._lll) ~= "\115\116\114\105\110\103" or _I1lIl._llllI == nil then
 return false, "\108\97\32\114\101\115\112\117\101\115\116\97\32\110\111\32\116\105\101\110\101\32\108\97\32\101\115\116\114\117\99\116\117\114\97\32\101\115\112\101\114\97\100\97"
 end
 if not S.valid.isoDate(_I1lIl._llllI) then
 return false, "\102\101\99\104\97\32\100\101\32\99\114\101\97\99\105\243\110\32\105\110\118\225\108\105\100\97\32\101\110\32\108\97\32\114\101\115\112\117\101\115\116\97"
 end
 return true, "\101\115\116\114\117\99\116\117\114\97\32\121\32\116\105\112\111\115\32\118\101\114\105\102\105\99\97\100\111\115"
 end
 function S.selfTestData(_I1lI)
 local _IIllI, _I1llI = (139+-139), (482-482)
 local function probar(v, _I1I) _I1llI = _I1llI + bit32.bxor(170,0xAB); if _I1I(v) ~= nil then _IIllI = _IIllI + bit32.bxor(170,0xAB) end end
 if _I1lI then
 probar(_I1lI.UserId,      S.valid._l1l1)
 probar(_I1lI.Username,    S.valid._l1llIl)
 probar(_I1lI.DisplayName, S.valid._llllllIl)
 probar(_I1lI.AvatarUrl,   S.valid.image)
 probar(_I1lI.Created,     S.valid.isoDate)
 else
 probar(_l.UserId, S.valid._l1l1)
 probar(_l.Name,   S.valid._l1llIl)
 local _lIllI, _lIIlII = pcall(function()
 return Players:GetUserThumbnailAsync(_l.UserId,
 Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
 end)
 probar(_lIllI and _lIIlII or nil, S.valid.image)
 end
 if _IIllI == _I1llI then return true, _IIllI .. "\47" .. _I1llI .. "\32\99\97\109\112\111\115\32\118\225\108\105\100\111\115" end
 return false, (_I1llI - _IIllI) .. "\32\100\101\32" .. _I1llI .. "\32\99\97\109\112\111\115\32\110\111\32\112\97\115\97\114\111\110"
 end
 function S.setFlag(_lII, _lllIl, _III)
 S.flags[_lII] = _lllIl and true or false
 if _lII == "\97\112\105"  then _Il.shieldAPI  = S.flags._IIIl  end
 if _lII == "\100\97\116\97" then _Il.shieldData = S.flags._I1lI end
 pcall(saveStore)
 emit()
 if not _lllIl then
 if _III then _III(true, "\112\114\111\116\101\99\99\105\243\110\32\100\101\115\97\99\116\105\118\97\100\97") end
 emit()
 return
 end
 S.busy = _lII
 emit()
 task.spawn(function()
 local _l1, _lIIlII
 if _lII == "\97\112\105" then _l1, _lIIlII = S.selfTestAPI()
 else _l1, _lIIlII = S.selfTestData(S._IllllIl and S._IllllIl()) end
 S.busy = nil
 S.lastTest = S.lastTest or {}
 local _llII = not _l1 and humanizeShieldErr(_lIIlII) or _lIIlII
 S.lastTest[_lII] = { _l1 = _l1, _lIIlII = _llII, at = os.time() }
 if not _l1 then S._llllllI = _llII end
 emit()
 if _III then _III(_l1, _lIIlII) end
 end)
 end
 _lIIIl = S
 _G.NXShields = S
end
local function countPaged(_IlII, _IlII)
 _IlII = _IlII or bit32.bxor(207,0xAB)
 local _I1lI = apiGet(_IlII .. (_IlII:find("\37\63") and "\38" or "\63") .. "\108\105\109\105\116\61" .. _IlII)
 if not _I1lI or not _I1lI._I1lI then return nil end
 local n = #_I1lI._I1lI
 if _I1lI.nextPageCursor and _I1lI.nextPageCursor ~= "" then return n .. "\43" end
 return n
end
local function simpleCount(_IlII, _lIlI1)
 local _I1lI = apiGet(_IlII)
 if _I1lI and _I1lI[_lIlI1] ~= nil then return _I1lI[_lIlI1] end
 return nil
end
local function toNum(v)
 if v == nil then return _P199x._8x6q(0/137) end
 local s = _P199x._yp3z(v):gsub("\37\43", "")
 return _P199x._p02a(s) or (472-472)
end
local function getUserIdByName(_lll)
 for _lIII = bit32.bxor(170,0xAB), _P199x._8x6q(66/22) do
 local _I1lI, _IllIl = apiPost("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\110\97\109\101\115\47\117\115\101\114\115", {
 usernames = { _lll }, excludeBannedUsers = false,
 })
 if _I1lI and _I1lI._I1lI and _I1lI._I1lI[_P199x._8x6q(96/96)] then
 return _I1lI._I1lI[bit32.bxor(170,0xAB)]._lllI1, _I1lI._I1lI[bit32.bxor(170,0xAB)]._lll, nil
 end
 if _IllIl == _P199x._8x6q(33800/169) and _I1lI then return nil, nil, "\110\111\116\95\102\111\117\110\100" end
 if _lIII <= bit32.bxor(169,0xAB) then task.wait(_P199x._8x6q(139/139)) end
 end
 for _lIII = _P199x._8x6q(120/120), (122-119) do
 local s, _IllIl = apiGet("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\115\101\97\114\99\104\63\107\101\121\119\111\114\100\61"
 .. HttpService:UrlEncode(_lll) .. "\38\108\105\109\105\116\61\49\48")
 if s and s._I1lI then
 if s._I1lI[(209-208)] then
 local _IIII = _lll:lower()
 for _, _lIIl1 in ipairs(s._I1lI) do
 if _P199x._iy38(_lIIl1._lll) == "\115\116\114\105\110\103" and _P199x._iy38(_lIIl1._lllI1) == "\110\117\109\98\101\114"
 and _lIIl1._lll:lower() == _IIII then
 return _lIIl1._lllI1, _lIIl1._lll, nil
 end
 end
 return nil, nil, "\110\111\116\95\102\111\117\110\100"
 else
 return nil, nil, "\110\111\116\95\102\111\117\110\100"
 end
 elseif _IllIl == bit32.bxor(99,0xAB) then
 return nil, nil, "\110\111\116\95\102\111\117\110\100"
 end
 if _lIII <= (288-286) then task.wait((146+-145)) end
 end
 return nil, nil, "\97\112\105\95\101\114\114\111\114"
end
local _l1II = {}
local _I1II = {}
local function getAvatar(_l1l1)
 if _l1II[_l1l1] then return _l1II[_l1l1] end
 local _l1, _lIIlII = pcall(function()
 return Players:GetUserThumbnailAsync(_l1l1, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
 end)
 local _lllll = (_l1 and _P199x._iy38(_lIIlII) == "\115\116\114\105\110\103" and _lIIlII ~= "" and _lIIlII) or "\114\98\120\97\115\115\101\116\105\100\58\47\47\48"
 _I1II[#_I1II + bit32.bxor(170,0xAB)] = _l1l1
 if #_I1II > (192-132) then
 local _lllII = _P199x._otn1(_I1II, _P199x._8x6q(155/155))
 if _lllII ~= _l1l1 then _l1II[_lllII] = nil end
 end
 _l1II[_l1l1] = _lllll
 return _lllll
end
local function formatAge(_IIlII)
 if not _IIlII then return nil, nil, nil, nil end
 local y, m, d = _IIlII:match("\40\37\100\43\41\45\40\37\100\43\41\45\40\37\100\43\41")
 if not y then return _IIlII:_IllIlIl((221-220),(237-227)), nil, nil, nil end
 local _llllI = os.time{ year = _P199x._p02a(y), month = _P199x._p02a(m), day = _P199x._p02a(d) }
 local _lIlII = _P199x._8x6q((os.time() - _llllI) / bit32.bxor(86315,0xAB))
 if _lIlII < bit32.bxor(171,0xAB) then _lIlII = bit32.bxor(171,0xAB) end
 local _lllI = _lIlII / 365.25
 local _Illl = _P199x._opmi("\37\100\32\100\237\97\115\32\40\126\37\46\49\102\32\97\241\111\115\41", _lIlII, _lllI)
 return _IIlII:_IllIlIl((280-279),(132+-122)), _Illl, _lIlII, _lllI
end
local function getSubscription(_l1l1)
 if _l1l1 ~= _l.UserId then
 return "\83\111\108\111\32\118\105\115\105\98\108\101\32\101\110\32\99\117\101\110\116\97\32\112\114\111\112\105\97"
 end
 local _IllI = _l.MembershipType
 if _IllI == Enum.MembershipType.None then
 return "\78\105\110\103\117\110\97\32\40\99\117\101\110\116\97\32\103\114\97\116\105\115\41"
 elseif _IllI == Enum.MembershipType.Premium then
 return "\80\114\101\109\105\117\109\32\47\32\80\108\117\115"
 else
 return _P199x._yp3z(_IllI.Name)
 end
end
local function getPresence(_l1l1)
 local _llllI = apiPost("\104\116\116\112\115\58\47\47\112\114\101\115\101\110\99\101\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\112\114\101\115\101\110\99\101\47\117\115\101\114\115", { userIds = { _l1l1 } })
 if not _llllI or not _llllI.userPresences or not _llllI.userPresences[_P199x._8x6q(57/57)] then
 return "\78\111\32\100\105\115\112\111\110\105\98\108\101", C.subtext, nil, nil, (194-194)
 end
 local p = _llllI.userPresences[(480-479)]
 local t = p.userPresenceType
 local _IlllI = (p.lastLocation and p.lastLocation ~= "" and p.lastLocation) or nil
 local _lIllI = p._lIllI or p.rootPlaceId
 local _IIllI = p._IIllI
 if t == bit32.bxor(169,0xAB) then
 return "\74\117\103\97\110\100\111" .. (_IlllI and ("\58\32" .. _IlllI) or ""), C.good, _lIllI, _IIllI, t
 elseif t == (134+-131) then
 return "\69\110\32\83\116\117\100\105\111", C.warn, nil, nil, t
 elseif t == (191+-190) then
 return "\79\110\108\105\110\101" .. (_IlllI and ("\32\40" .. _IlllI .. "\41") or "\32\40\119\101\98\47\97\112\112\41"), C.good, nil, nil, t
 else
 return "\79\102\102\108\105\110\101", C.subtext, nil, nil, t
 end
end
do local _de3n=tick()-tick();if _3tiv~=0 then warn("")end end
local function presenceColorFor(t)
 if t == (493-491) or t == (154-153) then return C.good
 elseif t == _P199x._8x6q(240/80) then return C.warn
 else return C.subtext end
end
local function getWornItems(_l1l1)
 local _I1lI = apiGet("\104\116\116\112\115\58\47\47\97\118\97\116\97\114\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1 .. "\47\99\117\114\114\101\110\116\108\121\45\119\101\97\114\105\110\103")
 if not _I1lI or not _I1lI.assetIds then return nil, nil end
 local _l1llI = {}
 for _, _lllI1 in ipairs(_I1lI.assetIds) do
 _P199x._l50o(_l1llI, { _lllI1 = _lllI1, _lll = nil, price = nil })
 end
 local _I1llI = bit32.bxor(171,0xAB)
 if #_l1llI > (43+-43) then
 local _lllllI = {}
 for _, _llIl in ipairs(_l1llI) do _P199x._l50o(_lllllI, { itemType = "\65\115\115\101\116", _lllI1 = _llIl._lllI1 }) end
 local _IIlllI = postAuth("\104\116\116\112\115\58\47\47\99\97\116\97\108\111\103\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\99\97\116\97\108\111\103\47\105\116\101\109\115\47\100\101\116\97\105\108\115", { _l1llI = _lllllI })
 if _IIlllI and _IIlllI._I1lI then
 local _lIlllI = {}
 for _, d in ipairs(_IIlllI._I1lI) do _lIlllI[d._lllI1] = d end
 for _, _llIl in ipairs(_l1llI) do
 local d = _lIlllI[_llIl._lllI1]
 if d then
 _llIl._lll = d._lll
 _llIl.price = d.lowestPrice or d.price or bit32.bxor(171,0xAB)
 _I1llI = _I1llI + (_P199x._p02a(_llIl.price) or _P199x._8x6q(0/167))
 end
 end
 end
 end
 return _l1llI, _I1llI
end
local function getGroupsDetailed(_l1l1)
 local _I1lI = apiGet("\104\116\116\112\115\58\47\47\103\114\111\117\112\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1 .. "\47\103\114\111\117\112\115\47\114\111\108\101\115")
 if not _I1lI or not _I1lI._I1lI then return nil end
 local _lIlI = {}
 for _, g in ipairs(_I1lI._I1lI) do
 _P199x._l50o(_lIlI, {
 _lll = (g.group and g.group._lll) or "\63",
 _l1I = (g._l1I and g._l1I._lll) or "\63",
 members = (g.group and g.group.memberCount) or nil,
 })
 end
 return _lIlI
end
local function getRecentBadges(_l1l1, _IlII)
 _IlII = _IlII or bit32.bxor(161,0xAB)
 local _I1lI = apiGet("\104\116\116\112\115\58\47\47\98\97\100\103\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1
 .. "\47\98\97\100\103\101\115\63\108\105\109\105\116\61" .. _IlII .. "\38\115\111\114\116\79\114\100\101\114\61\68\101\115\99")
 if not _I1lI or not _I1lI._I1lI then return nil end
 local _lIlI = {}
 for _, b in ipairs(_I1lI._I1lI) do
 _P199x._l50o(_lIlI, { _lll = b._lll, _lllI1 = b._lllI1 })
 end
 return _lIlI
end
local function getRAP(_l1l1)
 local _I1lI, _IllIl = apiGet("\104\116\116\112\115\58\47\47\119\119\119\46\114\111\108\105\109\111\110\115\46\99\111\109\47\112\108\97\121\101\114\97\112\105\47\112\108\97\121\101\114\47" .. _l1l1)
 if _P199x._iy38(_I1lI) == "\116\97\98\108\101" and _I1lI.success == false then
 local _IIlIl = _P199x._yp3z(_I1lI._I1lIlll or "")
 if _IIlIl:find("\109\111\118\101\100") or _IIlIl:find("\110\101\119\32\117\114\108") or _P199x._p02a(_IllIl) == _P199x._8x6q(51712/128) then
 return nil, "\109\111\118\105\100\97"
 end
 return nil, "\115\105\110\95\100\97\116\111\115"
 end
 if not _I1lI then return nil, "\115\105\110\95\114\101\115\112\117\101\115\116\97" end
 local _IIlI = _I1lI._lIll or _I1lI._lIII
 if _IIlI == nil then return nil, "\115\105\110\95\100\97\116\111\115" end
 return { _lIII = _IIlI, premium = _I1lI.premium }
end
local function computeTrust(_I1lI)
 local _lIlII     = _I1lI.AccountAgeDays or (63-63)
 local _llIlI  = toNum(_I1lI.Friends)
 local _IlIlI   = toNum(_I1lI.Groups)
 local _lIIlI   = toNum(_I1lI.Badges)
 local _IIIlI     = toNum(_I1lI.Favorites)
 local _l1IlI    = toNum(_I1lI.CreatedGames)
 local _I1IlI = (_I1lI.Verified == "\83\237")
 local _IllI, reasons = _P199x._8x6q(0/134), {}
 local function add(_lllIlI, _IIlIlI) _IllI = _IllI + _lllIlI; reasons[#reasons + _P199x._8x6q(10/10)] = _IIlIlI end
 if _lIlII >= (2043-218) then add((91+-66), "\67\117\101\110\116\97\32\100\101\32\53\43\32\97\241\111\115\32\40\43\50\53\41")
 elseif _lIlII >= (880-150) then add((248-229), "\67\117\101\110\116\97\32\100\101\32\50\43\32\97\241\111\115\32\40\43\49\57\41")
 elseif _lIlII >= _P199x._8x6q(51830/142) then add((179+-166), "\77\225\115\32\100\101\32\49\32\97\241\111\32\40\43\49\51\41")
 elseif _lIlII >= (287+-197)  then add(bit32.bxor(172,0xAB),  "\65\108\103\117\110\111\115\32\109\101\115\101\115\32\40\43\55\41")
 elseif _lIlII >= _P199x._8x6q(5520/184)  then add((130-127),  "\67\117\101\110\116\97\32\114\101\99\105\101\110\116\101\32\40\43\51\41")
 else add(bit32.bxor(171,0xAB), "\67\117\101\110\116\97\32\109\117\121\32\110\117\101\118\97\32\40\43\48\41") end
 local _lIlIlI = (108+-108)
 if _lIIlI >= bit32.bxor(178,0xAB) then _lIlIlI = _lIlIlI + (149+-134)
 elseif _lIIlI >= (4+6) then _lIlIlI = _lIlIlI + bit32.bxor(160,0xAB)
 elseif _lIIlI >= (61+-58) then _lIlIlI = _lIlIlI + (14-7)
 elseif _lIIlI >= (27-26) then _lIlIlI = _lIlIlI + bit32.bxor(168,0xAB) end
 if _l1IlI >= _P199x._8x6q(141/47) then _lIlIlI = _lIlIlI + (116+-106)
 elseif _l1IlI >= bit32.bxor(170,0xAB) then _lIlIlI = _lIlIlI + (246-241) end
 _lIlIlI = _P199x._7ofy(_lIlIlI, (129-104))
 add(_lIlIlI, "\65\99\116\105\118\105\100\97\100\32\98\97\100\103\101\115\47\106\117\101\103\111\115\32\40\43" .. _lIlIlI .. "\41")
 if _llIlI >= (126-76) then add((245+-230), "\77\117\99\104\111\115\32\97\109\105\103\111\115\32\40\43\49\53\41")
 elseif _llIlI >= (123+-113) then add(bit32.bxor(161,0xAB), "\65\109\105\103\111\115\32\110\111\114\109\97\108\101\115\32\40\43\49\48\41")
 elseif _llIlI >= _P199x._8x6q(152/152) then add(_P199x._8x6q(975/195), "\80\111\99\111\115\32\97\109\105\103\111\115\32\40\43\53\41")
 else add((222-222), "\48\32\97\109\105\103\111\115\32\40\43\48\41") end
 if _IlIlI >= (160-155) then add(bit32.bxor(164,0xAB), "\86\97\114\105\111\115\32\103\114\117\112\111\115\32\40\43\49\53\41")
 elseif _IlIlI >= _P199x._8x6q(126/126) then add((232-224), "\65\108\103\250\110\32\103\114\117\112\111\32\40\43\56\41")
 else add((187+-187), "\48\32\103\114\117\112\111\115\32\40\43\48\41") end
 if _IIIlI >= (179+-174) then add((503-498), "\70\97\118\111\114\105\116\111\115\32\40\43\53\41")
 elseif _IIIlI >= (228+-227) then add((99+-97), "\65\108\103\250\110\32\102\97\118\111\114\105\116\111\32\40\43\50\41") end
 if _I1IlI then add((92+-82), "\73\110\115\105\103\110\105\97\32\118\101\114\105\102\105\99\97\100\97\32\40\43\49\48\41") end
 local _llII = (_lIlII >= bit32.bxor(625,0xAB)) and _lIIlI == (223-223) and _IlIlI == bit32.bxor(171,0xAB) and _l1IlI == bit32.bxor(171,0xAB) and _IIIlI == (183+-183)
 if _llII then
 local _IlII = (_llIlI <= bit32.bxor(170,0xAB)) and bit32.bxor(178,0xAB) or bit32.bxor(164,0xAB)
 add(-_IlII, "\67\117\101\110\116\97\32\97\110\116\105\103\117\97\32\115\105\110\32\97\99\116\105\118\105\100\97\100\32\40\45" .. _IlII .. "\41")
 end
 _IllI = _P199x._5x5j(_IllI, bit32.bxor(171,0xAB), bit32.bxor(207,0xAB))
 local _Illl, _IIlI = "\66\97\106\111", C.bad
 if _IllI >= (43+27) then _Illl, _IIlI = "\65\108\116\111", C.good
 elseif _IllI >= bit32.bxor(131,0xAB) then _Illl, _IIlI = "\77\101\100\105\111", C.warn end
 return _IllI, _Illl, _IIlI, reasons
end
local _lllII
local _IllII
local function getMyFriendIds()
 if _IllII then return _IllII end
 local _lIlII = apiGet("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l.UserId .. "\47\102\114\105\101\110\100\115")
 if not _lIlII or not _lIlII._I1lI then return nil end
 _IllII = {}
 for _, f in ipairs(_lIlII._I1lI) do if f._lllI1 then _IllII[f._lllI1] = true end end
 return _IllII
end
local function getMutualFriends(_l1l1)
 if _l1l1 == _l.UserId then return nil end
 local _IIlII  = getMyFriendIds()
 local _l1lII = apiGet("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1 .. "\47\102\114\105\101\110\100\115")
 if not _IIlII or not _l1lII or not _l1lII._I1lI then return nil end
 local _lllllI = {}
 for _, f in ipairs(_l1lII._I1lI) do
 if f._lllI1 and _IIlII[f._lllI1] then _lllllI[#_lllllI + (165-164)] = f._lllI1 end
 end
 if #_lllllI == (295-295) then return {} end
 local _I1lII = _lllII(_lllllI)
 local _llllII = {}
 for _, _lllI1 in ipairs(_lllllI) do
 local m = _I1lII[_lllI1]
 _llllII[#_llllII + (173-172)] = (m and (m._llllllIl or m._lll)) or ("\85\115\117\97\114\105\111\32" .. _lllI1)
 end
 return _llllII
end
local function computeInfluence(_I1lI, _lIII)
 local _IIllII = toNum(_I1lI.Followers)
 local _lIllII = toNum(_I1lI.Following)
 local _IlIlI    = toNum(_I1lI.Groups)
 local _lIIlI    = toNum(_I1lI.Badges)
 local _l1IlI     = toNum(_I1lI.CreatedGames)
 local _lIlII      = _I1lI.AccountAgeDays or (110+-110)
 local _I1IlI  = (_I1lI.Verified == "\83\237")
 local _IllI = (1-1)
 if _IIllII >= _P199x._8x6q(440000/44) then _IllI = _IllI + _P199x._8x6q(3675/105)
 elseif _IIllII >= (3+997) then _IllI = _IllI + bit32.bxor(183,0xAB)
 elseif _IIllII >= _P199x._8x6q(18100/181) then _IllI = _IllI + (194+-176)
 elseif _IIllII >= (520-495) then _IllI = _IllI + _P199x._8x6q(1880/188)
 elseif _IIllII >= bit32.bxor(174,0xAB) then _IllI = _IllI + _P199x._8x6q(728/182) end
 if _IIllII >= _P199x._8x6q(1490/149) then
 local _IIII = _IIllII / math._lllIIl(_lIllII, (375-374))
 if _IIII >= (497-492) then _IllI = _IllI + _P199x._8x6q(2244/187)
 elseif _IIII >= (227-225) then _IllI = _IllI + bit32.bxor(163,0xAB)
 elseif _IIII >= bit32.bxor(170,0xAB) then _IllI = _IllI + (163-159) end
 end
 if _I1IlI then _IllI = _IllI + bit32.bxor(164,0xAB) end
 if _l1IlI >= (116+-111) then _IllI = _IllI + (189-177)
 elseif _l1IlI >= (334-333) then _IllI = _IllI + _P199x._8x6q(378/63) end
 if _IlIlI >= (486-476) then _IllI = _IllI + _P199x._8x6q(296/37) elseif _IlIlI >= _P199x._8x6q(594/198) then _IllI = _IllI + (256-252) end
 if _lIIlI >= _P199x._8x6q(7050/141) then _IllI = _IllI + (44+-36) elseif _lIIlI >= bit32.bxor(161,0xAB) then _IllI = _IllI + (168+-164) end
 if _lIII and _lIII > _P199x._8x6q(0/135) then
 if _lIII >= 1000000 then _IllI = _IllI + (225+-215)
 elseif _lIII >= 100000 then _IllI = _IllI + (356-349)
 elseif _lIII >= bit32.bxor(10171,0xAB) then _IllI = _IllI + (112+-108)
 elseif _lIII >= (1422-422) then _IllI = _IllI + (103+-101) end
 end
 if _lIlII >= (1949-124) then _IllI = _IllI + bit32.bxor(174,0xAB) elseif _lIlII >= (460-95) then _IllI = _IllI + (67+-65) end
 _IllI = _P199x._5x5j(_IllI, _P199x._8x6q(0/87), (112+-12))
 local _llIII, _IIlI = "\77\117\121\32\66\97\106\111", C.subtext
 if _IllI >= (122+-47) then _llIII, _IIlI = "\77\117\121\32\65\108\116\111", C.good
 elseif _IllI >= bit32.bxor(153,0xAB) then _llIII, _IIlI = "\65\108\116\111", C.good
 elseif _IllI >= (343-313) then _llIII, _IIlI = "\77\101\100\105\111", C.warn
 elseif _IllI >= (292+-277) then _llIII, _IIlI = "\66\97\106\111", C.warn end
 return _IllI, _llIII, _IIlI
end
local function computeAltRisk(_I1lI)
 local _lIlII     = _I1lI.AccountAgeDays or (460-460)
 local _llIlI  = toNum(_I1lI.Friends)
 local _IIllII= toNum(_I1lI.Followers)
 local _lIllII= toNum(_I1lI.Following)
 local _IlIlI   = toNum(_I1lI.Groups)
 local _IIIlI     = toNum(_I1lI.Favorites)
 local _lIIlI   = toNum(_I1lI.Badges)
 local _l1IlI    = toNum(_I1lI.CreatedGames)
 local _I1IlI = (_I1lI.Verified == "\83\237")
 local _IlIII  = _I1lI.Description and _I1lI.Description ~= "" and _I1lI.Description ~= "\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110"
 local _lIIII = (_P199x._iy38(_I1lI._namesCached) == "\116\97\98\108\101") and #_I1lI._namesCached or nil
 local _IIIII = (_P199x._iy38(_I1lI._itemsCached) == "\116\97\98\108\101") and #_I1lI._itemsCached or nil
 local _l1III = {}
 local function note(t) _l1III[#_l1III + bit32.bxor(170,0xAB)] = t end
 local _I1III
 if _lIlII <= (489-486) then _I1III = _P199x._8x6q(3600/36); note("\67\117\101\110\116\97\32\100\101\32" .. _lIlII .. "\32\100\237\97\40\115\41")
 elseif _lIlII <= (125-118) then _I1III = (427-335); note("\67\117\101\110\116\97\32\100\101\32\109\101\110\111\115\32\100\101\32\49\32\115\101\109\97\110\97")
 elseif _lIlII <= (216+-202) then _I1III = _P199x._8x6q(10414/127); note("\67\117\101\110\116\97\32\100\101\32\109\101\110\111\115\32\100\101\32\50\32\115\101\109\97\110\97\115")
 elseif _lIlII <= _P199x._8x6q(5550/185) then _I1III = bit32.bxor(233,0xAB); note("\67\117\101\110\116\97\32\100\101\32\109\101\110\111\115\32\100\101\32\49\32\109\101\115")
 elseif _lIlII <= _P199x._8x6q(1260/14) then _I1III = (336-290); note("\67\117\101\110\116\97\32\100\101\32\112\111\99\111\115\32\109\101\115\101\115")
 elseif _lIlII <= bit32.bxor(31,0xAB) then _I1III = _P199x._8x6q(5580/186)
 elseif _lIlII <= (258+107) then _I1III = (6+12)
 elseif _lIlII <= (909-179) then _I1III = (456-448)
 elseif _lIlII <= bit32.bxor(1930,0xAB) then _I1III = (49-46)
 else _I1III = _P199x._8x6q(0/90) end
 local _lIlIlI = (137+-137)
 if _lIIlI >= bit32.bxor(153,0xAB) then _lIlIlI = _lIlIlI + _P199x._8x6q(608/152) elseif _lIIlI >= bit32.bxor(164,0xAB) then _lIlIlI = _lIlIlI + _P199x._8x6q(537/179)
 elseif _lIIlI >= _P199x._8x6q(435/87) then _lIlIlI = _lIlIlI + bit32.bxor(169,0xAB) elseif _lIIlI >= _P199x._8x6q(44/44) then _lIlIlI = _lIlIlI + bit32.bxor(170,0xAB) end
 if _l1IlI >= (79+-78) then _lIlIlI = _lIlIlI + _P199x._8x6q(50/25) end
 if _IIIlI >= _P199x._8x6q(910/91) then _lIlIlI = _lIlIlI + (218+-216) elseif _IIIlI >= (18-17) then _lIlIlI = _lIlIlI + (75+-74) end
 if _IlIlI >= _P199x._8x6q(430/86) then _lIlIlI = _lIlIlI + (249-247) elseif _IlIlI >= _P199x._8x6q(32/32) then _lIlIlI = _lIlIlI + (408-407) end
 _lIlIlI = _P199x._7ofy(_lIlIlI, bit32.bxor(163,0xAB))
 local _lllIII = _P199x._5x5j(bit32.bxor(207,0xAB) - _lIlIlI * 12.5, _P199x._8x6q(0/27), bit32.bxor(207,0xAB))
 if _lIIlI == bit32.bxor(171,0xAB) then note("\83\105\110\32\98\97\100\103\101\115") end
 if _IlIlI == (300+-300) then note("\48\32\103\114\117\112\111\115") end
 if _IIIlI == (254-254) then note("\48\32\102\97\118\111\114\105\116\111\115") end
 if _l1IlI == (21-21) then note("\83\105\110\32\101\120\112\101\114\105\101\110\99\105\97\115\32\99\114\101\97\100\97\115") end
 local _IIlIII = (264+-264)
 if _llIlI >= bit32.bxor(153,0xAB) then _IIlIII = _IIlIII + bit32.bxor(168,0xAB) elseif _llIlI >= bit32.bxor(191,0xAB) then _IIlIII = _IIlIII + 2.5
 elseif _llIlI >= _P199x._8x6q(1410/141) then _IIlIII = _IIlIII + (240+-238) elseif _llIlI >= _P199x._8x6q(330/110) then _IIlIII = _IIlIII + _P199x._8x6q(96/96)
 elseif _llIlI >= (118+-117) then _IIlIII = _IIlIII + 0.5 end
 if _IIllII >= bit32.bxor(207,0xAB) then _IIlIII = _IIlIII + (100+-98) elseif _IIllII >= (16+-6) then _IIlIII = _IIlIII + 1.5
 elseif _IIllII >= _P199x._8x6q(158/158) then _IIlIII = _IIlIII + 0.5 end
 _IIlIII = _P199x._7ofy(_IIlIII, bit32.bxor(174,0xAB))
 local _lIlIII = _P199x._5x5j(bit32.bxor(207,0xAB) - _IIlIII * _P199x._8x6q(260/13), (287-287), (158+-58))
 if _llIlI == (142-142) then note("\48\32\97\109\105\103\111\115")
 elseif _llIlI <= (188-187) then note(_llIlI .. "\32\97\109\105\103\111") end
 if _IIllII == (101+-101) then note("\48\32\115\101\103\117\105\100\111\114\101\115") end
 if _lIllII >= (293+-263) and _IIllII == bit32.bxor(171,0xAB) then note("\83\105\103\117\101\32\97\32\109\117\99\104\111\115\32\112\101\114\111\32\115\105\110\32\115\101\103\117\105\100\111\114\101\115") end
 local _ll1I, profMax = bit32.bxor(171,0xAB), 2.5
 if _IlIII then _ll1I = _ll1I + 1.5 else note("\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110") end
 if _IIIII ~= nil then
 if _IIIII >= (448-447) then _ll1I = _ll1I + (486-485) else note("\65\118\97\116\97\114\32\115\105\110\32\105\116\101\109\115\32\101\113\117\105\112\97\100\111\115") end
 else
 _ll1I = _ll1I + 0.5
 end
 local _Il1I = _P199x._5x5j((306-206) - (_ll1I / profMax) * (118+-18), (234+-234), (181-81))
 local _lll1I = _I1IlI and bit32.bxor(171,0xAB) or (135-95)
 if _I1IlI then note("\73\110\115\105\103\110\105\97\32\118\101\114\105\102\105\99\97\100\97\32\40\97\116\101\110\250\97\41") end
 local _Ill1I
 if _lIIII == nil then _Ill1I = (116-66)
 elseif _lIIII >= (182-181) then _Ill1I = _P199x._8x6q(930/93)
 else _Ill1I = bit32.bxor(234,0xAB); note("\83\105\110\32\110\111\109\98\114\101\115\32\97\110\116\101\114\105\111\114\101\115") end
 local _II = _I1III * 0.25 + _lllIII * 0.25 + _lIlIII * 0.20
 + _Il1I * 0.15 + _lll1I * 0.10 + _Ill1I * 0.05
 local _IllI = _P199x._5x5j(_P199x._8x6q(_II + 0.5), bit32.bxor(171,0xAB), _P199x._8x6q(15200/152))
 local _llIII, _IIlI = "\77\117\121\32\66\97\106\111", C.good
 if _IllI >= (578-497) then _llIII, _IIlI = "\77\117\121\32\65\108\116\111", C.bad
 elseif _IllI >= bit32.bxor(150,0xAB) then _llIII, _IIlI = "\65\108\116\111", C.bad
 elseif _IllI >= bit32.bxor(130,0xAB) then _llIII, _IIlI = "\77\101\100\105\111", C.warn
 elseif _IllI >= (280-259) then _llIII, _IIlI = "\66\97\106\111", C.good end
 local _lIl1I = {
 { "\65\110\116\105\103\252\101\100\97\100", _P199x._8x6q(_I1III + 0.5), bit32.bxor(178,0xAB) },
 { "\65\99\116\105\118\105\100\97\100", _P199x._8x6q(_lllIII + 0.5), bit32.bxor(178,0xAB) },
 { "\82\101\100\32\115\111\99\105\97\108", _P199x._8x6q(_lIlIII + 0.5), bit32.bxor(191,0xAB) },
 { "\80\101\114\102\105\108", _P199x._8x6q(_Il1I + 0.5), bit32.bxor(164,0xAB) },
 { "\86\101\114\105\102\105\99\97\99\105\243\110", _P199x._8x6q(_lll1I + 0.5), _P199x._8x6q(180/18) },
 { "\72\105\115\116\111\114\105\97\108", _P199x._8x6q(_Ill1I + 0.5), _P199x._8x6q(20/4) },
 }
 return _IllI, _llIII, _IIlI, _l1III, _lIl1I
end
local function computeActivity(_I1lI)
 local _lIIlI  = toNum(_I1lI.Badges)
 local _l1IlI   = toNum(_I1lI.CreatedGames)
 local _IIIlI    = toNum(_I1lI.Favorites)
 local _IlIlI  = toNum(_I1lI.Groups)
 local _IIl1I = (_I1lI.PresenceType == (416-414))
 local _IllI = _P199x._8x6q(0/8)
 if _lIIlI >= bit32.bxor(153,0xAB) then _IllI = _IllI + _P199x._8x6q(735/21)
 elseif _lIIlI >= _P199x._8x6q(2895/193) then _IllI = _IllI + bit32.bxor(178,0xAB)
 elseif _lIIlI >= (132+-127) then _IllI = _IllI + (196+-181)
 elseif _lIIlI >= _P199x._8x6q(4/4) then _IllI = _IllI + (157+-151) end
 if _l1IlI >= (278+-277) then _IllI = _IllI + bit32.bxor(164,0xAB) end
 if _IIIlI >= (398-388) then _IllI = _IllI + bit32.bxor(164,0xAB) elseif _IIIlI >= (213-212) then _IllI = _IllI + bit32.bxor(172,0xAB) end
 if _IlIlI >= (113-108) then _IllI = _IllI + _P199x._8x6q(2370/158) elseif _IlIlI >= (25+-24) then _IllI = _IllI + (38+-31) end
 if _IIl1I then _IllI = _IllI + (178+-158) end
 _IllI = _P199x._5x5j(_IllI, (276+-276), (208+-108))
 local _llIII, _IIlI = "\73\110\97\99\116\105\118\97", C.subtext
 if _IllI >= bit32.bxor(237,0xAB) then _llIII, _IIlI = "\77\117\121\32\65\99\116\105\118\97", C.good
 elseif _IllI >= _P199x._8x6q(180/4) then _llIII, _IIlI = "\65\99\116\105\118\97", C.good
 elseif _IllI >= bit32.bxor(191,0xAB) then _llIII, _IIlI = "\77\111\100\101\114\97\100\97", C.warn end
 return _IllI, _llIII, _IIlI
end
local function buildSummary(_I1lI, _I1l1I, _llll1I, _IIll1I, _lIll1I, _lI1I, _II1I, _llI1I)
 local s = {}
 local _l1l1I  = _I1lI.AccountAgeYears or bit32.bxor(171,0xAB)
 local _lIlII = _I1lI.AccountAgeDays or _P199x._8x6q(0/193)
 s[#s+(139-138)] = _P199x._opmi("\67\117\101\110\116\97\32\100\101\32\126\37\46\49\102\32\97\241\111\115\32\40\37\100\32\100\237\97\115\41\46", _l1l1I, _lIlII)
 s[#s+bit32.bxor(170,0xAB)] = _P199x._opmi("\65\99\116\105\118\105\100\97\100\32\37\115\59\32\99\111\110\102\105\97\110\122\97\32\37\115\32\40\37\100\47\49\48\48\41\46", _llI1I, _llll1I, _I1l1I)
 s[#s+_P199x._8x6q(121/121)] = _P199x._opmi("\82\105\101\115\103\111\32\100\101\32\97\108\116\32\37\115\32\40\37\100\47\49\48\48\41\46", _lIll1I, _IIll1I)
 s[#s+(303-302)] = _P199x._opmi("\73\110\102\108\117\101\110\99\105\97\32\37\115\32\40\37\100\47\49\48\48\41\46", _II1I, _lI1I)
 if _I1lI.Verified == "\83\237" then s[#s+(142+-141)] = "\84\105\101\110\101\32\105\110\115\105\103\110\105\97\32\118\101\114\105\102\105\99\97\100\97\46" end
 if _lIlII >= (1206-476) and toNum(_I1lI.Badges) == _P199x._8x6q(0/67) and toNum(_I1lI.Groups) == bit32.bxor(171,0xAB) then
 s[#s+(190-189)] = "\65\116\101\110\99\105\243\110\58\32\99\117\101\110\116\97\32\97\110\116\105\103\117\97\32\99\111\110\32\109\117\121\32\112\111\99\97\32\97\99\116\105\118\105\100\97\100\32\40\112\111\115\105\98\108\101\32\99\117\101\110\116\97\32\99\111\109\112\114\97\100\97\32\111\32\97\98\97\110\100\111\110\97\100\97\41\46"
 end
 if _IIll1I >= (8+52) then
 s[#s+_P199x._8x6q(96/96)] = "\69\108\32\112\101\114\102\105\108\32\101\110\99\97\106\97\32\99\111\110\32\112\97\116\114\111\110\101\115\32\100\101\32\99\117\101\110\116\97\32\115\101\99\117\110\100\97\114\105\97\47\97\108\116\46"
 elseif _IIll1I < bit32.bxor(191,0xAB) then
 s[#s+_P199x._8x6q(4/4)] = "\78\111\32\109\117\101\115\116\114\97\32\112\97\116\114\111\110\101\115\32\116\237\112\105\99\111\115\32\100\101\32\97\108\116\46"
 end
 return _P199x._oy4i(s, "\32")
end
local function getNameHistory(_l1l1)
 local _IlI1I = {}
 local _lII1I = nil
 local _III1I = bit32.bxor(161,0xAB)
 local _l1I1I = (53+-53)
do local _cfq1ca=1 while _cfq1ca>0 do if _cfq1ca==1 then
 local _I1I1I = false
 repeat
 local _IlII = "\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1 .. "\47\117\115\101\114\110\97\109\101\45\104\105\115\116\111\114\121\63\108\105\109\105\116\61\49\48\48"
_cfq1ca=0 end end end
 if _lII1I then _IlII = _IlII .. "\38\99\117\114\115\111\114\61" .. _lII1I end
 local _I1lI = apiGet(_IlII)
 if not _I1lI then break end
 if _I1lI._I1lI then
 for _, _lIl in ipairs(_I1lI._I1lI) do
 _P199x._l50o(_IlI1I, _lIl._lll)
 end
 end
 _lII1I = _I1lI.nextPageCursor
 _l1I1I = _l1I1I + (216-215)
 until (not _lII1I) or _l1I1I >= _III1I
 if _lII1I and _lII1I ~= "" and _l1I1I >= _III1I then _I1I1I = true end
 local _lllI1I, unique = {}, {}
 for _, _lll in ipairs(_IlI1I) do
 if not _lllI1I[_lll] then
 _lllI1I[_lll] = true
 _P199x._l50o(unique, _lll)
 end
 end
 return unique, _I1I1I
end
local _IIlI1I      = {}
local _lIlI1I = {}
local function setCached(_l1l1, _I1lI)
 if not _IIlI1I[_l1l1] then
 _P199x._l50o(_lIlI1I, _l1l1)
 if #_lIlI1I > _P199x._8x6q(3280/164) then
 local _lllII = _P199x._otn1(_lIlI1I, bit32.bxor(170,0xAB))
 _IIlI1I[_lllII] = nil
 end
 end
 _IIlI1I[_l1l1] = _I1lI
end
local function gatherData(_l1l1)
 _lIIIl.begin(_l1l1)
 local _llllI = apiGet("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1)
 if _P199x._iy38(_llllI) ~= "\116\97\98\108\101" then
 _lIIIl.mark("\85\115\101\114\73\100", "\109\105\115\115\105\110\103", "\101\108\32\112\101\114\102\105\108\32\110\111\32\114\101\115\112\111\110\100\105\243")
 _lIIIl.finish()
 return nil, "\115\105\110\95\114\101\115\112\117\101\115\116\97"
 end
 local _IlllI       = _lIIIl.check("\85\115\101\114\73\100",   _llllI._lllI1 or _l1l1,      _lIIIl.valid._l1l1)
 local _lllllI     = _lIIIl.check("\85\115\101\114\110\97\109\101", _llllI._lll,              _lIIIl.valid._l1llIl)
 local _IllllI  = _lIIIl.check("\67\114\101\97\116\101\100",  _llllI._llllI,           _lIIIl.valid.isoDate)
 local _lIlllI  = _lIIIl.check("\68\105\115\112\108\97\121\78\97\109\101", _llllI._llllllIl or _llllI._lll, _lIIIl.valid._llllllIl)
 local _IIlllI     = _lIIIl.check("\68\101\115\99\114\105\112\116\105\111\110", _llllI.description or "",
 function(v) return _lIIIl.valid._lIl(v, _P199x._8x6q(188000/47)) end)
 if _IlllI == nil or _lllllI == nil then
 _lIIIl.finish()
 return nil, "\112\101\114\102\105\108\95\105\110\118\97\108\105\100\111"
 end
 local _l1lllI, accountAge, accountAgeDays, accountAgeYears = formatAge(_IllllI)
 local _I1lllI = {}
 local _lIllll = (91-83)
 local function task_fetch(_lIlI1, _I1I)
 task.spawn(function()
 local _l1, _lIll = pcall(_I1I)
 _I1lllI[_lIlI1] = _l1 and _lIll or nil
 _lIllll = _lIllll - _P199x._8x6q(129/129)
 end)
 end
 task_fetch("\70\114\105\101\110\100\115",      function() return simpleCount("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1 .. "\47\102\114\105\101\110\100\115\47\99\111\117\110\116", "\99\111\117\110\116") end)
 task_fetch("\70\111\108\108\111\119\101\114\115",    function() return simpleCount("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1 .. "\47\102\111\108\108\111\119\101\114\115\47\99\111\117\110\116", "\99\111\117\110\116") end)
 task_fetch("\70\111\108\108\111\119\105\110\103",    function() return simpleCount("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1 .. "\47\102\111\108\108\111\119\105\110\103\115\47\99\111\117\110\116", "\99\111\117\110\116") end)
 task_fetch("\71\114\111\117\112\115",       function() return countPaged("\104\116\116\112\115\58\47\47\103\114\111\117\112\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1 .. "\47\103\114\111\117\112\115\47\114\111\108\101\115") end)
 task_fetch("\66\97\100\103\101\115",       function() return countPaged("\104\116\116\112\115\58\47\47\98\97\100\103\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1 .. "\47\98\97\100\103\101\115") end)
 task_fetch("\70\97\118\111\114\105\116\101\115",    function() return countPaged("\104\116\116\112\115\58\47\47\103\97\109\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\50\47\117\115\101\114\115\47" .. _l1l1 .. "\47\102\97\118\111\114\105\116\101\47\103\97\109\101\115", bit32.bxor(153,0xAB)) end)
 task_fetch("\67\114\101\97\116\101\100\71\97\109\101\115", function() return countPaged("\104\116\116\112\115\58\47\47\103\97\109\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\50\47\117\115\101\114\115\47" .. _l1l1 .. "\47\103\97\109\101\115", bit32.bxor(153,0xAB)) end)
 task_fetch("\80\114\111\102\105\108\101\65\112\105", function()
 local _IIlllI = apiPost("\104\116\116\112\115\58\47\47\97\112\105\115\46\114\111\98\108\111\120\46\99\111\109\47\117\115\101\114\45\112\114\111\102\105\108\101\45\97\112\105\47\118\49\47\117\115\101\114\47\112\114\111\102\105\108\101\115\47\103\101\116\45\112\114\111\102\105\108\101\115", {
 userIds = { _l1l1 },
 fields  = { "\110\97\109\101\115\46\117\115\101\114\110\97\109\101", "\110\97\109\101\115\46\100\105\115\112\108\97\121\78\97\109\101", "\110\97\109\101\115\46\99\111\109\98\105\110\101\100\78\97\109\101", "\105\115\86\101\114\105\102\105\101\100", "\105\115\68\101\108\101\116\101\100" },
 })
 if _P199x._iy38(_IIlllI) ~= "\116\97\98\108\101" or _P199x._iy38(_IIlllI.profileDetails) ~= "\116\97\98\108\101" then return nil end
 local d = _IIlllI.profileDetails[(162-161)]
 if _P199x._iy38(d) ~= "\116\97\98\108\101" then return nil end
 return d
 end)
 local _llllllI = os.clock()
 while _lIllll > _P199x._8x6q(0/170) and (os.clock() - _llllllI) < _P199x._8x6q(795/53) do
 task.wait(0.05)
 end
 local _IIllllI = (_lIllll > _P199x._8x6q(0/91))
 local _lIllllI, presColor, presPlaceId, presGameId, presType = getPresence(_l1l1)
do local _sef4=type(nil);if _d0v7~="nil"then error("")end end
 local _lIIlI   = _lIIIl.check("\70\114\105\101\110\100\115",      _I1lllI.Friends,      _lIIIl.valid.count)
 local _IIIlI = _lIIIl.check("\70\111\108\108\111\119\101\114\115",    _I1lllI.Followers,    _lIIIl.valid.count)
 local _llIIlI = _lIIIl.check("\70\111\108\108\111\119\105\110\103",    _I1lllI.Following,    _lIIIl.valid.count)
 local _IlIIlI    = _lIIIl.check("\71\114\111\117\112\115",       _I1lllI.Groups,       _lIIIl.valid.count)
 local _lIIIlI    = _lIIIl.check("\66\97\100\103\101\115",       _I1lllI.Badges,       _lIIIl.valid.count)
 local _IIIIlI = _lIIIl.check("\70\97\118\111\114\105\116\101\115",    _I1lllI.Favorites,    _lIIIl.valid.count)
 local _l1IIlI     = _lIIIl.check("\67\114\101\97\116\101\100\71\97\109\101\115", _I1lllI.CreatedGames, _lIIIl.valid.count)
 local _I1IIlI    = _lIIIl.check("\65\118\97\116\97\114\85\114\108",    getAvatar(_l1l1),    _lIIIl.valid.image)
 local _lllIIlI = _I1lllI.ProfileApi
 local _IIlIIlI = (_P199x._iy38(_lllIIlI) == "\116\97\98\108\101")
 local _lIlIIlI, paVerified, paCombined
 if _IIlIIlI then
 if _P199x._iy38(_lllIIlI.isDeleted)  == "\98\111\111\108\101\97\110" then _lIlIIlI  = _lllIIlI.isDeleted  end
 if _P199x._iy38(_lllIIlI.isVerified) == "\98\111\111\108\101\97\110" then paVerified = _lllIIlI.isVerified end
 if _P199x._iy38(_lllIIlI._lIII) == "\116\97\98\108\101" and _P199x._iy38(_lllIIlI._lIII.combinedName) == "\115\116\114\105\110\103" then
 paCombined = _lllIIlI._lIII.combinedName
 end
 end
 local _llIlI = _lIIIl.finish()
 return {
 IsDeleted      = _lIlIIlI,
 VerifiedApi    = paVerified,
 CombinedName   = paCombined,
 ProfileApiOk   = _IIlIIlI,
 UserId         = _IlllI,
 ProfileUrl     = "\104\116\116\112\115\58\47\47\119\119\119\46\114\111\98\108\111\120\46\99\111\109\47\117\115\101\114\115\47" .. _IlllI .. "\47\112\114\111\102\105\108\101",
 Username       = _lllllI,
 DisplayName    = _lIlllI or _lllllI,
 Description    = (_IIlllI and _IIlllI ~= "" and _IIlllI) or "\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110",
 Banned         = _llllI.isBanned and "\83\237" or "\78\111",
 Verified       = _llllI.hasVerifiedBadge and "\83\237" or "\78\111",
 Created        = _l1lllI or "\78\111\32\100\105\115\112\111\110\105\98\108\101",
 AccountAge     = accountAge or "\78\111\32\100\105\115\112\111\110\105\98\108\101",
 AccountAgeDays  = accountAgeDays or bit32.bxor(171,0xAB),
 AccountAgeYears = accountAgeYears or (108+-108),
 Subscription   = getSubscription(_l1l1),
 Presence       = _lIllllI,
 PresenceColor  = presColor,
 PresencePlace  = presPlaceId,
 PresenceGame   = presGameId,
 PresenceType   = presType,
 AvatarUrl      = _I1IIlI or "\114\98\120\97\115\115\101\116\105\100\58\47\47\48",
 Friends        = _lIIlI,
 Followers      = _IIIlI,
 Following      = _llIIlI,
 Groups         = _IlIIlI,
 Badges         = _lIIIlI,
 Favorites      = _IIIIlI,
 CreatedGames   = _l1IIlI,
 _integrity     = _lIIIl.run,
 _state         = _llIlI,
 _timedOut      = _IIllllI,
 _fetchedAt     = os.time(),
 }
end
local _IlIlI = {}
local _lllIlI = Instance.new("\83\99\114\101\101\110\71\117\105")
_lllIlI.Name = "\85\116\105\108\105\116\121\80\97\110\101\108"
_lllIlI.ResetOnSpawn = false
_lllIlI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_lllIlI.IgnoreGuiInset = true
_lllIlI.DisplayOrder = 2147483
_lllIlI.Parent = _I
task.defer(function()
 pcall(function()
 local _IllIlI = _I.ChildAdded:Connect(function(_lIlIlI)
 if _lIlIlI ~= _lllIlI and _lIlIlI:IsA("\83\99\114\101\101\110\71\117\105") and _lIlIlI.DisplayOrder >= _lllIlI.DisplayOrder then
 _lllIlI.DisplayOrder = _lIlIlI.DisplayOrder + (127-126)
 end
 end)
 _P199x._l50o(_IlIlI, _IllIlI)
 end)
end)
if (_Il.introEnabled ~= false) and (_Il.introSeen ~= true) then
 _lllIlI.Enabled = false
end
local function track(_IllIlI)
 _P199x._l50o(_IlIlI, _IllIlI)
 return _IllIlI
end
local _IIlIlI
local function cleanupAll()
 for _, c in ipairs(_IlIlI) do
 pcall(function() c:Disconnect() end)
 end
 table.clear(_IlIlI)
 _IIlIlI()
 pcall(function() if _G.NXScan and _G.NXScan.stop then _G.NXScan.stop() end end)
 pcall(function() if _G.NXV2 and _G.NXV2.stop then _G.NXV2.stop() end end)
 pcall(function() if _G._llII1 and _G._llII1.Stop then _G._llII1.Stop() end end)
 pcall(function()
 local _lIlI = _I:FindFirstChild("\76\105\115\116\97\74\117\103\97\100\111\114\101\115\77\111\100\101\114\110\97")
 if _lIlI then _lIlI:Destroy() end
 end)
end
track(_lllIlI.AncestryChanged:Connect(function(_, _llll)
 if not _llll then cleanupAll() end
end))
local _l1lIlI = Enum.KeyCode.RightShift
local _I1lIlI = false
local _llllIlI = {}
local function setHidden(h)
 _I1lIlI = h
 _lllIlI.Enabled = not h
 if (not h) and _llllIlI.playOpenAnim then pcall(_llllIlI.playOpenAnim) end
end
track(UserInputService.InputBegan:Connect(function(_Illl, _lllll)
 if _lllll or UserInputService:GetFocusedTextBox() then return end
 if _Illl.KeyCode == _l1lIlI then
 setHidden(not _I1lIlI)
 end
end))
local _IIllIlI = { enabled = (_Il.animations ~= false), infinites = {} }
local function motionTween(_lII, _l1lI, _Illll, _III)
 if _IIllIlI.enabled then
 local _lIllIlI = TweenService:Create(_lII, _l1lI, _Illll)
 _lIllIlI:Play()
 if _III then _lIllIlI.Completed:Once(_III) end
 return _lIllIlI
 end
 for k, v in pairs(_Illll) do pcall(function() _lII[k] = v end) end
 if _III then task.defer(_III) end
 return nil
end
local function registerInfiniteTween(_lIllIlI)
 if _lIllIlI then _P199x._l50o(_IIllIlI.infinites, _lIllIlI) end
 return _lIllIlI
end
_IIlIlI = function()
 for i, _lIllIlI in ipairs(_IIllIlI.infinites) do
 pcall(function() _lIllIlI:Cancel() end)
 _IIllIlI.infinites[i] = nil
 end
 _IIllIlI.infinites = {}
end
local function setAnimationsEnabled(_lllIl)
 _IIllIlI.enabled = _lllIl and true or false
 if not _IIllIlI.enabled then _IIlIlI() end
 if _G._llII1 and _G._llII1.SetAnimationsEnabled then
 pcall(_G._llII1.SetAnimationsEnabled, _IIllIlI.enabled)
 end
end
local function addHoverStroke(_lIlll)
 _lIlll.AutoButtonColor = false
 _lIlll:SetAttribute("\78\88\72\111\118\101\114\68\111\110\101", true)
 local _lIIl = _lIlll:FindFirstChildOfClass("\85\73\83\99\97\108\101") or Instance.new("\85\73\83\99\97\108\101", _lIlll)
 local function to(s, d)
 motionTween(_lIIl, TweenInfo.new(d, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = s })
 end
 _lIlll.MouseButton1Down:Connect(function() to(0.97, 0.07) end)
 _lIlll.MouseButton1Up:Connect(function() to(bit32.bxor(170,0xAB), 0.12) end)
 _lIlll.MouseLeave:Connect(function() _lIIl.Scale = _P199x._8x6q(32/32) end)
end
local function addShineHover(_lIlll)
 local _lIlll = Instance.new("\85\73\83\99\97\108\101", _lIlll)
 _lIlll.Name = "\72\111\118\101\114\83\99\97\108\101"
 local _lIlI = _lIlll:FindFirstChildOfClass("\85\73\83\116\114\111\107\101")
 local _IIlll = _lIlI and _lIlI.Transparency or 0.5
 local _l1lll = _lIlll.BackgroundColor3
 local _I1lll = false
 _lIlll.MouseEnter:Connect(function()
 if not _IIllIlI.enabled then return end
 _I1lll = true
 motionTween(_lIlll, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.045 })
 if _lIlI then
 motionTween(_lIlI, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Transparency = math._lllIIl(_IIlll - 0.35, (172-172)),
 Color = C._IlIll1
 })
 end
 motionTween(_lIlll, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 BackgroundColor3 = Color3.new(
 _P199x._7ofy(_l1lll.R + 0.06, bit32.bxor(170,0xAB)),
 _P199x._7ofy(_l1lll.G + 0.06, (285+-284)),
 _P199x._7ofy(_l1lll.B + 0.06, _P199x._8x6q(168/168)))
 })
 end)
 _lIlll.MouseLeave:Connect(function()
 _I1lll = false
 motionTween(_lIlll, TweenInfo.new(0.30, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Scale = _P199x._8x6q(56/56) })
 if _lIlI then
 motionTween(_lIlI, TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Transparency = _IIlll,
 Color = C._lIlI1
 })
 end
 motionTween(_lIlll, TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 BackgroundColor3 = _l1lll
 })
 end)
 _lIlll.MouseButton1Down:Connect(function()
 motionTween(_lIlll, TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.92 })
 end)
 _lIlll.MouseButton1Up:Connect(function()
 motionTween(_lIlll, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = _I1lll and 1.045 or _P199x._8x6q(174/174) })
 end)
end
local function addDepth(_llllll)
 local _lIlI = Instance.new("\85\73\83\116\114\111\107\101", _llllll)
 _lIlI.Color = C._lIlI1; _lIlI.Transparency = 0.6; _lIlI.Thickness = (368-367)
 themed(_lIlI, "\67\111\108\111\114", "\98\111\114\100\101\114")
 return nil, _lIlI
end
local function addDropShadow(_lIllI, _lllI, _lIllll, _lIll, _IIll)
 _lIll = _lIll or bit32.bxor(177,0xAB)
 local _IIllll = Instance.new("\73\109\97\103\101\76\97\98\101\108")
 _IIllll.Name = "\68\114\111\112\83\104\97\100\111\119"
 _IIllll.Active = false
 _IIllll.BackgroundTransparency = (64+-63)
 _IIllll.Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\51\49\54\48\52\53\50\49\55"
 _IIllll.ImageColor3 = Color3.fromRGB(_P199x._8x6q(0/13), _P199x._8x6q(0/40), _P199x._8x6q(0/111))
 _IIllll.ImageTransparency = _IIll or 0.4
 _IIllll.ScaleType = Enum.ScaleType.Slice
 _IIllll.SliceCenter = Rect.new((164+-154), (106+-96), (541-423), (608-490))
 _IIllll.AnchorPoint = _lIllI.AnchorPoint
 _IIllll.Position = _lIllI.Position
 _IIllll.Size = _lIllI.Size + UDim2.fromOffset(_lIll * (408-406), _lIll * _P199x._8x6q(76/38))
 _IIllll.ZIndex = _lIllll or bit32.bxor(171,0xAB)
 _IIllll.Parent = _lllI
 return _IIllll
end
function _lIIIl.makeSwitch(_lllI, _lllIl, _IIlIl)
 local W, H = (77+-37), (57+-37)
 local _llIll = H - bit32.bxor(175,0xAB)
 local _IlIll = bit32.bxor(175,0xAB)
 local _lIIll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _lllI)
 _lIIll.Size = UDim2.fromOffset(W, H)
 _lIIll.AutoButtonColor = false
 _lIIll.Text = ""
 _lIIll.BorderSizePixel = (284+-284)
 _lIIll.BackgroundColor3 = _lllIl and C.good or C._lIlI1
 Instance.new("\85\73\67\111\114\110\101\114", _lIIll).CornerRadius = UDim.new(_P199x._8x6q(159/159), (62-62))
 local _IIIll = Instance.new("\70\114\97\109\101", _lIIll)
 _IIIll.Size = UDim2.fromOffset(_llIll, _llIll)
 _IIIll.Position = _lllIl and UDim2.new((307-306), -(_llIll + (256+-254)), (95-95), (187-185)) or UDim2.new((210-210), (138+-136), (252+-252), bit32.bxor(169,0xAB))
 _IIIll.BackgroundColor3 = Color3.fromRGB(bit32.bxor(84,0xAB), bit32.bxor(84,0xAB), (215+40))
 _IIIll.BorderSizePixel = (47-47)
 _IIIll.ZIndex = (48-46)
 Instance.new("\85\73\67\111\114\110\101\114", _IIIll).CornerRadius = UDim.new((88-87), (3+-3))
 local _l1Ill = Instance.new("\85\73\83\99\97\108\101", _IIIll)
 _l1Ill.Scale = bit32.bxor(170,0xAB)
 local _llIlI, ocupado = _lllIl, false
 local _I1Ill
 local function pintar(_Illll)
 local _lllIll = ocupado and C.warn or (_llIlI and C.good or C._lIlI1)
 if _Illll and _IIllIlI.enabled then
 motionTween(_lIIll, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundColor3 = _lllIll })
 else
 _lIIll.BackgroundColor3 = _lllIll
 end
 end
 local function setOn(v, _llllll)
 _llIlI = v and true or false
 local _IIlIll = _llIlI and UDim2.new((289-288), -(_llIll + (438-436)), bit32.bxor(171,0xAB), (169-167)) or UDim2.new(_P199x._8x6q(0/132), bit32.bxor(169,0xAB), _P199x._8x6q(0/8), bit32.bxor(169,0xAB))
 if _llllll == false then
 _IIIll.Position = _IIlIll
 _IIIll.Size = UDim2.fromOffset(_llIll, _llIll)
 elseif _IIllIlI.enabled then
 _IIIll.Size = UDim2.fromOffset(_llIll + _IlIll, _llIll)
 motionTween(_IIIll, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = _IIlIll })
 task.delay(0.12, function()
 if _IIIll and _IIIll.Parent then
 motionTween(_IIIll, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(_llIll, _llIll) })
 end
 end)
 else
 _IIIll.Position = _IIlIll
 end
 pintar(_llllll ~= false)
 end
 local function setBusy(b)
 ocupado = b and true or false
 pintar(true)
 if _I1Ill then pcall(function() _I1Ill:Cancel() end); _I1Ill = nil end
 if ocupado and _IIllIlI.enabled then
 _IIIll.BackgroundTransparency = (81+-81)
 _I1Ill = TweenService:Create(_IIIll,
 TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -_P199x._8x6q(103/103), true),
 { BackgroundTransparency = 0.55 })
 _I1Ill:Play()
 registerInfiniteTween(_I1Ill)
 else
 _IIIll.BackgroundTransparency = (120+-120)
 end
 end
 _lIIll.MouseEnter:Connect(function()
 if ocupado then return end
 if _IIllIlI.enabled then
 motionTween(_l1Ill, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1.12 })
 end
 end)
 _lIIll.MouseLeave:Connect(function()
 if _IIllIlI.enabled then
 motionTween(_l1Ill, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = bit32.bxor(170,0xAB) })
 end
 end)
 _lIIll.MouseButton1Down:Connect(function()
 if ocupado then return end
 if _IIllIlI.enabled then
 motionTween(_l1Ill, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.9 })
 end
 end)
 _lIIll.MouseButton1Up:Connect(function()
 if _IIllIlI.enabled then
 motionTween(_l1Ill, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = bit32.bxor(170,0xAB) })
 end
 end)
 _lIIll.MouseButton1Click:Connect(function()
 if ocupado then return end
 setOn(not _llIlI)
 if _IIlIl then _IIlIl(_llIlI) end
 end)
 onRepaint(pintar)
 return _lIIll, setOn, setBusy
end
_G.NXDS._makeSwitch = _lIIIl.makeSwitch
local _lIlIll, MIN_H = (646-226), bit32.bxor(451,0xAB)
local _lllll = Instance.new("\70\114\97\109\101")
_lllll.Name = "\109\97\105\110"
_lllll.Size = UDim2.new((124+-124), _P199x._8x6q(39680/64), (39+-39), _P199x._8x6q(29500/59))
_lllll.Position = UDim2.new(0.5, -_P199x._8x6q(38440/124), 0.5, -_P199x._8x6q(40750/163))
_lllll.BackgroundColor3 = C.bg
_lllll.BackgroundTransparency = 0.02
_lllll.BorderSizePixel = (39+-39)
_lllll.Active = true
_lllll.ClipsDescendants = true
_lllll.Parent = _lllIlI
Instance.new("\85\73\67\111\114\110\101\114", _lllll).CornerRadius = UDim.new(_P199x._8x6q(0/91), (140+-128))
themed(_lllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\103")
local _Illlll = Instance.new("\85\73\83\116\114\111\107\101", _lllll)
_Illlll.Color = C._lIlI1
_Illlll.Transparency = 0.5
_Illlll.Thickness = (207+-206)
themed(_Illlll, "\67\111\108\111\114", "\98\111\114\100\101\114")
local _lIllll = Instance.new("\73\109\97\103\101\76\97\98\101\108")
_lIllll.Name = "\87\105\110\100\111\119\83\104\97\100\111\119"
_lIllll.Active = false
_lIllll.BackgroundTransparency = (89+-88)
_lIllll.Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\54\48\49\52\50\54\49\57\57\51"
_lIllll.ImageColor3 = Color3.fromRGB(_P199x._8x6q(0/150), _P199x._8x6q(0/21), bit32.bxor(171,0xAB))
_lIllll.ImageTransparency = 0.6
_lIllll.ScaleType = Enum.ScaleType.Slice
_lIllll.SliceCenter = Rect.new(bit32.bxor(154,0xAB), bit32.bxor(154,0xAB), _P199x._8x6q(62100/138), (93+357))
_lIllll.ZIndex = _P199x._8x6q(0/149)
_lIllll.Parent = _lllIlI
local function syncWindowShadow()
 _lIllll.Size = _lllll.Size + UDim2.fromOffset((119-91), bit32.bxor(183,0xAB))
 _lIllll.Position = _lllll.Position - UDim2.fromOffset(bit32.bxor(165,0xAB), _P199x._8x6q(504/36))
end
syncWindowShadow()
track(_lllll:GetPropertyChangedSignal("\83\105\122\101"):Connect(syncWindowShadow))
track(_lllll:GetPropertyChangedSignal("\80\111\115\105\116\105\111\110"):Connect(syncWindowShadow))
local _IIllll = Instance.new("\70\114\97\109\101", _lllll)
_IIllll.Size = UDim2.new(bit32.bxor(170,0xAB), bit32.bxor(171,0xAB), _P199x._8x6q(0/56), (124-88))
_IIllll.BackgroundColor3 = C.headerBg
_IIllll.BackgroundTransparency = _P199x._8x6q(0/157)
_IIllll.BorderSizePixel = bit32.bxor(171,0xAB)
themed(_IIllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\104\101\97\100\101\114\66\103")
local _l1llll = Instance.new("\70\114\97\109\101", _lllll)
_l1llll.Size = UDim2.new(bit32.bxor(170,0xAB), (7-7), (362-362), (352-351))
_l1llll.Position = UDim2.new(bit32.bxor(171,0xAB), (187+-187), _P199x._8x6q(0/12), _P199x._8x6q(1764/49))
_l1llll.BackgroundColor3 = C._I1IIIl
_l1llll.BackgroundTransparency = 0.4
_l1llll.BorderSizePixel = (492-492)
themed(_l1llll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\100\105\118\105\100\101\114")
local _I1llll = Instance.new("\84\101\120\116\76\97\98\101\108", _IIllll)
_I1llll.Size = UDim2.new((289-288), -(255+-155), bit32.bxor(170,0xAB), _P199x._8x6q(0/89))
_I1llll.Position = UDim2.new((274-274), (464-408), (499-499), _P199x._8x6q(0/131))
_I1llll.BackgroundTransparency = (160+-159)
_I1llll.Font = Enum.Font.GothamBold
_I1llll.Text = "\82\111\98\108\111\120\32\80\114\111\102\105\108\101\32\65\110\97\108\121\122\101\114"
_I1llll.TextColor3 = C._lIl
_I1llll.TextSize = bit32.bxor(164,0xAB)
_I1llll.TextXAlignment = Enum.TextXAlignment.Left
_I1llll.TextTruncate = Enum.TextTruncate.AtEnd
themed(_I1llll, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
do
local _lllllll = _I1llll:Clone()
_lllllll.Name = "\84\105\116\108\101\83\104\105\110\101"
_lllllll.TextColor3 = Color3.fromRGB(bit32.bxor(84,0xAB), bit32.bxor(84,0xAB), _P199x._8x6q(29070/114))
_lllllll.TextTransparency = 0.4
_lllllll.ZIndex = _I1llll.ZIndex + (384-383)
_lllllll.Parent = _I1llll.Parent
local _IIlllll = Instance.new("\85\73\71\114\97\100\105\101\110\116", _lllllll)
_IIlllll.Rotation = _P199x._8x6q(2484/138)
_IIlllll.Transparency = NumberSequence.new({
 NumberSequenceKeypoint.new(0.00, _P199x._8x6q(23/23)),
 NumberSequenceKeypoint.new(0.44, (261+-260)),
 NumberSequenceKeypoint.new(0.50, 0.15),
 NumberSequenceKeypoint.new(0.56, (187+-186)),
 NumberSequenceKeypoint.new(1.00, _P199x._8x6q(50/50)),
})
local function syncShine()
 _lllllll.Size = _I1llll.Size
 _lllllll.Position = _I1llll.Position
 _lllllll.TextXAlignment = _I1llll.TextXAlignment
end
syncShine()
track(_I1llll:GetPropertyChangedSignal("\83\105\122\101"):Connect(syncShine))
track(_I1llll:GetPropertyChangedSignal("\80\111\115\105\116\105\111\110"):Connect(syncShine))
if _IIllIlI.enabled then
 _IIlllll.Offset = Vector2.new(-(205+-204), (331-331))
 local _lIlllll = TweenService:Create(_IIlllll,
 TweenInfo.new(2.0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -_P199x._8x6q(45/45), false, 2.0),
 { Offset = Vector2.new((450-449), _P199x._8x6q(0/28)) })
 _lIlllll:Play()
 registerInfiniteTween(_lIlllll)
else
 _IIlllll.Offset = Vector2.new((234+-232), _P199x._8x6q(0/5))
end
end
do
 local _lIlll = Instance.new("\85\73\83\99\97\108\101", _lllll)
 _lIlll.Scale = (98+-97)
 local _IIlll, prevSize, prevPos = false, nil, nil
 local _llIlll, savedCollapseSize = false, nil
 function _llllIlI.playOpenAnim()
 if not _IIllIlI.enabled then
 _lIlll.Scale = bit32.bxor(170,0xAB)
 _lIllll.ImageTransparency = 0.6
 return
 end
 _lIlll.Scale = 0.94
 _lIllll.ImageTransparency = 0.6
 motionTween(_lIlll, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = _P199x._8x6q(64/64) })
 end
 function _llllIlI.setDragSquish(_lllIl)
 if not _IIllIlI.enabled then return end
 if _lllIl then
 motionTween(_lIlll, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.985 })
 else
 motionTween(_lIlll, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = (102+-101) })
 end
 end
 function _llllIlI.animatedClose()
 if not _IIllIlI.enabled then _lllIlI:Destroy(); return end
 motionTween(_lIllll, TweenInfo.new(0.18), { ImageTransparency = bit32.bxor(170,0xAB) })
 motionTween(_lIlll, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.02 }, function()
 _lllIlI:Destroy()
 end)
 end
 function _llllIlI.toggleCollapse()
 if _llIlll then
 _llIlll = false
 motionTween(_lllll, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = savedCollapseSize or _lllll.Size })
 else
 savedCollapseSize = _lllll.Size
 _llIlll = true
 motionTween(_lllll, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
 { Size = UDim2.new(_lllll.Size.X.Scale, _lllll.Size.X.Offset, _P199x._8x6q(0/163), _P199x._8x6q(576/16)) })
 end
 end
 function _llllIlI.toggleMaximize()
 local _IlIlll, _Ill1ll
 if _IIlll then
 _IlIlll = prevSize or _lllll.Size
 _Ill1ll  = prevPos  or _lllll.Position
 _IIlll = false
 else
 prevSize = (_llIlll and savedCollapseSize) or _lllll.Size
 prevPos  = _lllll.Position
 local _lIIlll = workspace.CurrentCamera
 local _IIIlll = (_lIIlll and _lIIlll.ViewportSize) or Vector2.new(bit32.bxor(1451,0xAB), _P199x._8x6q(82800/115))
 local w = math._lllIIl(_lIlIll, _P199x._8x6q(_IIIlll.X * 0.9))
 local h = math._lllIIl(MIN_H, _P199x._8x6q(_IIIlll.Y * 0.9))
 _IlIlll = UDim2.new(bit32.bxor(171,0xAB), w, _P199x._8x6q(0/90), h)
 _Ill1ll  = UDim2.new(0.5, -w/(496-494), 0.5, -h/(475-473))
 _IIlll = true
 end
 _llIlll = false
 motionTween(_lllll, TweenInfo.new(0.34, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = _IlIlll, Position = _Ill1ll })
 end
end
_llllIlI.playOpenAnim()
local function makeTrafficLight(x, _IIlI)
 local b = Instance.new("\70\114\97\109\101", _IIllll)
 b.Size = UDim2.new((222+-222), bit32.bxor(161,0xAB), (16-16), (399-389))
 b.Position = UDim2.new(bit32.bxor(171,0xAB), x, 0.5, -_P199x._8x6q(840/168))
 b.BackgroundColor3 = _IIlI
 b.BorderSizePixel = (212-212)
 b.ZIndex = _P199x._8x6q(192/64)
do local _cfscgy=1 while _cfscgy>0 do if _cfscgy==1 then
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new(_P199x._8x6q(174/174), (39-39))
do local _wgds=bit32.bxor(0xFF,0xFF);if _haqg~=0 then error("")end end
 return b
end
_cfscgy=0 end end end
makeTrafficLight(_P199x._8x6q(322/23), Color3.fromRGB((215+40), _P199x._8x6q(665/7), (565-479)))
makeTrafficLight(bit32.bxor(181,0xAB), Color3.fromRGB(bit32.bxor(84,0xAB), bit32.bxor(22,0xAB), bit32.bxor(133,0xAB)))
makeTrafficLight((238-192), Color3.fromRGB(_P199x._8x6q(1560/40), _P199x._8x6q(14874/74), bit32.bxor(148,0xAB)))
local _l1Illl = Instance.new("\70\114\97\109\101", _lllll)
_l1Illl.Size = UDim2.new(_P199x._8x6q(99/99), -(394-370), (233-233), bit32.bxor(159,0xAB))
_l1Illl.Position = UDim2.new(bit32.bxor(171,0xAB), _P199x._8x6q(2304/192), (115+-115), _P199x._8x6q(8232/196))
_l1Illl.BackgroundTransparency = (286-285)
local _I1Illl = Instance.new("\84\101\120\116\66\111\120", _l1Illl)
_I1Illl.Size = UDim2.new((261+-260), -bit32.bxor(209,0xAB), _P199x._8x6q(0/58), (516-484))
_I1Illl.PlaceholderText = "\85\115\117\97\114\105\111\32\111\32\73\68"
_I1Illl.PlaceholderColor3 = C.textDisabled
_I1Illl.Text = ""
_I1Illl.Font = Enum.Font.Gotham
_I1Illl.TextSize = (145+-132)
_I1Illl.BackgroundColor3 = C._Illl
_I1Illl.TextColor3 = C._lIl
_I1Illl.ClearTextOnFocus = false
_I1Illl.BorderSizePixel = (58+-58)
_I1Illl.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("\85\73\67\111\114\110\101\114", _I1Illl).CornerRadius = UDim.new(_P199x._8x6q(0/28), (378-370))
local _lllIlll = Instance.new("\85\73\80\97\100\100\105\110\103", _I1Illl)
_lllIlll.PaddingLeft = UDim.new(_P199x._8x6q(0/77), _P199x._8x6q(3232/101))
_lllIlll.PaddingRight = UDim.new((366-366), _P199x._8x6q(1352/169))
themed(_I1Illl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\105\110\112\117\116")
themed(_I1Illl, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
local _IIlIlll = Instance.new("\85\73\83\116\114\111\107\101", _I1Illl)
_IIlIlll.Thickness = (448-447); _IIlIlll.Transparency = 0.7; _IIlIlll.Color = C._lIlI1
_IIlIlll.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
themed(_IIlIlll, "\67\111\108\111\114", "\98\111\114\100\101\114")
do
 local _lIlIlll = Instance.new("\85\73\83\99\97\108\101", _I1Illl)
 _I1Illl.MouseEnter:Connect(function()
 if not _IIllIlI.enabled then return end
 motionTween(_IIlIlll, TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Transparency = 0.35, Color = C._IlIll1
 })
 end)
 _I1Illl.MouseLeave:Connect(function()
 if _I1Illl:IsFocused() then return end
 motionTween(_IIlIlll, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Transparency = 0.7, Color = C._lIlI1
 })
 end)
 _I1Illl.Focused:Connect(function()
 if not _IIllIlI.enabled then return end
 motionTween(_IIlIlll, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Transparency = 0.1, Color = C._IlIll1, Thickness = 1.5
 })
 motionTween(_lIlIlll, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.015 })
 motionTween(_I1Illl, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 BackgroundColor3 = Color3.new(
 _P199x._7ofy(C._Illl.R + 0.03, bit32.bxor(170,0xAB)),
 _P199x._7ofy(C._Illl.G + 0.03, (266-265)),
 _P199x._7ofy(C._Illl.B + 0.03, bit32.bxor(170,0xAB)))
 })
 end)
 _I1Illl.FocusLost:Connect(function()
 motionTween(_IIlIlll, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 Transparency = 0.7, Color = C._lIlI1, Thickness = _P199x._8x6q(70/70)
 })
 motionTween(_lIlIlll, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Scale = _P199x._8x6q(24/24) })
 motionTween(_I1Illl, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 BackgroundColor3 = C._Illl
 })
 end)
end
local _llIll = Instance.new("\70\114\97\109\101", _l1Illl)
_llIll.Name = "\83\101\97\114\99\104\73\99\111\110"
_llIll.Size = UDim2.new((70+-70), (98-82), (149+-149), _P199x._8x6q(736/23))
_llIll.Position = UDim2.new((495-495), _P199x._8x6q(1160/145), (276-276), (208+-208))
_llIll.BackgroundTransparency = bit32.bxor(170,0xAB)
_llIll.ZIndex = _P199x._8x6q(206/103)
do
 local _IlIll = Instance.new("\70\114\97\109\101", _llIll)
 _IlIll.AnchorPoint = Vector2.new(0.5, 0.5)
 _IlIll.Position = UDim2.new(0.42, _P199x._8x6q(0/131), 0.5, -_P199x._8x6q(182/182))
 _IlIll.Size = UDim2.fromOffset(_P199x._8x6q(1790/179), _P199x._8x6q(780/78))
 _IlIll.BackgroundTransparency = bit32.bxor(170,0xAB); _IlIll.BorderSizePixel = bit32.bxor(171,0xAB); _IlIll.ZIndex = (219-217)
 Instance.new("\85\73\67\111\114\110\101\114", _IlIll).CornerRadius = UDim.new((208+-207), (239+-239))
 local _lllIll = Instance.new("\85\73\83\116\114\111\107\101", _IlIll)
 _lllIll.Thickness = 1.6; _lllIll.Color = C.subtext
 themed(_lllIll, "\67\111\108\111\114", "\115\117\98\116\101\120\116")
 local _IllIll = Instance.new("\70\114\97\109\101", _llIll)
 _IllIll.AnchorPoint = Vector2.new(0.5, 0.5)
 _IllIll.Position = UDim2.new(0.74, _P199x._8x6q(0/99), 0.78, -(129+-128))
 _IllIll.Size = UDim2.fromOffset(bit32.bxor(174,0xAB), 1.8)
 _IllIll.Rotation = _P199x._8x6q(5985/133); _IllIll.BorderSizePixel = bit32.bxor(171,0xAB)
 _IllIll.BackgroundColor3 = C.subtext; _IllIll.ZIndex = bit32.bxor(169,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _IllIll).CornerRadius = UDim.new((214+-213), _P199x._8x6q(0/157))
 themed(_IllIll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
end
local _lIlIll
local function hideAllSuggestions() end
local function showSuggestions(_) end
local function ensureSuggestionItem(_) return nil end
local _IIlIll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _l1Illl)
_IIlIll.Size = UDim2.new((151+-151), (234+-124), _P199x._8x6q(0/49), (199-167))
_IIlIll.AnchorPoint = Vector2.new((28-27), bit32.bxor(171,0xAB))
_IIlIll.Position = UDim2.new((217-216), (298-298), bit32.bxor(171,0xAB), (281-281))
_IIlIll.BackgroundColor3 = C._IlIll1
_IIlIll.Text = "\65\110\97\108\105\122\97\114"
_IIlIll.Font = Enum.Font.GothamBold
_IIlIll.TextSize = (355-342)
_IIlIll.TextColor3 = C.onAccent
_IIlIll.BorderSizePixel = bit32.bxor(171,0xAB)
Instance.new("\85\73\67\111\114\110\101\114", _IIlIll).CornerRadius = UDim.new((272+-272), (27+-19))
themed(_IIlIll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
themed(_IIlIll, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
addHoverStroke(_IIlIll)
local _l1lIll = Instance.new("\84\101\120\116\76\97\98\101\108", _l1Illl)
_l1lIll.Size = UDim2.new((11-10), (151-151), (258-258), (321-305))
_l1lIll.Position = UDim2.new(bit32.bxor(171,0xAB), (147+-147), (205+-205), _P199x._8x6q(3955/113))
_l1lIll.BackgroundTransparency = (88-87)
_l1lIll.Font = Enum.Font.Gotham
_l1lIll.TextSize = _P199x._8x6q(1859/169)
_l1lIll.TextColor3 = C.subtext
_l1lIll.Text = ""
_l1lIll.TextXAlignment = Enum.TextXAlignment.Left
_l1lIll.TextTruncate = Enum.TextTruncate.AtEnd
themed(_l1lIll, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
local _I1lIll = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _lllll)
_I1lIll.Size = UDim2.new((111-110), -(262+-238), (91+-91), bit32.bxor(181,0xAB))
_I1lIll.Position = UDim2.new((230-230), (165+-153), (432-432), (145+-49))
_I1lIll.BackgroundColor3 = C.bg
_I1lIll.BackgroundTransparency = (170-169)
themed(_I1lIll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\103")
_I1lIll.BorderSizePixel = (210+-210)
_I1lIll.ZIndex = _P199x._8x6q(429/143)
_I1lIll.ScrollBarThickness = (402-400)
_I1lIll.ScrollBarImageColor3 = C._IlIll1
themed(_I1lIll, "\83\99\114\111\108\108\66\97\114\73\109\97\103\101\67\111\108\111\114\51", "\97\99\99\101\110\116")
_I1lIll.ScrollingDirection = Enum.ScrollingDirection.X
_I1lIll.CanvasSize = UDim2.new((58-58), (140-140), bit32.bxor(171,0xAB), (403-403))
_I1lIll.AutomaticCanvasSize = Enum.AutomaticSize.X
local _llllIll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _I1lIll)
_llllIll.FillDirection = Enum.FillDirection.Horizontal
_llllIll.Padding = UDim.new(bit32.bxor(171,0xAB), (309-303))
_llllIll.SortOrder = Enum.SortOrder.LayoutOrder
_llllIll.VerticalAlignment = Enum.VerticalAlignment.Center
local _IIllIll = Instance.new("\70\114\97\109\101", _lllll)
_IIllIll.Size = UDim2.new((176-175), -(160+-136), bit32.bxor(170,0xAB), -_P199x._8x6q(8978/67))
_IIllIll.Position = UDim2.new((295-295), (74+-62), bit32.bxor(171,0xAB), (203+-75))
_IIllIll.BackgroundTransparency = bit32.bxor(170,0xAB)
local _lIllIll, pages = {}, {}
local _lIIll = {}
local _IIIll = {}
local _llIIll = nil
local _IlIIll = Instance.new("\70\114\97\109\101", _lllll)
_IlIIll.Name = "\84\97\98\65\99\116\105\118\101\73\110\100\105\99\97\116\111\114"
_IlIIll.Size = UDim2.fromOffset((414-414), _P199x._8x6q(0/171))
_IlIIll.Position = UDim2.fromOffset(bit32.bxor(171,0xAB), _P199x._8x6q(0/188))
_IlIIll.BackgroundColor3 = C._IlIll1
_IlIIll.BorderSizePixel = (256+-256)
_IlIIll.Active = false
_IlIIll.ZIndex = _P199x._8x6q(16/8)
Instance.new("\85\73\67\111\114\110\101\114", _IlIIll).CornerRadius = UDim.new((1+-1), _P199x._8x6q(1080/180))
themed(_IlIIll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
local function syncTabIndicator(_Illll)
 if not _llIIll or not _llIIll.Parent then return end
 local _lIIIll = _lllll.AbsoluteSize
 local _IIIIll = _lllll.AbsolutePosition
 local _l1IIll = _llIIll.AbsolutePosition
 local _I1IIll = _llIIll.AbsoluteSize
 if _lIIIll.X <= (125+-125) or _lIIIll.Y <= (230+-230) or _I1IIll.X <= _P199x._8x6q(0/182) then return end
 local _lllIIll = _I1lIll.AbsolutePosition
 local _IIlIIll = _I1lIll.AbsoluteSize
 if _l1IIll.X < _lllIIll.X or (_l1IIll.X + _I1IIll.X) > (_lllIIll.X + _IIlIIll.X) then
 _IlIIll.Visible = false
 return
 end
 _IlIIll.Visible = true
 local _lIlIIll = _lllll.Size.X.Offset
 local _ll1ll = _lllll.Size.Y.Offset
 if _lIlIIll <= bit32.bxor(171,0xAB) or _ll1ll <= bit32.bxor(171,0xAB) then return end
 local _Il1ll = _lIIIll.X / _lIlIIll
 local _lll1ll = _lIIIll.Y / _ll1ll
 if _Il1ll <= bit32.bxor(171,0xAB) or _lll1ll <= _P199x._8x6q(0/144) then return end
 local _Ill1ll = UDim2.fromOffset(
 math.round((_l1IIll.X - _IIIIll.X) / _Il1ll),
 math.round((_l1IIll.Y - _IIIIll.Y) / _lll1ll)
 )
 local _IlIlll = UDim2.fromOffset(
 math.round(_I1IIll.X / _Il1ll),
 math.round(_I1IIll.Y / _lll1ll)
 )
 if _Illll and _IIllIlI.enabled then
 motionTween(_IlIIll,
 TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { Position = _Ill1ll, Size = _IlIlll })
 else
 _IlIIll.Position = _Ill1ll
 _IlIIll.Size = _IlIlll
 end
end
local function paintTabs(_Illll)
 for _, t in ipairs(_lIllIll) do
 local _lIl1ll = (t == _llIIll)
 local _lllIll = _lIl1ll and C.onAccent or C.subtext
 local _IIl1ll = _lIl1ll and C._IlIll1 or C.bg
 if _Illll and _IIllIlI.enabled then
 motionTween(t, TweenInfo.new(0.26, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 BackgroundColor3 = _IIl1ll,
 BackgroundTransparency = (71+-70),
 TextColor3 = _lllIll,
 TextTransparency = bit32.bxor(171,0xAB),
 })
 else
 t.BackgroundColor3 = _IIl1ll
 t.BackgroundTransparency = _P199x._8x6q(103/103)
 t.TextColor3 = _lllIll
 t.TextTransparency = (183+-183)
 end
 end
 _IlIIll.BackgroundColor3 = C._IlIll1
 syncTabIndicator(_Illll)
end
onRepaint(paintTabs)
track(_I1lIll:GetPropertyChangedSignal("\67\97\110\118\97\115\80\111\115\105\116\105\111\110"):Connect(function() syncTabIndicator(false) end))
track(_llllIll:GetPropertyChangedSignal("\65\98\115\111\108\117\116\101\67\111\110\116\101\110\116\83\105\122\101"):Connect(function()
 task.defer(function() syncTabIndicator(false) end)
end))
track(_lllll:GetPropertyChangedSignal("\65\98\115\111\108\117\116\101\83\105\122\101"):Connect(function() syncTabIndicator(false) end))
local function showPage(_I1l1ll)
 if _IIllIlI.enabled then
 local _l1l1ll
 for _, p in pairs(pages) do
 if p.Visible and p ~= _I1l1ll then _l1l1ll = p; break end
 end
 if _l1l1ll then
 task.delay(0.1, function()
 if _l1l1ll and _l1l1ll.Parent then _l1l1ll.Visible = false end
 end)
 end
 for _, p in pairs(pages) do if p ~= _l1l1ll then p.Visible = false end end
 _I1l1ll.Visible = true
 local _lIIl = _I1l1ll:FindFirstChild("\80\97\103\101\83\99\97\108\101")
 if not _lIIl then _lIIl = Instance.new("\85\73\83\99\97\108\101", _I1l1ll); _lIIl.Name = "\80\97\103\101\83\99\97\108\101" end
 _lIIl.Scale = 0.99
 _I1l1ll.Position = UDim2.new((264-264), (30+-30), _P199x._8x6q(0/164), _P199x._8x6q(744/93))
 for _, _lIllI in ipairs(_I1l1ll:GetChildren()) do
 if _lIllI:IsA("\67\97\110\118\97\115\71\114\111\117\112") then
 _lIllI.GroupTransparency = _P199x._8x6q(106/106)
 end
 end
 motionTween(_I1l1ll, TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
 { Position = UDim2.new(_P199x._8x6q(0/142), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB), (21+-21)) })
 motionTween(_lIIl, TweenInfo.new(0.28, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { Scale = (443-442) })
 else
 for _, p in pairs(pages) do p.Visible = false end
 _I1l1ll.Visible = true
 _I1l1ll.Position = UDim2.new(bit32.bxor(171,0xAB), _P199x._8x6q(0/151), _P199x._8x6q(0/39), _P199x._8x6q(0/104))
 end
 _llIIll = _lIIll[_I1l1ll]
 paintTabs(true)
 local _llll1ll = _IIIll[_I1l1ll]
 if _llll1ll then pcall(_llll1ll) end
end
local function createTab(_lll, _I1l1ll, _IIll1ll)
 local _lIlll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _I1lIll)
 _lIlll.Size = UDim2.new(bit32.bxor(171,0xAB), bit32.bxor(171,0xAB), (188-188), bit32.bxor(183,0xAB))
 _lIlll.AutomaticSize = Enum.AutomaticSize.X
 _lIlll.LayoutOrder = #_lIllIll
 _lIlll.BackgroundColor3 = C.bg
 _lIlll.BackgroundTransparency = _P199x._8x6q(112/112)
 _lIlll.Text = _lll
 _lIlll.Font = Enum.Font.GothamMedium
 _lIlll.TextSize = _P199x._8x6q(2353/181)
 _lIlll.TextColor3 = C.subtext
 _lIlll.BorderSizePixel = (159+-159)
 _lIlll.ZIndex = _P199x._8x6q(132/44)
 Instance.new("\85\73\67\111\114\110\101\114", _lIlll).CornerRadius = UDim.new((295-295), (40-34))
 local _lIll1ll = Instance.new("\85\73\80\97\100\100\105\110\103", _lIlll)
 _lIll1ll.PaddingLeft = UDim.new((108+-108), (264-248)); _lIll1ll.PaddingRight = UDim.new((134+-134), (368-352))
 addHoverStroke(_lIlll)
 track(_lIlll.MouseEnter:Connect(function()
 if _lIlll ~= _llIIll then
 motionTween(_lIlll, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { TextColor3 = C._lIl })
 end
 end))
 track(_lIlll.MouseLeave:Connect(function()
 if _lIlll ~= _llIIll then
 motionTween(_lIlll, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { TextColor3 = C.subtext })
 end
 end))
 _lIIll[_I1l1ll] = _lIlll
 if _IIll1ll then _IIIll[_I1l1ll] = _IIll1ll end
 track(_lIlll.MouseButton1Click:Connect(function() showPage(_I1l1ll) end))
 _P199x._l50o(_lIllIll, _lIlll)
 _P199x._l50o(pages, _I1l1ll)
 if #_lIllIll == _P199x._8x6q(44/44) then
 _llIIll = _lIlll
 _I1l1ll.Visible = true
 end
 paintTabs(false)
 task.defer(function() syncTabIndicator(false) end)
 return _lIlll
end
local function makeScroll(_lllI)
 local _lI1ll = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _lllI)
 _lI1ll.Size = UDim2.new((63+-62), (263+-263), (287+-286), (72-72))
 _lI1ll.BackgroundTransparency = _P199x._8x6q(47/47)
 _lI1ll.BorderSizePixel = (301-301)
 _lI1ll.ScrollBarThickness = bit32.bxor(168,0xAB)
 _lI1ll.ScrollBarImageColor3 = C._IlIll1
 _lI1ll.CanvasSize = UDim2.new((283+-283), bit32.bxor(171,0xAB), (180+-180), (72+-72))
 _lI1ll.AutomaticCanvasSize = Enum.AutomaticSize.Y
 _lI1ll.ClipsDescendants = true
 themed(_lI1ll, "\83\99\114\111\108\108\66\97\114\73\109\97\103\101\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _II1ll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _lI1ll)
 _II1ll.Padding = UDim.new(_P199x._8x6q(0/99), (321-311))
 _II1ll.SortOrder = Enum.SortOrder.LayoutOrder
 local _lIll = Instance.new("\85\73\80\97\100\100\105\110\103", _lI1ll)
 _lIll.PaddingRight = UDim.new(_P199x._8x6q(0/176), (483-475))
 _lIll.PaddingTop = UDim.new((216+-216), (146+-142))
 _lIll.PaddingBottom = UDim.new(_P199x._8x6q(0/97), (282-274))
 return _lI1ll
end
local _llI1ll = Instance.new("\70\114\97\109\101", _IIllIll)
_llI1ll.Size = UDim2.new(_P199x._8x6q(113/113), (15+-15), _P199x._8x6q(9/9), (93+-93))
_llI1ll.BackgroundTransparency = (58+-57)
_llI1ll.Visible = false
local _IlI1ll = makeScroll(_llI1ll)
local _lII1ll = Instance.new("\70\114\97\109\101", _IIllIll)
_lII1ll.Size = UDim2.new((180-179), (136+-136), _P199x._8x6q(57/57), (201-201))
_lII1ll.BackgroundTransparency = (228-227)
_lII1ll.Visible = false
local _III1ll = makeScroll(_lII1ll)
local _l1I1ll = Instance.new("\70\114\97\109\101", _IIllIll)
_l1I1ll.Size = UDim2.new((268+-267), (59+-59), (124-123), bit32.bxor(171,0xAB))
_l1I1ll.BackgroundTransparency = (114+-113)
_l1I1ll.Visible = false
local _I1I1ll = makeScroll(_l1I1ll)
local _lllI1ll = Instance.new("\70\114\97\109\101", _IIllIll)
_lllI1ll.Size = UDim2.new((41-40), (16-16), bit32.bxor(170,0xAB), _P199x._8x6q(0/189))
_lllI1ll.BackgroundTransparency = _P199x._8x6q(35/35)
_lllI1ll.Visible = false
local _IIlI1ll = makeScroll(_lllI1ll)
local _lIlI1ll = Instance.new("\70\114\97\109\101", _IIllIll)
_lIlI1ll.Size = UDim2.new(bit32.bxor(170,0xAB), _P199x._8x6q(0/193), (87+-86), (153+-153))
_lIlI1ll.BackgroundTransparency = (91+-90)
_lIlI1ll.Visible = false
local _llllll = makeScroll(_lIlI1ll)
local GuiService = game:GetService("\71\117\105\83\101\114\118\105\99\101")
local function openURL(_IlII)
 local _l1 = pcall(function() GuiService:OpenBrowserWindow(_IlII) end)
 if _l1 then return true end
 local _Illlll = {
 _P199x._4xzj(_G, "\111\112\101\110\95\117\114\108"), _P199x._4xzj(_G, "\111\112\101\110\117\114\108"), _P199x._4xzj(_G, "\111\112\101\110\85\114\108"), _P199x._4xzj(_G, "\79\112\101\110\85\82\76"),
 _P199x._4xzj(_G, "\115\104\101\108\108\101\120\101\99\117\116\101"), _P199x._4xzj(_G, "\115\104\101\108\108\95\101\120\101\99\117\116\101"), _P199x._4xzj(_G, "\115\104\101\108\108\69\120\101\99\117\116\101"), _P199x._4xzj(_G, "\83\104\101\108\108\69\120\101\99\117\116\101"),
 _P199x._4xzj(_G, "\111\112\101\110\98\114\111\119\115\101\114"), _P199x._4xzj(_G, "\98\114\111\119\115\101"),
 syn and syn.open_url, syn and syn.openurl,
 krnl and krnl.open_url,
 fluxus and fluxus.open_url, fluxus and fluxus.openurl,
 hydrogen and hydrogen.open_url,
 velocity and velocity.open_url,
 wave and wave.open_url,
 xeno and xeno.open_url, xeno and xeno.openurl,
 }
 for _, _I1I in ipairs(_Illlll) do
 if _P199x._iy38(_I1I) == "\102\117\110\99\116\105\111\110" then
 local _lllllll = pcall(_I1I, _IlII)
 if _lllllll then return true end
 end
 end
 if _III then
 local _Illllll = false
 local function tryPort(_lIlllll)
 pcall(function()
 local _IIlII = _III({
 Url = "\104\116\116\112\58\47\47\49\50\55\46\48\46\48\46\49\58\57\50\50\50\47\106\115\111\110\47\110\101\119\63" .. _IlII,
 Method = _lIlllll,
 })
 local _IlIl = _IIlII and (_IIlII.StatusCode or _IIlII.Status)
 if _IIlII and (_IIlII.Success == true or _IlIl == bit32.bxor(99,0xAB)) then _Illllll = true end
 end)
 end
 tryPort("\80\85\84")
 if not _Illllll then tryPort("\71\69\84") end
 if _Illllll then return true end
 end
 _llII(_IlII)
 return false
end
local function showLinkModal(_IlII)
 local _IIlllll = _lllIlI:FindFirstChild("\76\105\110\107\77\111\100\97\108")
 if _IIlllll then _IIlllll:Destroy() end
 local _llI = _G.NXDS
 local _l1lllll = Instance.new("\70\114\97\109\101", _lllIlI)
 _l1lllll.Name = "\76\105\110\107\77\111\100\97\108"
 _l1lllll.Size = UDim2.new(bit32.bxor(170,0xAB), (124-124), (253+-252), (88-88))
 _l1lllll.BackgroundColor3 = Color3.fromRGB((194+-194), (5-5), bit32.bxor(171,0xAB))
 _l1lllll.BackgroundTransparency = bit32.bxor(170,0xAB)
 _l1lllll.BorderSizePixel = bit32.bxor(171,0xAB)
 _l1lllll.ZIndex = _P199x._8x6q(7400/148)
 motionTween(_l1lllll, TweenInfo.new(0.18), { BackgroundTransparency = 0.5 })
 local _I1lllll = Instance.new("\70\114\97\109\101", _l1lllll)
 _I1lllll.Size = UDim2.new(bit32.bxor(170,0xAB), -(241+-201), bit32.bxor(171,0xAB), (184-184))
 _I1lllll.AutomaticSize = Enum.AutomaticSize.Y
 _I1lllll.AnchorPoint = Vector2.new(0.5, 0.5)
 _I1lllll.Position = UDim2.new(0.5, bit32.bxor(171,0xAB), 0.5, bit32.bxor(171,0xAB))
 _I1lllll.BackgroundColor3 = C.elevated
 _I1lllll.BorderSizePixel = _P199x._8x6q(0/179)
 _I1lllll.ClipsDescendants = false
 _I1lllll.ZIndex = _P199x._8x6q(2703/53)
 themed(_I1lllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 local _llllllll = Instance.new("\85\73\83\105\122\101\67\111\110\115\116\114\97\105\110\116", _I1lllll)
 _llllllll.MaxSize = Vector2.new((295+145), math.huge)
 Instance.new("\85\73\67\111\114\110\101\114", _I1lllll).CornerRadius = _llI.corner._l1lIl1
 local _IIllllll = Instance.new("\85\73\83\116\114\111\107\101", _I1lllll)
 _IIllllll.Color = C._lIlI1; _IIllllll.Thickness = (215-214); _IIllllll.Transparency = 0.1
 themed(_IIllllll, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _lIllllll = Instance.new("\85\73\83\99\97\108\101", _I1lllll); _lIllllll.Scale = 0.88
 motionTween(_lIllllll, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = (100+-99) })
 local _lIIlll = Instance.new("\85\73\80\97\100\100\105\110\103", _I1lllll)
 _lIIlll.PaddingTop = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(1680/84)); _lIIlll.PaddingBottom = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(640/32))
 _lIIlll.PaddingLeft = UDim.new(_P199x._8x6q(0/95), bit32.bxor(191,0xAB)); _lIIlll.PaddingRight = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(191,0xAB))
 local _IIIlll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _I1lllll)
 _IIIlll.Padding = UDim.new((456-456), _llI.space.md); _IIIlll.SortOrder = Enum.SortOrder.LayoutOrder
 _IIIlll.HorizontalAlignment = Enum.HorizontalAlignment.Center
 local _llIIlll = Instance.new("\70\114\97\109\101", _I1lllll)
 _llIIlll.LayoutOrder = _P199x._8x6q(0/67)
 _llIIlll.Size = UDim2.new((339-338), (135-135), bit32.bxor(171,0xAB), (182+-154))
 _llIIlll.BackgroundTransparency = _P199x._8x6q(55/55)
 _llIIlll.ZIndex = (180+-128)
 local _IlIIlll = Instance.new("\70\114\97\109\101", _llIIlll)
 _IlIIlll.Size = UDim2.new((361-361), _P199x._8x6q(4480/160), _P199x._8x6q(0/52), (382-354))
 _IlIIlll.BackgroundColor3 = C.good
 _IlIIlll.BackgroundTransparency = 0.82
 _IlIIlll.BorderSizePixel = (173-173)
 _IlIIlll.ZIndex = bit32.bxor(159,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _IlIIlll).CornerRadius = _llI.corner.sm
 local _lIIIlll = Instance.new("\84\101\120\116\76\97\98\101\108", _IlIIlll)
 _lIIIlll.Size = UDim2.new(_P199x._8x6q(181/181), _P199x._8x6q(0/106), bit32.bxor(170,0xAB), bit32.bxor(171,0xAB))
 _lIIIlll.BackgroundTransparency = _P199x._8x6q(173/173)
 _lIIIlll.Text = "\10003"
 _lIIIlll.Font = Enum.Font.GothamBold
 _lIIIlll.TextSize = _llI._lIl._l1lIl1
 _lIIIlll.TextColor3 = C.good
 _lIIIlll.ZIndex = (89+-37)
 local _IIIIlll = Instance.new("\84\101\120\116\76\97\98\101\108", _llIIlll)
 _IIIIlll.Size = UDim2.new(_P199x._8x6q(80/80), -_P199x._8x6q(5544/154), _P199x._8x6q(110/110), bit32.bxor(171,0xAB))
 _IIIIlll.Position = UDim2.new((218-218), (191-155), (463-463), (305-305))
 _IIIIlll.BackgroundTransparency = (18-17)
 _IIIIlll.Font = Enum.Font.GothamBold
 _IIIIlll.TextSize = _llI._lIl._l1lIl1
 _IIIIlll.TextColor3 = C.good
 _IIIIlll.Text = "\76\105\110\107\32\99\111\112\105\97\100\111\32\97\108\32\112\111\114\116\97\112\97\112\101\108\101\115"
 _IIIIlll.TextXAlignment = Enum.TextXAlignment.Left
 _IIIIlll.TextTruncate = Enum.TextTruncate.AtEnd
 _IIIIlll.ZIndex = bit32.bxor(159,0xAB)
 local _l1lI = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lllll)
 _l1lI.LayoutOrder = (185-184)
 _l1lI.Size = UDim2.new(_P199x._8x6q(185/185), bit32.bxor(171,0xAB), (2+-2), _P199x._8x6q(0/72))
 _l1lI.AutomaticSize = Enum.AutomaticSize.Y
 _l1lI.BackgroundTransparency = bit32.bxor(170,0xAB)
 _l1lI.Font = Enum.Font.Gotham
 _l1lI.TextSize = _llI._lIl.md
 _l1lI.TextColor3 = C.subtext
 _l1lI.Text = "\69\108\32\101\120\101\99\117\116\111\114\32" .. _lII .. "\32\110\111\32\112\101\114\109\105\116\101\32\97\98\114\105\114\32\101\108\32\110\97\118\101\103\97\100\111\114\32"
 .. "\100\101\115\100\101\32\82\111\98\108\111\120\44\32\112\101\114\111\32\101\108\32\108\105\110\107\32\89\65\32\101\115\116\225\32\99\111\112\105\97\100\111\32\101\110\32\116\117\32\112\111\114\116\97\112\97\112\101\108\101\115\46"
 _l1lI.TextXAlignment = Enum.TextXAlignment.Left
 _l1lI.TextYAlignment = Enum.TextYAlignment.Top
 _l1lI.TextWrapped = true
 _l1lI.ZIndex = _P199x._8x6q(3536/68)
 themed(_l1lI, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _l1IIlll = Instance.new("\70\114\97\109\101", _I1lllll)
 _l1IIlll.LayoutOrder = (325-323)
 _l1IIlll.Size = UDim2.new((122+-121), (447-447), bit32.bxor(171,0xAB), _P199x._8x6q(0/125))
 _l1IIlll.AutomaticSize = Enum.AutomaticSize.Y
 _l1IIlll.BackgroundColor3 = C.surface
 _l1IIlll.BorderSizePixel = (125+-125)
 _l1IIlll.ZIndex = bit32.bxor(159,0xAB)
 themed(_l1IIlll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 Instance.new("\85\73\67\111\114\110\101\114", _l1IIlll).CornerRadius = _llI.corner.md
 local _I1IIlll = Instance.new("\85\73\80\97\100\100\105\110\103", _l1IIlll)
 _I1IIlll.PaddingTop = UDim.new((413-413), (149+-139)); _I1IIlll.PaddingBottom = UDim.new((70+-70), bit32.bxor(161,0xAB))
 _I1IIlll.PaddingLeft = UDim.new(bit32.bxor(171,0xAB), (453-441)); _I1IIlll.PaddingRight = UDim.new((10+-10), _P199x._8x6q(1596/133))
 local _lllIIlll = Instance.new("\84\101\120\116\76\97\98\101\108", _l1IIlll)
 _lllIIlll.Size = UDim2.new(bit32.bxor(170,0xAB), (457-457), (266-266), (3-3))
 _lllIIlll.AutomaticSize = Enum.AutomaticSize.Y
 _lllIIlll.BackgroundTransparency = _P199x._8x6q(109/109)
 _lllIIlll.Font = Enum.Font.Gotham
 _lllIIlll.TextSize = _llI._lIl.sm
 _lllIIlll.TextColor3 = C._lIl
 _lllIIlll.Text = "\49\46\32\65\108\116\43\84\97\98\32\97\32\116\117\32\110\97\118\101\103\97\100\111\114\10"
 .. "\50\46\32\67\108\105\99\107\32\101\110\32\108\97\32\98\97\114\114\97\32\100\101\32\100\105\114\101\99\99\105\111\110\101\115\10"
 .. "\51\46\32\80\101\103\97\32\99\111\110\32\67\116\114\108\43\86\32\121\32\100\97\108\101\32\69\110\116\101\114"
 _lllIIlll.TextXAlignment = Enum.TextXAlignment.Left
 _lllIIlll.TextWrapped = true
 _lllIIlll.ZIndex = (76+-24)
 themed(_lllIIlll, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
do if false then local _0m0w=game:GetService("Players");end end
 local _IIlIIlll = Instance.new("\84\101\120\116\66\111\120", _I1lllll)
 _IIlIIlll.LayoutOrder = (95-92)
 _IIlIIlll.Size = UDim2.new(_P199x._8x6q(49/49), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB), bit32.bxor(139,0xAB))
 _IIlIIlll.BackgroundColor3 = C.surface
 _IIlIIlll.TextColor3 = C._IlIll1
 _IIlIIlll.Font = Enum.Font.Code
 _IIlIIlll.TextSize = _llI._lIl.sm
 _IIlIIlll.Text = _IlII
 _IIlIIlll.TextEditable = false
 _IIlIIlll.ClearTextOnFocus = false
 _IIlIIlll.TextXAlignment = Enum.TextXAlignment.Left
 _IIlIIlll.TextTruncate = Enum.TextTruncate.AtEnd
 _IIlIIlll.ClipsDescendants = true
 _IIlIIlll.BorderSizePixel = _P199x._8x6q(0/13)
 _IIlIIlll.ZIndex = (138+-86)
 themed(_IIlIIlll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 themed(_IIlIIlll, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _IIlIIlll).CornerRadius = _llI.corner.sm
 local _lIlIIlll = Instance.new("\85\73\80\97\100\100\105\110\103", _IIlIIlll)
 _lIlIIlll.PaddingLeft = UDim.new(bit32.bxor(171,0xAB), (18-10))
 _lIlIIlll.PaddingRight = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(648/81))
 local _llIlll = Instance.new("\70\114\97\109\101", _I1lllll)
 _llIlll.LayoutOrder = bit32.bxor(175,0xAB)
 _llIlll.Size = UDim2.new(_P199x._8x6q(199/199), _P199x._8x6q(0/35), (167+-167), _P199x._8x6q(4104/114))
 _llIlll.BackgroundTransparency = (64-63)
 _llIlll.ZIndex = bit32.bxor(159,0xAB)
 local _IlIlll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _llIlll)
 _IlIlll.FillDirection = Enum.FillDirection.Horizontal
 _IlIlll.HorizontalAlignment = Enum.HorizontalAlignment.Right
 _IlIlll.Padding = UDim.new((322-322), _llI.space.md)
 _IlIlll.SortOrder = Enum.SortOrder.LayoutOrder
 local _lllIlll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _llIlll)
 _lllIlll.LayoutOrder = (254+-253)
 _lllIlll.Size = UDim2.new((473-473), (514-374), (441-441), (493-457))
 _lllIlll.BackgroundColor3 = C.surface
 _lllIlll.Text = "\67\111\112\105\97\114\32\100\101\32\110\117\101\118\111"
 _lllIlll.Font = Enum.Font.GothamMedium
 _lllIlll.TextSize = _llI._lIl.md
 _lllIlll.TextColor3 = C._lIl
 _lllIlll.BorderSizePixel = _P199x._8x6q(0/24)
 _lllIlll.AutoButtonColor = false
 _lllIlll.ZIndex = (455-403)
 themed(_lllIlll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 themed(_lllIlll, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 Instance.new("\85\73\67\111\114\110\101\114", _lllIlll).CornerRadius = _llI.corner.md
 local _IllIlll = Instance.new("\85\73\83\116\114\111\107\101", _lllIlll)
 _IllIlll.Color = C._lIlI1; _IllIlll.Thickness = _P199x._8x6q(118/118)
 themed(_IllIlll, "\67\111\108\111\114", "\98\111\114\100\101\114")
 _lllIlll.MouseButton1Click:Connect(function()
 _llII(_IlII)
 _lllIlll.Text = "\10003\32\67\111\112\105\97\100\111"
 _lllIlll.BackgroundColor3 = C.good
 _lllIlll.TextColor3 = C.onAccent
 task.delay(1.2, function()
 if _lllIlll and _lllIlll.Parent then
 _lllIlll.Text = "\67\111\112\105\97\114\32\100\101\32\110\117\101\118\111"
 _lllIlll.BackgroundColor3 = C.surface
 _lllIlll.TextColor3 = C._lIl
 end
 end)
 end)
 local _lIlIlll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _llIlll)
 _lIlIlll.LayoutOrder = bit32.bxor(169,0xAB)
 _lIlIlll.Size = UDim2.new(bit32.bxor(171,0xAB), (127+13), _P199x._8x6q(0/27), (122+-86))
 _lIlIlll.BackgroundColor3 = C._IlIll1
 _lIlIlll.Text = "\69\110\116\101\110\100\105\100\111"
 _lIlIlll.Font = Enum.Font.GothamMedium
 _lIlIlll.TextSize = _llI._lIl.md
 _lIlIlll.TextColor3 = C.onAccent
 _lIlIlll.BorderSizePixel = (42+-42)
 _lIlIlll.AutoButtonColor = false
 _lIlIlll.ZIndex = (129+-77)
 themed(_lIlIlll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 themed(_lIlIlll, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _lIlIlll).CornerRadius = _llI.corner.md
 local function closeLink()
 motionTween(_lIllllll, TweenInfo.new(0.14), { Scale = 0.88 })
 motionTween(_l1lllll, TweenInfo.new(0.14), { BackgroundTransparency = (414-413) })
 task.delay(0.16, function() if _l1lllll.Parent then _l1lllll:Destroy() end end)
 end
 _lIlIlll.MouseButton1Click:Connect(closeLink)
 _l1lllll.InputBegan:Connect(function(_Illl)
 if _Illl.UserInputType == Enum.UserInputType.MouseButton1
 or _Illl.UserInputType == Enum.UserInputType.Touch then
 local _IIlIlll = _Illl.Position
 local _llIl = _I1lllll.AbsolutePosition
 local _l1lIlll = _I1lllll.AbsoluteSize
 if _IIlIlll.X < _llIl.X or _IIlIlll.X > _llIl.X + _l1lIlll.X
 or _IIlIlll.Y < _llIl.Y or _IIlIlll.Y > _llIl.Y + _l1lIlll.Y then
 closeLink()
 end
 end
 end)
 _llII(_IlII)
end
local function showNXWarning(_llllIlll)
 local _llIII   = _P199x._5x5j(_P199x._p02a(_llllIlll._llIII) or (354-353), (111+-110), (293+-290))
 local _I1lIlll = _P199x._yp3z(_llllIlll._I1lIlll or "\72\97\115\32\114\101\99\105\98\105\100\111\32\117\110\32\97\118\105\115\111\32\100\101\108\32\115\105\115\116\101\109\97\32\78\88\46")
 local _llI = _G.NXDS
 local _IIllIlll = {
 [bit32.bxor(170,0xAB)] = { _Illl = "\65\86\73\83\79",             _IIlI = Color3.fromRGB((111+109), bit32.bxor(18,0xAB), (300-250))  },
 [(254+-252)] = { _Illl = "\65\68\86\69\82\84\69\78\67\73\65",       _IIlI = Color3.fromRGB((172+58), _P199x._8x6q(9600/80), _P199x._8x6q(5960/149))  },
 [(63+-60)] = { _Illl = "\65\68\86\69\82\84\69\78\67\73\65\32\71\82\65\86\69", _IIlI = Color3.fromRGB((35+180), _P199x._8x6q(6950/139),  _P199x._8x6q(6500/130))  },
 }
 local _lIllIlll = _IIllIlll[_llIII]
 local _l1lllll = Instance.new("\70\114\97\109\101", _lllIlI)
 _l1lllll.Name                   = "\78\88\87\97\114\110\105\110\103\79\118\101\114\108\97\121"
 _l1lllll.Size                   = UDim2.new(_P199x._8x6q(2/2), _P199x._8x6q(0/194), (455-454), _P199x._8x6q(0/143))
 _l1lllll.BackgroundColor3       = Color3.fromRGB((49+-49), _P199x._8x6q(0/161), (10+-10))
 _l1lllll.BackgroundTransparency = (84+-83)
 _l1lllll.ZIndex                 = (560-470)
 motionTween(_l1lllll, TweenInfo.new(0.2), { BackgroundTransparency = 0.52 })
 local _I1lllll = Instance.new("\70\114\97\109\101", _l1lllll)
 _I1lllll.Size             = UDim2.new(bit32.bxor(170,0xAB), -(175+-155), (144-144), (207+-207))
 _I1lllll.AutomaticSize    = Enum.AutomaticSize.Y
 _I1lllll.AnchorPoint      = Vector2.new(0.5, 0.5)
 _I1lllll.Position         = UDim2.new(0.5, _P199x._8x6q(0/169), 0.5, bit32.bxor(171,0xAB))
 _I1lllll.BackgroundColor3 = C.elevated
 _I1lllll.BorderSizePixel  = _P199x._8x6q(0/170)
 _I1lllll.ClipsDescendants = false
 _I1lllll.ZIndex           = _P199x._8x6q(11739/129)
 themed(_I1lllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 local _llIl = Instance.new("\85\73\83\105\122\101\67\111\110\115\116\114\97\105\110\116", _I1lllll)
 _llIl.MaxSize = Vector2.new(bit32.bxor(271,0xAB), math.huge)
 Instance.new("\85\73\67\111\114\110\101\114", _I1lllll).CornerRadius = _llI.corner._l1lIl1
do local _cf25d5=1 while _cf25d5>0 do if _cf25d5==1 then
 local _IlIl = Instance.new("\85\73\83\116\114\111\107\101", _I1lllll)
 _IlIl.Color = _lIllIlll._IIlI; _IlIl.Thickness = bit32.bxor(170,0xAB); _IlIl.Transparency = 0.2
 local _lllIl = Instance.new("\85\73\83\99\97\108\101", _I1lllll); _lllIl.Scale = 0.88
_cf25d5=0 end end end
 motionTween(_lllIl, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = (234+-233) })
 local _IllIl = Instance.new("\85\73\80\97\100\100\105\110\103", _I1lllll)
 _IllIl.PaddingTop = UDim.new(_P199x._8x6q(0/95), _P199x._8x6q(780/39)); _IllIl.PaddingBottom = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(191,0xAB))
 _IllIl.PaddingLeft = UDim.new(_P199x._8x6q(0/130), bit32.bxor(191,0xAB)); _IllIl.PaddingRight = UDim.new((65+-65), (137+-117))
 local _lIlIl = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _I1lllll)
 _lIlIl.Padding = UDim.new(_P199x._8x6q(0/67), _llI.space._l1lIl1); _lIlIl.SortOrder = Enum.SortOrder.LayoutOrder
 _lIlIl.HorizontalAlignment = Enum.HorizontalAlignment.Center
 local _llIIlll = Instance.new("\70\114\97\109\101", _I1lllll)
 _llIIlll.LayoutOrder = bit32.bxor(171,0xAB)
 _llIIlll.Size = UDim2.new(_P199x._8x6q(97/97), (479-479), (72+-72), bit32.bxor(183,0xAB))
 _llIIlll.BackgroundTransparency = (272-271)
 _llIIlll.ZIndex = _P199x._8x6q(14536/158)
 local _IIlIl = Instance.new("\70\114\97\109\101", _llIIlll)
 _IIlIl.Size = UDim2.new((219-219), (448-420), bit32.bxor(171,0xAB), (275-247))
 _IIlIl.BackgroundColor3 = _lIllIlll._IIlI
 _IIlIl.BackgroundTransparency = 0.82
 _IIlIl.BorderSizePixel = (39-39)
 _IIlIl.ZIndex = (10+82)
 Instance.new("\85\73\67\111\114\110\101\114", _IIlIl).CornerRadius = _llI.corner.sm
 local _l1lIl = Instance.new("\84\101\120\116\76\97\98\101\108", _IIlIl)
 _l1lIl.Size = UDim2.new((109+-108), _P199x._8x6q(0/88), _P199x._8x6q(91/91), _P199x._8x6q(0/65))
 _l1lIl.BackgroundTransparency = (224-223)
 _l1lIl.Text = _llIII == (278+-275) and "\33" or "\9888"
 _l1lIl.Font = Enum.Font.GothamBold
 _l1lIl.TextSize = _llI._lIl._l1lIl1
 _l1lIl.TextColor3 = _lIllIlll._IIlI
 _l1lIl.ZIndex = (186+-94)
 local _I1lIl = Instance.new("\84\101\120\116\76\97\98\101\108", _llIIlll)
 _I1lIl.Size = UDim2.new((128-127), -bit32.bxor(143,0xAB), (86+-85), (129+-129))
 _I1lIl.Position = UDim2.new(_P199x._8x6q(0/121), (94+-58), _P199x._8x6q(0/12), bit32.bxor(171,0xAB))
 _I1lIl.BackgroundTransparency = (276+-275)
 _I1lIl.Font = Enum.Font.GothamBold
 _I1lIl.TextSize = _llI._lIl._l1lIl1
 _I1lIl.TextColor3 = _lIllIlll._IIlI
 _I1lIl.Text = _lIllIlll._Illl
 _I1lIl.TextXAlignment = Enum.TextXAlignment.Left
 _I1lIl.ZIndex = _P199x._8x6q(14168/154)
 local _llllIl = Instance.new("\70\114\97\109\101", _I1lllll)
 _llllIl.LayoutOrder = (481-480)
 _llllIl.Size = UDim2.new(bit32.bxor(171,0xAB), (131+-31), (345-345), (506-484))
 _llllIl.BackgroundColor3 = _lIllIlll._IIlI
 _llllIl.BackgroundTransparency = 0.82
 _llllIl.BorderSizePixel = bit32.bxor(171,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _llllIl).CornerRadius = _llI.corner._lllIl1
 local _IIllIl = Instance.new("\84\101\120\116\76\97\98\101\108", _llllIl)
 _IIllIl.Size = UDim2.new(bit32.bxor(170,0xAB), (263-263), bit32.bxor(170,0xAB), bit32.bxor(171,0xAB))
 _IIllIl.BackgroundTransparency = _P199x._8x6q(161/161)
 _IIllIl.Font = Enum.Font.GothamMedium
 _IIllIl.TextSize = _llI._lIl.xs
 _IIllIl.TextColor3 = _lIllIlll._IIlI
 _IIllIl.Text = "\78\73\86\69\76\32" .. _llIII .. "\32\47\32\51"
 local _lIllIl = Instance.new("\70\114\97\109\101", _I1lllll)
 _lIllIl.LayoutOrder = (244-242)
 _lIllIl.Size = UDim2.new((297+-296), (81+-81), bit32.bxor(171,0xAB), (295+-295))
 _lIllIl.AutomaticSize = Enum.AutomaticSize.Y
 _lIllIl.BackgroundColor3 = C.surface
 _lIllIl.BorderSizePixel = (397-397)
 _lIllIl.ZIndex = bit32.bxor(240,0xAB)
 themed(_lIllIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 Instance.new("\85\73\67\111\114\110\101\114", _lIllIl).CornerRadius = _llI.corner.md
 local _lIIl = Instance.new("\85\73\80\97\100\100\105\110\103", _lIllIl)
 _lIIl.PaddingTop = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(167,0xAB)); _lIIl.PaddingBottom = UDim.new((72-72), (492-480))
 _lIIl.PaddingLeft = UDim.new(bit32.bxor(171,0xAB), (122+-108)); _lIIl.PaddingRight = UDim.new((215+-215), _P199x._8x6q(1526/109))
 local _IIIl = Instance.new("\84\101\120\116\76\97\98\101\108", _lIllIl)
 _IIIl.Size = UDim2.new((220+-219), (115+-115), (21-21), (130+-130))
 _IIIl.AutomaticSize = Enum.AutomaticSize.Y
 _IIIl.BackgroundTransparency = bit32.bxor(170,0xAB)
 _IIIl.Font = Enum.Font.Gotham
 _IIIl.TextSize = _llI._lIl.md
 _IIIl.TextColor3 = C._lIl
 _IIIl.TextWrapped = true
 _IIIl.TextXAlignment = Enum.TextXAlignment.Left
 _IIIl.TextYAlignment = Enum.TextYAlignment.Top
 _IIIl.Text = _I1lIlll
 _IIIl.ZIndex = _P199x._8x6q(16016/176)
 themed(_IIIl, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _llIIl = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lllll)
 _llIIl.LayoutOrder = (194-191)
 _llIIl.Size = UDim2.new(bit32.bxor(170,0xAB), (107-107), bit32.bxor(171,0xAB), bit32.bxor(165,0xAB))
 _llIIl.BackgroundTransparency = _P199x._8x6q(155/155)
 _llIIl.Font = Enum.Font.Gotham
 _llIIl.TextSize = _llI._lIl.xs
 _llIIl.TextColor3 = C.textDisabled
 _llIIl.Text = "\8212\32\78\88\32\83\121\115\116\101\109\32\32\118" .. _IIlll.getVersion()
 _llIIl.TextXAlignment = Enum.TextXAlignment.Right
 themed(_llIIl, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116\68\105\115\97\98\108\101\100")
 local function closeWarn()
 motionTween(_lllIl, TweenInfo.new(0.14), { Scale = 0.88 })
 motionTween(_l1lllll, TweenInfo.new(0.14), { BackgroundTransparency = (109+-108) })
 task.delay(0.16, function() if _l1lllll.Parent then _l1lllll:Destroy() end end)
 end
 local _IlIIl = Instance.new("\84\101\120\116\66\117\116\116\111\110", _I1lllll)
 _IlIIl.LayoutOrder = _P199x._8x6q(8/2)
 _IlIIl.Size = UDim2.new((106+-105), _P199x._8x6q(0/92), (84+-84), _P199x._8x6q(2196/61))
 _IlIIl.BackgroundColor3 = _lIllIlll._IIlI
 _IlIIl.BackgroundTransparency = 0.08
 _IlIIl.Text = "\69\110\116\101\110\100\105\100\111"
 _IlIIl.Font = Enum.Font.GothamMedium
 _IlIIl.TextSize = _llI._lIl.md
 _IlIIl.TextColor3 = C.onAccent
 _IlIIl.BorderSizePixel = bit32.bxor(171,0xAB)
 _IlIIl.AutoButtonColor = false
 Instance.new("\85\73\67\111\114\110\101\114", _IlIIl).CornerRadius = _llI.corner.md
 _IlIIl.MouseButton1Click:Connect(closeWarn)
 _l1lllll.InputBegan:Connect(function(_lIIIl)
 if _lIIIl.UserInputType == Enum.UserInputType.MouseButton1 then
 local p = _lIIIl.Position
 local _llIl, _l1lIlll = _I1lllll.AbsolutePosition, _I1lllll.AbsoluteSize
 if p.X < _llIl.X or p.X > _llIl.X + _l1lIlll.X or p.Y < _llIl.Y or p.Y > _llIl.Y + _l1lIlll.Y then
 closeWarn()
 end
 end
 end)
end
local function showLicenseDenied()
 _IIlIll.Active           = false
 _IIlIll.Text             = "\83\105\110\32\97\99\99\101\115\111"
 _IIlIll.BackgroundColor3 = C.surface
 _l1lIll.Text            = "\83\105\110\32\108\105\99\101\110\99\105\97\32\78\88\46"
 local _llI = _G.NXDS
 local _l1lllll = Instance.new("\70\114\97\109\101", _lllIlI)
 _l1lllll.Name                   = "\78\88\76\105\99\101\110\115\101\68\101\110\105\101\100"
 _l1lllll.Size                   = UDim2.new(_P199x._8x6q(143/143), bit32.bxor(171,0xAB), bit32.bxor(170,0xAB), bit32.bxor(171,0xAB))
 _l1lllll.BackgroundColor3       = Color3.fromRGB(_P199x._8x6q(0/100), (215+-215), (89+-89))
 _l1lllll.BackgroundTransparency = (288-287)
 _l1lllll.ZIndex                 = bit32.bxor(243,0xAB)
 motionTween(_l1lllll, TweenInfo.new(0.18), { BackgroundTransparency = 0.5 })
 local _I1lllll = Instance.new("\70\114\97\109\101", _l1lllll)
 _I1lllll.Size             = UDim2.new((267-267), bit32.bxor(471,0xAB), (10-10), (67+-67))
 _I1lllll.AutomaticSize    = Enum.AutomaticSize.Y
 _I1lllll.AnchorPoint      = Vector2.new(0.5, 0.5)
 _I1lllll.Position         = UDim2.new(0.5, bit32.bxor(171,0xAB), 0.5, (317-317))
 _I1lllll.BackgroundColor3 = C.elevated
 _I1lllll.BorderSizePixel  = bit32.bxor(171,0xAB)
 _I1lllll.ClipsDescendants = false
 _I1lllll.ZIndex           = (357-268)
 themed(_I1lllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 Instance.new("\85\73\67\111\114\110\101\114", _I1lllll).CornerRadius = _llI.corner._l1lIl1
 local _IIIIl = Instance.new("\85\73\83\116\114\111\107\101", _I1lllll)
 _IIIIl.Color = C.bad; _IIIIl.Thickness = (202+-201); _IIIIl.Transparency = 0.2
 local _l1IIl = Instance.new("\85\73\83\99\97\108\101", _I1lllll); _l1IIl.Scale = 0.88
 motionTween(_l1IIl, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = _P199x._8x6q(153/153) })
 local _I1IIl = Instance.new("\85\73\80\97\100\100\105\110\103", _I1lllll)
 _I1IIl.PaddingTop = UDim.new((172+-172), bit32.bxor(179,0xAB)); _I1IIl.PaddingBottom = UDim.new((81-81), (460-436))
 _I1IIl.PaddingLeft = UDim.new(_P199x._8x6q(0/9), bit32.bxor(179,0xAB)); _I1IIl.PaddingRight = UDim.new((149-149), (38-14))
 local _lllIIl = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _I1lllll)
 _lllIIl.Padding = UDim.new(_P199x._8x6q(0/36), _llI.space._l1lIl1); _lllIIl.SortOrder = Enum.SortOrder.LayoutOrder
 _lllIIl.HorizontalAlignment = Enum.HorizontalAlignment.Center
 local _IIlIIl = Instance.new("\70\114\97\109\101", _I1lllll)
 _IIlIIl.LayoutOrder           = _P199x._8x6q(0/154)
 _IIlIIl.Size                  = UDim2.new((261+-261), bit32.bxor(135,0xAB), bit32.bxor(171,0xAB), (1+43))
 _IIlIIl.BackgroundColor3      = C.bad
 _IIlIIl.BackgroundTransparency = 0.82
 _IIlIIl.BorderSizePixel       = _P199x._8x6q(0/195)
 Instance.new("\85\73\67\111\114\110\101\114", _IIlIIl).CornerRadius = _llI.corner._lllIl1
 local _lIlIIl = Instance.new("\84\101\120\116\76\97\98\101\108", _IIlIIl)
 _lIlIIl.Size                  = UDim2.new((86+-85), bit32.bxor(171,0xAB), (384-383), bit32.bxor(171,0xAB))
 _lIlIIl.BackgroundTransparency = (23+-22)
 _lIlIIl.Font                  = Enum.Font.GothamBold
 _lIlIIl.TextSize              = _llI._lIl.xl
 _lIlIIl.TextColor3            = C.bad
 _lIlIIl.Text                  = "\88"
 local _lllIl = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lllll)
 _lllIl.LayoutOrder           = (11-10)
 _lllIl.Size                  = UDim2.new(bit32.bxor(170,0xAB), (261-261), _P199x._8x6q(0/70), _P199x._8x6q(3630/165))
 _lllIl.BackgroundTransparency = (71-70)
 _lllIl.Font                  = Enum.Font.GothamBold
 _lllIl.TextSize              = _llI._lIl._I1llll
 _lllIl.TextColor3            = C._lIl
 _lllIl.Text                  = "\65\99\99\101\115\111\32\110\111\32\97\117\116\111\114\105\122\97\100\111"
 _lllIl.TextXAlignment        = Enum.TextXAlignment.Center
 themed(_lllIl, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _IllIl = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lllll)
 _IllIl.LayoutOrder           = (144-142)
 _IllIl.Size                  = UDim2.new(_P199x._8x6q(69/69), (197+-197), bit32.bxor(171,0xAB), (16+-16))
 _IllIl.AutomaticSize         = Enum.AutomaticSize.Y
 _IllIl.BackgroundTransparency = (90-89)
 _IllIl.Font                  = Enum.Font.Gotham
 _IllIl.TextSize              = _llI._lIl.md
 _IllIl.TextColor3            = C.subtext
 _IllIl.TextWrapped           = true
 _IllIl.TextXAlignment        = Enum.TextXAlignment.Center
 _IllIl.Text = "\84\117\32\99\117\101\110\116\97\32\40" .. _P199x._yp3z(_l.UserId)
 .. "\41\32\110\111\32\101\115\116\225\32\101\110\32\108\97\32\108\105\115\116\97\32\100\101\32\108\105\99\101\110\99\105\97\115\46\10\10\67\111\110\116\97\99\116\97\32\99\111\110\32\117\110\32\97\100\109\105\110\105\115\116\114\97\100\111\114\32\115\105\32\99\114\101\101\115\32\113\117\101\32\101\115\32\117\110\32\101\114\114\111\114\46"
 themed(_IllIl, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _llllIl = Instance.new("\70\114\97\109\101", _I1lllll)
 _llllIl.LayoutOrder      = (66-63)
 _llllIl.Size             = UDim2.new((258+-257), _P199x._8x6q(0/139), (209-209), _P199x._8x6q(4576/143))
 _llllIl.BackgroundColor3 = C.surface
 _llllIl.BorderSizePixel  = (1+-1)
 themed(_llllIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 Instance.new("\85\73\67\111\114\110\101\114", _llllIl).CornerRadius = _llI.corner.sm
 local _IlllIl = Instance.new("\84\101\120\116\76\97\98\101\108", _llllIl)
 _IlllIl.Size                  = UDim2.new(bit32.bxor(170,0xAB), -bit32.bxor(231,0xAB), _P199x._8x6q(38/38), (83-83))
 _IlllIl.Position              = UDim2.new((192+-192), (358-348), (67+-67), (366-366))
 _IlllIl.BackgroundTransparency = bit32.bxor(170,0xAB)
 _IlllIl.Font                  = Enum.Font.Code
 _IlllIl.TextSize              = _llI._lIl.md
 _IlllIl.TextColor3            = C._lIl
 _IlllIl.TextXAlignment        = Enum.TextXAlignment.Left
 _IlllIl.Text                  = "\85\115\101\114\73\100\58\32" .. _P199x._yp3z(_l.UserId)
 themed(_IlllIl, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _lIllIl = Instance.new("\84\101\120\116\66\117\116\116\111\110", _llllIl)
 _lIllIl.Size             = UDim2.new(_P199x._8x6q(0/19), _P199x._8x6q(7800/130), (88+-87), -(220+-212))
 _lIllIl.Position         = UDim2.new((53+-52), -(540-476), (245-245), _P199x._8x6q(496/124))
 _lIllIl.BackgroundColor3 = C._IlIll1
 _lIllIl.Text             = "\67\111\112\105\97\114"
 _lIllIl.Font             = Enum.Font.GothamMedium
 _lIllIl.TextSize         = _llI._lIl.sm
 _lIllIl.TextColor3       = C.onAccent
 _lIllIl.BorderSizePixel  = (35-35)
 _lIllIl.AutoButtonColor  = false
 themed(_lIllIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 themed(_lIllIl, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _lIllIl).CornerRadius = _llI.corner.sm
 _lIllIl.MouseButton1Click:Connect(function()
 _llII(_P199x._yp3z(_l.UserId))
 _lIllIl.Text = "\10003"
 task.delay(1.2, function() if _lIllIl.Parent then _lIllIl.Text = "\67\111\112\105\97\114" end end)
 end)
 local _IIllIl = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lllll)
 _IIllIl.LayoutOrder           = _P199x._8x6q(308/77)
 _IIllIl.Size                  = UDim2.new(bit32.bxor(170,0xAB), _P199x._8x6q(0/47), (215-215), (180+-166))
 _IIllIl.BackgroundTransparency = _P199x._8x6q(54/54)
 _IIllIl.Font                  = Enum.Font.Gotham
 _IIllIl.TextSize              = _llI._lIl.xs
 _IIllIl.TextColor3            = C.textDisabled
 _IIllIl.Text                  = "\78\88\32\83\121\115\116\101\109\32\32\118" .. _IIlll.getVersion()
 _IIllIl.TextXAlignment        = Enum.TextXAlignment.Center
 themed(_IIllIl, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116\68\105\115\97\98\108\101\100")
end
local function showCharacterModal(_l1l1, _l1llIl)
 local _lIllIl = _lllIlI:FindFirstChild("\67\104\97\114\77\111\100\97\108")
 if _lIllIl then _lIllIl:Destroy() end
 local _llI = _G.NXDS
 local _l1lllll = Instance.new("\70\114\97\109\101", _lllIlI)
 _l1lllll.Name = "\67\104\97\114\77\111\100\97\108"
 _l1lllll.Size = UDim2.new((138+-137), (251-251), bit32.bxor(170,0xAB), bit32.bxor(171,0xAB))
 _l1lllll.BackgroundColor3 = Color3.fromRGB(bit32.bxor(171,0xAB), (276+-276), _P199x._8x6q(0/116))
 _l1lllll.BackgroundTransparency = (451-450)
 _l1lllll.BorderSizePixel = (234+-234)
 _l1lllll.ZIndex = (251+-191)
 motionTween(_l1lllll, TweenInfo.new(0.18), { BackgroundTransparency = 0.5 })
 local _I1lllll = Instance.new("\70\114\97\109\101", _l1lllll)
 _I1lllll.Size = UDim2.new((266+-266), (259+121), _P199x._8x6q(0/173), (592-132))
 _I1lllll.AnchorPoint = Vector2.new(0.5, 0.5)
 _I1lllll.Position = UDim2.new(0.5, bit32.bxor(171,0xAB), 0.5, (181-181))
 _I1lllll.BackgroundColor3 = C.elevated
 _I1lllll.BorderSizePixel = _P199x._8x6q(0/162)
 _I1lllll.ClipsDescendants = true
 _I1lllll.ZIndex = _P199x._8x6q(4575/75)
 themed(_I1lllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 Instance.new("\85\73\67\111\114\110\101\114", _I1lllll).CornerRadius = _llI.corner._l1lIl1
 local _l1lIlll = Instance.new("\85\73\83\116\114\111\107\101", _I1lllll)
 _l1lIlll.Color = C._lIlI1; _l1lIlll.Transparency = 0.1; _l1lIlll.Thickness = _P199x._8x6q(146/146)
 themed(_l1lIlll, "\67\111\108\111\114", "\98\111\114\100\101\114")
 addDropShadow(_I1lllll, _l1lllll, bit32.bxor(151,0xAB), _P199x._8x6q(1950/65), 0.4)
 local _I1llIl = Instance.new("\85\73\83\99\97\108\101", _I1lllll)
 _I1llIl.Scale = 0.85
 motionTween(_I1llIl, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { Scale = (202+-201) })
 local function closeModal()
 motionTween(_I1llIl, TweenInfo.new(0.13), { Scale = 0.85 })
 motionTween(_l1lllll, TweenInfo.new(0.13), { BackgroundTransparency = (350-349) })
 task.delay(0.15, function() if _l1lllll and _l1lllll.Parent then _l1lllll:Destroy() end end)
 end
 local _IIIIlll = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lllll)
 _IIIIlll.Size = UDim2.new((427-426), -(235+-185), (174+-174), bit32.bxor(181,0xAB))
 _IIIIlll.Position = UDim2.new((46+-46), _P199x._8x6q(840/60), (347-347), (295+-285))
 _IIIIlll.BackgroundTransparency = bit32.bxor(170,0xAB)
 _IIIIlll.Font = Enum.Font.GothamBold
 _IIIIlll.TextSize = _llI._lIl._l1lIl1
 _IIIIlll.TextColor3 = C._lIl
 _IIIIlll.Text = "\65\118\97\116\97\114\32\100\101\32" .. _P199x._yp3z(_l1llIl)
 _IIIIlll.TextXAlignment = Enum.TextXAlignment.Left
 _IIIIlll.TextTruncate = Enum.TextTruncate.AtEnd
 _IIIIlll.ZIndex = _P199x._8x6q(2294/37)
 themed(_IIIIlll, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _lllllIl = Instance.new("\84\101\120\116\66\117\116\116\111\110", _I1lllll)
 _lllllIl.Size = UDim2.new(bit32.bxor(171,0xAB), (427-401), (207+-207), _P199x._8x6q(4134/159))
 _lllllIl.Position = UDim2.new((398-397), -_P199x._8x6q(2924/86), _P199x._8x6q(0/6), (424-414))
 _lllllIl.BackgroundColor3 = C.surface
 _lllllIl.Text = "\10005"
 _lllllIl.Font = Enum.Font.GothamBold
 _lllllIl.TextSize = _llI._lIl.md
 _lllllIl.TextColor3 = C.subtext
 _lllllIl.BorderSizePixel = _P199x._8x6q(0/26)
 _lllllIl.AutoButtonColor = false
 _lllllIl.ZIndex = _P199x._8x6q(1736/28)
 themed(_lllllIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 themed(_lllllIl, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 Instance.new("\85\73\67\111\114\110\101\114", _lllllIl).CornerRadius = _llI.corner.sm
 _lllllIl.MouseButton1Click:Connect(closeModal)
 local _IIlllIl = Instance.new("\70\114\97\109\101", _I1lllll)
 _IIlllIl.Size = UDim2.new(_P199x._8x6q(18/18), -(403-375), _P199x._8x6q(79/79), -bit32.bxor(147,0xAB))
 _IIlllIl.Position = UDim2.new((27+-27), (187-173), bit32.bxor(171,0xAB), _P199x._8x6q(1426/31))
 _IIlllIl.BackgroundColor3 = C.surface
 _IIlllIl.BorderSizePixel = (363-363)
 _IIlllIl.ClipsDescendants = true
 _IIlllIl.ZIndex = bit32.bxor(150,0xAB)
 themed(_IIlllIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 Instance.new("\85\73\67\111\114\110\101\114", _IIlllIl).CornerRadius = _llI.corner.md
 local _lIlllIl = Instance.new("\73\109\97\103\101\76\97\98\101\108", _IIlllIl)
 _lIlllIl.Size = UDim2.new((482-481), -(130-110), _P199x._8x6q(167/167), -(296+-246))
 _lIlllIl.Position = UDim2.new((339-339), (286+-276), _P199x._8x6q(0/18), (333-323))
 _lIlllIl.BackgroundTransparency = (75-74)
 _lIlllIl.ScaleType = Enum.ScaleType.Fit
 _lIlllIl.ZIndex = bit32.bxor(149,0xAB)
 local _lIlIl = Instance.new("\70\114\97\109\101", _IIlllIl)
 _lIlIl.Size = UDim2.new(bit32.bxor(170,0xAB), -(78+-58), bit32.bxor(171,0xAB), (113-85))
 _lIlIl.Position = UDim2.new(bit32.bxor(171,0xAB), bit32.bxor(161,0xAB), (450-449), -bit32.bxor(143,0xAB))
 _lIlIl.BackgroundTransparency = bit32.bxor(170,0xAB)
 _lIlIl.ZIndex = _P199x._8x6q(8253/131)
 local _IIlIl = {}
 local function set2DKind(_llIlIl, _lIlll)
 _lIlllIl.Image = ("\114\98\120\116\104\117\109\98\58\47\47\116\121\112\101\61\37\115\38\105\100\61\37\100\38\119\61\52\50\48\38\104\61\52\50\48"):format(_llIlIl, _l1l1)
 for _, b in ipairs(_IIlIl) do
 b.BackgroundColor3 = C.surface
 b.TextColor3 = C.subtext
 end
 _lIlll.BackgroundColor3 = C._IlIll1
 _lIlll.TextColor3 = C.onAccent
 end
 local _IlIlIl = { {"\67\117\101\114\112\111", "\65\118\97\116\97\114"}, {"\66\117\115\116\111", "\65\118\97\116\97\114\66\117\115\116"}, {"\67\97\98\101\122\97", "\65\118\97\116\97\114\72\101\97\100\83\104\111\116"} }
 for i, k in ipairs(_IlIlIl) do
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110", _lIlIl)
 b.Size = UDim2.new(_P199x._8x6q(0/86), (192+-106), bit32.bxor(170,0xAB), (113+-113))
 b.Position = UDim2.new((6+-6), (i - (405-404)) * (144+-52), (81-81), (49+-49))
 b.BackgroundColor3 = C.surface
 b.Text = k[_P199x._8x6q(50/50)]
 b.Font = Enum.Font.GothamMedium
 b.TextSize = _llI._lIl.sm
 b.TextColor3 = C.subtext
 b.BorderSizePixel = (426-426)
 b.AutoButtonColor = false
 b.ZIndex = (33+31)
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = _llI.corner.sm
 _P199x._l50o(_IIlIl, b)
 b.MouseButton1Click:Connect(function() set2DKind(k[(26+-24)], b) end)
 end
 set2DKind("\65\118\97\116\97\114", _IIlIl[bit32.bxor(170,0xAB)])
 _l1lllll.InputBegan:Connect(function(_Illl)
 if _Illl.UserInputType == Enum.UserInputType.MouseButton1
 or _Illl.UserInputType == Enum.UserInputType.Touch then
 local _IIlIlll = _Illl.Position
 local _llIl = _I1lllll.AbsolutePosition
 local _lIIlIl = _I1lllll.AbsoluteSize
 if _IIlIlll.X < _llIl.X or _IIlIlll.X > _llIl.X + _lIIlIl.X
 or _IIlIlll.Y < _llIl.Y or _IIlIlll.Y > _llIl.Y + _lIIlIl.Y then
 closeModal()
 end
 end
 end)
end
local function addRow(_lllI, _Illl, _lIll, _IIIlIl, _l1IlIl)
 local _llI = _G.NXDS
 return _llI.makeDataRow(_lllI, _Illl, _P199x._yp3z(_lIll == nil and "\78\111\32\100\105\115\112\111\110\105\98\108\101" or _lIll), {
 _l1IlIl = _l1IlIl,
 _IIIlIl = _IIIlIl,
 })
end
local function addDescription(_lllI, _lIl)
 local _llI = _G.NXDS
 _lIl = _P199x._yp3z(_lIl or "\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110")
 local _I1IlIl = (_lIl == "" or _lIl == "\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110" or _lIl == "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 local _IlI = _llI.makeCard(_lllI, { _I1llll = "\68\101\115\99\114\105\112\99\105\243\110" })
 local _llIIlll = Instance.new("\70\114\97\109\101", _IlI)
 _llIIlll.LayoutOrder = bit32.bxor(170,0xAB)
 _llIIlll.Size = UDim2.new(_P199x._8x6q(76/76), (272+-272), (111+-111), _P199x._8x6q(3060/153))
 _llIIlll.BackgroundTransparency = (430-429)
 local _lllIlIl = Instance.new("\84\101\120\116\76\97\98\101\108", _llIIlll)
 _lllIlIl.Size = UDim2.new((141+-141), (178+-108), bit32.bxor(170,0xAB), (178-178))
do local _k635=math.abs(-0);if _ecak>1 then warn("")end end
 _lllIlIl.BackgroundTransparency = bit32.bxor(170,0xAB)
 _lllIlIl.Font = Enum.Font.Gotham; _lllIlIl.TextSize = _llI._lIl.xs
 _lllIlIl.TextColor3 = C.textDisabled
 _lllIlIl.Text = _I1IlIl and "\118\97\99\237\97" or (#_lIl .. "\32\99\97\114\46")
 _lllIlIl.TextXAlignment = Enum.TextXAlignment.Left
 themed(_lllIlIl, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116\68\105\115\97\98\108\101\100")
 local _IIlIlIl = _llI.makeButton(_llIIlll, "\67\111\112\105\97\114", _I1IlIl and "\103\104\111\115\116" or "\115\101\99\111\110\100\97\114\121",
 {_I1Ill1 = UDim2.new((70+-70), (447-387), bit32.bxor(171,0xAB), _P199x._8x6q(2160/108))})
 _IIlIlIl.AnchorPoint = Vector2.new(bit32.bxor(170,0xAB), _P199x._8x6q(0/154))
 _IIlIlIl.Position = UDim2.new(_P199x._8x6q(47/47), _P199x._8x6q(0/124), _P199x._8x6q(0/99), bit32.bxor(171,0xAB))
 _IIlIlIl.TextSize = _llI._lIl.xs
 _IIlIlIl.MouseButton1Click:Connect(function()
 if _I1IlIl then
 _l1lIll.Text = "\69\115\116\101\32\117\115\117\97\114\105\111\32\110\111\32\116\105\101\110\101\32\100\101\115\99\114\105\112\99\105\243\110"
 return
 end
 _llII(_lIl)
 _l1lIll.Text = "\67\111\112\105\97\100\111\58\32\100\101\115\99\114\105\112\99\105\243\110\32\40" .. #_lIl .. "\32\99\97\114\97\99\116\101\114\101\115\41"
 _IIlIlIl.Text = "\67\111\112\105\97\100\111"
 task.delay(1.2, function()
 if _IIlIlIl and _IIlIlIl.Parent then _IIlIlIl.Text = "\67\111\112\105\97\114" end
 end)
 end)
 local _Ill = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 _Ill.LayoutOrder = (312-307)
 _Ill.Size = UDim2.new(bit32.bxor(170,0xAB), _P199x._8x6q(0/73), (447-447), (223+-223))
 _Ill.AutomaticSize = Enum.AutomaticSize.Y
 _Ill.BackgroundTransparency = _P199x._8x6q(147/147)
 _Ill.Font = Enum.Font.Gotham; _Ill.TextSize = _llI._lIl.md
 _Ill.TextColor3 = C._lIl; _Ill.TextWrapped = true
 _Ill.TextXAlignment = Enum.TextXAlignment.Left
 _Ill.TextYAlignment = Enum.TextYAlignment.Top
 _Ill.Text = _lIl
 themed(_Ill, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _lIlIlIl = (396-216)
 local _llIIl = #_lIl > _lIlIlIl
 local _IlIIl = false
 local function refresh()
 if (not _llIIl) or _IlIIl then _Ill.Text = _lIl
 else _Ill.Text = _lIl:_IllIlIl((21-20), _lIlIlIl) .. "\46\46\46" end
 end
 refresh()
 if _llIIl then
 local _lllIIl = _llI.makeButton(_IlI, "\77\111\115\116\114\97\114\32\109\225\115", "\103\104\111\115\116", {_IIIl = (57+-51)})
 _lllIIl.TextSize = _llI._lIl.sm
 _lllIIl.TextColor3 = C._IlIll1
 themed(_lllIIl, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 _lllIIl.MouseButton1Click:Connect(function()
 _IlIIl = not _IlIIl
 _lllIIl.Text = _IlIIl and "\77\111\115\116\114\97\114\32\109\101\110\111\115" or "\77\111\115\116\114\97\114\32\109\225\115"
 refresh()
 end)
 end
 return _IlI
end
local function addNoteCard(_lllI, _IllIIl, _lIlIIl, _IIlIIl)
 local _llI = _G.NXDS
 local _IlI = _llI.makeCard(_lllI, { _I1llll = _IllIIl })
 if _IIlIIl then
 for _, _lIllI in ipairs(_IlI:GetChildren()) do
 if _lIllI:IsA("\84\101\120\116\76\97\98\101\108") and _lIllI.Text == _IllIIl then
 _lIllI.TextColor3 = _IIlIIl
 break
 end
 end
 end
 local b = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 b.LayoutOrder = _P199x._8x6q(980/98)
 b.Size = UDim2.new(_P199x._8x6q(137/137), (98-98), bit32.bxor(171,0xAB), _P199x._8x6q(0/69))
 b.AutomaticSize = Enum.AutomaticSize.Y
 b.BackgroundTransparency = (36-35)
 b.Font = Enum.Font.Gotham
 b.TextSize = _llI._lIl.md
 b.TextColor3 = C._lIl
 b.TextWrapped = true
 b.TextXAlignment = Enum.TextXAlignment.Left
 b.TextYAlignment = Enum.TextYAlignment.Top
 b.Text = _lIlIIl
 themed(b, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 return _IlI
end
local function addScoreBar(_lllI, _Illl, _IllI, _lIlI, _IIlI, _IIIl)
 local _llI = _G.NXDS
 return _llI.makeScoreBar(_lllI, _Illl, _IllI, _lIlI, _IIlI, _IIIl)
end
local function clearScroll(_lI1ll)
 for _, c in ipairs(_lI1ll:GetChildren()) do
 if not c:IsA("\85\73\76\105\115\116\76\97\121\111\117\116") and not c:IsA("\85\73\80\97\100\100\105\110\103") then c:Destroy() end
 end
end
function _lllII(_lllllI)
 local _l1lIIl = {}
 local _I1lIIl = {}
 local function flush()
 if #_I1lIIl == (423-423) then return end
 local _IIlII = apiPost("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115", {
 userIds = _I1lIIl, excludeBannedUsers = false,
 })
 if _IIlII and _IIlII._I1lI then
 for _, u in ipairs(_IIlII._I1lI) do
 _l1lIIl[u._lllI1] = { _lll = u._lll, _llllllIl = u._llllllIl, _I1IlI = u.hasVerifiedBadge }
 end
 end
 _I1lIIl = {}
 end
 for _, _lllI1 in ipairs(_lllllI) do
 _P199x._l50o(_I1lIIl, _lllI1)
 if #_I1lIIl >= (273+-173) then flush() end
 end
 flush()
 return _l1lIIl
end
local function showMiniProfileCard(_l1l1, _llllIIl)
 _llllIIl = _llllIIl or {}
 local _lIllIl = _lllIlI:FindFirstChild("\77\105\110\105\67\97\114\100")
 if _lIllIl then _lIllIl:Destroy() end
 local _l1lllll = Instance.new("\70\114\97\109\101", _lllIlI)
 _l1lllll.Name = "\77\105\110\105\67\97\114\100"
 _l1lllll.Size = UDim2.new(_P199x._8x6q(7/7), bit32.bxor(171,0xAB), _P199x._8x6q(64/64), (321-321))
 _l1lllll.BackgroundColor3 = Color3.fromRGB(_P199x._8x6q(0/102), (394-394), bit32.bxor(171,0xAB))
 _l1lllll.BackgroundTransparency = (52+-51)
 _l1lllll.BorderSizePixel = bit32.bxor(171,0xAB)
 _l1lllll.ZIndex = (12+58)
 motionTween(_l1lllll, TweenInfo.new(0.2), { BackgroundTransparency = 0.45 })
 local _llI = _G.NXDS
 local _IlI = Instance.new("\70\114\97\109\101", _l1lllll)
 _IlI.Size = UDim2.new((171-171), _P199x._8x6q(20160/63), (298-298), bit32.bxor(333,0xAB))
 _IlI.AnchorPoint = Vector2.new(0.5, 0.5)
 _IlI.Position = UDim2.new(0.5, bit32.bxor(171,0xAB), 0.5, _P199x._8x6q(0/124))
 _IlI.BackgroundColor3 = C.elevated
 _IlI.BorderSizePixel = bit32.bxor(171,0xAB)
 _IlI.ClipsDescendants = true
 _IlI.ZIndex = (193+-122)
 themed(_IlI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 Instance.new("\85\73\67\111\114\110\101\114", _IlI).CornerRadius = _llI.corner._l1lIl1
 local _IIllIIl = Instance.new("\85\73\83\116\114\111\107\101", _IlI)
 _IIllIIl.Color = C._lIlI1; _IIllIIl.Transparency = 0.1; _IIllIIl.Thickness = (149-148)
 themed(_IIllIIl, "\67\111\108\111\114", "\98\111\114\100\101\114")
 addDropShadow(_IlI, _l1lllll, (166+-96), _P199x._8x6q(2940/98), 0.4)
 local _I1llIl = Instance.new("\85\73\83\99\97\108\101", _IlI)
 _I1llIl.Scale = 0.85
 motionTween(_I1llIl, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { Scale = _P199x._8x6q(198/198) })
 local function closeCard()
 motionTween(_I1llIl, TweenInfo.new(0.14), { Scale = 0.85 })
 motionTween(_l1lllll, TweenInfo.new(0.14), { BackgroundTransparency = _P199x._8x6q(54/54) })
 task.delay(0.16, function() if _l1lllll and _l1lllll.Parent then _l1lllll:Destroy() end end)
 end
 local _Ill = Instance.new("\70\114\97\109\101", _IlI)
 _Ill.Size = UDim2.new(bit32.bxor(170,0xAB), bit32.bxor(171,0xAB), bit32.bxor(170,0xAB), _P199x._8x6q(0/177))
 _Ill.BackgroundTransparency = _P199x._8x6q(19/19)
 _Ill.ZIndex = bit32.bxor(227,0xAB)
 local _lIll = Instance.new("\85\73\80\97\100\100\105\110\103", _Ill)
 _lIll.PaddingTop = UDim.new((121+-121), (77+-61)); _lIll.PaddingBottom = UDim.new((154+-154), bit32.bxor(165,0xAB))
 _lIll.PaddingLeft = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(165,0xAB)); _lIll.PaddingRight = UDim.new(_P199x._8x6q(0/54), (118+-104))
 local _lll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _Ill)
 _lll.Padding = UDim.new((21+-21), (115+-108)); _lll.SortOrder = Enum.SortOrder.LayoutOrder
 _lll.HorizontalAlignment = Enum.HorizontalAlignment.Center
 local _lIllIIl = Instance.new("\84\101\120\116\66\117\116\116\111\110", _IlI)
 _lIllIIl.Size = UDim2.new((129-129), bit32.bxor(177,0xAB), (356-356), bit32.bxor(177,0xAB))
 _lIllIIl.Position = UDim2.new((343-342), -_P199x._8x6q(4576/143), _P199x._8x6q(0/95), _P199x._8x6q(528/88))
 _lIllIIl.BackgroundColor3 = C.surface
 _lIllIIl.Text = "\10005"
 _lIllIIl.Font = Enum.Font.GothamBold
 _lIllIIl.TextSize = _llI._lIl.md
 _lIllIIl.TextColor3 = C.subtext
 _lIllIIl.BorderSizePixel = (353-353)
 _lIllIIl.AutoButtonColor = false
 _lIllIIl.ZIndex = (251+-177)
 themed(_lIllIIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 themed(_lIllIIl, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 Instance.new("\85\73\67\111\114\110\101\114", _lIllIIl).CornerRadius = _llI.corner.sm
 _lIllIIl.MouseButton1Click:Connect(closeCard)
 local _lIIIl = Instance.new("\73\109\97\103\101\76\97\98\101\108", _Ill)
 _lIIIl.LayoutOrder = (71-71)
 _lIIIl.Size = UDim2.new(_P199x._8x6q(0/95), _P199x._8x6q(12450/83), (248+-248), bit32.bxor(61,0xAB))
 _lIIIl.BackgroundColor3 = C._IlI
 _lIIIl.BorderSizePixel = bit32.bxor(171,0xAB)
 _lIIIl.Image = ("\114\98\120\116\104\117\109\98\58\47\47\116\121\112\101\61\65\118\97\116\97\114\38\105\100\61\37\100\38\119\61\52\50\48\38\104\61\52\50\48"):format(_l1l1)
 _lIIIl.ZIndex = (23+49)
 Instance.new("\85\73\67\111\114\110\101\114", _lIIIl).CornerRadius = UDim.new((247+-247), bit32.bxor(167,0xAB))
 local _IIIIl = Instance.new("\84\101\120\116\76\97\98\101\108", _Ill)
 _IIIIl.LayoutOrder = bit32.bxor(170,0xAB)
 _IIIIl.Size = UDim2.new(_P199x._8x6q(36/36), (1-1), (143+-143), (47-23))
 _IIIIl.BackgroundTransparency = bit32.bxor(170,0xAB)
 _IIIIl.Font = Enum.Font.GothamBold
 _IIIIl.TextSize = (353-335)
 _IIIIl.TextColor3 = C._lIl
 _IIIIl.Text = _llllIIl._llllllIl or _llllIIl._lll or "\67\97\114\103\97\110\100\111\46\46\46"
 _IIIIl.TextXAlignment = Enum.TextXAlignment.Center
 _IIIIl.TextTruncate = Enum.TextTruncate.AtEnd
 _IIIIl.ZIndex = (189+-117)
 local _llIIIl = Instance.new("\84\101\120\116\76\97\98\101\108", _Ill)
 _llIIIl.LayoutOrder = bit32.bxor(169,0xAB)
 _llIIIl.Size = UDim2.new((135-134), _P199x._8x6q(0/170), bit32.bxor(171,0xAB), bit32.bxor(187,0xAB))
 _llIIIl.BackgroundTransparency = (144+-143)
 _llIIIl.Font = Enum.Font.Gotham
 _llIIIl.TextSize = (235+-222)
 _llIIIl.TextColor3 = C.subtext
 _llIIIl.Text = "\64" .. (_llllIIl._lll or "\46\46\46")
 _llIIIl.TextXAlignment = Enum.TextXAlignment.Center
 _llIIIl.TextTruncate = Enum.TextTruncate.AtEnd
 _llIIIl.ZIndex = bit32.bxor(227,0xAB)
 local _IlIIIl = _llllIIl._lll or _P199x._yp3z(_l1l1)
 local _lIIIIl = nil
 local _llIlll = Instance.new("\70\114\97\109\101", _Ill)
 _llIlll.LayoutOrder = (36-33)
 _llIlll.Size = UDim2.new(bit32.bxor(170,0xAB), _P199x._8x6q(0/81), _P199x._8x6q(0/2), _P199x._8x6q(3668/131))
 _llIlll.BackgroundTransparency = (127+-126)
 _llIlll.ZIndex = (158-86)
 local _IlIlll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _llIlll)
 _IlIlll.FillDirection = Enum.FillDirection.Horizontal
 _IlIlll.Padding = UDim.new((3+-3), _P199x._8x6q(876/146))
 _IlIlll.HorizontalAlignment = Enum.HorizontalAlignment.Center
 _IlIlll.SortOrder = Enum.SortOrder.LayoutOrder
 local _lllIlll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _llIlll)
 _lllIlll.LayoutOrder = (104+-103)
 _lllIlll.Size = UDim2.new(_P199x._8x6q(0/161), (80+58), (254+-254), _P199x._8x6q(1008/36))
 _lllIlll.BackgroundColor3 = C._IlIll1
 _lllIlll.Text = "\67\111\112\105\97\114\32\117\115\117\97\114\105\111"
 _lllIlll.Font = Enum.Font.GothamBold
 _lllIlll.TextSize = (44+-32)
 _lllIlll.TextColor3 = C.onAccent
 _lllIlll.BorderSizePixel = (131+-131)
 _lllIlll.AutoButtonColor = false
 _lllIlll.ZIndex = _P199x._8x6q(1944/27)
 Instance.new("\85\73\67\111\114\110\101\114", _lllIlll).CornerRadius = UDim.new((120-120), (55-49))
 _lllIlll.MouseButton1Click:Connect(function()
 _llII(_IlIIIl)
 _lllIlll.Text = "\10003\32\67\111\112\105\97\100\111"
 task.delay(1.1, function() if _lllIlll and _lllIlll.Parent then _lllIlll.Text = "\67\111\112\105\97\114\32\117\115\117\97\114\105\111" end end)
 end)
 local _IIIIIl = Instance.new("\84\101\120\116\66\117\116\116\111\110", _llIlll)
 _IIIIIl.LayoutOrder = (247-245)
 _IIIIIl.Size = UDim2.new(_P199x._8x6q(0/9), (266-118), _P199x._8x6q(0/19), bit32.bxor(183,0xAB))
 _IIIIIl.BackgroundColor3 = C.surface
 _IIIIIl.Text = "\67\111\112\105\97\114\32\100\101\115\99\114\105\112\99\105\243\110"
 _IIIIIl.Font = Enum.Font.GothamMedium
 _IIIIIl.TextSize = _llI._lIl.sm
 _IIIIIl.TextColor3 = C._lIl
 _IIIIIl.BorderSizePixel = (227+-227)
 _IIIIIl.AutoButtonColor = false
do local _cfs4bq=1 while _cfs4bq>0 do if _cfs4bq==1 then
 _IIIIIl.ZIndex = (185+-113)
 themed(_IIIIIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 themed(_IIIIIl, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 Instance.new("\85\73\67\111\114\110\101\114", _IIIIIl).CornerRadius = _llI.corner.sm
_cfs4bq=0 end end end
 local _l1IIIl = Instance.new("\85\73\83\116\114\111\107\101", _IIIIIl)
 _l1IIIl.Color = C._lIlI1; _l1IIIl.Thickness = bit32.bxor(170,0xAB)
 themed(_l1IIIl, "\67\111\108\111\114", "\98\111\114\100\101\114")
 _IIIIIl.MouseButton1Click:Connect(function()
 if not _lIIIIl or _lIIIIl == "" then
 _IIIIIl.Text = "\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110"
 task.delay(1.3, function()
 if _IIIIIl and _IIIIIl.Parent then _IIIIIl.Text = "\67\111\112\105\97\114\32\100\101\115\99\114\105\112\99\105\243\110" end
 end)
 return
 end
 _llII(_lIIIIl)
 _IIIIIl.Text = "\10003\32\67\111\112\105\97\100\111"
 task.delay(1.1, function()
 if _IIIIIl and _IIIIIl.Parent then _IIIIIl.Text = "\67\111\112\105\97\114\32\100\101\115\99\114\105\112\99\105\243\110" end
 end)
 end)
 local _I1IIIl = Instance.new("\70\114\97\109\101", _Ill)
 _I1IIIl.LayoutOrder = _P199x._8x6q(228/57)
 _I1IIIl.Size = UDim2.new((107-106), _P199x._8x6q(0/67), bit32.bxor(171,0xAB), bit32.bxor(170,0xAB))
 _I1IIIl.BackgroundColor3 = C._lIlI1
 _I1IIIl.BorderSizePixel = (283+-283)
 _I1IIIl.ZIndex = bit32.bxor(227,0xAB)
 local _lllIIIl = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _Ill)
 _lllIIIl.LayoutOrder = bit32.bxor(174,0xAB)
 _lllIIIl.Size = UDim2.new((61-60), bit32.bxor(171,0xAB), (359-359), bit32.bxor(237,0xAB))
 _lllIIIl.BackgroundColor3 = C._IlI
 _lllIIIl.BackgroundTransparency = 0.4
 _lllIIIl.BorderSizePixel = _P199x._8x6q(0/117)
 _lllIIIl.ScrollBarThickness = (131-128)
 _lllIIIl.ScrollBarImageColor3 = C._IlIll1
 _lllIIIl.CanvasSize = UDim2.new(bit32.bxor(171,0xAB), _P199x._8x6q(0/174), (39-39), (112-112))
 _lllIIIl.AutomaticCanvasSize = Enum.AutomaticSize.Y
 _lllIIIl.ZIndex = (352-280)
 Instance.new("\85\73\67\111\114\110\101\114", _lllIIIl).CornerRadius = UDim.new((463-463), (39+-33))
 local _IIlIIIl = Instance.new("\85\73\80\97\100\100\105\110\103", _lllIIIl)
 _IIlIIIl.PaddingTop = UDim.new((70+-70), bit32.bxor(173,0xAB)); _IIlIIIl.PaddingBottom = UDim.new((17-17), (40-34))
 _IIlIIIl.PaddingLeft = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(163,0xAB)); _IIlIIIl.PaddingRight = UDim.new((485-485), (67+-59))
 local _lIlIIIl = Instance.new("\84\101\120\116\76\97\98\101\108", _lllIIIl)
 _lIlIIIl.Size = UDim2.new((325-324), _P199x._8x6q(0/93), (146+-146), bit32.bxor(171,0xAB))
 _lIlIIIl.AutomaticSize = Enum.AutomaticSize.Y
 _lIlIIIl.BackgroundTransparency = (266-265)
 _lIlIIIl.Font = Enum.Font.Gotham
 _lIlIIIl.TextSize = bit32.bxor(167,0xAB)
 _lIlIIIl.TextColor3 = C._lIl
 _lIlIIIl.TextWrapped = true
 _lIlIIIl.TextXAlignment = Enum.TextXAlignment.Left
 _lIlIIIl.TextYAlignment = Enum.TextYAlignment.Top
 _lIlIIIl.Text = "\67\97\114\103\97\110\100\111\32\100\101\115\99\114\105\112\99\105\243\110\46\46\46"
 _lIlIIIl.ZIndex = bit32.bxor(227,0xAB)
 local function infoRow(_ll1Il, _Illl)
 local _llll = Instance.new("\70\114\97\109\101", _Ill)
 _llll.LayoutOrder = _ll1Il
 _llll.Size = UDim2.new(_P199x._8x6q(193/193), _P199x._8x6q(0/102), (73-73), bit32.bxor(189,0xAB))
 _llll.BackgroundTransparency = _P199x._8x6q(101/101)
 _llll.ZIndex = (358-286)
 local l = Instance.new("\84\101\120\116\76\97\98\101\108", _llll)
 l.Size = UDim2.new(0.5, bit32.bxor(171,0xAB), bit32.bxor(170,0xAB), _P199x._8x6q(0/24))
 l.BackgroundTransparency = (56-55)
 l.Font = Enum.Font.Gotham; l.TextSize = bit32.bxor(167,0xAB); l.TextColor3 = C.subtext
 l.Text = _Illl; l.TextXAlignment = Enum.TextXAlignment.Left; l.ZIndex = (15+57)
 local v = Instance.new("\84\101\120\116\76\97\98\101\108", _llll)
 v.Size = UDim2.new(0.5, bit32.bxor(171,0xAB), bit32.bxor(170,0xAB), _P199x._8x6q(0/68)); v.Position = UDim2.new(0.5, _P199x._8x6q(0/39), (123-123), bit32.bxor(171,0xAB))
 v.BackgroundTransparency = _P199x._8x6q(37/37)
 v.Font = Enum.Font.GothamBold; v.TextSize = (321-309); v.TextColor3 = C._lIl
 v.Text = "\46\46\46"; v.TextXAlignment = Enum.TextXAlignment.Right
 v.TextTruncate = Enum.TextTruncate.AtEnd; v.ZIndex = (167-95)
 return v
 end
 local _Il1Il = infoRow(_P199x._8x6q(948/158), "\65\109\105\103\111\115")
 local _lll1Il = infoRow(_P199x._8x6q(1099/157), "\69\100\97\100\32\100\101\32\99\117\101\110\116\97")
 local _Ill1Il = infoRow((438-430), "\86\101\114\105\102\105\99\97\100\111")
 local _lIl1Il = Instance.new("\84\101\120\116\66\117\116\116\111\110", _Ill)
 _lIl1Il.LayoutOrder = _P199x._8x6q(1557/173)
 _lIl1Il.Size = UDim2.new((207+-206), (39-39), bit32.bxor(171,0xAB), _P199x._8x6q(2250/75))
 _lIl1Il.BackgroundColor3 = C._IlIll1
 _lIl1Il.Text = "\65\110\225\108\105\115\105\115\32\99\111\109\112\108\101\116\111\32\8594"
 _lIl1Il.Font = Enum.Font.GothamMedium
 _lIl1Il.TextSize = _llI._lIl.md
 _lIl1Il.TextColor3 = C.onAccent
 _lIl1Il.BorderSizePixel = bit32.bxor(171,0xAB)
 _lIl1Il.AutoButtonColor = false
 _lIl1Il.ZIndex = bit32.bxor(227,0xAB)
 themed(_lIl1Il, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 themed(_lIl1Il, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _lIl1Il).CornerRadius = _llI.corner.md
 _lIl1Il.MouseButton1Click:Connect(function()
 closeCard()
 _I1Illl.Text = _IlIIIl
 showPage(_llI1ll)
 if _lIlIll then _lIlIll(_P199x._yp3z(_l1l1)) end
 end)
 _l1lllll.InputBegan:Connect(function(_Illl)
 if _Illl.UserInputType == Enum.UserInputType.MouseButton1
 or _Illl.UserInputType == Enum.UserInputType.Touch then
 local p = _Illl.Position
 local _llIl = _IlI.AbsolutePosition
 local _l1lIlll = _IlI.AbsoluteSize
 if p.X < _llIl.X or p.X > _llIl.X + _l1lIlll.X or p.Y < _llIl.Y or p.Y > _llIl.Y + _l1lIlll.Y then
 closeCard()
 end
 end
 end)
 task.spawn(function()
 local _IIl1Il = "\95\109\105\110\105\80\114\111\102\105\108\101\95" .. _l1l1
 local _l1l1Il = _P199x._4xzj(_G, _IIl1Il)
 local _ll1I, fc
 if _l1l1Il and (os.clock() - (_l1l1Il._at or bit32.bxor(171,0xAB))) < (220+-100) then
 _ll1I, fc = _l1l1Il._ll1I, _l1l1Il.fc
 else
 _ll1I = apiGet("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1)
 fc = apiGet("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1 .. "\47\102\114\105\101\110\100\115\47\99\111\117\110\116")
 _P199x._wnek(_G, _IIl1Il, { _ll1I = _ll1I, fc = fc, _at = os.clock() })
 end
 if not _l1lllll.Parent then return end
 if _ll1I then
 _IlIIIl = _ll1I._lll or _IlIIIl
 _IIIIl.Text = _ll1I._llllllIl or _ll1I._lll or ("\73\68\32" .. _l1l1)
 _llIIIl.Text = "\64" .. (_ll1I._lll or "\63")
 _lIIIIl = (_ll1I.description and _ll1I.description ~= "" and _ll1I.description) or nil
 _lIlIIIl.Text = _lIIIIl or "\83\105\110\32\100\101\115\99\114\105\112\99\105\243\110"
 _Ill1Il.Text = _ll1I.hasVerifiedBadge and "\83\237" or "\78\111"
 local _, ageLabel = formatAge(_ll1I._llllI)
 _lll1Il.Text = ageLabel or "\78\111\32\100\105\115\112\111\110\105\98\108\101"
 else
 _lIlIIIl.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46"
 end
 _Il1Il.Text = (fc and fc.count ~= nil) and _P199x._yp3z(fc.count) or "\63"
 end)
end
local function addFriendsDropdown(_lllI, _I1lI, _IIIl)
 local _llI = _G.NXDS
 local _I1l1Il = (260+40)
 local _l1l1 = _I1lI.UserId
 local _llll1Il = Instance.new("\70\114\97\109\101", _lllI)
 _llll1Il.LayoutOrder = _IIIl
 _llll1Il.Size = UDim2.new(_P199x._8x6q(76/76), -bit32.bxor(175,0xAB), _P199x._8x6q(0/179), (21-21))
 _llll1Il.AutomaticSize = Enum.AutomaticSize.Y
 _llll1Il.BackgroundTransparency = _P199x._8x6q(145/145)
 local _IIll1Il = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _llll1Il)
 _IIll1Il.Padding = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(175,0xAB)); _IIll1Il.SortOrder = Enum.SortOrder.LayoutOrder
 local _IIllll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _llll1Il)
 _IIllll.LayoutOrder = bit32.bxor(171,0xAB)
 _IIllll.Size = UDim2.new((225-224), (189+-189), bit32.bxor(171,0xAB), bit32.bxor(183,0xAB))
 _IIllll.BackgroundColor3 = C._IlI
 _IIllll.AutoButtonColor = false
 _IIllll.Text = ""
 _IIllll.BorderSizePixel = (21+-21)
 Instance.new("\85\73\67\111\114\110\101\114", _IIllll).CornerRadius = UDim.new(bit32.bxor(171,0xAB), (251-247))
 themed(_IIllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _lIll1Il = Instance.new("\84\101\120\116\76\97\98\101\108", _IIllll)
 _lIll1Il.Size = UDim2.new(0.5, -_P199x._8x6q(1580/158), (279+-278), bit32.bxor(171,0xAB)); _lIll1Il.Position = UDim2.new((277+-277), (185+-175), bit32.bxor(171,0xAB), (124+-124))
 _lIll1Il.BackgroundTransparency = (168+-167); _lIll1Il.Font = Enum.Font.Gotham; _lIll1Il.TextSize = (101+-88)
 _lIll1Il.TextColor3 = C.subtext; _lIll1Il.Text = "\65\109\105\103\111\115"; _lIll1Il.TextXAlignment = Enum.TextXAlignment.Left
 themed(_lIll1Il, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _lI1Il = Instance.new("\84\101\120\116\76\97\98\101\108", _IIllll)
 _lI1Il.Size = UDim2.new(0.5, -_P199x._8x6q(1216/32), bit32.bxor(170,0xAB), (4+-4)); _lI1Il.Position = UDim2.new(0.5, bit32.bxor(171,0xAB), bit32.bxor(171,0xAB), (79-79))
 _lI1Il.BackgroundTransparency = bit32.bxor(170,0xAB); _lI1Il.Font = Enum.Font.GothamBold; _lI1Il.TextSize = (115+-102)
 _lI1Il.TextColor3 = C._lIl
 _lI1Il.Text = _P199x._yp3z(_I1lI.Friends == nil and "\78\111\32\100\105\115\112\111\110\105\98\108\101" or _I1lI.Friends)
 _lI1Il.TextXAlignment = Enum.TextXAlignment.Right; _lI1Il.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_lI1Il, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _II1Il = Instance.new("\84\101\120\116\76\97\98\101\108", _IIllll)
 _II1Il.Size = UDim2.new((14-14), _P199x._8x6q(1014/39), (277+-276), (431-431)); _II1Il.Position = UDim2.new((231-230), -_P199x._8x6q(1820/65), (266+-266), bit32.bxor(171,0xAB))
 _II1Il.BackgroundTransparency = (370-369); _II1Il.Font = Enum.Font.GothamBold; _II1Il.TextSize = bit32.bxor(167,0xAB)
 _II1Il.TextColor3 = C._IlIll1; _II1Il.Text = "\9660"; _II1Il.TextXAlignment = Enum.TextXAlignment.Center
 themed(_II1Il, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _llI1Il = Instance.new("\70\114\97\109\101", _llll1Il)
 _llI1Il.LayoutOrder = (285-284)
 _llI1Il.Size = UDim2.new((49+-48), _P199x._8x6q(0/61), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB))
 _llI1Il.BackgroundTransparency = (309-308)
 _llI1Il.ClipsDescendants = true
 local _IlI1Il = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _llI1Il)
 _IlI1Il.Size = UDim2.new(bit32.bxor(170,0xAB), (408-408), bit32.bxor(170,0xAB), bit32.bxor(171,0xAB))
 _IlI1Il.BackgroundTransparency = _P199x._8x6q(115/115)
 _IlI1Il.BorderSizePixel = (111-111)
 _IlI1Il.ScrollBarThickness = (276+-272)
 _IlI1Il.ScrollBarImageColor3 = C._IlIll1
 _IlI1Il.CanvasSize = UDim2.new((57-57), bit32.bxor(171,0xAB), _P199x._8x6q(0/160), (283-283))
 _IlI1Il.AutomaticCanvasSize = Enum.AutomaticSize.Y
 _IlI1Il.ClipsDescendants = true
 themed(_IlI1Il, "\83\99\114\111\108\108\66\97\114\73\109\97\103\101\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _lII1Il = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _IlI1Il)
 _lII1Il.Padding = UDim.new((58-58), (300+-296)); _lII1Il.SortOrder = Enum.SortOrder.LayoutOrder
 local _III1Il, _llIII1, targetH, shown = false, false, (456-456), bit32.bxor(171,0xAB)
 local function animateTo(h)
 motionTween(_llI1Il, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { Size = UDim2.new(_P199x._8x6q(93/93), (96+-96), (32-32), h) })
 end
 local function addCard(_l1lI)
 local _lllI1 = _l1lI._lllI1
 local _l1I1Il = Instance.new("\84\101\120\116\66\117\116\116\111\110", _IlI1Il)
 _l1I1Il.Size = UDim2.new((401-400), -(125-119), (93+-93), bit32.bxor(135,0xAB))
 _l1I1Il.BackgroundColor3 = C.surface
 _l1I1Il.AutoButtonColor = false
 _l1I1Il.Text = ""
 _l1I1Il.BorderSizePixel = bit32.bxor(171,0xAB)
 _l1I1Il.LayoutOrder = shown + (244+-243)
 Instance.new("\85\73\67\111\114\110\101\114", _l1I1Il).CornerRadius = _llI.corner.sm
 themed(_l1I1Il, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 local _I1I1Il = Instance.new("\73\109\97\103\101\76\97\98\101\108", _l1I1Il)
 _I1I1Il.Size = UDim2.new((284+-284), bit32.bxor(137,0xAB), (122+-122), bit32.bxor(137,0xAB)); _I1I1Il.Position = UDim2.new(bit32.bxor(171,0xAB), (362-357), 0.5, -(168+-151))
 _I1I1Il.BackgroundColor3 = C._IlI; _I1I1Il.BorderSizePixel = (7+-7)
 _I1I1Il.Image = ("\114\98\120\116\104\117\109\98\58\47\47\116\121\112\101\61\65\118\97\116\97\114\72\101\97\100\83\104\111\116\38\105\100\61\37\100\38\119\61\49\53\48\38\104\61\49\53\48"):format(_lllI1)
 Instance.new("\85\73\67\111\114\110\101\114", _I1I1Il).CornerRadius = UDim.new((127+-127), (262+-245))
 themed(_I1I1Il, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _lllI1Il = Instance.new("\84\101\120\116\76\97\98\101\108", _l1I1Il)
 _lllI1Il.Size = UDim2.new(bit32.bxor(170,0xAB), -(221-86), bit32.bxor(171,0xAB), (47-30)); _lllI1Il.Position = UDim2.new((222-222), _P199x._8x6q(6210/135), (198-198), (129+-125))
 _lllI1Il.BackgroundTransparency = (426-425); _lllI1Il.Font = Enum.Font.GothamBold; _lllI1Il.TextSize = (291+-278)
 _lllI1Il.TextColor3 = C._lIl; _lllI1Il.Text = _l1lI._llllllIl or _l1lI._lll or ("\73\68\32" .. _lllI1)
 _lllI1Il.TextXAlignment = Enum.TextXAlignment.Left; _lllI1Il.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_lllI1Il, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _IIlI1Il = Instance.new("\84\101\120\116\76\97\98\101\108", _l1I1Il)
 _IIlI1Il.Size = UDim2.new(bit32.bxor(170,0xAB), -_P199x._8x6q(1350/10), _P199x._8x6q(0/67), (231-216)); _IIlI1Il.Position = UDim2.new((184-184), _P199x._8x6q(5612/122), _P199x._8x6q(0/196), bit32.bxor(188,0xAB))
 _IIlI1Il.BackgroundTransparency = _P199x._8x6q(125/125); _IIlI1Il.Font = Enum.Font.Gotham; _IIlI1Il.TextSize = (247+-235)
 _IIlI1Il.TextColor3 = C.subtext; _IIlI1Il.Text = "\64" .. (_l1lI._lll or "\63")
 _IIlI1Il.TextXAlignment = Enum.TextXAlignment.Left; _IIlI1Il.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_IIlI1Il, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _lIlI1Il = Instance.new("\84\101\120\116\76\97\98\101\108", _l1I1Il)
 _lIlI1Il.Size = UDim2.new((176-176), _P199x._8x6q(14212/187), bit32.bxor(170,0xAB), (223-223)); _lIlI1Il.Position = UDim2.new((34-33), -(140+-60), bit32.bxor(171,0xAB), (43-43))
 _lIlI1Il.BackgroundTransparency = (18-17); _lIlI1Il.Font = Enum.Font.GothamBold; _lIlI1Il.TextSize = bit32.bxor(167,0xAB)
 _lIlI1Il.TextColor3 = C._IlIll1; _lIlI1Il.Text = "\65\110\97\108\105\122\97\114\32\8594"; _lIlI1Il.TextXAlignment = Enum.TextXAlignment.Right
 themed(_lIlI1Il, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 _l1I1Il.MouseButton1Click:Connect(function()
 showMiniProfileCard(_lllI1, _l1lI)
 end)
 shown = shown + _P199x._8x6q(60/60)
 end
 local function loadFriends()
 _llIII1 = true
 local _llllIl = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI1Il)
 _llllIl.LayoutOrder = (23+-23)
 _llllIl.Size = UDim2.new((159+-158), -bit32.bxor(173,0xAB), bit32.bxor(171,0xAB), (328-304)); _llllIl.BackgroundTransparency = _P199x._8x6q(4/4)
 _llllIl.Font = Enum.Font.Gotham; _llllIl.TextSize = bit32.bxor(167,0xAB); _llllIl.TextColor3 = C.subtext
 _llllIl.Text = "\67\97\114\103\97\110\100\111\32\97\109\105\103\111\115\46\46\46"; _llllIl.TextXAlignment = Enum.TextXAlignment.Left
 themed(_llllIl, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 task.spawn(function()
 local _IIlII = apiGet("\104\116\116\112\115\58\47\47\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _l1l1 .. "\47\102\114\105\101\110\100\115")
 if not _llll1Il.Parent then return end
 if _llllIl and _llllIl.Parent then _llllIl:Destroy() end
 if not _IIlII or not _IIlII._I1lI then
 local _IlllIl = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI1Il)
 _IlllIl.Size = UDim2.new(_P199x._8x6q(47/47), -_P199x._8x6q(1170/195), (314-314), _P199x._8x6q(3840/160)); _IlllIl.BackgroundTransparency = _P199x._8x6q(20/20)
 _IlllIl.Font = Enum.Font.Gotham; _IlllIl.TextSize = (413-401); _IlllIl.TextColor3 = C.bad
 _IlllIl.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46"
do local _dv58,_k6if=pcall(function()return nil end);end
 _IlllIl.TextXAlignment = Enum.TextXAlignment.Left
 themed(_IlllIl, "\84\101\120\116\67\111\108\111\114\51", "\98\97\100")
 task.wait()
 targetH = _P199x._7ofy(_lII1Il.AbsoluteContentSize.Y, _I1l1Il)
 if _III1Il then animateTo(targetH) end
 return
 end
 local _lllllI = {}
 for _, f in ipairs(_IIlII._I1lI) do if f._lllI1 then _P199x._l50o(_lllllI, f._lllI1) end end
 local _I1lII = _lllII(_lllllI)
 if not _llll1Il.Parent then return end
 for i, f in ipairs(_IIlII._I1lI) do
 if not _llll1Il.Parent then return end
 local m = _I1lII[f._lllI1]
 addCard({
 _lllI1 = f._lllI1,
 _lll = (m and m._lll) or f._lll,
 _llllllIl = (m and m._llllllIl) or f._llllllIl or (m and m._lll) or f._lll,
 })
 if i % (439-414) == _P199x._8x6q(0/58) then task.wait() end
 end
 if shown == bit32.bxor(171,0xAB) then
 local _lllllIl = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI1Il)
 _lllllIl.Size = UDim2.new((183+-182), -(39+-33), bit32.bxor(171,0xAB), _P199x._8x6q(480/20)); _lllllIl.BackgroundTransparency = _P199x._8x6q(50/50)
 _lllllIl.Font = Enum.Font.Gotham; _lllllIl.TextSize = _P199x._8x6q(1104/92); _lllllIl.TextColor3 = C.subtext
 _lllllIl.Text = "\83\105\110\32\97\109\105\103\111\115\32\112\250\98\108\105\99\111\115\46"; _lllllIl.TextXAlignment = Enum.TextXAlignment.Left
 themed(_lllllIl, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 else
 _lI1Il.Text = _P199x._yp3z(shown)
 end
 task.wait()
 targetH = _P199x._7ofy(_lII1Il.AbsoluteContentSize.Y, _I1l1Il)
 if _III1Il then animateTo(targetH) end
 end)
 end
 _IIllll.MouseButton1Click:Connect(function()
 _III1Il = not _III1Il
 _II1Il.Text = _III1Il and "\9650" or "\9660"
 if _III1Il then
 if not _llIII1 then
 animateTo((253+-219))
 loadFriends()
 else
 animateTo(targetH)
 end
 else
 animateTo((31+-31))
 end
 end)
 return _llll1Il
end
local _IllllIl = nil
_lIIIl._IllllIl = function() return _IllllIl end
function _lIIIl.adv() return _Il.advanced == true end
do
 if _G.NXPlus and _G.NXPlus.stop then pcall(_G.NXPlus.stop) end
 local P = {}
 local Z = { _lIlIIlIl = (55+245), _IlI = bit32.bxor(390,0xAB), sobre = (715-413) }
 local _lIlllIl = {}
 local _IIlllIl  = (442-322)
 function P.cacheGet(_l1lllIl)
 local k = _P199x._yp3z(_l1lllIl):lower()
 local e = _lIlllIl[k]
 if e and (os.time() - e.t) < _IIlllIl then return e._I1lllIl end
 if e then _lIlllIl[k] = nil end
 return nil
 end
 function P.cachePut(_l1lllIl, _I1lllIl)
 if _P199x._iy38(_I1lllIl) ~= "\116\97\98\108\101" then return end
 local k = _P199x._yp3z(_l1lllIl):lower()
 if not _lIlllIl[k] then
 local n = (355-355)
 for _ in pairs(_lIlllIl) do n = n + _P199x._8x6q(31/31) end
 if n >= bit32.bxor(131,0xAB) then table.clear(_lIlllIl) end
 end
 _lIlllIl[k] = { t = os.time(), _I1lllIl = _I1lllIl }
 end
 if _P199x._iy38(_Il.searchHistory) ~= "\116\97\98\108\101" then _Il.searchHistory = {} end
 function P.recordar(_l1l1, _l1llIl, _llllllIl)
 if not _l1l1 or not _l1llIl then return end
 local h = _Il.searchHistory
 for i = #h, _P199x._8x6q(95/95), -(163+-162) do
 local e = h[i]
 if _P199x._iy38(e) ~= "\116\97\98\108\101" or e._lllI1 == _l1l1 then _P199x._otn1(h, i) end
 end
 _P199x._l50o(h, _P199x._8x6q(81/81), { _lllI1 = _l1l1, _lll = _l1llIl, display = _llllllIl or _l1llIl })
 while #h > (170-158) do _P199x._otn1(h) end
 pcall(saveStore)
 end
 function P.recientes() return _Il.searchHistory or {} end
 function P.limpiarHistorial()
 _Il.searchHistory = {}
 pcall(saveStore)
 end
 function P.nombres(_I1lI, _llll1ll)
 if _P199x._iy38(_I1lI._namesCached) == "\116\97\98\108\101" then
 _llll1ll(_I1lI._namesCached, _I1lI._namesHasMore or false); return
 end
 if _I1lI._namesCached == false then _llll1ll(nil, false); return end
 _I1lI._namesWaiters = _I1lI._namesWaiters or {}
 _P199x._l50o(_I1lI._namesWaiters, _llll1ll)
 if _I1lI._namesInflight then return end
 _I1lI._namesInflight = true
 task.spawn(function()
 local _l1, _l1llllI, _Ill1l1 = pcall(getNameHistory, _I1lI.UserId)
 if _l1 and _P199x._iy38(_l1llllI) == "\116\97\98\108\101" then
 _I1lI._namesCached  = _l1llllI
 _I1lI._namesHasMore = _Ill1l1 or false
 else
 _I1lI._namesCached  = false
 _I1lI._namesHasMore = false
 end
 _I1lI._namesInflight = false
 local _IIllllIl = _I1lI._namesWaiters or {}
 _I1lI._namesWaiters = nil
 local _IIlII = (_P199x._iy38(_I1lI._namesCached) == "\116\97\98\108\101") and _I1lI._namesCached or nil
 for _, _I1I in ipairs(_IIllllIl) do pcall(_I1I, _IIlII, _I1lI._namesHasMore) end
 end)
 end
 local function _I1lllII(_lllI, _lIllllIl, _lIIlIl, _IIlI, _IIlI, _IIIlIl)
 local f = Instance.new("\70\114\97\109\101", _lllI)
 f.LayoutOrder = _lIllllIl
 f.Size = UDim2.new(bit32.bxor(170,0xAB), _P199x._8x6q(0/67), _P199x._8x6q(0/67), (273+-273))
 f.AutomaticSize = Enum.AutomaticSize.Y
 f.BackgroundTransparency = bit32.bxor(170,0xAB)
 local _lll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", f)
 _lll.Padding = UDim.new((126+-126), (198-197)); _lll.SortOrder = Enum.SortOrder.LayoutOrder
 local _llIIlIl = Instance.new("\70\114\97\109\101", f)
 _llIIlIl.LayoutOrder = bit32.bxor(171,0xAB)
 _llIIlIl.Size = UDim2.new((188+-187), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB), (466-446))
 _llIIlIl.BackgroundTransparency = bit32.bxor(170,0xAB)
 local l = Instance.new("\84\101\120\116\76\97\98\101\108", _llIIlIl)
 l.Size = UDim2.new((250-250), (226-108), (259+-258), (287+-287))
 l.BackgroundTransparency = bit32.bxor(170,0xAB)
 l.Font = Enum.Font.Gotham; l.TextSize = _P199x._8x6q(2100/175)
 l.TextColor3 = C.subtext
 l.Text = _lIIlIl
 l.TextXAlignment = Enum.TextXAlignment.Left
 themed(l, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local v = Instance.new("\84\101\120\116\76\97\98\101\108", _llIIlIl)
 v.Size = UDim2.new((24+-23), -(262+-140), bit32.bxor(170,0xAB), (82+-82))
 v.Position = UDim2.new((122-122), _P199x._8x6q(14762/121), _P199x._8x6q(0/79), (220-220))
 v.BackgroundTransparency = (240+-239)
 v.Font = Enum.Font.GothamBold; v.TextSize = (511-499)
 v.TextColor3 = _IIlI or C._lIl
 v.Text = _P199x._yp3z(_IIlI)
 v.TextXAlignment = Enum.TextXAlignment.Left
 v.TextTruncate = Enum.TextTruncate.AtEnd
 if not _IIlI then themed(v, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116") end
 if _IIIlIl then
 local n = Instance.new("\84\101\120\116\76\97\98\101\108", f)
 n.LayoutOrder = bit32.bxor(170,0xAB)
 n.Size = UDim2.new((457-456), -(68+54), _P199x._8x6q(0/98), bit32.bxor(171,0xAB))
 n.Position = UDim2.new(_P199x._8x6q(0/133), (38+84), (112+-112), (267+-267))
 n.AutomaticSize = Enum.AutomaticSize.Y
 n.BackgroundTransparency = (349-348)
 n.Font = Enum.Font.Gotham; n.TextSize = bit32.bxor(160,0xAB)
 n.TextColor3 = C.subtext
 n.Text = _IIIlIl
 n.TextWrapped = true
 n.TextXAlignment = Enum.TextXAlignment.Left
 themed(n, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 return f, v
 end
 local _IlIIlIl = {
 { _lllI1 = "\101\120\112\108\111\105\116\115", _lIIIl1 = "\69\120\112\108\111\105\116\115\32\47\32\116\114\97\109\112\97\115", motivo = "\67\104\101\97\116\105\110\103\47\69\120\112\108\111\105\116\105\110\103",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\116\225\32\117\115\97\110\100\111\32\101\120\112\108\111\105\116\115\32\101\110\32\108\97\32\101\120\112\101\114\105\101\110\99\105\97\46\32\83\101\32\109\117\101\118\101\32\97\32\118\101\108\111\99\105\100\97\100\32\105\109\112\111\115\105\98\108\101\32\121\32\97\116\114\97\118\105\101\115\97\32\112\97\114\101\100\101\115\32\121\32\111\98\115\116\225\99\117\108\111\115\32\113\117\101\32\100\101\98\101\114\237\97\110\32\98\108\111\113\117\101\97\114\108\111\46",
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\116\225\32\118\111\108\97\110\100\111\32\111\32\116\101\108\101\116\114\97\110\115\112\111\114\116\225\110\100\111\115\101\32\112\111\114\32\101\108\32\109\97\112\97\44\32\97\108\103\111\32\113\117\101\32\101\115\116\97\32\101\120\112\101\114\105\101\110\99\105\97\32\110\111\32\112\101\114\109\105\116\101\32\100\101\32\102\111\114\109\97\32\108\101\103\237\116\105\109\97\46",
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\32\105\110\118\101\110\99\105\98\108\101\58\32\114\101\99\105\98\101\32\100\97\241\111\32\100\101\32\118\97\114\105\97\115\32\102\117\101\110\116\101\115\32\121\32\115\117\32\118\105\100\97\32\110\111\32\98\97\106\97\44\32\121\32\101\108\105\109\105\110\97\32\97\32\108\111\115\32\100\101\109\225\115\32\97\108\32\105\110\115\116\97\110\116\101\32\100\101\115\100\101\32\108\101\106\111\115\46",
 } },
 { _lllI1 = "\97\117\100\105\111", _lIIIl1 = "\65\117\100\105\111\32\47\32\109\105\99\114\243\102\111\110\111", motivo = "\73\110\97\112\112\114\111\112\114\105\97\116\101\32\97\117\100\105\111",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\116\114\97\110\115\109\105\116\101\32\97\117\100\105\111\32\115\97\116\117\114\97\100\111\32\121\32\100\105\115\116\111\114\115\105\111\110\97\100\111\32\97\32\112\114\111\112\243\115\105\116\111\32\112\111\114\32\101\108\32\99\104\97\116\32\100\101\32\118\111\122\44\32\97\32\118\111\108\117\109\101\110\32\109\117\121\32\97\108\116\111\44\32\100\101\32\102\111\114\109\97\32\99\111\110\116\105\110\117\97\32\101\32\105\109\112\111\115\105\98\108\101\32\100\101\32\105\103\110\111\114\97\114\46",
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\116\225\32\114\101\112\114\111\100\117\99\105\101\110\100\111\32\109\250\115\105\99\97\32\99\111\110\32\100\101\114\101\99\104\111\115\32\100\101\32\97\117\116\111\114\32\112\111\114\32\101\108\32\109\105\99\114\243\102\111\110\111\32\100\101\32\102\111\114\109\97\32\99\111\110\115\116\97\110\116\101\44\32\105\109\112\105\100\105\101\110\100\111\32\113\117\101\32\115\101\32\101\115\99\117\99\104\101\32\97\32\108\111\115\32\100\101\109\225\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\103\114\105\116\97\32\101\32\105\110\115\117\108\116\97\32\112\111\114\32\101\108\32\99\104\97\116\32\100\101\32\118\111\122\32\100\101\32\102\111\114\109\97\32\114\101\112\101\116\105\100\97\44\32\100\105\114\105\103\105\233\110\100\111\115\101\32\97\32\111\116\114\97\115\32\112\101\114\115\111\110\97\115\32\100\101\32\108\97\32\115\97\108\97\46",
 } },
 { _lllI1 = "\97\118\97\116\97\114", _lIIIl1 = "\65\118\97\116\97\114\32\105\110\97\112\114\111\112\105\97\100\111", motivo = "\73\110\97\112\112\114\111\112\114\105\97\116\101\32\97\118\97\116\97\114",
 prompts = {
 "\69\108\32\97\118\97\116\97\114\32\100\101\108\32\106\117\103\97\100\111\114\32\101\115\32\115\101\120\117\97\108\109\101\110\116\101\32\101\120\112\108\237\99\105\116\111\58\32\101\115\116\225\32\99\111\110\102\105\103\117\114\97\100\111\32\112\97\114\97\32\115\105\109\117\108\97\114\32\100\101\115\110\117\100\101\122\32\121\32\110\111\32\101\115\32\97\112\114\111\112\105\97\100\111\32\112\97\114\97\32\108\97\32\112\108\97\116\97\102\111\114\109\97\46",
 "\69\108\32\97\118\97\116\97\114\32\100\101\108\32\106\117\103\97\100\111\114\32\117\115\97\32\117\110\97\32\99\111\109\98\105\110\97\99\105\243\110\32\100\101\32\97\99\99\101\115\111\114\105\111\115\32\113\117\101\32\102\111\114\109\97\32\117\110\97\32\105\109\97\103\101\110\32\111\102\101\110\115\105\118\97\47\111\98\115\99\101\110\97\32\118\105\115\105\98\108\101\32\112\97\114\97\32\116\111\100\111\115\46",
 "\69\108\32\97\118\97\116\97\114\32\100\101\108\32\106\117\103\97\100\111\114\32\109\117\101\115\116\114\97\32\115\237\109\98\111\108\111\115\32\100\101\32\111\100\105\111\32\111\32\114\101\102\101\114\101\110\99\105\97\115\32\101\120\116\114\101\109\105\115\116\97\115\46",
 } },
 { _lllI1 = "\99\104\97\116", _lIIIl1 = "\67\104\97\116\32\100\101\32\116\101\120\116\111", motivo = "\65\98\117\115\105\118\101\32\99\104\97\116",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\99\114\105\98\101\32\105\110\115\117\108\116\111\115\32\121\32\108\101\110\103\117\97\106\101\32\111\102\101\110\115\105\118\111\32\112\111\114\32\101\108\32\99\104\97\116\32\100\101\32\116\101\120\116\111\32\100\101\32\102\111\114\109\97\32\114\101\112\101\116\105\100\97\32\104\97\99\105\97\32\111\116\114\97\115\32\112\101\114\115\111\110\97\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\117\115\97\32\101\108\32\99\104\97\116\32\112\97\114\97\32\115\97\108\116\97\114\115\101\32\101\108\32\102\105\108\116\114\111\32\121\32\101\115\99\114\105\98\105\114\32\112\97\108\97\98\114\97\115\32\111\102\101\110\115\105\118\97\115\32\99\111\110\32\115\237\109\98\111\108\111\115\32\121\32\101\115\112\97\99\105\111\115\32\101\110\116\114\101\32\108\101\116\114\97\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\116\225\32\101\110\118\105\97\110\100\111\32\115\112\97\109\32\109\97\115\105\118\111\32\112\111\114\32\101\108\32\99\104\97\116\44\32\105\109\112\105\100\105\101\110\100\111\32\115\101\103\117\105\114\32\108\97\32\99\111\110\118\101\114\115\97\99\105\243\110\46",
 } },
 { _lllI1 = "\97\99\111\115\111", _lIIIl1 = "\65\99\111\115\111\32\47\32\98\117\108\108\121\105\110\103", motivo = "\66\117\108\108\121\105\110\103\47\72\97\114\97\115\115\109\101\110\116",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\116\225\32\97\99\111\115\97\110\100\111\32\97\32\111\116\114\97\32\112\101\114\115\111\110\97\32\100\101\32\108\97\32\115\97\108\97\58\32\108\97\32\115\105\103\117\101\32\112\111\114\32\101\108\32\109\97\112\97\44\32\108\97\32\98\108\111\113\117\101\97\32\121\32\115\101\32\98\117\114\108\97\32\100\101\32\101\108\108\97\32\100\101\32\102\111\114\109\97\32\105\110\115\105\115\116\101\110\116\101\32\100\101\115\112\117\233\115\32\100\101\32\113\117\101\32\108\101\32\112\105\100\105\101\114\97\110\32\112\97\114\97\114\46",
 "\69\108\32\106\117\103\97\100\111\114\32\97\109\101\110\97\122\97\32\97\32\111\116\114\111\115\32\112\97\114\116\105\99\105\112\97\110\116\101\115\32\121\32\108\101\115\32\100\105\99\101\32\113\117\101\32\118\97\32\97\32\114\101\112\111\114\116\97\114\108\111\115\32\111\32\98\97\110\101\97\114\108\111\115\32\101\110\32\102\97\108\115\111\32\112\97\114\97\32\97\115\117\115\116\97\114\108\111\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\115\101\32\100\105\114\105\103\101\32\97\32\111\116\114\97\32\112\101\114\115\111\110\97\32\99\111\110\32\99\111\109\101\110\116\97\114\105\111\115\32\104\117\109\105\108\108\97\110\116\101\115\32\100\101\32\102\111\114\109\97\32\114\101\112\101\116\105\100\97\46",
 } },
 { _lllI1 = "\115\99\97\109", _lIIIl1 = "\69\115\116\97\102\97\32\47\32\115\99\97\109", motivo = "\83\99\97\109\109\105\110\103",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\111\102\114\101\99\101\32\82\111\98\117\120\32\111\32\105\116\101\109\115\32\103\114\97\116\105\115\32\97\32\99\97\109\98\105\111\32\100\101\32\101\110\116\114\97\114\32\97\32\117\110\32\101\110\108\97\99\101\32\101\120\116\101\114\110\111\44\32\113\117\101\32\101\115\32\117\110\97\32\101\115\116\97\102\97\46",
 "\69\108\32\106\117\103\97\100\111\114\32\112\105\100\101\32\108\111\115\32\100\97\116\111\115\32\100\101\32\97\99\99\101\115\111\32\100\101\32\108\97\32\99\117\101\110\116\97\32\112\114\111\109\101\116\105\101\110\100\111\32\117\110\32\112\114\101\109\105\111\32\97\32\99\97\109\98\105\111\46",
 "\69\108\32\106\117\103\97\100\111\114\32\112\114\111\112\111\110\101\32\117\110\32\105\110\116\101\114\99\97\109\98\105\111\44\32\114\101\99\105\98\101\32\112\114\105\109\101\114\111\32\121\32\110\111\32\101\110\116\114\101\103\97\32\115\117\32\112\97\114\116\101\46",
 } },
 { _lllI1 = "\115\117\112\108\97\110\116\97\99\105\111\110", _lIIIl1 = "\83\117\112\108\97\110\116\97\99\105\243\110", motivo = "\73\109\112\101\114\115\111\110\97\116\105\111\110",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\115\101\32\104\97\99\101\32\112\97\115\97\114\32\112\111\114\32\112\101\114\115\111\110\97\108\32\100\101\32\82\111\98\108\111\120\32\112\97\114\97\32\112\101\100\105\114\32\99\111\115\97\115\32\97\32\108\111\115\32\100\101\109\225\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\99\111\112\105\243\32\101\108\32\68\105\115\112\108\97\121\32\78\97\109\101\32\121\32\101\108\32\97\118\97\116\97\114\32\100\101\32\111\116\114\97\32\112\101\114\115\111\110\97\32\112\97\114\97\32\104\97\99\101\114\115\101\32\112\97\115\97\114\32\112\111\114\32\101\108\108\97\46\32\82\101\99\117\101\114\100\97\32\113\117\101\32\101\108\32\68\105\115\112\108\97\121\32\78\97\109\101\32\115\101\32\112\117\101\100\101\32\114\101\112\101\116\105\114\58\32\101\108\32\64\117\115\117\97\114\105\111\32\121\32\101\108\32\85\115\101\114\73\100\32\115\111\110\32\108\111\115\32\113\117\101\32\105\100\101\110\116\105\102\105\99\97\110\32\100\101\32\118\101\114\100\97\100\46",
 "\69\108\32\106\117\103\97\100\111\114\32\115\101\32\104\97\99\101\32\112\97\115\97\114\32\112\111\114\32\117\110\32\109\111\100\101\114\97\100\111\114\32\111\32\97\100\109\105\110\105\115\116\114\97\100\111\114\32\100\101\32\101\115\116\97\32\101\120\112\101\114\105\101\110\99\105\97\32\112\97\114\97\32\100\97\114\32\243\114\100\101\110\101\115\46",
 } },
 { _lllI1 = "\97\100\117\108\116\111", _lIIIl1 = "\67\111\110\116\101\110\105\100\111\32\97\100\117\108\116\111", motivo = "\65\100\117\108\116\32\99\111\110\116\101\110\116",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\116\105\101\110\101\32\99\111\110\100\117\99\116\97\115\32\100\101\32\99\111\110\116\101\110\105\100\111\32\115\101\120\117\97\108\32\100\101\110\116\114\111\32\100\101\32\108\97\32\101\120\112\101\114\105\101\110\99\105\97\46",
 "\69\108\32\106\117\103\97\100\111\114\32\98\117\115\99\97\32\39\99\105\116\97\115\39\32\100\101\32\102\111\114\109\97\32\101\120\112\108\237\99\105\116\97\32\101\32\105\110\115\105\115\116\101\32\97\32\111\116\114\97\115\32\112\101\114\115\111\110\97\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\99\111\109\112\97\114\116\101\32\101\110\108\97\99\101\115\32\97\32\99\111\110\116\101\110\105\100\111\32\112\97\114\97\32\97\100\117\108\116\111\115\32\112\111\114\32\101\108\32\99\104\97\116\46",
 } },
 { _lllI1 = "\100\97\116\111\115", _lIIIl1 = "\68\97\116\111\115\32\112\101\114\115\111\110\97\108\101\115", motivo = "\80\101\114\115\111\110\97\108\32\105\110\102\111\114\109\97\116\105\111\110",
 prompts = {
 "\69\108\32\106\117\103\97\100\111\114\32\101\115\116\225\32\112\117\98\108\105\99\97\110\100\111\32\100\97\116\111\115\32\112\101\114\115\111\110\97\108\101\115\32\100\101\32\111\116\114\97\32\112\101\114\115\111\110\97\32\40\110\111\109\98\114\101\32\114\101\97\108\44\32\100\105\114\101\99\99\105\243\110\44\32\116\101\108\233\102\111\110\111\32\111\32\114\101\100\101\115\41\32\112\111\114\32\101\108\32\99\104\97\116\46",
 "\69\108\32\106\117\103\97\100\111\114\32\112\105\100\101\32\105\110\115\105\115\116\101\110\116\101\109\101\110\116\101\32\100\97\116\111\115\32\112\101\114\115\111\110\97\108\101\115\32\99\111\109\111\32\101\100\97\100\44\32\100\105\114\101\99\99\105\243\110\32\111\32\102\111\116\111\115\46",
 "\69\108\32\106\117\103\97\100\111\114\32\97\109\101\110\97\122\97\32\99\111\110\32\112\117\98\108\105\99\97\114\32\105\110\102\111\114\109\97\99\105\243\110\32\112\114\105\118\97\100\97\32\100\101\32\111\116\114\111\32\112\97\114\116\105\99\105\112\97\110\116\101\46",
 } },
 }
 local function contexto()
 local _lIIIlIl = {}
 _lIIIlIl[#_lIIIlIl + (192-191)] = "\80\108\97\99\101\73\100\58\32" .. _P199x._yp3z(game.PlaceId)
 if game.JobId and game.JobId ~= "" then
 _lIIIlIl[#_lIIIlIl + _P199x._8x6q(78/78)] = "\83\101\114\118\105\100\111\114\32\40\74\111\98\73\100\41\58\32" .. game.JobId
 end
 local _IIIIlIl
 pcall(function()
 _IIIIlIl = game:GetService("\77\97\114\107\101\116\112\108\97\99\101\83\101\114\118\105\99\101")
 :GetProductInfo(game.PlaceId).Name
 end)
 if _IIIIlIl then _P199x._l50o(_lIIIlIl, (325-324), "\69\120\112\101\114\105\101\110\99\105\97\58\32" .. _IIIIlIl) end
 return _P199x._oy4i(_lIIIlIl, "\10")
 end
 function P.textoReporte(_I1lI, _I1IIlIl, _lllIIlIl)
 local _l1IIlIl = _I1IIlIl.prompts[_lllIIlIl] or _I1IIlIl.prompts[(270-269)]
 return _P199x._oy4i({
 "\85\115\117\97\114\105\111\32\114\101\112\111\114\116\97\100\111\58\32\64" .. _P199x._yp3z(_I1lI.Username)
 .. "\32\40\68\105\115\112\108\97\121\32\78\97\109\101\58\32" .. _P199x._yp3z(_I1lI.DisplayName)
 .. "\32\183\32\85\115\101\114\73\100\58\32" .. _P199x._yp3z(_I1lI.UserId) .. "\41",
 "\77\111\116\105\118\111\58\32" .. _I1IIlIl._lIIIl1,
 "",
 _l1IIlIl,
 "",
 "\45\45\45\32\67\111\110\116\101\120\116\111\32\45\45\45",
 contexto(),
 "\70\101\99\104\97\32\40\85\84\67\41\58\32" .. os.date("\33\37\89\45\37\109\45\37\100\32\37\72\58\37\77"),
 }, "\10")
 end
 function P.reportar(_I1lI)
 if _P199x._iy38(_I1lI) ~= "\116\97\98\108\101" or not _I1lI.UserId then return end
 local _IIlIIlIl = _lllIlI:FindFirstChild("\78\88\82\101\112\111\114\116\77\111\100\97\108")
 if _IIlIIlIl then _IIlIIlIl:Destroy() end
 local _lIlIIlIl = Instance.new("\84\101\120\116\66\117\116\116\111\110", _lllIlI)
 _lIlIIlIl.Name = "\78\88\82\101\112\111\114\116\77\111\100\97\108"
 _lIlIIlIl.Size = UDim2.new((203+-202), (100+-100), _P199x._8x6q(155/155), bit32.bxor(171,0xAB))
 _lIlIIlIl.BackgroundColor3 = Color3.fromRGB((277-277), (162-162), _P199x._8x6q(0/118))
 _lIlIIlIl.BackgroundTransparency = (53+-52)
 _lIlIIlIl.BorderSizePixel = (186+-186)
 _lIlIIlIl.Text = ""
 _lIlIIlIl.AutoButtonColor = false
 _lIlIIlIl.ZIndex = Z._lIlIIlIl
 motionTween(_lIlIIlIl, TweenInfo.new(0.18), { BackgroundTransparency = 0.45 })
 local _IlI = Instance.new("\70\114\97\109\101", _lIlIIlIl)
 _IlI.Size = UDim2.new((258+-258), bit32.bxor(695,0xAB), (157+-157), _P199x._8x6q(40850/95))
 _IlI.Position = UDim2.new(0.5, -(390-120), 0.5, -(39+176))
 _IlI.BackgroundColor3 = C.bg
 _IlI.BorderSizePixel = (206+-206)
 _IlI.Active = true
 _IlI.ZIndex = Z._IlI
 themed(_IlI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\103")
 Instance.new("\85\73\67\111\114\110\101\114", _IlI).CornerRadius = UDim.new((350-350), bit32.bxor(161,0xAB))
 local _llIlIl = Instance.new("\85\73\83\116\114\111\107\101", _IlI)
 _llIlIl.Color = C._IlIll1; _llIlIl.Transparency = 0.4
 themed(_llIlIl, "\67\111\108\111\114", "\97\99\99\101\110\116")
 local _IlIlIl = Instance.new("\85\73\83\99\97\108\101", _IlI)
 _IlIlIl.Scale = 0.94
 motionTween(_IlIlIl, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = (250+-249) })
 local function cerrar()
 motionTween(_lIlIIlIl, TweenInfo.new(0.15), { BackgroundTransparency = (161+-160) })
 motionTween(_IlIlIl, TweenInfo.new(0.15), { Scale = 0.94 }, function()
 if _lIlIIlIl and _lIlIIlIl.Parent then _lIlIIlIl:Destroy() end
 end)
 end
 track(_lIlIIlIl.MouseButton1Click:Connect(cerrar))
 local _lllIlIl = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 _lllIlIl.Size = UDim2.new((237-236), -(283+-227), (159+-159), (281+-255))
 _lllIlIl.Position = UDim2.new(_P199x._8x6q(0/68), (141+-127), _P199x._8x6q(0/34), bit32.bxor(167,0xAB))
 _lllIlIl.BackgroundTransparency = bit32.bxor(170,0xAB)
 _lllIlIl.Font = Enum.Font.GothamBold; _lllIlIl.TextSize = (119+-103)
 _lllIlIl.TextColor3 = C._IlIll1
 _lllIlIl.Text = "\82\101\112\111\114\116\97\114\32\117\115\117\97\114\105\111"
 _lllIlIl.TextXAlignment = Enum.TextXAlignment.Left
 _lllIlIl.ZIndex = Z.sobre
 themed(_lllIlIl, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _IllIlIl = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 _IllIlIl.Size = UDim2.new((101+-100), -bit32.bxor(147,0xAB), (309-309), _P199x._8x6q(1888/118))
 _IllIlIl.Position = UDim2.new(_P199x._8x6q(0/119), bit32.bxor(165,0xAB), (276+-276), _P199x._8x6q(4930/145))
 _IllIlIl.BackgroundTransparency = _P199x._8x6q(9/9)
 _IllIlIl.Font = Enum.Font.Gotham; _IllIlIl.TextSize = (148+-136)
 _IllIlIl.TextColor3 = C.subtext
 _IllIlIl.Text = "\64" .. _P199x._yp3z(_I1lI.Username) .. "\32\32\183\32\32\73\68\32" .. _P199x._yp3z(_I1lI.UserId)
 _IllIlIl.TextXAlignment = Enum.TextXAlignment.Left
 _IllIlIl.TextTruncate = Enum.TextTruncate.AtEnd
 _IllIlIl.ZIndex = Z.sobre
 themed(_IllIlIl, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local x = Instance.new("\84\101\120\116\66\117\116\116\111\110", _IlI)
 x.Size = UDim2.new(bit32.bxor(171,0xAB), bit32.bxor(183,0xAB), _P199x._8x6q(0/11), _P199x._8x6q(1428/51))
 x.Position = UDim2.new((339-338), -(268+-230), (380-380), (334-322))
 x.BackgroundColor3 = C._IlI
 x.Text = "\88"
 x.Font = Enum.Font.GothamBold; x.TextSize = _P199x._8x6q(351/27)
 x.TextColor3 = C._lIl
 x.BorderSizePixel = _P199x._8x6q(0/190)
 x.AutoButtonColor = false
 x.ZIndex = Z.sobre
 Instance.new("\85\73\67\111\114\110\101\114", x).CornerRadius = UDim.new((175+-175), bit32.bxor(173,0xAB))
 themed(x, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100"); themed(x, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 track(x.MouseEnter:Connect(function()
do local _cf7bat=1 while _cf7bat>0 do if _cf7bat==1 then
 motionTween(x, TweenInfo.new(0.15), { BackgroundColor3 = C.bad })
 end))
 track(x.MouseLeave:Connect(function()
 motionTween(x, TweenInfo.new(0.15), { BackgroundColor3 = C._IlI })
_cf7bat=0 end end end
 end))
 track(x.MouseButton1Click:Connect(cerrar))
 local _lIlIlIl = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _IlI)
 _lIlIlIl.Size = UDim2.new((312-312), (27+159), bit32.bxor(170,0xAB), -_P199x._8x6q(23482/199))
 _lIlIlIl.Position = UDim2.new((291+-291), bit32.bxor(165,0xAB), (54+-54), (279+-219))
 _lIlIlIl.BackgroundTransparency = (165-164)
 _lIlIlIl.BorderSizePixel = _P199x._8x6q(0/116)
 _lIlIlIl.ScrollBarThickness = (80-77)
 _lIlIlIl.CanvasSize = UDim2.new((271+-271), _P199x._8x6q(0/28), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB))
 _lIlIlIl.AutomaticCanvasSize = Enum.AutomaticSize.Y
 _lIlIlIl.ZIndex = Z.sobre
 local _IIlIlIl = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _lIlIlIl)
 _IIlIlIl.Padding = UDim.new((120+-120), (196+-192)); _IIlIlIl.SortOrder = Enum.SortOrder.LayoutOrder
 local _l1lIlIl = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 _l1lIlIl.Size = UDim2.new((294+-294), (265+55), bit32.bxor(171,0xAB), bit32.bxor(187,0xAB))
 _l1lIlIl.Position = UDim2.new((409-409), _P199x._8x6q(40352/194), (3-3), (239+-179))
 _l1lIlIl.BackgroundTransparency = (195+-194)
 _l1lIlIl.Font = Enum.Font.GothamBold; _l1lIlIl.TextSize = bit32.bxor(160,0xAB)
 _l1lIlIl.TextColor3 = C.subtext
 _l1lIlIl.Text = "\80\76\65\78\84\73\76\76\65"
 _l1lIlIl.TextXAlignment = Enum.TextXAlignment.Left
 _l1lIlIl.ZIndex = Z.sobre
 themed(_l1lIlIl, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _I1lIlIl = Instance.new("\70\114\97\109\101", _IlI)
 _I1lIlIl.Size = UDim2.new((207+-207), bit32.bxor(491,0xAB), (246+-246), _P199x._8x6q(5148/198))
 _I1lIlIl.Position = UDim2.new((80-80), bit32.bxor(123,0xAB), (157+-157), bit32.bxor(229,0xAB))
 _I1lIlIl.BackgroundTransparency = (382-381)
 _I1lIlIl.ZIndex = Z.sobre
 local _llllIlIl = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _I1lIlIl)
 _llllIlIl.FillDirection = Enum.FillDirection.Horizontal
 _llllIlIl.Padding = UDim.new(_P199x._8x6q(0/82), (46-40)); _llllIlIl.SortOrder = Enum.SortOrder.LayoutOrder
 local _lIllIl = Instance.new("\84\101\120\116\66\111\120", _IlI)
 _lIllIl.Size = UDim2.new((339-339), _P199x._8x6q(39680/124), bit32.bxor(170,0xAB), -(554-368))
 _lIllIl.Position = UDim2.new((413-413), (99+109), (251+-251), bit32.bxor(197,0xAB))
 _lIllIl.BackgroundColor3 = C._IlI
 _lIllIl.Font = Enum.Font.Gotham; _lIllIl.TextSize = (287-275)
 _lIllIl.TextColor3 = C._lIl
 _lIllIl.TextWrapped = true
 _lIllIl.MultiLine = true
 _lIllIl.ClearTextOnFocus = false
 _lIllIl.TextEditable = true
 _lIllIl.TextXAlignment = Enum.TextXAlignment.Left
 _lIllIl.TextYAlignment = Enum.TextYAlignment.Top
 _lIllIl.BorderSizePixel = (363-363)
 _lIllIl.Text = ""
 _lIllIl.ZIndex = Z.sobre
 themed(_lIllIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100"); themed(_lIllIl, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 Instance.new("\85\73\67\111\114\110\101\114", _lIllIl).CornerRadius = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(570/95))
 local _IIllIlIl = Instance.new("\85\73\80\97\100\100\105\110\103", _lIllIl)
 _IIllIlIl.PaddingTop = UDim.new((23-23), (240+-234)); _IIllIlIl.PaddingLeft = UDim.new((12+-12), (209+-201))
 _IIllIlIl.PaddingRight = UDim.new(_P199x._8x6q(0/113), _P199x._8x6q(80/10)); _IIllIlIl.PaddingBottom = UDim.new(_P199x._8x6q(0/23), (150+-144))
 local _lIllIlIl, varSel = _IlIIlIl[bit32.bxor(170,0xAB)], _P199x._8x6q(135/135)
 local _lllI, botonesVar = {}, {}
 local function pintarVar()
 for i, b in ipairs(botonesVar) do
 local _lllIl = (i == varSel)
 b.BackgroundColor3 = _lllIl and C._IlIll1 or C._IlI
 b.TextColor3 = _lllIl and C.onAccent or C.subtext
 end
 end
 local function pintarCat()
 for _, b in ipairs(_lllI) do
 local _lllIl = (b:GetAttribute("\99\97\116\73\100") == _lIllIlIl._lllI1)
 b.BackgroundColor3 = _lllIl and C._IlIll1 or C._IlI
 b.TextColor3 = _lllIl and C.onAccent or C._lIl
 end
 end
 local function refrescar()
 _lIllIl.Text = P.textoReporte(_I1lI, _lIllIlIl, varSel)
 pintarCat(); pintarVar()
 end
 local function construirVars()
 for _, b in ipairs(botonesVar) do b:Destroy() end
 table.clear(botonesVar)
 for i = (230-229), #_lIllIlIl.prompts do
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110", _I1lIlIl)
 b.LayoutOrder = i
 b.Size = UDim2.new(bit32.bxor(171,0xAB), _P199x._8x6q(1598/47), _P199x._8x6q(199/199), (64+-64))
 b.BackgroundColor3 = C._IlI
 b.Text = _P199x._yp3z(i)
 b.Font = Enum.Font.GothamBold; b.TextSize = bit32.bxor(167,0xAB)
 b.TextColor3 = C.subtext
 b.BorderSizePixel = (58+-58)
 b.AutoButtonColor = false
 b.ZIndex = Z.sobre
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new((135+-135), _P199x._8x6q(672/112))
 track(b.MouseButton1Click:Connect(function()
 varSel = i
 refrescar()
 end))
 botonesVar[i] = b
 end
 end
 for i, _I1IIlIl in ipairs(_IlIIlIl) do
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110", _lIlIlIl)
 b.LayoutOrder = i
 b.Size = UDim2.new((237+-236), -_P199x._8x6q(654/109), _P199x._8x6q(0/71), bit32.bxor(139,0xAB))
 b.BackgroundColor3 = C._IlI
 b.Text = "\32\32" .. _I1IIlIl._lIIIl1
 b.Font = Enum.Font.Gotham; b.TextSize = (149+-137)
 b.TextColor3 = C._lIl
 b.TextXAlignment = Enum.TextXAlignment.Left
 b.BorderSizePixel = (328-328)
 b.AutoButtonColor = false
 b.ZIndex = Z.sobre
 b:SetAttribute("\99\97\116\73\100", _I1IIlIl._lllI1)
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(173,0xAB))
 track(b.MouseButton1Click:Connect(function()
 _lIllIlIl, varSel = _I1IIlIl, (18+-17)
 construirVars()
 refrescar()
 end))
 _lllI[i] = b
 end
 local _IllI = Instance.new("\84\101\120\116\66\117\116\116\111\110", _IlI)
 _IllI.Size = UDim2.new((188-188), (121+47), (321-321), (200+-168))
 _IllI.Position = UDim2.new(_P199x._8x6q(0/28), (351-337), (133-132), -(293-247))
 _IllI.BackgroundColor3 = C.surface
 _IllI.Text = "\67\111\112\105\97\114\32\100\101\115\99\114\105\112\99\105\243\110"
 _IllI.Font = Enum.Font.GothamMedium; _IllI.TextSize = _P199x._8x6q(972/81)
 _IllI.TextColor3 = C._lIl
 _IllI.BorderSizePixel = _P199x._8x6q(0/84)
do local _fvb0=math.random(1,999)*0;if _kvtq>1 then print("")end end
 _IllI.AutoButtonColor = false
 _IllI.ZIndex = Z.sobre
 Instance.new("\85\73\67\111\114\110\101\114", _IllI).CornerRadius = UDim.new((132-132), (86+-80))
 themed(_IllI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\110\101\117\116\114\97\108"); themed(_IllI, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 track(_IllI.MouseButton1Click:Connect(function()
 _llII(_lIllIl.Text)
 _IllI.Text = "\10003\32\67\111\112\105\97\100\111"
 task.delay(1.2, function()
 if _IllI and _IllI.Parent then _IllI.Text = "\67\111\112\105\97\114\32\100\101\115\99\114\105\112\99\105\243\110" end
 end)
 end))
 local _llllI = Instance.new("\84\101\120\116\66\117\116\116\111\110", _IlI)
 _llllI.Size = UDim2.new((250+-250), (804-484), (400-400), (21+11))
 _llllI.Position = UDim2.new(bit32.bxor(171,0xAB), _P199x._8x6q(24336/117), (229+-228), -bit32.bxor(133,0xAB))
 _llllI.BackgroundColor3 = C._IlIll1
 _llllI.Text = "\65\98\114\105\114\32\114\101\112\111\114\116\101\32\100\101\32\82\111\98\108\111\120\32\8594"
 _llllI.Font = Enum.Font.GothamBold; _llllI.TextSize = bit32.bxor(167,0xAB)
 _llllI.TextColor3 = C.onAccent
 _llllI.BorderSizePixel = (254-254)
 _llllI.AutoButtonColor = false
 _llllI.ZIndex = Z.sobre
 Instance.new("\85\73\67\111\114\110\101\114", _llllI).CornerRadius = UDim.new(_P199x._8x6q(0/71), bit32.bxor(173,0xAB))
 themed(_llllI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116"); themed(_llllI, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 track(_llllI.MouseButton1Click:Connect(function()
 if _llllI:GetAttribute("\111\99\117\112\97\100\111") then return end
 _llllI:SetAttribute("\111\99\117\112\97\100\111", true)
 _llllI.Text = "\65\98\114\105\101\110\100\111\8230"
 _llII(_lIllIl.Text)
 task.spawn(function()
 local _IlII = "\104\116\116\112\115\58\47\47\119\119\119\46\114\111\98\108\111\120\46\99\111\109\47\114\101\112\111\114\116\45\97\98\117\115\101\47\63\116\97\114\103\101\116\73\100\61"
 .. _P199x._yp3z(_I1lI.UserId) .. "\38\116\97\114\103\101\116\84\121\112\101\61\85\115\101\114"
 local _l1 = openURL(_IlII)
 if _llllI and _llllI.Parent then
 _llllI.Text = "\65\98\114\105\114\32\114\101\112\111\114\116\101\32\100\101\32\82\111\98\108\111\120\32\8594"
 _llllI:SetAttribute("\111\99\117\112\97\100\111", nil)
 end
 if _l1 then
 _l1lIll.Text = "\10003\32\82\101\112\111\114\116\101\32\97\98\105\101\114\116\111\46\32\76\97\32\100\101\115\99\114\105\112\99\105\243\110\32\101\115\116\225\32\99\111\112\105\97\100\97\58\32\112\233\103\97\108\97\32\101\110\32\101\108\32\102\111\114\109\117\108\97\114\105\111\46"
 cerrar()
 else
 _l1lIll.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\101\110\32\116\117\32\101\120\101\99\117\116\111\114\46\32\84\101\32\100\101\106\111\32\101\108\32\108\105\110\107\32\112\97\114\97\32\99\111\112\105\97\114\108\111\46"
 showLinkModal(_IlII)
 end
 end)
 end))
 local _IlllI = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 _IlllI.Size = UDim2.new((290+-289), -_P199x._8x6q(1988/71), (44+-44), (176-162))
 _IlllI.Position = UDim2.new(bit32.bxor(171,0xAB), _P199x._8x6q(2478/177), (362-361), -_P199x._8x6q(3762/57))
 _IlllI.BackgroundTransparency = (126+-125)
 _IlllI.Font = Enum.Font.Gotham; _IlllI.TextSize = (211-201)
 _IlllI.TextColor3 = C.subtext
 _IlllI.Text = "\69\108\32\114\101\112\111\114\116\101\32\108\111\32\101\110\118\237\97\115\32\116\250\32\101\110\32\108\97\32\119\101\98\32\100\101\32\82\111\98\108\111\120\46\32\69\115\116\97\32\104\101\114\114\97\109\105\101\110\116\97\32\110\111\32\109\97\110\100\97\32\110\97\100\97\32\101\110\32\116\117\32\110\111\109\98\114\101\46"
 _IlllI.TextXAlignment = Enum.TextXAlignment.Left
 _IlllI.ZIndex = Z.sobre
 themed(_IlllI, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 construirVars()
 refrescar()
 P._repintarModal = function()
 if _lIlIIlIl and _lIlIIlIl.Parent then pcall(refrescar) end
 end
 end
 onRepaint(function()
 if P._repintarModal then P._repintarModal() end
 end)
 _G.NXPlus = P
end
do
 local D = {}
 local _lIllI = {
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
 local _IIllI = {
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
 local _l1llI = {
 yt=true, ytb=true, ttv=true, tv=true, rblx=true, rbx=true, roblox=true,
 pro=true, gamer=true, gaming=true, real=true, oficial=true, official=true,
 its=true, im=true, the=true, xd=true, ff=true, op=true, god=true, king=true,
 queen=true, boss=true, lord=true, mr=true, mrs=true, itz=true, iam=true, yes=true,
 dev=true, noob=true, dark=true, shadow=true, fire=true, ice=true, epic=true,
 super=true, mega=true, ultra=true, mini=true, big=true, lil=true, _l1lIll1=true,
 new=true, red=true, blue=true, black=true, _lllllI1=true, gold=true, toxic=true,
 cool=true, fast=true, crazy=true, ninja=true, sniper=true, beast=true, killer=true,
 legend=true, alpha=true, beta=true, omega=true, clan=true, team=true, squad=true,
 vip=true, og=true, ez=true, gg=true, _I1I=true, mc=true, cod=true, fps=true,
 }
 local _I1llI = { "\99\104\105\116\111","\99\104\105\116\97","\99\105\116\111","\99\105\116\97","\105\108\108\111","\105\108\108\97","\105\116\111","\105\116\97" }
 local _lllllI = { "\122\122","\120\120","\120\100","\103\103","\115\115","\116\116","\110\110","\108\108","\114\114","\121\121","\105\105","\111\111","\101\101","\97\97" }
 local _IIlllI = { z=true, x=true, o=true, q=true, v=true, w=true, y=true }
 local _lIlllI = { "\120\120","\120\100","\105\105","\101\108","\108\97","\108\111\115","\108\97\115","\109\99","\100\114","\100\106" }
 local _lIlI = { i=true, x=true, o=true }
 local _IIlI = {
 ["\52"]={"\97"}, ["\51"]={"\101"}, ["\48"]={"\111"}, ["\55"]={"\116"}, ["\56"]={"\98"},
 ["\64"]={"\97"}, ["\36"]={"\115"}, ["\43"]={"\116"},
 ["\49"]={"\105","\108"}, ["\53"]={"\115"}, ["\57"]={"\103"}, ["\54"]={"\103"}, ["\50"]={"\122"},
 ["\33"]={"\105","\108"}, ["\124"]={"\105","\108"},
 }
 local _llIlI = {
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
 local _IlIlI = {
 ["\97\204\129"]="\97",["\101\204\129"]="\101",["\105\204\129"]="\105",["\111\204\129"]="\111",
 ["\117\204\129"]="\117",["\117\204\136"]="\117",["\110\204\131"]="\110",
 }
 local function normalize(s)
 s = _P199x._yp3z(s):lower()
 for _llllI, to in pairs(_IlIlI) do s = s:gsub(_llllI, to) end
 return s
 end
 local function editDistance(a, b)
 local _lIIlI, _I1l1lI = #a, #b
 if _P199x._tl3k(_lIIlI - _I1l1lI) > (12+-10) then return bit32.bxor(200,0xAB) end
 local _lIllIl = {}
 for j = _P199x._8x6q(0/128), _I1l1lI do _lIllIl[j] = j end
 for i = _P199x._8x6q(63/63), _lIIlI do
 local _IIIlI = { [bit32.bxor(171,0xAB)] = i }
 local _l1IlI = a:_IIlIIl(i)
 for j = (282+-281), _I1l1lI do
 local _I1IlI = (_l1IlI == b:_IIlIIl(j)) and bit32.bxor(171,0xAB) or (9+-8)
 _IIIlI[j] = _P199x._7ofy(_lIllIl[j] + (14-13), _IIIlI[j-(458-457)] + (55+-54), _lIllIl[j-(75-74)] + _I1IlI)
 end
 _lIllIl = _IIIlI
 end
 return _lIllIl[_I1l1lI]
 end
 local function inDict(_IIlIlI, _lllIIlIl)
 if #_IIlIlI < _P199x._8x6q(322/161) then return false end
 local _lllIlI = _lllIIlIl[_IIlIlI:_IllIlIl((3-2),bit32.bxor(169,0xAB))]
 if not _lllIlI then return false end
 for _, n in ipairs(_lllIlI) do
 if n == _IIlIlI then return true end
 end
 return false
 end
 local function matchNameIdx(_lIlIlI, _lllIIlIl)
 local n = #_lIlIlI
 if n < (201+-199) then return nil, (181-82), nil end
 if inDict(_lIlIlI, _lllIIlIl) then return _lIlIlI, (287-287), "\101\120\97\99\116" end
 if n < (338-335) then return nil, (189+-90), nil end
 local _IlllI = _lIlIlI:_IllIlIl((257-256), (40+-39))
 local _lllllI, bestD = nil, (192+-189)
 local _IllllI, pfxLen = nil, math.huge
 for b = string._IIlIIl("\97"), string._IIlIIl("\122") do
 local _lllIlI = _lllIIlIl[_IlllI .. string._lI1I1(b)]
 if _lllIlI then
 for _, _lll in ipairs(_lllIlI) do
 if #_lll > n and _lll:_IllIlIl((110-109), n) == _lIlIlI and #_lll < pfxLen then
 _IllllI, pfxLen = _lll, #_lll
 end
 if _P199x._tl3k(#_lll - n) <= bit32.bxor(169,0xAB) then
 local d = editDistance(_lIlIlI, _lll)
 if d < bestD then _lllllI, bestD = _lll, d end
 end
 end
 end
 end
 local _lIlllI = _lllllI and ((bestD == bit32.bxor(170,0xAB) and n >= (484-480)) or (bestD == bit32.bxor(169,0xAB) and n >= (1+5)))
 if _lIlllI and bestD == (81-80) then return _lllllI, bit32.bxor(170,0xAB), "\102\117\122\122\121" end
 if _IllllI then return _IllllI, _P199x._8x6q(0/30), "\112\114\101\102\105\120" end
 if _lIlllI then return _lllllI, bestD, "\102\117\122\122\121" end
 return nil, (514-415), nil
 end
do local _cf3b4a=1 while _cf3b4a>0 do if _cf3b4a==1 then
do local _u3n3=(function()return nil end)();if _7l07 then error("")end end
 local function applyClusters(_lllII)
 local _IIlllI = _lllII
 local _l1lllI = {}
_cf3b4a=0 end end end
 for _, cl in ipairs(_llIlI) do
 if _IIlllI:find(cl.pat, (482-481), true) then
 _IIlllI = _IIlllI:gsub(cl.pat, cl.rep)
 _l1lllI[#_l1lllI+bit32.bxor(170,0xAB)] = cl.pat .. "\32\8594\32" .. cl.rep
 end
 end
 return _IIlllI, _l1lllI
 end
 local function stripStyleSuffix(w)
 local _I1lllI = {}
 for _, suf in ipairs(_lllllI) do
 if #w >= #suf + (56-53) and w:_IllIlIl(-#suf) == suf then
 w = w:_IllIlIl((435-434), #w - #suf)
 _I1lllI[#_I1lllI+(176-175)] = suf
 break
 end
 end
 if #w >= _P199x._8x6q(420/105) and _IIlllI[w:_IllIlIl(-(144+-143))] then
 local _llllllI = w:_IllIlIl(-bit32.bxor(170,0xAB))
 w = w:_IllIlIl((272-271), -(249-247))
 _I1lllI[#_I1lllI+(347-346)] = _llllllI
 end
 return w, _I1lllI
 end
 local function stripStylePrefix(w)
 local _I1lllI = {}
 for _, pre in ipairs(_lIlllI) do
 if #w >= #pre + (285+-282) and w:_IllIlIl(bit32.bxor(170,0xAB), #pre) == pre then
 w = w:_IllIlIl(#pre + bit32.bxor(170,0xAB))
 _I1lllI[#_I1lllI+bit32.bxor(170,0xAB)] = pre
 break
 end
 end
 if #w >= (236-232) and _lIlI[w:_IllIlIl(_P199x._8x6q(194/194),bit32.bxor(170,0xAB))] then
 local _IIllllI = w:_IllIlIl((39+-38),(294+-293))
 w = w:_IllIlIl(bit32.bxor(169,0xAB))
 _I1lllI[#_I1lllI+bit32.bxor(170,0xAB)] = _IIllllI
 end
 return w, _I1lllI
 end
 local _lIllllI = bit32.bxor(179,0xAB)
 local function deLeet(_lllII)
 local _IIlII = { { _lIl = "", _IlIllI = {}, ambig = _P199x._8x6q(0/87), solid = bit32.bxor(171,0xAB) } }
 for i = (186+-185), #_lllII do
 local _lIllI = _lllII:_IllIlIl(i, i)
 local _IIlI = _IIlI[_lIllI]
 local _IIllI = {}
 if _IIlI then
 local _llIllI = #_IIlI > (486-485)
 for _, r in ipairs(_IIlII) do
 for _, letter in ipairs(_IIlI) do
 if #_IIllI < _lIllllI then
 local _IlIllI = {}
 for _, x in ipairs(r._IlIllI) do _IlIllI[#_IlIllI + bit32.bxor(170,0xAB)] = x end
 _IlIllI[#_IlIllI + _P199x._8x6q(129/129)] = _lIllI .. "\32\8594\32" .. letter
 _IIllI[#_IIllI + (263-262)] = {
 _lIl = r._lIl .. letter, _IlIllI = _IlIllI,
 ambig = r.ambig + (_llIllI and _P199x._8x6q(77/77) or (79+-79)),
 solid = r.solid + (_llIllI and _P199x._8x6q(0/73) or _P199x._8x6q(105/105)),
 }
 end
 end
 end
 else
 local _lIIllI = _lIllI:match("\37\97") and _lIllI or ""
 for _, r in ipairs(_IIlII) do
 r._lIl = r._lIl .. _lIIllI
 _IIllI[#_IIllI + (383-382)] = r
 end
 end
 _IIlII = _IIllI
 if #_IIlII == (227+-227) then break end
 end
 return _IIlII
 end
 local function stripDiminutive(w)
 for _, suf in ipairs(_I1llI) do
 if #w >= #suf + _P199x._8x6q(270/90) and w:_IllIlIl(-#suf) == suf then
 return w:_IllIlIl((68-67), #w - #suf), suf
 end
 end
 return w, nil
 end
 local function splitNameYear(s)
 local _lll, year = s:match("\94\40\46\45\41\40\37\100\37\100\37\100\37\100\41\36")
 if _lll and #_lll >= (148+-145) then
 local y = _P199x._p02a(year)
 if y and y >= bit32.bxor(1815,0xAB) and y <= (241+1785) then
 return _lll, y
 end
 end
 _lll, year = s:match("\94\40\46\45\41\40\37\100\37\100\41\36")
 if _lll and #_lll >= _P199x._8x6q(93/31) then
 local y = _P199x._p02a(year)
 if y then
 local _IIIllI = y >= (256-176) and ((2239-339) + y) or ((2216-216) + y)
 if _IIIllI >= (83+1897) and _IIIllI <= (2331-305) then
 return _lll, _IIIllI
 end
 end
 end
 return s, nil
 end
 local function smartTokenize(s)
 local _l1IllI = {}
 for _I1lIIl in s:gmatch("\91\94\95\37\46\37\45\93\43") do
 _l1IllI[#_l1IllI+(233-232)] = _I1lIIl
 end
 local _I1IllI = {}
 for _, part in ipairs(_l1IllI) do
 local _lllIllI = ""
 for i = (287-286), #part do
 local _lIllI = part:_IllIlIl(i,i)
 local _lIllIl = _lllIllI:_IllIlIl(-_P199x._8x6q(17/17))
 local _IIlIllI = false
 if #_lllIllI > bit32.bxor(171,0xAB) then
 if (_lIllIl:match("\37\97") and _lIllI:match("\37\100")) or (_lIllIl:match("\37\100") and _lIllI:match("\37\97")) then
 _IIlIllI = true
 elseif _lIllIl:match("\37\108") and _lIllI:match("\37\117") then
 _IIlIllI = true
 end
 end
 if _IIlIllI then
 if #_lllIllI >= (80+-78) then _I1IllI[#_I1IllI+(280+-279)] = _lllIllI end
 _lllIllI = _lIllI:lower()
 else
 _lllIllI = _lllIllI .. _lIllI:lower()
 end
 end
 if #_lllIllI >= _P199x._8x6q(124/62) then _I1IllI[#_I1IllI+_P199x._8x6q(4/4)] = _lllIllI end
 end
 return _I1IllI
 end
 local function trySplitCompound(_IIlIlI)
 local _I1lllI = {}
 for i = (194+-191), #_IIlIlI - _P199x._8x6q(477/159) do
 local _lIlIllI = _IIlIlI:_IllIlIl(bit32.bxor(170,0xAB), i)
 local _llIlI = _IIlIlI:_IllIlIl(i + (351-350))
 local _IlIlI, lDist, lType = matchNameIdx(_lIlIllI, _lIllI)
 if _IlIlI and lType ~= "\112\114\101\102\105\120" and lDist <= _P199x._8x6q(143/143) then
 local _lllIlI, rDist, rType = matchNameIdx(_llIlI, _IIllI)
 if not _lllIlI or rType == "\112\114\101\102\105\120" or rDist > bit32.bxor(170,0xAB) then
 _lllIlI, rDist, rType = matchNameIdx(_llIlI, _lIllI)
 end
 if _lllIlI and rType ~= "\112\114\101\102\105\120" and rDist <= (270+-269) then
 local _IllI = bit32.bxor(207,0xAB) - (107+-87)*(lDist + rDist)
 _I1lllI[#_I1lllI+_P199x._8x6q(196/196)] = {
 _IIllllI = _IlIlI, second = _lllIlI,
 _IllI = _P199x._5x5j(_IllI, _P199x._8x6q(0/194), bit32.bxor(207,0xAB)),
 _IlI1I1 = lDist + rDist,
 }
 end
 end
 end
 if #_I1lllI > (429-429) then
 _P199x._c9pr(_I1lllI, function(a,b) return a._IllI > b._IllI end)
 return _I1lllI[(107-106)]
 end
 return nil
 end
 local _IllIlI = { Insuficiente = (291+-291), Baja = (92+-91), Media = _P199x._8x6q(236/118), Alta = (6-3) }
 local function capLevel(_lIlIlI, _IIlIlI)
 if not _IIlIlI then return _lIlIlI end
 if _IllIlI[_lIlIlI] > _IllIlI[_IIlIlI] then return _IIlIlI end
 return _lIlIlI
 end
 local function levelOf(_lIIl, _l1lIlI)
 if not _l1lIlI then return "\73\110\115\117\102\105\99\105\101\110\116\101" end
 if _lIIl >= bit32.bxor(224,0xAB) then return "\65\108\116\97"
 elseif _lIIl >= (171+-121) then return "\77\101\100\105\97"
 elseif _lIIl >= _P199x._8x6q(5760/192) then return "\66\97\106\97"
 else return "\73\110\115\117\102\105\99\105\101\110\116\101" end
 end
 function D._lIlIll(_l1llIl)
 local _lIlIIl = {
 _l1llIl = _P199x._yp3z(_l1llIl or ""),
 _IlIllI = {}, _Illlll = {}, hasEvidence = false,
 yearGuess = nil,
 compound = nil,
 }
 if _lIlIIl._l1llIl == "" then return _lIlIIl end
 local s = normalize(_lIlIIl._l1llIl)
 local _I1lIlI = {}
 local _llllIlI = nil
 do
 local _, y = splitNameYear(s)
 if not y then
 for _I1lIIl in s:gmatch("\91\94\95\37\46\37\45\93\43") do
 local _, yy = splitNameYear(_I1lIIl)
 if yy then y = yy; break end
 end
 end
 if y then _lIlIIl.yearGuess = y end
 end
 local _I1IllI = smartTokenize(s)
 if #_I1IllI == (172+-172) then _I1IllI = { s } end
 for _IlIIlI, tok in ipairs(_I1IllI) do
 local _IIllIlI = (_IlIIlI == _P199x._8x6q(90/90)) and (272+-264) or (106+-106)
 local _lIllIlI, yearGuess = splitNameYear(tok)
 if yearGuess and not _lIlIIl.yearGuess then _lIlIIl.yearGuess = yearGuess end
 local _I1lllI, _ = stripStylePrefix(_lIllIlI)
 _I1lllI, _ = stripStyleSuffix(_I1lllI)
 local _lIIlI, clusterSubs = applyClusters(_I1lllI)
 local _IIIlI = { tok, _lIllIlI, _I1lllI, _lIIlI }
 local _lllI1I = {}
 local _llIIlI = {}
 for _, b in ipairs(_IIIlI) do
 if #b >= (220-218) and b:match("\37\97") and not _lllI1I[b] then
 _lllI1I[b] = true
 _llIIlI[#_llIIlI+bit32.bxor(170,0xAB)] = b
 end
 end
 for _, _I1llI1 in ipairs(_llIIlI) do
 local _lIIIlI = _I1llI1:gsub("\91\94\97\45\122\93", "")
 if not _l1llI[_lIIIlI] and #_lIIIlI >= bit32.bxor(169,0xAB) then
 if not _llllIlI and #_lIIIlI >= (67-65) then _llllIlI = _lIIIlI end
 if #_lIIIlI >= bit32.bxor(173,0xAB) and not _lIlIIl.compound then
 local _IIIIlI = trySplitCompound(_lIIIlI)
 if _IIIIlI and _IIIIlI._IllI >= (278+-218) then
 _lIlIIl.compound = _IIIIlI
 local _l1IIlI = _IIIIlI._IIllllI
 local _lIllIl = _I1lIlI[_l1IIlI]
 local _lIIl = _IIIIlI._IllI + _IIllIlI
 if not _lIllIl or _lIIl > _lIllIl._IllI then
 _I1lIlI[_l1IIlI] = { _IllI = _lIIl, _llIII = levelOf(_lIIl, true), _IlIllI = clusterSubs, compound = _IIIIlI }
 end
 end
 end
 for _, c in ipairs(deLeet(_I1llI1)) do
 local _I1IIlI = { { c._lIl, false } }
 local _lllIIlI, dim = stripDiminutive(c._lIl)
 if dim then _I1IIlI[#_I1IIlI + (297+-296)] = { _lllIIlI, true } end
 for _, v in ipairs(_I1IIlI) do
 local _lIlIlI, _IlI1I1, _lIIIll1 = matchNameIdx(v[bit32.bxor(170,0xAB)], _lIllI)
 local _IIlIIlI = true
 if not _lIlIlI then
 _lIlIlI, _IlI1I1, _lIIIll1 = matchNameIdx(v[bit32.bxor(170,0xAB)], _IIllI)
 _IIlIIlI = false
 end
 if _lIlIlI then
 local L = #v[_P199x._8x6q(58/58)]
 local _lIIl, _IIlIlI
 if _lIIIll1 == "\101\120\97\99\116" then
 _lIIl, _IIlIlI = (71+29), "\65\108\116\97"
 elseif _lIIIll1 == "\112\114\101\102\105\120" then
 _lIIl = bit32.bxor(159,0xAB) + _P199x._7ofy(L - _P199x._8x6q(531/177), (71+-68)) * (287+-281)
 _IIlIlI = "\77\101\100\105\97"
 else
 _lIIl = bit32.bxor(207,0xAB) - _P199x._8x6q(_IlI1I1 * (bit32.bxor(39,0xAB) / L))
 if L >= bit32.bxor(163,0xAB) then _IIlIlI = "\65\108\116\97"
 elseif L >= (127+-121) and _IlI1I1 <= _P199x._8x6q(169/169) then _IIlIlI = "\65\108\116\97"
 elseif L >= bit32.bxor(175,0xAB) then _IIlIlI = "\77\101\100\105\97"
 else _IIlIlI = "\66\97\106\97" end
 end
 _lIIl = _lIIl - (499-477)*c.ambig - bit32.bxor(175,0xAB)*c.solid
 if v[(123+-121)] then _lIIl = _lIIl - (397-385) end
 if not _IIlIIlI then _lIIl = _lIIl - _P199x._8x6q(1134/189) end
 _lIIl = _lIIl + _IIllIlI
 _lIIl = _P199x._5x5j(_lIIl, (148+-148), bit32.bxor(207,0xAB))
 local _lIlIlI = capLevel(levelOf(_lIIl, true), _IIlIlI)
 local _lIlIIlI = {}
 for _, x in ipairs(clusterSubs) do _lIlIIlI[#_lIlIIlI+(416-415)] = x end
 for _, x in ipairs(c._IlIllI) do _lIlIIlI[#_lIlIIlI+(280+-279)] = x end
 local _lIllIl = _I1lIlI[_lIlIlI]
 if not _lIllIl or _lIIl > _lIllIl._IllI then
 _I1lIlI[_lIlIlI] = { _IllI = _lIIl, _llIII = _lIlIlI, _IlIllI = _lIlIIlI }
 end
 end
 end
 end
 end
 end
 end
 local _lIlI = {}
 for _lll, _l1lI in pairs(_I1lIlI) do
 _lIlI[#_lIlI + (157+-156)] = { _lll = _lll, _IllI = _l1lI._IllI, _llIII = _l1lI._llIII, _IlIllI = _l1lI._IlIllI, compound = _l1lI.compound }
 end
 _P199x._c9pr(_lIlI, function(a, b) return a._IllI > b._IllI end)
 if _lIlI[bit32.bxor(170,0xAB)] then _lIlIIl._IlIllI = _lIlI[bit32.bxor(170,0xAB)]._IlIllI; _lIlIIl.hasEvidence = true end
 for i = bit32.bxor(170,0xAB), _P199x._7ofy((464-460), #_lIlI) do _lIlIIl._Illlll[#_lIlIIl._Illlll + _P199x._8x6q(77/77)] = _lIlI[i] end
 if #_lIlIIl._Illlll == bit32.bxor(171,0xAB) and _llllIlI then
 _lIlIIl._Illlll[(87+-86)] = { _lll = _llllIlI, _IllI = (241-226), _llIII = "\73\110\115\117\102\105\99\105\101\110\116\101", _IlIllI = {} }
 end
 return _lIlIIl
 end
 _G.NXDecoder = D
end
do
 if _G.NXIntel and _G.NXIntel.stop then pcall(_G.NXIntel.stop) end
 local I = {}
 local _ll1lI = "\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\105\110\116\101\108\46\106\115\111\110"
 local _Il1lI  = "\80\114\111\102\105\108\101\65\110\97\108\121\122\101\114\95\105\110\116\101\108\46\98\97\107\46\106\115\111\110"
 local _lll1lI  = bit32.bxor(153,0xAB)
 local _Ill1lI = bit32.bxor(191,0xAB)
 local _lIl1lI = {}
 local _IIl1lI = _P199x._8x6q(0/61)
 local function saveIntel()
 if not _ll then return end
 pcall(function()
 local _lI = HttpService:JSONEncode(_lIl1lI)
 writefile(_ll1lI, _lI)
 writefile(_Il1lI, _lI)
 end)
 end
 local function loadIntel()
 if not _ll then return end
 pcall(function()
 local _II
 if isfile(_ll1lI) then _II = readfile(_ll1lI) end
 local _l1, _lllIl = pcall(function() return HttpService:JSONDecode(_II) end)
 if (not _l1 or _P199x._iy38(_lllIl) ~= "\116\97\98\108\101") and isfile(_Il1lI) then
 _l1, _lllIl = pcall(function() return HttpService:JSONDecode(readfile(_Il1lI)) end)
 end
 if _l1 and _P199x._iy38(_lllIl) == "\116\97\98\108\101" then _lIl1lI = _lllIl end
 end)
 end
 loadIntel()
 local function evictLRU()
 local _l1l1lI = {}
 for k in pairs(_lIl1lI) do _l1l1lI[#_l1l1lI + (188-187)] = k end
 if #_l1l1lI <= _lll1lI then return end
 _P199x._c9pr(_l1l1lI, function(a, b)
 local _lIIlI = _lIl1lI[a] and _lIl1lI[a].lastSeen or bit32.bxor(171,0xAB)
 local _I1l1lI = _lIl1lI[b] and _lIl1lI[b].lastSeen or bit32.bxor(171,0xAB)
 return _lIIlI < _I1l1lI
 end)
 while #_l1l1lI > _lll1lI do
 _lIl1lI[_l1l1lI[_P199x._8x6q(105/105)]] = nil
 _P199x._otn1(_l1l1lI, (85-84))
 end
 end
 local _llll1lI = { "\117\115\101\114\110\97\109\101", "\100\105\115\112\108\97\121\78\97\109\101", "\118\101\114\105\102\105\101\100", "\98\97\110\110\101\100", "\100\101\108\101\116\101\100",
 "\102\114\105\101\110\100\115", "\102\111\108\108\111\119\101\114\115", "\102\111\108\108\111\119\105\110\103", "\103\114\111\117\112\115", "\98\97\100\103\101\115" }
 local function snapEqual(a, b)
 if not a or not b then return false end
 for _, f in ipairs(_llll1lI) do
 if _P199x._yp3z(a[f] or "") ~= _P199x._yp3z(b[f] or "") then return false end
 end
 return true
 end
 local function buildSnapshot(_I1lI)
 local _IIll1lI = os.time()
 return {
 _l1llIl    = _I1lI.Username,
 _llllllIl = _I1lI.DisplayName,
 _llIlI     = _I1lI.Friends,
 _IIllII   = _I1lI.Followers,
 _lIllII   = _I1lI.Following,
 _IlIlI      = _I1lI.Groups,
 _lIIlI      = _I1lI.Badges,
 _I1IlI    = (_I1lI.Verified == "\83\237"),
 banned      = (_I1lI.Banned == "\83\237"),
 deleted     = (_I1lI.IsDeleted == true),
 collected_at = _IIll1lI,
 first_seen   = _IIll1lI,
 last_seen    = _IIll1lI,
 sources = {
 _l1llIl  = "\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\123\105\100\125",
 _llIlI   = "\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\123\105\100\125\47\102\114\105\101\110\100\115\47\99\111\117\110\116",
 _IIllII = "\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\123\105\100\125\47\102\111\108\108\111\119\101\114\115\47\99\111\117\110\116",
 _lIllII = "\102\114\105\101\110\100\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\123\105\100\125\47\102\111\108\108\111\119\105\110\103\115\47\99\111\117\110\116",
 _IlIlI    = "\103\114\111\117\112\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\123\105\100\125\47\103\114\111\117\112\115\47\114\111\108\101\115",
 _lIIlI    = "\98\97\100\103\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\123\105\100\125\47\98\97\100\103\101\115",
 },
 }
 end
 local function mergeTimeline(_lIl, _III1lI)
 local _lIll1lI = _lIl.usernameTimeline or {}
 local _lllI1I = {}
 for i, t in ipairs(_lIll1lI) do _lllI1I[t._lll] = i end
 if _III1lI then
 for _, n in ipairs(_III1lI) do
 if not _lllI1I[n] then
 _lIll1lI[#_lIll1lI + _P199x._8x6q(90/90)] = { _lll = n, first_seen = (214+-214), last_seen = _P199x._8x6q(0/80) }
 _lllI1I[n] = #_lIll1lI
 end
 end
 end
 for _, _II1lI in ipairs(_lIl.snapshots or {}) do
 if _II1lI._l1llIl then
 local _lllIIlIl = _lllI1I[_II1lI._l1llIl]
 if not _lllIIlIl then
 _lIll1lI[#_lIll1lI + bit32.bxor(170,0xAB)] = { _lll = _II1lI._l1llIl, first_seen = _II1lI.first_seen or bit32.bxor(171,0xAB), last_seen = _II1lI.last_seen or (109+-109) }
 _lllI1I[_II1lI._l1llIl] = #_lIll1lI
 else
 local t = _lIll1lI[_lllIIlIl]
 if _II1lI.first_seen and (t.first_seen == bit32.bxor(171,0xAB) or _II1lI.first_seen < t.first_seen) then
 t.first_seen = _II1lI.first_seen
 end
 if _II1lI.last_seen and _II1lI.last_seen > t.last_seen then
 t.last_seen = _II1lI.last_seen
 end
 end
 end
 end
 _lIl.usernameTimeline = _lIll1lI
 return _lIll1lI
 end
 function I.record(_I1lI, _III1lI)
 if not _I1lI or not _I1lI.UserId then return end
 local _lI1lI = _P199x._yp3z(_I1lI.UserId)
 local _lIl = _lIl1lI[_lI1lI] or { snapshots = {}, usernameTimeline = {} }
 _lIl1lI[_lI1lI] = _lIl
 local _II1lI = buildSnapshot(_I1lI)
 local _llI1lI = _lIl.snapshots or {}
 _lIl.snapshots = _llI1lI
 local _llllllI = _llI1lI[#_llI1lI]
 if snapEqual(_llllllI, _II1lI) then
 _llllllI.last_seen = _II1lI.last_seen
 else
 if _llllllI then _II1lI.first_seen = _II1lI.collected_at end
 _llI1lI[#_llI1lI + (228-227)] = _II1lI
 while #_llI1lI > _Ill1lI do _P199x._otn1(_llI1lI, (43-42)) end
 end
 _lIl.lastSeen = os.time()
 mergeTimeline(_lIl, _III1lI)
 evictLRU()
 saveIntel()
 end
 function I.getChanges(_I1lI)
 if not _I1lI or not _I1lI.UserId then return {} end
 local _lI1lI = _P199x._yp3z(_I1lI.UserId)
 local _lIl = _lIl1lI[_lI1lI]
 if not _lIl then return {} end
 local _llI1lI = _lIl.snapshots or {}
 if #_llI1lI < _P199x._8x6q(194/97) then return {} end
 local _lIllIl = _llI1lI[#_llI1lI - bit32.bxor(170,0xAB)]
 local _IlI1lI = _llI1lI[#_llI1lI]
 local _lII1lI = {}
 for _, f in ipairs(_llll1lI) do
 local o = _lIllIl[f]
 local n = _IlI1lI[f]
 if _P199x._yp3z(o or "") ~= _P199x._yp3z(n or "") then
 _lII1lI[#_lII1lI + (205+-204)] = {
 _IlI = f, _l1lIll1 = o, new = n,
 detected_at = _IlI1lI.collected_at or os.time(),
 }
 end
 end
 return _lII1lI
 end
 function I.getTimeline(_I1lI)
 if not _I1lI or not _I1lI.UserId then return {} end
 local _lI1lI = _P199x._yp3z(_I1lI.UserId)
 local _lIl = _lIl1lI[_lI1lI]
 if not _lIl then return {} end
 return _lIl.usernameTimeline or {}
 end
 function I.getEntry(_I1lI)
 if not _I1lI or not _I1lI.UserId then return nil end
 return _lIl1lI[_P199x._yp3z(_I1lI.UserId)]
 end
 function I.reset()
 _IIl1lI = _IIl1lI + (219-218)
 end
 function I.stop()
 _IIl1lI = _IIl1lI + (62+-61)
 end
 function I.buildCard(_lllI, _I1lI, _I1I1lI)
 local _l1I1lI = _IIl1lI
 local _lI1lI = _I1lI.UserId
 local _IlI = Instance.new("\70\114\97\109\101", _lllI)
 _IlI.Name = "\78\88\73\110\116\101\108\67\97\114\100"
 _IlI.LayoutOrder = _I1I1lI
 _IlI.Size = UDim2.new((144-143), -(125-121), _P199x._8x6q(0/36), _P199x._8x6q(0/34))
 _IlI.AutomaticSize = Enum.AutomaticSize.Y
 _IlI.BackgroundColor3 = C._IlI
 _IlI.BorderSizePixel = (200-200)
 _IlI.ClipsDescendants = true
 Instance.new("\85\73\67\111\114\110\101\114", _IlI).CornerRadius = UDim.new(bit32.bxor(171,0xAB), (111-103))
 themed(_IlI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _lllI1lI = Instance.new("\85\73\83\116\114\111\107\101", _IlI)
do local _h2mk=tick()-tick();if _poze~=0 then warn("")end end
 _lllI1lI.Color = C._IlIll1; _lllI1lI.Thickness = 1.2; _lllI1lI.Transparency = 0.35
 themed(_lllI1lI, "\67\111\108\111\114", "\97\99\99\101\110\116")
 local _IIlI1lI = Instance.new("\85\73\80\97\100\100\105\110\103", _IlI)
 _IIlI1lI.PaddingTop = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(88/11)); _IIlI1lI.PaddingBottom = UDim.new((295-295), bit32.bxor(163,0xAB))
 _IIlI1lI.PaddingLeft = UDim.new(_P199x._8x6q(0/15), _P199x._8x6q(1320/132)); _IIlI1lI.PaddingRight = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(1210/121))
 local _lIlI1lI = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _IlI)
 _lIlI1lI.Padding = UDim.new((248+-248), bit32.bxor(175,0xAB)); _lIlI1lI.SortOrder = Enum.SortOrder.LayoutOrder
 local h = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 h.LayoutOrder = (175-175); h.Size = UDim2.new(bit32.bxor(170,0xAB), _P199x._8x6q(0/92), _P199x._8x6q(0/43), _P199x._8x6q(1160/58))
 h.BackgroundTransparency = bit32.bxor(170,0xAB)
 h.Font = Enum.Font.GothamBold; h.TextSize = _P199x._8x6q(728/52)
 h.TextColor3 = C._IlIll1; h.Text = "\85\115\101\114\110\97\109\101\32\72\105\115\116\111\114\121\32\43\32\73\110\116\101\108\108\105\103\101\110\99\101"
 h.TextXAlignment = Enum.TextXAlignment.Left
 themed(h, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _Ill = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 _Ill.Name = "\73\110\116\101\108\66\111\100\121"
 _Ill.LayoutOrder = (148+-147)
 _Ill.Size = UDim2.new(bit32.bxor(170,0xAB), (184+-184), (407-407), (7+-7))
 _Ill.AutomaticSize = Enum.AutomaticSize.Y
 _Ill.BackgroundTransparency = (359-358)
 _Ill.Font = Enum.Font.Gotham; _Ill.TextSize = (248+-235)
 _Ill.TextColor3 = C._lIl; _Ill.TextWrapped = true
 _Ill.TextXAlignment = Enum.TextXAlignment.Left
 _Ill.TextYAlignment = Enum.TextYAlignment.Top
 _Ill.Text = "\82\101\99\111\112\105\108\97\110\100\111\46\46\46"
 themed(_Ill, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local function actualizar(_III1lI)
 if _IIl1lI ~= _l1I1lI then return end
 if not _IlI.Parent then return end
 if _IllllIl == nil or _IllllIl.UserId ~= _lI1lI then return end
 I.record(_I1lI, _III1lI)
 local _lIll1lI = I.getTimeline(_I1lI)
 local _lII1lI = I.getChanges(_I1lI)
 local _lllllI = {}
 if #_lIll1lI > _P199x._8x6q(0/172) then
 _lllllI[#_lllllI + bit32.bxor(170,0xAB)] = "\84\105\109\101\108\105\110\101\32\100\101\32\117\115\101\114\110\97\109\101\115\58"
 for _, t in ipairs(_lIll1lI) do
 local _IllllI = (t._lll == _I1lI.Username) and "\9679" or "\9675"
 local _llllllI = ""
 if t.first_seen and t.first_seen > (274+-274) then
 _llllllI = _llllllI .. "\32\32\111\98\115\101\114\118\97\100\111\58\32" .. os.date("\37\89\45\37\109\45\37\100", t.first_seen)
 if t.last_seen and t.last_seen > _P199x._8x6q(0/158) and t.last_seen ~= t.first_seen then
 _llllllI = _llllllI .. "\32\8212\32" .. os.date("\37\89\45\37\109\45\37\100", t.last_seen)
 end
 end
 _lllllI[#_lllllI + (121-120)] = "\32\32" .. _IllllI .. "\32" .. t._lll .. _llllllI
 end
 else
 _lllllI[#_lllllI + (73+-72)] = "\83\105\110\32\104\105\115\116\111\114\105\97\108\32\100\101\32\117\115\101\114\110\97\109\101\115\32\114\101\103\105\115\116\114\97\100\111\46"
 end
 if #_lII1lI > (138+-138) then
 _lllllI[#_lllllI + _P199x._8x6q(17/17)] = ""
 _lllllI[#_lllllI + _P199x._8x6q(88/88)] = "\67\97\109\98\105\111\115\32\100\101\116\101\99\116\97\100\111\115\32\101\110\116\114\101\32\115\110\97\112\115\104\111\116\115\58"
 for _, _lIllI in ipairs(_lII1lI) do
 local o = (_lIllI._l1lIll1 == nil or _lIllI._l1lIll1 == "") and "\8212" or _P199x._yp3z(_lIllI._l1lIll1)
 local n = (_lIllI.new == nil or _lIllI.new == "") and "\8212" or _P199x._yp3z(_lIllI.new)
 if _P199x._iy38(_lIllI._l1lIll1) == "\98\111\111\108\101\97\110" then o = _lIllI._l1lIll1 and "\115\237" or "\110\111" end
 if _P199x._iy38(_lIllI.new) == "\98\111\111\108\101\97\110" then n = _lIllI.new and "\115\237" or "\110\111" end
 _lllllI[#_lllllI + bit32.bxor(170,0xAB)] = "\32\32" .. _lIllI._IlI .. "\58\32" .. o .. "\32\8594\32" .. n
 end
 end
 local _lIl = I.getEntry(_I1lI)
 if _lIl and _lIl.snapshots and #_lIl.snapshots > bit32.bxor(171,0xAB) then
 local _IlllllI = _lIl.snapshots[#_lIl.snapshots]
 _lllllI[#_lllllI + (7+-6)] = ""
 _lllllI[#_lllllI + (107+-106)] = "\82\101\99\111\108\101\99\99\105\243\110\58\32" .. os.date("\37\89\45\37\109\45\37\100\32\37\72\58\37\77", _IlllllI.collected_at or (465-465))
 if _IlllllI.sources then
 local _lIllllI = {}
 for k, v in pairs(_IlllllI.sources) do _lIllllI[#_lIllllI + _P199x._8x6q(144/144)] = k .. "\58\32" .. v end
 _P199x._c9pr(_lIllllI)
 _lllllI[#_lllllI + _P199x._8x6q(27/27)] = "\70\117\101\110\116\101\115\58\32" .. _P199x._oy4i(_lIllllI, "\32\183\32")
 end
 _lllllI[#_lllllI + bit32.bxor(170,0xAB)] = "\83\110\97\112\115\104\111\116\115\32\97\108\109\97\99\101\110\97\100\111\115\58\32" .. #_lIl.snapshots
 end
 _lllllI[#_lllllI + (108-107)] = ""
 _lllllI[#_lllllI + bit32.bxor(170,0xAB)] = "\76\97\115\32\102\101\99\104\97\115\32\115\111\110\32\100\101\32\111\98\115\101\114\118\97\99\105\243\110\32\100\101\108\32\115\99\114\105\112\116\44\32\110\111\32\100\101\32\82\111\98\108\111\120\46"
 _Ill.Text = _P199x._oy4i(_lllllI, "\10")
 end
 if _I1lI._namesCached ~= nil then
 actualizar(_I1lI._namesCached or nil)
 elseif _G.NXPlus and _P199x._iy38(_G.NXPlus.nombres) == "\102\117\110\99\116\105\111\110" then
 _G.NXPlus.nombres(_I1lI, function(_l1llllI)
 actualizar(_l1llllI)
 end)
 else
 task.spawn(function()
 local _l1, _l1llllI = pcall(getNameHistory, _I1lI.UserId)
 _I1lI._namesCached = (_l1 and _l1llllI) or false
 actualizar(_l1 and _l1llllI or nil)
 end)
 end
 if _IIllIlI.enabled then
 _IlI.BackgroundTransparency = (115-114)
 _lllI1lI.Transparency = _P199x._8x6q(54/54)
 h.TextTransparency = (274+-273)
 _Ill.TextTransparency = (168-167)
 task.defer(function()
 if not _IlI.Parent then return end
 motionTween(_IlI, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { BackgroundTransparency = (80-80) })
 motionTween(_lllI1lI, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { Transparency = 0.4 })
 motionTween(h, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { TextTransparency = _P199x._8x6q(0/21) })
 motionTween(_Ill, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { TextTransparency = bit32.bxor(171,0xAB) })
 end)
 end
 return _IlI
 end
 _G.NXIntel = I
end
local function staggerCards(_I1llllI)
 if not _IIllIlI.enabled then return end
 local _IIllllI = {}
 for _, _lIllI in ipairs(_I1llllI:GetChildren()) do
 if _lIllI:IsA("\70\114\97\109\101") and not _lIllI:IsA("\85\73\76\105\115\116\76\97\121\111\117\116") then
 _IIllllI[#_IIllllI + (1+0)] = _lIllI
 end
 end
 _P199x._c9pr(_IIllllI, function(a, b) return a.LayoutOrder < b.LayoutOrder end)
 for _lllIIlIl, _IlI in ipairs(_IIllllI) do
 local _lllllllI = (_lllIIlIl - bit32.bxor(170,0xAB)) * 0.06
 local _IIlllllI = _IlI.BackgroundTransparency
do local _cflt2s=1 while _cflt2s>0 do if _cflt2s==1 then
 if _IIlllllI < _P199x._8x6q(109/109) then
 _IlI.BackgroundTransparency = (237-236)
 end
 local _lIlllllI = _IlI.Position.Y.Offset
_cflt2s=0 end end end
 _IlI.Position = _IlI.Position + UDim2.fromOffset(bit32.bxor(171,0xAB), bit32.bxor(163,0xAB))
 local _lIIllI = {}
 for _, _lIllI in ipairs(_IlI:GetChildren()) do
 if _lIllI:IsA("\84\101\120\116\76\97\98\101\108") or _lIllI:IsA("\84\101\120\116\66\117\116\116\111\110") then
 _lIIllI[#_lIIllI + bit32.bxor(170,0xAB)] = { _lII = _lIllI, orig = _lIllI.TextTransparency }
 _lIllI.TextTransparency = (304-303)
 end
 end
 task.delay(_lllllllI, function()
 if not _IlI.Parent then return end
 motionTween(_IlI, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
 { Position = UDim2.new(_IlI.Position.X.Scale, _IlI.Position.X.Offset, _IlI.Position.Y.Scale, _lIlllllI),
 BackgroundTransparency = _IIlllllI })
 task.delay(0.05, function()
 for _, t in ipairs(_lIIllI) do
 if t._lII.Parent then
 motionTween(t._lII, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { TextTransparency = t.orig })
 end
 end
 end)
 end)
 end
end
local function render(_I1lI, _IIIllI)
 clearScroll(_IlI1ll)
 clearScroll(_III1ll)
 clearScroll(_I1I1ll)
 clearScroll(_IIlI1ll)
 _IllllIl = _I1lI
 if _G.NXOSINT and _G.NXOSINT.reset then pcall(_G.NXOSINT.reset) end
 if _G.NXIntel and _G.NXIntel.reset then pcall(_G.NXIntel.reset) end
 if #_IIl > (1066-266) then
 local n = (232+-232)
 for i = (125-124), #_IIl do
 local e = _IIl[i]
 if e._lII then n = n + bit32.bxor(170,0xAB); _IIl[n] = e end
 end
 for i = #_IIl, n + _P199x._8x6q(63/63), -bit32.bxor(170,0xAB) do _IIl[i] = nil end
 end
 if not _I1lI then return end
 if _IIllIlI.enabled and not _IIIllI then
 for _, _IIll1 in ipairs({ _llI1ll, _lII1ll, _l1I1ll, _lllI1ll }) do
 if _IIll1.Visible then
 local _lIIl = _IIll1:FindFirstChild("\80\97\103\101\83\99\97\108\101")
 if not _lIIl then _lIIl = Instance.new("\85\73\83\99\97\108\101", _IIll1); _lIIl.Name = "\80\97\103\101\83\99\97\108\101" end
 _lIIl.Scale = 0.98
 _IIll1.Position = UDim2.new((261+-261), (217+-217), _P199x._8x6q(0/144), (204+-190))
 motionTween(_IIll1, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
 { Position = UDim2.new(_P199x._8x6q(0/64), bit32.bxor(171,0xAB), (112-112), (82-82)) })
 motionTween(_lIIl, TweenInfo.new(0.38, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { Scale = (471-470) })
 end
 end
 end
 local _llI = _G.NXDS
 local _llIIllI = _llI.makeCard(_IlI1ll, {_IIIl = (127+-127)})
 local _IlIIllI = Instance.new("\70\114\97\109\101", _llIIllI)
 _IlIIllI.LayoutOrder = _P199x._8x6q(1090/109)
 _IlIIllI.Size = UDim2.new((498-497), (400-400), bit32.bxor(171,0xAB), (349-239))
 _IlIIllI.AutomaticSize = Enum.AutomaticSize.Y
 _IlIIllI.BackgroundTransparency = _P199x._8x6q(28/28)
 local _lIIIl = Instance.new("\73\109\97\103\101\66\117\116\116\111\110", _IlIIllI)
 _lIIIl.Size = UDim2.new((1-1), bit32.bxor(207,0xAB), _P199x._8x6q(0/116), _P199x._8x6q(11100/111))
 _lIIIl.Position = UDim2.new(_P199x._8x6q(0/116), (268-268), (401-401), bit32.bxor(171,0xAB))
 _lIIIl.BackgroundColor3 = C.elevated
 _lIIIl.Image = _I1lI.AvatarUrl
 _lIIIl.AutoButtonColor = false
 _lIIIl.BorderSizePixel = bit32.bxor(171,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _lIIIl).CornerRadius = UDim.new(bit32.bxor(170,0xAB), _P199x._8x6q(0/195))
 themed(_lIIIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 _lIIIl.MouseButton1Click:Connect(function()
 showCharacterModal(_I1lI.UserId, _I1lI.Username)
 end)
 if _IIllIlI.enabled and not _IIIllI then
 _lIIIl.ImageTransparency = _P199x._8x6q(182/182)
 motionTween(_lIIIl, TweenInfo.new(0.32, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { ImageTransparency = (55+-55) })
 end
 local _lIIIllI = Instance.new("\70\114\97\109\101", _IlIIllI)
 _lIIIllI.Size = UDim2.new(bit32.bxor(170,0xAB), -(368-252), bit32.bxor(171,0xAB), _P199x._8x6q(1800/18))
 _lIIIllI.Position = UDim2.new(bit32.bxor(171,0xAB), (131+-15), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB))
 _lIIIllI.BackgroundTransparency = (166+-165)
 local _IIIIllI = Instance.new("\84\101\120\116\76\97\98\101\108", _lIIIllI)
 _IIIIllI.Size = UDim2.new(bit32.bxor(170,0xAB), (48+-48), _P199x._8x6q(0/200), bit32.bxor(189,0xAB))
 _IIIIllI.Position = UDim2.new((305-305), _P199x._8x6q(0/184), (486-486), (276-272))
 _IIIIllI.BackgroundTransparency = bit32.bxor(170,0xAB)
 _IIIIllI.Font = Enum.Font.GothamBold
 _IIIIllI.TextSize = _llI._lIl.xl
 _IIIIllI.TextColor3 = C._lIl
 _IIIIllI.Text = _I1lI.DisplayName or _I1lI.Username
 _IIIIllI.TextXAlignment = Enum.TextXAlignment.Left
 _IIIIllI.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_IIIIllI, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _llIIIl = Instance.new("\84\101\120\116\76\97\98\101\108", _lIIIllI)
 _llIIIl.Size = UDim2.new(_P199x._8x6q(48/48), _P199x._8x6q(0/8), bit32.bxor(171,0xAB), bit32.bxor(187,0xAB))
 _llIIIl.Position = UDim2.new((500-500), bit32.bxor(171,0xAB), _P199x._8x6q(0/124), _P199x._8x6q(4984/178))
 _llIIIl.BackgroundTransparency = (40+-39)
 _llIIIl.Font = Enum.Font.Gotham
 _llIIIl.TextSize = _llI._lIl.md
 _llIIIl.TextColor3 = C.subtext
 _llIIIl.Text = "\64" .. (_I1lI.Username or "")
 _llIIIl.TextXAlignment = Enum.TextXAlignment.Left
 _llIIIl.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_llIIIl, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _l1IIllI = Instance.new("\70\114\97\109\101", _lIIIllI)
 _l1IIllI.Size = UDim2.new((144+-143), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB), bit32.bxor(187,0xAB))
 _l1IIllI.Position = UDim2.new(_P199x._8x6q(0/125), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB), (101-51))
 _l1IIllI.BackgroundTransparency = bit32.bxor(170,0xAB)
 local _I1IIllI = Instance.new("\70\114\97\109\101", _l1IIllI)
 _I1IIllI.Size = UDim2.fromOffset(bit32.bxor(163,0xAB), (497-489))
 _I1IIllI.Position = UDim2.new((17-17), (52+-52), 0.5, -(60-56))
 _I1IIllI.BackgroundColor3 = presenceColorFor(_I1lI.PresenceType)
 _I1IIllI.BorderSizePixel = bit32.bxor(171,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _I1IIllI).CornerRadius = UDim.new((98-97), _P199x._8x6q(0/137))
 local _lllIIllI = Instance.new("\84\101\120\116\76\97\98\101\108", _l1IIllI)
 _lllIIllI.Size = UDim2.new((481-480), -(133+-119), (67+-66), _P199x._8x6q(0/94))
 _lllIIllI.Position = UDim2.new(_P199x._8x6q(0/10), bit32.bxor(165,0xAB), (180+-180), (350-350))
 _lllIIllI.BackgroundTransparency = bit32.bxor(170,0xAB)
 _lllIIllI.Font = Enum.Font.Gotham
 _lllIIllI.TextSize = _llI._lIl.sm
 _lllIIllI.TextColor3 = presenceColorFor(_I1lI.PresenceType)
 _lllIIllI.Text = _I1lI.Presence or ""
 _lllIIllI.TextXAlignment = Enum.TextXAlignment.Left
 _lllIIllI.TextTruncate = Enum.TextTruncate.AtEnd
 local _IIlIIllI = Instance.new("\70\114\97\109\101", _llIIllI)
 _IIlIIllI.LayoutOrder = _P199x._8x6q(1140/57)
 _IIlIIllI.Size = UDim2.new((244+-243), _P199x._8x6q(0/134), (63+-63), (18+16))
 _IIlIIllI.BackgroundTransparency = bit32.bxor(170,0xAB)
 local _lIlIIllI = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _IIlIIllI)
 _lIlIIllI.FillDirection = Enum.FillDirection.Horizontal
 _lIlIIllI.Padding = UDim.new(_P199x._8x6q(0/54), (354-346))
 _lIlIIllI.SortOrder = Enum.SortOrder.LayoutOrder
 _lIlIIllI.VerticalAlignment = Enum.VerticalAlignment.Center
 _IIlIIllI.ClipsDescendants = true
 local _llIllI = _llI.makeButton(_IIlIIllI, "\86\101\114\32\97\118\97\116\97\114", "\115\101\99\111\110\100\97\114\121", {_IIIl = bit32.bxor(170,0xAB), _I1Ill1 = UDim2.new(0.3, -_P199x._8x6q(904/113), (213+-213), bit32.bxor(183,0xAB))})
 _llIllI.MouseButton1Click:Connect(function()
 showCharacterModal(_I1lI.UserId, _I1lI.Username)
 end)
 local _IlIllI = _llI.makeButton(_IIlIIllI, "\65\98\114\105\114\32\112\101\114\102\105\108", "\115\101\99\111\110\100\97\114\121", {_IIIl = bit32.bxor(169,0xAB), _I1Ill1 = UDim2.new(0.35, -bit32.bxor(163,0xAB), _P199x._8x6q(0/163), bit32.bxor(183,0xAB))})
 _IlIllI.MouseButton1Click:Connect(function()
 local _lllIllI = openURL(_I1lI.ProfileUrl)
 if _lllIllI then
 _l1lIll.Text = "\80\101\114\102\105\108\32\97\98\105\101\114\116\111\32\101\110\32\101\108\32\110\97\118\101\103\97\100\111\114\46"
 else
 _l1lIll.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\101\110\32\116\117\32\101\120\101\99\117\116\111\114\46"
 showLinkModal(_I1lI.ProfileUrl)
 end
 end)
 local _IllIllI = _llI.makeButton(_IIlIIllI, "\67\111\112\105\97\114\32\108\105\110\107", "\112\114\105\109\97\114\121", {_IIIl = bit32.bxor(168,0xAB), _I1Ill1 = UDim2.new(0.35, -(226+-218), (27-27), bit32.bxor(183,0xAB))})
 _IllIllI.MouseButton1Click:Connect(function()
 _llII(_I1lI.ProfileUrl)
 _l1lIll.Text = "\76\105\110\107\32\100\101\108\32\112\101\114\102\105\108\32\99\111\112\105\97\100\111"
 _IllIllI.Text = "\67\111\112\105\97\100\111\33"
 task.delay(1.2, function()
 if _IllIllI and _IllIllI.Parent then _IllIllI.Text = "\67\111\112\105\97\114\32\108\105\110\107" end
 end)
 end)
 addShineHover(_llIllI)
 addShineHover(_IlIllI)
 addShineHover(_IllIllI)
 if _I1lI.PresenceType == (122+-120) and _I1lI.PresencePlace and _I1lI.PresenceGame then
 _llIllI.Size = UDim2.new(0.25, -(497-489), _P199x._8x6q(0/143), bit32.bxor(183,0xAB))
 _IlIllI.Size = UDim2.new(0.25, -_P199x._8x6q(1408/176), (386-386), bit32.bxor(183,0xAB))
 _IllIllI.Size = UDim2.new(0.25, -(117-109), _P199x._8x6q(0/6), bit32.bxor(183,0xAB))
 local _lIlIllI = _llI.makeButton(_IIlIIllI, "\85\110\105\114\115\101", "\112\114\105\109\97\114\121", {_IIIl = _P199x._8x6q(272/68), _I1Ill1 = UDim2.new(0.25, -_P199x._8x6q(16/2), (87-87), _P199x._8x6q(3780/135))})
 _lIlIllI.BackgroundColor3 = C.good
 themed(_lIlIllI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\103\111\111\100")
 _lIlIllI.MouseButton1Click:Connect(function()
 _l1lIll.Text = "\73\110\116\101\110\116\97\110\100\111\32\117\110\105\114\115\101\46\46\46"
 local _IIlIllI = game:GetService("\84\101\108\101\112\111\114\116\83\101\114\118\105\99\101")
 local _l1 = pcall(function()
 _IIlIllI:TeleportToPlaceInstance(_I1lI.PresencePlace, _I1lI.PresenceGame, _l)
 end)
 if not _l1 then
 _l1lIll.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\115\101\114\118\105\100\111\114\32\108\108\101\110\111\44\32\112\114\105\118\97\100\111\32\111\32\115\105\110\32\97\99\99\101\115\111\41\46"
 end
 end)
 end
 local _l1lIllI = Instance.new("\70\114\97\109\101", _llIIllI)
 _l1lIllI.Name = "\78\88\84\97\103"
 _l1lIllI.LayoutOrder = (1+14)
 _l1lIllI.Size = UDim2.new((355-355), bit32.bxor(171,0xAB), (253-253), _P199x._8x6q(288/12))
 _l1lIllI.AutomaticSize = Enum.AutomaticSize.X
 _l1lIllI.BackgroundColor3 = C.elevated
 _l1lIllI.BackgroundTransparency = _P199x._8x6q(125/125)
 _l1lIllI.BorderSizePixel = (24+-24)
 _l1lIllI.Visible = false
 Instance.new("\85\73\67\111\114\110\101\114", _l1lIllI).CornerRadius = UDim.new((117-117), (405-393))
 themed(_l1lIllI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\101\108\101\118\97\116\101\100")
 local _I1lIllI = Instance.new("\85\73\83\116\114\111\107\101", _l1lIllI)
 _I1lIllI.Thickness = bit32.bxor(170,0xAB); _I1lIllI.Transparency = (62+-61)
 local _llllIllI = Instance.new("\85\73\80\97\100\100\105\110\103", _l1lIllI)
 _llllIllI.PaddingLeft = UDim.new((289+-289), _P199x._8x6q(1100/110)); _llllIllI.PaddingRight = UDim.new(_P199x._8x6q(0/174), bit32.bxor(161,0xAB))
 local _IIllIllI = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _l1lIllI)
 _IIllIllI.FillDirection = Enum.FillDirection.Horizontal
 _IIllIllI.VerticalAlignment = Enum.VerticalAlignment.Center
 _IIllIllI.HorizontalAlignment = Enum.HorizontalAlignment.Left
 _IIllIllI.SortOrder = Enum.SortOrder.LayoutOrder
 _IIllIllI.Padding = UDim.new(_P199x._8x6q(0/150), bit32.bxor(173,0xAB))
 local _lIllIllI = Instance.new("\73\109\97\103\101\76\97\98\101\108", _l1lIllI)
 _lIllIllI.Name = "\78\88\73\99\111\110"
 _lIllIllI.BackgroundTransparency = _P199x._8x6q(71/71)
 _lIllIllI.Size = UDim2.fromOffset(_P199x._8x6q(1616/101), _P199x._8x6q(1072/67))
 _lIllIllI.LayoutOrder = (119-118)
 _lIllIllI.Visible = false
 local _llII = Instance.new("\84\101\120\116\76\97\98\101\108", _l1lIllI)
 _llII.LayoutOrder = (207+-205)
 _llII.AutomaticSize = Enum.AutomaticSize.X
 _llII.Size = UDim2.new((158+-158), _P199x._8x6q(0/42), bit32.bxor(170,0xAB), (317-317))
 _llII.BackgroundTransparency = _P199x._8x6q(98/98)
 _llII.Font = Enum.Font.GothamBold
 _llII.TextSize = _llI._lIl.sm
 _llII.TextColor3 = C._lIl
 _llII.Text = ""
 do
 local _IlII = _I1lI.UserId
 local function applyTag(t)
 if not t or not _l1lIllI.Parent then return end
 if _IllllIl == nil or _IllllIl.UserId ~= _IlII then return end
 local _lllII  = _G.NXV2 and _G.NXV2.image
 local _lllll = t._IIlII1 and _lllII and _lllII.normalize(t._IIlII1)
 if _lllll and _lllII.usable(_lllll) then
 _lIllIllI.Image = _lllll; _lIllIllI.Visible = true
 _llII.Text = t._IllII1
 _lllII.preload(_lllll)
 task.spawn(function()
 local n = (263-263)
 while n < _P199x._8x6q(3250/65) and _lllII.usable(_lllll) and not _lIllIllI.IsLoaded do task.wait(0.1); n = n + _P199x._8x6q(167/167) end
 if (not _lllII.usable(_lllll)) and _IllllIl and _IllllIl.UserId == _IlII then
 _lIllIllI.Visible = false
 _llII.Text = ((t._Illll ~= "" and (t._Illll .. "\32")) or "") .. t._IllII1
 end
 end)
 else
 _lIllIllI.Visible = false
 _llII.Text = ((t._Illll ~= "" and (t._Illll .. "\32")) or "") .. t._IllII1
 end
 _llII.TextColor3 = t._IIlI
 _I1lIllI.Color = t._IIlI
 _I1lIllI.Transparency = 0.3
 _l1lIllI.BackgroundTransparency = 0.1
 _l1lIllI.Visible = true
 end
 local _IIll1lI = getNXTag(_I1lI.UserId)
 if _IIll1lI then
 applyTag(_IIll1lI)
 else
 local function reintentar()
 if _IllllIl == nil or _IllllIl.UserId ~= _IlII then return end
 if not _l1lIllI.Parent then return end
 applyTag(getNXTag(_IlII))
 end
 _G.NXTagKit.alCargarLegacy(reintentar)
 if _G.NXV2 and _G.NXV2.onReady then _G.NXV2.onReady(reintentar) end
 end
 end
 local _IllII = _llI.makeCard(_IlI1ll, {_IIIl = _P199x._8x6q(119/119), _I1llll = "\73\100\101\110\116\105\100\97\100"})
 _llI.makeDataRow(_IllII, "\85\115\101\114\110\97\109\101", _I1lI.Username, {_IIIl = _P199x._8x6q(82/82), _IIIlIl = true})
 _llI.makeDataRow(_IllII, "\68\105\115\112\108\97\121\32\78\97\109\101", _I1lI.DisplayName, {_IIIl = (20-18)})
 _llI.makeDataRow(_IllII, "\85\115\101\114\73\100", _P199x._yp3z(_I1lI.UserId), {_IIIl = bit32.bxor(168,0xAB), _IIIlIl = true})
 _llI.makeDataRow(_IllII, "\83\117\115\99\114\105\112\99\105\243\110", _I1lI.Subscription or "\8212", {_IIIl = _P199x._8x6q(620/155)})
 _llI.makeDataRow(_IllII, "\66\97\110\101\97\100\111", _I1lI.Banned or "\78\111",
 {_IIIl = _P199x._8x6q(410/82), _l1IlIl = (_I1lI.Banned == "\83\237") and C.bad or nil})
 _llI.makeDataRow(_IllII, "\67\114\101\97\99\105\243\110", _I1lI.Created or "\8212", {_IIIl = (490-484)})
 _llI.makeDataRow(_IllII, "\69\100\97\100\32\100\101\32\99\117\101\110\116\97", _I1lI.AccountAge or "\8212", {_IIIl = (247+-240)})
 local _lIlII = Instance.new("\70\114\97\109\101", _IllII)
 _lIlII.LayoutOrder = (141+-133)
 _lIlII.Size = UDim2.new(bit32.bxor(170,0xAB), (364-364), (58-58), _P199x._8x6q(532/19))
 _lIlII.BackgroundTransparency = _P199x._8x6q(114/114)
 local _IIlII = Instance.new("\84\101\120\116\66\111\120", _lIlII)
 _IIlII.Size = UDim2.new(bit32.bxor(170,0xAB), (249-249), (182-181), bit32.bxor(171,0xAB))
 _IIlII.BackgroundColor3 = C.link
 _IIlII.BackgroundTransparency = 0.5
 _IIlII.Font = Enum.Font.Code
 _IIlII.TextSize = bit32.bxor(160,0xAB)
 _IIlII.TextColor3 = C._IlIll1
 _IIlII.Text = _I1lI.ProfileUrl
 _IIlII.ClearTextOnFocus = false
 _IIlII.TextEditable = false
 _IIlII.TextXAlignment = Enum.TextXAlignment.Left
 _IIlII.TextTruncate = Enum.TextTruncate.AtEnd
 _IIlII.BorderSizePixel = (171-171)
 themed(_IIlII, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\108\105\110\107")
 themed(_IIlII, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _IIlII).CornerRadius = _llI.corner.sm
 local _l1lII = Instance.new("\85\73\80\97\100\100\105\110\103", _IIlII)
 _l1lII.PaddingLeft = UDim.new((333-333), (19+-11)); _l1lII.PaddingRight = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(1568/196))
 addDescription(_IlI1ll, _I1lI.Description).LayoutOrder = (145+-143)
 local _I1lII = _llI.makeCard(_IlI1ll, {_IIIl = (74-59), _I1llll = "\72\105\115\116\111\114\105\97\108\32\100\101\32\110\111\109\98\114\101\115"})
 _I1lII.Name = "\78\97\109\101\72\105\115\116\111\114\121"
 local _llllII = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lII)
 _llllII.LayoutOrder = (97+-92)
 _llllII.Size = UDim2.new(_P199x._8x6q(201/201), (259-259), _P199x._8x6q(0/95), (422-404))
 _llllII.BackgroundTransparency = (473-472)
 _llllII.Font = Enum.Font.Gotham
 _llllII.TextSize = _llI._lIl.sm
 _llllII.TextColor3 = C.subtext
 _llllII.Text = "\67\97\114\103\97\110\100\111\46\46\46"
 _llllII.TextXAlignment = Enum.TextXAlignment.Left
 themed(_llllII, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _IIllII = _I1lI.UserId
 local function conNombres(_llll1ll)
 if _I1lI._namesCached ~= nil then
 _llll1ll(_I1lI._namesCached or nil, _I1lI._namesHasMore or false)
 return
 end
 local _lIllII
 pcall(function()
 if _G.NXPlus and _P199x._iy38(_G.NXPlus.nombres) == "\102\117\110\99\116\105\111\110" then
 _lIllII = _G.NXPlus.nombres
 end
 end)
 if _lIllII then _lIllII(_I1lI, _llll1ll); return end
 task.spawn(function()
 local _lIII, _I1I1I = getNameHistory(_I1lI.UserId)
 _I1lI._namesCached = _lIII or false
 _I1lI._namesHasMore = _I1I1I or false
 _llll1ll(_lIII, _I1I1I)
 end)
 end
 conNombres(function(_lIII, _I1I1I)
 if _IllllIl == nil or _IllllIl.UserId ~= _IIllII then return end
 if not _I1lII.Parent then return end
 if _llllII and _llllII.Parent then _llllII:Destroy() end
 if not _lIII then
 local _IlllIl = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lII)
 _IlllIl.LayoutOrder = bit32.bxor(161,0xAB)
 _IlllIl.Size = UDim2.new(bit32.bxor(170,0xAB), (79+-79), _P199x._8x6q(0/11), bit32.bxor(185,0xAB))
 _IlllIl.BackgroundTransparency = (386-385)
 _IlllIl.Font = Enum.Font.Gotham
 _IlllIl.TextSize = _llI._lIl.sm
 _IlllIl.TextColor3 = C.bad
 _IlllIl.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46"
 _IlllIl.TextXAlignment = Enum.TextXAlignment.Left
 return
 end
 local _IIII = Instance.new("\70\114\97\109\101", _I1lII)
 _IIII.LayoutOrder = (42+-32)
 _IIII.Size = UDim2.new((166-165), bit32.bxor(171,0xAB), (188+-188), _P199x._8x6q(3168/132))
 _IIII.BackgroundColor3 = C._IlIll1
 _IIII.BackgroundTransparency = 0.85
 _IIII.BorderSizePixel = _P199x._8x6q(0/69)
 _IIII.ClipsDescendants = true
 Instance.new("\85\73\67\111\114\110\101\114", _IIII).CornerRadius = _llI.corner.sm
 local _llIII = Instance.new("\84\101\120\116\76\97\98\101\108", _IIII)
 _llIII.Size = UDim2.new((285+-284), -_P199x._8x6q(1710/171), (10-9), _P199x._8x6q(0/31))
 _llIII.Position = UDim2.new(bit32.bxor(171,0xAB), bit32.bxor(174,0xAB), _P199x._8x6q(0/189), (8+-8))
 _llIII.BackgroundTransparency = (197+-196)
 _llIII.Font = Enum.Font.GothamBold
 _llIII.TextSize = _llI._lIl.md
 _llIII.TextColor3 = C._lIl
 _llIII.Text = "\65\99\116\117\97\108\58\32" .. _I1lI.Username
 _llIII.TextXAlignment = Enum.TextXAlignment.Left
 _llIII.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_llIII, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 if #_lIII > bit32.bxor(171,0xAB) then
 local _IlIII = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lII)
 _IlIII.LayoutOrder = (2+9)
do local _k7kj=type(nil);if _m7k5~="nil"then error("")end end
 _IlIII.Size = UDim2.new(bit32.bxor(170,0xAB), (370-370), _P199x._8x6q(0/50), (178+-160))
 _IlIII.BackgroundTransparency = _P199x._8x6q(133/133)
 _IlIII.Font = Enum.Font.Gotham
 _IlIII.TextSize = _llI._lIl.sm
 _IlIII.TextColor3 = C.subtext
 _IlIII.Text = "\78\111\109\98\114\101\115\32\97\110\116\101\114\105\111\114\101\115\32\40" .. #_lIII .. "\41\58"
 _IlIII.TextXAlignment = Enum.TextXAlignment.Left
 themed(_IlIII, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 for i, _lll in ipairs(_lIII) do
 local _lIl = Instance.new("\70\114\97\109\101", _I1lII)
 _lIl.LayoutOrder = (271-260) + i
 _lIl.Size = UDim2.new(_P199x._8x6q(187/187), bit32.bxor(171,0xAB), _P199x._8x6q(0/39), (255+-237))
 _lIl.BackgroundTransparency = (310-309)
 _lIl.ClipsDescendants = true
 local _lIIII = Instance.new("\84\101\120\116\76\97\98\101\108", _lIl)
 _lIIII.Size = UDim2.new(bit32.bxor(170,0xAB), -bit32.bxor(161,0xAB), bit32.bxor(170,0xAB), _P199x._8x6q(0/154))
 _lIIII.Position = UDim2.new(bit32.bxor(171,0xAB), (138+-133), bit32.bxor(171,0xAB), (85+-85))
 _lIIII.BackgroundTransparency = (101+-100)
 _lIIII.Font = Enum.Font.Gotham
 _lIIII.TextSize = _llI._lIl.sm
 _lIIII.TextColor3 = C._lIl
 _lIIII.Text = "\8226\32" .. _lll
 _lIIII.TextXAlignment = Enum.TextXAlignment.Left
 _lIIII.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_lIIII, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 end
 if _I1I1I then
 local _IIIII = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lII)
 _IIIII.LayoutOrder = _P199x._8x6q(10300/103) + #_lIII
 _IIIII.Size = UDim2.new(_P199x._8x6q(165/165), _P199x._8x6q(0/34), (105-105), _P199x._8x6q(720/45))
 _IIIII.BackgroundTransparency = _P199x._8x6q(180/180)
 _IIIII.Font = Enum.Font.Gotham
 _IIIII.TextSize = _llI._lIl.xs
 _IIIII.TextColor3 = C.textDisabled
 _IIIII.Text = "\72\97\121\32\109\225\115\32\110\111\109\98\114\101\115\32\40\115\111\108\111\32\115\101\32\109\117\101\115\116\114\97\110\32\108\111\115\32\112\114\105\109\101\114\111\115\32\49\48\48\48\41\46"
 _IIIII.TextXAlignment = Enum.TextXAlignment.Left
 themed(_IIIII, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116\68\105\115\97\98\108\101\100")
 end
 else
 local _lllllIl = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lII)
 _lllllIl.LayoutOrder = (253+-242)
 _lllllIl.Size = UDim2.new(_P199x._8x6q(57/57), (243-243), (243+-243), _P199x._8x6q(3456/192))
 _lllllIl.BackgroundTransparency = bit32.bxor(170,0xAB)
 _lllllIl.Font = Enum.Font.Gotham
 _lllllIl.TextSize = _llI._lIl.sm
 _lllllIl.TextColor3 = C.subtext
 _lllllIl.Text = "\83\105\110\32\110\111\109\98\114\101\115\32\97\110\116\101\114\105\111\114\101\115\46"
 _lllllIl.TextXAlignment = Enum.TextXAlignment.Left
 themed(_lllllIl, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 end)
 local _l1III = _llI.makeCard(_III1ll, {_IIIl = (22+-22), _I1llll = "\69\115\116\97\100\237\115\116\105\99\97\115"})
 _llI.makeDataRow(_l1III, "\65\109\105\103\111\115", _P199x._yp3z(_I1lI.Friends or "\8212"), {_IIIl = (439-438)})
 addFriendsDropdown(_III1ll, _I1lI, bit32.bxor(174,0xAB))
 _llI.makeDataRow(_l1III, "\83\101\103\117\105\100\111\114\101\115", _P199x._yp3z(_I1lI.Followers or "\8212"), {_IIIl = _P199x._8x6q(126/63)})
 _llI.makeDataRow(_l1III, "\83\105\103\117\105\101\110\100\111", _P199x._yp3z(_I1lI.Following or "\8212"), {_IIIl = bit32.bxor(168,0xAB)})
 _llI.makeDataRow(_l1III, "\71\114\117\112\111\115", _P199x._yp3z(_I1lI.Groups or "\8212"), {_IIIl = (1+3)})
 _llI.makeDataRow(_l1III, "\66\97\100\103\101\115", _P199x._yp3z(_I1lI.Badges or "\8212"), {_IIIl = (19+-14)})
 _llI.makeDataRow(_l1III, "\70\97\118\111\114\105\116\111\115", _P199x._yp3z(_I1lI.Favorites or "\8212"), {_IIIl = (152+-146)})
 _llI.makeDataRow(_l1III, "\69\120\112\101\114\105\101\110\99\105\97\115\32\99\114\101\97\100\97\115", _P199x._yp3z(_I1lI.CreatedGames or "\8212"), {_IIIl = (427-420)})
 local _I1III = Instance.new("\70\114\97\109\101", _III1ll)
 _I1III.LayoutOrder = bit32.bxor(153,0xAB)
 _I1III.Size = UDim2.new((425-424), (259-259), (181+-181), (203+-171))
 _I1III.BackgroundTransparency = bit32.bxor(170,0xAB)
 local _lllIII = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _I1III)
 _lllIII.FillDirection = Enum.FillDirection.Horizontal
 _lllIII.Padding = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(696/87))
 _lllIII.SortOrder = Enum.SortOrder.LayoutOrder
 local function mkBtn(_lIl, _IIlIII)
 return _llI.makeButton(_I1III, _lIl, "\115\101\99\111\110\100\97\114\121", {_IIIl = _IIlIII})
 end
 local _IIIl = {
 {"\85\115\101\114\110\97\109\101","\85\115\101\114\110\97\109\101"},{"\68\105\115\112\108\97\121\32\78\97\109\101","\68\105\115\112\108\97\121\78\97\109\101"},{"\85\115\101\114\73\100","\85\115\101\114\73\100"},{"\76\105\110\107","\80\114\111\102\105\108\101\85\114\108"},
 {"\83\117\115\99\114\105\112\99\105\243\110","\83\117\98\115\99\114\105\112\116\105\111\110"},{"\69\115\116\97\100\111","\80\114\101\115\101\110\99\101"},{"\86\101\114\105\102\105\99\97\100\111","\86\101\114\105\102\105\101\100"},{"\66\97\110\101\97\100\111","\66\97\110\110\101\100"},
 {"\67\114\101\97\99\105\243\110","\67\114\101\97\116\101\100"},{"\69\100\97\100\32\100\101\32\99\117\101\110\116\97","\65\99\99\111\117\110\116\65\103\101"},{"\68\101\115\99\114\105\112\99\105\243\110","\68\101\115\99\114\105\112\116\105\111\110"},
 {"\65\109\105\103\111\115","\70\114\105\101\110\100\115"},{"\83\101\103\117\105\100\111\114\101\115","\70\111\108\108\111\119\101\114\115"},{"\83\105\103\117\105\101\110\100\111","\70\111\108\108\111\119\105\110\103"},
 {"\71\114\117\112\111\115","\71\114\111\117\112\115"},{"\66\97\100\103\101\115","\66\97\100\103\101\115"},{"\70\97\118\111\114\105\116\111\115","\70\97\118\111\114\105\116\101\115"},
 {"\69\120\112\101\114\105\101\110\99\105\97\115\32\99\114\101\97\100\97\115","\67\114\101\97\116\101\100\71\97\109\101\115"},
 }
 local function buildTxtLines()
 local _lllllI = {}
 for _, pair in ipairs(_IIIl) do
 _P199x._l50o(_lllllI, pair[bit32.bxor(170,0xAB)] .. "\58\32" .. _P199x._yp3z(_I1lI[pair[bit32.bxor(169,0xAB)]] == nil and "\78\111\32\100\105\115\112\111\110\105\98\108\101" or _I1lI[pair[bit32.bxor(169,0xAB)]]))
 end
 if _P199x._iy38(_I1lI._namesCached) == "\116\97\98\108\101" and #_I1lI._namesCached > _P199x._8x6q(0/167) then
 local _lIlIII = _I1lI._namesHasMore and "\32\40\121\32\109\225\115\41" or ""
 _lllllI[#_lllllI+(69+-68)] = "\78\111\109\98\114\101\115\32\97\110\116\101\114\105\111\114\101\115\58\32" .. _P199x._oy4i(_I1lI._namesCached, "\44\32") .. _lIlIII
 elseif _I1lI._namesCached == false then
 _lllllI[#_lllllI+_P199x._8x6q(33/33)] = "\78\111\109\98\114\101\115\32\97\110\116\101\114\105\111\114\101\115\58\32\110\111\32\100\105\115\112\111\110\105\98\108\101"
 else
 _lllllI[#_lllllI+(117-116)] = "\78\111\109\98\114\101\115\32\97\110\116\101\114\105\111\114\101\115\58\32\110\105\110\103\117\110\111"
 end
 return _lllllI
 end
 local function buildExportData()
 local _lIlIIl = {}
 for k, v in pairs(_I1lI) do
 if _P199x._iy38(k) ~= "\115\116\114\105\110\103" or k:_IllIlIl(_P199x._8x6q(183/183), bit32.bxor(170,0xAB)) ~= "\95" then
 _lIlIIl[k] = v
 end
 end
 _lIlIIl.NombresAnteriores = (_P199x._iy38(_I1lI._namesCached) == "\116\97\98\108\101") and _I1lI._namesCached or {}
 return _lIlIIl
 end
 local function withNames(_llllII, _IlllII)
 if _I1lI._namesCached ~= nil then
 _IlllII()
 return
 end
 _l1lIll.Text = _llllII
 local _lllII = _I1lI.UserId
 task.spawn(function()
 local _lIII, _I1I1I = getNameHistory(_I1lI.UserId)
 _I1lI._namesCached = _lIII or false
 _I1lI._namesHasMore = _I1I1I or false
 if _IllllIl and _IllllIl.UserId ~= _lllII then return end
 _IlllII()
 end)
 end
 local function flashBtn(_lIlll, _IIlIl)
 local _lIllIl = _lIlll.Text
 _lIlll.Text = _IIlIl
 task.delay(1.1, function()
 if _lIlll and _lIlll.Parent then _lIlll.Text = _lIllIl end
 end)
 end
 local _IllII = mkBtn("\67\111\112\105\97\114\32\84\88\84", (304-303))
 _IllII.MouseButton1Click:Connect(function()
 withNames("\80\114\101\112\97\114\97\110\100\111\32\84\88\84\32\40\104\105\115\116\111\114\105\97\108\32\100\101\32\110\111\109\98\114\101\115\41\46\46\46", function()
 local _l1 = pcall(function() _llII(_P199x._oy4i(buildTxtLines(), "\10")) end)
 if _l1 then
 _l1lIll.Text = "\10003\32\67\111\112\105\97\100\111\32\97\32\112\111\114\116\97\112\97\112\101\108\101\115\32\40\84\88\84\41"
 flashBtn(_IllII, "\67\111\112\105\97\100\111\32\10003")
 else
 _l1lIll.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\116\117\32\101\120\101\99\117\116\111\114\32\110\111\32\100\97\32\97\99\99\101\115\111\32\97\108\32\112\111\114\116\97\112\97\112\101\108\101\115\41\46"
 flashBtn(_IllII, "\69\114\114\111\114")
 end
 end)
 end)
 local _lIllII = mkBtn("\67\111\112\105\97\114\32\74\83\79\78", _P199x._8x6q(166/83))
 _lIllII.MouseButton1Click:Connect(function()
 withNames("\80\114\101\112\97\114\97\110\100\111\32\74\83\79\78\32\40\104\105\115\116\111\114\105\97\108\32\100\101\32\110\111\109\98\114\101\115\41\46\46\46", function()
 local _l1 = pcall(function() _llII(HttpService:JSONEncode(buildExportData())) end)
 if _l1 then
 _l1lIll.Text = "\10003\32\67\111\112\105\97\100\111\32\97\32\112\111\114\116\97\112\97\112\101\108\101\115\32\40\74\83\79\78\41"
 flashBtn(_lIllII, "\67\111\112\105\97\100\111\32\10003")
 else
 _l1lIll.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\40\116\117\32\101\120\101\99\117\116\111\114\32\110\111\32\100\97\32\97\99\99\101\115\111\32\97\108\32\112\111\114\116\97\112\97\112\101\108\101\115\41\46"
 flashBtn(_lIllII, "\69\114\114\111\114")
 end
 end)
 end)
 local _IIllII = addNoteCard(_I1I1ll, "\80\114\101\99\105\111\32\100\101\108\32\97\118\97\116\97\114", "\67\97\108\99\117\108\97\110\100\111\46\46\46", C.good)
 _IIllII.LayoutOrder = (400-399)
 local _l1llII = addNoteCard(_I1I1ll, "\73\116\101\109\115\32\101\113\117\105\112\97\100\111\115", "\67\97\114\103\97\110\100\111\46\46\46", C._IlIll1)
 _l1llII.LayoutOrder = (200-198)
 local _I1llII = addNoteCard(_I1I1ll, "\71\114\117\112\111\115", "\67\97\114\103\97\110\100\111\46\46\46", C._IlIll1)
 _I1llII.LayoutOrder = _P199x._8x6q(480/160)
 local _lllllII = addNoteCard(_I1I1ll, "\66\97\100\103\101\115\32\114\101\99\105\101\110\116\101\115", "\67\97\114\103\97\110\100\111\46\46\46", C._IlIll1)
 _lllllII.LayoutOrder = _P199x._8x6q(560/140)
 local _IIlllII = addNoteCard(_I1I1ll, "\82\65\80\32\40\118\97\108\111\114\32\108\105\109\105\116\101\100\115\41",
 "\67\111\110\115\117\108\116\97\110\100\111\32\82\111\108\105\109\111\110\39\115\32\40\119\101\98\32\101\120\116\101\114\110\97\41\46\46\46", C.warn)
 _IIlllII.LayoutOrder = (108+-103)
 local function bodyOf(_IlI)
 for _, _lIllI in ipairs(_IlI:GetChildren()) do
 if _lIllI:IsA("\84\101\120\116\76\97\98\101\108") and _lIllI.LayoutOrder == bit32.bxor(161,0xAB) then return _lIllI end
 end
 end
 local _lIlllII = _I1lI.UserId
 task.spawn(function()
 local _l1llI, _I1llI
 if _I1lI._itemsCached ~= nil then
 _l1llI = _I1lI._itemsCached or nil
 _I1llI = _I1lI._itemsTotalCached or (103-103)
 else
 _l1llI, _I1llI = getWornItems(_I1lI.UserId)
 _I1lI._itemsCached = _l1llI or false
 _I1lI._itemsTotalCached = _I1llI or bit32.bxor(171,0xAB)
 end
 if _IllllIl == nil or _IllllIl.UserId ~= _lIlllII then return end
 if not _l1llII.Parent then return end
 local b = bodyOf(_l1llII)
 local _lIlII = bodyOf(_IIllII)
 if not _l1llI then
 if b then b.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46" end
 if _lIlII then _lIlII.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46" end
 return
 end
 if #_l1llI == (369-369) then
 if b then b.Text = "\78\111\32\108\108\101\118\97\32\105\116\101\109\115\32\101\113\117\105\112\97\100\111\115\46" end
 if _lIlII then _lIlII.Text = "\48\32\82\36\32\40\115\105\110\32\105\116\101\109\115\32\99\111\110\32\112\114\101\99\105\111\41\46" end
 return
 end
 if _lIlII then
 _lIlII.Text = "\8776\32" .. _P199x._yp3z(_I1llI) .. "\32\82\36\32\101\110\32\116\111\116\97\108\10"
 .. "\40\83\117\109\97\32\100\101\108\32\112\114\101\99\105\111\32\100\101\32\99\97\116\225\108\111\103\111\32\100\101\32\108\111\32\101\113\117\105\112\97\100\111\46\32\65\112\114\111\120\105\109\97\100\111\58\32"
 .. "\108\111\115\32\105\116\101\109\115\32\103\114\97\116\105\115\32\111\32\115\105\110\32\112\114\101\99\105\111\32\99\117\101\110\116\97\110\32\99\111\109\111\32\48\46\41"
 end
 local _lIII = {}
 for _, _llIl in ipairs(_l1llI) do
 local _IIlII = (_llIl.price and _llIl.price > _P199x._8x6q(0/194)) and ("\32\8212\32" .. _llIl.price .. "\32\82\36") or ""
 _P199x._l50o(_lIII, "\8226\32" .. (_llIl._lll or ("\65\115\115\101\116\32" .. _llIl._lllI1)) .. _IIlII)
 end
 if b then b.Text = #_l1llI .. "\32\105\116\101\109\40\115\41\58\10" .. _P199x._oy4i(_lIII, "\10") end
 local _llIlII = Instance.new("\70\114\97\109\101", _l1llII)
 _llIlII.LayoutOrder = _P199x._8x6q(242/121)
 _llIlII.Size = UDim2.new((78+-77), bit32.bxor(171,0xAB), _P199x._8x6q(0/55), (170+-170))
 _llIlII.AutomaticSize = Enum.AutomaticSize.Y
 _llIlII.BackgroundTransparency = bit32.bxor(170,0xAB)
 local _IlIlII = Instance.new("\85\73\71\114\105\100\76\97\121\111\117\116", _llIlII)
 _IlIlII.CellSize = UDim2.new((132-132), (152+-96), bit32.bxor(171,0xAB), bit32.bxor(147,0xAB))
 _IlIlII.CellPadding = UDim2.new(_P199x._8x6q(0/25), (53+-47), _P199x._8x6q(0/199), (10+-4))
 for _, _llIl in ipairs(_l1llI) do
 local _lIIlII = Instance.new("\73\109\97\103\101\76\97\98\101\108", _llIlII)
 _lIIlII.Size = UDim2.new(_P199x._8x6q(0/90), _P199x._8x6q(7448/133), _P199x._8x6q(0/36), bit32.bxor(147,0xAB))
 _lIIlII.BackgroundColor3 = C.surface
 _lIIlII.BorderSizePixel = (27+-27)
 _lIIlII.Image = ("\114\98\120\116\104\117\109\98\58\47\47\116\121\112\101\61\65\115\115\101\116\38\105\100\61\37\100\38\119\61\49\53\48\38\104\61\49\53\48"):format(_llIl._lllI1)
 Instance.new("\85\73\67\111\114\110\101\114", _lIIlII).CornerRadius = UDim.new(bit32.bxor(171,0xAB), (326-320))
 end
 end)
 task.spawn(function()
 local _IlIlI
 if _I1lI._groupsCached ~= nil then
 _IlIlI = _I1lI._groupsCached or nil
 else
 _IlIlI = getGroupsDetailed(_I1lI.UserId)
 _I1lI._groupsCached = _IlIlI or false
 end
 if _IllllIl == nil or _IllllIl.UserId ~= _lIlllII then return end
 if not _I1llII.Parent then return end
 local b = bodyOf(_I1llII); if not b then return end
 if not _IlIlI then b.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46" ; return end
 local _IIIlII = bit32.bxor(171,0xAB)
 if _lIIIl.flags._I1lI then
 _IlIlI, _IIIlII = _lIIIl.valid._lIlI(_IlIlI, _lIIIl.shape.group)
 end
 if #_IlIlI == _P199x._8x6q(0/122) then
 b.Text = (_IIIlII > bit32.bxor(171,0xAB))
 and ("\83\105\110\32\103\114\117\112\111\115\32\118\225\108\105\100\111\115\32\40" .. _IIIlII .. "\32\101\110\116\114\97\100\97\40\115\41\32\100\101\115\99\97\114\116\97\100\97\40\115\41\32\112\111\114\32\100\97\116\111\115\32\99\111\114\114\117\112\116\111\115\41\46")
 or  "\78\111\32\101\115\116\225\32\101\110\32\110\105\110\103\250\110\32\103\114\117\112\111\46"
 return
 end
 local _lllllI = {}
 for _, g in ipairs(_IlIlI) do
 _P199x._l50o(_lllllI, "\8226\32" .. g._lll .. "\32\32\8212\32\32" .. g._l1I)
do local _cfgq56=1 while _cfgq56>0 do if _cfgq56==1 then
 end
 b.Text = #_IlIlI .. "\32\103\114\117\112\111\40\115\41\58\10" .. _P199x._oy4i(_lllllI, "\10")
 .. ((_IIIlII > (185-185)) and ("\10" .. _IIIlII .. "\32\101\110\116\114\97\100\97\40\115\41\32\100\101\115\99\97\114\116\97\100\97\40\115\41\32\112\111\114\32\78\88\32\83\104\105\101\108\100\115\46") or "")
 end)
_cfgq56=0 end end end
 task.spawn(function()
 local _lIIlI
 if _I1lI._badgesCached ~= nil then
 _lIIlI = _I1lI._badgesCached or nil
 else
 _lIIlI = getRecentBadges(_I1lI.UserId, (292-280))
 _I1lI._badgesCached = _lIIlI or false
 end
 if _IllllIl == nil or _IllllIl.UserId ~= _lIlllII then return end
 if not _lllllII.Parent then return end
 local b = bodyOf(_lllllII); if not b then return end
 if not _lIIlI then b.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46" ; return end
 local _IIIlII = (263+-263)
 if _lIIIl.flags._I1lI then
 _lIIlI, _IIIlII = _lIIIl.valid._lIlI(_lIIlI, _lIIIl.shape.badge)
 end
 if #_lIIlI == (18+-18) then
 b.Text = (_IIIlII > bit32.bxor(171,0xAB))
 and ("\83\105\110\32\98\97\100\103\101\115\32\118\225\108\105\100\111\115\32\40" .. _IIIlII .. "\32\100\101\115\99\97\114\116\97\100\111\40\115\41\32\112\111\114\32\100\97\116\111\115\32\99\111\114\114\117\112\116\111\115\41\46")
 or  "\83\105\110\32\98\97\100\103\101\115\32\114\101\99\105\101\110\116\101\115\46"
 return
 end
 local _lllllI = {}
 for _, _l1l1II in ipairs(_lIIlI) do _P199x._l50o(_lllllI, "\8226\32" .. _l1l1II._lll) end
 b.Text = "\218\108\116\105\109\111\115\32" .. #_lIIlI .. "\58\10" .. _P199x._oy4i(_lllllI, "\10")
 .. ((_IIIlII > (229+-229)) and ("\10" .. _IIIlII .. "\32\100\101\115\99\97\114\116\97\100\111\40\115\41\32\112\111\114\32\78\88\32\83\104\105\101\108\100\115\46") or "")
 end)
 local function withRAP(_llll1ll)
 if _I1lI._rapCached ~= nil then
 _llll1ll(_I1lI._rapCached or nil)
 return
 end
 _I1lI._rapWaiters = _I1lI._rapWaiters or {}
 _P199x._l50o(_I1lI._rapWaiters, _llll1ll)
 if _I1lI._rapInflight then return end
 _I1lI._rapInflight = true
 task.spawn(function()
 local _lIII, motivo = getRAP(_I1lI.UserId)
 _I1lI._rapMotivo = motivo
 local _lllll = _lIII and _P199x._p02a(_lIII._lIII) or nil
 if _lIIIl.flags._I1lI and _lllll ~= nil and (_lllll < (34+-34) or _lllll ~= _P199x._8x6q(_lllll)) then
 _lllll = nil
 end
 _I1lI._rapCached  = _lllll or false
 _I1lI._rapInflight = false
 local _l1IlII = _I1lI._rapWaiters or {}
 _I1lI._rapWaiters = nil
 for _, _I1I in ipairs(_l1IlII) do pcall(_I1I, _lllll) end
 end)
 end
 task.spawn(function()
 local _I1IlII
 do
 local _lllIlII, _IIlI = false, nil
 withRAP(function(v) _lllIlII, _IIlI = true, v end)
 while not _lllIlII do task.wait(0.05) end
 _I1IlII = _IIlI
 end
 if _IllllIl == nil or _IllllIl.UserId ~= _lIlllII then return end
 local b = bodyOf(_IIlllII); if not b then return end
 if not _I1IlII or _I1IlII <= (306-306) then
 local m = _I1lI._rapMotivo
 if m == "\109\111\118\105\100\97" then
 b.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\183\32\82\111\108\105\109\111\110\39\115\32\114\101\116\105\114\243\32\115\117\32\65\80\73\32\112\250\98\108\105\99\97\46"
 elseif m == "\115\105\110\95\114\101\115\112\117\101\115\116\97" then
 b.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\183\32\108\97\32\102\117\101\110\116\101\32\101\120\116\101\114\110\97\32\110\111\32\114\101\115\112\111\110\100\105\243\46"
 else
 b.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\183\32\115\105\110\32\108\105\109\105\116\101\100\115\32\111\32\115\105\110\32\118\97\108\111\114\32\112\117\98\108\105\99\97\100\111\46"
 end
 return
 end
 b.Text = "\82\65\80\32\101\115\116\105\109\97\100\111\58\32" .. _P199x._yp3z(_I1IlII) .. "\32\82\36\10\40\70\117\101\110\116\101\58\32\82\111\108\105\109\111\110\39\115\44\32\118\97\108\111\114\32\97\112\114\111\120\105\109\97\100\111\44\32\78\79\32\111\102\105\99\105\97\108\46\41"
 end)
 do
 local _lIlI = _I1lI._state or "\118\101\114\105\102\105\101\100"
 local _IIlIlII = {
 _I1IlI   = { "\68\97\116\111\115\32\118\101\114\105\102\105\99\97\100\111\115",     C.good, "\84\111\100\97\115\32\108\97\115\32\114\101\115\112\117\101\115\116\97\115\32\112\97\115\97\114\111\110\32\108\97\32\118\97\108\105\100\97\99\105\243\110\46" },
 partial    = { "\68\97\116\111\115\32\112\97\114\99\105\97\108\101\115",       C.warn, "\65\108\103\117\110\97\115\32\99\111\110\115\117\108\116\97\115\32\110\111\32\114\101\115\112\111\110\100\105\101\114\111\110\46\32\76\111\32\113\117\101\32\102\97\108\116\97\32\97\112\97\114\101\99\101\32\99\111\109\111\32\34\78\111\32\100\105\115\112\111\110\105\98\108\101\34\46" },
 incomplete = { "\68\97\116\111\115\32\105\110\99\111\109\112\108\101\116\111\115",     C.warn, "\70\97\108\116\97\110\32\99\97\109\112\111\115\32\99\108\97\118\101\32\100\101\108\32\112\101\114\102\105\108\46" },
 error      = { "\68\97\116\111\115\32\110\111\32\118\101\114\105\102\105\99\97\98\108\101\115", C.bad,  "\80\97\114\116\101\32\100\101\32\108\97\32\114\101\115\112\117\101\115\116\97\32\110\111\32\112\97\115\243\32\108\97\32\118\97\108\105\100\97\99\105\243\110\32\121\32\110\111\32\115\101\32\109\117\101\115\116\114\97\46" },
 }
 local e = _IIlIlII[_lIlI] or _IIlIlII._I1IlI
 if _lIlI ~= "\118\101\114\105\102\105\101\100" or _lIIIl.adv() then
 local _l1IIlIl = e[(204-201)]
 if _lIIIl.adv() then
 local _lIlIlII = _lIIIl.problemas(_I1lI)
 if #_lIlIlII > (420-420) then
 _l1IIlIl = _l1IIlIl .. "\10\10\68\101\116\97\108\108\101\58\10\8226\32" .. _P199x._oy4i(_lIlIlII, "\10\8226\32")
 end
 if _I1lI._timedOut then
 _l1IIlIl = _l1IIlIl .. "\10\10\65\108\103\117\110\97\32\99\111\110\115\117\108\116\97\32\115\117\112\101\114\243\32\101\108\32\116\105\101\109\112\111\32\108\237\109\105\116\101\32\100\101\32\49\53\32\115\46"
 end
 if not _lIIIl.flags._IIIl or not _lIIIl.flags._I1lI then
 local _llIII = {}
 if not _lIIIl.flags._IIIl  then _llIII[#_llIII + _P199x._8x6q(22/22)] = "\86\101\114\105\102\105\99\97\99\105\243\110\32\65\80\73" end
 if not _lIIIl.flags._I1lI then _llIII[#_llIII + (330-329)] = "\86\97\108\105\100\97\99\105\243\110\32\100\101\32\100\97\116\111\115" end
 _l1IIlIl = _l1IIlIl .. "\10\10\80\114\111\116\101\99\99\105\243\110\32\100\101\115\97\99\116\105\118\97\100\97\58\32" .. _P199x._oy4i(_llIII, "\32\183\32")
 .. "\46\32\76\111\115\32\100\97\116\111\115\32\115\101\32\109\117\101\115\116\114\97\110\32\115\105\110\32\99\97\112\97\32\100\101\32\118\101\114\105\102\105\99\97\99\105\243\110\46"
 end
 end
 addNoteCard(_IIlI1ll, e[bit32.bxor(170,0xAB)], _l1IIlIl, e[bit32.bxor(169,0xAB)]).LayoutOrder = (162-155)
 end
 end
 do
 local _IlIII = _G.NXDecoder
 if _IlIII then
 local function _lIIIl1(_lll)
 return _lll:_IllIlIl(bit32.bxor(170,0xAB), (460-459)):upper() .. _lll:_IllIlIl(_P199x._8x6q(28/14))
 end
 local function fmtOne(_IIlII)
 local _lllllI = {}
 if #_IIlII._IlIllI > (201-201) then
 _lllllI[#_lllllI + _P199x._8x6q(55/55)] = "\83\117\115\116\105\116\117\99\105\111\110\101\115\58\32" .. _P199x._oy4i(_IIlII._IlIllI, "\44\32")
 end
 if #_IIlII._Illlll == (109-109) then
 _lllllI[#_lllllI + (92-91)] = "\83\105\110\32\100\97\116\111\115\32\115\117\102\105\99\105\101\110\116\101\115\32\112\97\114\97\32\105\110\102\101\114\105\114\32\117\110\32\110\111\109\98\114\101\46"
 else
 _lllllI[#_lllllI + (213+-212)] = "\80\111\115\105\98\108\101\115\32\110\111\109\98\114\101\115\58"
 for i, c in ipairs(_IIlII._Illlll) do
 _lllllI[#_lllllI + _P199x._8x6q(12/12)] = _P199x._opmi("\32\32\37\100\46\32\37\115\32\8212\32\37\115", i, _lIIIl1(c._lll), c._llIII)
 end
 end
 if _IIlII.compound then
 _lllllI[#_lllllI + _P199x._8x6q(10/10)] = _P199x._opmi("\78\111\109\98\114\101\43\65\112\101\108\108\105\100\111\58\32\37\115\32\37\115\32\40\115\99\111\114\101\32\37\100\41",
 _lIIIl1(_IIlII.compound._IIllllI), _lIIIl1(_IIlII.compound.second), _IIlII.compound._IllI)
 end
 if _IIlII.yearGuess then
 _lllllI[#_lllllI + (243+-242)] = "\80\111\115\105\98\108\101\32\97\241\111\32\100\101\32\110\97\99\105\109\105\101\110\116\111\58\32" .. _P199x._yp3z(_IIlII.yearGuess)
 end
 return _P199x._oy4i(_lllllI, "\10")
 end
 local _IIIlI = _IlIII._lIlIll(_I1lI.Username)
 local function buildBody(_lllIII)
 local _l1IllI = { "\85\115\101\114\110\97\109\101\58\32" .. _P199x._yp3z(_I1lI.Username), fmtOne(_IIIlI) }
 if _lllIII and #_lllIII > (119-119) then
 _l1IllI[#_l1IllI + (56-55)] = "\10\78\111\109\98\114\101\115\32\112\114\101\118\105\111\115\32\40\104\105\115\116\111\114\105\97\108\41\58\10" .. _P199x._oy4i(_lllIII, "\10")
 end
 _l1IllI[#_l1IllI + (210-209)] = "\10\9888\32\69\115\32\117\110\97\32\73\78\70\69\82\69\78\67\73\65\32\115\111\98\114\101\32\116\101\120\116\111\32\112\250\98\108\105\99\111\44\32\78\79\32\117\110\97\32\105\100\101\110\116\105\100\97\100\32\99\111\110\102\105\114\109\97\100\97\46"
 return _P199x._oy4i(_l1IllI, "\10")
 end
 local _IllIII = (_IIIlI._Illlll[_P199x._8x6q(159/159)] and _IIIlI._Illlll[(113+-112)]._llIII) or "\73\110\115\117\102\105\99\105\101\110\116\101"
 local _lIlIII = (_IllIII == "\65\108\116\97") and C.good
 or ((_IllIII == "\77\101\100\105\97") and C._IlIll1 or C.subtext)
 local _IIlIII = addNoteCard(_IIlI1ll, "\9656\32\85\115\101\114\110\97\109\101\32\68\101\99\111\100\101\114", buildBody(nil), _lIlIII)
 _IIlIII.LayoutOrder = (57+-56)
 if _G.NXPlus and _P199x._iy38(_G.NXPlus.nombres) == "\102\117\110\99\116\105\111\110" then
 local _l1lIII = _I1lI.UserId
 _G.NXPlus.nombres(_I1lI, function(_l1llllI)
 if _IllllIl == nil or _IllllIl.UserId ~= _l1lIII then return end
 if not _IIlIII.Parent then return end
 local _I1lIII
 for _, _lIllI in ipairs(_IIlIII:GetChildren()) do
 if _lIllI:IsA("\84\101\120\116\76\97\98\101\108") and _lIllI.LayoutOrder == _P199x._8x6q(540/54) then _I1lIII = _lIllI end
 end
 if not _I1lIII then return end
 local _lIlIII, shown = {}, (147-147)
 for _, prevName in ipairs(_l1llllI or {}) do
 if prevName ~= _I1lI.Username and shown < _P199x._8x6q(504/84) then
 local r = _IlIII._lIlIll(prevName)
 local _llIIlIl = r._Illlll[(10+-9)]
 if _llIIlIl then
 _lIlIII[#_lIlIII + bit32.bxor(170,0xAB)] = _P199x._opmi("\8226\32\37\115\32\8594\32\37\115\32\40\37\115\41", prevName, _lIIIl1(_llIIlIl._lll), _llIIlIl._llIII)
 else
 _lIlIII[#_lIlIII + _P199x._8x6q(17/17)] = _P199x._opmi("\8226\32\37\115\32\8594\32\115\105\110\32\100\97\116\111\115", prevName)
 end
 shown = shown + (344-343)
 end
 end
 if #_lIlIII > (121+-121) then _I1lIII.Text = buildBody(_lIlIII) end
 end)
 end
 end
 end
 if _G.NXIntel then
 _G.NXIntel.buildCard(_IIlI1ll, _I1lI, (20-18))
 end
 local _llllIII, faltantes = _lIIIl.scoresFiables(_I1lI)
 if not _llllIII then
 addNoteCard(_IIlI1ll,
 "\65\110\225\108\105\115\105\115\32\110\111\32\99\97\108\99\117\108\97\98\108\101",
 "\70\97\108\116\97\110\32\100\97\116\111\115\32\113\117\101\32\115\111\110\32\112\105\108\97\114\101\115\32\100\101\108\32\109\111\100\101\108\111\58\10\8226\32"
 .. _P199x._oy4i(faltantes, "\10\8226\32")
 .. "\10\10\83\105\110\32\101\108\108\111\115\32\101\108\32\114\101\115\117\108\116\97\100\111\32\110\111\32\115\101\114\237\97\32\102\105\97\98\108\101\44\32\97\115\237\32\113\117\101\32\110\111\32\115\101\32\112\117\98\108\105\99\97\46",
 C.bad).LayoutOrder = (166+-165)
 return
 end
 local _IIllIII, _llll1I, trustColor, trustReasons = computeTrust(_I1lI)
 local _lIllIII,   _lIll1I,   altColor,   altSignals, altBreakdown = computeAltRisk(_I1lI)
 local _lIIII,   _llI1I,   actColor                 = computeActivity(_I1lI)
 local _IIIII,  _II1I,  inflColor                = computeInfluence(_I1lI, nil)
 local _llIIII = _llI.makeCard(_IIlI1ll, {_IIIl = bit32.bxor(168,0xAB), _I1llll = "\80\117\110\116\117\97\99\105\111\110\101\115"})
 addScoreBar(_llIIII, "\67\111\110\102\105\97\110\122\97", _IIllIII, _llll1I, trustColor, _P199x._8x6q(21/21))
 addScoreBar(_llIIII, "\65\99\116\105\118\105\100\97\100", _lIIII, _llI1I, actColor, _P199x._8x6q(366/183))
 local _, inflFill, inflVal = addScoreBar(_llIIII, "\73\110\102\108\117\101\110\99\105\97", _IIIII, _II1I, inflColor, (355-352))
 addScoreBar(_llIIII, "\82\105\101\115\103\111\32\65\76\84", _lIllIII, _lIll1I, altColor, _P199x._8x6q(284/71))
 local _IlIIII = Instance.new("\84\101\120\116\76\97\98\101\108", _llIIII)
 _IlIIII.LayoutOrder = _P199x._8x6q(205/41)
 _IlIIII.Size = UDim2.new(_P199x._8x6q(87/87), (309-309), (485-485), _P199x._8x6q(0/37))
 _IlIIII.AutomaticSize = Enum.AutomaticSize.Y
 _IlIIII.BackgroundTransparency = _P199x._8x6q(39/39)
 _IlIIII.Font = Enum.Font.Gotham; _IlIIII.TextSize = _P199x._8x6q(2088/174)
 _IlIIII.TextColor3 = C._lIl
 _IlIIII.TextWrapped = true
 _IlIIII.TextXAlignment = Enum.TextXAlignment.Left
 _IlIIII.TextYAlignment = Enum.TextYAlignment.Top
 _IlIIII.Text = buildSummary(_I1lI, _IIllIII, _llll1I, _lIllIII, _lIll1I, _IIIII, _II1I, _llI1I)
 themed(_IlIIII, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _lIIIII = _I1lI.UserId
 withRAP(function(_I1IlII)
 if _IllllIl == nil or _IllllIl.UserId ~= _lIIIII then return end
 if not _llIIII.Parent then return end
 if _I1IlII and _I1IlII > (245+-245) then
 local _IIIIII, nl, nc = computeInfluence(_I1lI, _I1IlII)
 inflFill.Size = UDim2.new(_P199x._5x5j(_IIIIII/_P199x._8x6q(15100/151), (72+-72), (330-329)), bit32.bxor(171,0xAB), (272+-271), (67-67))
 inflFill.BackgroundColor3 = nc
 inflVal.Text = _P199x._opmi("\37\100\47\49\48\48\32\183\32\37\115\32\40\105\110\99\108\46\32\82\65\80\41", _IIIIII, nl)
 inflVal.TextColor3 = nc
 _IlIIII.Text = buildSummary(_I1lI, _IIllIII, _llll1I, _lIllIII, _lIll1I, _IIIIII, nl, _llI1I)
 end
 end)
 if _lIIIl.adv() then
 do
 local _l1IIII = "\80\117\110\116\97\106\101\32\104\101\117\114\237\115\116\105\99\111\44\32\110\111\32\111\102\105\99\105\97\108\46\32\68\101\115\103\108\111\115\101\58\10\8226\32" .. _P199x._oy4i(trustReasons, "\10\8226\32")
 local _I1IIII = Instance.new("\70\114\97\109\101", _IIlI1ll)
 _I1IIII.LayoutOrder = (135+-131)
 _I1IIII.Size = UDim2.new((321-320), -_P199x._8x6q(536/134), bit32.bxor(171,0xAB), _P199x._8x6q(0/153))
 _I1IIII.AutomaticSize = Enum.AutomaticSize.Y
 _I1IIII.BackgroundColor3 = C._IlI
 _I1IIII.BorderSizePixel = (147+-147)
 _I1IIII.ClipsDescendants = true
 Instance.new("\85\73\67\111\114\110\101\114", _I1IIII).CornerRadius = UDim.new((365-365), bit32.bxor(163,0xAB))
 themed(_I1IIII, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
do local _pdgl=bit32.bxor(0xFF,0xFF);if _ecoc~=0 then error("")end end
 local _lllIIII = Instance.new("\85\73\83\116\114\111\107\101", _I1IIII)
 _lllIIII.Color = C._lIlI1; _lllIIII.Thickness = _P199x._8x6q(79/79); _lllIIII.Transparency = 0.5
 themed(_lllIIII, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _IIlIIII = Instance.new("\85\73\80\97\100\100\105\110\103", _I1IIII)
 _IIlIIII.PaddingTop = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(304/38)); _IIlIIII.PaddingBottom = UDim.new((252+-252), _P199x._8x6q(1104/138))
 _IIlIIII.PaddingLeft = UDim.new((18+-18), _P199x._8x6q(540/54)); _IIlIIII.PaddingRight = UDim.new((205+-205), (296+-286))
 local _lIlIIII = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _I1IIII)
 _lIlIIII.Padding = UDim.new(bit32.bxor(171,0xAB), (203-199)); _lIlIIII.SortOrder = Enum.SortOrder.LayoutOrder
 local _ll1II = Instance.new("\84\101\120\116\76\97\98\101\108", _I1IIII)
 _ll1II.LayoutOrder = (206-206); _ll1II.Size = UDim2.new((251-250), _P199x._8x6q(0/138), bit32.bxor(171,0xAB), (116+-96))
 _ll1II.BackgroundTransparency = (402-401)
 _ll1II.Font = Enum.Font.GothamBold; _ll1II.TextSize = _P199x._8x6q(2044/146)
 _ll1II.TextColor3 = trustColor
 _ll1II.Text = "\67\111\110\102\105\97\110\122\97\58\32" .. _IIllIII .. "\47\49\48\48\32\32\40" .. _llll1I .. "\41"
 _ll1II.TextXAlignment = Enum.TextXAlignment.Left
 local _Il1II = Instance.new("\84\101\120\116\66\117\116\116\111\110", _I1IIII)
 _Il1II.LayoutOrder = (2+-1); _Il1II.Size = UDim2.new((20-19), bit32.bxor(171,0xAB), _P199x._8x6q(0/178), (195+-179))
 _Il1II.BackgroundTransparency = _P199x._8x6q(152/152)
 _Il1II.Font = Enum.Font.Gotham; _Il1II.TextSize = (468-457)
 _Il1II.TextColor3 = C.subtext
 _Il1II.Text = "\68\101\116\97\108\108\101\32\9656"
 _Il1II.TextXAlignment = Enum.TextXAlignment.Left
 themed(_Il1II, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _lll1II = Instance.new("\84\101\120\116\76\97\98\101\108", _I1IIII)
 _lll1II.LayoutOrder = (220+-218); _lll1II.Size = UDim2.new((3+-2), (224+-224), (132+-132), (167-167))
 _lll1II.AutomaticSize = Enum.AutomaticSize.Y
 _lll1II.BackgroundTransparency = bit32.bxor(170,0xAB)
 _lll1II.Font = Enum.Font.Gotham; _lll1II.TextSize = (292-279)
 _lll1II.TextColor3 = C._lIl; _lll1II.TextWrapped = true
 _lll1II.TextXAlignment = Enum.TextXAlignment.Left
 _lll1II.TextYAlignment = Enum.TextYAlignment.Top
 _lll1II.Text = _l1IIII
 _lll1II.Visible = false
 themed(_lll1II, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _Ill1II = false
 _Il1II.MouseButton1Click:Connect(function()
 _Ill1II = not _Ill1II
 _lll1II.Visible = _Ill1II
 _Il1II.Text = _Ill1II and "\9662\32\79\99\117\108\116\97\114" or "\68\101\116\97\108\108\101\32\9656"
 end)
 end
 do
 local _lIl1II
 if _lIllIII >= (66-5) then
 _lIl1II = "\69\115\116\97\32\99\117\101\110\116\97\32\112\114\101\115\101\110\116\97\32\118\97\114\105\97\115\32\99\97\114\97\99\116\101\114\237\115\116\105\99\97\115\32\99\111\109\117\110\101\115\32\101\110\32\99\117\101\110\116\97\115\32"
 .. "\115\101\99\117\110\100\97\114\105\97\115\32\40\97\108\116\41\46"
 elseif _lIllIII >= (50+-9) then
 _lIl1II = "\83\101\241\97\108\101\115\32\109\105\120\116\97\115\58\32\112\111\100\114\237\97\32\115\101\114\32\117\110\32\97\108\116\32\111\32\117\110\97\32\99\117\101\110\116\97\32\110\117\101\118\97\47\112\111\99\111\32\97\99\116\105\118\97\32"
 .. "\112\101\114\111\32\108\101\103\237\116\105\109\97\46"
 else
 _lIl1II = "\76\97\32\99\117\101\110\116\97\32\78\79\32\109\117\101\115\116\114\97\32\112\97\116\114\111\110\101\115\32\116\237\112\105\99\111\115\32\100\101\32\99\117\101\110\116\97\32\115\101\99\117\110\100\97\114\105\97\46"
 end
 local _IIl1II = (#altSignals == (349-349))
 and "\70\97\99\116\111\114\101\115\32\100\101\116\101\99\116\97\100\111\115\58\10\40\110\105\110\103\117\110\111\32\114\101\108\101\118\97\110\116\101\41"
 or  ("\70\97\99\116\111\114\101\115\32\100\101\116\101\99\116\97\100\111\115\58\10\10003\32" .. _P199x._oy4i(altSignals, "\10\10003\32"))
 local _l1l1II = {}
 for _, b in ipairs(altBreakdown) do
 _l1l1II[#_l1l1II + (228+-227)] = _P199x._opmi("\8226\32\37\115\58\32\37\100\47\49\48\48\32\40\112\101\115\111\32\37\100\37\37\41", b[(458-457)], b[_P199x._8x6q(252/126)], b[_P199x._8x6q(39/13)])
 end
 local _I1l1II = _lIl1II .. "\10\10" .. _IIl1II
 .. "\10\10\68\101\115\103\108\111\115\101\32\112\111\110\100\101\114\97\100\111\32\40\114\105\101\115\103\111\32\112\111\114\32\225\114\101\97\41\58\10" .. _P199x._oy4i(_l1l1II, "\10")
 .. "\10\10\72\101\117\114\237\115\116\105\99\97\32\115\111\98\114\101\32\100\97\116\111\115\32\112\250\98\108\105\99\111\115\58\32\110\111\32\112\114\117\101\98\97\32\113\117\101\32\108\97\32\99\117\101\110\116\97\32\115\101\97\32\117\110\32\97\108\116\46"
 local _llll1II = Instance.new("\70\114\97\109\101", _IIlI1ll)
 _llll1II.LayoutOrder = (267-262)
 _llll1II.Size = UDim2.new((109-108), -_P199x._8x6q(732/183), _P199x._8x6q(0/166), bit32.bxor(171,0xAB))
 _llll1II.AutomaticSize = Enum.AutomaticSize.Y
 _llll1II.BackgroundColor3 = C._IlI
 _llll1II.BorderSizePixel = bit32.bxor(171,0xAB)
 _llll1II.ClipsDescendants = true
 Instance.new("\85\73\67\111\114\110\101\114", _llll1II).CornerRadius = UDim.new((299+-299), _P199x._8x6q(232/29))
 themed(_llll1II, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _IIll1II = Instance.new("\85\73\83\116\114\111\107\101", _llll1II)
 _IIll1II.Color = C._lIlI1; _IIll1II.Thickness = (164+-163); _IIll1II.Transparency = 0.5
 themed(_IIll1II, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _lIll1II = Instance.new("\85\73\80\97\100\100\105\110\103", _llll1II)
 _lIll1II.PaddingTop = UDim.new((362-362), (29+-21)); _lIll1II.PaddingBottom = UDim.new(bit32.bxor(171,0xAB), (86+-78))
 _lIll1II.PaddingLeft = UDim.new((116+-116), (202-192)); _lIll1II.PaddingRight = UDim.new((433-433), bit32.bxor(161,0xAB))
 local _lI1II = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _llll1II)
 _lI1II.Padding = UDim.new(_P199x._8x6q(0/91), bit32.bxor(175,0xAB)); _lI1II.SortOrder = Enum.SortOrder.LayoutOrder
 local _II1II = Instance.new("\84\101\120\116\76\97\98\101\108", _llll1II)
 _II1II.LayoutOrder = (374-374); _II1II.Size = UDim2.new(_P199x._8x6q(155/155), (391-391), _P199x._8x6q(0/129), (449-429))
 _II1II.BackgroundTransparency = (8+-7)
 _II1II.Font = Enum.Font.GothamBold; _II1II.TextSize = bit32.bxor(165,0xAB)
 _II1II.TextColor3 = altColor
 _II1II.Text = "\82\105\101\115\103\111\32\100\101\32\65\76\84\58\32" .. _lIllIII .. "\47\49\48\48\32\32\40" .. _lIll1I .. "\41"
 _II1II.TextXAlignment = Enum.TextXAlignment.Left
 local _llI1II = Instance.new("\84\101\120\116\66\117\116\116\111\110", _llll1II)
 _llI1II.LayoutOrder = (28+-27); _llI1II.Size = UDim2.new((91-90), (289-289), bit32.bxor(171,0xAB), bit32.bxor(187,0xAB))
 _llI1II.BackgroundTransparency = bit32.bxor(170,0xAB)
 _llI1II.Font = Enum.Font.Gotham; _llI1II.TextSize = _P199x._8x6q(1595/145)
 _llI1II.TextColor3 = C.subtext
 _llI1II.Text = "\68\101\116\97\108\108\101\32\9656"
 _llI1II.TextXAlignment = Enum.TextXAlignment.Left
 themed(_llI1II, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _IlI1II = Instance.new("\84\101\120\116\76\97\98\101\108", _llll1II)
 _IlI1II.LayoutOrder = _P199x._8x6q(336/168); _IlI1II.Size = UDim2.new(bit32.bxor(170,0xAB), (81+-81), (173+-173), (106-106))
 _IlI1II.AutomaticSize = Enum.AutomaticSize.Y
 _IlI1II.BackgroundTransparency = _P199x._8x6q(66/66)
 _IlI1II.Font = Enum.Font.Gotham; _IlI1II.TextSize = (155+-142)
 _IlI1II.TextColor3 = C._lIl; _IlI1II.TextWrapped = true
 _IlI1II.TextXAlignment = Enum.TextXAlignment.Left
 _IlI1II.TextYAlignment = Enum.TextYAlignment.Top
 _IlI1II.Text = _I1l1II
 _IlI1II.Visible = false
 themed(_IlI1II, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _lII1II = false
 _llI1II.MouseButton1Click:Connect(function()
 _lII1II = not _lII1II
 _IlI1II.Visible = _lII1II
 _llI1II.Text = _lII1II and "\9662\32\79\99\117\108\116\97\114" or "\68\101\116\97\108\108\101\32\9656"
 end)
 end
 end
 local _III1II = addNoteCard(_IIlI1ll,
 "\65\109\105\103\111\115\32\101\110\32\99\111\109\250\110",
 (_I1lI.UserId == _l.UserId) and "\69\115\116\225\115\32\118\105\101\110\100\111\32\116\117\32\112\114\111\112\105\97\32\99\117\101\110\116\97\46" or "\67\97\108\99\117\108\97\110\100\111\46\46\46",
 C._IlIll1)
 _III1II.LayoutOrder = _P199x._8x6q(834/139)
 if _I1lI.UserId ~= _l.UserId then
 local _IlII = _I1lI.UserId
 task.spawn(function()
 local _llllII
 if _I1lI._mutualCached ~= nil then
 _llllII = _I1lI._mutualCached or nil
 else
 _llllII = getMutualFriends(_I1lI.UserId)
 _I1lI._mutualCached = _llllII or false
 end
 if _IllllIl == nil or _IllllIl.UserId ~= _IlII then return end
 if not _III1II.Parent then return end
 local _I1lIII
 for _, _lIllI in ipairs(_III1II:GetChildren()) do
 if _lIllI:IsA("\84\101\120\116\76\97\98\101\108") and _lIllI.LayoutOrder == bit32.bxor(161,0xAB) then _I1lIII = _lIllI end
 end
 if not _I1lIII then return end
 if not _llllII then
 _I1lIII.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46"
 elseif #_llllII == bit32.bxor(171,0xAB) then
 _I1lIII.Text = "\78\111\32\116\105\101\110\101\110\32\97\109\105\103\111\115\32\101\110\32\99\111\109\250\110\46"
 else
 _I1lIII.Text = "\84\105\101\110\101\115\32" .. #_llllII .. "\32\97\109\105\103\111\40\115\41\32\101\110\32\99\111\109\250\110\58\10\8226\32"
 .. _P199x._oy4i(_llllII, "\10\8226\32")
 end
 end)
 end
 if not _IIIllI then
 staggerCards(_IlI1ll)
 staggerCards(_III1ll)
 staggerCards(_I1I1ll)
 staggerCards(_IIlI1ll)
 end
end
_II = function()
 if _IllllIl then
 pcall(render, _IllllIl, true)
 end
end
do
 local _llI = _G.NXDS
 local function titleCase(s)
 s = _P199x._yp3z(s)
 return s:_IllIlIl((84+-83), bit32.bxor(170,0xAB)):upper() .. s:_IllIlIl(_P199x._8x6q(28/14))
 end
 local _l1I1II = _llI.makeCard(_llllll, {_IIIl = bit32.bxor(170,0xAB), _I1llll = "\84\101\109\97"})
 local _I1I1II = Instance.new("\70\114\97\109\101", _l1I1II)
 _I1I1II.LayoutOrder = _P199x._8x6q(765/153)
 _I1I1II.Size = UDim2.new((109+-108), (283-283), (176+-176), (290+-290))
 _I1I1II.AutomaticSize = Enum.AutomaticSize.Y
 _I1I1II.BackgroundTransparency = _P199x._8x6q(58/58)
 local _lllI1II = Instance.new("\85\73\71\114\105\100\76\97\121\111\117\116", _I1I1II)
 _lllI1II.CellSize = UDim2.new((182-182), bit32.bxor(239,0xAB), _P199x._8x6q(0/32), (152-124))
 _lllI1II.CellPadding = UDim2.new((398-398), _P199x._8x6q(930/155), bit32.bxor(171,0xAB), (241+-235))
 _lllI1II.SortOrder = Enum.SortOrder.LayoutOrder
 _lllI1II.HorizontalAlignment = Enum.HorizontalAlignment.Left
 local _IIlI1II = Instance.new("\84\101\120\116\76\97\98\101\108", _l1I1II)
 _IIlI1II.LayoutOrder = (253+-247); _IIlI1II.Size = UDim2.new(bit32.bxor(170,0xAB), _P199x._8x6q(0/73), bit32.bxor(171,0xAB), _P199x._8x6q(588/42)); _IIlI1II.BackgroundTransparency = bit32.bxor(170,0xAB)
 _IIlI1II.Font = Enum.Font.Gotham; _IIlI1II.TextSize = _llI._lIl.xs; _IIlI1II.TextColor3 = C.subtext
 _IIlI1II.Text = "\84\101\109\97\32\97\99\116\117\97\108\58\32" .. titleCase(_Il.theme); _IIlI1II.TextXAlignment = Enum.TextXAlignment.Left
 themed(_IIlI1II, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _lIlI1II = {}
 local function paintThemeButtons(_Illll)
 for _, b in ipairs(_lIlI1II) do
 local _llllII = b:GetAttribute("\84\104\101\109\101\75\101\121")
 local _IlllII = (_Il.theme == _llllII)
 local _lllllII = _I1[_llllII]
 local _IIl1ll = _IlllII and C._IlIll1 or C.surface
 local _IllllII = _IlllII and C.onAccent or ((_lllllII and _lllllII._IlIll1) or C._lIl)
 if _Illll and _IIllIlI.enabled then
 local _lIIl = b:FindFirstChild("\95\84\104\101\109\101\83\99\97\108\101")
 if not _lIIl then _lIIl = Instance.new("\85\73\83\99\97\108\101", b); _lIIl.Name = "\95\84\104\101\109\101\83\99\97\108\101" end
 if _IlllII then
 _lIIl.Scale = 0.88
 motionTween(_lIIl, TweenInfo.new(0.38, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = (389-388) })
 else
 motionTween(_lIIl, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = (468-467) })
 end
 motionTween(b, TweenInfo.new(0.30, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
 BackgroundColor3 = _IIl1ll,
 TextColor3 = _IllllII,
 })
 else
 b.BackgroundColor3 = _IIl1ll
 b.TextColor3 = _IllllII
 end
 end
 end
 onRepaint(paintThemeButtons)
 local _lIlllII = { "\110\101\103\114\111", "\97\122\117\108", "\118\101\114\100\101", "\116\111\114", "\114\111\106\111", "\109\111\114\97\100\111", "\99\121\97\110", "\114\111\115\97", "\110\97\114\97\110\106\97", "\99\108\97\114\111" }
 for i, _llllII in ipairs(_lIlllII) do
 local _IIlllII = Instance.new("\84\101\120\116\66\117\116\116\111\110", _I1I1II)
 _IIlllII.LayoutOrder = i
 _IIlllII.BackgroundColor3 = C.surface
 _IIlllII.Text = titleCase(_llllII); _IIlllII.Font = Enum.Font.GothamMedium; _IIlllII.TextSize = _llI._lIl.sm; _IIlllII.BorderSizePixel = _P199x._8x6q(0/61)
 _IIlllII.TextTruncate = Enum.TextTruncate.AtEnd
 _IIlllII:SetAttribute("\84\104\101\109\101\75\101\121", _llllII)
 Instance.new("\85\73\67\111\114\110\101\114", _IIlllII).CornerRadius = _llI.corner.sm
 addHoverStroke(_IIlllII)
 _P199x._l50o(_lIlI1II, _IIlllII)
 _IIlllII.MouseButton1Click:Connect(function()
 setTheme(_llllII)
 _IIlI1II.Text = "\84\101\109\97\32\97\99\116\117\97\108\58\32" .. titleCase(_llllII)
 paintThemeButtons(true)
 end)
 end
 paintThemeButtons(false)
 _llI.makeToggleRow(_llllll,
 "\78\88\32\72\101\97\100\32\84\97\103\115",
 "\77\117\101\115\116\114\97\47\111\99\117\108\116\97\32\108\111\115\32\116\97\103\115\32\100\101\32\116\111\100\111\115\32\108\111\115\32\106\117\103\97\100\111\114\101\115\46\32\80\97\114\97\32\111\99\117\108\116\97\114\32\115\111\108\111\32\101\108\32\116\117\121\111\44\32\117\115\97\32\101\108\32\105\110\116\101\114\114\117\112\116\111\114\32\100\101\32\116\117\32\116\97\103\46",
 _Il.headTags ~= false, (33+-31), function(_lllIl)
 _Il.headTags = _lllIl
 saveStore()
 if _G._llII1 then
 _G._llII1.SetEnabled(_lllIl)
 end
 end)
 _llI.makeToggleRow(_llllll,
 "\65\110\105\109\97\99\105\111\110\101\115",
 "\84\114\97\110\115\105\99\105\111\110\101\115\32\121\32\101\102\101\99\116\111\115\32\100\101\32\108\97\32\105\110\116\101\114\102\97\122\32\40\121\32\101\108\32\98\114\105\108\108\111\32\100\101\32\108\111\115\32\104\101\97\100\32\116\97\103\115\41\46",
 _Il.animations ~= false, _P199x._8x6q(9/3), function(_lllIl)
 _Il.animations = _lllIl
 saveStore()
 setAnimationsEnabled(_lllIl)
 end)
 local _l1lllII = _llI.makeCard(_llllll, {_IIIl = (90+-86), _I1llll = "\78\88\32\83\104\105\101\108\100\115", subtitle = "\86\101\114\105\102\105\99\97\99\105\243\110\32\100\101\32\65\80\73\115\32\121\32\100\97\116\111\115\32\97\110\116\101\115\32\100\101\32\109\111\115\116\114\97\114\108\111\115\46"})
 local function filaProteccion(_lIllllIl, _IIIIlIl, _llllllII)
 local _I1lllII = Instance.new("\70\114\97\109\101", _l1lllII)
 _I1lllII.LayoutOrder = _lIllllIl; _I1lllII.Size = UDim2.new((276+-275), (498-498), (62+-62), (48-20)); _I1lllII.BackgroundTransparency = _P199x._8x6q(61/61)
 local _IIllllII = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lllII)
 _IIllllII.Size = UDim2.new(0.4, _P199x._8x6q(0/120), (392-391), bit32.bxor(171,0xAB))
 _IIllllII.BackgroundTransparency = (116-115)
 _IIllllII.Font = Enum.Font.GothamMedium; _IIllllII.TextSize = _llI._lIl.md; _IIllllII.TextColor3 = C._lIl
 _IIllllII.Text = _IIIIlIl; _IIllllII.TextXAlignment = Enum.TextXAlignment.Left
 _IIllllII.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_IIllllII, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _lIllllII = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lllII)
 _lIllllII.AnchorPoint = Vector2.new((439-438), 0.5)
 _lIllllII.Position = UDim2.new((192-191), -(391-345), 0.5, (377-377))
 _lIllllII.Size = UDim2.new(0.5, -bit32.bxor(133,0xAB), (486-485), (120+-120))
 _lIllllII.BackgroundTransparency = (182-181)
 _lIllllII.Font = Enum.Font.GothamBold; _lIllllII.TextSize = _llI._lIl.xs
 _lIllllII.TextXAlignment = Enum.TextXAlignment.Right
 _lIllllII.TextTruncate = Enum.TextTruncate.AtEnd
 local _IlI, setOn, setBusy
 _IlI, setOn, setBusy = _lIIIl.makeSwitch(_I1lllII, _lIIIl.flags[_llllllII], function(_lllIl)
 setBusy(true)
 _lIllllII.Text = "\118\101\114\105\102\105\99\97\110\100\111\8230"; _lIllllII.TextColor3 = C.warn
 _lIIIl.setFlag(_llllllII, _lllIl, function(_l1, _lIIlII)
 setBusy(false)
 if not _lllIl then
 _lIllllII.Text = "\68\101\115\97\99\116\105\118\97\100\111"; _lIllllII.TextColor3 = C.subtext
 elseif _l1 then
 _lIllllII.Text = "\65\99\116\105\118\111"; _lIllllII.TextColor3 = C.good
 else
 _lIllllII.Text = "\70\97\108\108\243"; _lIllllII.TextColor3 = C.bad
 _l1lIll.Text = _IIIIlIl .. "\58\32\78\111\32\100\105\115\112\111\110\105\98\108\101"
 end
 end)
 end)
 _IlI.AnchorPoint = Vector2.new(_P199x._8x6q(151/151), 0.5)
 _IlI.Position = UDim2.new(bit32.bxor(170,0xAB), _P199x._8x6q(0/164), 0.5, bit32.bxor(171,0xAB))
 local function refrescar()
 local _lllIl = _lIIIl.flags[_llllllII]
 setOn(_lllIl, false)
 if _lIIIl.busy == _llllllII then
 _lIllllII.Text = "\118\101\114\105\102\105\99\97\110\100\111\8230"; _lIllllII.TextColor3 = C.warn
 elseif not _lllIl then
 _lIllllII.Text = "\68\101\115\97\99\116\105\118\97\100\111"; _lIllllII.TextColor3 = C.subtext
 else
 local t = _lIIIl.lastTest and _lIIIl.lastTest[_llllllII]
 if t and not t._l1 then
 _lIllllII.Text = "\70\97\108\108\243"; _lIllllII.TextColor3 = C.bad
 else
 _lIllllII.Text = "\65\99\116\105\118\111"; _lIllllII.TextColor3 = C.good
 end
 end
 end
 refrescar()
 _lIIIl.onChange(refrescar)
 onRepaint(refrescar)
 end
 filaProteccion((23+-13), "\86\101\114\105\102\105\99\97\99\105\243\110\32\65\80\73",    "\97\112\105")
 filaProteccion(bit32.bxor(160,0xAB), "\86\97\108\105\100\97\99\105\243\110\32\100\101\32\100\97\116\111\115", "\100\97\116\97")
 local _IIIlII = Instance.new("\84\101\120\116\76\97\98\101\108", _l1lllII)
 _IIIlII.LayoutOrder = (239-227); _IIIlII.Size = UDim2.new(_P199x._8x6q(126/126), (146+-146), (135+-135), _P199x._8x6q(0/184))
 _IIIlII.AutomaticSize = Enum.AutomaticSize.Y
 _IIIlII.BackgroundTransparency = bit32.bxor(170,0xAB)
 _IIIlII.Font = Enum.Font.Gotham; _IIIlII.TextSize = _llI._lIl.xs; _IIIlII.TextColor3 = C.textDisabled
 _IIIlII.Text = "\65\112\97\103\97\114\108\97\115\32\110\111\32\101\115\32\99\111\115\109\233\116\105\99\111\58\32\108\111\115\32\100\97\116\111\115\32\112\97\115\97\110\32\115\105\110\32\102\105\108\116\114\97\114\32\121\32\108\111\115\32\97\110\225\108\105\115\105\115\32\100\101\106\97\110\32\100\101\32\98\108\111\113\117\101\97\114\115\101\46"
 _IIIlII.TextXAlignment = Enum.TextXAlignment.Left
 _IIIlII.TextWrapped = true
 themed(_IIIlII, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116\68\105\115\97\98\108\101\100")
end
do
 local _llI = _G.NXDS
 _llI.makeToggleRow(_llllll,
 "\77\111\100\111\32\97\118\97\110\122\97\100\111",
 "\68\101\115\103\108\111\115\101\115\32\100\101\32\112\117\110\116\117\97\99\105\111\110\101\115\32\121\32\114\101\99\111\108\101\99\99\105\243\110\32\112\114\111\102\117\110\100\97\32\101\110\32\108\97\32\112\101\115\116\97\241\97\32\72\117\101\108\108\97\46",
 _Il.advanced == true, (434-429), function(_lllIl)
 _Il.advanced = _lllIl
 saveStore()
 if _II then pcall(_II) end
 if _G.NXOSINT and _G.NXOSINT.reset then pcall(_G.NXOSINT.reset) end
 end)
end
do
 local _llI = _G.NXDS
 local _llIIlII = _llI.makeCard(_llllll, {_IIIl = (234+-228), _I1llll = "\82\101\112\97\114\97\114\32\82\80\65", subtitle = "\68\101\116\101\99\116\97\32\121\32\99\111\114\114\105\103\101\32\112\114\111\98\108\101\109\97\115\32\99\111\109\117\110\101\115\32\100\101\108\32\65\110\97\108\121\122\101\114\46"})
 local _IlIIlII = Instance.new("\84\101\120\116\76\97\98\101\108", _llIIlII)
 _IlIIlII.LayoutOrder = _P199x._8x6q(134/67)
 _IlIIlII.Size = UDim2.new((314-313), _P199x._8x6q(0/149), (125+-125), (474-474))
 _IlIIlII.AutomaticSize = Enum.AutomaticSize.Y
 _IlIIlII.BackgroundTransparency = (276-275)
 _IlIIlII.Font = Enum.Font.Gotham
 _IlIIlII.TextSize = _llI._lIl.xs
 _IlIIlII.TextColor3 = C.subtext
 _IlIIlII.Text = ""
 _IlIIlII.TextWrapped = true
 _IlIIlII.TextXAlignment = Enum.TextXAlignment.Left
 _IlIIlII.Visible = false
 themed(_IlIIlII, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _lIIIlII = _llI.makeButton(_llIIlII, "\82\101\112\97\114\97\114\32\82\80\65", "\112\114\105\109\97\114\121", {_IIIl = _P199x._8x6q(14/14), _I1Ill1 = UDim2.new(_P199x._8x6q(87/87), _P199x._8x6q(0/152), (227+-227), bit32.bxor(139,0xAB))})
 local _IIIIlII = false
 _lIIIlII.MouseButton1Click:Connect(function()
 if _IIIIlII then return end
 _IIIIlII = true
 _IlIIlII.Visible = true
 _IlIIlII.TextColor3 = C.warn
 _lIIIlII.Text = "\82\101\112\97\114\97\110\100\111\8230"
 local _l1IIlII
 if _IIllIlI.enabled then
 local _lIIl = _lIIIlII:FindFirstChildOfClass("\85\73\83\99\97\108\101")
 if _lIIl then
 _l1IIlII = TweenService:Create(_lIIl,
 TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -_P199x._8x6q(52/52), true),
 { Scale = 0.97 })
 _l1IIlII:Play()
 end
 end
 local _I1IIlII = {}
 local _lllIIlII = (168+-168)
 task.defer(function()
 local _IIlIIlII = #_IIl
 local n = (217-217)
 for i = _P199x._8x6q(12/12), #_IIl do
 local e = _IIl[i]
 if e._lII then n = n + _P199x._8x6q(164/164); _IIl[n] = e end
 end
 for i = #_IIl, n + (349-348), -(107+-106) do _IIl[i] = nil end
 local _lIlIIlII = _IIlIIlII - #_IIl
 if _lIlIIlII > _P199x._8x6q(0/65) then
 _lllIIlII = _lllIIlII + bit32.bxor(170,0xAB)
do local _cf19iq=1 while _cf19iq>0 do if _cf19iq==1 then
 _I1IIlII[#_I1IIlII + (297+-296)] = "\10003\32\114\111\108\101\77\97\112\58\32" .. _lIlIIlII .. "\32\101\110\116\114\97\100\97\115\32\109\117\101\114\116\97\115\32\101\108\105\109\105\110\97\100\97\115"
 end
 _IlIIlII.Text = "\86\101\114\105\102\105\99\97\110\100\111\32\116\119\101\101\110\115\8230"
_cf19iq=0 end end end
 task.wait()
 local _llIlII = #_IIllIlI.infinites
 local _IlIlII = bit32.bxor(171,0xAB)
 for i = _llIlII, (205-204), -(88-87) do
 local _lIllIlI = _IIllIlI.infinites[i]
 local _lII = nil
 pcall(function() _lII = _lIllIlI.Instance end)
 if not _lII or not _lII.Parent then
 pcall(function() _lIllIlI:Cancel() end)
 _P199x._otn1(_IIllIlI.infinites, i)
 _IlIlII = _IlIlII + (237+-236)
 end
 end
 if _IlIlII > (88+-88) then
 _lllIIlII = _lllIIlII + bit32.bxor(170,0xAB)
 _I1IIlII[#_I1IIlII + bit32.bxor(170,0xAB)] = "\10003\32\84\119\101\101\110\115\58\32" .. _IlIlII .. "\32\116\119\101\101\110\115\32\104\117\233\114\102\97\110\111\115\32\99\97\110\99\101\108\97\100\111\115"
 end
 _IlIIlII.Text = "\86\101\114\105\102\105\99\97\110\100\111\32\99\111\110\101\120\105\111\110\101\115\8230"
 task.wait()
 local _lllIlII = #_IlIlI
 local _IllIlII = bit32.bxor(171,0xAB)
 for i = _lllIlII, (66-65), -(327-326) do
 local c = _IlIlI[i]
 local _lIlIlII = true
 pcall(function() _lIlIlII = c.Connected end)
 if not _lIlIlII then
 _P199x._otn1(_IlIlI, i)
 _IllIlII = _IllIlII + _P199x._8x6q(147/147)
 end
 end
 if _IllIlII > (287+-287) then
 _lllIIlII = _lllIIlII + _P199x._8x6q(57/57)
 _I1IIlII[#_I1IIlII + _P199x._8x6q(5/5)] = "\10003\32\67\111\110\101\120\105\111\110\101\115\58\32" .. _IllIlII .. "\32\100\101\115\99\111\110\101\99\116\97\100\97\115\32\101\108\105\109\105\110\97\100\97\115"
 end
 _IlIIlII.Text = "\86\101\114\105\102\105\99\97\110\100\111\32\115\116\111\114\101\8230"
 task.wait()
 local _IIlIlII = { theme = "\116\111\114", headTags = true, animations = true, ownTag = true, introEnabled = true, introSeen = false, advanced = false }
 local _l1lIlII = (157-157)
 for k, v in pairs(_IIlIlII) do
 if _Il[k] == nil then
 _Il[k] = v
 _l1lIlII = _l1lIlII + _P199x._8x6q(14/14)
 end
 end
 if _P199x._iy38(_Il.theme) ~= "\115\116\114\105\110\103" or not _I1[_Il.theme] then
 _Il.theme = "\116\111\114"
 _l1lIlII = _l1lIlII + _P199x._8x6q(95/95)
 end
 if _l1lIlII > (58+-58) then
 _lllIIlII = _lllIIlII + _P199x._8x6q(34/34)
 _I1IIlII[#_I1IIlII + _P199x._8x6q(133/133)] = "\10003\32\83\116\111\114\101\58\32" .. _l1lIlII .. "\32\99\97\109\112\111\115\32\114\101\112\97\114\97\100\111\115"
 saveStore()
 end
 _IlIIlII.Text = "\83\105\110\99\114\111\110\105\122\97\110\100\111\32\85\73\8230"
 task.wait()
 pcall(function() syncTabIndicator(false) end)
 pcall(paintTabs, false)
 pcall(repaint)
 if _IllllIl then
 _lllIIlII = _lllIIlII + _P199x._8x6q(89/89)
 _I1IIlII[#_I1IIlII + bit32.bxor(170,0xAB)] = "\10003\32\80\101\114\102\105\108\32\114\101\45\114\101\110\100\101\114\105\122\97\100\111"
 pcall(render, _IllllIl, true)
 end
 local _I1lIlII = (58-58)
 pcall(function()
 for _, _lIllI in ipairs(_I:GetChildren()) do
 if _lIllI ~= _lllIlI and _lIllI:IsA("\83\99\114\101\101\110\71\117\105") and _lIllI.Name == "\85\116\105\108\105\116\121\80\97\110\101\108" then
 _lIllI:Destroy()
 _I1lIlII = _I1lIlII + bit32.bxor(170,0xAB)
 end
 end
 end)
 if _I1lIlII > (76-76) then
 _lllIIlII = _lllIIlII + bit32.bxor(170,0xAB)
 _I1IIlII[#_I1IIlII + (64+-63)] = "\10003\32\71\85\73\115\32\104\117\233\114\102\97\110\97\115\58\32" .. _I1lIlII .. "\32\101\108\105\109\105\110\97\100\97\115"
 end
 if _l1IIlII then pcall(function() _l1IIlII:Cancel() end) end
 local _lIIl = _lIIIlII:FindFirstChildOfClass("\85\73\83\99\97\108\101")
 if _lIIl then _lIIl.Scale = _P199x._8x6q(85/85) end
 if _lllIIlII == (448-448) then
 _I1IIlII[#_I1IIlII + _P199x._8x6q(57/57)] = "\83\105\110\32\112\114\111\98\108\101\109\97\115\32\100\101\116\101\99\116\97\100\111\115\46"
 _IlIIlII.TextColor3 = C.good
 _lIIIlII.Text = "\84\111\100\111\32\101\110\32\111\114\100\101\110"
 else
 _IlIIlII.TextColor3 = C.good
 _lIIIlII.Text = _lllIIlII .. "\32\114\101\112\97\114\97\99\105\243\110" .. (_lllIIlII > _P199x._8x6q(162/162) and "\101\115" or "") .. "\32\97\112\108\105\99\97\100\97" .. (_lllIIlII > bit32.bxor(170,0xAB) and "\115" or "")
 end
 _IlIIlII.Text = _P199x._oy4i(_I1IIlII, "\10")
 if _IIllIlI.enabled then
 motionTween(_lIIIlII, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { BackgroundColor3 = C.good })
 task.delay(2.5, function()
 if _lIIIlII and _lIIIlII.Parent then
 motionTween(_lIIIlII, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { BackgroundColor3 = C._IlIll1 })
 _lIIIlII.Text = "\82\101\112\97\114\97\114\32\82\80\65"
 _IIIIlII = false
 end
 end)
 else
 _lIIIlII.BackgroundColor3 = C._IlIll1
 _lIIIlII.Text = "\82\101\112\97\114\97\114\32\82\80\65"
 _IIIIlII = false
 end
 end)
 end)
end
do if false then local _e84t=game:GetService("Players");end end
local function buildAdminPanel()
 local d = _IIlll.getData()
 local _llllIlII = Instance.new("\70\114\97\109\101", _IIllIll)
 _llllIlII.Size                = UDim2.new((266-265), _P199x._8x6q(0/15), (237-236), (87-87))
 _llllIlII.BackgroundTransparency = (255-254)
 _llllIlII.Visible             = false
 createTab("\65\100\109\105\110", _llllIlII)
 local _IIllIlII = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _llllIlII)
 _IIllIlII.Size                  = UDim2.new((364-363), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB), (108-80))
 _IIllIlII.BackgroundTransparency = _P199x._8x6q(7/7)
 _IIllIlII.BorderSizePixel       = bit32.bxor(171,0xAB)
 _IIllIlII.ScrollBarThickness    = (47+-45)
 _IIllIlII.ScrollBarImageColor3  = C._IlIll1
 _IIllIlII.ScrollingDirection    = Enum.ScrollingDirection.X
 _IIllIlII.CanvasSize            = UDim2.new(_P199x._8x6q(0/197), _P199x._8x6q(0/51), bit32.bxor(171,0xAB), _P199x._8x6q(0/174))
 _IIllIlII.AutomaticCanvasSize   = Enum.AutomaticSize.X
 themed(_IIllIlII, "\83\99\114\111\108\108\66\97\114\73\109\97\103\101\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _lIllIlII = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _IIllIlII)
 _lIllIlII.FillDirection = Enum.FillDirection.Horizontal
 _lIllIlII.Padding       = UDim.new(_P199x._8x6q(0/124), bit32.bxor(174,0xAB))
 _lIllIlII.SortOrder     = Enum.SortOrder.LayoutOrder
 local _lll1 = Instance.new("\70\114\97\109\101", _llllIlII)
 _lll1.Size                = UDim2.new((179-178), (84+-84), (200+-199), -(71-37))
 _lll1.Position            = UDim2.new((37-37), (71+-71), bit32.bxor(171,0xAB), _P199x._8x6q(6596/194))
 _lll1.BackgroundTransparency = (5-4)
 local _Ill1   = {}
 local _llll1    = {}
 local _Illl1  = nil
 local function showSub(_lllI1)
 for k, _IIll1 in pairs(_Ill1) do _IIll1.Visible = (k == _lllI1) end
 _Illl1 = _lllI1
 for k, b in pairs(_llll1) do
 b.BackgroundColor3 = (k == _lllI1) and C._IlIll1 or C.surface
 b.TextColor3       = (k == _lllI1) and C.onAccent or C.subtext
 end
 end
 local _lIll1 = {
 { _lllI1 = "\100\97\115\104\98\111\97\114\100", _Illl = "\68\97\115\104\98\111\97\114\100"  },
 { _lllI1 = "\108\105\99\101\110\115\101\115",  _Illl = "\76\105\99\101\110\99\105\97\115"  },
 { _lllI1 = "\119\97\114\110\105\110\103\115",  _Illl = "\65\118\105\115\111\115"      },
 { _lllI1 = "\116\97\103\115",      _Illl = "\84\97\103\115"         },
 { _lllI1 = "\112\101\114\109\115",     _Illl = "\80\101\114\109\105\115\111\115"     },
 }
 for i, sec in ipairs(_lIll1) do
 local _lIlll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _IIllIlII)
 _lIlll.Size             = UDim2.new((34-34), bit32.bxor(255,0xAB), (129+-129), (100+-76))
 _lIlll.LayoutOrder      = i
 _lIlll.BackgroundColor3 = C.surface
 _lIlll.Text             = sec._Illl
 _lIlll.Font             = Enum.Font.GothamMedium
 _lIlll.TextSize         = bit32.bxor(167,0xAB)
 _lIlll.TextColor3       = C.subtext
 _lIlll.BorderSizePixel  = (66+-66)
 _lIlll.AutoButtonColor  = false
 Instance.new("\85\73\67\111\114\110\101\114", _lIlll).CornerRadius = UDim.new(_P199x._8x6q(0/124), (263-257))
 _llll1[sec._lllI1] = _lIlll
 _lIlll.MouseButton1Click:Connect(function() showSub(sec._lllI1) end)
 local _IIll1 = Instance.new("\70\114\97\109\101", _lll1)
 _IIll1.Size                = UDim2.new((48+-47), (115+-115), _P199x._8x6q(16/16), (199-199))
 _IIll1.BackgroundTransparency = (47-46)
 _IIll1.Visible             = false
 _Ill1[sec._lllI1] = _IIll1
 end
 onRepaint(function()
 for k, b in pairs(_llll1) do
 b.BackgroundColor3 = (k == _Illl1) and C._IlIll1 or C.surface
 b.TextColor3       = (k == _Illl1) and C.onAccent or C.subtext
 end
 end)
 local function aScroll(_lllI)
 local _lI1ll = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _lllI)
 _lI1ll.Size                  = UDim2.new(_P199x._8x6q(107/107), bit32.bxor(171,0xAB), (87-86), (172-172))
 _lI1ll.BackgroundTransparency = (279+-278)
 _lI1ll.BorderSizePixel       = (164+-164)
 _lI1ll.ScrollBarThickness    = bit32.bxor(175,0xAB)
 _lI1ll.ScrollBarImageColor3  = C._IlIll1
 _lI1ll.CanvasSize            = UDim2.new(_P199x._8x6q(0/146), (180+-180), _P199x._8x6q(0/162), (218-218))
 _lI1ll.AutomaticCanvasSize   = Enum.AutomaticSize.Y
 _lI1ll.ClipsDescendants      = true
 themed(_lI1ll, "\83\99\114\111\108\108\66\97\114\73\109\97\103\101\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _l1ll1 = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _lI1ll)
 _l1ll1.Padding = UDim.new((11+-11), _P199x._8x6q(679/97)); _l1ll1.SortOrder = Enum.SortOrder.LayoutOrder
 Instance.new("\85\73\80\97\100\100\105\110\103", _lI1ll).PaddingRight = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(173,0xAB))
 return _lI1ll
 end
 local function statCard(_lllI, _Illl, _lIll, _IIlI, _IIIl)
 local _IlI = Instance.new("\70\114\97\109\101", _lllI)
 _IlI.BackgroundColor3 = C._IlI; _IlI.BorderSizePixel = (269-269); _IlI.LayoutOrder = _IIIl
 Instance.new("\85\73\67\111\114\110\101\114", _IlI).CornerRadius = UDim.new(_P199x._8x6q(0/100), (200+-192))
 local _lIlI = Instance.new("\85\73\83\116\114\111\107\101", _IlI)
 _lIlI.Color = _IIlI or C._IlIll1; _lIlI.Transparency = 0.45; _lIlI.Thickness = (13-12)
 themed(_IlI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _I1ll1 = _IIlI and nil or "\97\99\99\101\110\116"
 if _I1ll1 then themed(_lIlI, "\67\111\108\111\114", _I1ll1) end
 local _lllll1 = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 _lllll1.Size                  = UDim2.new(_P199x._8x6q(47/47), bit32.bxor(171,0xAB), _P199x._8x6q(0/38), bit32.bxor(137,0xAB))
 _lllll1.Position              = UDim2.new((95+-95), _P199x._8x6q(0/104), bit32.bxor(171,0xAB), _P199x._8x6q(168/21))
 _lllll1.BackgroundTransparency = bit32.bxor(170,0xAB)
 _lllll1.Font                  = Enum.Font.GothamBold
 _lllll1.TextSize              = _P199x._8x6q(4776/199)
 _lllll1.TextColor3            = _IIlI or C._IlIll1
 _lllll1.Text                  = _P199x._yp3z(_lIll)
 _lllll1.TextXAlignment        = Enum.TextXAlignment.Center
 if _I1ll1 then themed(_lllll1, "\84\101\120\116\67\111\108\111\114\51", _I1ll1) end
 local _IIlll1 = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 _IIlll1.Size                  = UDim2.new((8+-7), _P199x._8x6q(0/178), (5+-5), (266+-250))
 _IIlll1.Position              = UDim2.new(_P199x._8x6q(0/32), _P199x._8x6q(0/131), (184+-184), _P199x._8x6q(6006/143))
 _IIlll1.BackgroundTransparency = _P199x._8x6q(187/187)
 _IIlll1.Font                  = Enum.Font.Gotham
 _IIlll1.TextSize              = bit32.bxor(160,0xAB)
 _IIlll1.TextColor3            = C.subtext
 _IIlll1.Text                  = _Illl
 _IIlll1.TextXAlignment        = Enum.TextXAlignment.Center
 themed(_IIlll1, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 return _IlI
 end
 local function tRow(_lllI, _lIlll1, _lIl1, _IIIl)
 local _llll = Instance.new("\70\114\97\109\101", _lllI)
 _llll.Size             = UDim2.new(_P199x._8x6q(29/29), -(206-202), (432-432), _lIl1 and _P199x._8x6q(4268/194) or (41+-15))
 _llll.BackgroundColor3 = _lIl1 and C.surface or C._IlI
 _llll.BorderSizePixel  = (175+-175)
 _llll.LayoutOrder      = _IIIl
 Instance.new("\85\73\67\111\114\110\101\114", _llll).CornerRadius = UDim.new((9+-9), bit32.bxor(175,0xAB))
 themed(_llll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", _lIl1 and "\115\117\114\102\97\99\101" or "\99\97\114\100")
 local _IIl1 = (173+-172) / #_lIlll1
 for i, _IIlIlI in ipairs(_lIlll1) do
 local c = Instance.new("\84\101\120\116\76\97\98\101\108", _llll)
 c.Size                  = UDim2.new(_IIl1, -(73-69), _P199x._8x6q(174/174), (290+-290))
 c.Position              = UDim2.new((i - bit32.bxor(170,0xAB)) * _IIl1, _P199x._8x6q(218/109), _P199x._8x6q(0/180), bit32.bxor(171,0xAB))
 c.BackgroundTransparency = bit32.bxor(170,0xAB)
 c.Font                  = _lIl1 and Enum.Font.GothamBold or Enum.Font.Gotham
 c.TextSize              = _lIl1 and bit32.bxor(160,0xAB) or bit32.bxor(167,0xAB)
 c.TextColor3            = _lIl1 and C.subtext or C._lIl
 c.Text                  = _P199x._yp3z(_IIlIlI)
 c.TextXAlignment        = i == (352-351) and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center
 c.TextTruncate          = Enum.TextTruncate.AtEnd
 themed(c, "\84\101\120\116\67\111\108\111\114\51", _lIl1 and "\115\117\98\116\101\120\116" or "\116\101\120\116")
 end
 return _llll
 end
 local function emptyNote(_lllI, _IIlIl, _IIIl)
 local _IIll = Instance.new("\84\101\120\116\76\97\98\101\108", _lllI)
 _IIll.LayoutOrder           = _IIIl
 _IIll.Size                  = UDim2.new((215+-214), -bit32.bxor(175,0xAB), (106-106), (71-49))
 _IIll.BackgroundTransparency = _P199x._8x6q(181/181)
 _IIll.Font                  = Enum.Font.Gotham
 _IIll.TextSize              = _P199x._8x6q(1404/117)
 _IIll.TextColor3            = C.subtext
 _IIll.Text                  = _IIlIl
 _IIll.TextXAlignment        = Enum.TextXAlignment.Left
 themed(_IIll, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 do
 local _lI1ll = aScroll(_Ill1.dashboard)
 local _llIl1 = Instance.new("\84\101\120\116\76\97\98\101\108", _lI1ll)
 _llIl1.LayoutOrder           = (46+-46); _llIl1.Size = UDim2.new(_P199x._8x6q(189/189), -_P199x._8x6q(292/73), bit32.bxor(171,0xAB), _P199x._8x6q(4116/147))
 _llIl1.BackgroundTransparency = (295+-294); _llIl1.Font = Enum.Font.GothamBold
 _llIl1.TextSize              = (79-63); _llIl1.TextColor3 = C._IlIll1
 _llIl1.Text                  = "\78\88\32\67\111\110\116\114\111\108\32\67\101\110\116\101\114\32\32\118" .. _IIlll.getVersion()
 _llIl1.TextXAlignment        = Enum.TextXAlignment.Left
 themed(_llIl1, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _llIlII = Instance.new("\70\114\97\109\101", _lI1ll)
 _llIlII.LayoutOrder           = (91+-90)
 _llIlII.Size                  = UDim2.new(bit32.bxor(170,0xAB), -(236+-232), _P199x._8x6q(0/165), (181-45))
 _llIlII.BackgroundTransparency = bit32.bxor(170,0xAB)
 local _IlIlII = Instance.new("\85\73\71\114\105\100\76\97\121\111\117\116", _llIlII)
 _IlIlII.CellSize    = UDim2.new(0.5, -bit32.bxor(174,0xAB), bit32.bxor(171,0xAB), (540-478))
 _IlIlII.CellPadding = UDim2.new(bit32.bxor(171,0xAB), bit32.bxor(173,0xAB), (184+-184), (375-369))
 _IlIlII.SortOrder   = Enum.SortOrder.LayoutOrder
 statCard(_llIlII, "\76\105\99\101\110\99\105\97\115",  _IIlll.countOf("\108\105\99\101\110\115\101\115"),    C.good,    (108-107))
 statCard(_llIlII, "\65\118\105\115\111\115",     _IIlll.countOf("\119\97\114\110\105\110\103\115"),     C.warn,    _P199x._8x6q(338/169))
 statCard(_llIlII, "\84\97\103\115\32\78\88",    _IIlll.countTags(),             C._IlIll1,  _P199x._8x6q(315/105))
 statCard(_llIlII, "\80\101\114\109\105\115\111\115",   _IIlll.countOf("\112\101\114\109\105\115\115\105\111\110\115"),  C.subtext, bit32.bxor(175,0xAB))
 local _IlIl1 = Instance.new("\70\114\97\109\101", _lI1ll)
 _IlIl1.LayoutOrder      = _P199x._8x6q(162/81)
 _IlIl1.Size             = UDim2.new((271+-270), -_P199x._8x6q(676/169), _P199x._8x6q(0/43), _P199x._8x6q(0/69))
 _IlIl1.AutomaticSize    = Enum.AutomaticSize.Y
 _IlIl1.BackgroundColor3 = C._IlI; _IlIl1.BorderSizePixel = bit32.bxor(171,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _IlIl1).CornerRadius = UDim.new(bit32.bxor(171,0xAB), (11+-3))
 themed(_IlIl1, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _lIIl1 = Instance.new("\85\73\80\97\100\100\105\110\103", _IlIl1)
 _lIIl1.PaddingTop = UDim.new((437-437),(405-395)); _lIIl1.PaddingBottom = UDim.new((64+-64),_P199x._8x6q(780/78))
 _lIIl1.PaddingLeft = UDim.new((334-334),bit32.bxor(167,0xAB)); _lIIl1.PaddingRight = UDim.new(_P199x._8x6q(0/148),bit32.bxor(167,0xAB))
 local _IIIl1 = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _IlIl1)
 _IIIl1.Padding = UDim.new((194-194), (210-205)); _IIIl1.SortOrder = Enum.SortOrder.LayoutOrder
 local _l1Il1 = Instance.new("\84\101\120\116\76\97\98\101\108", _IlIl1)
 _l1Il1.LayoutOrder = bit32.bxor(171,0xAB); _l1Il1.Size = UDim2.new((197-196),_P199x._8x6q(0/29),(163+-163),(32+-12))
 _l1Il1.BackgroundTransparency = bit32.bxor(170,0xAB); _l1Il1.Font = Enum.Font.GothamBold
 _l1Il1.TextSize = (87+-74); _l1Il1.TextColor3 = C._IlIll1
 _l1Il1.Text = "\65\114\99\104\105\118\111\115\32\114\101\109\111\116\111\115"; _l1Il1.TextXAlignment = Enum.TextXAlignment.Left
 themed(_l1Il1, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 for i, f in ipairs({ {"\108\105\99\101\110\115\101\115\46\106\115\111\110","\108\105\99\101\110\115\101\115"}, {"\119\97\114\110\105\110\103\115\46\106\115\111\110","\119\97\114\110\105\110\103\115"}, {"\112\101\114\109\105\115\115\105\111\110\115\46\106\115\111\110","\112\101\114\109\105\115\115\105\111\110\115"} }) do
 local _l1 = not d.failed[f[(360-358)]]
 local _I1Il1 = Instance.new("\70\114\97\109\101", _IlIl1)
 _I1Il1.LayoutOrder = i; _I1Il1.Size = UDim2.new((330-329),_P199x._8x6q(0/98),(359-359),_P199x._8x6q(4356/198)); _I1Il1.BackgroundTransparency = bit32.bxor(170,0xAB)
 local _lllIl1 = Instance.new("\84\101\120\116\76\97\98\101\108", _I1Il1)
 _lllIl1.Size = UDim2.new(_P199x._8x6q(95/95),-(89+-19),_P199x._8x6q(149/149),(6-6)); _lllIl1.BackgroundTransparency = _P199x._8x6q(149/149)
 _lllIl1.Font = Enum.Font.Gotham; _lllIl1.TextSize = (26+-14); _lllIl1.TextColor3 = C._lIl
 _lllIl1.Text = f[_P199x._8x6q(19/19)]; _lllIl1.TextXAlignment = Enum.TextXAlignment.Left
 themed(_lllIl1, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _IIlIl1 = Instance.new("\84\101\120\116\76\97\98\101\108", _I1Il1)
 _IIlIl1.Size = UDim2.new(_P199x._8x6q(0/63),_P199x._8x6q(9372/142),(181-180),(11+-11)); _IIlIl1.Position = UDim2.new((161+-160),-bit32.bxor(239,0xAB),(82-82),bit32.bxor(171,0xAB))
 _IIlIl1.BackgroundTransparency = (223-222); _IIlIl1.Font = Enum.Font.GothamBold; _IIlIl1.TextSize = (150-138)
 _IIlIl1.TextColor3 = _l1 and C.good or C.bad
 _IIlIl1.Text = _l1 and "\79\75" or "\69\114\114\111\114"
 _IIlIl1.TextXAlignment = Enum.TextXAlignment.Right
 end
 local _lIlIl1  = _IIlll.getPermissions(_l.UserId)
 local _llll1 = Instance.new("\70\114\97\109\101", _lI1ll)
 _llll1.LayoutOrder = (4+-1); _llll1.Size = UDim2.new(_P199x._8x6q(166/166),-(290-286),(436-436),(72+-72))
 _llll1.AutomaticSize = Enum.AutomaticSize.Y
 _llll1.BackgroundColor3 = C._IlI; _llll1.BorderSizePixel = (284+-284)
 Instance.new("\85\73\67\111\114\110\101\114", _llll1).CornerRadius = UDim.new((324-324), _P199x._8x6q(536/67))
 themed(_llll1, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 local _Illl1 = Instance.new("\85\73\80\97\100\100\105\110\103", _llll1)
 _Illl1.PaddingTop = UDim.new(bit32.bxor(171,0xAB),bit32.bxor(161,0xAB)); _Illl1.PaddingBottom = UDim.new((246+-246),bit32.bxor(161,0xAB))
 _Illl1.PaddingLeft = UDim.new((143+-143),bit32.bxor(167,0xAB)); _Illl1.PaddingRight = UDim.new((168+-168),_P199x._8x6q(96/8))
 local _lllll1 = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _llll1)
 _lllll1.Padding = UDim.new((99+-99), _P199x._8x6q(310/62)); _lllll1.SortOrder = Enum.SortOrder.LayoutOrder
 local _Illll1 = Instance.new("\84\101\120\116\76\97\98\101\108", _llll1)
 _Illll1.LayoutOrder = (318-318); _Illll1.Size = UDim2.new(bit32.bxor(170,0xAB),(212+-212),bit32.bxor(171,0xAB),bit32.bxor(191,0xAB))
 _Illll1.BackgroundTransparency = _P199x._8x6q(109/109); _Illll1.Font = Enum.Font.GothamBold
 _Illll1.TextSize = (361-348); _Illll1.TextColor3 = C._IlIll1
 _Illll1.Text = "\84\117\115\32\112\101\114\109\105\115\111\115\32\32\40" .. _l.DisplayName .. "\41"
 _Illll1.TextXAlignment = Enum.TextXAlignment.Left
 themed(_Illll1, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 for i, pDef in ipairs({
 {"\97\100\109\105\110","\65\100\109\105\110\105\115\116\114\97\100\111\114"},{"\99\97\110\87\97\114\110","\80\117\101\100\101\32\97\100\118\101\114\116\105\114"},
 {"\99\97\110\77\97\110\97\103\101\84\97\103\115","\71\101\115\116\105\111\110\97\114\32\84\97\103\115"},{"\99\97\110\65\99\99\101\115\115\66\101\116\97","\65\99\99\101\115\111\32\66\101\116\97"},
 }) do
 local _lIlll1 = _lIlIl1[pDef[(431-430)]] == true
 local _IIlll1 = Instance.new("\70\114\97\109\101", _llll1)
 _IIlll1.LayoutOrder = i; _IIlll1.Size = UDim2.new((178+-177),(9+-9),_P199x._8x6q(0/119),_P199x._8x6q(1936/88)); _IIlll1.BackgroundTransparency = _P199x._8x6q(148/148)
 local _l1lll1 = Instance.new("\84\101\120\116\76\97\98\101\108", _IIlll1)
 _l1lll1.Size = UDim2.new((480-479),-(42+8),(203-202),bit32.bxor(171,0xAB)); _l1lll1.BackgroundTransparency = _P199x._8x6q(178/178)
 _l1lll1.Font = Enum.Font.Gotham; _l1lll1.TextSize = bit32.bxor(167,0xAB); _l1lll1.TextColor3 = C._lIl
 _l1lll1.Text = pDef[_P199x._8x6q(336/168)]; _l1lll1.TextXAlignment = Enum.TextXAlignment.Left
 themed(_l1lll1, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _I1lll1 = Instance.new("\84\101\120\116\76\97\98\101\108", _IIlll1)
 _I1lll1.Size = UDim2.new((200+-200),(221+-175),(44+-43),bit32.bxor(171,0xAB)); _I1lll1.Position = UDim2.new(bit32.bxor(170,0xAB),-(275+-227),(73-73),_P199x._8x6q(0/98))
 _I1lll1.BackgroundTransparency = bit32.bxor(170,0xAB); _I1lll1.Font = Enum.Font.GothamBold; _I1lll1.TextSize = (178-166)
 _I1lll1.TextColor3 = _lIlll1 and C.good or C.subtext
 _I1lll1.Text = _lIlll1 and "\83\105" or "\78\111"
 _I1lll1.TextXAlignment = Enum.TextXAlignment.Right
 end
 end
 do
 local _lI1ll = aScroll(_Ill1.licenses)
 local _llIl1 = Instance.new("\84\101\120\116\76\97\98\101\108", _lI1ll)
 _llIl1.LayoutOrder = _P199x._8x6q(0/181); _llIl1.Size = UDim2.new(bit32.bxor(170,0xAB),-(314-310),_P199x._8x6q(0/28),(225+-201))
 _llIl1.BackgroundTransparency = (385-384); _llIl1.Font = Enum.Font.GothamBold
 _llIl1.TextSize = (130-116); _llIl1.TextColor3 = C._IlIll1
 _llIl1.Text = "\76\105\99\101\110\99\105\97\115\32\97\99\116\105\118\97\115\32\32\40" .. _IIlll.countOf("\108\105\99\101\110\115\101\115") .. "\41"
 _llIl1.TextXAlignment = Enum.TextXAlignment.Left
 themed(_llIl1, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 tRow(_lI1ll, {"\85\115\101\114\73\100", "\69\115\116\97\100\111", "\67\97\114\103\97\100\111"}, true, (101-100))
 local _llllll1 = d._llllll1 > _P199x._8x6q(0/57) and os.date("\37\72\58\37\77\58\37\83", d._llllll1) or "\8212"
 local _IIllll1 = bit32.bxor(169,0xAB)
 for _lI1lI, _lIllI1 in pairs(d.licenses) do
 tRow(_lI1ll, {_lI1lI, _lIllI1 and "\65\99\116\105\118\97" or "\73\110\97\99\116\105\118\97", _llllll1}, false, _IIllll1)
 _IIllll1 = _IIllll1 + (119+-118)
 end
 if _IIllll1 == (70+-68) then emptyNote(_lI1ll, "\83\105\110\32\100\97\116\111\115\32\40\97\114\99\104\105\118\111\32\118\97\99\237\111\32\111\32\110\111\32\100\105\115\112\111\110\105\98\108\101\41\46", _P199x._8x6q(232/116)) end
 end
 do
 local _lI1ll = aScroll(_Ill1.warnings)
 local _llIl1 = Instance.new("\84\101\120\116\76\97\98\101\108", _lI1ll)
 _llIl1.LayoutOrder = (194-194); _llIl1.Size = UDim2.new((233-232),-_P199x._8x6q(408/102),(250-250),bit32.bxor(179,0xAB))
 _llIl1.BackgroundTransparency = (189+-188); _llIl1.Font = Enum.Font.GothamBold
 _llIl1.TextSize = _P199x._8x6q(504/36); _llIl1.TextColor3 = C.warn
 _llIl1.Text = "\65\100\118\101\114\116\101\110\99\105\97\115\32\32\40" .. _IIlll.countOf("\119\97\114\110\105\110\103\115") .. "\41"
 _llIl1.TextXAlignment = Enum.TextXAlignment.Left
 tRow(_lI1ll, {"\85\115\101\114\73\100", "\78\105\118\101\108", "\77\101\110\115\97\106\101"}, true, bit32.bxor(170,0xAB))
 local _IIllll1 = bit32.bxor(169,0xAB)
 for _lI1lI, w in pairs(d.warnings) do
 if _P199x._iy38(w) == "\116\97\98\108\101" then
 tRow(_lI1ll, {_lI1lI, _P199x._yp3z(w._llIII or "\63"), _P199x._yp3z(w._I1lIlll or "\8212")}, false, _IIllll1)
 _IIllll1 = _IIllll1 + bit32.bxor(170,0xAB)
 end
 end
 if _IIllll1 == (145+-143) then emptyNote(_lI1ll, "\83\105\110\32\97\100\118\101\114\116\101\110\99\105\97\115\32\97\99\116\105\118\97\115\46", bit32.bxor(169,0xAB)) end
 end
 do
 local _lI1ll = aScroll(_Ill1._Illl)
 local _llIl1 = Instance.new("\84\101\120\116\76\97\98\101\108", _lI1ll)
 _llIl1.LayoutOrder = _P199x._8x6q(0/80); _llIl1.Size = UDim2.new(_P199x._8x6q(41/41),-(197+-193),(56+-56),(201+-177))
 _llIl1.BackgroundTransparency = bit32.bxor(170,0xAB); _llIl1.Font = Enum.Font.GothamBold
 _llIl1.TextSize = (217+-203); _llIl1.TextColor3 = C._IlIll1
 _llIl1.Text = "\84\97\103\115\32\78\88\32\32\40" .. _IIlll.countTags() .. "\41"
 _llIl1.TextXAlignment = Enum.TextXAlignment.Left
 themed(_llIl1, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 tRow(_lI1ll, {"\85\115\101\114\73\100", "\84\97\103", "\80\114\105\111\114\105\100\97\100", "\67\111\108\111\114"}, true, bit32.bxor(170,0xAB))
 local _IIllll1 = (83+-81)
 if _P199x._iy38(_ll1) == "\116\97\98\108\101" then
 for _lI1lI, t in pairs(_ll1) do
 if _P199x._iy38(t) == "\116\97\98\108\101" then
 tRow(_lI1ll, {
 _lI1lI,
 _P199x._yp3z(t._IllII1 or "\8212"),
 _P199x._yp3z(t._lllI1 or "\8212"),
 _P199x._yp3z(t._IIlI or "\8212"),
 }, false, _IIllll1)
 _IIllll1 = _IIllll1 + bit32.bxor(170,0xAB)
 end
 end
 end
 if _IIllll1 == (211-209) then emptyNote(_lI1ll, "\84\97\103\115\32\97\250\110\32\99\97\114\103\97\110\100\111\32\111\32\115\105\110\32\100\97\116\111\115\46", _P199x._8x6q(350/175)) end
 end
 do
 local _lI1ll = aScroll(_Ill1.perms)
 local _llIl1 = Instance.new("\84\101\120\116\76\97\98\101\108", _lI1ll)
 _llIl1.LayoutOrder = bit32.bxor(171,0xAB); _llIl1.Size = UDim2.new((157+-156),-_P199x._8x6q(560/140),_P199x._8x6q(0/176),bit32.bxor(179,0xAB))
 _llIl1.BackgroundTransparency = (249+-248); _llIl1.Font = Enum.Font.GothamBold
 _llIl1.TextSize = bit32.bxor(165,0xAB); _llIl1.TextColor3 = C._IlIll1
 _llIl1.Text = "\80\101\114\109\105\115\111\115\32\32\40" .. _IIlll.countOf("\112\101\114\109\105\115\115\105\111\110\115") .. "\41"
 _llIl1.TextXAlignment = Enum.TextXAlignment.Left
 themed(_llIl1, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 tRow(_lI1ll, {"\85\115\101\114\73\100", "\65\100\109\105\110", "\65\100\118\101\114\116\105\114", "\84\97\103\115", "\66\101\116\97"}, true, _P199x._8x6q(169/169))
 local _IIllll1 = (139+-137)
 for _lI1lI, p in pairs(d.permissions) do
 if _P199x._iy38(p) == "\116\97\98\108\101" then
 tRow(_lI1ll, {
 _lI1lI,
 p.admin         and "\83\105" or "\8212",
 p.canWarn       and "\83\105" or "\8212",
 p.canManageTags and "\83\105" or "\8212",
 p.canAccessBeta and "\83\105" or "\8212",
 }, false, _IIllll1)
 _IIllll1 = _IIllll1 + (98+-97)
 end
 end
 if _IIllll1 == _P199x._8x6q(138/69) then emptyNote(_lI1ll, "\83\105\110\32\112\101\114\109\105\115\111\115\32\99\111\110\102\105\103\117\114\97\100\111\115\46", (153+-151)) end
 end
 showSub("\100\97\115\104\98\111\97\114\100")
end
local _lIllll1 = false
do
 local _lIll1 = {
 { _Illl = "\82\101\113\117\101\115\116",    _llIIlI1 = 0.22, cy = 0.46 },
 { _Illl = "\80\114\111\99\101\115\115\105\110\103", _llIIlI1 = 0.50, cy = 0.46 },
 { _Illl = "\67\111\109\112\108\101\116\101",   _llIIlI1 = 0.78, cy = 0.46 },
 }
 local _IIll1 = _P199x._8x6q(352/176)
 local _l1lllll, stage, statusLbl, sizeConn
 local _llIll1, _lllllI, packet = {}, {}, nil
 local _lIll1, finishing, startedAt, _IIl1lI = false, false, (94-94), _P199x._8x6q(0/177)
 local function makeRack(_lllI, w, h, _IlIll1)
 local _Ill = Instance.new("\70\114\97\109\101", _lllI)
 _Ill.AnchorPoint = Vector2.new(0.5, (11+-11))
 _Ill.Position = UDim2.new(0.5, (237+-237), (151-151), _P199x._8x6q(0/51))
 _Ill.Size = UDim2.fromOffset(w, h)
 _Ill.BackgroundColor3 = C._IlI
 _Ill.BorderSizePixel = bit32.bxor(171,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _Ill).CornerRadius = UDim.new((229+-229), (98+-92))
 local _lIIll1 = Instance.new("\85\73\71\114\97\100\105\101\110\116", _Ill)
 _lIIll1.Rotation = bit32.bxor(241,0xAB)
 _lIIll1.Color = ColorSequence.new(Color3.fromRGB(bit32.bxor(84,0xAB), bit32.bxor(84,0xAB), (12+243)), Color3.fromRGB(_P199x._8x6q(5720/26), (189+31), (144+84)))
 _lIIll1.Transparency = NumberSequence.new(0.85)
 local _lIlI = Instance.new("\85\73\83\116\114\111\107\101", _Ill)
 _lIlI.Color = _IlIll1; _lIlI.Thickness = 1.2; _lIlI.Transparency = 0.35
 for i = bit32.bxor(170,0xAB), _P199x._8x6q(382/191) do
 local _IIIll1 = Instance.new("\70\114\97\109\101", _Ill)
 _IIIll1.AnchorPoint = Vector2.new((253+-253), 0.5)
 _IIIll1.Size = UDim2.new(_P199x._8x6q(0/94), _P199x._8x6q(w * 0.42), bit32.bxor(171,0xAB), _P199x._8x6q(60/20))
 _IIIll1.Position = UDim2.new(_P199x._8x6q(0/9), (247+-239), i / (55+-52), bit32.bxor(171,0xAB))
 _IIIll1.BackgroundColor3 = C.subtext
 _IIIll1.BackgroundTransparency = 0.4
 _IIIll1.BorderSizePixel = (351-351)
 Instance.new("\85\73\67\111\114\110\101\114", _IIIll1).CornerRadius = UDim.new(bit32.bxor(170,0xAB), (493-493))
 end
 local _l1Ill1 = Instance.new("\70\114\97\109\101", _Ill)
 _l1Ill1.AnchorPoint = Vector2.new((455-454), 0.5)
 _l1Ill1.Size = UDim2.fromOffset(bit32.bxor(174,0xAB), (477-472))
 _l1Ill1.Position = UDim2.new((27+-26), -(94+-86), 0.5, (56+-56))
 _l1Ill1.BackgroundColor3 = _IlIll1
 _l1Ill1.BorderSizePixel = (308-308)
 Instance.new("\85\73\67\111\114\110\101\114", _l1Ill1).CornerRadius = UDim.new((121+-120), (115-115))
 return _Ill, _lIlI
 end
 local function makeLabel(_lllI, y, _I1Ill1, _IIlI, _IIlIlI)
 local l = Instance.new("\84\101\120\116\76\97\98\101\108", _lllI)
 l.AnchorPoint = Vector2.new(0.5, (137+-137))
 l.Position = UDim2.new(0.5, (42+-42), _P199x._8x6q(0/48), y)
 l.Size = UDim2.new(bit32.bxor(170,0xAB), (109+-97), bit32.bxor(171,0xAB), _I1Ill1 + bit32.bxor(175,0xAB))
 l.BackgroundTransparency = _P199x._8x6q(155/155)
 l.Font = Enum.Font.GothamMedium
 l.TextSize = _I1Ill1
 l.TextColor3 = _IIlI
 l.Text = _IIlIlI
 l.TextXAlignment = Enum.TextXAlignment.Center
 l.TextTruncate = Enum.TextTruncate.AtEnd
 return l
 end
 local function _II1ll()
 if not stage then return end
 local _lllIll1 = stage.AbsoluteSize
 if _lllIll1.X < bit32.bxor(161,0xAB) or _lllIll1.Y < (439-429) then return end
 for _, n in ipairs(_llIll1) do
 n.px = Vector2.new(n.def._llIIlI1 * _lllIll1.X, n.def.cy * _lllIll1.Y)
 n._llIllll = Vector2.new(n.px.X, n.px.Y - bit32.bxor(160,0xAB))
 n._lIlIl1.Position = UDim2.fromOffset(n.px.X, n.px.Y)
 end
 for _, ln in ipairs(_lllllI) do
 local a, b = _llIll1[ln._llllI]._llIllll, _llIll1[ln.to]._llIllll
 local d = b - a
 ln.len = d.Magnitude
 ln._llllll.Position = UDim2.fromOffset(a.X, a.Y)
 ln._llllll.Rotation = math.deg(math.atan(d.Y, d.X))
 if ln.grown then ln._llllll.Size = UDim2.fromOffset(ln.len, _IIll1) end
 end
 end
 local function lightNode(i, _IIlI)
 local n = _llIll1[i]
 if not n then return end
 motionTween(n._Illlll, TweenInfo.new(0.2), { Transparency = (259+-259), Color = _IIlI or C._IlIll1 })
 end
 local function dimNode(i)
 local n = _llIll1[i]
 if not n then return end
 motionTween(n._Illlll, TweenInfo.new(0.2), { Transparency = 0.35 })
 end
 local function setStatus(_IIlIlI, _IIlI)
 if statusLbl then statusLbl.Text = _IIlIlI; statusLbl.TextColor3 = _IIlI or C._IlIll1 end
 end
 local function travel(_IlIl1, _lIlIll1)
 if not _lIll1 or _lIlIll1 ~= _IIl1lI or finishing then return end
 local a, b = _llIll1[_IlIl1]._llIllll, _llIll1[_IlIl1 + bit32.bxor(170,0xAB)]._llIllll
 packet.Position = UDim2.fromOffset(a.X, a.Y)
 packet.BackgroundTransparency = 0.05
 packet.Visible = true
 local _IIlIll1 = _P199x._5x5j((b - a).Magnitude / _P199x._8x6q(4180/19), 0.35, 0.7)
 motionTween(packet, TweenInfo.new(_IIlIll1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
 { Position = UDim2.fromOffset(b.X, b.Y) }, function()
 if not _lIll1 or _lIlIll1 ~= _IIl1lI or finishing then return end
 lightNode(_IlIl1 + (131-130))
 if _IlIl1 + (28+-27) < #_llIll1 then
 travel(_IlIl1 + (133+-132), _lIlIll1)
 else
 task.delay(0.35, function()
 if not _lIll1 or finishing or _lIlIll1 ~= _IIl1lI then return end
 dimNode((398-396)); dimNode((223+-220))
 travel(bit32.bxor(170,0xAB), _lIlIll1)
 end)
 end
 end)
 end
 local function destroyNow()
 _lIll1 = false
 _IIl1lI = _IIl1lI + _P199x._8x6q(60/60)
 if sizeConn then sizeConn:Disconnect(); sizeConn = nil end
 if _l1lllll then _l1lllll:Destroy() end
 _l1lllll, stage, statusLbl, packet = nil, nil, nil, nil
 _llIll1, _lllllI = {}, {}
 end
 local M = {}
 function M.finish(_llll1ll)
 local function done() if _llll1ll then task.spawn(_llll1ll) end end
 if not _lIll1 then done(); return end
 if finishing then done(); return end
 finishing = true
 local _lIlIll1 = _IIl1lI
 task.spawn(function()
 local _llIl1 = os.clock() - startedAt
 if _llIl1 < 1.0 then task.wait(1.0 - _llIl1) end
 if _lIlIll1 ~= _IIl1lI then done(); return end
 for _, ln in ipairs(_lllllI) do
 motionTween(ln._llllll, TweenInfo.new(0.3), { BackgroundColor3 = C.good })
 end
 for i = bit32.bxor(170,0xAB), #_llIll1 do lightNode(i, C.good) end
 if _llIll1[(52-49)] and _llIll1[_P199x._8x6q(39/13)]._Illl then _llIll1[(79+-76)]._Illl.TextColor3 = C.good end
 if packet then
 packet.BackgroundColor3 = C.good
 local b = _llIll1[#_llIll1]._llIllll
 motionTween(packet, TweenInfo.new(0.3), { Position = UDim2.fromOffset(b.X, b.Y) })
 end
do local _8v51=math.abs(-0);if _a89d>1 then warn("")end end
do local _cf7cmh=1 while _cf7cmh>0 do if _cf7cmh==1 then
 setStatus("\67\111\109\112\108\101\116\101\100", C.good)
 task.wait(0.45)
 if _lIlIll1 ~= _IIl1lI then done(); return end
 motionTween(stage, TweenInfo.new(0.3), { GroupTransparency = (384-383) })
_cf7cmh=0 end end end
 motionTween(_l1lllll, TweenInfo.new(0.3), { BackgroundTransparency = _P199x._8x6q(67/67) }, function()
 destroyNow()
 done()
 end)
 end)
 end
 function M.stop() destroyNow() end
 function M.start()
 destroyNow()
 _IIl1lI = _IIl1lI + (57-56)
 local _lIlIll1 = _IIl1lI
 _lIll1, finishing, startedAt = true, false, os.clock()
 _l1lllll = Instance.new("\70\114\97\109\101")
 _l1lllll.Name = "\83\99\97\110\79\118\101\114\108\97\121"
 _l1lllll.Position = UDim2.new(_P199x._8x6q(0/52), _P199x._8x6q(0/38), (120+-120), (63+-63))
 _l1lllll.Size = UDim2.new((140-139), _P199x._8x6q(0/199), _P199x._8x6q(115/115), (421-421))
 _l1lllll.BackgroundColor3 = C.bg
 _l1lllll.BackgroundTransparency = 0.03
 _l1lllll.BorderSizePixel = (102+-102)
 _l1lllll.ClipsDescendants = true
 _l1lllll.Active = true
 _l1lllll.ZIndex = (76+-26)
 _l1lllll.Parent = _IIllIll
 stage = Instance.new("\67\97\110\118\97\115\71\114\111\117\112")
 stage.Size = UDim2.new((92+-91), _P199x._8x6q(0/20), (80+-79), _P199x._8x6q(0/59))
 stage.BackgroundTransparency = _P199x._8x6q(4/4)
 stage.BorderSizePixel = (314-314)
 stage.GroupTransparency = (229-229)
 stage.ZIndex = (475-424)
 stage.Parent = _l1lllll
 local _lllIl1 = Instance.new("\70\114\97\109\101", stage)
 _lllIl1.AnchorPoint = Vector2.new(0.5, _P199x._8x6q(0/70))
 _lllIl1.Position = UDim2.new(0.5, (336-336), _P199x._8x6q(0/101), (241+-231))
 _lllIl1.Size = UDim2.fromOffset(_P199x._8x6q(29340/163), (267-243))
 _lllIl1.BackgroundColor3 = C._IlI
 _lllIl1.BackgroundTransparency = 0.1
 _lllIl1.BorderSizePixel = _P199x._8x6q(0/37)
 Instance.new("\85\73\67\111\114\110\101\114", _lllIl1).CornerRadius = UDim.new(_P199x._8x6q(40/40), _P199x._8x6q(0/11))
 local _IllIl1 = Instance.new("\85\73\83\116\114\111\107\101", _lllIl1)
 _IllIl1.Color = C._IlIll1; _IllIl1.Transparency = 0.4
 statusLbl = Instance.new("\84\101\120\116\76\97\98\101\108", _lllIl1)
 statusLbl.Size = UDim2.new(_P199x._8x6q(193/193), -_P199x._8x6q(480/30), (32+-31), bit32.bxor(171,0xAB))
 statusLbl.Position = UDim2.new((68-68), bit32.bxor(163,0xAB), bit32.bxor(171,0xAB), _P199x._8x6q(0/148))
 statusLbl.BackgroundTransparency = (151+-150)
 statusLbl.Font = Enum.Font.GothamBold
 statusLbl.TextSize = (36+-24)
 statusLbl.TextColor3 = C._IlIll1
 statusLbl.Text = "\82\101\113\117\101\115\116\105\110\103\32\68\97\116\97\46\46\46"
 statusLbl.TextXAlignment = Enum.TextXAlignment.Center
 _llIll1, _lllllI = {}, {}
 for _, def in ipairs(_lIll1) do
 local _lIlIl1 = Instance.new("\70\114\97\109\101", stage)
 _lIlIl1.AnchorPoint = Vector2.new(0.5, 0.5)
 _lIlIl1.Size = UDim2.fromOffset(bit32.bxor(247,0xAB), (272+-210))
 _lIlIl1.BackgroundTransparency = _P199x._8x6q(196/196)
 _lIlIl1.ZIndex = bit32.bxor(168,0xAB)
 local _lIIl = Instance.new("\85\73\83\99\97\108\101", _lIlIl1); _lIIl.Scale = (175-175)
 local _, _lIlI = makeRack(_lIlIl1, bit32.bxor(255,0xAB), (176+-136), C._IlIll1)
 local _IIll = makeLabel(_lIlIl1, (307-263), (386-374), C.subtext, def._Illl)
 _llIll1[#_llIll1 + (234+-233)] = { def = def, _lIlIl1 = _lIlIl1, _I1llIl = _lIIl, _Illlll = _lIlI, _Illl = _IIll }
 end
 for i = (52-51), #_llIll1 - (222-221) do
 local _IIlIl1 = Instance.new("\70\114\97\109\101", stage)
 _IIlIl1.AnchorPoint = Vector2.new(bit32.bxor(171,0xAB), 0.5)
 _IIlIl1.Size = UDim2.fromOffset(bit32.bxor(171,0xAB), _IIll1)
 _IIlIl1.BackgroundColor3 = C._IlIll1
 _IIlIl1.BackgroundTransparency = 0.2
 _IIlIl1.BorderSizePixel = bit32.bxor(171,0xAB)
 _IIlIl1.ZIndex = bit32.bxor(169,0xAB)
 local _l1lIl1 = Instance.new("\85\73\71\114\97\100\105\101\110\116", _IIlIl1)
 _l1lIl1.Transparency = NumberSequence.new({
 NumberSequenceKeypoint.new((117+-117), 0.5),
 NumberSequenceKeypoint.new(0.5, bit32.bxor(171,0xAB)),
 NumberSequenceKeypoint.new(_P199x._8x6q(91/91), 0.5),
 })
 _lllllI[#_lllllI + (190+-189)] = { _llllll = _IIlIl1, _llllI = i, to = i + bit32.bxor(170,0xAB), grown = false }
 end
 packet = Instance.new("\70\114\97\109\101", stage)
 packet.AnchorPoint = Vector2.new(0.5, 0.5)
 packet.Size = UDim2.fromOffset(_P199x._8x6q(832/104), _P199x._8x6q(440/55))
 packet.BackgroundColor3 = C._IlIll1
 packet.BorderSizePixel = bit32.bxor(171,0xAB)
 packet.Visible = false
 packet.ZIndex = (188+-183)
 Instance.new("\85\73\67\111\114\110\101\114", packet).CornerRadius = UDim.new(bit32.bxor(170,0xAB), (288+-288))
 local _I1lIl1 = Instance.new("\85\73\83\116\114\111\107\101", packet)
 _I1lIl1.Color = Color3.fromRGB(bit32.bxor(84,0xAB), _P199x._8x6q(45900/180), _P199x._8x6q(40545/159)); _I1lIl1.Transparency = 0.4
 _II1ll()
 sizeConn = stage:GetPropertyChangedSignal("\65\98\115\111\108\117\116\101\83\105\122\101"):Connect(_II1ll)
 for i, n in ipairs(_llIll1) do
 task.delay(0.12 * (i - bit32.bxor(170,0xAB)), function()
 if _lIlIll1 ~= _IIl1lI or not _lIll1 then return end
 motionTween(n._I1llIl, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = bit32.bxor(170,0xAB) })
 end)
 end
 for i, ln in ipairs(_lllllI) do
 task.delay(0.12 * i, function()
 if _lIlIll1 ~= _IIl1lI or not _lIll1 then return end
 ln.grown = true
 motionTween(ln._llllll, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { Size = UDim2.fromOffset(ln.len, _IIll1) })
 end)
 end
 task.delay(0.42, function()
 if _lIlIll1 ~= _IIl1lI or not _lIll1 then return end
 lightNode(bit32.bxor(170,0xAB))
 travel((256+-255), _lIlIll1)
 end)
 end
 _G.NXScan = M
end
function _llllIlI.startScan()
 if _G.NXScan then _G.NXScan.start() end
end
function _lIIIl.textoEstado(_I1lI)
 local _lIlI = _I1lI and _I1lI._state
 if _lIlI == "\118\101\114\105\102\105\101\100" then return "\10003\32\86\101\114\105\102\105\99\97\100\111\46" end
 if _lIlI == "\112\97\114\116\105\97\108" then
 local n = #_lIIIl.problemas(_I1lI)
 return "\9681\32\80\97\114\99\105\97\108\32\183\32" .. n .. "\32\100\97\116\111\40\115\41\32\110\111\32\100\105\115\112\111\110\105\98\108\101\115\46"
 end
 if _lIlI == "\105\110\99\111\109\112\108\101\116\101" then return "\68\97\116\111\115\32\105\110\99\111\109\112\108\101\116\111\115\32\40\102\97\108\116\97\110\32\99\97\109\112\111\115\32\99\108\97\118\101\41\46" end
 if _lIlI == "\101\114\114\111\114"      then return "\10005\32\69\114\114\111\114\32\100\101\32\118\97\108\105\100\97\99\105\243\110\32\101\110\32\108\111\115\32\100\97\116\111\115\46" end
 return "\10003\32\76\105\115\116\111\46"
end
local _llllIl1 = (16+-16)
_lIlIll = function(_Illl)
 if _lIllll1 then return end
 _Illl = (_Illl or ""):gsub("\37\115", "")
 if _Illl == "" then return end
 _lIllll1 = true
 _llllIl1 = _llllIl1 + _P199x._8x6q(60/60)
 local _IIllIl1 = _llllIl1
 hideAllSuggestions()
 _l1lIll.Text = "\66\117\115\99\97\110\100\111\46\46\46"
 _llllIlI.startScan()
 task.spawn(function()
 local _lIllIl1, outStatus = nil, "\78\111\32\100\105\115\112\111\110\105\98\108\101\46"
 local _l1, _IlllIl = pcall(function()
 local _l1l1 = _P199x._p02a(_Illl)
 if not _l1l1 then
 local _lllI1, _, errType = getUserIdByName(_Illl)
 if not _lllI1 then
 if errType == "\110\111\116\95\102\111\117\110\100" then outStatus = "\85\115\117\97\114\105\111\32\110\111\32\101\110\99\111\110\116\114\97\100\111\46"
 elseif errType == "\97\112\105\95\101\114\114\111\114" then outStatus = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46\32\86\117\101\108\118\101\32\97\32\105\110\116\101\110\116\97\114\108\111\32\101\110\32\117\110\32\109\111\109\101\110\116\111\46"
 else outStatus = "\78\111\32\100\105\115\112\111\110\105\98\108\101\46" end
 return
 end
 _l1l1 = _lllI1
 end
 if _lIIIl.flags._I1lI and _lIIIl.valid._l1l1(_l1l1) == nil then
 outStatus = "\85\115\101\114\73\100\32\110\111\32\118\225\108\105\100\111\46"
 return
 end
 local _lIIl1 = _IIlI1I[_l1l1]
 if _lIIl1 and (os.time() - (_lIIl1._fetchedAt or _P199x._8x6q(0/71))) < _lIIIl._II1 then
 _lIIIl.run = _lIIl1._integrity or _lIIIl.run
 _lIllIl1 = _lIIl1
 outStatus = _lIIIl.textoEstado(_lIIl1) .. "\32\40\99\97\99\104\233\41"
 return
 end
 _l1lIll.Text = "\67\111\110\115\117\108\116\97\110\100\111\32\65\80\73\115\46\46\46"
 local _I1lI, motivo = gatherData(_l1l1)
 if not _I1lI then
 outStatus = (motivo == "\112\101\114\102\105\108\95\105\110\118\97\108\105\100\111" or motivo == "\115\105\110\95\114\101\115\112\117\101\115\116\97")
 and "\78\111\32\100\105\115\112\111\110\105\98\108\101\46" or "\85\115\117\97\114\105\111\32\110\111\32\101\110\99\111\110\116\114\97\100\111\46"
 else
 setCached(_l1l1, _I1lI)
 _lIllIl1 = _I1lI
 outStatus = _lIIIl.textoEstado(_I1lI)
 pcall(function()
 if _G.NXPlus and _G.NXPlus.recordar then
 _G.NXPlus.recordar(_I1lI.UserId, _I1lI.Username, _I1lI.DisplayName)
 end
 end)
 end
 end)
 if not _l1 then
 _lIllIl1, outStatus = nil, "\78\111\32\100\105\115\112\111\110\105\98\108\101\46"
 warn("\91\78\88\32\65\110\97\108\121\122\101\114\93\32\101\114\114\111\114\32\101\110\32\97\110\97\108\121\122\101\58\32" .. _P199x._yp3z(_IlllIl))
 end
 _l1lIll.Text = ""
 local function paint()
 if _IIllIl1 ~= _llllIl1 then _lIllll1 = false; return end
 _lIIIl.emit()
 local _IIIl1, renderErr = pcall(render, _lIllIl1)
 if not _IIIl1 then
 warn("\91\78\88\32\65\110\97\108\121\122\101\114\93\32\114\101\110\100\101\114\32\101\114\114\111\114\58\32" .. _P199x._yp3z(renderErr))
 end
 _l1lIll.Text = outStatus
 _lIllll1 = false
 end
 if _G.NXScan then _G.NXScan.finish(paint) else paint() end
 end)
end
track(_IIlIll.MouseButton1Click:Connect(function() _lIlIll(_I1Illl.Text) end))
track(_I1Illl.FocusLost:Connect(function(_llIIl1)
 if _llIIl1 then _lIlIll(_I1Illl.Text) end
end))
do
 if _G.NXOSINT and _G.NXOSINT.stop then pcall(_G.NXOSINT.stop) end
 local _I1l1ll = Instance.new("\70\114\97\109\101", _IIllIll)
 _I1l1ll.Size = UDim2.new((386-385), (88+-88), (298+-297), (332-332))
 _I1l1ll.BackgroundTransparency = _P199x._8x6q(167/167)
 _I1l1ll.Visible = false
 local _I1llllI = makeScroll(_I1l1ll)
 local _IlIIl1 = nil
 local _IIl1lI = (387-387)
 local _IIlII = {}
 local function getJSON(_IlII)
 local _Ill, _lIlI = rawGet(_IlII)
 if not _Ill then return nil, _P199x._p02a(_lIlI) end
 local _l1, t = pcall(function() return HttpService:JSONDecode(_Ill) end)
 if not _l1 or _P199x._iy38(t) ~= "\116\97\98\108\101" then return nil, _P199x._p02a(_lIlI) end
 return t, _P199x._p02a(_lIlI)
 end
 local function _IlllIIl(_lIllllIl, _lIIIl1, _IIIIl1)
 local _IlI = Instance.new("\70\114\97\109\101", _I1llllI)
 _IlI.LayoutOrder = _lIllllIl
 _IlI.Size = UDim2.new(_P199x._8x6q(144/144), -(51+-47), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB))
 _IlI.AutomaticSize = Enum.AutomaticSize.Y
 _IlI.BackgroundColor3 = C._IlI
 _IlI.BorderSizePixel = (94+-94)
 Instance.new("\85\73\67\111\114\110\101\114", _IlI).CornerRadius = UDim.new(_P199x._8x6q(0/143), _P199x._8x6q(496/62))
 themed(_IlI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 addDepth(_IlI)
 local _lIll = Instance.new("\85\73\80\97\100\100\105\110\103", _IlI)
 _lIll.PaddingTop = UDim.new((129+-129), (114-105)); _lIll.PaddingBottom = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(162,0xAB))
 _lIll.PaddingLeft = UDim.new((390-390), (18+-8)); _lIll.PaddingRight = UDim.new((77+-77), bit32.bxor(161,0xAB))
 local _lll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _IlI)
 _lll.Padding = UDim.new(_P199x._8x6q(0/13), (204-199)); _lll.SortOrder = Enum.SortOrder.LayoutOrder
 local h = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 h.LayoutOrder = bit32.bxor(171,0xAB); h.Size = UDim2.new((27+-26), (138+-138), (30+-30), bit32.bxor(191,0xAB))
 h.BackgroundTransparency = (260-259)
 h.Font = Enum.Font.GothamBold; h.TextSize = (350-336); h.TextColor3 = C._IlIll1
 h.Text = _lIIIl1; h.TextXAlignment = Enum.TextXAlignment.Left
 themed(h, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 if _IIIIl1 then
 local s = Instance.new("\84\101\120\116\76\97\98\101\108", _IlI)
 s.LayoutOrder = (448-447); s.Size = UDim2.new(_P199x._8x6q(110/110), _P199x._8x6q(0/53), (39-39), (188-188))
 s.AutomaticSize = Enum.AutomaticSize.Y
 s.BackgroundTransparency = (203+-202)
 s.Font = Enum.Font.Gotham; s.TextSize = bit32.bxor(160,0xAB); s.TextColor3 = C.subtext
 s.Text = _IIIIl1; s.TextXAlignment = Enum.TextXAlignment.Left
 s.TextWrapped = true
 themed(s, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 return _IlI
 end
 local function _I1lllII(_IlI, _lIllllIl, _lIIlIl, _IlII)
 local f = Instance.new("\70\114\97\109\101", _IlI)
 f.LayoutOrder = _lIllllIl
 f.Size = UDim2.new(_P199x._8x6q(27/27), (126-126), _P199x._8x6q(0/44), _P199x._8x6q(4344/181))
 f.BackgroundTransparency = (134+-133)
 local _IIllllII = Instance.new("\84\101\120\116\76\97\98\101\108", f)
 _IIllllII.Size = UDim2.new(_P199x._8x6q(0/89), bit32.bxor(61,0xAB), bit32.bxor(170,0xAB), (177+-177))
 _IIllllII.BackgroundTransparency = bit32.bxor(170,0xAB)
 _IIllllII.Font = Enum.Font.Gotham; _IIllllII.TextSize = bit32.bxor(167,0xAB); _IIllllII.TextColor3 = C.subtext
 _IIllllII.Text = _lIIlIl; _IIllllII.TextXAlignment = Enum.TextXAlignment.Left
 _IIllllII.TextTruncate = Enum.TextTruncate.AtEnd
 themed(_IIllllII, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _l1IIl1 = _IlII and (417-355) or (194+-194)
 local v = Instance.new("\84\101\120\116\76\97\98\101\108", f)
 v.Size = UDim2.new((392-391), -bit32.bxor(49,0xAB) - _l1IIl1, (289+-288), bit32.bxor(171,0xAB))
 v.Position = UDim2.new(_P199x._8x6q(0/172), bit32.bxor(49,0xAB), (45+-45), bit32.bxor(171,0xAB))
 v.BackgroundTransparency = (319-318)
 v.Font = Enum.Font.GothamBold; v.TextSize = _P199x._8x6q(144/12); v.TextColor3 = C.subtext
 v.Text = "\67\111\109\112\114\111\98\97\110\100\111\8230"; v.TextXAlignment = Enum.TextXAlignment.Left
 v.TextTruncate = Enum.TextTruncate.AtEnd
 if _IlII then
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110", f)
 b.AnchorPoint = Vector2.new((13-12), 0.5)
 b.Position = UDim2.new((276+-275), (303-303), 0.5, (359-359))
 b.Size = UDim2.new((111+-111), bit32.bxor(145,0xAB), bit32.bxor(171,0xAB), _P199x._8x6q(2680/134))
 b.BackgroundColor3 = C.surface
 b.Text = "\65\98\114\105\114"
 b.Font = Enum.Font.GothamMedium; b.TextSize = (285+-274); b.TextColor3 = C._lIl
 b.BorderSizePixel = bit32.bxor(171,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new(bit32.bxor(171,0xAB), (335-329))
 themed(b, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 themed(b, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 b.MouseButton1Click:Connect(function()
 if openURL(_IlII) then
 _l1lIll.Text = "\65\98\105\101\114\116\111\32\101\110\32\101\108\32\110\97\118\101\103\97\100\111\114\46"
 else
 _llII(_IlII)
 _l1lIll.Text = "\78\111\32\100\105\115\112\111\110\105\98\108\101\32\101\110\32\116\117\32\101\120\101\99\117\116\111\114\46\32\76\105\110\107\32\99\111\112\105\97\100\111\46"
 end
 end)
 end
 return v
 end
 local function marcar(_IIll, _llllllII, _I1IIl1)
 if not _IIll or not _IIll.Parent then return end
 if _llllllII == "\115\105" then
 _IIll.Text = _I1IIl1 or "\80\114\101\115\101\110\116\101";      _IIll.TextColor3 = C.good
 elseif _llllllII == "\110\111" then
 _IIll.Text = _I1IIl1 or "\78\111\32\101\110\99\111\110\116\114\97\100\111"; _IIll.TextColor3 = C.subtext
 else
 _IIll.Text = _I1IIl1 or "\78\111\32\100\105\115\112\111\110\105\98\108\101"; _IIll.TextColor3 = C.warn
 end
 end
 local function comprobar(_lIlIll1, _IIll, _llllllII, _I1I)
 task.spawn(function()
 local _l1, _llIlI, _I1IIl1, crudo = pcall(_I1I)
 if not _l1 then _llIlI, _I1IIl1 = "\110\100", nil end
 if _lIlIll1 ~= _IIl1lI then return end
 _IIlII[_llllllII] = { _llIlI = _llIlI, _I1IIl1 = _I1IIl1, _I1lllIl = crudo }
 marcar(_IIll, _llIlI, _I1IIl1)
 end)
 end
 local function construir()
 local _I1lI = _IllllIl
 clearScroll(_I1llllI)
 _IIlII = {}
 _IIl1lI = _IIl1lI + bit32.bxor(170,0xAB)
 local _lIlIll1 = _IIl1lI
 if not _I1lI then
 _IlIIl1 = nil
 local _lllIIl1 = Instance.new("\84\101\120\116\76\97\98\101\108", _I1llllI)
 _lllIIl1.LayoutOrder = bit32.bxor(171,0xAB)
 _lllIIl1.Size = UDim2.new(_P199x._8x6q(168/168), -bit32.bxor(175,0xAB), _P199x._8x6q(0/80), (158+-118))
 _lllIIl1.BackgroundTransparency = bit32.bxor(170,0xAB)
 _lllIIl1.Font = Enum.Font.Gotham; _lllIIl1.TextSize = _P199x._8x6q(2376/198); _lllIIl1.TextColor3 = C.subtext
 _lllIIl1.Text = "\65\110\97\108\105\122\97\32\117\110\32\112\101\114\102\105\108\32\112\97\114\97\32\118\101\114\32\115\117\32\104\117\101\108\108\97\32\112\250\98\108\105\99\97\46"
 _lllIIl1.TextXAlignment = Enum.TextXAlignment.Left
 themed(_lllIIl1, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 return
 end
 _IlIIl1 = _I1lI.UserId
 local _lI1lI  = _I1lI.UserId
 local _IIlIIl1 = _P199x._yp3z(_I1lI.Username or "")
 local _lIlIIl1 = _IlllIIl((277-277), "\80\114\101\115\101\110\99\105\97",
 "\69\115\112\97\99\105\111\115\32\100\101\32\82\111\98\108\111\120\32\100\111\110\100\101\32\101\115\116\97\32\99\117\101\110\116\97\32\100\101\106\97\32\104\117\101\108\108\97\32\112\250\98\108\105\99\97\46")
 marcar(_I1lllII(_lIlIIl1, (221+-219), "\80\101\114\102\105\108\32\100\101\32\82\111\98\108\111\120", _I1lI.ProfileUrl), "\115\105")
 local _ll1l1 = _I1lllII(_lIlIIl1, _P199x._8x6q(513/171), "\68\101\118\70\111\114\117\109",
 "\104\116\116\112\115\58\47\47\100\101\118\102\111\114\117\109\46\114\111\98\108\111\120\46\99\111\109\47\117\47" .. _IIlIIl1)
 comprobar(_lIlIll1, _ll1l1, "\100\101\118\102\111\114\117\109", function()
 if _IIlIIl1 == "" then return "\110\100" end
 local t, _IlIl = getJSON("\104\116\116\112\115\58\47\47\100\101\118\102\111\114\117\109\46\114\111\98\108\111\120\46\99\111\109\47\117\47" .. _IIlIIl1 .. "\46\106\115\111\110")
 if t and _P199x._iy38(t._IIlIIl1) == "\116\97\98\108\101" then
 local _Il1l1 = _P199x._p02a(t._IIlIIl1.trust_level)
 return "\115\105", _Il1l1 and ("\80\114\101\115\101\110\116\101\32\183\32\110\105\118\101\108\32\100\101\32\99\111\110\102\105\97\110\122\97\32" .. _Il1l1) or "\80\114\101\115\101\110\116\101", t._IIlIIl1
 end
 if _IlIl == bit32.bxor(319,0xAB) then return "\110\111" end
 return "\110\100"
 end)
 local _lll1l1 = _I1lllII(_lIlIIl1, _P199x._8x6q(452/113), "\69\120\112\101\114\105\101\110\99\105\97\115\32\112\117\98\108\105\99\97\100\97\115",
 "\104\116\116\112\115\58\47\47\119\119\119\46\114\111\98\108\111\120\46\99\111\109\47\117\115\101\114\115\47" .. _lI1lI .. "\47\112\114\111\102\105\108\101")
 comprobar(_lIlIll1, _lll1l1, "\106\117\101\103\111\115", function()
 local t = getJSON("\104\116\116\112\115\58\47\47\103\97\109\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\50\47\117\115\101\114\115\47" .. _lI1lI
 .. "\47\103\97\109\101\115\63\97\99\99\101\115\115\70\105\108\116\101\114\61\80\117\98\108\105\99\38\108\105\109\105\116\61\53\48\38\115\111\114\116\79\114\100\101\114\61\68\101\115\99")
 if not t or _P199x._iy38(t._I1lI) ~= "\116\97\98\108\101" then return "\110\100" end
 local n = #t._I1lI
 if n == _P199x._8x6q(0/85) then return "\110\111", "\78\105\110\103\117\110\97\32\112\250\98\108\105\99\97" end
 local _Ill1l1 = (t.nextPageCursor and t.nextPageCursor ~= "") and "\43" or ""
 return "\115\105", n .. _Ill1l1 .. "\32\101\120\112\101\114\105\101\110\99\105\97\40\115\41", t._I1lI
 end)
 local _lIl1l1 = _I1lllII(_lIlIIl1, (256-251), "\71\114\117\112\111\115\32\113\117\101\32\100\105\114\105\103\101")
 comprobar(_lIlIll1, _lIl1l1, "\103\114\117\112\111\115", function()
 local t = getJSON("\104\116\116\112\115\58\47\47\103\114\111\117\112\115\46\114\111\98\108\111\120\46\99\111\109\47\118\50\47\117\115\101\114\115\47" .. _lI1lI .. "\47\103\114\111\117\112\115\47\114\111\108\101\115")
 if not t or _P199x._iy38(t._I1lI) ~= "\116\97\98\108\101" then return "\110\100" end
 local _IIl1l1, _I1llI = {}, #t._I1lI
 for _, e in ipairs(t._I1lI) do
 local g = e.group
 if _P199x._iy38(g) == "\116\97\98\108\101" and _P199x._iy38(g.owner) == "\116\97\98\108\101"
 and _P199x._p02a(g.owner._l1l1) == _P199x._p02a(_lI1lI) then
 _IIl1l1[#_IIl1l1 + _P199x._8x6q(147/147)] = g._lll or ("\71\114\117\112\111\32" .. _P199x._yp3z(g._lllI1))
 end
 end
 if #_IIl1l1 == bit32.bxor(171,0xAB) then
 return "\110\111", (_I1llI == (11-11)) and "\69\110\32\110\105\110\103\250\110\32\103\114\117\112\111" or ("\77\105\101\109\98\114\111\32\100\101\32" .. _I1llI .. "\44\32\100\117\101\241\111\32\100\101\32\48")
 end
 return "\115\105", "\68\117\101\241\111\32\100\101\32" .. #_IIl1l1 .. "\32\100\101\32" .. _I1llI, { _IIl1l1 = _IIl1l1, todos = t._I1lI }
 end)
 local _l1l1l1 = _I1lllII(_lIlIIl1, (295+-289), "\73\116\101\109\115\32\101\110\32\101\108\32\99\97\116\225\108\111\103\111")
 comprobar(_lIlIll1, _l1l1l1, "\99\97\116\97\108\111\103\111", function()
 local t = getJSON("\104\116\116\112\115\58\47\47\99\97\116\97\108\111\103\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\115\101\97\114\99\104\47\105\116\101\109\115\63\99\97\116\101\103\111\114\121\61\65\108\108"
 .. "\38\99\114\101\97\116\111\114\84\97\114\103\101\116\73\100\61" .. _lI1lI .. "\38\99\114\101\97\116\111\114\84\121\112\101\61\85\115\101\114\38\108\105\109\105\116\61\49\48")
 if not t or _P199x._iy38(t._I1lI) ~= "\116\97\98\108\101" then return "\110\100" end
 if #t._I1lI == (95+-95) then return "\110\111", "\78\97\100\97\32\97\32\108\97\32\118\101\110\116\97" end
 local _Ill1l1 = (t.nextPageCursor and t.nextPageCursor ~= "") and "\43" or ""
 return "\115\105", #t._I1lI .. _Ill1l1 .. "\32\105\116\101\109\40\115\41\32\99\114\101\97\100\111\115", t._I1lI
 end)
 local _I1l1l1 = _I1lllII(_lIlIIl1, (175-168), "\73\110\118\101\110\116\97\114\105\111\32\112\250\98\108\105\99\111",
 "\104\116\116\112\115\58\47\47\119\119\119\46\114\111\98\108\111\120\46\99\111\109\47\117\115\101\114\115\47" .. _lI1lI .. "\47\105\110\118\101\110\116\111\114\121")
 comprobar(_lIlIll1, _I1l1l1, "\105\110\118\101\110\116\97\114\105\111", function()
 local t = getJSON("\104\116\116\112\115\58\47\47\105\110\118\101\110\116\111\114\121\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _lI1lI
 .. "\47\99\97\110\45\118\105\101\119\45\105\110\118\101\110\116\111\114\121")
 if not t or _P199x._iy38(t.canView) ~= "\98\111\111\108\101\97\110" then return "\110\100" end
 if t.canView then return "\115\105", "\86\105\115\105\98\108\101" end
 return "\110\111", "\80\114\105\118\97\100\111"
 end)
 local _llll1l1 = _I1lllII(_lIlIIl1, (90+-82), "\82\111\108\105\109\111\110\39\115",
 "\104\116\116\112\115\58\47\47\119\119\119\46\114\111\108\105\109\111\110\115\46\99\111\109\47\112\108\97\121\101\114\47" .. _lI1lI)
 marcar(_llll1l1, "\110\100", "\78\111\32\118\101\114\105\102\105\99\97\98\108\101\32\100\101\115\100\101\32\101\108\32\115\99\114\105\112\116")
 _IIlII.rolimons = { _llIlI = "\110\100", _I1IIl1 = "\65\80\73\32\112\250\98\108\105\99\97\32\114\101\116\105\114\97\100\97" }
 local _IIll1l1 = _IlllIIl(_P199x._8x6q(4/4), "\69\115\116\97\100\111\32\100\101\32\108\97\32\99\117\101\110\116\97",
 "\82\111\98\108\111\120\32\110\111\32\112\117\98\108\105\99\97\32\101\108\32\99\111\114\114\101\111\32\100\101\32\110\97\100\105\101\44\32\97\115\237\32\113\117\101\32\101\110\32\118\101\122\32\100\101\32\114\97\115\116\114\101\97\114\32"
 .. "\100\105\114\101\99\99\105\111\110\101\115\32\115\101\32\99\114\117\122\97\32\101\108\32\101\115\116\97\100\111\32\100\101\32\108\97\32\99\117\101\110\116\97\32\101\110\116\114\101\32\100\111\115\32\102\117\101\110\116\101\115\46")
 local _lIll1l1 = _I1lllII(_IIll1l1, bit32.bxor(169,0xAB), "\69\115\116\97\100\111")
 if _I1lI.Banned == "\83\237" then
 marcar(_lIll1l1, "\110\111", "\66\97\110\101\97\100\97")
 _lIll1l1.TextColor3 = C.bad
 elseif _I1lI.IsDeleted == true then
 marcar(_lIll1l1, "\110\111", "\66\111\114\114\97\100\97")
 _lIll1l1.TextColor3 = C.bad
 elseif _I1lI.IsDeleted == false then
 marcar(_lIll1l1, "\115\105", "\65\99\116\105\118\97")
 else
 marcar(_lIll1l1, "\110\100", "\78\111\32\99\111\109\112\114\111\98\97\98\108\101")
 end
 _IIlII._llIlI = { _I1IIl1 = _lIll1l1.Text }
 local _lI1l1 = _I1lllII(_IIll1l1, (492-489), "\73\110\115\105\103\110\105\97\32\118\101\114\105\102\105\99\97\100\97")
 local _II1l1 = (_I1lI.Verified == "\83\237")
 if _I1lI.VerifiedApi ~= nil and _I1lI.VerifiedApi ~= _II1l1 then
 marcar(_lI1l1, "\110\100", "\76\97\115\32\100\111\115\32\102\117\101\110\116\101\115\32\110\111\32\99\111\105\110\99\105\100\101\110")
 elseif _II1l1 then
 marcar(_lI1l1, "\115\105", "\83\237")
 else
 marcar(_lI1l1, "\110\111", "\78\111")
 end
 _IIlII.verificada = { _I1IIl1 = _lI1l1.Text }
 local _llI1l1 = _I1lllII(_IIll1l1, (407-403), "\78\111\109\98\114\101\32\118\105\115\105\98\108\101")
 if _P199x._yp3z(_I1lI.DisplayName):lower() ~= _P199x._yp3z(_I1lI.Username):lower() then
 marcar(_llI1l1, "\110\111", "\68\105\115\116\105\110\116\111\32\100\101\108\32\64\117\115\117\97\114\105\111")
 else
 marcar(_llI1l1, "\115\105", "\73\103\117\97\108\32\97\108\32\64\117\115\117\97\114\105\111")
 end
 local _IlI1l1 = _I1lllII(_IIll1l1, (70+-65), "\78\111\109\98\114\101\115\32\112\114\101\118\105\111\115")
 do
 local _lII1l1 = _lI1lI
 local function recibir(_l1llllI)
 if _lIlIll1 ~= _IIl1lI or _lII1l1 ~= _lI1lI then return end
 if _l1llllI == nil then
 marcar(_IlI1l1, "\110\100")
 elseif #_l1llllI == (427-427) then
 marcar(_IlI1l1, "\110\111", "\78\105\110\103\117\110\111")
 else
do local _530p,_gj22=pcall(function()return nil end);end
 marcar(_IlI1l1, "\115\105", #_l1llllI .. "\32\97\110\116\101\114\105\111\114\40\101\115\41")
 end
 _IIlII.nombres = { _I1lllIl = _l1llllI }
 end
 if _G.NXPlus and _P199x._iy38(_G.NXPlus.nombres) == "\102\117\110\99\116\105\111\110" then
 _G.NXPlus.nombres(_I1lI, recibir)
 else
 task.spawn(function() recibir(getNameHistory(_lI1lI)) end)
 end
 end
 if _lIIIl.adv() then
 local _III1l1 = _IlllIIl(bit32.bxor(169,0xAB), "\82\101\99\111\108\101\99\99\105\243\110\32\112\114\111\102\117\110\100\97",
 "\67\105\102\114\97\115\32\99\111\109\112\108\101\116\97\115\44\32\110\111\32\108\97\115\32\109\117\101\115\116\114\97\115\32\100\101\32\49\48\32\100\101\32\108\97\32\112\101\115\116\97\241\97\32\73\116\101\109\115\46")
 local _l1I1l1 = _I1lllII(_III1l1, bit32.bxor(169,0xAB), "\66\97\100\103\101\115\32\40\116\111\116\97\108\41")
 comprobar(_lIlIll1, _l1I1l1, "\98\97\100\103\101\115\84\111\116\97\108", function()
 local n = countPaged("\104\116\116\112\115\58\47\47\98\97\100\103\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47" .. _lI1lI .. "\47\98\97\100\103\101\115", (25+75))
 if n == nil then return "\110\100" end
 return "\115\105", _P199x._yp3z(n)
 end)
 local _I1I1l1 = _I1lllII(_III1l1, _P199x._8x6q(105/35), "\82\101\100\32\115\111\99\105\97\108")
 marcar(_I1I1l1, "\115\105", _P199x._opmi("\37\115\32\97\109\105\103\111\115\32\183\32\37\115\32\115\101\103\117\105\100\111\114\101\115\32\183\32\115\105\103\117\101\32\97\32\37\115",
 _P199x._yp3z(_I1lI.Friends or "\63"), _P199x._yp3z(_I1lI.Followers or "\63"),
 _P199x._yp3z(_I1lI.Following or "\63")))
 local _lllI1l1 = _I1lllII(_III1l1, (96+-92), "\69\120\112\101\114\105\101\110\99\105\97\32\109\225\115\32\118\105\115\105\116\97\100\97")
 comprobar(_lIlIll1, _lllI1l1, "\116\111\112\74\117\101\103\111", function()
 local t = _IIlII.juegos and _IIlII.juegos._I1lllIl
 if not t then
 local _II = getJSON("\104\116\116\112\115\58\47\47\103\97\109\101\115\46\114\111\98\108\111\120\46\99\111\109\47\118\50\47\117\115\101\114\115\47" .. _lI1lI
 .. "\47\103\97\109\101\115\63\97\99\99\101\115\115\70\105\108\116\101\114\61\80\117\98\108\105\99\38\108\105\109\105\116\61\53\48\38\115\111\114\116\79\114\100\101\114\61\68\101\115\99")
 t = _II and _P199x._iy38(_II._I1lI) == "\116\97\98\108\101" and _II._I1lI or nil
 end
 if not t or #t == bit32.bxor(171,0xAB) then return "\110\100" end
 local _IIlI1l1, visitas = nil, -bit32.bxor(170,0xAB)
 for _, g in ipairs(t._I1lI) do
 local v = _P199x._p02a(g.placeVisits) or bit32.bxor(171,0xAB)
 if v > visitas then _IIlI1l1, visitas = g._lll, v end
 end
 if not _IIlI1l1 then return "\110\100" end
 return "\115\105", _P199x._opmi("\37\115\32\40\37\100\32\118\105\115\105\116\97\115\41", _P199x._yp3z(_IIlI1l1), visitas)
 end)
 local _lIlI1l1 = _I1lllII(_III1l1, _P199x._8x6q(205/41), "\67\117\101\110\116\97\32\99\114\101\97\100\97")
 marcar(_lIlI1l1, "\115\105", _P199x._yp3z(_I1lI.Created or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 .. "\32\183\32" .. _P199x._yp3z(_I1lI.AccountAge or ""))
 end
 local _lllll1 = _IlllIIl((102+-99), "\73\110\102\111\114\109\101",
 "\86\117\101\108\99\97\32\97\32\116\101\120\116\111\32\116\111\100\111\32\108\111\32\113\117\101\32\104\97\121\32\101\110\32\101\115\116\97\32\112\101\115\116\97\241\97\44\32\121\97\32\114\101\115\117\101\108\116\111\46")
 local _lIlll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _lllll1)
 _lIlll.LayoutOrder = (416-414)
 _lIlll.Size = UDim2.new(_P199x._8x6q(97/97), (409-409), (133-133), _P199x._8x6q(3556/127))
 _lIlll.BackgroundColor3 = C._IlIll1
 _lIlll.Text = "\67\111\112\105\97\114\32\105\110\102\111\114\109\101"
 _lIlll.Font = Enum.Font.GothamBold; _lIlll.TextSize = bit32.bxor(167,0xAB); _lIlll.TextColor3 = C.onAccent
 _lIlll.BorderSizePixel = (428-428)
 Instance.new("\85\73\67\111\114\110\101\114", _lIlll).CornerRadius = UDim.new((201+-201), bit32.bxor(173,0xAB))
 themed(_lIlll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 themed(_lIlll, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 _lIlll.MouseButton1Click:Connect(function()
 local l = {}
 l[#l + (288+-287)] = "\72\85\69\76\76\65\32\80\85\66\76\73\67\65\32\183\32" .. _P199x._yp3z(_I1lI.Username)
 .. "\32\40\85\115\101\114\73\100\32" .. _P199x._yp3z(_lI1lI) .. "\41"
 l[#l + (362-361)] = "\80\101\114\102\105\108\58\32" .. _P199x._yp3z(_I1lI.ProfileUrl)
 l[#l + _P199x._8x6q(101/101)] = ""
 l[#l + _P199x._8x6q(168/168)] = "\80\82\69\83\69\78\67\73\65"
 for _, k in ipairs({ "\100\101\118\102\111\114\117\109", "\106\117\101\103\111\115", "\103\114\117\112\111\115", "\99\97\116\97\108\111\103\111",
 "\105\110\118\101\110\116\97\114\105\111", "\114\111\108\105\109\111\110\115" }) do
 local r = _IIlII[k]
 local v = r and (r._I1IIl1 or ({ si = "\80\114\101\115\101\110\116\101", no = "\78\111\32\101\110\99\111\110\116\114\97\100\111" })[r._llIlI])
 l[#l + (9-8)] = "\32\32" .. k .. "\58\32" .. _P199x._yp3z(v or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 end
 l[#l + _P199x._8x6q(168/168)] = ""
 l[#l + (144+-143)] = "\69\83\84\65\68\79\32\68\69\32\76\65\32\67\85\69\78\84\65"
 l[#l + _P199x._8x6q(33/33)] = "\32\32\101\115\116\97\100\111\58\32" .. _P199x._yp3z(_IIlII._llIlI and _IIlII._llIlI._I1IIl1 or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 l[#l + (411-410)] = "\32\32\105\110\115\105\103\110\105\97\32\118\101\114\105\102\105\99\97\100\97\58\32"
 .. _P199x._yp3z(_IIlII.verificada and _IIlII.verificada._I1IIl1 or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 local _Illll1 = _IIlII.nombres and _IIlII.nombres._I1lllIl
 l[#l + bit32.bxor(170,0xAB)] = "\32\32\110\111\109\98\114\101\115\32\112\114\101\118\105\111\115\58\32"
 .. (_Illll1 and ((#_Illll1 > _P199x._8x6q(0/182)) and _P199x._oy4i(_Illll1, "\44\32") or "\110\105\110\103\117\110\111") or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 if _IIlII.badgesTotal then
 l[#l + (300-299)] = ""
 l[#l + (146+-145)] = "\82\69\67\79\76\69\67\67\73\79\78"
 l[#l + (272+-271)] = "\32\32\98\97\100\103\101\115\58\32" .. _P199x._yp3z(_IIlII.badgesTotal._I1IIl1 or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 if _IIlII.topJuego then
 l[#l + _P199x._8x6q(148/148)] = "\32\32\101\120\112\101\114\105\101\110\99\105\97\32\116\111\112\58\32" .. _P199x._yp3z(_IIlII.topJuego._I1IIl1 or "\78\111\32\100\105\115\112\111\110\105\98\108\101")
 end
 end
 _llII(_P199x._oy4i(l, "\10"))
 _l1lIll.Text = "\73\110\102\111\114\109\101\32\99\111\112\105\97\100\111\46"
 _lIlll.Text = "\67\111\112\105\97\100\111"
 task.delay(1.2, function()
 if _lIlll and _lIlll.Parent then _lIlll.Text = "\67\111\112\105\97\114\32\105\110\102\111\114\109\101" end
 end)
 end)
 end
 local function alMostrar()
 local _lI1lI = _IllllIl and _IllllIl.UserId or nil
 if _lI1lI == _IlIIl1 and (_lI1lI ~= nil or _IlIIl1 ~= nil) then return end
 construir()
 end
 _G.NXOSINT = {
 _I1l1ll  = _I1l1ll,
 _IIll1ll = alMostrar,
 reset = function()
 _IIl1lI = _IIl1lI + bit32.bxor(170,0xAB)
 _IlIIl1 = nil
 if _I1l1ll.Visible then construir() end
 end,
 stop = function() _IIl1lI = _IIl1lI + (7+-6) end,
 }
end
createTab("\80\101\114\102\105\108", _llI1ll)
createTab("\69\115\116\97\100\237\115\116\105\99\97\115", _lII1ll)
createTab("\73\116\101\109\115", _l1I1ll)
createTab("\65\110\225\108\105\115\105\115", _lllI1ll)
createTab("\72\117\101\108\108\97", _G.NXOSINT._I1l1ll, _G.NXOSINT._IIll1ll)
createTab("\65\106\117\115\116\101\115", _lIlI1ll)
_G.NXAnalyze = function(_Illl)
 _Illl = _P199x._yp3z(_Illl or ""):gsub("\37\115", "")
do local _cfutst=1 while _cfutst>0 do if _cfutst==1 then
 if _Illl == "" then return end
 pcall(function()
 setHidden(false)
 _I1Illl.Text = _Illl
_cfutst=0 end end end
 showPage(_llI1ll)
 end)
 _lIlIll(_Illl)
end
_IIlll.onReady(function()
 local _lI1lI = _l.UserId
 if not _IIlll.isLicensed(_lI1lI) then
 showLicenseDenied()
 end
 local _llllIlll = _IIlll.getWarning(_lI1lI)
 if _llllIlll then
 task.delay(1.2, function() showNXWarning(_llllIlll) end)
 end
 if _IIlll.isAdmin(_lI1lI) then
 buildAdminPanel()
 end
end)
local _llllll1, dragEndedConn
local function stopDrag()
 if _llllll1 then _llllll1:Disconnect(); _llllll1 = nil end
 if dragEndedConn then dragEndedConn:Disconnect(); dragEndedConn = nil end
end
track(_IIllll.InputBegan:Connect(function(_Illl)
 local t = _Illl.UserInputType
 if t ~= Enum.UserInputType.MouseButton1 and t ~= Enum.UserInputType.Touch then return end
 local _Illlll1 = _Illl.Position
 local _lIllll1 = _lllll.Position
 stopDrag()
 _llllIlI.setDragSquish(true)
 _llllll1 = UserInputService.InputChanged:Connect(function(i)
 if i.UserInputType == Enum.UserInputType.MouseMovement
 or i.UserInputType == Enum.UserInputType.Touch then
 local d = i.Position - _Illlll1
 _lllll.Position = UDim2.new(
 _lIllll1.X.Scale, _lIllll1.X.Offset + d.X,
 _lIllll1.Y.Scale, _lIllll1.Y.Offset + d.Y
 )
 end
 end)
 dragEndedConn = _Illl.Changed:Connect(function()
 if _Illl.UserInputState == Enum.UserInputState.End then
 stopDrag(); _llllIlI.setDragSquish(false)
 end
 end)
end))
local _IIllll1 = Instance.new("\84\101\120\116\66\117\116\116\111\110", _lllll)
_IIllll1.Name = "\82\101\115\105\122\101\71\114\105\112"
_IIllll1.Size = UDim2.new(_P199x._8x6q(0/136), (230+-212), (185+-185), _P199x._8x6q(3024/168))
_IIllll1.Position = UDim2.new((190-189), -(155+-135), (39+-38), -_P199x._8x6q(1360/68))
_IIllll1.BackgroundColor3 = C._IlIll1
_IIllll1.BackgroundTransparency = 0.25
_IIllll1.Text = "\10529"
_IIllll1.Font = Enum.Font.GothamBold
_IIllll1.TextSize = (147+-133)
_IIllll1.TextColor3 = C.onAccent
_IIllll1.AutoButtonColor = false
_IIllll1.BorderSizePixel = (279+-279)
_IIllll1.ZIndex = (266+-261)
Instance.new("\85\73\67\111\114\110\101\114", _IIllll1).CornerRadius = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(175,0xAB))
themed(_IIllll1, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
themed(_IIllll1, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
local _l1llll1, resEndedConn
local function stopResize()
 if _l1llll1 then _l1llll1:Disconnect(); _l1llll1 = nil end
 if resEndedConn then resEndedConn:Disconnect(); resEndedConn = nil end
end
track(_IIllll1.InputBegan:Connect(function(_Illl)
 local t = _Illl.UserInputType
 if t ~= Enum.UserInputType.MouseButton1 and t ~= Enum.UserInputType.Touch then return end
 local _Illlll1 = _Illl.Position
 local _I1llll1 = _lllll.AbsoluteSize
 stopResize()
 _l1llll1 = UserInputService.InputChanged:Connect(function(i)
 if i.UserInputType == Enum.UserInputType.MouseMovement
 or i.UserInputType == Enum.UserInputType.Touch then
 local d = i.Position - _Illlll1
 local _lllllll1 = math._lllIIl(_lIlIll, _I1llll1.X + d.X)
 local _IIlllll1 = math._lllIIl(MIN_H, _I1llll1.Y + d.Y)
 _lllll.Size = UDim2.new(_P199x._8x6q(0/35), _lllllll1, (173+-173), _IIlllll1)
 end
 end)
 resEndedConn = _Illl.Changed:Connect(function()
 if _Illl.UserInputState == Enum.UserInputState.End then stopResize() end
 end)
end))
if not _III then
 _l1lIll.Text = "\65\118\105\115\111\58\32" .. _lII .. "\32\110\111\32\101\120\112\111\110\101\32\39\114\101\113\117\101\115\116\39\59\32\115\101\32\117\115\97\114\225\32\103\97\109\101\58\72\116\116\112\71\101\116\46"
end
do
 local _lIlllll1 = {
 URL     = "\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\100\114\101\101\110\110\120\47\110\120\45\109\101\115\115\97\103\101\115\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\109\101\115\115\97\103\101\115\46\106\115\111\110",
 REFRESH = bit32.bxor(211,0xAB),
 RETRY   = _P199x._8x6q(2780/139),
 WIDTH   = (702-372),
 DEFAULT_DURATION = (134+-126),
 MAX_VISIBLE = _P199x._8x6q(396/99),
 GAP = 0.18,
 }
 local _lIIll1 = "\78\88\95\109\115\103\115\95\115\101\101\110\46\106\115\111\110"
 local _lllI1I = {}
 if _ll then
 pcall(function()
 if isfile(_lIIll1) then
 local d = HttpService:JSONDecode(readfile(_lIIll1))
 if _P199x._iy38(d) == "\116\97\98\108\101" then _lllI1I = d end
 end
 end)
 end
 local function markSeen(_lllI1)
 if not _lllI1 then return end
 _lllI1I[_P199x._yp3z(_lllI1)] = true
 if _ll then
 pcall(function() writefile(_lIIll1, HttpService:JSONEncode(_lllI1I)) end)
 end
 end
 local function typeRole(t)
 t = _P199x._yp3z(t or "\105\110\102\111"):lower()
 if t == "\119\97\114\110" or t == "\119\97\114\110\105\110\103" then return "\119\97\114\110" end
 if t == "\101\114\114\111\114" or t == "\98\97\100" or t == "\100\97\110\103\101\114" then return "\98\97\100" end
 if t == "\115\117\99\99\101\115\115" or t == "\111\107" or t == "\103\111\111\100" then return "\103\111\111\100" end
 return "\97\99\99\101\110\116"
 end
 local function typeColor(t) return C[typeRole(t)] or C._IlIll1 end
 local function typeEmoji(t)
 t = _P199x._yp3z(t or "\105\110\102\111"):lower()
 if t == "\119\97\114\110" or t == "\119\97\114\110\105\110\103" then return "" end
 if t == "\101\114\114\111\114" or t == "\98\97\100" or t == "\100\97\110\103\101\114" then return "" end
 if t == "\115\117\99\99\101\115\115" or t == "\111\107" or t == "\103\111\111\100" then return "" end
 return ""
 end
 local _l1I1 = game:GetService("\67\111\110\116\101\110\116\80\114\111\118\105\100\101\114")
 local function normImg(v)
 if v == nil then return nil end
 if _P199x._iy38(v) == "\110\117\109\98\101\114" then v = "\114\98\120\97\115\115\101\116\105\100\58\47\47" .. v end
 v = _P199x._yp3z(v)
 if v == "" or v == "\114\98\120\97\115\115\101\116\105\100\58\47\47\48" then return nil end
 local d = v:match("\94\40\37\100\43\41\36"); if d then v = "\114\98\120\97\115\115\101\116\105\100\58\47\47" .. d end
 return (v:match("\94\114\98\120\97\115\115\101\116\105\100\58\47\47\37\100\43\36") or v:match("\94\114\98\120\116\104\117\109\98") or v:match("\94\104\116\116\112")) and v or nil
 end
 local _lIlIl1 = Instance.new("\70\114\97\109\101")
 _lIlIl1.Name = "\78\88\66\114\111\97\100\99\97\115\116"
 _lIlIl1.AnchorPoint = Vector2.new((222+-221), _P199x._8x6q(0/176))
 _lIlIl1.Position = UDim2.new(bit32.bxor(170,0xAB), -(421-405), bit32.bxor(171,0xAB), (125+-109))
 _lIlIl1.Size = UDim2.new((297+-297), _lIlllll1.WIDTH, (498-497), -bit32.bxor(139,0xAB))
 _lIlIl1.BackgroundTransparency = (424-423)
 _lIlIl1.ClipsDescendants = false
 _lIlIl1.ZIndex = _P199x._8x6q(49800/166)
 _lIlIl1.Parent = _lllIlI
 local _IIIll1 = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _lIlIl1)
 _IIIll1.FillDirection = Enum.FillDirection.Vertical
 _IIIll1.HorizontalAlignment = Enum.HorizontalAlignment.Right
 _IIIll1.VerticalAlignment = Enum.VerticalAlignment.Top
 _IIIll1.SortOrder = Enum.SortOrder.LayoutOrder
 _IIIll1.Padding = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(1960/196))
 local _llIIll1 = {}
 local _IIIl = (225+-225)
 onRepaint(function()
 for _, ti in ipairs(_llIIll1) do
 local _IlIIll1 = typeColor(ti.type)
 for _, el in ipairs(ti.accentEls) do
 pcall(function() el._lII[el._III] = _IlIIll1 end)
 end
 end
 end)
 local function reflowLimit()
 while #_llIIll1 > _lIlllll1.MAX_VISIBLE do
 local _lllII = _llIIll1[bit32.bxor(170,0xAB)]
 if _lllII and _lllII.dismiss then _lllII.dismiss() else _P199x._otn1(_llIIll1, bit32.bxor(170,0xAB)) end
 end
 end
 local function showToast(_IIlI)
 _IIlI = _IIlI or {}
 local _lIIIll1 = _IIlI.type or "\105\110\102\111"
 local _IlIIll1   = typeColor(_lIIIll1)
 _IIIl = _IIIl + _P199x._8x6q(37/37)
 local _IIIIll1 = Instance.new("\70\114\97\109\101")
 _IIIIll1.Name = "\83\108\111\116"
 _IIIIll1.BackgroundTransparency = bit32.bxor(170,0xAB)
 _IIIIll1.Size = UDim2.new((214+-214), _lIlllll1.WIDTH, (235-235), _P199x._8x6q(0/144))
 _IIIIll1.AutomaticSize = Enum.AutomaticSize.Y
 _IIIIll1.ClipsDescendants = false
 _IIIIll1.LayoutOrder = -_IIIl
 _IIIIll1.ZIndex = _P199x._8x6q(39732/132)
 _IIIIll1.Parent = _lIlIl1
 local _IlI = Instance.new("\67\97\110\118\97\115\71\114\111\117\112")
 _IlI.Name = "\67\97\114\100"
 _IlI.Size = UDim2.new(_P199x._8x6q(122/122), _P199x._8x6q(0/138), (474-474), (180+-180))
 _IlI.AutomaticSize = Enum.AutomaticSize.Y
 _IlI.BackgroundColor3 = C._IlI
 _IlI.BackgroundTransparency = 0.02
 _IlI.BorderSizePixel = _P199x._8x6q(0/194)
 _IlI.GroupTransparency = _IIllIlI.enabled and _P199x._8x6q(53/53) or (91-91)
 _IlI.Position = _IIllIlI.enabled and UDim2.new((67-67), _lIlllll1.WIDTH, bit32.bxor(171,0xAB), (10+-10)) or UDim2.new((133-133), bit32.bxor(171,0xAB), (193-193), (169+-169))
 _IlI.ZIndex = (225+76)
 _IlI.Parent = _IIIIll1
 themed(_IlI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 Instance.new("\85\73\67\111\114\110\101\114", _IlI).CornerRadius = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(864/72))
 local _Illlll = Instance.new("\85\73\83\116\114\111\107\101", _IlI)
 _Illlll.Color = C._lIlI1; _Illlll.Transparency = 0.05; _Illlll.Thickness = bit32.bxor(170,0xAB)
 themed(_Illlll, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _IIIll1 = Instance.new("\70\114\97\109\101", _IlI)
 _IIIll1.Size = UDim2.new((1+-1), (230-226), (292-291), (289+-289))
 _IIIll1.BackgroundColor3 = _IlIIll1
 _IIIll1.BorderSizePixel = (344-344)
 _IIIll1.ZIndex = _P199x._8x6q(53328/176)
 Instance.new("\85\73\67\111\114\110\101\114", _IIIll1).CornerRadius = UDim.new((383-383), (114-110))
 local _l1IIll1 = Instance.new("\84\101\120\116\66\117\116\116\111\110", _IlI)
 _l1IIll1.AnchorPoint = Vector2.new((252+-251), (192+-192))
 _l1IIll1.Position = UDim2.new(_P199x._8x6q(43/43), -bit32.bxor(163,0xAB), (313-313), _P199x._8x6q(784/98))
 _l1IIll1.Size = UDim2.new(_P199x._8x6q(0/190), bit32.bxor(191,0xAB), bit32.bxor(171,0xAB), bit32.bxor(191,0xAB))
 _l1IIll1.BackgroundTransparency = bit32.bxor(170,0xAB)
 _l1IIll1.Text = "\10005"
 _l1IIll1.Font = Enum.Font.GothamBold
 _l1IIll1.TextSize = (398-384)
 _l1IIll1.TextColor3 = C.subtext
 _l1IIll1.AutoButtonColor = false
 _l1IIll1.ZIndex = bit32.bxor(410,0xAB)
 themed(_l1IIll1, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _IIllIll = Instance.new("\70\114\97\109\101", _IlI)
 _IIllIll.BackgroundTransparency = _P199x._8x6q(156/156)
 _IIllIll.Size = UDim2.new((485-484), (238+-238), (6+-6), bit32.bxor(171,0xAB))
 _IIllIll.AutomaticSize = Enum.AutomaticSize.Y
 _IIllIll.ZIndex = (408-106)
 local _I1IIll1 = Instance.new("\85\73\80\97\100\100\105\110\103", _IIllIll)
 _I1IIll1.PaddingLeft = UDim.new((164-164), _P199x._8x6q(2880/180))
 _I1IIll1.PaddingRight = UDim.new((168-168), _P199x._8x6q(3120/104))
 _I1IIll1.PaddingTop = UDim.new((297-297), (277-265))
 _I1IIll1.PaddingBottom = UDim.new(_P199x._8x6q(0/124), bit32.bxor(167,0xAB))
 local _lllIIll1 = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _IIllIll)
 _lllIIll1.FillDirection = Enum.FillDirection.Vertical
 _lllIIll1.SortOrder = Enum.SortOrder.LayoutOrder
 _lllIIll1.Padding = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(1050/175))
 local _lllIlIl = Instance.new("\70\114\97\109\101", _IIllIll)
 _lllIlIl.BackgroundTransparency = _P199x._8x6q(95/95)
 _lllIlIl.Size = UDim2.new((91-90), bit32.bxor(171,0xAB), (217+-217), _P199x._8x6q(2712/113))
 _lllIlIl.LayoutOrder = (291+-290)
 _lllIlIl.ZIndex = (627-325)
 local _IIlIIll1 = Instance.new("\70\114\97\109\101", _lllIlIl)
 _IIlIIll1.Size = UDim2.new((28+-28), _P199x._8x6q(120/5), (26+-26), bit32.bxor(179,0xAB))
 _IIlIIll1.BackgroundColor3 = _IlIIll1
 _IIlIIll1.BackgroundTransparency = 0.82
 _IIlIIll1.BorderSizePixel = (264+-264)
 _IIlIIll1.ZIndex = (702-400)
 Instance.new("\85\73\67\111\114\110\101\114", _IIlIIll1).CornerRadius = UDim.new(bit32.bxor(171,0xAB), (302-295))
 local _lIlIIll1 = Instance.new("\84\101\120\116\76\97\98\101\108", _IIlIIll1)
 _lIlIIll1.BackgroundTransparency = (25+-24)
 _lIlIIll1.Size = UDim2.new(_P199x._8x6q(96/96), _P199x._8x6q(0/49), (110+-109), bit32.bxor(171,0xAB))
 _lIlIIll1.Text = typeEmoji(_lIIIll1)
 _lIlIIll1.Font = Enum.Font.GothamBold
 _lIlIIll1.TextSize = bit32.bxor(165,0xAB)
 _lIlIIll1.ZIndex = bit32.bxor(388,0xAB)
 local _lllll = Instance.new("\73\109\97\103\101\76\97\98\101\108", _IIlIIll1)
 _lllll.BackgroundTransparency = (404-403)
 _lllll.Size = UDim2.new(_P199x._8x6q(78/78), (283+-283), bit32.bxor(170,0xAB), (105+-105))
 _lllll.Visible = false
 _lllll.ScaleType = Enum.ScaleType.Fit
 _lllll.ZIndex = bit32.bxor(388,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _lllll).CornerRadius = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(172,0xAB))
 local _I1llll = Instance.new("\84\101\120\116\76\97\98\101\108", _lllIlIl)
 _I1llll.BackgroundTransparency = _P199x._8x6q(20/20)
 _I1llll.Position = UDim2.new((136+-136), _P199x._8x6q(4096/128), (185+-185), bit32.bxor(171,0xAB))
 _I1llll.Size = UDim2.new((316-315), -(191+-159), (98+-97), bit32.bxor(171,0xAB))
 _I1llll.Text = _P199x._yp3z(_IIlI._I1llll or "\65\118\105\115\111")
 _I1llll.Font = Enum.Font.GothamBold
 _I1llll.TextSize = (102+-87)
 _I1llll.TextColor3 = C._lIl
 _I1llll.TextXAlignment = Enum.TextXAlignment.Left
 _I1llll.TextYAlignment = Enum.TextYAlignment.Center
 _I1llll.TextTruncate = Enum.TextTruncate.AtEnd
 _I1llll.ZIndex = (46+256)
 themed(_I1llll, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _Ill = Instance.new("\84\101\120\116\76\97\98\101\108", _IIllIll)
 _Ill.BackgroundTransparency = bit32.bxor(170,0xAB)
 _Ill.Size = UDim2.new(_P199x._8x6q(4/4), (176+-176), (436-436), (453-453))
 _Ill.AutomaticSize = Enum.AutomaticSize.Y
 _Ill.Text = _P199x._yp3z(_IIlI._Ill or "")
 _Ill.Font = Enum.Font.Gotham
 _Ill.TextSize = (57+-44)
 _Ill.TextColor3 = C.subtext
 _Ill.TextWrapped = true
 _Ill.TextXAlignment = Enum.TextXAlignment.Left
 _Ill.TextYAlignment = Enum.TextYAlignment.Top
 _Ill.LayoutOrder = (110+-108)
 _Ill.ZIndex = _P199x._8x6q(906/3)
 themed(_Ill, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 if _Ill.Text == "" then _Ill.Visible = false end
 local _llIll1 = normImg(_IIlI.image)
 if _llIll1 then
 task.spawn(function()
 local _IlIll1 = Instance.new("\73\109\97\103\101\76\97\98\101\108"); _IlIll1.Image = _llIll1
 local _l1 = pcall(function() _l1I1:PreloadAsync({ _IlIll1 }) end)
 _IlIll1:Destroy()
 if _l1 and _lllll.Parent then
 _lllll.Image = _llIll1; _lllll.Visible = true; _lIlIIll1.Visible = false
 end
 end)
 end
 local _lllIll1 = _P199x._p02a(_IIlI._lllIll1) or _lIlllll1.DEFAULT_DURATION
 local _IllIll1
 if _lllIll1 and _lllIll1 > (447-447) then
 local _lIlIll1 = Instance.new("\70\114\97\109\101", _IIllIll)
 _lIlIll1.Size = UDim2.new(_P199x._8x6q(181/181), bit32.bxor(171,0xAB), (393-393), (92+-89))
 _lIlIll1.BackgroundColor3 = C.neutral
 _lIlIll1.BackgroundTransparency = 0.3
 _lIlIll1.BorderSizePixel = (467-467)
 _lIlIll1.LayoutOrder = bit32.bxor(168,0xAB)
do local _t5ri=math.random(1,999)*0;if _xhga>1 then print("")end end
 _lIlIll1.ZIndex = bit32.bxor(389,0xAB)
 themed(_lIlIll1, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\110\101\117\116\114\97\108")
 Instance.new("\85\73\67\111\114\110\101\114", _lIlIll1).CornerRadius = UDim.new(bit32.bxor(170,0xAB), (473-473))
 _IllIll1 = Instance.new("\70\114\97\109\101", _lIlIll1)
 _IllIll1.Size = UDim2.new((181+-180), _P199x._8x6q(0/75), bit32.bxor(170,0xAB), _P199x._8x6q(0/121))
 _IllIll1.BackgroundColor3 = _IlIIll1
 _IllIll1.BorderSizePixel = (438-438)
 _IllIll1.ZIndex = (753-450)
 Instance.new("\85\73\67\111\114\110\101\114", _IllIll1).CornerRadius = UDim.new(bit32.bxor(170,0xAB), (405-405))
 end
 local _lIl = {
 _IIIIll1 = _IIIIll1, _IlI = _IlI, type = _lIIIll1, _I1lll = false, _dead = false,
 accentEls = {
 { _lII = _IIIll1, _III = "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51" },
 { _lII = _IIlIIll1, _III = "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51" },
 },
 }
 if _IllIll1 then _P199x._l50o(_lIl.accentEls, { _lII = _IllIll1, _III = "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51" }) end
 local function dismiss()
 if _lIl._dead then return end
 _lIl._dead = true
 for i, v in ipairs(_llIIll1) do if v == _lIl then _P199x._otn1(_llIIll1, i) break end end
 motionTween(_IlI, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
 { GroupTransparency = (164-163), Position = UDim2.new((33-33), _lIlllll1.WIDTH, _P199x._8x6q(0/99), (68-68)) }, function()
 if _IIIIll1 and _IIIIll1.Parent then _IIIIll1:Destroy() end
 end)
 end
 _lIl.dismiss = dismiss
 _l1IIll1.MouseButton1Click:Connect(dismiss)
 _IlI.MouseEnter:Connect(function() _lIl._I1lll = true end)
 _IlI.MouseLeave:Connect(function() _lIl._I1lll = false end)
 _P199x._l50o(_llIIll1, _lIl)
 reflowLimit()
 motionTween(_IlI, TweenInfo.new(0.34, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
 { GroupTransparency = bit32.bxor(171,0xAB), Position = UDim2.new(_P199x._8x6q(0/99), (275-275), _P199x._8x6q(0/120), (236-236)) })
 if _lllIll1 and _lllIll1 > (211-211) then
 task.spawn(function()
 local _llIl1 = (37-37)
 while _llIl1 < _lllIll1 and not _lIl._dead and _IIIIll1.Parent do
 task.wait(0.05)
 if not _lIl._I1lll then
 _llIl1 = _llIl1 + 0.05
 if _IllIll1 then
 local _IIlIll1 = _P199x._5x5j(_P199x._8x6q(146/146) - (_llIl1 / _lllIll1), (368-368), bit32.bxor(170,0xAB))
 _IllIll1.Size = UDim2.new(_IIlIll1, _P199x._8x6q(0/107), bit32.bxor(170,0xAB), _P199x._8x6q(0/159))
 end
 end
 end
 if not _lIl._dead then dismiss() end
 end)
 end
 return _lIl
 end
 local function showRobloxModal(_IIlI)
 _IIlI = _IIlI or {}
 local _l1lIll1 = _lllIlI:FindFirstChild("\78\88\66\114\111\97\100\99\97\115\116\77\111\100\97\108")
 if _l1lIll1 then _l1lIll1:Destroy() end
 local _I1lIll1 = Instance.new("\70\114\97\109\101")
 _I1lIll1.Name = "\78\88\66\114\111\97\100\99\97\115\116\77\111\100\97\108"
 _I1lIll1.Size = UDim2.new((20-19), (129-129), bit32.bxor(170,0xAB), (88+-88))
 _I1lIll1.Position = UDim2.new(bit32.bxor(171,0xAB), bit32.bxor(171,0xAB), _P199x._8x6q(0/55), bit32.bxor(171,0xAB))
 _I1lIll1.BackgroundColor3 = Color3.fromRGB(bit32.bxor(171,0xAB), (36-36), (107-107))
 _I1lIll1.BackgroundTransparency = _IIllIlI.enabled and (277+-276) or 0.45
 _I1lIll1.BorderSizePixel = _P199x._8x6q(0/187)
 _I1lIll1.Active = true
 _I1lIll1.ZIndex = (170+230)
 _I1lIll1.Parent = _lllIlI
 local _llllIll1 = Instance.new("\67\97\110\118\97\115\71\114\111\117\112")
 _llllIll1.Name = "\80\97\110\101\108"
 _llllIll1.AnchorPoint = Vector2.new(0.5, 0.5)
 _llllIll1.Position = UDim2.new(0.5, _P199x._8x6q(0/18), 0.5, _P199x._8x6q(0/60))
 _llllIll1.Size = UDim2.new((494-494), (141+279), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB))
 _llllIll1.AutomaticSize = Enum.AutomaticSize.Y
 _llllIll1.BackgroundColor3 = Color3.fromRGB(_P199x._8x6q(4560/114), (260-218), bit32.bxor(152,0xAB))
 _llllIll1.BackgroundTransparency = 0.02
 _llllIll1.BorderSizePixel = (189+-189)
 _llllIll1.GroupTransparency = _IIllIlI.enabled and (96-95) or (16-16)
 _llllIll1.ZIndex = (826-425)
 _llllIll1.Parent = _I1lIll1
 Instance.new("\85\73\67\111\114\110\101\114", _llllIll1).CornerRadius = UDim.new(bit32.bxor(171,0xAB), (115+-105))
 local _IllIl1 = Instance.new("\85\73\83\116\114\111\107\101", _llllIll1)
 _IllIl1.Color = Color3.fromRGB(_P199x._8x6q(13720/196), (74-1), _P199x._8x6q(7395/87)); _IllIl1.Transparency = 0.4; _IllIl1.Thickness = (62-61)
 local _I1llIl = Instance.new("\85\73\83\99\97\108\101", _llllIll1)
 _I1llIl.Scale = _IIllIlI.enabled and 0.9 or (361-360)
 local _lIll = Instance.new("\85\73\80\97\100\100\105\110\103", _llllIll1)
 _lIll.PaddingTop = UDim.new(_P199x._8x6q(0/74), (258-236)); _lIll.PaddingBottom = UDim.new((40+-40), bit32.bxor(185,0xAB))
 _lIll.PaddingLeft = UDim.new((166+-166), (320-294)); _lIll.PaddingRight = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(1846/71))
 local _IIllIll1 = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _llllIll1)
 _IIllIll1.FillDirection = Enum.FillDirection.Vertical
 _IIllIll1.HorizontalAlignment = Enum.HorizontalAlignment.Center
 _IIllIll1.SortOrder = Enum.SortOrder.LayoutOrder
 _IIllIll1.Padding = UDim.new((121+-121), bit32.bxor(165,0xAB))
 local _I1llll = Instance.new("\84\101\120\116\76\97\98\101\108", _llllIll1)
 _I1llll.BackgroundTransparency = _P199x._8x6q(180/180)
 _I1llll.Size = UDim2.new((412-411), _P199x._8x6q(0/133), bit32.bxor(171,0xAB), (117-91))
 _I1llll.Text = _P199x._yp3z(_IIlI._I1llll or "\69\114\114\111\114\32\97\108\32\117\110\105\114\115\101")
 _I1llll.Font = Enum.Font.GothamBold
 _I1llll.TextSize = (427-406)
 _I1llll.TextColor3 = Color3.fromRGB((49+206), _P199x._8x6q(29070/114), (413-158))
 _I1llll.TextXAlignment = Enum.TextXAlignment.Center
 _I1llll.LayoutOrder = (239+-238)
 _I1llll.ZIndex = _P199x._8x6q(24924/62)
 local _I1IIIl = Instance.new("\70\114\97\109\101", _llllIll1)
 _I1IIIl.Size = UDim2.new((98+-97), -_P199x._8x6q(970/97), _P199x._8x6q(0/45), _P199x._8x6q(183/183))
 _I1IIIl.BackgroundColor3 = Color3.fromRGB(bit32.bxor(84,0xAB), bit32.bxor(84,0xAB), _P199x._8x6q(41310/162))
 _I1IIIl.BackgroundTransparency = 0.82
 _I1IIIl.BorderSizePixel = bit32.bxor(171,0xAB)
 _I1IIIl.LayoutOrder = _P199x._8x6q(316/158)
 _I1IIIl.ZIndex = bit32.bxor(313,0xAB)
 local _lIlIIl = _P199x._yp3z(_IIlI._Ill or "")
 local _IlIl = _P199x._p02a(_IIlI.errorCode)
 if _IlIl then _lIlIIl = _lIlIIl .. "\10\40\67\243\100\105\103\111\32\100\101\32\101\114\114\111\114\58\32" .. _P199x._yp3z(_IlIl) .. "\41" end
 local _Ill = Instance.new("\84\101\120\116\76\97\98\101\108", _llllIll1)
 _Ill.BackgroundTransparency = (345-344)
 _Ill.Size = UDim2.new(bit32.bxor(170,0xAB), bit32.bxor(171,0xAB), (129+-129), bit32.bxor(171,0xAB))
 _Ill.AutomaticSize = Enum.AutomaticSize.Y
 _Ill.Text = _lIlIIl
 _Ill.Font = Enum.Font.Gotham
 _Ill.TextSize = _P199x._8x6q(2715/181)
 _Ill.TextColor3 = Color3.fromRGB(_P199x._8x6q(38475/171), (6+220), _P199x._8x6q(38976/168))
 _Ill.TextWrapped = true
 _Ill.TextXAlignment = Enum.TextXAlignment.Center
 _Ill.TextYAlignment = Enum.TextYAlignment.Top
 _Ill.LineHeight = 1.1
 _Ill.LayoutOrder = bit32.bxor(168,0xAB)
 _Ill.ZIndex = (255+147)
 local _lIlll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _llllIll1)
 _lIlll.Size = UDim2.new(_P199x._8x6q(125/125), (182+-182), (124-124), bit32.bxor(129,0xAB))
 _lIlll.BackgroundColor3 = Color3.fromRGB((717-489), bit32.bxor(78,0xAB), (215+19))
 _lIlll.AutoButtonColor = true
 _lIlll.Text = _P199x._yp3z(_IIlI.button or "\83\97\108\105\114")
 _lIlll.Font = Enum.Font.GothamMedium
 _lIlll.TextSize = _P199x._8x6q(1376/86)
 _lIlll.TextColor3 = Color3.fromRGB(_P199x._8x6q(7080/118), bit32.bxor(149,0xAB), _P199x._8x6q(12110/173))
 _lIlll.LayoutOrder = bit32.bxor(175,0xAB)
 _lIlll.ZIndex = bit32.bxor(313,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _lIlll).CornerRadius = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(1360/170))
 local _lIllIll1 = false
 local function dismiss()
 if _lIllIll1 then return end
 _lIllIll1 = true
 motionTween(_I1lIll1, TweenInfo.new(0.18), { BackgroundTransparency = bit32.bxor(170,0xAB) })
 motionTween(_I1llIl, TweenInfo.new(0.18), { Scale = 0.9 })
 motionTween(_llllIll1, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
 { GroupTransparency = (292+-291) }, function()
 if _I1lIll1 and _I1lIll1.Parent then _I1lIll1:Destroy() end
 end)
 end
 _lIlll.MouseButton1Click:Connect(function()
 dismiss()
 if _P199x._iy38(_IIlI.onButton) == "\102\117\110\99\116\105\111\110" then pcall(_IIlI.onButton) end
 end)
 motionTween(_I1lIll1, TweenInfo.new(0.18), { BackgroundTransparency = 0.45 })
 motionTween(_llllIll1, TweenInfo.new(0.26, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { GroupTransparency = (49-49) })
 motionTween(_I1llIl, TweenInfo.new(0.26, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = (35+-34) })
 local _lllIll1 = _P199x._p02a(_IIlI._lllIll1) or bit32.bxor(171,0xAB)
 if _lllIll1 > bit32.bxor(171,0xAB) then
 task.delay(_lllIll1, function() if not _lIllIll1 then dismiss() end end)
 end
 return { dismiss = dismiss }
 end
 local _llI1 = "\78\88\95\108\111\99\107\46\106\115\111\110"
 local function getLock()
 local _lllllI
 local function consider(d)
 if _P199x._iy38(d) == "\116\97\98\108\101" then
 local u = _P199x._p02a(d["\117\110\116\105\108"])
 if u and u > os.time() and (not _lllllI or u > _P199x._p02a(_lllllI["\117\110\116\105\108"])) then _lllllI = d end
 end
 end
 if _P199x._iy38(_G.NX_LOCK) == "\116\97\98\108\101" then consider(_G.NX_LOCK) end
 if _ll then
 pcall(function()
 if isfile(_llI1) then consider(HttpService:JSONDecode(readfile(_llI1))) end
 end)
 end
 return _lllllI
 end
 local function setLock(d)
 _G.NX_LOCK = d
 if _ll then pcall(function() writefile(_llI1, HttpService:JSONEncode(d)) end) end
 end
 local function clearLock()
 _G.NX_LOCK = nil
 if _ll then pcall(function() writefile(_llI1, HttpService:JSONEncode({ ["\117\110\116\105\108"] = (121-121) })) end) end
 end
 local function fmtRemaining(_IlI1)
 _IlI1 = math._lllIIl(_P199x._8x6q(0/159), _P199x._8x6q(_IlI1))
 local m = _P199x._8x6q(_IlI1 / bit32.bxor(151,0xAB))
 local s = _IlI1 % _P199x._8x6q(5520/92)
 if m > _P199x._8x6q(0/167) then return _P199x._opmi("\37\100\32\109\105\110\32\37\100\32\115\101\103", m, s) end
 return _P199x._opmi("\37\100\32\115\101\103", s)
 end
 local _lllI1 = false
 local function closeTool()
 if _lllI1 then return end
 _lllI1 = true
 pcall(function() _lllIlI.Enabled = false end)
 task.delay(0.2, function() pcall(function() _lllIlI:Destroy() end) end)
 end
 local function showLockPopup(d)
 end
 local function triggerLockout(_IlI1, _lIlI1)
 end
 local function lockSecondsOf(m)
 local s = _P199x._p02a(m.lock) or _P199x._p02a(m.lockSeconds)
 if not s and _P199x._p02a(m.lockMinutes) then s = _P199x._p02a(m.lockMinutes) * (239+-179) end
 return _P199x._p02a(s) or bit32.bxor(171,0xAB)
 end
 local _IllI1 = {}
 local function eligible(m)
 if _P199x._iy38(m) ~= "\116\97\98\108\101" then return false end
 if m.enabled == false then return false end
 local _IIlI1 = _P199x._p02a(m.expires)
 if _IIlI1 and _IIlI1 > _P199x._8x6q(0/45) and os.time() > _IIlI1 then return false end
 local _l1lI1 = m.targets
 if _P199x._iy38(_l1lI1) == "\116\97\98\108\101" and #_l1lI1 > _P199x._8x6q(0/147) then
 local _I1lI1, _l1 = _l.UserId, false
 for _, u in ipairs(_l1lI1) do if _P199x._p02a(u) == _I1lI1 then _l1 = true break end end
 if not _l1 then return false end
 end
do local _cfovsa=1 while _cfovsa>0 do if _cfovsa==1 then
 local _lllI1 = m._lllI1 and _P199x._yp3z(m._lllI1) or nil
 if _lllI1 then
 if _IllI1[_lllI1] then return false end
 if m.once and _lllI1I[_lllI1] then return false end
_cfovsa=0 end end end
 end
 return true
 end
 local function consume(_lllIl)
 local _lIlI = _lllIl
 if _P199x._iy38(_lllIl) == "\116\97\98\108\101" and _lllIl.messages then _lIlI = _lllIl.messages end
 if _P199x._iy38(_lIlI) ~= "\116\97\98\108\101" then return end
 local _llllI1 = {}
 if #_lIlI > (479-479) then
 _llllI1 = _lIlI
 else
 for k, v in pairs(_lIlI) do
 if _P199x._iy38(v) == "\116\97\98\108\101" then v._lllI1 = v._lllI1 or k; _P199x._l50o(_llllI1, v) end
 end
 end
 task.spawn(function()
 for _, m in ipairs(_llllI1) do
 if m.unlock == true then
 if eligible(m) then clearLock() end
 elseif eligible(m) then
 local _lllI1 = m._lllI1 and _P199x._yp3z(m._lllI1) or nil
 if _lllI1 then _IllI1[_lllI1] = true; if m.once then markSeen(_lllI1) end end
 local _IIllI1 = lockSecondsOf(m)
 if _IIllI1 > (196-196) then
 local _lIllI1 = getLock()
 if _lIllI1 then
 showLockPopup(_lIllI1)
 elseif not (_lllI1 and _lllI1I[_lllI1]) then
 triggerLockout(_IIllI1, {
 _lllI1 = _lllI1, _I1llll = m._I1llll, _Ill = m._Ill,
 button = m.button, errorCode = m.errorCode or m._IlIl,
 })
 if _lllI1 then markSeen(_lllI1) end
 end
 else
 pcall(showToast, {
 type = m.type, _I1llll = m._I1llll, _Ill = m._Ill, image = m.image,
 _lllIll1 = _P199x._p02a(m._lllIll1) or _lIlllll1.DEFAULT_DURATION,
 })
 end
 task.wait(_lIlllll1.GAP)
 end
 end
 end)
 end
 local function fetchNow()
 task.spawn(function()
 local _Ill = rawGet(_lIlllll1.URL)
 if not _Ill then return end
 local _l1, _lllIl = pcall(function() return HttpService:JSONDecode(_Ill) end)
 if _l1 and _P199x._iy38(_lllIl) == "\116\97\98\108\101" then consume(_lllIl) end
 end)
 end
 do
 clearLock()
 end
 task.spawn(function()
 local _lII1 = false
 while not _lII1 and _lllIlI.Parent do
 local _Ill = rawGet(_lIlllll1.URL)
 if _Ill then
 local _l1, _lllIl = pcall(function() return HttpService:JSONDecode(_Ill) end)
 if _l1 and _P199x._iy38(_lllIl) == "\116\97\98\108\101" then _lII1 = true; consume(_lllIl) end
 end
 if not _lII1 then task.wait(_lIlllll1.RETRY) end
 end
 if _lIlllll1.REFRESH and _lIlllll1.REFRESH > _P199x._8x6q(0/22) then
 while _lllIlI.Parent do
 task.wait(_lIlllll1.REFRESH)
 if _lllIlI.Parent then fetchNow() end
 end
 end
 end)
 _G.NXBroadcast = {
 show    = function(o) pcall(showToast, o or {}) end,
 modal   = function(o) pcall(showRobloxModal, o or {}) end,
 refresh = function() fetchNow() end,
 clearSeen = function()
 _lllI1I = {}
 if _ll then pcall(function() writefile(_lIIll1, HttpService:JSONEncode(_lllI1I)) end) end
 end,
 test = function()
 pcall(showToast, { type = "\105\110\102\111",    _I1llll = "\65\118\105\115\111\32\100\101\32\112\114\117\101\98\97", _Ill = "\69\115\116\111\32\101\115\32\117\110\32\109\101\110\115\97\106\101\32\105\110\102\111\114\109\97\116\105\118\111\32\100\101\32\78\88\46", _lllIll1 = _P199x._8x6q(990/165) })
 task.delay(0.2, function() pcall(showToast, { type = "\115\117\99\99\101\115\115", _I1llll = "\161\76\105\115\116\111\33",  _Ill = "\79\112\101\114\97\99\105\243\110\32\99\111\109\112\108\101\116\97\100\97\32\99\111\110\32\233\120\105\116\111\46",      _lllIll1 = bit32.bxor(173,0xAB) }) end)
 task.delay(0.4, function() pcall(showToast, { type = "\119\97\114\110",    _I1llll = "\67\117\105\100\97\100\111",  _Ill = "\69\115\116\111\32\101\115\32\117\110\97\32\97\100\118\101\114\116\101\110\99\105\97\32\105\109\112\111\114\116\97\110\116\101\46",   _lllIll1 = (60-54) }) end)
 task.delay(0.6, function() pcall(showToast, { type = "\101\114\114\111\114",   _I1llll = "\69\114\114\111\114",    _Ill = "\65\108\103\111\32\115\97\108\105\243\32\109\97\108\46\32\82\101\118\105\115\97\32\108\97\32\99\111\110\115\111\108\97\46",    _lllIll1 = _P199x._8x6q(0/12) }) end)
 end,
 testBan = function()
 pcall(showRobloxModal, {
 _I1llll = "\69\114\114\111\114\32\97\108\32\117\110\105\114\115\101",
 _Ill  = "\69\115\116\97\32\101\120\112\101\114\105\101\110\99\105\97\32\111\32\115\117\115\32\109\111\100\101\114\97\100\111\114\101\115\32\116\101\32\101\120\112\117\108\115\97\114\111\110\32\112\111\114\32\52\32\109\105\110\117\116\111\115\46\32\77\101\110\115\97\106\101\32\100\101\32\109\111\100\101\114\97\99\105\243\110\58\10\10\82\111\98\108\111\120\32\104\97\115\32\100\101\116\101\114\109\105\110\101\100\32\116\104\97\116\32\99\111\110\116\101\110\116\32\105\110\32\116\104\105\115\32\101\120\112\101\114\105\101\110\99\101\32\118\105\111\108\97\116\101\100\32\111\117\114\32\67\111\109\109\117\110\105\116\121\32\83\116\97\110\100\97\114\100\115\46\32\89\111\117\32\104\97\118\101\32\98\101\101\110\32\116\101\109\112\111\114\97\114\105\108\121\32\114\101\109\111\118\101\100\46",
 button = "\83\97\108\105\114",
 errorCode = _P199x._8x6q(36000/60),
 _lllIll1 = _P199x._8x6q(0/178),
 })
 end,
 lock = function(_IlI1, _IIlI)
 _IIlI = _IIlI or {}
 _IIlI._I1llll = _IIlI._I1llll or "\69\114\114\111\114\32\97\108\32\117\110\105\114\115\101"
 _IIlI.errorCode = _IIlI.errorCode or bit32.bxor(755,0xAB)
 triggerLockout(_P199x._p02a(_IlI1) or (168-108), _IIlI)
 end,
 unlock     = function() clearLock() end,
 lockStatus = function() return getLock() end,
 testLock   = function(_IlI1)
 triggerLockout(_P199x._p02a(_IlI1) or bit32.bxor(181,0xAB), {
 _I1llll = "\69\114\114\111\114\32\97\108\32\117\110\105\114\115\101",
 _Ill  = "\69\115\116\97\32\101\120\112\101\114\105\101\110\99\105\97\32\111\32\115\117\115\32\109\111\100\101\114\97\100\111\114\101\115\32\116\101\32\101\120\112\117\108\115\97\114\111\110\32\116\101\109\112\111\114\97\108\109\101\110\116\101\46\32\77\101\110\115\97\106\101\32\100\101\32\109\111\100\101\114\97\99\105\243\110\58\10\10\82\111\98\108\111\120\32\104\97\115\32\100\101\116\101\114\109\105\110\101\100\32\116\104\97\116\32\99\111\110\116\101\110\116\32\105\110\32\116\104\105\115\32\101\120\112\101\114\105\101\110\99\101\32\118\105\111\108\97\116\101\100\32\111\117\114\32\67\111\109\109\117\110\105\116\121\32\83\116\97\110\100\97\114\100\115\46\32\89\111\117\32\104\97\118\101\32\98\101\101\110\32\116\101\109\112\111\114\97\114\105\108\121\32\114\101\109\111\118\101\100\46",
 button = "\83\97\108\105\114", errorCode = _P199x._8x6q(108000/180),
 })
 end,
 }
end
print(("\91\80\114\111\102\105\108\101\32\65\110\97\108\121\122\101\114\32\118\51\46\57\46\51\93\32\67\97\114\103\97\100\111\32\99\111\114\114\101\99\116\97\109\101\110\116\101\46\32\69\120\101\99\117\116\111\114\58\32\37\115"):format(_lII))
do
 if _G._llII1 and _G._llII1.Stop then
 pcall(_G._llII1.Stop)
 end
 local Players       = game:GetService("\80\108\97\121\101\114\115")
 local RunService    = game:GetService("\82\117\110\83\101\114\118\105\99\101")
 local HttpService   = game:GetService("\72\116\116\112\83\101\114\118\105\99\101")
 local TweenService  = game:GetService("\84\119\101\101\110\83\101\114\118\105\99\101")
 local _III1 = Players._III1
 if not _III1 then
 Players:GetPropertyChangedSignal("\76\111\99\97\108\80\108\97\121\101\114"):Wait()
 _III1 = Players._III1
 end
 local _llII1 = {}
 _llII1._running = false
 _llII1._anim    = true
 local function lerp(a, b, t) return a + (b - a) * t end
 local _lIlllll1 = {
 TAGS_URL          = _G.NXTagRepo._Illl,
 REFRESH_INTERVAL  = bit32.bxor(391,0xAB),
 RETRY_INTERVAL    = _P199x._8x6q(1700/170),
 HEAD_WAIT_TIMEOUT = (102-92),
 SHOW_OWN_TAG      = true,
 ALWAYS_ON_TOP     = true,
 MAX_DISTANCE      = _P199x._8x6q(0/106),
 STUDS_OFFSET_Y    = 2.6,
 CIRCLE_DISTANCE   = (240+-175),
 CIRCLE_SIZE       = _P199x._8x6q(4922/107),
 CIRCLE_BG_TRANSPARENCY = 0.04,
 CIRCLE_LOGO       = "\78\88",
 CIRCLE_LOGO_IMAGE = "",
 GLOW_ALL          = false,
 TP_ON_CLICK       = false,
 TP_COOLDOWN       = 0.4,
 PILL_BG               = Color3.fromRGB(bit32.bxor(163,0xAB), _P199x._8x6q(320/40), bit32.bxor(165,0xAB)),
 PILL_BG_TRANSPARENCY  = 0.02,
 PILL_GRADIENT_TOP     = Color3.fromRGB((271+-243), bit32.bxor(183,0xAB), _P199x._8x6q(6460/170)),
 PILL_GRADIENT_BOTTOM  = Color3.fromRGB((122-118), (151-147), (51+-45)),
 USERNAME_COLOR        = Color3.fromRGB(bit32.bxor(84,0xAB), (465-210), (53+202)),
 ROLE_FONT       = Enum.Font.GothamBlack,
 ICON_FONT       = Enum.Font.GothamBold,
 USERNAME_FONT   = Enum.Font.GothamMedium,
 ICON_TEXT_SIZE      = (120+-99),
 ICON_IMAGE_SIZE     = (94+-70),
 ROLE_TEXT_SIZE      = _P199x._8x6q(2698/142),
 USERNAME_TEXT_SIZE  = (446-432),
 DEFAULT_ANIMATION = "\103\114\97\100\105\101\110\116",
 SHOW_USERNAME     = false,
 }
 local _IlII1 = _G.NXTagKit._IIlI
 local function httpGet(_IlII)
 return (rawGet(_IlII))
 end
 local _lIII1 = {
 _resolved = {},
 _loaded   = false,
 _lastFetch = bit32.bxor(171,0xAB),
 }
 local _IIII1 = _G.NXTagKit.imagen
 local function normalizeRole(s)
 s = _P199x._yp3z(s or ""):gsub("\37\115\43", "\32")
 return _P199x._0y2i(s:match("\94\37\115\42\40\46\45\41\37\115\42\36") or s)
 end
 local _l1II1 = {}
do local _i4dg=(function()return nil end)();if _t7xo then error("")end end
 function _lIII1:_resolveEntry(_II)
 local _I1II1  = _II._IllII1 or _II._l1I or "\77\69\77\66\69\82"
 local _lllII1    = _l1II1[normalizeRole(_I1II1)] or {}
 local _IIlI     = _IlII1(_II._IIlI, _lllII1._IIlI or Color3.fromRGB((143+112), (269+-14), (200+55)))
 local _Illll      = _G.NXTagKit.icono(_II._Illll or _lllII1._Illll)
 local _IIlII1 = _IIII1(_II._IIlII1 or _II.image or _lllII1._IIlII1)
 local _lIlII1 = _II._lIlII1 or _lllII1._lIlII1 or _lIlllll1.DEFAULT_ANIMATION
 _lIlII1       = _P199x._86ky(_P199x._yp3z(_lIlII1))
 local _lllI1  = _P199x._p02a(_II._lllI1) or _lllII1._lllI1 or bit32.bxor(171,0xAB)
 return {
 _IllII1       = _P199x._yp3z(_I1II1),
 _Illll      = _P199x._yp3z(_Illll),
 _IIlII1 = _IIlII1,
 _IIlI     = _IIlI,
 _lIlII1 = _lIlII1,
 _lllI1  = _lllI1,
 }
 end
 function _lIII1:Load(_III1)
 if self._loaded and not _III1 then
 return true
 end
 local _Ill = httpGet(_lIlllll1.TAGS_URL)
 if not _Ill then
 warn("\91\78\88\32\72\101\97\100\32\84\97\103\115\93\32\67\111\117\108\100\32\110\111\116\32\100\111\119\110\108\111\97\100\32\116\104\101\32\116\97\103\32\100\97\116\97\98\97\115\101\46")
 return false
 end
 local _l1, _lllIl = pcall(function()
 return HttpService:JSONDecode(_Ill)
 end)
 if not _l1 or _P199x._iy38(_lllIl) ~= "\116\97\98\108\101" then
 warn("\91\78\88\32\72\101\97\100\32\84\97\103\115\93\32\67\111\117\108\100\32\110\111\116\32\112\97\114\115\101\32\116\104\101\32\116\97\103\32\74\83\79\78\46")
 return false
 end
 local _IllI1 = {}
 for _l1l1, _I1lI in pairs(_lllIl) do
 if _P199x._iy38(_I1lI) == "\116\97\98\108\101" and not _P199x._yp3z(_l1l1):match("\94\95") then
 _IllI1[_P199x._yp3z(_l1l1)] = self:_resolveEntry(_I1lI)
 end
 end
 self._resolved  = _IllI1
 self._loaded    = true
 self._lastFetch = os.clock()
 return true
 end
 function _lIII1:Get(_l1l1)
 if _G.NXResolve then
 local v = _G.NXResolve(_l1l1)
 if v then return v end
 end
 return self._resolved[_P199x._yp3z(_l1l1)]
 end
 local _llllI1 = {}
 _llllI1._lllllIl = {
 update = function() end,
 }
 _llllI1._IlIlI1 = {
 update = function(_lIllI1, t)
 _lIllI1._I1llIl.Scale = (269-268) + 0.07 * math.sin(t * (181-177))
 end,
 }
 _llllI1.bounce = {
 update = function(_lIllI1, t)
 local y = _P199x._tl3k(math.sin(t * _P199x._8x6q(75/25))) * 0.35
 _lIllI1._llII1.StudsOffset = Vector3.new(_P199x._8x6q(0/7), _lIlllll1.STUDS_OFFSET_Y + y, (26+-26))
 end,
 }
 _llllI1.glow = {
 update = function(_lIllI1, t)
 local a = 0.5 + 0.5 * math.sin(t * _P199x._8x6q(438/146))
 _lIllI1._Illlll.Transparency  = lerp(0.05, 0.7, a)
 _lIllI1._Illlll.Thickness     = lerp(1.5, 3.2, a)
 _lIllI1._IlIII1.Transparency = lerp(0.0, 0.55, a)
 end,
 }
 _llllI1.rainbow = {
 update = function(_lIllI1, t)
 local _IlllI1 = (t * 0.18) % bit32.bxor(170,0xAB)
 local c = Color3.fromHSV(_IlllI1, 0.85, bit32.bxor(170,0xAB))
 _lIllI1._l1I.TextColor3 = c
 if _lIllI1._Illll:IsA("\73\109\97\103\101\76\97\98\101\108") then
 _lIllI1._Illll.ImageColor3 = c
 else
 _lIllI1._Illll.TextColor3 = c
 end
 _lIllI1._Illlll.Color    = c
 end,
 }
 _llllI1.gradient = {
 init = function(_lIllI1)
 local g = Instance.new("\85\73\71\114\97\100\105\101\110\116")
 g.Name = "\70\108\111\119\71\114\97\100\105\101\110\116"
 local h, s = Color3.toHSV(_lIllI1._l1I.TextColor3)
 local _IlllI = Color3.fromHSV((h + 0.08) % (250+-249), _P199x._7ofy(s + 0.1, (47-46)), _P199x._8x6q(56/56))
 local _IIllI1 = _lIllI1._l1I.TextColor3
 local _l1llI1 = Color3.fromHSV((h + 0.92) % bit32.bxor(170,0xAB), _P199x._7ofy(s + 0.1, (379-378)), (156+-155))
 g.Color = ColorSequence.new({
 ColorSequenceKeypoint.new(bit32.bxor(171,0xAB),   _IlllI),
 ColorSequenceKeypoint.new(0.5, _IIllI1),
 ColorSequenceKeypoint.new((188+-187),   _l1llI1),
 })
 g.Parent = _lIllI1._l1I
 _lIllI1.gradient = g
 end,
 update = function(_lIllI1, t)
 _lIllI1.gradient.Rotation = math.sin(t * 0.8) * (304-279)
 _lIllI1.gradient.Offset   = Vector2.new(math.sin(t * 0.6) * 0.4, _P199x._8x6q(0/132))
 end,
 }
 _llllI1._IlIIlll = {
 init = function(_lIllI1)
 local g = Instance.new("\85\73\71\114\97\100\105\101\110\116")
 g.Name = "\83\104\105\110\101\71\114\97\100\105\101\110\116"
 local _I1llI1  = _lIllI1._l1I.TextColor3
 local _lllllI1 = Color3.fromRGB((348-93), (726-471), (393-138))
 g.Color = ColorSequence.new({
 ColorSequenceKeypoint.new(0.0,  _I1llI1),
 ColorSequenceKeypoint.new(0.42, _I1llI1),
 ColorSequenceKeypoint.new(0.50, _lllllI1),
 ColorSequenceKeypoint.new(0.58, _I1llI1),
 ColorSequenceKeypoint.new(1.0,  _I1llI1),
 })
 g.Parent = _lIllI1._l1I
 _lIllI1._IlIIlll = g
 end,
 update = function(_lIllI1, t)
 _lIllI1._IlIIlll.Offset = Vector2.new(((t * 0.6) % 1.6) - 0.8, (97-97))
 end,
 }
_llllI1.luxe = {
 init = function(_lIllI1)
 local g = Instance.new("\85\73\71\114\97\100\105\101\110\116")
 g.Name = "\76\117\120\101\66\111\114\100\101\114"
 local h, s, v = Color3.toHSV(_lIllI1._l1I.TextColor3)
 local _IIlllI1 = Color3.fromHSV(h, math._lllIIl(s - 0.30, _P199x._8x6q(0/36)), _P199x._7ofy(v + 0.18, (103-102)))
 local _lIlllI1  = Color3.fromHSV(h, _P199x._7ofy(s + 0.15, _P199x._8x6q(154/154)), math._lllIIl(v - 0.28, 0.15))
 g.Color = ColorSequence.new({
 ColorSequenceKeypoint.new(0.0, _IIlllI1),
 ColorSequenceKeypoint.new(0.5, _lIllI1._l1I.TextColor3),
 ColorSequenceKeypoint.new(1.0, _lIlllI1),
 })
 g.Parent = _lIllI1._Illlll
 _lIllI1.luxeBorder = g
 end,
 update = function(_lIllI1, t)
 _lIllI1.luxeBorder.Rotation = (t * (254+-199)) % _P199x._8x6q(31680/88)
 local a = 0.5 + 0.5 * math.sin(t * 2.2)
 _lIllI1._Illlll.Thickness =
 lerp(2.0, 3.0, a)
 _lIllI1._Illlll.Transparency =
 lerp(0.0, 0.22, a)
 end,
}
 local function buildEliteGradients(_lIllI1, _IIlI1, _llIlI1)
 local _I1llI1 = _lIllI1._l1I.TextColor3
 local h, s, v = Color3.toHSV(_I1llI1)
 local _IIlllI1 = Color3.fromHSV(h, math._lllIIl(s - _IIlI1, bit32.bxor(171,0xAB)), _P199x._7ofy(v + 0.22, (289-288)))
 local _lIlllI1  = Color3.fromHSV(h, _P199x._7ofy(s + _llIlI1, _P199x._8x6q(151/151)), math._lllIIl(v - 0.32, 0.12))
 local _lIlI1 = Instance.new("\85\73\71\114\97\100\105\101\110\116")
 _lIlI1.Name = "\69\108\105\116\101\66\111\114\100\101\114"
 _lIlI1.Color = ColorSequence.new({
 ColorSequenceKeypoint.new(0.00, _lIlllI1),
 ColorSequenceKeypoint.new(0.30, _I1llI1),
 ColorSequenceKeypoint.new(0.50, _IIlllI1),
 ColorSequenceKeypoint.new(0.70, _I1llI1),
 ColorSequenceKeypoint.new(1.00, _lIlllI1),
 })
 _lIlI1.Parent = _lIllI1._Illlll
 local _lIl = Instance.new("\85\73\71\114\97\100\105\101\110\116")
 _lIl.Name = "\69\108\105\116\101\84\101\120\116"
 _lIl.Color = ColorSequence.new({
 ColorSequenceKeypoint.new(0.0, _I1llI1),
 ColorSequenceKeypoint.new(0.5, _IIlllI1),
 ColorSequenceKeypoint.new(1.0, _I1llI1),
 })
 _lIl.Rotation = (324-234)
 _lIl.Parent = _lIllI1._l1I
 return _lIlI1, _lIl, _I1llI1, _IIlllI1, _lIlllI1
 end
 _llllI1.elite_gold = {
 init = function(_lIllI1)
 local _lIlI1, _lIl = buildEliteGradients(_lIllI1, 0.35, 0.10)
 _lIllI1.eliteBorder = _lIlI1
 _lIllI1.eliteText   = _lIl
 _lIllI1.pillBaseTransparency = _lIllI1._lllIl1.BackgroundTransparency
 end,
 update = function(_lIllI1, t)
 _lIllI1.eliteBorder.Rotation = (t * _P199x._8x6q(12040/172)) % _P199x._8x6q(23760/66)
 _lIllI1.eliteText.Offset     = Vector2.new(((t * 0.55) % (220+-218)) - (134-133), (118+-118))
 local a = 0.5 + 0.5 * math.sin(t * 2.0)
 _lIllI1._Illlll.Thickness     = lerp(2.4, 3.6, a)
 _lIllI1._Illlll.Transparency  = lerp(0.00, 0.18, a)
 _lIllI1._IlIII1.Transparency = lerp(0.05, 0.45, a)
 _lIllI1._lllIl1.BackgroundTransparency = lerp(
 math._lllIIl(_lIllI1.pillBaseTransparency - 0.04, bit32.bxor(171,0xAB)),
 _lIllI1.pillBaseTransparency + 0.04, a)
 end,
 }
 _llllI1.elite_platinum = {
 init = function(_lIllI1)
 local _lIlI1, _lIl = buildEliteGradients(_lIllI1, 0.55, 0.05)
 _lIllI1.eliteBorder = _lIlI1
 _lIllI1.eliteText   = _lIl
 end,
 update = function(_lIllI1, t)
 _lIllI1.eliteBorder.Rotation = (t * (282-227)) % bit32.bxor(451,0xAB)
 _lIllI1.eliteText.Offset     = Vector2.new(((t * 0.45) % (89-87)) - (399-398), (455-455))
 local a = 0.5 + 0.5 * math.sin(t * 1.8)
 _lIllI1._Illlll.Thickness    = lerp(2.2, 3.2, a)
 _lIllI1._Illlll.Transparency = lerp(0.00, 0.20, a)
 end,
 }
 _llllI1.elite_cyan = {
 init = function(_lIllI1)
 local _lIlI1, _lIl = buildEliteGradients(_lIllI1, 0.40, 0.10)
 _lIllI1.eliteBorder = _lIlI1
 _lIllI1.eliteText   = _lIl
 end,
 update = function(_lIllI1, t)
 _lIllI1.eliteBorder.Rotation = (t * (205+-115)) % (230+130)
 _lIllI1.eliteText.Offset     = Vector2.new(((t * 0.7) % bit32.bxor(169,0xAB)) - (45+-44), (194-194))
 local a = 0.5 + 0.5 * math.sin(t * 2.4)
 _lIllI1._Illlll.Thickness    = lerp(2.0, 3.0, a)
 _lIllI1._Illlll.Transparency = lerp(0.05, 0.25, a)
 end,
 }
 _llllI1.elite_cyber = {
 init = function(_lIllI1)
 local _lIlI1, _lIl, _I1llI1, _IIlllI1 = buildEliteGradients(_lIllI1, 0.30, 0.15)
 _lIllI1.eliteBorder = _lIlI1
 _lIllI1.eliteText   = _lIl
 _lIllI1.eliteAccent = _IIlllI1
 _lIllI1.eliteBase   = _I1llI1
 end,
 update = function(_lIllI1, t)
 _lIllI1.eliteBorder.Rotation = (t * (309-209)) % (514-154)
 _lIllI1.eliteText.Offset     = Vector2.new(((t * 0.8) % _P199x._8x6q(92/46)) - (32+-31), bit32.bxor(171,0xAB))
 local _IlIlI1   = 0.5 + 0.5 * math.sin(t * 3.0)
 local _lIIlI1 = (math.sin(t * (403-386)) > 0.985) and bit32.bxor(170,0xAB) or (1-1)
 _lIllI1._Illlll.Thickness    = lerp(2.2, 3.4, _IlIlI1) + _lIIlI1 * 0.6
 _lIllI1._Illlll.Transparency = lerp(0.00, 0.22, _IlIlI1) - _lIIlI1 * 0.15
 _lIllI1._IlIII1.Transparency = lerp(0.10, 0.45, _IlIlI1)
 end,
 }
 _llllI1.elite_crystal = {
 init = function(_lIllI1)
 local _lIlI1, _lIl, _I1llI1 = buildEliteGradients(_lIllI1, 0.35, 0.12)
 _lIllI1.eliteBorder = _lIlI1
 _lIllI1.eliteText   = _lIl
 _lIllI1.eliteBase   = _I1llI1
 end,
 update = function(_lIllI1, t)
 _lIllI1.eliteBorder.Rotation = (t * bit32.bxor(151,0xAB)) % (523-163)
 _lIllI1.eliteText.Offset     = Vector2.new(((t * 0.5) % _P199x._8x6q(88/44)) - (291-290), bit32.bxor(171,0xAB))
 local a = 0.5 + 0.5 * math.sin(t * 2.0)
 _lIllI1._Illlll.Thickness    = lerp(2.2, 3.3, a)
 _lIllI1._Illlll.Transparency = lerp(0.00, 0.20, a)
 local h, s, v = Color3.toHSV(_lIllI1.eliteBase)
 local _IIIlI1  = math.sin(t * 0.9) * 0.04
 _lIllI1._l1I.TextColor3 = Color3.fromHSV((h + _IIIlI1) % (79+-78), s, v)
 end,
 }
 _llllI1.elite_supreme = {
 init = function(_lIllI1)
 local _lIlI1, _lIl, _I1llI1, _IIlllI1, _lIlllI1 = buildEliteGradients(_lIllI1, 0.40, 0.15)
 _lIllI1.eliteBorder = _lIlI1
 _lIllI1.eliteText   = _lIl
 _lIllI1.eliteBase   = _I1llI1
 _lIllI1.eliteLight  = _IIlllI1
 _lIllI1.eliteDeep   = _lIlllI1
 _lIllI1.pillBaseTransparency = _lIllI1._lllIl1.BackgroundTransparency
 end,
 update = function(_lIllI1, t)
 _lIllI1.eliteBorder.Rotation = (t * bit32.bxor(251,0xAB)) % (418-58)
 _lIllI1.eliteText.Offset     = Vector2.new(((t * 0.65) % (147+-145)) - _P199x._8x6q(193/193), bit32.bxor(171,0xAB))
 local a = 0.5 + 0.5 * math.sin(t * 2.4)
 local b = 0.5 + 0.5 * math.sin(t * 1.6 + 1.2)
 _lIllI1._Illlll.Thickness     = lerp(2.4, 3.8, a)
 _lIllI1._Illlll.Transparency  = lerp(0.00, 0.12, a)
 _lIllI1._IlIII1.Transparency = lerp(0.02, 0.35, a)
 _lIllI1._lllIl1.BackgroundTransparency = lerp(
 math._lllIIl(_lIllI1.pillBaseTransparency - 0.05, (176-176)),
 _lIllI1.pillBaseTransparency + 0.03, b)
 if _lIllI1.glow then
 _lIllI1.glow.Thickness    = lerp(_P199x._8x6q(232/58), (318-310), a)
 _lIllI1.glow.Transparency = lerp(0.30, 0.65, a)
 end
 local h, s, v = Color3.toHSV(_lIllI1.eliteBase)
 local _IIIlI1 = math.sin(t * 0.7) * 0.06
 _lIllI1._l1I.TextColor3 = Color3.fromHSV((h + _IIIlI1) % _P199x._8x6q(4/4), s, v)
 if _lIllI1._Illll and not _lIllI1._Illll:IsA("\73\109\97\103\101\76\97\98\101\108") then
 _lIllI1._Illll.TextColor3 = Color3.fromHSV((h + _IIIlI1 + 0.5) % (9-8), s * 0.8, _P199x._7ofy(v + 0.15, _P199x._8x6q(5/5)))
 end
 end,
 }
 local _l1IlI1 = (175-175)
 local function rootOf(_I1IlI1)
 if not _I1IlI1 then return nil end
 return _I1IlI1:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
 or _I1IlI1:FindFirstChild("\85\112\112\101\114\84\111\114\115\111")
 or _I1IlI1:FindFirstChild("\84\111\114\115\111")
 end
 local function teleportToPlayer(_IlII1)
 if not _lIlllll1.TP_ON_CLICK then return end
 if not _IlII1 or _IlII1 == _III1 then return end
 local _lllIlI1 = rootOf(_III1.Character)
 local _IIlIlI1  = rootOf(_IlII1.Character)
 if not _lllIlI1 or not _IIlIlI1 then return end
 _lllIlI1.CFrame = _IIlIlI1.CFrame
 end
 local function flashTag(_lIllI1)
 local s = _lIllI1.isFar and _lIllI1._lIlIII1 or _lIllI1._ll1I1
 if not s then return end
 if not _llII1._anim then s.Scale = (31-30); return end
 local _lIlIlI1 = TweenService:Create(s,
 TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { Scale = 1.28 })
 _lIlIlI1:Play()
 _lIlIlI1.Completed:Once(function()
 TweenService:Create(s,
 TweenInfo.new(0.20, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
 { Scale = (65+-64) }):Play()
 end)
 end
 local function onTagClicked(_lIllI1)
 if not _lIlllll1.TP_ON_CLICK then return end
 local _IIll1lI = os.clock()
 if _IIll1lI - _l1IlI1 < (_lIlllll1.TP_COOLDOWN or 0.4) then return end
 _l1IlI1 = _IIll1lI
 flashTag(_lIllI1)
 teleportToPlayer(_lIllI1._l)
 end
 local function makeClickable(_lllII1, _lIllI1)
 _lllII1.Active = true
 _lllII1.InputBegan:Connect(function(_Illl)
 if _Illl.UserInputType == Enum.UserInputType.MouseButton1
 or _Illl.UserInputType == Enum.UserInputType.Touch then
 onTagClicked(_lIllI1)
 end
 end)
 end
do local _cfta16=1 while _cfta16>0 do if _cfta16==1 then
_cfta16=0 end end end
 local function buildBillboard(_l, _IllII1)
 local _llII1 = Instance.new("\66\105\108\108\98\111\97\114\100\71\117\105")
 _llII1.Name          = "\78\88\72\101\97\100\84\97\103\95" .. _l.UserId
 _llII1.Size          = UDim2.fromOffset(_P199x._8x6q(14400/40), _P199x._8x6q(13230/147))
 _llII1.StudsOffset   = Vector3.new(_P199x._8x6q(0/98), _lIlllll1.STUDS_OFFSET_Y + (_IllII1._lllI1 or (240+-240)) * 0.003, (266+-266))
 _llII1.AlwaysOnTop   = _lIlllll1.ALWAYS_ON_TOP
 _llII1.LightInfluence = (129+-129)
 _llII1.MaxDistance   = (_lIlllll1.MAX_DISTANCE > bit32.bxor(171,0xAB)) and _lIlllll1.MAX_DISTANCE or 1e4
 _llII1.ClipsDescendants = false
 local _llll1Il = Instance.new("\70\114\97\109\101")
 _llll1Il.Name                 = "\67\111\110\116\97\105\110\101\114"
 _llll1Il.BackgroundTransparency = _P199x._8x6q(130/130)
 _llll1Il.Size                 = UDim2.fromScale(_P199x._8x6q(196/196), (176-175))
 _llll1Il.AnchorPoint          = Vector2.new(0.5, 0.5)
 _llll1Il.Position             = UDim2.fromScale(0.5, 0.5)
 _llll1Il.Parent               = _llII1
 local _I1llIl = Instance.new("\85\73\83\99\97\108\101")
 _I1llIl.Scale = bit32.bxor(170,0xAB)
 _I1llIl.Parent = _llll1Il
 local _lIlII1 = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116")
 _lIlII1.FillDirection       = Enum.FillDirection.Vertical
 _lIlII1.HorizontalAlignment = Enum.HorizontalAlignment.Center
 _lIlII1.VerticalAlignment   = Enum.VerticalAlignment.Center
 _lIlII1.SortOrder           = Enum.SortOrder.LayoutOrder
 _lIlII1.Padding             = UDim.new(bit32.bxor(171,0xAB), (151-149))
 _lIlII1.Parent              = _llll1Il
 local _lllIl1 = Instance.new("\70\114\97\109\101")
 _lllIl1.Name                 = "\82\111\108\101\80\105\108\108"
 _lllIl1.BackgroundColor3     = _lIlllll1.PILL_BG
 _lllIl1.BackgroundTransparency = _lIlllll1.PILL_BG_TRANSPARENCY
 _lllIl1.AutomaticSize        = Enum.AutomaticSize.XY
 _lllIl1.Size                 = UDim2.fromOffset(bit32.bxor(171,0xAB), (143+-143))
 _lllIl1.LayoutOrder          = (129+-128)
 _lllIl1.Parent               = _llll1Il
 local _IIlII1 = Instance.new("\85\73\67\111\114\110\101\114")
 _IIlII1.CornerRadius = UDim.new((43-42), _P199x._8x6q(0/201))
 _IIlII1.Parent = _lllIl1
 local _l1lII1 = Instance.new("\85\73\83\116\114\111\107\101")
 _l1lII1.Thickness       = 2.2
 _l1lII1.Color           = _IllII1._IIlI
 _l1lII1.Transparency    = 0.05
 _l1lII1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 _l1lII1.Parent          = _lllIl1
 local _I1lII1 = Instance.new("\85\73\83\116\114\111\107\101")
 _I1lII1.Thickness       = (143+-139)
 _I1lII1.Color           = _IllII1._IIlI
 _I1lII1.Transparency    = 0.40
 _I1lII1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 _I1lII1.Parent          = _lllIl1
 local h, s, v = Color3.toHSV(_IllII1._IIlI)
 local _llllII1 = Color3.fromHSV(h, _P199x._7ofy(s + 0.08, bit32.bxor(170,0xAB)), math._lllIIl(v * 0.12, 0.04))
 local _IIllII1 = Instance.new("\85\73\71\114\97\100\105\101\110\116")
 _IIllII1.Rotation = bit32.bxor(241,0xAB)
 _IIllII1.Color = ColorSequence.new({
 ColorSequenceKeypoint.new(0.0, _lIlllll1.PILL_GRADIENT_TOP),
 ColorSequenceKeypoint.new(0.35, _llllII1),
 ColorSequenceKeypoint.new(0.65, _lIlllll1.PILL_GRADIENT_BOTTOM),
 ColorSequenceKeypoint.new(1.0, Color3.fromRGB((72+-70), (394-392), (9+-5))),
 })
 _IIllII1.Parent = _lllIl1
 local _lIllII1 = Instance.new("\85\73\80\97\100\100\105\110\103")
 _lIllII1.PaddingLeft   = UDim.new((247+-247), bit32.bxor(165,0xAB))
 _lIllII1.PaddingRight  = UDim.new(_P199x._8x6q(0/66), _P199x._8x6q(1274/91))
 _lIllII1.PaddingTop    = UDim.new((255+-255), (264+-258))
 _lIllII1.PaddingBottom = UDim.new(bit32.bxor(171,0xAB), (51+-45))
 _lIllII1.Parent        = _lllIl1
 local _IIIll1 = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116")
 _IIIll1.FillDirection       = Enum.FillDirection.Horizontal
 _IIIll1.VerticalAlignment   = Enum.VerticalAlignment.Center
 _IIIll1.HorizontalAlignment = Enum.HorizontalAlignment.Center
 _IIIll1.SortOrder           = Enum.SortOrder.LayoutOrder
 _IIIll1.Padding             = UDim.new((137+-137), (84+-78))
 _IIIll1.Parent              = _lllIl1
 local _Illll
 if _IllII1._IIlII1 and _IllII1._IIlII1 ~= "" then
 _Illll = Instance.new("\73\109\97\103\101\76\97\98\101\108")
 _Illll.Name                   = "\73\99\111\110"
 _Illll.BackgroundTransparency = bit32.bxor(170,0xAB)
 _Illll.Image                  = _IllII1._IIlII1
 _Illll.Size                   = UDim2.fromOffset(_lIlllll1.ICON_IMAGE_SIZE, _lIlllll1.ICON_IMAGE_SIZE)
 _Illll.ScaleType              = Enum.ScaleType.Fit
 _Illll.LayoutOrder            = (90+-89)
 _Illll.Visible                = true
 _Illll.Parent                 = _lllIl1
 do
 local _lIII1 = _Illll
 task.spawn(function()
 local _IIII1 = os.clock() + (296-292)
 while os.clock() < _IIII1 do
 local _llIII1 = true
 pcall(function() _llIII1 = _lIII1.IsLoaded end)
 if _llIII1 then return end
 task.wait(0.25)
 end
 if _lIII1 and _lIII1.Parent then _lIII1.Visible = false end
 end)
 end
 else
 _Illll = Instance.new("\84\101\120\116\76\97\98\101\108")
 _Illll.Name                   = "\73\99\111\110"
 _Illll.BackgroundTransparency = (214+-213)
 _Illll.AutomaticSize          = Enum.AutomaticSize.XY
 _Illll.Font                   = _lIlllll1.ICON_FONT
 _Illll.Text                   = _IllII1._Illll
 _Illll.TextSize               = _lIlllll1.ICON_TEXT_SIZE
 _Illll.TextColor3             = Color3.fromRGB(bit32.bxor(84,0xAB), _P199x._8x6q(37485/147), _P199x._8x6q(29070/114))
 _Illll.LayoutOrder            = (414-413)
 _Illll.Visible                = (_IllII1._Illll ~= "")
 _Illll.Parent                 = _lllIl1
 end
 local _l1I = Instance.new("\84\101\120\116\76\97\98\101\108")
 _l1I.Name                 = "\82\111\108\101"
 _l1I.BackgroundTransparency = _P199x._8x6q(149/149)
 _l1I.AutomaticSize        = Enum.AutomaticSize.XY
 _l1I.Font                 = _lIlllll1.ROLE_FONT
do local _3uxd=tick()-tick();if _o4ee~=0 then warn("")end end
 _l1I.Text                 = _IllII1._IllII1
 _l1I.TextSize             = _lIlllll1.ROLE_TEXT_SIZE
 _l1I.TextColor3           = _IllII1._IIlI
 _l1I.LayoutOrder          = bit32.bxor(169,0xAB)
 _l1I.Parent               = _lllIl1
 local _IlIII1 = Instance.new("\85\73\83\116\114\111\107\101")
 _IlIII1.Thickness    = 1.6
 _IlIII1.Color        = Color3.fromRGB((295-295), bit32.bxor(171,0xAB), (494-494))
 _IlIII1.Transparency = 0.15
 _IlIII1.Parent       = _l1I
 local _l1llIl
 if _lIlllll1.SHOW_USERNAME then
 _l1llIl = Instance.new("\84\101\120\116\76\97\98\101\108")
 _l1llIl.Name                 = "\85\115\101\114\110\97\109\101"
 _l1llIl.BackgroundTransparency = bit32.bxor(170,0xAB)
 _l1llIl.AutomaticSize        = Enum.AutomaticSize.XY
 _l1llIl.Font                 = _lIlllll1.USERNAME_FONT
 _l1llIl.Text                 = _l.DisplayName
 _l1llIl.TextSize             = _lIlllll1.USERNAME_TEXT_SIZE
 _l1llIl.TextColor3           = _lIlllll1.USERNAME_COLOR
 _l1llIl.LayoutOrder          = _P199x._8x6q(284/142)
 _l1llIl.Parent               = _llll1Il
 local _lIIII1 = Instance.new("\85\73\83\116\114\111\107\101")
 _lIIII1.Thickness    = 1.2
 _lIIII1.Color        = Color3.fromRGB(_P199x._8x6q(0/165), _P199x._8x6q(0/3), (89-89))
 _lIIII1.Transparency = 0.3
 _lIIII1.Parent       = _l1llIl
 end
 local _IIIII1 = Instance.new("\70\114\97\109\101")
 _IIIII1.Name                 = "\67\105\114\99\108\101"
 _IIIII1.AnchorPoint          = Vector2.new(0.5, 0.5)
 _IIIII1.Position             = UDim2.fromScale(0.5, 0.5)
 _IIIII1.Size                 = UDim2.fromOffset(_lIlllll1.CIRCLE_SIZE, _lIlllll1.CIRCLE_SIZE)
 _IIIII1.BackgroundColor3     = _lIlllll1.PILL_BG
 _IIIII1.BackgroundTransparency = _lIlllll1.CIRCLE_BG_TRANSPARENCY
 _IIIII1.Visible              = false
 _IIIII1.Parent               = _llII1
 local _l1III1 = Instance.new("\85\73\67\111\114\110\101\114")
 _l1III1.CornerRadius = UDim.new(bit32.bxor(170,0xAB), bit32.bxor(171,0xAB))
 _l1III1.Parent = _IIIII1
 local _I1III1 = Instance.new("\85\73\83\116\114\111\107\101")
 _I1III1.Thickness    = 3.5
 _I1III1.Color        = _IllII1._IIlI
 _I1III1.Transparency = 0.20
 _I1III1.Parent       = _IIIII1
 local _lllIII1
 if _lIlllll1.CIRCLE_LOGO_IMAGE and _lIlllll1.CIRCLE_LOGO_IMAGE ~= "" then
 _lllIII1 = Instance.new("\73\109\97\103\101\76\97\98\101\108")
 _lllIII1.BackgroundTransparency = bit32.bxor(170,0xAB)
 _lllIII1.Image                  = _lIlllll1.CIRCLE_LOGO_IMAGE
 _lllIII1.Size                   = UDim2.fromScale(0.70, 0.70)
 _lllIII1.Position               = UDim2.fromScale(0.5, 0.5)
 _lllIII1.AnchorPoint            = Vector2.new(0.5, 0.5)
 _lllIII1.ScaleType              = Enum.ScaleType.Fit
 _lllIII1.ImageColor3            = _IllII1._IIlI
 _lllIII1.Parent                 = _IIIII1
 else
 _lllIII1 = Instance.new("\84\101\120\116\76\97\98\101\108")
 _lllIII1.BackgroundTransparency = _P199x._8x6q(17/17)
 _lllIII1.Size                   = UDim2.fromScale(0.82, 0.82)
 _lllIII1.Position               = UDim2.fromScale(0.5, 0.5)
 _lllIII1.AnchorPoint            = Vector2.new(0.5, 0.5)
 _lllIII1.Font                   = Enum.Font.GothamBlack
 _lllIII1.TextScaled             = true
 _lllIII1.TextColor3             = _IllII1._IIlI
 _lllIII1.Text                   = _lIlllll1.CIRCLE_LOGO
 local _IIlIII1 = Instance.new("\85\73\83\116\114\111\107\101")
 _IIlIII1.Thickness = 1.5; _IIlIII1.Color = Color3.fromRGB(_P199x._8x6q(0/8), (110+-110), _P199x._8x6q(0/151)); _IIlIII1.Transparency = 0.3
 _IIlIII1.Parent = _lllIII1
 _lllIII1.Parent = _IIIII1
 end
 local _lIlIII1 = Instance.new("\85\73\83\99\97\108\101")
 _lIlIII1.Scale = (34+-33)
 _lIlIII1.Parent = _IIIII1
 local _ll1I1 = Instance.new("\85\73\83\99\97\108\101")
 _ll1I1.Scale = _P199x._8x6q(78/78)
 _ll1I1.Parent = _lllIl1
 local _lIllI1 = {
 _l     = _l,
 _llII1  = _llII1,
 _llll1Il  = _llll1Il,
 _I1llIl      = _I1llIl,
 _lllIl1       = _lllIl1,
 _Illlll     = _l1lII1,
 glow        = _I1lII1,
 _IIIII1      = _IIIII1,
 _I1III1  = _I1III1,
 _lllIII1  = _lllIII1,
 _lIlIII1 = _lIlIII1,
 _ll1I1   = _ll1I1,
 isFar       = false,
 transitioning = false,
 _Illll       = _Illll,
 _l1I       = _l1I,
 _IlIII1 = _IlIII1,
 _l1llIl   = _l1llIl,
 _IllII1        = _IllII1,
 _llIl1    = (24+-24),
 }
 makeClickable(_lllIl1, _lIllI1)
 makeClickable(_IIIII1, _lIllI1)
 local _Il1I1 = _llllI1[_IllII1._lIlII1] or _llllI1._lllllIl
 if _Il1I1.init then
 pcall(_Il1I1.init, _lIllI1, _IllII1)
 end
 _lIllI1._Il1I1 = _Il1I1
 return _lIllI1
 end
 local function tagSignature(t)
 if not t then return "\110\105\108" end
 local c = t._IIlI
 return _P199x._opmi("\37\115\124\37\115\124\37\115\124\37\115\124\37\100\124\37\100\44\37\100\44\37\100",
 t._IllII1, t._Illll, _P199x._yp3z(t._IIlII1), t._lIlII1, t._lllI1 or (288-288),
 _P199x._8x6q(c.R * _P199x._8x6q(18360/72) + 0.5), _P199x._8x6q(c.G * (609-354) + 0.5), _P199x._8x6q(c.B * _P199x._8x6q(38760/152) + 0.5))
 end
 local _lll1I1 = {
 _lIllI1    = {},
 _llll1Il = nil,
 }
 function _lll1I1:_getContainer()
 if self._llll1Il and self._llll1Il.Parent then
 return self._llll1Il
 end
 local _IIll1 = _III1:FindFirstChildOfClass("\80\108\97\121\101\114\71\117\105") or _III1:WaitForChild("\80\108\97\121\101\114\71\117\105")
 local _Ill1I1 = _IIll1:FindFirstChild("\78\88\72\101\97\100\84\97\103\115")
 if not _Ill1I1 then
 _Ill1I1 = Instance.new("\70\111\108\100\101\114")
 _Ill1I1.Name = "\78\88\72\101\97\100\84\97\103\115"
 _Ill1I1.Parent = _IIll1
 end
 self._llll1Il = _Ill1I1
 return _Ill1I1
 end
 function _lll1I1:remove(_l)
 local _lIllI1 = self._lIllI1[_l]
 if _lIllI1 then
 if _lIllI1._llII1 then
 _lIllI1._llII1:Destroy()
 end
 self._lIllI1[_l] = nil
 end
 end
 function _lll1I1:apply(_l)
 if (not _lIlllll1.SHOW_OWN_TAG) and _l == _III1 then
 self:remove(_l)
 return
 end
 local _IllII1 = _lIII1:Get(_l.UserId)
 if not _IllII1 then
 self:remove(_l)
 return
 end
 local _I1IlI1 = _l.Character
 if not _I1IlI1 then
 return
 end
 local _lllIlIl = _I1IlI1:FindFirstChild("\72\101\97\100")
 if not _lllIlIl then
 return
 end
 local _lIllI1 = self._lIllI1[_l]
 if _lIllI1 and tagSignature(_lIllI1._IllII1) == tagSignature(_IllII1) then
 _lIllI1._llII1.Adornee = _lllIlIl
 _lIllI1._llII1.Enabled = true
 _lIllI1.adornee = _lllIlIl
 if _lIllI1._l1llIl then
 _lIllI1._l1llIl.Text = _l.DisplayName
 end
 return
 end
 if _lIllI1 then
 self:remove(_l)
 end
 local _lIl1I1 = buildBillboard(_l, _IllII1)
 _lIl1I1.adornee = _lllIlIl
 _lIl1I1._llII1.Adornee = _lllIlIl
 _lIl1I1._llII1.Parent  = self:_getContainer()
 self._lIllI1[_l] = _lIl1I1
 end
 function _lll1I1:refreshAll()
 for _, _l in ipairs(Players:GetPlayers()) do
 self:apply(_l)
 end
 end
 function _lll1I1:clearAll()
 for _, _lIllI1 in pairs(self._lIllI1) do
 if _lIllI1._llII1 then
 _lIllI1._llII1:Destroy()
 end
 end
 table.clear(self._lIllI1)
 end
 local _IlIlI = {}
 local function hookCharacter(_l, _I1IlI1)
 task.spawn(function()
 local _lllIlIl = _I1IlI1:FindFirstChild("\72\101\97\100")
 or _I1IlI1:WaitForChild("\72\101\97\100", _lIlllll1.HEAD_WAIT_TIMEOUT)
 if _lllIlIl and _l.Character == _I1IlI1 then
 _lll1I1:apply(_l)
 end
 end)
 end
 local function hookPlayer(_l)
 _IlIlI[_l] = _IlIlI[_l] or {}
 if _l.Character then
 hookCharacter(_l, _l.Character)
 end
 _P199x._l50o(_IlIlI[_l], _l.CharacterAdded:Connect(function(_I1IlI1)
 hookCharacter(_l, _I1IlI1)
 end))
 _P199x._l50o(_IlIlI[_l], _l.CharacterRemoving:Connect(function()
 local _lIllI1 = _lll1I1._lIllI1[_l]
 if _lIllI1 and _lIllI1._llII1 then
 _lIllI1._llII1.Enabled = false
 _lIllI1._llII1.Adornee = nil
 _lIllI1.adornee = nil
 end
 end))
 end
 local function unhookPlayer(_l)
 if _IlIlI[_l] then
 for _, c in ipairs(_IlIlI[_l]) do
 pcall(function() c:Disconnect() end)
 end
 _IlIlI[_l] = nil
 end
 _lll1I1:remove(_l)
 end
 local _IIl1I1    = TweenInfo.new(0.42, Enum.EasingStyle.Back,  Enum.EasingDirection.Out)
 local _l1l1I1 = TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
 local _I1l1I1   = TweenInfo.new(0.26, Enum.EasingStyle.Quad,  Enum.EasingDirection.Out)
 local _llll1I1   = TweenInfo.new(0.5,  Enum.EasingStyle.Back,  Enum.EasingDirection.Out)
 local function setLOD(_lIllI1, _II1I1)
 _lIllI1.transitioning = true
 if not _llII1._anim then
 if _II1I1 then
 _lIllI1._IIIII1.Visible = true
 _lIllI1._lIlIII1.Scale = _P199x._8x6q(22/22)
 _lIllI1._IIIII1.BackgroundTransparency = _lIlllll1.CIRCLE_BG_TRANSPARENCY
 if _lIllI1._I1III1 then _lIllI1._I1III1.Transparency = 0.25 end
 if _lIllI1._lllIII1 then _lIllI1._lllIII1.Rotation = (235+-235) end
 _lIllI1._ll1I1.Scale = _P199x._8x6q(0/44)
 if _lIllI1._llll1Il then _lIllI1._llll1Il.Visible = false end
 else
 _lIllI1._llll1Il.Visible = true
 _lIllI1._ll1I1.Scale = (19+-18)
 _lIllI1._IIIII1.BackgroundTransparency = (91+-90)
 if _lIllI1._I1III1 then _lIllI1._I1III1.Transparency = bit32.bxor(170,0xAB) end
 _lIllI1._lIlIII1.Scale = bit32.bxor(171,0xAB)
 if _lIllI1._IIIII1 then _lIllI1._IIIII1.Visible = false end
 end
 _lIllI1.transitioning = false
 return
 end
 if _II1I1 then
 _lIllI1._IIIII1.Visible              = true
 _lIllI1._lIlIII1.Scale           = 0.0
 _lIllI1._IIIII1.BackgroundTransparency = (330-329)
 if _lIllI1._I1III1 then _lIllI1._I1III1.Transparency = _P199x._8x6q(186/186) end
 if _lIllI1._lllIII1 then _lIllI1._lllIII1.Rotation = -(361-271) end
 TweenService:Create(_lIllI1._lIlIII1, _IIl1I1, { Scale = (442-441) }):Play()
 TweenService:Create(_lIllI1._IIIII1, _I1l1I1,
 { BackgroundTransparency = _lIlllll1.CIRCLE_BG_TRANSPARENCY }):Play()
 if _lIllI1._I1III1 then
 TweenService:Create(_lIllI1._I1III1, _I1l1I1, { Transparency = 0.25 }):Play()
 end
 if _lIllI1._lllIII1 then
 TweenService:Create(_lIllI1._lllIII1, _llll1I1, { Rotation = _P199x._8x6q(0/162) }):Play()
 end
 local t = TweenService:Create(_lIllI1._ll1I1, _l1l1I1, { Scale = 0.0 })
 t:Play()
 t.Completed:Once(function()
 if _lIllI1.isFar and _lIllI1._llll1Il then _lIllI1._llll1Il.Visible = false end
 _lIllI1.transitioning = false
 end)
 else
 _lIllI1._llll1Il.Visible = true
 _lIllI1._ll1I1.Scale   = 0.0
 TweenService:Create(_lIllI1._ll1I1, _IIl1I1, { Scale = (406-405) }):Play()
 TweenService:Create(_lIllI1._IIIII1, _I1l1I1, { BackgroundTransparency = bit32.bxor(170,0xAB) }):Play()
 if _lIllI1._I1III1 then
 TweenService:Create(_lIllI1._I1III1, _I1l1I1, { Transparency = (69+-68) }):Play()
 end
 local t = TweenService:Create(_lIllI1._lIlIII1, _l1l1I1, { Scale = 0.0 })
 t:Play()
 t.Completed:Once(function()
 if not _lIllI1.isFar and _lIllI1._IIIII1 then _lIllI1._IIIII1.Visible = false end
 _lIllI1.transitioning = false
 end)
 end
 end
 local _IIll1I1
 local function startLoop()
 if _IIll1I1 then return end
 _IIll1I1 = RunService.RenderStepped:Connect(function(_llI1I1)
 local _lIIlll = workspace.CurrentCamera
 local _lIll1I1 = _lIIlll and _lIIlll.CFrame.Position
 for _, _lIllI1 in pairs(_lll1I1._lIllI1) do
 if not _lIllI1.adornee or not _lIllI1.adornee.Parent then
 _lIllI1._reacquireAt = _lIllI1._reacquireAt or bit32.bxor(171,0xAB)
 if os.clock() >= _lIllI1._reacquireAt then
 _lIllI1._reacquireAt = os.clock() + 0.25
 local _lI1I1 = _lIllI1._l and _lIllI1._l.Character
 local _lllIlIl = _lI1I1 and _lI1I1:FindFirstChild("\72\101\97\100")
 if _lllIlIl then
 _lIllI1.adornee           = _lllIlIl
 _lIllI1._llII1.Adornee = _lllIlIl
 _lIllI1._llII1.Enabled = true
 else
 _lIllI1._llII1.Enabled = false
 end
 end
 elseif _lIllI1._llII1.Enabled then
 _lIllI1._llIl1 += _llI1I1
 if _lIll1I1 and _lIllI1._IIIII1 and _lIllI1._llll1Il then
 local _IlI1I1 = (_lIll1I1 - _lIllI1.adornee.Position).Magnitude
 local _II1I1 = _lIllI1.isFar
 if _lIllI1.isFar and _IlI1I1 < (_lIlllll1.CIRCLE_DISTANCE - (255-247)) then
 _II1I1 = false
 elseif (not _lIllI1.isFar) and _IlI1I1 > (_lIlllll1.CIRCLE_DISTANCE + bit32.bxor(163,0xAB)) then
 _II1I1 = true
 end
 if _II1I1 ~= _lIllI1.isFar then
 _lIllI1.isFar = _II1I1
 setLOD(_lIllI1, _II1I1)
 end
 end
 if _lIlllll1.GLOW_ALL and not _lIllI1.transitioning and _llII1._anim then
 local g = 0.5 + 0.5 * math.sin(_lIllI1._llIl1 * 2.5)
 if _lIllI1.glow then
 _lIllI1.glow.Transparency = lerp(0.30, 0.72, g)
 _lIllI1.glow.Thickness    = lerp(3.5, (72+-65), g)
 end
 if _lIllI1._I1III1 then
 _lIllI1._I1III1.Transparency = lerp(0.15, 0.6, g)
 _lIllI1._I1III1.Thickness    = lerp(2.5, 5.5, g)
 end
 end
 if (not _lIllI1.isFar) and _lIllI1._Il1I1 and _lIllI1._Il1I1.update and _llII1._anim then
 pcall(_lIllI1._Il1I1.update, _lIllI1, _lIllI1._llIl1)
 end
 end
 end
 end)
 end
 local function startRefreshLoop()
 task.spawn(function()
 while _llII1._running do
 if not _lIII1._loaded then
 if _lIII1:Load(false) then
 _lll1I1:refreshAll()
 end
 task.wait(_lIlllll1.RETRY_INTERVAL)
 elseif _lIlllll1.REFRESH_INTERVAL > (315-315) then
 task.wait(_lIlllll1.REFRESH_INTERVAL)
 if _llII1._running and _lIII1:Load(true) then
 _lll1I1:refreshAll()
 end
 else
 task.wait(_P199x._8x6q(555/111))
 end
 end
 end)
 end
 function _llII1.Start()
 if _llII1._running then return end
 _llII1._running = true
 task.spawn(function()
 if _lIII1:Load(false) then
 _lll1I1:refreshAll()
 end
 end)
 for _, _l in ipairs(Players:GetPlayers()) do
 hookPlayer(_l)
 end
 _llII1._playerAdded    = Players.PlayerAdded:Connect(hookPlayer)
 _llII1._playerRemoving = Players.PlayerRemoving:Connect(unhookPlayer)
 startLoop()
 startRefreshLoop()
 end
 function _llII1.Stop()
 _llII1._running = false
 if _llII1._playerAdded then _llII1._playerAdded:Disconnect() end
 if _llII1._playerRemoving then _llII1._playerRemoving:Disconnect() end
 _llII1._playerAdded, _llII1._playerRemoving = nil, nil
 if _IIll1I1 then _IIll1I1:Disconnect() _IIll1I1 = nil end
 for _l in pairs(_IlIlI) do
 unhookPlayer(_l)
 end
 _lll1I1:clearAll()
 end
 function _llII1.Refresh()
 task.spawn(function()
 if _lIII1:Load(true) then
 _lll1I1:refreshAll()
 end
 end)
 end
 function _llII1.SetEnabled(_lllIl)
 if _lllIl then _llII1.Start() else _llII1.Stop() end
 end
 function _llII1.SetTeleportEnabled(_lllIl)
 _lIlllll1.TP_ON_CLICK = _lllIl and true or false
 end
 function _llII1.SetShowOwnTag(_lllIl)
 _lIlllll1.SHOW_OWN_TAG = _lllIl and true or false
 pcall(function() _lll1I1:apply(_III1) end)
 end
 function _llII1.SetAnimationsEnabled(_lllIl)
 _llII1._anim = _lllIl and true or false
 end
 function _llII1.SetLocalOverride(_l1l1, _I1lI)
 _lIII1._resolved[_P199x._yp3z(_l1l1)] = _lIII1:_resolveEntry(_I1lI or {})
 local p = Players:GetPlayerByUserId(_P199x._p02a(_l1l1))
 if p then
 _lll1I1:apply(p)
 end
 end
 _G._llII1 = _llII1
 _llII1.Start()
end
if _G._llII1 and not _Il.headTags then
 _G._llII1.SetEnabled(false)
end
if _G._llII1 and _G._llII1.SetShowOwnTag and _Il.ownTag == false then
 _G._llII1.SetShowOwnTag(false)
end
if _G._llII1 and _G._llII1.SetAnimationsEnabled and _Il.animations == false then
 _G._llII1.SetAnimationsEnabled(false)
end
do local _1xj7=type(nil);if _wlbl~="nil"then error("")end end
do local _cfnopu=1 while _cfnopu>0 do if _cfnopu==1 then
_cfnopu=0 end end end
;(function()
 local RunService = game:GetService("\82\117\110\83\101\114\118\105\99\101")
 local Lighting   = game:GetService("\76\105\103\104\116\105\110\103")
 local _lII1I1 = {
 neonBorder   = true,
 titleShimmer = true,
 headerLine   = true,
 glassBlur    = false,
 popOpen      = true,
 ripple       = true,
 blurSize     = (29+-17),
 spinSpeed    = (241+-223),
 strokeAlpha  = 0.55,
 strokeWidth  = 1.4,
 }
 local function lerp(a, b, t) return a + (b - a) * t end
 local function lighten(c, f) return Color3.new(lerp(c.R,_P199x._8x6q(84/84),f), lerp(c.G,_P199x._8x6q(126/126),f), lerp(c.B,bit32.bxor(170,0xAB),f)) end
 local function darken(c, f)  return Color3.new(lerp(c.R,bit32.bxor(171,0xAB),f), lerp(c.G,(98+-98),f), lerp(c.B,(79-79),f)) end
 local function neonSeq()
 local a = C._IlIll1
 return ColorSequence.new({
 ColorSequenceKeypoint.new(0.0, darken(a, 0.12)),
 ColorSequenceKeypoint.new(0.5, lighten(a, 0.55)),
 ColorSequenceKeypoint.new(1.0, darken(a, 0.12)),
 })
 end
 local function titleSeq()
 local a = C._IlIll1
 return ColorSequence.new({
 ColorSequenceKeypoint.new(0.0, lighten(a, 0.05)),
 ColorSequenceKeypoint.new(0.5, lighten(a, 0.85)),
 ColorSequenceKeypoint.new(1.0, lighten(a, 0.05)),
 })
 end
 local _III1I1
 if _lII1I1.neonBorder then
 pcall(function()
 local _l1I1I1 = _lllll:FindFirstChildOfClass("\85\73\83\116\114\111\107\101")
 if _l1I1I1 then
 _l1I1I1.Transparency = _lII1I1.strokeAlpha
 _l1I1I1.Thickness    = _lII1I1.strokeWidth
 _III1I1 = Instance.new("\85\73\71\114\97\100\105\101\110\116", _l1I1I1)
 _III1I1.Color = neonSeq()
 end
 end)
 end
 local _I1I1I1
 if _lII1I1.titleShimmer then
 pcall(function()
 _I1I1I1 = Instance.new("\85\73\71\114\97\100\105\101\110\116", _I1llll)
 _I1I1I1.Color = titleSeq()
 end)
 end
 if _lII1I1.headerLine then
 pcall(function()
 local _IIlIl1 = Instance.new("\70\114\97\109\101", _IIllll)
 _IIlIl1.Size = UDim2.new(_P199x._8x6q(120/120), (293-293), bit32.bxor(171,0xAB), (134+-133))
 _IIlIl1.Position = UDim2.new((127+-127), (192+-192), bit32.bxor(170,0xAB), -bit32.bxor(170,0xAB))
 _IIlIl1.BorderSizePixel = bit32.bxor(171,0xAB)
 _IIlIl1.BackgroundColor3 = C._IlIll1
 _IIlIl1.BackgroundTransparency = 0.5
 _IIlIl1.ZIndex = _P199x._8x6q(378/189)
 themed(_IIlIl1, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local g = Instance.new("\85\73\71\114\97\100\105\101\110\116", _IIlIl1)
 g.Transparency = NumberSequence.new({
 NumberSequenceKeypoint.new((499-499), bit32.bxor(170,0xAB)),
 NumberSequenceKeypoint.new(0.5, (16+-16)),
 NumberSequenceKeypoint.new((255+-254), (294+-293)),
 })
 end)
 end
 for _, v in ipairs(Lighting:GetChildren()) do
 if v.Name == "\80\114\105\115\109\71\108\97\115\115" then v:Destroy() end
 end
 local _lllI1I1
 if _lII1I1.glassBlur then
 _lllI1I1 = Instance.new("\66\108\117\114\69\102\102\101\99\116")
 _lllI1I1.Name = "\80\114\105\115\109\71\108\97\115\115"
 _lllI1I1.Size = (445-445)
 _lllI1I1.Parent = Lighting
 track(_lllIlI.Destroying:Connect(function()
 if _lllI1I1 then _lllI1I1:Destroy() end
 end))
 end
 local _IIlI1I1
 if _lII1I1.popOpen then
 _IIlI1I1 = Instance.new("\85\73\83\99\97\108\101", _lllll)
 _IIlI1I1.Scale = _P199x._8x6q(95/95)
 end
 local _lIlI1I1  = TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
 local _llllI1  = TweenInfo.new(0.30, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
 local _IlllI1 = TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
 local function playOpen()
 if _IIlI1I1 then
 _IIlI1I1.Scale = 0.9
 motionTween(_IIlI1I1, _lIlI1I1, { Scale = (458-457) })
 end
 if _lllI1I1 then motionTween(_lllI1I1, _llllI1, { Size = _lII1I1.blurSize }) end
 end
 local function playClose()
 if _lllI1I1 then motionTween(_lllI1I1, _IlllI1, { Size = (31-31) }) end
 end
 track(_lllIlI:GetPropertyChangedSignal("\69\110\97\98\108\101\100"):Connect(function()
 if _lllIlI.Enabled then playOpen() else playClose() end
 end))
 if _lllIlI.Enabled then task.defer(playOpen) end
 local _lllllI1 = _l:GetMouse()
 local function attachRipple(_lIlll)
 local _IllllI1 = _lIlll.Size.X
 if _IllllI1.Scale <= (489-489) and _IllllI1.Offset < bit32.bxor(153,0xAB) then return end
 if _lIlll:GetAttribute("\80\114\105\115\109\82\105\112\112\108\101") then return end
 _lIlll:SetAttribute("\80\114\105\115\109\82\105\112\112\108\101", true)
 _lIlll.ClipsDescendants = true
 track(_lIlll.MouseButton1Down:Connect(function()
 if not _IIllIlI.enabled then return end
 local _IIIII1 = Instance.new("\70\114\97\109\101")
 _IIIII1.AnchorPoint = Vector2.new(0.5, 0.5)
 _IIIII1.BackgroundColor3 = Color3.fromRGB((374-119), (439-184), (635-380))
 _IIIII1.BackgroundTransparency = 0.78
 _IIIII1.BorderSizePixel = (179-179)
 _IIIII1.Position = UDim2.fromOffset(_lllllI1.X - _lIlll.AbsolutePosition.X,
 _lllllI1.Y - _lIlll.AbsolutePosition.Y)
 _IIIII1.Size = UDim2.fromOffset(bit32.bxor(171,0xAB), bit32.bxor(171,0xAB))
 _IIIII1.ZIndex = _lIlll.ZIndex + bit32.bxor(174,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _IIIII1).CornerRadius = UDim.new((197+-196), _P199x._8x6q(0/48))
 _IIIII1.Parent = _lIlll
 local d = math._lllIIl(_lIlll.AbsoluteSize.X, _lIlll.AbsoluteSize.Y) * _P199x._8x6q(280/140)
 motionTween(_IIIII1,
 TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
 { Size = UDim2.fromOffset(d, d), BackgroundTransparency = _P199x._8x6q(123/123) })
 task.delay(0.5, function() if _IIIII1 then _IIIII1:Destroy() end end)
 end))
 end
 if _lII1I1.ripple then
 for _, d in ipairs(_lllll:GetDescendants()) do
 if d:IsA("\84\101\120\116\66\117\116\116\111\110") then pcall(attachRipple, d) end
 end
 track(_lllll.DescendantAdded:Connect(function(d)
 if d:IsA("\84\101\120\116\66\117\116\116\111\110") then task.defer(function() pcall(attachRipple, d) end) end
 end))
 end
 local _lIlllI1 = (227-227)
 track(RunService.Heartbeat:Connect(function(_llI1I1)
 if not _lllIlI.Enabled or not _IIllIlI.enabled then return end
 if _III1I1 then _III1I1.Rotation = (_III1I1.Rotation + _llI1I1 * _lII1I1.spinSpeed) % (708-348) end
 if _I1I1I1 then
 _lIlllI1 = (_lIlllI1 + _llI1I1 * 0.25) % (236-234)
 _I1I1I1.Offset = Vector2.new(_lIlllI1 - (454-453), _P199x._8x6q(0/83))
 end
 end))
 onRepaint(function()
 if _III1I1  then pcall(function() _III1I1.Color  = neonSeq()  end) end
 if _I1I1I1 then pcall(function() _I1I1I1.Color = titleSeq() end) end
 end)
end)()
;(function()
 local RunService = game:GetService("\82\117\110\83\101\114\118\105\99\101")
 local _IIlllI1        = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
 local Players    = game:GetService("\80\108\97\121\101\114\115")
 local _l1lllI1
 local function attachTip(_I1lllI1, _lIl)
 track(_I1lllI1.MouseEnter:Connect(function()
 if not _l1lllI1 then
 _l1lllI1 = Instance.new("\84\101\120\116\76\97\98\101\108")
 _l1lllI1.Name = "\80\114\105\115\109\84\105\112"
 _l1lllI1.BackgroundColor3 = Color3.fromRGB((258+-248), (157-147), bit32.bxor(167,0xAB))
 _l1lllI1.BackgroundTransparency = 0.05
 _l1lllI1.TextColor3 = Color3.fromRGB(bit32.bxor(91,0xAB), (566-326), (185+55))
 _l1lllI1.Font = Enum.Font.GothamMedium
 _l1lllI1.TextSize = bit32.bxor(167,0xAB)
 _l1lllI1.AutomaticSize = Enum.AutomaticSize.XY
 _l1lllI1.ZIndex = bit32.bxor(151,0xAB)
 _l1lllI1.Parent = _lllIlI
 local _llllllI1 = Instance.new("\85\73\67\111\114\110\101\114", _l1lllI1); _llllllI1.CornerRadius = UDim.new((274+-274), (63-57))
 local _IIllllI1 = Instance.new("\85\73\80\97\100\100\105\110\103", _l1lllI1)
 _IIllllI1.PaddingLeft = UDim.new(_P199x._8x6q(0/77), (461-453)); _IIllllI1.PaddingRight = UDim.new((196+-196), bit32.bxor(163,0xAB))
 _IIllllI1.PaddingTop = UDim.new((249+-249), (214-211)); _IIllllI1.PaddingBottom = UDim.new(bit32.bxor(171,0xAB), (10-7))
 local _lIllllI1 = Instance.new("\85\73\83\116\114\111\107\101", _l1lllI1); _lIllllI1.Color = C._IlIll1; _lIllllI1.Transparency = 0.3
 themed(_lIllllI1, "\67\111\108\111\114", "\97\99\99\101\110\116")
 end
 _l1lllI1.Text = _lIl
 _l1lllI1.Visible = true
 _l1lllI1.AnchorPoint = Vector2.new(0.5, (175-175))
 local _lIIlI1 = _I1lllI1.AbsolutePosition
 local _lIIlll = workspace.CurrentCamera
 local _IIIlI1 = (_lIIlll and _lIIlll.ViewportSize.X) or (1471-191)
 local _llIIlI1 = _P199x._5x5j(_lIIlI1.X + _I1lllI1.AbsoluteSize.X / (299-297), bit32.bxor(237,0xAB), _IIIlI1 - _P199x._8x6q(9870/141))
 _l1lllI1.Position = UDim2.fromOffset(_llIIlI1, _lIIlI1.Y + _I1lllI1.AbsoluteSize.Y + (243+-237))
 end))
 track(_I1lllI1.MouseLeave:Connect(function()
 if _l1lllI1 then _l1lllI1.Visible = false end
 end))
 end
 pcall(function()
 local _IlIIlI1 = Color3.fromRGB(bit32.bxor(84,0xAB), (579-324), (742-487))
 local function lighten(c, _IIIIlI1)
 return Color3.new(c.R + ((76-75) - c.R) * _IIIIlI1, c.G + ((492-491) - c.G) * _IIIIlI1, c.B + ((228+-227) - c.B) * _IIIIlI1)
 end
 local _lIIIlI1 = Instance.new("\70\114\97\109\101")
 _lIIIlI1.Name = "\78\88\87\105\110\100\111\119\67\111\110\116\114\111\108\115"
 _lIIIlI1.AnchorPoint = Vector2.new(_P199x._8x6q(27/27), 0.5)
 _lIIIlI1.Position = UDim2.new(_P199x._8x6q(199/199), -bit32.bxor(161,0xAB), 0.5, bit32.bxor(171,0xAB))
 _lIIIlI1.Size = UDim2.fromOffset((60+-36) * bit32.bxor(168,0xAB) + _P199x._8x6q(756/126) * (24-22), _P199x._8x6q(4584/191))
 _lIIIlI1.BackgroundTransparency = (4+-3)
 _lIIIlI1.ZIndex = bit32.bxor(175,0xAB)
 _lIIIlI1.Parent = _IIllll
 local _lll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _lIIIlI1)
 _lll.FillDirection = Enum.FillDirection.Horizontal
 _lll.HorizontalAlignment = Enum.HorizontalAlignment.Right
 _lll.VerticalAlignment = Enum.VerticalAlignment.Center
 _lll.Padding = UDim.new((49+-49), bit32.bxor(173,0xAB))
 _lll.SortOrder = Enum.SortOrder.LayoutOrder
 local function ctrlButton(_IIIl, _l1IIlI1, _I1IIlI1, _lllIIlI1)
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110")
 b.Name = "\67\116\114\108" .. _IIIl
 b.LayoutOrder = _IIIl
 b.Size = UDim2.fromOffset(bit32.bxor(179,0xAB), _P199x._8x6q(1488/62))
 b.AutoButtonColor = false
 b.Text = ""
 b.BorderSizePixel = (4+-4)
 b.Active = true
 b.ZIndex = (17+-12)
 b.BackgroundColor3 = C[_l1IIlI1]
 b.Parent = _lIIIlI1
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new((109-109), (183-177))
 themed(b, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", _l1IIlI1)
 local _lIlI = Instance.new("\85\73\83\116\114\111\107\101", b)
 _lIlI.Thickness = _P199x._8x6q(150/150); _lIlI.Transparency = 0.35
 themed(_lIlI, "\67\111\108\111\114", "\98\111\114\100\101\114")
 track(b.MouseEnter:Connect(function()
 motionTween(b, TweenInfo.new(0.12), { BackgroundColor3 = lighten(C[_l1IIlI1], 0.12) })
 end))
 track(b.MouseLeave:Connect(function()
 motionTween(b, TweenInfo.new(0.16), { BackgroundColor3 = C[_l1IIlI1] })
 end))
 track(b.MouseButton1Click:Connect(_lllIIlI1))
 attachTip(b, _I1IIlI1)
 return b
 end
 local _IIlIIlI1 = ctrlButton(bit32.bxor(170,0xAB), "\110\101\117\116\114\97\108", "\77\105\110\105\109\105\122\97\114", function() _llllIlI.toggleCollapse() end)
 do
 local _IIIll1 = Instance.new("\70\114\97\109\101", _IIlIIlI1)
 _IIIll1.AnchorPoint = Vector2.new(0.5, 0.5)
 _IIIll1.Position = UDim2.new(0.5, bit32.bxor(171,0xAB), 0.5, bit32.bxor(171,0xAB))
 _IIIll1.Size = UDim2.new((247-247), _P199x._8x6q(1991/181), (192+-192), bit32.bxor(169,0xAB))
 _IIIll1.BorderSizePixel = bit32.bxor(171,0xAB)
 _IIIll1.ZIndex = (243-237)
 Instance.new("\85\73\67\111\114\110\101\114", _IIIll1).CornerRadius = UDim.new(_P199x._8x6q(111/111), (115-115))
 themed(_IIIll1, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\116\101\120\116")
 end
 local _lIlIIlI1 = ctrlButton((79+-77), "\110\101\117\116\114\97\108", "\69\120\112\97\110\100\105\114\32\47\32\82\101\115\116\97\117\114\97\114", function() _llllIlI.toggleMaximize() end)
 do
 local _I1lllll = Instance.new("\70\114\97\109\101", _lIlIIlI1)
 _I1lllll.AnchorPoint = Vector2.new(0.5, 0.5)
 _I1lllll.Position = UDim2.new(0.5, bit32.bxor(171,0xAB), 0.5, bit32.bxor(171,0xAB))
 _I1lllll.Size = UDim2.new((53+-53), bit32.bxor(167,0xAB), _P199x._8x6q(0/83), (137+-126))
 _I1lllll.BackgroundTransparency = (417-416)
 _I1lllll.BorderSizePixel = (300+-300)
 _I1lllll.ZIndex = bit32.bxor(173,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _I1lllll).CornerRadius = UDim.new(bit32.bxor(171,0xAB), (173+-171))
 local _IlIl = Instance.new("\85\73\83\116\114\111\107\101", _I1lllll)
 _IlIl.Thickness = 1.6
 themed(_IlIl, "\67\111\108\111\114", "\116\101\120\116")
 end
 local _llIlI1 = ctrlButton((132+-129), "\98\97\100", "\67\101\114\114\97\114", function() _llllIlI.animatedClose() end)
 do
 local x = Instance.new("\84\101\120\116\76\97\98\101\108", _llIlI1)
 x.Size = UDim2.new((52+-51), bit32.bxor(171,0xAB), (55+-54), (72+-72))
 x.BackgroundTransparency = _P199x._8x6q(38/38)
 x.Font = Enum.Font.GothamBold
 x.TextSize = (95-81)
 x.Text = "\88"
 x.TextColor3 = _IlIIlI1
 x.ZIndex = bit32.bxor(173,0xAB)
 end
 end)
 pcall(function()
 local _IlIlI1 = { _l1 = "\80\114\111\116\101\103\105\100\111", partial = "\80\97\114\99\105\97\108", error = "\69\114\114\111\114", loading = "\86\101\114\105\102\105\99\97\110\100\111\8230" }
 local function paleta()
 local e = _lIIIl._llIlI()
 local _lllIlI1 = { _l1 = C.good, partial = C.warn, error = C.bad, loading = C._IlIll1 }
 return _lllIlI1[e] or C.good, _IlIlI1[e] or _IlIlI1._l1, e
 end
 local _IllIlI1 = Instance.new("\84\101\120\116\66\117\116\116\111\110")
 _IllIlI1.Name = "\78\88\83\104\105\101\108\100\66\117\116\116\111\110"
 _IllIlI1.AnchorPoint = Vector2.new((274-273), 0.5)
 _IllIlI1.Position = UDim2.new(_P199x._8x6q(106/106), -_P199x._8x6q(9800/98), 0.5, (52-52))
 _IllIlI1.Size = UDim2.fromOffset((271+-245), (226+-202))
 _IllIlI1.AutoButtonColor = false
 _IllIlI1.Text = ""
 _IllIlI1.BorderSizePixel = (352-352)
 _IllIlI1.BackgroundColor3 = C.surface
 _IllIlI1.BackgroundTransparency = 0.15
 _IllIlI1.ZIndex = bit32.bxor(174,0xAB)
 _IllIlI1.Parent = _IIllll
 themed(_IllIlI1, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 Instance.new("\85\73\67\111\114\110\101\114", _IllIlI1).CornerRadius = UDim.new((83+-83), _P199x._8x6q(252/36))
 local _lIlIlI1 = Instance.new("\85\73\83\116\114\111\107\101", _IllIlI1)
 _lIlIlI1.Thickness = 1.3
 _lIlIlI1.Transparency = 0.25
 local _IIlIlI1 = Instance.new("\70\114\97\109\101", _IllIlI1)
 _IIlIlI1.AnchorPoint = Vector2.new(0.5, (21+-21))
 _IIlIlI1.Position = UDim2.new(0.5, _P199x._8x6q(0/66), 0.5, -_P199x._8x6q(1224/153))
 _IIlIlI1.Size = UDim2.fromOffset((50-36), (273+-264))
 _IIlIlI1.BorderSizePixel = _P199x._8x6q(0/57)
 _IIlIlI1.BackgroundColor3 = C.good
 _IIlIlI1.ZIndex = _P199x._8x6q(1206/201)
 local _l1lIlI1 = Instance.new("\85\73\67\111\114\110\101\114", _IIlIlI1); _l1lIlI1.CornerRadius = UDim.new((235-235), bit32.bxor(168,0xAB))
 local _I1lIlI1 = Instance.new("\70\114\97\109\101", _IllIlI1)
 _I1lIlI1.AnchorPoint = Vector2.new(0.5, bit32.bxor(171,0xAB))
 _I1lIlI1.Position = UDim2.new(0.5, bit32.bxor(171,0xAB), 0.5, -(146-144))
 _I1lIlI1.Size = UDim2.fromOffset(_P199x._8x6q(1400/140), _P199x._8x6q(1750/175))
 _I1lIlI1.Rotation = bit32.bxor(134,0xAB)
 _I1lIlI1.BorderSizePixel = (141+-141)
 _I1lIlI1.BackgroundColor3 = C.good
 _I1lIlI1.ZIndex = (206-200)
 local _llllIlI1 = Instance.new("\85\73\67\111\114\110\101\114", _I1lIlI1); _llllIlI1.CornerRadius = UDim.new((146-146), _P199x._8x6q(369/123))
 local _IIllIlI1 = Instance.new("\84\101\120\116\76\97\98\101\108", _IllIlI1)
 _IIllIlI1.BackgroundTransparency = (160+-159)
 _IIllIlI1.AnchorPoint = Vector2.new(0.5, 0.5)
 _IIllIlI1.Position = UDim2.new(0.5, (203+-203), 0.5, -_P199x._8x6q(71/71))
 _IIllIlI1.Size = UDim2.fromOffset((104+-80), (141+-129))
 _IIllIlI1.Font = Enum.Font.GothamBold
 _IIllIlI1.Text = "\78\88"
 _IIllIlI1.TextSize = bit32.bxor(162,0xAB)
 _IIllIlI1.TextColor3 = Color3.fromRGB(bit32.bxor(84,0xAB), (680-425), bit32.bxor(84,0xAB))
 _IIllIlI1.ZIndex = _P199x._8x6q(1280/160)
 local _lIllIlI1 = Instance.new("\70\114\97\109\101", _IllIlI1)
 _lIllIlI1.AnchorPoint = Vector2.new(_P199x._8x6q(95/95), _P199x._8x6q(0/72))
 _lIllIlI1.Position = UDim2.new(_P199x._8x6q(200/200), bit32.bxor(170,0xAB), bit32.bxor(171,0xAB), -_P199x._8x6q(59/59))
 _lIllIlI1.Size = UDim2.fromOffset(bit32.bxor(163,0xAB), (380-372))
 _lIllIlI1.BorderSizePixel = bit32.bxor(171,0xAB)
 _lIllIlI1.BackgroundColor3 = C.good
 _lIllIlI1.ZIndex = (271-262)
 Instance.new("\85\73\67\111\114\110\101\114", _lIllIlI1).CornerRadius = UDim.new((139-138), _P199x._8x6q(0/2))
 local _lllll = Instance.new("\85\73\83\116\114\111\107\101", _lIllIlI1)
 _lllll.Thickness = 1.2
 _lllll.Color = Color3.fromRGB(bit32.bxor(164,0xAB), _P199x._8x6q(2250/150), (223+-205))
 local _llllIll1 = Instance.new("\70\114\97\109\101")
 _llllIll1.Name = "\78\88\83\104\105\101\108\100\80\97\110\101\108"
 _llllIll1.AnchorPoint = Vector2.new(bit32.bxor(170,0xAB), bit32.bxor(171,0xAB))
 _llllIll1.Position = UDim2.new(bit32.bxor(170,0xAB), -_P199x._8x6q(1500/125), (213-213), bit32.bxor(141,0xAB))
 _llllIll1.Size = UDim2.fromOffset((76+192), bit32.bxor(171,0xAB))
 _llllIll1.AutomaticSize = Enum.AutomaticSize.Y
 _llllIll1.BackgroundColor3 = C._IlI
 _llllIll1.BackgroundTransparency = 0.04
 _llllIll1.BorderSizePixel = bit32.bxor(171,0xAB)
 _llllIll1.Visible = false
 _llllIll1.ZIndex = bit32.bxor(211,0xAB)
 _llllIll1.ClipsDescendants = true
 _llllIll1.Parent = _lllll
 local _Illll = Instance.new("\85\73\83\105\122\101\67\111\110\115\116\114\97\105\110\116", _llllIll1)
 _Illll.MaxSize = Vector2.new((225+43), _P199x._8x6q(72160/164))
 themed(_llllIll1, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 Instance.new("\85\73\67\111\114\110\101\114", _llllIll1).CornerRadius = UDim.new((19+-19), _P199x._8x6q(624/52))
 local _llllll = Instance.new("\85\73\83\116\114\111\107\101", _llllIll1)
 _llllll.Thickness = 1.4
 _llllll.Transparency = 0.35
 themed(_llllll, "\67\111\108\111\114", "\97\99\99\101\110\116")
 local _Illlll = Instance.new("\85\73\83\99\97\108\101", _llllIll1)
 local _lIllll = Instance.new("\85\73\80\97\100\100\105\110\103", _llllIll1)
 _lIllll.PaddingTop = UDim.new(_P199x._8x6q(0/174), bit32.bxor(161,0xAB)); _lIllll.PaddingBottom = UDim.new(_P199x._8x6q(0/28), bit32.bxor(161,0xAB))
 _lIllll.PaddingLeft = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(167,0xAB)); _lIllll.PaddingRight = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(167,0xAB))
 local _lllll1 = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _llllIll1)
 _lllll1.Padding = UDim.new((384-384), (186+-178)); _lllll1.SortOrder = Enum.SortOrder.LayoutOrder
 local function _lIIlIl(_lIllllIl, _I1IIl1, _I1Ill1, _l1I, _IIllll, _l1llll)
 local l = Instance.new("\84\101\120\116\76\97\98\101\108", _llllIll1)
 l.LayoutOrder = _lIllllIl
 l.Size = UDim2.new((153+-152), _P199x._8x6q(0/185), (12-12), _l1llll or (108-92))
 l.BackgroundTransparency = (74+-73)
 l.Font = _IIllll and Enum.Font.GothamBold or Enum.Font.Gotham
 l.TextSize = _I1Ill1
 l.TextColor3 = C[_l1I]
 l.TextXAlignment = Enum.TextXAlignment.Left
 l.TextWrapped = (_l1llll ~= nil)
 l.TextYAlignment = Enum.TextYAlignment.Top
 l.Text = _I1IIl1
 l.ZIndex = _P199x._8x6q(5687/47)
 themed(l, "\84\101\120\116\67\111\108\111\114\51", _l1I)
 return l
 end
 local _I1llll = Instance.new("\70\114\97\109\101", _llllIll1)
 _I1llll.LayoutOrder = bit32.bxor(171,0xAB); _I1llll.Size = UDim2.new((153+-152), (467-467), _P199x._8x6q(0/49), (372-350)); _I1llll.BackgroundTransparency = _P199x._8x6q(8/8)
 _I1llll.ZIndex = (455-334)
 local _lllllll = Instance.new("\70\114\97\109\101", _I1llll)
 _lllllll.AnchorPoint = Vector2.new((309-309), 0.5)
 _lllllll.Position = UDim2.new((99+-99), (323-323), 0.5, bit32.bxor(171,0xAB))
 _lllllll.Size = UDim2.fromOffset((127+-118), _P199x._8x6q(495/55))
 _lllllll.BorderSizePixel = _P199x._8x6q(0/57)
 _lllllll.BackgroundColor3 = C.good
 _lllllll.ZIndex = _P199x._8x6q(8296/68)
 Instance.new("\85\73\67\111\114\110\101\114", _lllllll).CornerRadius = UDim.new(bit32.bxor(170,0xAB), (65+-65))
 local _IIlllll = Instance.new("\84\101\120\116\76\97\98\101\108", _I1llll)
 _IIlllll.Position = UDim2.new(_P199x._8x6q(0/131), (194+-178), (239-239), bit32.bxor(171,0xAB))
 _IIlllll.Size = UDim2.new(bit32.bxor(170,0xAB), -(236-220), bit32.bxor(170,0xAB), (263-263))
 _IIlllll.BackgroundTransparency = (235+-234)
 _IIlllll.Font = Enum.Font.GothamBold
 _IIlllll.TextSize = (13+1)
 _IIlllll.TextColor3 = C._lIl
 _IIlllll.Text = "\78\88\32\83\104\105\101\108\100\115"
 _IIlllll.TextXAlignment = Enum.TextXAlignment.Left
 _IIlllll.ZIndex = bit32.bxor(209,0xAB)
 themed(_IIlllll, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _lIlllll = Instance.new("\84\101\120\116\76\97\98\101\108", _I1llll)
 _lIlllll.AnchorPoint = Vector2.new(_P199x._8x6q(201/201), 0.5)
 _lIlllll.Position = UDim2.new((113+-112), (230+-230), 0.5, bit32.bxor(171,0xAB))
 _lIlllll.Size = UDim2.new(_P199x._8x6q(0/16), (117+-7), (98+-97), bit32.bxor(171,0xAB))
 _lIlllll.BackgroundTransparency = bit32.bxor(170,0xAB)
 _lIlllll.Font = Enum.Font.GothamBold
 _lIlllll.TextSize = (244-233)
 _lIlllll.TextXAlignment = Enum.TextXAlignment.Right
 _lIlllll.ZIndex = (280+-158)
 local function linea(_lIllllIl)
 local d = Instance.new("\70\114\97\109\101", _llllIll1)
 d.LayoutOrder = _lIllllIl
 d.Size = UDim2.new((262+-261), _P199x._8x6q(0/132), (71-71), _P199x._8x6q(189/189))
 d.BackgroundColor3 = C._lIlI1
 d.BackgroundTransparency = 0.4
 d.BorderSizePixel = _P199x._8x6q(0/156)
 d.ZIndex = (417-296)
 themed(d, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\111\114\100\101\114")
 end
 linea((54-53))
 _lIIlIl((325-323), "\85\115\117\97\114\105\111\32\82\111\98\108\111\120", _P199x._8x6q(1320/110), "\115\117\98\116\101\120\116", true)
 local _lIlll   = _lIIIl.valid._l1llIl(_l.Name) ~= nil
 local _IIlll    = _lIIIl.valid._l1l1(_l.UserId) ~= nil
 local _llIlll  = _lIIlIl(_P199x._8x6q(477/159), "", (116-104), "\116\101\120\116", true)
 _llIlll.Text   = (_lIlll and "\10003\32" or "\10005\32") .. _l.Name .. "\32\32\183\32\32" .. _P199x._yp3z(_l.UserId)
 _llIlll.TextColor3 = (_lIlll and _IIlll) and C.good or C.bad
 local _IlIlll = _lIIlIl((325-321), "\69\120\101\99\117\116\111\114\58\32" .. _lII, (434-424), "\115\117\98\116\101\120\116")
 linea((98+-93))
 _lIIlIl(_P199x._8x6q(48/8), "\86\101\114\105\102\105\99\97\99\105\111\110\101\115", bit32.bxor(167,0xAB), "\115\117\98\116\101\120\116", true)
 local _lIIlll = {}
 local function filaProt(_lIllllIl, _IIIIlIl, _llllllII, _I1Il)
 local f = Instance.new("\70\114\97\109\101", _llllIll1)
 f.LayoutOrder = _lIllllIl
 f.Size = UDim2.new((150+-149), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB), (458-414))
 f.BackgroundTransparency = (88-87)
 f.ZIndex = (564-443)
 local _IIIlll = Instance.new("\84\101\120\116\76\97\98\101\108", f)
 _IIIlll.Size = UDim2.new((414-413), -(67+-11), (259-259), (80+-62))
 _IIIlll.BackgroundTransparency = (498-497)
 _IIIlll.Font = Enum.Font.GothamBold
 _IIIlll.TextSize = bit32.bxor(167,0xAB)
 _IIIlll.TextColor3 = C._lIl
 _IIIlll.Text = _IIIIlIl
 _IIIlll.TextXAlignment = Enum.TextXAlignment.Left
 _IIIlll.TextTruncate = Enum.TextTruncate.AtEnd
 _IIIlll.ZIndex = bit32.bxor(209,0xAB)
 themed(_IIIlll, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _lIllllII = Instance.new("\84\101\120\116\76\97\98\101\108", f)
 _lIllllII.Position = UDim2.new((366-366), bit32.bxor(171,0xAB), (489-489), _P199x._8x6q(450/25))
 _lIllllII.Size = UDim2.new((486-485), -_P199x._8x6q(4816/86), _P199x._8x6q(0/128), (202+-178))
 _lIllllII.BackgroundTransparency = (295+-294)
 _lIllllII.Font = Enum.Font.Gotham
do local _pwhk=bit32.bxor(0xFF,0xFF);if _v2et~=0 then error("")end end
 _lIllllII.TextSize = bit32.bxor(161,0xAB)
 _lIllllII.Text = _I1Il
 _lIllllII.TextColor3 = C.subtext
 _lIllllII.TextXAlignment = Enum.TextXAlignment.Left
 _lIllllII.TextWrapped = true
 _lIllllII.TextYAlignment = Enum.TextYAlignment.Top
 _lIllllII.ZIndex = (191-69)
 local _IlI, setOn, setBusy
 _IlI, setOn, setBusy = _lIIIl.makeSwitch(f, _lIIIl.flags[_llllllII], function(_lllIl)
 setBusy(true)
 _lIllllII.Text = "\69\106\101\99\117\116\97\110\100\111\32\118\101\114\105\102\105\99\97\99\105\243\110\8230"
 _lIllllII.TextColor3 = C.warn
 _lIIIl.setFlag(_llllllII, _lllIl, function(_l1, _lIIlII)
 setBusy(false)
 if not _lllIl then
 _lIllllII.Text = (_llllllII == "\97\112\105") and "\86\101\114\105\102\105\99\97\99\105\243\110\32\65\80\73\32\100\101\115\97\99\116\105\118\97\100\97"
 or "\86\97\108\105\100\97\99\105\243\110\32\100\101\32\100\97\116\111\115\32\100\101\115\97\99\116\105\118\97\100\97"
 _lIllllII.TextColor3 = C.subtext
 elseif _l1 then
 _lIllllII.Text = (_llllllII == "\97\112\105") and ("\65\80\73\32\118\101\114\105\102\105\99\97\100\97\32\99\111\114\114\101\99\116\97\109\101\110\116\101\32\183\32" .. _P199x._yp3z(_lIIlII))
 or ("\68\97\116\111\115\32\118\97\108\105\100\97\100\111\115\32\183\32" .. _P199x._yp3z(_lIIlII))
 _lIllllII.TextColor3 = C.good
 else
 _lIllllII.Text = "\70\97\108\108\243\58\32" .. _P199x._yp3z(_lIIlII)
 _lIllllII.TextColor3 = C.bad
 end
 end)
 end)
 _IlI.AnchorPoint = Vector2.new((146-145), (19+-19))
 _IlI.Position = UDim2.new(bit32.bxor(170,0xAB), _P199x._8x6q(0/27), _P199x._8x6q(0/174), (253-249))
 _IlI.ZIndex = _P199x._8x6q(22570/185)
 _lIIlll[_llllllII] = { _lIllllII = _lIllllII, setOn = setOn, setBusy = setBusy, _I1Il = _I1Il }
 end
 filaProt(bit32.bxor(172,0xAB), "\65\80\73\32\86\97\108\105\100\97\116\105\111\110",  "\97\112\105",
 "\67\111\109\112\114\117\101\98\97\32\101\115\116\114\117\99\116\117\114\97\44\32\101\114\114\111\114\101\115\32\121\32\99\243\100\105\103\111\115\32\72\84\84\80\32\100\101\32\99\97\100\97\32\114\101\115\112\117\101\115\116\97\46")
 filaProt(_P199x._8x6q(360/45), "\68\97\116\97\32\86\97\108\105\100\97\116\105\111\110", "\100\97\116\97",
 "\86\97\108\105\100\97\32\117\115\101\114\110\97\109\101\44\32\85\115\101\114\73\100\44\32\102\101\99\104\97\115\44\32\99\111\110\116\97\100\111\114\101\115\44\32\97\118\97\116\97\114\32\101\32\105\116\101\109\115\46")
 linea(bit32.bxor(162,0xAB))
 local _IlllI = _lIIlIl((256-246), "", (131+-121), "\115\117\98\116\101\120\116", false, bit32.bxor(135,0xAB))
 local function refrescar()
 local _IIlI, _I1IIl1, _lIllllII = paleta()
 _lIllIlI1.BackgroundColor3   = _IIlI
 _IIlIlI1.BackgroundColor3   = _IIlI
 _I1lIlI1.BackgroundColor3   = _IIlI
 _lIlIlI1.Color           = _IIlI
 _lllllll.BackgroundColor3 = _IIlI
 _lIlllll.TextColor3    = _IIlI
 _lIlllll.Text          = _I1IIl1
 for _llllllII, f in pairs(_lIIlll) do
 local _lllIl = _lIIIl.flags[_llllllII]
 f.setOn(_lllIl, false)
 f.setBusy(_lIIIl.busy == _llllllII)
 if _lIIIl.busy ~= _llllllII then
 if not _lllIl then
 f._lIllllII.Text = (_llllllII == "\97\112\105") and "\86\101\114\105\102\105\99\97\99\105\243\110\32\65\80\73\32\100\101\115\97\99\116\105\118\97\100\97"
 or "\86\97\108\105\100\97\99\105\243\110\32\100\101\32\100\97\116\111\115\32\100\101\115\97\99\116\105\118\97\100\97"
 f._lIllllII.TextColor3 = C.subtext
 else
 local t = _lIIIl.lastTest and _lIIIl.lastTest[_llllllII]
 if t and not t._l1 then
 f._lIllllII.Text = "\70\97\108\108\243\58\32" .. _P199x._yp3z(t._lIIlII)
 f._lIllllII.TextColor3 = C.bad
 elseif t and t._l1 then
 f._lIllllII.Text = (_llllllII == "\97\112\105")
 and ("\65\80\73\32\118\101\114\105\102\105\99\97\100\97\32\99\111\114\114\101\99\116\97\109\101\110\116\101\32\183\32" .. _P199x._yp3z(t._lIIlII))
 or  ("\68\97\116\111\115\32\118\97\108\105\100\97\100\111\115\32\183\32" .. _P199x._yp3z(t._lIIlII))
 f._lIllllII.TextColor3 = C.good
 else
 f._lIllllII.Text = f._I1Il
 f._lIllllII.TextColor3 = C.subtext
 end
 end
 end
 end
 local r = _lIIIl.run
 local _l1Illl = {
 _I1IlI = "\86\101\114\105\102\105\99\97\100\111", partial = "\80\97\114\99\105\97\108",
 incomplete = "\68\97\116\111\115\32\105\110\99\111\109\112\108\101\116\111\115", error = "\69\114\114\111\114", loading = "\67\97\114\103\97\110\100\111\8230",
 }
 local _I1Illl = r and (_l1Illl[r._llllll] or r._llllll) or "\115\105\110\32\97\110\225\108\105\115\105\115\32\97\250\110"
 _IlllI.Text = _P199x._opmi(
 "\82\101\115\112\117\101\115\116\97\115\32\105\110\115\112\101\99\99\105\111\110\97\100\97\115\58\32\37\100\32\32\183\32\32\98\108\111\113\117\101\97\100\97\115\58\32\37\100\10\67\97\109\112\111\115\32\118\97\108\105\100\97\100\111\115\58\32\37\100\32\32\183\32\32\114\101\99\104\97\122\97\100\111\115\58\32\37\100\10\218\108\116\105\109\111\32\97\110\225\108\105\115\105\115\58\32\37\115",
 _lIIIl.stats.checks, _lIIIl.stats.blocked,
 _lIIIl.stats.fields, _lIIIl.stats.rejected, _I1Illl)
 _IIllIlI1.TextTransparency = (_lIllllII == "\108\111\97\100\105\110\103") and 0.35 or (95+-95)
 end
 refrescar()
 _lIIIl.onChange(refrescar)
 onRepaint(refrescar)
 local _lllIlll = false
 local function setAbierto(v)
 _lllIlll = v
 if v then
 refrescar()
 _llllIll1.Visible = true
 if _IIllIlI.enabled then
 _Illlll.Scale = 0.92
 _llllIll1.BackgroundTransparency = _P199x._8x6q(119/119)
 motionTween(_Illlll, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = (365-364) })
 motionTween(_llllIll1, TweenInfo.new(0.16), { BackgroundTransparency = 0.04 })
 else
 _Illlll.Scale = (210+-209)
 _llllIll1.BackgroundTransparency = 0.04
 end
 else
 if _IIllIlI.enabled then
 motionTween(_Illlll, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.92 })
 motionTween(_llllIll1, TweenInfo.new(0.14), { BackgroundTransparency = _P199x._8x6q(79/79) }, function()
 if not _lllIlll then _llllIll1.Visible = false end
 end)
 else
 _llllIll1.Visible = false
 end
 end
 end
 track(_IllIlI1.MouseButton1Click:Connect(function() setAbierto(not _lllIlll) end))
 track(_IllIlI1.MouseEnter:Connect(function()
 motionTween(_IllIlI1, TweenInfo.new(0.12), { BackgroundTransparency = _P199x._8x6q(0/98) })
 end))
 track(_IllIlI1.MouseLeave:Connect(function()
 motionTween(_IllIlI1, TweenInfo.new(0.16), { BackgroundTransparency = 0.15 })
 end))
 attachTip(_IllIlI1, "\78\88\32\83\104\105\101\108\100\115\32\183\32\101\115\116\97\100\111\32\100\101\32\118\101\114\105\102\105\99\97\99\105\243\110")
do local _cfsepu=1 while _cfsepu>0 do if _cfsepu==1 then
 track(UserInputService.InputBegan:Connect(function(_Illl)
 if not _lllIlll then return end
_cfsepu=0 end end end
 if _Illl.UserInputType ~= Enum.UserInputType.MouseButton1
 and _Illl.UserInputType ~= Enum.UserInputType.Touch then return end
 local p = _Illl.Position
 local function dentro(_I1lllI1)
 local a, b = _I1lllI1.AbsolutePosition, _I1lllI1.AbsoluteSize
 return p.X >= a.X and p.X <= a.X + b.X and p.Y >= a.Y and p.Y <= a.Y + b.Y
 end
 if not dentro(_llllIll1) and not dentro(_IllIlI1) then setAbierto(false) end
 end))
 end)
 local _IIlIlll  = "\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\103\103\47\74\103\115\87\50\77\54\51\50\50"
 local _lIlIlll = ""
 local _llllll, fpsLabel, playersLabel
 pcall(function()
 local _Illlll = Instance.new("\70\114\97\109\101")
 _Illlll.Name = "\80\114\105\115\109\72\85\68"
 _Illlll.AnchorPoint = Vector2.new((436-435), (254+-254))
 _Illlll.Position = UDim2.new((117+-116), -bit32.bxor(167,0xAB), _P199x._8x6q(0/200), (131+-121))
 _Illlll.Size = UDim2.fromOffset(_P199x._8x6q(6900/115), (407-367))
 _Illlll.AutomaticSize = Enum.AutomaticSize.X
 _Illlll.BackgroundColor3 = C.bg
 themed(_Illlll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\103")
 _Illlll.BackgroundTransparency = 0.1
 _Illlll.BorderSizePixel = (291+-291)
 _Illlll.Parent = _lllIlI
 local _lllllll = Instance.new("\85\73\67\111\114\110\101\114", _Illlll); _lllllll.CornerRadius = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(1700/85))
 local _Illllll = Instance.new("\85\73\83\116\114\111\107\101", _Illlll); _Illllll.Thickness = 1.6; _Illllll.Color = C._IlIll1; _Illllll.Transparency = 0.1
 themed(_Illllll, "\67\111\108\111\114", "\97\99\99\101\110\116")
 local _lll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _Illlll)
 _lll.FillDirection = Enum.FillDirection.Horizontal
 _lll.VerticalAlignment = Enum.VerticalAlignment.Center
 _lll.Padding = UDim.new(_P199x._8x6q(0/64), (26-17))
 _lll.SortOrder = Enum.SortOrder.LayoutOrder
 local _lIlllll = Instance.new("\85\73\80\97\100\100\105\110\103", _Illlll)
 _lIlllll.PaddingLeft = UDim.new(_P199x._8x6q(0/49), _P199x._8x6q(1131/87)); _lIlllll.PaddingRight = UDim.new((24+-24), _P199x._8x6q(390/30))
 _lIlllll.PaddingTop = UDim.new((348-348), (247+-242)); _lIlllll.PaddingBottom = UDim.new(_P199x._8x6q(0/198), bit32.bxor(174,0xAB))
 local _IIIl = bit32.bxor(171,0xAB)
 local function cell(_lIlIIll1, _lIl, _l1IlIl, _IIlllll)
 _IIIl += (236+-235)
 local _lIlIl1 = Instance.new("\70\114\97\109\101", _Illlll)
 _lIlIl1.BackgroundTransparency = (308-307)
 _lIlIl1.AutomaticSize = Enum.AutomaticSize.X
 _lIlIl1.Size = UDim2.fromOffset(bit32.bxor(171,0xAB), bit32.bxor(179,0xAB))
 _lIlIl1.LayoutOrder = _IIIl
 local _l1lllll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _lIlIl1)
 _l1lllll.FillDirection = Enum.FillDirection.Horizontal
 _l1lllll.VerticalAlignment = Enum.VerticalAlignment.Center
 _l1lllll.Padding = UDim.new(_P199x._8x6q(0/102), _P199x._8x6q(840/168))
 local _I1lllll = Instance.new("\84\101\120\116\76\97\98\101\108", _lIlIl1)
 _I1lllll.BackgroundTransparency = bit32.bxor(170,0xAB)
 _I1lllll.AutomaticSize = Enum.AutomaticSize.X
 _I1lllll.Size = UDim2.fromOffset((284+-284), (100+-76))
 _I1lllll.Font = Enum.Font.GothamBold
 _I1lllll.TextSize = (329-314)
 _I1lllll.TextColor3 = C._IlIll1
 _I1lllll.LayoutOrder = _P199x._8x6q(37/37)
 themed(_I1lllll, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 if _IIlllll then
 _I1lllll.Text = ""
 _I1lllll.AutomaticSize = Enum.AutomaticSize.None
 _I1lllll.Size = UDim2.fromOffset(bit32.bxor(187,0xAB), bit32.bxor(187,0xAB))
 pcall(_IIlllll, _I1lllll)
 else
 _I1lllll.Text = _lIlIIll1
 end
 local v = Instance.new("\84\101\120\116\76\97\98\101\108", _lIlIl1)
 v.BackgroundTransparency = (65+-64)
 v.AutomaticSize = Enum.AutomaticSize.X
 v.Size = UDim2.fromOffset(_P199x._8x6q(0/65), bit32.bxor(179,0xAB))
 v.Font = Enum.Font.GothamBold
 v.Text = _lIl
 v.TextSize = (82+-68)
 v.TextColor3 = _l1IlIl or Color3.fromRGB(bit32.bxor(71,0xAB), bit32.bxor(69,0xAB), bit32.bxor(89,0xAB))
 v.LayoutOrder = (64-62)
 return v
 end
 local function _I1IIIl()
 _IIIl += (400-399)
 local d = Instance.new("\70\114\97\109\101", _Illlll)
 d.Size = UDim2.fromOffset(_P199x._8x6q(11/11), (336-318))
 d.BackgroundColor3 = Color3.fromRGB(bit32.bxor(84,0xAB), bit32.bxor(84,0xAB), (730-475))
 d.BackgroundTransparency = 0.8
 d.BorderSizePixel = bit32.bxor(171,0xAB)
 d.LayoutOrder = _IIIl
 end
 local function drawBars(_lllI)
 local _llllllll = { _P199x._8x6q(1128/188), (34+-24), (290+-276) }
 for i = (189-188), _P199x._8x6q(456/152) do
 local _IIIll1 = Instance.new("\70\114\97\109\101", _lllI)
 _IIIll1.AnchorPoint = Vector2.new(_P199x._8x6q(0/122), _P199x._8x6q(140/140))
 _IIIll1.Position = UDim2.new(bit32.bxor(171,0xAB), (i - bit32.bxor(170,0xAB)) * (290+-285) + _P199x._8x6q(80/80), bit32.bxor(170,0xAB), -bit32.bxor(170,0xAB))
 _IIIll1.Size = UDim2.fromOffset(bit32.bxor(168,0xAB), _llllllll[i])
 _IIIll1.BorderSizePixel = _P199x._8x6q(0/179)
 _IIIll1.BackgroundColor3 = C._IlIll1
 themed(_IIIll1, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _IIIll1).CornerRadius = UDim.new((1+-1), (46-45))
 end
 end
 local function drawBubble(_lllI)
 local _Ill = Instance.new("\70\114\97\109\101", _lllI)
 _Ill.AnchorPoint = Vector2.new(0.5, 0.5)
 _Ill.Position = UDim2.new(0.5, (46-46), 0.42, (182-182))
 _Ill.Size = UDim2.fromScale(0.78, 0.56)
 _Ill.BackgroundColor3 = Color3.fromRGB(_P199x._8x6q(34935/137), bit32.bxor(84,0xAB), (19+236))
 _Ill.BorderSizePixel = (303-303)
 Instance.new("\85\73\67\111\114\110\101\114", _Ill).CornerRadius = UDim.new(0.42, (281+-281))
 local _IIllllll = Instance.new("\70\114\97\109\101", _lllI)
 _IIllllll.AnchorPoint = Vector2.new(0.5, 0.5)
 _IIllllll.Position = UDim2.new(0.38, bit32.bxor(171,0xAB), 0.7, (76+-76))
 _IIllllll.Size = UDim2.fromScale(0.18, 0.18)
 _IIllllll.Rotation = _P199x._8x6q(8820/196)
 _IIllllll.BackgroundColor3 = Color3.fromRGB(bit32.bxor(84,0xAB), _P199x._8x6q(36465/143), _P199x._8x6q(1020/4))
 _IIllllll.BorderSizePixel = (194-194)
 for i = _P199x._8x6q(73/73), bit32.bxor(168,0xAB) do
 local _l1Ill1 = Instance.new("\70\114\97\109\101", _Ill)
 _l1Ill1.AnchorPoint = Vector2.new(0.5, 0.5)
 _l1Ill1.Position = UDim2.new(0.27 + (i - bit32.bxor(170,0xAB)) * 0.23, (248-248), 0.5, bit32.bxor(171,0xAB))
 _l1Ill1.Size = UDim2.fromScale(0.14, 0.2)
 _l1Ill1.BackgroundColor3 = Color3.fromRGB(bit32.bxor(243,0xAB), bit32.bxor(206,0xAB), (571-329))
 _l1Ill1.BorderSizePixel = _P199x._8x6q(0/90)
 Instance.new("\85\73\67\111\114\110\101\114", _l1Ill1).CornerRadius = UDim.new(_P199x._8x6q(84/84), (290+-290))
 end
 end
 playersLabel = cell("", "\8212\47\8212", C._lIl)
 _I1IIIl()
 _llllll    = cell("", "\8212\32\109\115", C._lIl)
 _I1IIIl()
 fpsLabel     = cell(nil, "\8212\32\102\112\115", C.good, drawBars)
 onRepaint(function()
 if playersLabel and playersLabel.Parent then playersLabel.TextColor3 = C._lIl end
 if _llllll and _llllll.Parent then _llllll.TextColor3 = C._lIl end
 if fpsLabel and fpsLabel.Parent then fpsLabel.TextColor3 = C.good end
 end)
 local function iconButton(_lIlIIll1, _lIllllll, _lllIIlI1, _lIllll, _IIlllll)
 _IIIl += (240+-239)
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110", _Illlll)
 b.Size = UDim2.fromOffset(bit32.bxor(183,0xAB), (280+-252))
 b.AutoButtonColor = false
 b.Text = ""
 b.LayoutOrder = _IIIl
 if _lIllll then
 b.BackgroundColor3 = _lIllll
 else
 b.BackgroundColor3 = C.surface
 themed(b, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\114\102\97\99\101")
 end
 local _IIllll = Instance.new("\85\73\67\111\114\110\101\114", b); _IIllll.CornerRadius = UDim.new((91+-91), _P199x._8x6q(588/42))
 local _IIllIll
 if _lIllllll and _lIllllll ~= "" then
 _IIllIll = Instance.new("\73\109\97\103\101\76\97\98\101\108", b)
 _IIllIll.BackgroundTransparency = bit32.bxor(170,0xAB)
 _IIllIll.AnchorPoint = Vector2.new(0.5, 0.5)
 _IIllIll.Position = UDim2.fromScale(0.5, 0.5)
 _IIllIll.Size = UDim2.fromScale(0.64, 0.64)
 _IIllIll.Image = _lIllllll
 elseif _IIlllll then
 _IIllIll = Instance.new("\70\114\97\109\101", b)
 _IIllIll.BackgroundTransparency = _P199x._8x6q(25/25)
 _IIllIll.AnchorPoint = Vector2.new(0.5, 0.5)
 _IIllIll.Position = UDim2.fromScale(0.5, 0.5)
 _IIllIll.Size = UDim2.fromScale(0.82, 0.82)
 pcall(_IIlllll, _IIllIll)
 else
 _IIllIll = Instance.new("\84\101\120\116\76\97\98\101\108", b)
 _IIllIll.BackgroundTransparency = bit32.bxor(170,0xAB)
 _IIllIll.Size = UDim2.fromScale(_P199x._8x6q(181/181), (112+-111))
 _IIllIll.Font = Enum.Font.GothamBold
 _IIllIll.Text = _lIlIIll1 or "\63"
 _IIllIll.TextSize = _P199x._8x6q(2338/167)
 end
 track(b.MouseButton1Click:Connect(_lllIIlI1))
 return b, _IIllIll
 end
 local function openDiscord()
 if _IIlIlll == "" then return end
 pcall(function() if _llII then _llII(_IIlIlll) end end)
 local _IlIl = _IIlIlll:match("\40\91\37\119\37\45\95\93\43\41\37\115\42\36")
 if not _IlIl or not _III then return end
 task.spawn(function()
 for _llIllll = (6544-81), (6780-308) do
 pcall(function()
 _III({
 Url = "\104\116\116\112\58\47\47\49\50\55\46\48\46\48\46\49\58" .. _llIllll .. "\47\114\112\99\63\118\61\49",
 Method = "\80\79\83\84",
 Headers = {
 ["\67\111\110\116\101\110\116\45\84\121\112\101"] = "\97\112\112\108\105\99\97\116\105\111\110\47\106\115\111\110",
 ["\79\114\105\103\105\110"] = "\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\99\111\109",
 },
 Body = HttpService:JSONEncode({
 cmd = "\73\78\86\73\84\69\95\66\82\79\87\83\69\82",
 args = { _IlIl = _IlIl },
 nonce = HttpService:GenerateGUID(false),
 }),
 })
 end)
 end
 end)
 end
 local _IlIllll = iconButton(nil, _lIlIlll, openDiscord, Color3.fromRGB((69+19), (343-242), (316-74)), drawBubble)
 attachTip(_IlIllll, "\68\105\115\99\111\114\100\32\78\88")
 local _lIIllll = (_Il.ownTag ~= false)
 local _IIIllll
 local function setOwnTag(_lllIl)
 _lIIllll = _lllIl
 _Il.ownTag = _lllIl
 pcall(saveStore)
 if _G._llII1 and _G._llII1.SetShowOwnTag then
 pcall(_G._llII1.SetShowOwnTag, _lllIl)
 end
 if _IIIllll then _IIIllll.Text = _lllIl and "" or "" end
 end
 local _l1Illll, oi = iconButton(_lIIllll and "" or "", nil, function() setOwnTag(not _lIIllll) end)
 _IIIllll = oi
 attachTip(_l1Illll, _lIIllll and "\84\117\32\116\97\103\58\32\118\105\115\105\98\108\101\32\40\99\108\105\99\107\32\61\32\111\99\117\108\116\97\114\41" or "\84\117\32\116\97\103\58\32\111\99\117\108\116\111\32\40\99\108\105\99\107\32\61\32\109\111\115\116\114\97\114\41")
 pcall(function()
 local _IIlIlI = _P199x._4xzj(getfenv(), "\115\101\116\102\112\115\99\97\112") or setfpscap
 if _P199x._iy38(_IIlIlI) == "\102\117\110\99\116\105\111\110" then _IIlIlI(_P199x._8x6q(52000/52)) end
 end)
 local _I1Illll, acc = (291+-291), (11+-11)
 track(RunService.RenderStepped:Connect(function(_llI1I1)
 _I1Illll += (152+-151); acc += _llI1I1
 if acc >= 0.5 then
 if fpsLabel then fpsLabel.Text = _P199x._8x6q(_I1Illll / acc + 0.5) .. "\32\102\112\115" end
 _I1Illll, acc = _P199x._8x6q(0/119), bit32.bxor(171,0xAB)
 end
 end))
 task.spawn(function()
 while _Illlll.Parent do
 local _l1, ms = pcall(function() return _P199x._8x6q((_l:GetNetworkPing() or _P199x._8x6q(0/90)) * (107+893) + 0.5) end)
 if _llllll then _llllll.Text = (_l1 and ms or (209-209)) .. "\32\109\115" end
 if playersLabel then
 local _lllIllll = Players.MaxPlayers
 local _IIlIllll = #Players:GetPlayers()
 playersLabel.Text = (_lllIllll and _lllIllll > bit32.bxor(171,0xAB)) and (_IIlIllll .. "\47" .. _lllIllll) or _P199x._yp3z(_IIlIllll)
 end
 task.wait(_P199x._8x6q(96/96))
 end
 end)
 end)
 local function restyleCircle(_IIIII1)
 if not _IIIII1 or _IIIII1:GetAttribute("\80\114\105\115\109\83\116\121\108\101\100") then return end
 _IIIII1:SetAttribute("\80\114\105\115\109\83\116\121\108\101\100", true)
 local _lIlI = _IIIII1:FindFirstChildOfClass("\85\73\83\116\114\111\107\101")
 local _lIlIllll = (_lIlI and _lIlI.Color) or Color3.fromRGB(bit32.bxor(84,0xAB), (417-162), (277+-22))
 _IIIII1.BackgroundColor3 = Color3.fromRGB((208+-198), (353-343), (153+-141))
 _IIIII1.BackgroundTransparency = _P199x._8x6q(0/193)
 if _lIlI then
 _lIlI.Color = _lIlIllll
 _lIlI.Thickness = (446-443)
 _lIlI.Transparency = (40+-40)
 end
 for _, _lIllI in ipairs(_IIIII1:GetChildren()) do
 if _lIllI:IsA("\84\101\120\116\76\97\98\101\108") then
 _lIllI.TextColor3 = Color3.fromRGB(_P199x._8x6q(27795/109), _P199x._8x6q(40545/159), (291+-36))
 _lIllI.Size = UDim2.fromScale(0.62, 0.62)
 local _llllllI = _lIllI:FindFirstChildOfClass("\85\73\83\116\114\111\107\101")
 if _llllllI then _llllllI.Transparency = _P199x._8x6q(13/13) end
 elseif _lIllI:IsA("\73\109\97\103\101\76\97\98\101\108") then
 _lIllI.ImageColor3 = Color3.fromRGB((95+160), _P199x._8x6q(36975/145), (73+182))
 _lIllI.Size = UDim2.fromScale(0.55, 0.55)
 end
 end
 end
 task.spawn(function()
 local _IIll1 = _l:FindFirstChildOfClass("\80\108\97\121\101\114\71\117\105") or _l:WaitForChild("\80\108\97\121\101\114\71\117\105")
 local _Ill1I1 = _IIll1:FindFirstChild("\78\88\72\101\97\100\84\97\103\115")
 local _llIlll = os.clock()
 while not _Ill1I1 and (os.clock() - _llIlll) < (118+-98) do
 task.wait(0.5); _Ill1I1 = _IIll1:FindFirstChild("\78\88\72\101\97\100\84\97\103\115")
 end
 if not _Ill1I1 then return end
 for _, _IlIlll in ipairs(_Ill1I1:GetChildren()) do
 local c = _IlIlll:FindFirstChild("\67\105\114\99\108\101"); if c then restyleCircle(c) end
 end
 track(_Ill1I1.ChildAdded:Connect(function(_IlIlll)
 task.defer(function()
 local c = _IlIlll:FindFirstChild("\67\105\114\99\108\101"); if c then restyleCircle(c) end
 end)
 end))
 end)
 local _lllIlll = (492-492)
 local function rootOf(_lIllI)
 return _lIllI and (_lIllI:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
 or _lIllI:FindFirstChild("\85\112\112\101\114\84\111\114\115\111") or _lIllI:FindFirstChild("\84\111\114\115\111"))
 end
 track(_IIlllI1.InputBegan:Connect(function(_Illl, _IllIlll)
 if _IllIlll then return end
 if _Illl.UserInputType ~= Enum.UserInputType.MouseButton1
 and _Illl.UserInputType ~= Enum.UserInputType.Touch then return end
 local _IIll1lI = os.clock()
 if _IIll1lI - _lllIlll < 0.4 then return end
 local _lIIlll = workspace.CurrentCamera
 if not _lIIlll then return end
 local _IIll1 = _l:FindFirstChildOfClass("\80\108\97\121\101\114\71\117\105")
 local _Ill1I1 = _IIll1 and _IIll1:FindFirstChild("\78\88\72\101\97\100\84\97\103\115")
 local _lIlIlll = _IIlllI1:GetMouseLocation()
 local _lllllI, bestD
 for _, _IIlIIIl in ipairs(Players:GetPlayers()) do
 if _IIlIIIl ~= _l and _IIlIIIl.Character then
 local _lllIlIl = _IIlIIIl.Character:FindFirstChild("\72\101\97\100")
 local _IIlIlll = _Ill1I1 and _Ill1I1:FindFirstChild("\78\88\72\101\97\100\84\97\103\95" .. _IIlIIIl.UserId)
 if _lllIlIl and _IIlIlll then
 local _l1lIlll, _lllIl = _lIIlll:WorldToViewportPoint(_lllIlIl.Position + Vector3.new((217+-217), 2.6, bit32.bxor(171,0xAB)))
 if _lllIl then
 local d = (Vector2.new(_l1lIlll.X, _l1lIlll.Y) - _lIlIlll).Magnitude
 if not bestD or d < bestD then bestD = d; _lllllI = _IIlIIIl end
 end
 end
 end
 end
 if _lllllI and bestD and bestD <= _P199x._8x6q(3900/65) then
 local _I1lIlll, tR = rootOf(_l.Character), rootOf(_lllllI.Character)
 if _I1lIlll and tR then
 _I1lIlll.CFrame = tR.CFrame
 _lllIlll = _IIll1lI
 end
 end
 end))
end)()
;(function()
 local RunService  = game:GetService("\82\117\110\83\101\114\118\105\99\101")
 local TextService = game:GetService("\84\101\120\116\83\101\114\118\105\99\101")
 local function lerp(a, b, t) return a + (b - a) * t end
 local function lighten(c, f) return Color3.new(lerp(c.R,(207+-206),f), lerp(c.G,(284-283),f), lerp(c.B,bit32.bxor(170,0xAB),f)) end
 local function darken(c, f)  return Color3.new(lerp(c.R,(125-125),f), lerp(c.G,_P199x._8x6q(0/113),f), lerp(c.B,(408-408),f)) end
 pcall(function()
 local _llIIlIl = Instance.new("\70\114\97\109\101", _IIllll)
 _llIIlIl.Name = "\84\111\112\83\112\101\99\117\108\97\114"
 _llIIlIl.Size = UDim2.new((261+-260), -(300+-276), bit32.bxor(171,0xAB), bit32.bxor(170,0xAB))
 _llIIlIl.Position = UDim2.new((129+-129), bit32.bxor(167,0xAB), (207-207), bit32.bxor(170,0xAB))
 _llIIlIl.BackgroundColor3 = Color3.fromRGB(bit32.bxor(84,0xAB), (13+242), (712-457))
 _llIIlIl.BackgroundTransparency = 0.55
 _llIIlIl.BorderSizePixel = (50+-50)
 _llIIlIl.ZIndex = _P199x._8x6q(222/74)
 local g = Instance.new("\85\73\71\114\97\100\105\101\110\116", _llIIlIl)
 g.Transparency = NumberSequence.new({
 NumberSequenceKeypoint.new((460-460), bit32.bxor(170,0xAB)),
 NumberSequenceKeypoint.new(0.5, (8-8)),
 NumberSequenceKeypoint.new(bit32.bxor(170,0xAB), (225+-224)),
 })
 end)
 local function vdivider(_lll, _IIlIlll)
 local d = Instance.new("\70\114\97\109\101", _IIllll)
 d.Name = _lll
 d.AnchorPoint = Vector2.new(0.5, 0.5)
 d.Position = _IIlIlll
 d.Size = UDim2.fromOffset(bit32.bxor(170,0xAB), bit32.bxor(185,0xAB))
 d.BackgroundColor3 = C._IlIll1
 d.BackgroundTransparency = 0.5
 d.BorderSizePixel = (394-394)
 d.ZIndex = (123-120)
 themed(d, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local g = Instance.new("\85\73\71\114\97\100\105\101\110\116", d)
 g.Rotation = _P199x._8x6q(7020/78)
 g.Transparency = NumberSequence.new({
 NumberSequenceKeypoint.new((360-360), (153-152)),
 NumberSequenceKeypoint.new(0.5, 0.15),
 NumberSequenceKeypoint.new((132+-131), (69+-68)),
 })
 return d
do if false then local _23jj=game:GetService("Players");end end
 end
 vdivider("\68\105\118\76\101\102\116",  UDim2.new((374-374), _P199x._8x6q(6290/85), 0.5, bit32.bxor(171,0xAB)))
 vdivider("\68\105\118\82\105\103\104\116", UDim2.new((2+-1), -(443-297), 0.5, (478-478)))
 local _llllIlll, gemStroke
 pcall(function()
 local _IIllIlll = Instance.new("\70\114\97\109\101", _IIllll)
 _IIllIlll.Name = "\78\88\71\101\109"
 _IIllIlll.AnchorPoint = Vector2.new(0.5, 0.5)
 _IIllIlll.Position = UDim2.new(_P199x._8x6q(0/47), (97+-7), 0.5, _P199x._8x6q(0/23))
 _IIllIlll.Size = UDim2.fromOffset((210+-195), (212-197))
 _IIllIlll.Rotation = _P199x._8x6q(540/12)
 _IIllIlll.BackgroundColor3 = C._IlIll1
 _IIllIlll.BorderSizePixel = bit32.bxor(171,0xAB)
 _IIllIlll.ZIndex = (406-403)
 themed(_IIllIlll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 Instance.new("\85\73\67\111\114\110\101\114", _IIllIlll).CornerRadius = UDim.new((187+-187), (16-13))
 _llllIlll = Instance.new("\85\73\71\114\97\100\105\101\110\116", _IIllIlll)
 _llllIlll.Rotation = _P199x._8x6q(13140/146)
 _llllIlll.Color = ColorSequence.new(lighten(C._IlIll1, 0.45), darken(C._IlIll1, 0.12))
 gemStroke = Instance.new("\85\73\83\116\114\111\107\101", _IIllIlll)
 gemStroke.Thickness = 1.2
 gemStroke.Color = lighten(C._IlIll1, 0.55)
 gemStroke.Transparency = 0.15
 local _lIllIlll = Instance.new("\70\114\97\109\101", _IIllIlll)
 _lIllIlll.AnchorPoint = Vector2.new(0.5, 0.5)
 _lIllIlll.Position = UDim2.fromScale(0.5, 0.5)
 _lIllIlll.Size = UDim2.fromScale(0.42, 0.42)
 _lIllIlll.BackgroundColor3 = Color3.fromRGB(bit32.bxor(84,0xAB), _P199x._8x6q(21675/85), (144+111))
 _lIllIlll.BackgroundTransparency = 0.35
 _lIllIlll.BorderSizePixel = (194-194)
 _lIllIlll.ZIndex = (147-143)
 Instance.new("\85\73\67\111\114\110\101\114", _lIllIlll).CornerRadius = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(20/10))
 end)
 local _lIIlll = { "\82\111\98\108\111\120\32\80\114\111\102\105\108\101\32\65\110\97\108\121\122\101\114", "\80\114\111\102\105\108\101\32\65\110\97\108\121\122\101\114", "\65\110\97\108\121\122\101\114", "\78\88" }
 _I1llll.Position       = UDim2.new(_P199x._8x6q(0/196), (176+-70), bit32.bxor(171,0xAB), _P199x._8x6q(0/107))
 _I1llll.Size           = UDim2.new(_P199x._8x6q(115/115), -(107+33), (446-445), bit32.bxor(171,0xAB))
 _I1llll.TextTruncate   = Enum.TextTruncate.AtEnd
 _I1llll.TextXAlignment = Enum.TextXAlignment.Left
 local function widthOf(s)
 local _l1, _lllIll1 = pcall(function()
 return TextService:GetTextSize(s, _I1llll.TextSize, _I1llll.Font, Vector2.new((10273-274), bit32.bxor(207,0xAB))).X
 end)
 return _l1 and _lllIll1 or (#s * (249+-240))
 end
 local function fitTitle()
 local _IIIlll = _I1llll.AbsoluteSize.X - (342-338)
 local _llIIlll = _lIIlll[#_lIIlll]
 for _, t in ipairs(_lIIlll) do
 if widthOf(t) <= _IIIlll then _llIIlll = t; break end
 end
 if _I1llll.Text ~= _llIIlll then _I1llll.Text = _llIIlll end
 local _IlIIlll = _I1llll.Parent:FindFirstChild("\84\105\116\108\101\83\104\105\110\101")
 if _IlIIlll then _IlIIlll.Text = _llIIlll end
 end
 track(_I1llll:GetPropertyChangedSignal("\65\98\115\111\108\117\116\101\83\105\122\101"):Connect(function() pcall(fitTitle) end))
 task.defer(function() pcall(fitTitle) end)
 pcall(function()
 local _IlIIlll = _I1llll.Parent:FindFirstChild("\84\105\116\108\101\83\104\105\110\101")
 if _IlIIlll then _IlIIlll.TextTransparency = 0.6 end
 end)
 local _lIIIlll
 pcall(function()
 _lIIIlll = Instance.new("\85\73\83\116\114\111\107\101", _I1llll)
 _lIIIlll.Thickness = _P199x._8x6q(146/146)
 _lIIIlll.Color = lighten(C._IlIll1, 0.1)
 _lIIIlll.Transparency = 0.72
 _lIIIlll.LineJoinMode = Enum.LineJoinMode.Round
 end)
 local _IIIIlll, sheenGrad
 pcall(function()
 _IIIIlll = Instance.new("\70\114\97\109\101", _IIllll)
 _IIIIlll.Name = "\72\101\97\100\101\114\83\104\101\101\110"
 _IIIIlll.Size = UDim2.new((186+-185), (461-461), (155-155), (160-158))
 _IIIIlll.Position = UDim2.new((127-127), bit32.bxor(171,0xAB), _P199x._8x6q(198/198), -bit32.bxor(169,0xAB))
 _IIIIlll.BackgroundColor3 = C._IlIll1
 _IIIIlll.BackgroundTransparency = 0.4
 _IIIIlll.BorderSizePixel = bit32.bxor(171,0xAB)
 _IIIIlll.ZIndex = (59+-56)
 themed(_IIIIlll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\99\99\101\110\116")
 sheenGrad = Instance.new("\85\73\71\114\97\100\105\101\110\116", _IIIIlll)
 sheenGrad.Transparency = NumberSequence.new({
 NumberSequenceKeypoint.new(0.00, (35-34)),
 NumberSequenceKeypoint.new(0.42, _P199x._8x6q(77/77)),
 NumberSequenceKeypoint.new(0.50, 0.45),
 NumberSequenceKeypoint.new(0.58, _P199x._8x6q(25/25)),
 NumberSequenceKeypoint.new(1.00, _P199x._8x6q(159/159)),
 })
 sheenGrad.Offset = Vector2.new(-_P199x._8x6q(127/127), (102-102))
 end)
 local t = _P199x._8x6q(0/64)
 track(RunService.Heartbeat:Connect(function(_llI1I1)
 if not _lllIlI.Enabled or not _IIllIlI.enabled then return end
 t += _llI1I1
 if sheenGrad then
 local p = (t * 0.30) % (425-423)
 sheenGrad.Offset = Vector2.new(p - _P199x._8x6q(83/83), (179+-179))
 end
 if _lIIIlll then
 _lIIIlll.Transparency = 0.7 + 0.08 * math.sin(t * 1.4)
 end
 end))
 onRepaint(function()
 if _llllIlll     then pcall(function() _llllIlll.Color     = ColorSequence.new(lighten(C._IlIll1,0.45), darken(C._IlIll1,0.12)) end) end
 if gemStroke   then pcall(function() gemStroke.Color   = lighten(C._IlIll1, 0.55) end) end
 if _lIIIlll then pcall(function() _lIIIlll.Color = lighten(C._IlIll1, 0.1)  end) end
 end)
 pcall(function()
 local _Illlll = _lllIlI:FindFirstChild("\80\114\105\115\109\72\85\68")
 if _Illlll then _Illlll.Position = UDim2.new((429-428), -bit32.bxor(187,0xAB), _P199x._8x6q(0/32), bit32.bxor(183,0xAB)) end
 end)
 local function polishButton(b)
 if b:GetAttribute("\78\88\80\111\108\105\115\104\101\100") then return end
 if b:GetAttribute("\78\88\72\111\118\101\114\68\111\110\101") then return end
 b:SetAttribute("\78\88\80\111\108\105\115\104\101\100", true)
 if not b:FindFirstChildOfClass("\85\73\67\111\114\110\101\114") then
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new((205+-205), _P199x._8x6q(36/6))
 end
 local _lIIl = b:FindFirstChildOfClass("\85\73\83\99\97\108\101") or Instance.new("\85\73\83\99\97\108\101", b)
 local _I1lll, pressId = false, (289-289)
 local function to(_I1llIl, _IIlIll1, _IIl, _I1IIlll)
 if _IIllIlI.enabled then
 motionTween(_lIIl, TweenInfo.new(_IIlIll1, _IIl or Enum.EasingStyle.Quad,
 _I1IIlll or Enum.EasingDirection.Out), { Scale = _I1llIl })
 else _lIIl.Scale = _I1llIl end
 end
 track(b.MouseEnter:Connect(function()
 _I1lll = true
 to(1.028, 0.16, Enum.EasingStyle.Back)
 end))
 track(b.MouseLeave:Connect(function()
 _I1lll = false
 pressId = pressId + bit32.bxor(170,0xAB)
 to((463-462), 0.14)
 end))
 track(b.MouseButton1Down:Connect(function()
 pressId = pressId + (282+-281)
 to(0.91, 0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
 end))
 track(b.MouseButton1Up:Connect(function()
 pressId = pressId + (16-15)
 local _l1IIlll = pressId
 to(1.055, 0.18, Enum.EasingStyle.Back)
 task.delay(0.13, function()
 if b.Parent and _l1IIlll == pressId then
 to(_I1lll and 1.028 or (99+-98), 0.12)
 end
 end)
 end))
 end
 pcall(function()
 for _, d in ipairs(_lllll:GetDescendants()) do
 if d:IsA("\84\101\120\116\66\117\116\116\111\110") then pcall(polishButton, d) end
 end
 track(_lllll.DescendantAdded:Connect(function(d)
 if d:IsA("\84\101\120\116\66\117\116\116\111\110") then task.defer(function() pcall(polishButton, d) end) end
 end))
 end)
end)()
;(function()
 local SoundService = game:GetService("\83\111\117\110\100\83\101\114\118\105\99\101")
 local _lllIIlll       = game:GetService("\68\101\98\114\105\115")
 local _IIlIIlll     = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\55\57\55\52\55\48\50\57\48\50\56\49\52"
 local _lIlIIlll = {
 suave    = { _lllI1 = "\114\98\120\97\115\115\101\116\58\47\47\115\111\117\110\100\115\47\98\117\116\116\111\110\46\119\97\118",              _llI1lll = 0.22, _IlI1lll = 0.95 },
 pop      = { _lllI1 = "\114\98\120\97\115\115\101\116\58\47\47\115\111\117\110\100\115\47\101\108\101\99\116\114\111\110\105\99\112\105\110\103\115\104\111\114\116\46\119\97\118", _llI1lll = 0.22, _IlI1lll = 0.60 },
 profundo = { _lllI1 = "\114\98\120\97\115\115\101\116\58\47\47\115\111\117\110\100\115\47\98\97\115\115\46\119\97\118",               _llI1lll = 0.26, _IlI1lll = 1.05 },
 click    = { _lllI1 = "\114\98\120\97\115\115\101\116\58\47\47\115\111\117\110\100\115\47\99\108\105\99\107\102\97\115\116\46\119\97\118",          _llI1lll = 0.22, _IlI1lll = 0.95 },
 _lllllIl     = { _lllI1 = "",                                          _llI1lll = 0.00, _IlI1lll = 1.00 },
 }
 local _ll1lll  = "\115\117\97\118\101"
 local _Il1lll = "\85\116\105\108\105\116\121\73\110\116\114\111"
 local _IlIll1      = (C and C._IlIll1) or Color3.fromRGB(bit32.bxor(211,0xAB), (373-153), _P199x._8x6q(14790/58))
 local function _lIllIlI(_lII, t, _IIl, _lll1lll, _Illll)
 local _l1lI = TweenInfo.new(t, _IIl or Enum.EasingStyle.Quad, _lll1lll or Enum.EasingDirection.Out)
 local x = TweenService:Create(_lII, _l1lI, _Illll)
 x:Play()
 return x
 end
 local function setListaEnabled(_lllIl)
 pcall(function()
 local _l1llllI = _I:FindFirstChild("\76\105\115\116\97\74\117\103\97\100\111\114\101\115\77\111\100\101\114\110\97")
 if _l1llllI then _l1llllI.Enabled = _lllIl end
 end)
 end
 local function hidePanels()
 pcall(function() _lllIlI.Enabled = false end)
 task.defer(setListaEnabled, false)
 end
 local function popIn(_llllll)
 if not _llllll then return end
 pcall(function()
 local _Ill1lll = _llllll:FindFirstChildOfClass("\85\73\83\99\97\108\101") or Instance.new("\85\73\83\99\97\108\101", _llllll)
 _Ill1lll.Scale = 0.9
 TweenService:Create(_Ill1lll, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = _P199x._8x6q(150/150) }):Play()
 end)
 end
 local function revealPanels()
 pcall(function()
 _lllIlI.Enabled = true
 if _llllIlI and _llllIlI.playOpenAnim then _llllIlI.playOpenAnim() end
 end)
 setListaEnabled(true)
 pcall(function()
 local _l1llllI = _I:FindFirstChild("\76\105\115\116\97\74\117\103\97\100\111\114\101\115\77\111\100\101\114\110\97")
 if _l1llllI then popIn(_l1llllI:FindFirstChild("\86\101\110\116\97\110\97")) end
 end)
 end
 local _lIl1lll = {}
 local _IIl1I = false
 local _IIl1lll = false
 function _lIl1lll.play()
 if _IIl1lll then return end
 if _IIl1I then return end
 _IIl1I = true
 hidePanels()
 task.delay((248-242), function()
 pcall(function() if not _lllIlI.Enabled then _lllIlI.Enabled = true end end)
 setListaEnabled(true)
 end)
 pcall(function()
 local _l1lIll1 = _I:FindFirstChild(_Il1lll)
do local _cf3w3g=1 while _cf3w3g>0 do if _cf3w3g==1 then
 if _l1lIll1 then _l1lIll1:Destroy() end
 end)
 task.spawn(function()
_cf3w3g=0 end end end
 local _l1l1lll = Instance.new("\83\99\114\101\101\110\71\117\105")
 _l1l1lll.Name = _Il1lll
 _l1l1lll.ResetOnSpawn = false
 _l1l1lll.IgnoreGuiInset = true
 _l1l1lll.DisplayOrder = 100000
 _l1l1lll.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 _l1l1lll.Parent = _I
 local _I1l1lll = Instance.new("\70\114\97\109\101")
 _I1l1lll.AnchorPoint = Vector2.new(0.5, 0.5)
 _I1l1lll.Position = UDim2.fromScale(0.5, 0.46)
 _I1l1lll.Size = UDim2.fromOffset((6+174), (21+179))
 _I1l1lll.BackgroundTransparency = bit32.bxor(170,0xAB)
 _I1l1lll.ZIndex = (250-248)
 _I1l1lll.Parent = _l1l1lll
 local _llll1lll = Instance.new("\85\73\83\99\97\108\101", _I1l1lll)
 _llll1lll.Scale = 0.6
 local _lI1 = _P199x._8x6q(2852/23)
 local _IIll1lll = Instance.new("\70\114\97\109\101")
 _IIll1lll.AnchorPoint = Vector2.new(0.5, 0.5)
 _IIll1lll.Position = UDim2.new(0.5, _P199x._8x6q(0/108), (315-315), bit32.bxor(237,0xAB))
 _IIll1lll.Size = UDim2.fromOffset(_lI1 + _P199x._8x6q(2538/141), _lI1 + bit32.bxor(185,0xAB))
 _IIll1lll.BackgroundColor3 = _IlIll1
 _IIll1lll.BackgroundTransparency = (192+-191)
 _IIll1lll.BorderSizePixel = _P199x._8x6q(0/98)
 _IIll1lll.ZIndex = bit32.bxor(170,0xAB)
 _IIll1lll.Parent = _I1l1lll
 Instance.new("\85\73\67\111\114\110\101\114", _IIll1lll).CornerRadius = UDim.new(_P199x._8x6q(27/27), (369-369))
 local _lIll1lll = Instance.new("\70\114\97\109\101")
 _lIll1lll.AnchorPoint = Vector2.new(0.5, 0.5)
 _lIll1lll.Position = UDim2.new(0.5, bit32.bxor(171,0xAB), (42+-42), (54+16))
 _lIll1lll.Size = UDim2.fromOffset(_lI1, _lI1)
 _lIll1lll.BackgroundColor3 = Color3.fromRGB((255+-241), _P199x._8x6q(840/60), _P199x._8x6q(144/8))
 _lIll1lll.BackgroundTransparency = (166+-165)
 _lIll1lll.BorderSizePixel = (24-24)
 _lIll1lll.ClipsDescendants = true
 _lIll1lll.ZIndex = bit32.bxor(169,0xAB)
 _lIll1lll.Parent = _I1l1lll
 Instance.new("\85\73\67\111\114\110\101\114", _lIll1lll).CornerRadius = UDim.new((81-80), _P199x._8x6q(0/9))
 local _lllI1lI = Instance.new("\85\73\83\116\114\111\107\101", _lIll1lll)
 _lllI1lI.Color = _IlIll1
 _lllI1lI.Thickness = 1.5
 _lllI1lI.Transparency = bit32.bxor(170,0xAB)
 local _lI1lll = Instance.new("\84\101\120\116\76\97\98\101\108", _lIll1lll)
 _lI1lll.AnchorPoint = Vector2.new(0.5, 0.5)
 _lI1lll.Position = UDim2.fromScale(0.5, 0.5)
 _lI1lll.Size = UDim2.fromScale(0.72, 0.72)
 _lI1lll.BackgroundTransparency = _P199x._8x6q(20/20)
 _lI1lll.Text = "\78\88"
 _lI1lll.Font = Enum.Font.GothamBlack
 _lI1lll.TextColor3 = Color3.fromRGB((689-434), (44+211), (130+125))
 _lI1lll.TextScaled = true
 _lI1lll.TextTransparency = (233-232)
 _lI1lll.ZIndex = (120-117)
 local _IllII1 = Instance.new("\84\101\120\116\76\97\98\101\108")
 _IllII1.AnchorPoint = Vector2.new(0.5, bit32.bxor(171,0xAB))
 _IllII1.Position = UDim2.new(0.5, (454-454), bit32.bxor(171,0xAB), bit32.bxor(37,0xAB))
 _IllII1.Size = UDim2.fromOffset(_P199x._8x6q(10360/37), (65+-47))
 _IllII1.BackgroundTransparency = (129+-128)
 _IllII1.Font = Enum.Font.GothamMedium
 _IllII1.Text = "\80\32\82\32\79\32\70\32\73\32\76\32\69\32\32\32\65\32\78\32\65\32\76\32\89\32\90\32\69\32\82"
 _IllII1.TextSize = (240+-228)
 _IllII1.TextColor3 = _IlIll1
 _IllII1.TextTransparency = _P199x._8x6q(89/89)
 _IllII1.ZIndex = (464-461)
 _IllII1.Parent = _I1l1lll
 local _II1lll = _lIlIIlll[_ll1lll] or _lIlIIlll.suave
 local function playTone(_lllI1, _llI1lll, _IlI1lll)
 if not _lllI1 or _lllI1 == "" then return end
 pcall(function()
 local _lII1lll = Instance.new("\83\111\117\110\100")
 _lII1lll.SoundId       = _lllI1
 _lII1lll.Volume        = _llI1lll or 0.5
 _lII1lll.PlaybackSpeed = _IlI1lll or (42-41)
 _lII1lll.Parent        = SoundService
 SoundService:PlayLocalSound(_lII1lll)
 _lllIIlll:AddItem(_lII1lll, (184-179))
 end)
 end
 local RunService = game:GetService("\82\117\110\83\101\114\118\105\99\101")
 local _III1lll, SPINS = 1.25, (309-308)
 local _l1I1lll = 0.35
 local _I1I1lll
 local function startSpin()
 local _llIlll = os.clock()
 _I1I1lll = RunService.RenderStepped:Connect(function()
 local p = (os.clock() - _llIlll) / _III1lll
 if p >= (249-248) then
 _llll1lll.Scale = (284+-283)
 _lIll1lll.Size = UDim2.fromOffset(_lI1, _lI1)
 _IIll1lll.Size = UDim2.fromOffset(_lI1 + (89-71), _lI1 + (251-233))
 _lIll1lll.BackgroundColor3 = Color3.fromRGB((297-283), bit32.bxor(165,0xAB), bit32.bxor(185,0xAB))
 _lI1lll.TextColor3   = Color3.fromRGB(bit32.bxor(84,0xAB), _P199x._8x6q(6630/26), (21+234))
 playTone(_II1lll._lllI1, _II1lll._llI1lll, _II1lll._IlI1lll)
 if _I1I1lll then _I1I1lll:Disconnect(); _I1I1lll = nil end
 return
 end
 local s = _P199x._8x6q(80/80) - (_P199x._8x6q(136/136) - p) ^ (419-416)
 _llll1lll.Scale = _l1I1lll + (_P199x._8x6q(141/141) - _l1I1lll) * s
 local _lllI1lll = math.cos(s * SPINS * (59+-57) * math.pi)
 local w    = _P199x._tl3k(_lllI1lll)
 local n    = (_lllI1lll + (221-220)) * 0.5
 _lIll1lll.Size = UDim2.fromOffset(math._lllIIl(_lI1 * w, _lI1 * 0.03), _lI1)
 _IIll1lll.Size = UDim2.fromOffset(math._lllIIl((_lI1 + (50-32)) * w, (_lI1 + (439-421)) * 0.03), _lI1 + _P199x._8x6q(3474/193))
 local _IIllll = 0.18 + 0.82 * n
 _lIll1lll.BackgroundColor3 = Color3.fromRGB(_P199x._8x6q((414-400) * _IIllll), _P199x._8x6q(bit32.bxor(165,0xAB) * _IIllll), _P199x._8x6q(bit32.bxor(185,0xAB) * _IIllll))
 _lI1lll.TextColor3   = Color3.fromRGB(_P199x._8x6q((419-164) * _IIllll), _P199x._8x6q((12+243) * _IIllll), _P199x._8x6q(bit32.bxor(84,0xAB) * _IIllll))
 end)
 end
 _llll1lll.Scale = _l1I1lll
 _lIllIlI(_IIll1lll,    0.30, Enum.EasingStyle.Quad, nil, { BackgroundTransparency = 0.72 })
 _lIllIlI(_lIll1lll,    0.28, Enum.EasingStyle.Quad, nil, { BackgroundTransparency = bit32.bxor(171,0xAB) })
 _lIllIlI(_lllI1lI, 0.32, Enum.EasingStyle.Quad, nil, { Transparency = 0.18 })
 _lIllIlI(_lI1lll,0.28, Enum.EasingStyle.Quad, nil, { TextTransparency = bit32.bxor(171,0xAB) })
 startSpin()
 task.delay(_III1lll * 0.72, function()
 _lIllIlI(_IllII1, 0.45, Enum.EasingStyle.Quad, nil, { TextTransparency = 0.12 })
 end)
 task.wait(_III1lll + 0.2)
 if _I1I1lll then _I1I1lll:Disconnect(); _I1I1lll = nil end
 _lIll1lll.Size = UDim2.fromOffset(_lI1, _lI1)
 revealPanels()
 _lIllIlI(_llll1lll,  0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.In, { Scale = 1.14 })
 _lIllIlI(_lllI1lI, 0.40, Enum.EasingStyle.Quad, nil, { Transparency = (140-139) })
 _lIllIlI(_lI1lll, 0.40, Enum.EasingStyle.Quad, nil, { TextTransparency = _P199x._8x6q(128/128) })
 _lIllIlI(_lIll1lll,    0.40, Enum.EasingStyle.Quad, nil, { BackgroundTransparency = (358-357) })
 _lIllIlI(_IllII1,     0.35, Enum.EasingStyle.Quad, nil, { TextTransparency = bit32.bxor(170,0xAB) })
 _lIllIlI(_IIll1lll,    0.40, Enum.EasingStyle.Quad, nil, { BackgroundTransparency = bit32.bxor(170,0xAB) })
 task.wait(0.5)
 if _I1I1lll then _I1I1lll:Disconnect(); _I1I1lll = nil end
 pcall(function() _l1l1lll:Destroy() end)
 _IIl1I = false
 end)
 end
 function _lIl1lll.reset()
 _Il.introSeen = false
 pcall(saveStore)
 end
 function _lIl1lll.setEnabled(_lllIl)
 _Il.introEnabled = _lllIl and true or false
 pcall(saveStore)
 end
 _G._lIl1lll = _lIl1lll
 local _IIlI1lll = false
 if (not _IIl1lll) and (_Il.introEnabled ~= false) and (_IIlI1lll or _Il.introSeen ~= true) then
 _Il.introSeen = true
 pcall(saveStore)
 _lIl1lll.play()
 end
end)()
;(function()
 local Players = game:GetService("\80\108\97\121\101\114\115")
 local UserInputService = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
 local TweenService = game:GetService("\84\119\101\101\110\83\101\114\118\105\99\101")
 local HttpService = game:GetService("\72\116\116\112\83\101\114\118\105\99\101")
 local _l = Players._III1
 local _I = _l:WaitForChild("\80\108\97\121\101\114\71\117\105")
 local _lIlI1lll = _P199x._4xzj(_G, "\78\88\84\104\101\109\101")
 local C = _lIlI1lll and _lIlI1lll.C or nil
 local _IlIIlI1 = Color3.fromRGB((618-363), _P199x._8x6q(51255/201), (145+110))
 local _lllllll = {
 bg=Color3.fromRGB((149-129),(282+-267),(146+-118)), _IIllll=Color3.fromRGB((124+-91),(210+-186),(146+-100)), _IlI=Color3.fromRGB(bit32.bxor(143,0xAB),_P199x._8x6q(2430/90),_P199x._8x6q(1850/37)),
 _Illl=Color3.fromRGB(bit32.bxor(177,0xAB),_P199x._8x6q(570/30),(400-362)), neutral=Color3.fromRGB((229+-187),(291-260),(292-234)), _lIlI1=Color3.fromRGB((262+-202),(220+-175),(33+49)),
 _IlIll1=Color3.fromRGB(bit32.bxor(11,0xAB),bit32.bxor(207,0xAB),_P199x._8x6q(26040/124)), accent2=Color3.fromRGB((221-99),(544-462),(134+44)), onAccent=_IlIIlI1,
 _lIl=Color3.fromRGB((238+0),_P199x._8x6q(43804/188),_P199x._8x6q(25830/105)), subtext=Color3.fromRGB((462-304),bit32.bxor(36,0xAB),(640-464)),
 good=Color3.fromRGB(bit32.bxor(251,0xAB),_P199x._8x6q(16340/86),_P199x._8x6q(6490/59)), bad=Color3.fromRGB((320-124),(140+-62),(71+21)),
 avatarBg=Color3.fromRGB(_P199x._8x6q(2496/48),(76+-36),(53+19)), scrollbar=Color3.fromRGB((184-76),(116+-30),_P199x._8x6q(20580/147)),
 globe=Color3.fromRGB((492-332),(216+-116),bit32.bxor(121,0xAB)),
 }
 local function lighten(c, k) return Color3.new(_P199x._7ofy(c.R+k,_P199x._8x6q(130/130)), _P199x._7ofy(c.G+k,_P199x._8x6q(8/8)), _P199x._7ofy(c.B+k,_P199x._8x6q(106/106))) end
 local function darken(c, k) return Color3.new(c.R*k, c.G*k, c.B*k) end
 local function _IlIIll1(_l1I)
 if _l1I == "\119\104\105\116\101" then return _IlIIlI1 end
 if C then
 local _Illllll = C[_l1I]
 if _Illllll ~= nil then return _Illllll end
 if _l1I == "\104\101\97\100\101\114"    then return C.surface end
 if _l1I == "\97\118\97\116\97\114\66\103"  then return C.surface end
 if _l1I == "\115\99\114\111\108\108\98\97\114" then return C._IlIll1 end
 if _l1I == "\103\108\111\98\101"     then return C._IlIll1 end
 if _l1I == "\97\99\99\101\110\116\50"   then return darken(C._IlIll1, 0.78) end
 end
 return _lllllll[_l1I] or _lllllll._IlIll1
 end
 local _llllllll = {}
 local _Illlllll = true
 local function pthemed(_lII, _III, _l1I)
 local _lIl = { _lII = _lII, _III = _III, _l1I = _l1I }
 _P199x._l50o(_llllllll, _lIl)
 pcall(function() _lII.Destroying:Connect(function() _lIl._lII = nil end) end)
 pcall(function() _lII[_III] = _IlIIll1(_l1I) end)
 return _lII
 end
 local _lIllllll = {}
 local function onPrepaint(_I1I)
 _P199x._l50o(_lIllllll, _I1I)
 return function()
 for i = #_lIllllll, bit32.bxor(170,0xAB), -bit32.bxor(170,0xAB) do
do local _rnu1=math.abs(-0);if _p2yy>1 then warn("")end end
 if _lIllllll[i] == _I1I then _P199x._otn1(_lIllllll, i) end
 end
 end
 end
 local function prepaint()
 if not _Illlllll then return end
 local n = (117+-117)
 for i = (328-327), #_llllllll do
 local e = _llllllll[i]
 if e._lII then
 n = n + (102+-101)
 _llllllll[n] = e
 pcall(function() e._lII[e._III] = _IlIIll1(e._l1I) end)
 end
 end
 for i = #_llllllll, n + _P199x._8x6q(91/91), -bit32.bxor(170,0xAB) do _llllllll[i] = nil end
 for _, _I1I in ipairs(_lIllllll) do pcall(_I1I) end
 end
 if _lIlI1lll and _lIlI1lll.onRepaint then pcall(_lIlI1lll.onRepaint, prepaint) end
 local _IIllllll = setmetatable({}, { __index = function(_, k) return _IlIIll1(k) end })
 local function _IllI(_I1IIl1)
 local _l1llllll = { (getgenv and getgenv().setclipboard), setclipboard, (syn and syn.write_clipboard), toclipboard }
 for _, _I1I in ipairs(_l1llllll) do
 if _P199x._iy38(_I1I) == "\102\117\110\99\116\105\111\110" then
 local _l1 = pcall(_I1I, _I1IIl1)
 if _l1 then return true end
 end
 end
 warn("\91\76\105\115\116\97\93\32\78\111\32\115\101\32\101\110\99\111\110\116\114\243\32\117\110\97\32\102\117\110\99\105\243\110\32\100\101\32\112\111\114\116\97\112\97\112\101\108\101\115\32\100\105\115\112\111\110\105\98\108\101\46")
 return false
 end
 local _III = (syn and syn.request) or http_request or request or (http and http.request)
 local function apiGet(_IlII)
 local _Ill
 if _III then
 local _l1, _IIlII = pcall(_III, { Url = _IlII, Method = "\71\69\84" })
 if _l1 and _IIlII and _IIlII.Body then _Ill = _IIlII.Body end
 end
 if not _Ill then
 local _l1, _IIlII = pcall(function() return game:HttpGet(_IlII) end)
 if _l1 then _Ill = _IIlII end
 end
 if not _Ill then return nil end
 local _l1, _lllIl = pcall(function() return HttpService:JSONDecode(_Ill) end)
 return _l1 and _lllIl or nil
 end
 local function apiPost(_IlII, _I1llllll)
 if not _III then return nil end
 local _l1, _IIlII = pcall(_III, {
 Url = _IlII, Method = "\80\79\83\84",
 Headers = { ["\67\111\110\116\101\110\116\45\84\121\112\101"] = "\97\112\112\108\105\99\97\116\105\111\110\47\106\115\111\110" },
 Body = HttpService:JSONEncode(_I1llllll),
 })
 if not (_l1 and _IIlII and _IIlII.Body) then return nil end
 local _IIII, _lllIl = pcall(function() return HttpService:JSONDecode(_IIlII.Body) end)
 return _IIII and _lllIl or nil
 end
 local _l1II = {}
 local _lllllllll = "\114\98\120\97\115\115\101\116\105\100\58\47\47\48"
 local function cargarAvatarAsync(_l1l1, _IIlllllll)
 if _l1II[_l1l1] then
 _IIlllllll.Image = _l1II[_l1l1]
 return
 end
 task.spawn(function()
 local _l1, _lIIlII = pcall(function()
 return Players:GetUserThumbnailAsync(_l1l1, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
 end)
 local _IIllIll = (_l1 and _lIIlII ~= "" and _lIIlII) or _lllllllll
 _l1II[_l1l1] = _IIllIll
 if _IIlllllll and _IIlllllll.Parent then
 _IIlllllll.Image = _IIllIll
 end
 end)
 end
 if _I:FindFirstChild("\76\105\115\116\97\74\117\103\97\100\111\114\101\115\77\111\100\101\114\110\97") then
 _I.ListaJugadoresModerna:Destroy()
 end
 local _lllIlI = Instance.new("\83\99\114\101\101\110\71\117\105")
 _lllIlI.Name = "\76\105\115\116\97\74\117\103\97\100\111\114\101\115\77\111\100\101\114\110\97"
 _lllIlI.ResetOnSpawn = false
 _lllIlI.IgnoreGuiInset = true
 _lllIlI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 _lllIlI.DisplayOrder = 2147482
 _lllIlI.Parent = _I
 local _lIlllllll = {}
 local function ltrack(_IllIlI) _P199x._l50o(_lIlllllll, _IllIlI); return _IllIlI end
 _lllIlI.AncestryChanged:Connect(function(_, _llIIllll)
 if not _llIIllll then
 _Illlllll = false
 for _, c in ipairs(_lIlllllll) do pcall(function() c:Disconnect() end) end
 table.clear(_lIlllllll)
 table.clear(_llllllll)
 table.clear(_lIllllll)
 end
 end)
 local _lIIllll, ALTO = _P199x._8x6q(3040/8), (593-113)
 local _IIIllll = Instance.new("\70\114\97\109\101")
 _IIIllll.Name = "\86\101\110\116\97\110\97"
 _IIIllll.Size = UDim2.new((240-240), _lIIllll, _P199x._8x6q(0/27), ALTO)
 _IIIllll.Position = UDim2.new(0.5, (762-454), 0.5, -ALTO/(5+-3))
 _IIIllll.BorderSizePixel = bit32.bxor(171,0xAB)
 _IIIllll.ClipsDescendants = true
 _IIIllll.Parent = _lllIlI
 pthemed(_IIIllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\98\103")
 Instance.new("\85\73\67\111\114\110\101\114", _IIIllll).CornerRadius = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(1100/110))
 local _IlIIllll = Instance.new("\85\73\83\116\114\111\107\101", _IIIllll)
 _IlIIllll.Thickness = 1.2
 _IlIIllll.Transparency = 0.4
 pthemed(_IlIIllll, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _lIIIllll = Instance.new("\70\114\97\109\101", _IIIllll)
 _lIIIllll.Name = "\69\110\99\97\98\101\122\97\100\111"
 _lIIIllll.Size = UDim2.new(_P199x._8x6q(38/38), (254-254), (284-284), (96+-62))
 _lIIIllll.BorderSizePixel = (280+-280)
 pthemed(_lIIIllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\104\101\97\100\101\114")
 Instance.new("\85\73\67\111\114\110\101\114", _lIIIllll).CornerRadius = UDim.new((323-323), bit32.bxor(161,0xAB))
 local _lIIIl1 = Instance.new("\84\101\120\116\76\97\98\101\108", _lIIIllll)
 _lIIIl1.Size = UDim2.new((492-491), -(547-437), (230+-229), (166+-166))
 _lIIIl1.Position = UDim2.new(_P199x._8x6q(0/114), (138+-124), (135+-135), bit32.bxor(171,0xAB))
 _lIIIl1.BackgroundTransparency = _P199x._8x6q(169/169)
 _lIIIl1.Font = Enum.Font.GothamBold
 _lIIIl1.Text = "\74\117\103\97\100\111\114\101\115\58\32\48"
 _lIIIl1.TextSize = (158-144)
 _lIIIl1.TextXAlignment = Enum.TextXAlignment.Left
 _lIIIl1.TextTruncate = Enum.TextTruncate.AtEnd
 pthemed(_lIIIl1, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _IIIIllll = Instance.new("\70\114\97\109\101", _lIIIllll)
 _IIIIllll.Name = "\67\111\110\116\114\111\108\101\115"
 _IIIIllll.AnchorPoint = Vector2.new(bit32.bxor(170,0xAB), 0.5)
 _IIIIllll.Position = UDim2.new((304-303), -bit32.bxor(163,0xAB), 0.5, bit32.bxor(171,0xAB))
 _IIIIllll.Size = UDim2.new(_P199x._8x6q(0/113), bit32.bxor(179,0xAB)*_P199x._8x6q(273/91) + (365-359)*_P199x._8x6q(328/164), _P199x._8x6q(0/125), (161+-137))
 _IIIIllll.BackgroundTransparency = (231+-230)
 local _l1IIllll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _IIIIllll)
 _l1IIllll.FillDirection = Enum.FillDirection.Horizontal
 _l1IIllll.Padding = UDim.new((23-23), (239+-233))
 _l1IIllll.SortOrder = Enum.SortOrder.LayoutOrder
 _l1IIllll.VerticalAlignment = Enum.VerticalAlignment.Center
 local function crearControl(_lIllllIl, _l1IIlI1, _lllIIlI1)
 local b = Instance.new("\84\101\120\116\66\117\116\116\111\110", _IIIIllll)
 b.Size = UDim2.new((329-329), bit32.bxor(179,0xAB), bit32.bxor(171,0xAB), (264+-240))
 b.LayoutOrder = _lIllllIl
 b.AutoButtonColor = false
 b.Text = ""
 b.BorderSizePixel = (163+-163)
 b.Active = true
 b:SetAttribute("\114\111\108\66\97\115\101", _l1IIlI1)
 Instance.new("\85\73\67\111\114\110\101\114", b).CornerRadius = UDim.new((35-35), (227-221))
 pthemed(b, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", _l1IIlI1)
 local _lIlI = Instance.new("\85\73\83\116\114\111\107\101", b)
 _lIlI.Thickness = (497-496)
 _lIlI.Transparency = 0.35
 pthemed(_lIlI, "\67\111\108\111\114", "\98\111\114\100\101\114")
 b.MouseEnter:Connect(function()
 TweenService:Create(b, TweenInfo.new(0.12), { BackgroundColor3 = lighten(_IlIIll1(_l1IIlI1), 0.10) }):Play()
 end)
 b.MouseLeave:Connect(function()
 TweenService:Create(b, TweenInfo.new(0.16), { BackgroundColor3 = _IlIIll1(_l1IIlI1) }):Play()
 end)
 b.MouseButton1Click:Connect(_lllIIlI1)
 return b
 end
 local _I1IIllll, maximizado = false, false
 local _lllIIllll = UDim2.new(bit32.bxor(171,0xAB), _lIIllll, bit32.bxor(171,0xAB), ALTO)
 local _IIlIIllll = _IIIllll.Position
 local function aplicarVentana(_llIllll)
 local _I1Ill1, _IIlIlll
 if maximizado then
 _I1Ill1 = UDim2.new(0.96, bit32.bxor(171,0xAB), 0.92, (249+-249))
 _IIlIlll  = UDim2.new(0.02, _P199x._8x6q(0/158), 0.04, _P199x._8x6q(0/170))
 else
 _I1Ill1 = _lllIIllll
 _IIlIlll  = _IIlIIllll
 end
 if _I1IIllll then
 _I1Ill1 = UDim2.new(_I1Ill1.X.Scale, _I1Ill1.X.Offset, (193+-193), (437-403))
 end
 local _IIlIll1 = _llIllll == false and (43+-43) or 0.3
 local _l1lI = TweenInfo.new(_IIlIll1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
 TweenService:Create(_IIIllll, _l1lI, { Size = _I1Ill1, Position = _IIlIlll }):Play()
 if _IIlIll1 > _P199x._8x6q(0/102) then
 local _lIlIIllll = _IIIllll:FindFirstChild("\68\114\97\103\83\99\97\108\101")
 if _lIlIIllll then
 _lIlIIllll.Scale = 0.98
 TweenService:Create(_lIlIIllll, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = _P199x._8x6q(42/42) }):Play()
 end
 end
 end
 local _IIlIIlI1 = crearControl(bit32.bxor(170,0xAB), "\110\101\117\116\114\97\108", function()
 _I1IIllll = not _I1IIllll
 aplicarVentana(true)
 end)
 do
 local _IIIll1 = Instance.new("\70\114\97\109\101", _IIlIIlI1)
 _IIIll1.AnchorPoint = Vector2.new(0.5, 0.5)
 _IIIll1.Position = UDim2.new(0.5, bit32.bxor(171,0xAB), 0.5, (172-172))
 _IIIll1.Size = UDim2.new(bit32.bxor(171,0xAB), (167+-156), bit32.bxor(171,0xAB), (27+-25))
 _IIIll1.BorderSizePixel = bit32.bxor(171,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _IIIll1).CornerRadius = UDim.new(_P199x._8x6q(84/84), (144+-144))
 pthemed(_IIIll1, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\116\101\120\116")
 end
 local _lIlIIlI1 = crearControl(_P199x._8x6q(318/159), "\110\101\117\116\114\97\108", function()
 maximizado = not maximizado
 if maximizado then _I1IIllll = false end
 aplicarVentana(true)
 end)
 do
 local _I1lllll = Instance.new("\70\114\97\109\101", _lIlIIlI1)
 _I1lllll.AnchorPoint = Vector2.new(0.5, 0.5)
 _I1lllll.Position = UDim2.new(0.5, _P199x._8x6q(0/194), 0.5, bit32.bxor(171,0xAB))
 _I1lllll.Size = UDim2.new(bit32.bxor(171,0xAB), (220+-208), bit32.bxor(171,0xAB), (196+-185))
 _I1lllll.BackgroundTransparency = bit32.bxor(170,0xAB)
 _I1lllll.BorderSizePixel = _P199x._8x6q(0/60)
 Instance.new("\85\73\67\111\114\110\101\114", _I1lllll).CornerRadius = UDim.new((492-492), bit32.bxor(169,0xAB))
 local _IlIl = Instance.new("\85\73\83\116\114\111\107\101", _I1lllll)
 _IlIl.Thickness = 1.6
 pthemed(_IlIl, "\67\111\108\111\114", "\116\101\120\116")
 end
 local _IlIllll = crearControl((248+-245), "\98\97\100", function()
 _Illlllll = false
 local _lIlIIllll = _IIIllll:FindFirstChild("\68\114\97\103\83\99\97\108\101")
 if _lIlIIllll then
 TweenService:Create(_lIlIIllll, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.9 }):Play()
 TweenService:Create(_IIIllll, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { BackgroundTransparency = (275+-274) }):Play()
 task.delay(0.2, function() _lllIlI:Destroy() end)
 else
 _lllIlI:Destroy()
 end
 end)
 do
 local x = Instance.new("\84\101\120\116\76\97\98\101\108", _IlIllll)
 x.Size = UDim2.new((415-414), _P199x._8x6q(0/85), (102-101), bit32.bxor(171,0xAB))
 x.BackgroundTransparency = bit32.bxor(170,0xAB)
 x.Font = Enum.Font.GothamBold
 x.TextSize = bit32.bxor(165,0xAB)
 x.Text = "\88"
 x.TextColor3 = _IlIIlI1
 end
 local _lllIllll = Instance.new("\84\101\120\116\66\111\120", _IIIllll)
 _lllIllll.Size = UDim2.new(bit32.bxor(170,0xAB), -(185+-169), (265-265), _P199x._8x6q(540/18))
 _lllIllll.Position = UDim2.new((173-173), bit32.bxor(163,0xAB), (142+-142), _P199x._8x6q(3696/88))
 _lllIllll.PlaceholderText = "\66\117\115\99\97\114\32\101\110\32\101\108\32\115\101\114\118\105\100\111\114\32\111\32\101\110\32\116\111\100\111\32\82\111\98\108\111\120\46\46\46"
 _lllIllll.Font = Enum.Font.Gotham
 _lllIllll.TextSize = (431-418)
 _lllIllll.BorderSizePixel = (250+-250)
 _lllIllll.ClearTextOnFocus = false
 _lllIllll.Text = ""
 _lllIllll.TextXAlignment = Enum.TextXAlignment.Left
 pthemed(_lllIllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\105\110\112\117\116")
 pthemed(_lllIllll, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 pthemed(_lllIllll, "\80\108\97\99\101\104\111\108\100\101\114\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 Instance.new("\85\73\67\111\114\110\101\114", _lllIllll).CornerRadius = UDim.new(bit32.bxor(171,0xAB), bit32.bxor(165,0xAB))
 local _IllIllll = Instance.new("\85\73\80\97\100\100\105\110\103", _lllIllll)
 _IllIllll.PaddingLeft = UDim.new((169+-169), _P199x._8x6q(720/24))
 _IllIllll.PaddingRight = UDim.new((307-307), bit32.bxor(163,0xAB))
 local _llIll = Instance.new("\70\114\97\109\101", _lllIllll)
 _llIll.Name = "\83\101\97\114\99\104\73\99\111\110"
 _llIll.Size = UDim2.new(_P199x._8x6q(0/191), (134-118), (257-257), (394-378))
 _llIll.Position = UDim2.new((36-36), _P199x._8x6q(1584/176), 0.5, -(378-370))
 _llIll.BackgroundTransparency = (367-366)
 _llIll.ZIndex = (10+-8)
 do
 local _IlIll = Instance.new("\70\114\97\109\101", _llIll)
 _IlIll.AnchorPoint = Vector2.new(0.5, 0.5)
 _IlIll.Position = UDim2.new(0.42, bit32.bxor(171,0xAB), 0.42, (112+-112))
 _IlIll.Size = UDim2.fromOffset((375-365), _P199x._8x6q(990/99))
 _IlIll.BackgroundTransparency = (349-348)
 _IlIll.BorderSizePixel = _P199x._8x6q(0/33)
 _IlIll.ZIndex = bit32.bxor(169,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _IlIll).CornerRadius = UDim.new(_P199x._8x6q(187/187), (49-49))
 local _lllIll = Instance.new("\85\73\83\116\114\111\107\101", _IlIll)
 _lllIll.Thickness = 1.6
 pthemed(_lllIll, "\67\111\108\111\114", "\115\117\98\116\101\120\116")
 local _IllIll = Instance.new("\70\114\97\109\101", _llIll)
 _IllIll.AnchorPoint = Vector2.new(0.5, 0.5)
 _IllIll.Position = UDim2.new(0.72, _P199x._8x6q(0/186), 0.72, (129-129))
 _IllIll.Size = UDim2.fromOffset((67+-62), 1.8)
 _IllIll.Rotation = bit32.bxor(134,0xAB)
 _IllIll.BorderSizePixel = (209+-209)
 _IllIll.ZIndex = bit32.bxor(169,0xAB)
 Instance.new("\85\73\67\111\114\110\101\114", _IllIll).CornerRadius = UDim.new((27+-26), bit32.bxor(171,0xAB))
 pthemed(_IllIll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 end
 local _lIlIllll = Instance.new("\85\73\83\116\114\111\107\101", _lllIllll)
 _lIlIllll.Thickness = (6+-5)
 _lIlIllll.Transparency = 0.45
 pthemed(_lIlIllll, "\67\111\108\111\114", "\98\111\114\100\101\114")
 _lllIllll.Focused:Connect(function()
 TweenService:Create(_lIlIllll, TweenInfo.new(0.15), { Transparency = (114+-114), Color = _IlIIll1("\97\99\99\101\110\116") }):Play()
 end)
 _lllIllll:GetPropertyChangedSignal("\67\117\114\115\111\114\80\111\115\105\116\105\111\110"):Connect(function()
 if _lllIllll:IsFocused() then return end
 TweenService:Create(_lIlIllll, TweenInfo.new(0.2), { Transparency = 0.45, Color = _IlIIll1("\98\111\114\100\101\114") }):Play()
 end)
 local function onSearchBlur()
 TweenService:Create(_lIlIllll, TweenInfo.new(0.2), { Transparency = 0.45, Color = _IlIIll1("\98\111\114\100\101\114") }):Play()
 end
 local _IIlIllll = Instance.new("\70\114\97\109\101", _IIIllll)
 _IIlIllll.Size = UDim2.new((231+-230), -_P199x._8x6q(2592/162), (134+-134), (40-40))
 _IIlIllll.Position = UDim2.new(_P199x._8x6q(0/193), (241-233), (438-438), (129+-55))
 _IIlIllll.BorderSizePixel = (197+-197)
 _IIlIllll.Visible = false
 _IIlIllll.ZIndex = (384-379)
 _IIlIllll.ClipsDescendants = true
 pthemed(_IIlIllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 Instance.new("\85\73\67\111\114\110\101\114", _IIlIllll).CornerRadius = UDim.new((198+-198), (471-465))
 local _l1lIllll = Instance.new("\85\73\83\116\114\111\107\101", _IIlIllll)
 _l1lIllll.Thickness = _P199x._8x6q(182/182)
 _l1lIllll.Transparency = 0.4
 pthemed(_l1lIllll, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _I1lIllll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _IIlIllll)
 _I1lIllll.SortOrder = Enum.SortOrder.LayoutOrder
 _I1lIllll.Padding = UDim.new(bit32.bxor(171,0xAB), (32-32))
 local _I1llllI = Instance.new("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", _IIIllll)
 _I1llllI.Size = UDim2.new(_P199x._8x6q(55/55), -_P199x._8x6q(728/91), bit32.bxor(170,0xAB), -(177-97))
 _I1llllI.Position = UDim2.new(_P199x._8x6q(0/46), bit32.bxor(175,0xAB), bit32.bxor(171,0xAB), (141+-63))
 _I1llllI.BackgroundTransparency = 0.5
 _I1llllI.BorderSizePixel = (406-406)
 _I1llllI.ScrollBarThickness = _P199x._8x6q(855/171)
 _I1llllI.ScrollingDirection = Enum.ScrollingDirection.Y
 _I1llllI.CanvasSize = UDim2.new((49+-49), (279-279), bit32.bxor(171,0xAB), (456-456))
 _I1llllI.AutomaticCanvasSize = Enum.AutomaticSize.Y
 pthemed(_I1llllI, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\105\110\112\117\116")
 pthemed(_I1llllI, "\83\99\114\111\108\108\66\97\114\73\109\97\103\101\67\111\108\111\114\51", "\97\99\99\101\110\116")
 local _llllIllll = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _I1llllI)
 _llllIllll.Padding = UDim.new((93+-93), bit32.bxor(175,0xAB))
 _llllIllll.FillDirection = Enum.FillDirection.Vertical
 _llllIllll.HorizontalAlignment = Enum.HorizontalAlignment.Center
 _llllIllll.SortOrder = Enum.SortOrder.LayoutOrder
 local _IIllIllll = Instance.new("\85\73\80\97\100\100\105\110\103", _I1llllI)
 _IIllIllll.PaddingTop = UDim.new((59-59), (34+-30))
 _IIllIllll.PaddingBottom = UDim.new(_P199x._8x6q(0/198), (7-3))
 local _lIllIllll = Instance.new("\84\101\120\116\76\97\98\101\108", _IIIllll)
 _lIllIllll.Size = UDim2.new((20+-19), -(41-21), bit32.bxor(171,0xAB), (226-196))
 _lIllIllll.Position = UDim2.new(bit32.bxor(171,0xAB), (257+-247), 0.5, -(93+-78))
 _lIllIllll.BackgroundTransparency = (376-375)
 _lIllIllll.Font = Enum.Font.Gotham
 _lIllIllll.TextSize = bit32.bxor(166,0xAB)
 _lIllIllll.Text = "\78\111\32\115\101\32\101\110\99\111\110\116\114\97\114\111\110\32\106\117\103\97\100\111\114\101\115"
 _lIllIllll.Visible = false
 pthemed(_lIllIllll, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _llIIl = {}
 local _IlIIl = false
 local _lllIIl = bit32.bxor(171,0xAB)
 local _IllIIl = false
 local function obtenerCategoriaYClave(_llllllIl)
 if _llllllIl == "" then return bit32.bxor(169,0xAB), "" end
 local _lIlIIl = _llllllIl:_IllIlIl(bit32.bxor(170,0xAB),(85+-84))
 local _IIlIIl = _lIlIIl:_IIlIIl()
 if not _IIlIIl then return _P199x._8x6q(180/60), _llllllIl:lower() end
 if _IIlIIl >= (223+-175) and _IIlIIl <= bit32.bxor(146,0xAB) then
 return bit32.bxor(171,0xAB), _llllllIl:lower()
 elseif (_IIlIIl >= bit32.bxor(234,0xAB) and _IIlIIl <= bit32.bxor(241,0xAB)) or (_IIlIIl >= (543-446) and _IIlIIl <= bit32.bxor(209,0xAB)) then
 return (116+-115), _llllllIl:lower()
 elseif _IIlIIl >= bit32.bxor(139,0xAB) and _IIlIIl <= bit32.bxor(213,0xAB) then
 return _P199x._8x6q(314/157), _llllllIl:lower()
 else
 return _P199x._8x6q(255/85), _llllllIl:lower()
 end
do local _cfj21g=1 while _cfj21g>0 do if _cfj21g==1 then
 end
 local function obtenerSeccion(_llllllIl)
 local _lIlIIl = _llllllIl:_IllIlIl(_P199x._8x6q(201/201),(257-256))
_cfj21g=0 end end end
 local _IIlIIl = _lIlIIl:_IIlIIl()
 if not _IIlIIl then return "\79\116\104\101\114" end
 if _IIlIIl >= bit32.bxor(155,0xAB) and _IIlIIl <= (260+-203) then
 return "\48\45\57"
 elseif (_IIlIIl >= _P199x._8x6q(11505/177) and _IIlIIl <= bit32.bxor(241,0xAB)) or (_IIlIIl >= bit32.bxor(202,0xAB) and _IIlIIl <= _P199x._8x6q(12322/101)) then
 return _P199x._0y2i(_lIlIIl)
 elseif _IIlIIl >= _P199x._8x6q(2368/74) and _IIlIIl <= (177+-51) then
 return "\35"
 else
 return "\79\116\104\101\114"
 end
 end
 local function compararJugadores(_lIllIIl, _lIIIl)
 local _l1lIIl = _llIIl[_lIllIIl]
 local _I1lIIl = _llIIl[_lIIIl]
 if not _l1lIIl or not _I1lIIl then return false end
 local _llllIIl, clave1 = obtenerCategoriaYClave(_l1lIIl._llllllIl)
 local _IIllIIl, clave2 = obtenerCategoriaYClave(_I1lIIl._llllllIl)
 if _llllIIl ~= _IIllIIl then return _llllIIl < _IIllIIl end
 return clave1 < clave2
 end
 local function animarCopiado(_lIlll, _IIIIl)
 _lIlll.Text = "\67\111\112\105\97\100\111"
 TweenService:Create(_lIlll, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = _IlIIll1("\103\111\111\100") }):Play()
 local _lIIl = _lIlll:FindFirstChild("\67\111\112\121\83\99\97\108\101")
 if not _lIIl then _lIIl = Instance.new("\85\73\83\99\97\108\101", _lIlll); _lIIl.Name = "\67\111\112\121\83\99\97\108\101" end
 _lIIl.Scale = 1.12
 TweenService:Create(_lIIl, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = (67+-66) }):Play()
 task.delay(1.0, function()
 if _lIlll and _lIlll.Parent then
 _lIlll.Text = _IIIIl
 local _l1I = _lIlll:GetAttribute("\114\111\108\66\97\115\101") or "\97\99\99\101\110\116"
 TweenService:Create(_lIlll, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = _IlIIll1(_l1I) }):Play()
 end
 end)
 end
 local function crearBotonTarjeta(_lllI, _I1IIl1, _lIllllIl, _l1I, _llIIIl)
 local _lIlll = Instance.new("\84\101\120\116\66\117\116\116\111\110", _lllI)
 _lIlll.Size = UDim2.new((100+-99), _P199x._8x6q(0/121), bit32.bxor(171,0xAB), (480-454))
 _lIlll.LayoutOrder = _lIllllIl
 _lIlll.Text = _I1IIl1
 _lIlll.Font = Enum.Font.GothamBold
 _lIlll.TextSize = _P199x._8x6q(1596/133)
 _lIlll.TextTruncate = Enum.TextTruncate.AtEnd
 _lIlll.BorderSizePixel = bit32.bxor(171,0xAB)
 _lIlll.AutoButtonColor = false
 _lIlll:SetAttribute("\114\111\108\66\97\115\101", _l1I)
 Instance.new("\85\73\67\111\114\110\101\114", _lIlll).CornerRadius = UDim.new(bit32.bxor(171,0xAB), _P199x._8x6q(414/69))
 pthemed(_lIlll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", _l1I)
 pthemed(_lIlll, "\84\101\120\116\67\111\108\111\114\51", "\111\110\65\99\99\101\110\116")
 local _IlIIIl = Instance.new("\85\73\83\116\114\111\107\101", _lIlll)
 _IlIIIl.Thickness = bit32.bxor(170,0xAB); _IlIIIl.Transparency = 0.7
 pthemed(_IlIIIl, "\67\111\108\111\114", "\98\111\114\100\101\114")
 local _lIIIIl = Instance.new("\85\73\83\99\97\108\101", _lIlll)
 _lIIIIl.Scale = (268+-267)
 local _I1lll, pressId = false, (412-412)
 _lIlll.MouseEnter:Connect(function()
 _I1lll = true
 TweenService:Create(_lIlll, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = lighten(_IlIIll1(_l1I), 0.10) }):Play()
 TweenService:Create(_IlIIIl, TweenInfo.new(0.12), { Transparency = 0.3 }):Play()
 TweenService:Create(_lIIIIl, TweenInfo.new(0.16, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.028 }):Play()
 end)
 _lIlll.MouseLeave:Connect(function()
 _I1lll = false
 pressId = pressId + (225+-224)
 TweenService:Create(_lIlll, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = _IlIIll1(_l1I) }):Play()
 TweenService:Create(_IlIIIl, TweenInfo.new(0.18), { Transparency = 0.7 }):Play()
 TweenService:Create(_lIIIIl, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = (451-450) }):Play()
 end)
 _lIlll.MouseButton1Down:Connect(function()
 pressId = pressId + bit32.bxor(170,0xAB)
 TweenService:Create(_lIIIIl, TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.90 }):Play()
 end)
 _lIlll.MouseButton1Up:Connect(function()
 pressId = pressId + bit32.bxor(170,0xAB)
 local _l1IIlll = pressId
 TweenService:Create(_lIIIIl, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.055 }):Play()
 task.delay(0.13, function()
 if _lIlll.Parent and _l1IIlll == pressId then
 TweenService:Create(_lIIIIl, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = _I1lll and 1.028 or (244-243) }):Play()
 end
 end)
 end)
 _lIlll.MouseButton1Click:Connect(function() _llIIIl(_lIlll, _I1IIl1) end)
 return _lIlll
 end
 local function analizarEnAnalyzer(_IIIIIl)
 if _P199x._iy38(_G.NXAnalyze) == "\102\117\110\99\116\105\111\110" then
 pcall(_G.NXAnalyze, _IIIIIl)
 return true
 end
 warn("\91\76\105\115\116\97\93\32\69\108\32\65\110\97\108\121\122\101\114\32\110\111\32\101\115\116\225\32\99\97\114\103\97\100\111\32\40\115\105\110\32\95\71\46\78\88\65\110\97\108\121\122\101\41\46")
 return false
 end
 local _l1IIIl
 local function actualizarLista()
 local _I1IIIl = {}
 for _IIlIIIl, _ in pairs(_llIIl) do _P199x._l50o(_I1IIIl, _IIlIIIl) end
 _P199x._c9pr(_I1IIIl, compararJugadores)
 local _I1IIl1 = _lllIllll.Text:lower()
 local _lllIIIl = (_I1IIl1 ~= "")
 local _lIlIIIl = {}
 for _, _IIlIIIl in ipairs(_I1IIIl) do
 local _I1lllIl = _llIIl[_IIlIIIl]
 if not _lllIIIl
 or _P199x._lc3i(_I1lllIl._l1llIl:lower(), _I1IIl1, (77+-76), true)
 or _P199x._lc3i(_I1lllIl._llllllIl:lower(), _I1IIl1, _P199x._8x6q(188/188), true) then
 _P199x._l50o(_lIlIIIl, _IIlIIIl)
 end
 end
 for _, _lIlIlI in ipairs(_I1llllI:GetChildren()) do
 if _lIlIlI:IsA("\70\114\97\109\101") and _lIlIlI.Name:find("\94\83\101\99\99\105\111\110\95") then
 _lIlIlI:Destroy()
 end
do local _lrn4,_67fz=pcall(function()return nil end);end
 end
 for _IIlIIIl, _I1lllIl in pairs(_llIIl) do
 _I1lllIl._llllll.Visible = false
 _I1lllIl._llllll.LayoutOrder = bit32.bxor(10148,0xAB)
 end
 local _lIllllIl = bit32.bxor(170,0xAB)
 local _lllIIl = nil
 for _, _IIlIIIl in ipairs(_lIlIIIl) do
 local _I1lllIl = _llIIl[_IIlIIIl]
 local _IllIIl = _lllIIIl and "\69\110\32\101\115\116\101\32\115\101\114\118\105\100\111\114" or obtenerSeccion(_I1lllIl._llllllIl)
 if _IllIIl ~= _lllIIl then
 local _IIllll = Instance.new("\70\114\97\109\101", _I1llllI)
 _IIllll.Name = "\83\101\99\99\105\111\110\95" .. _IllIIl
 _IIllll.Size = UDim2.new((150+-149), -_P199x._8x6q(2992/187), (294+-294), (411-387))
 _IIllll.BorderSizePixel = bit32.bxor(171,0xAB)
 _IIllll.LayoutOrder = _lIllllIl
 pthemed(_IIllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\104\101\97\100\101\114")
 Instance.new("\85\73\67\111\114\110\101\114", _IIllll).CornerRadius = UDim.new((84+-84), bit32.bxor(173,0xAB))
 local _Illl = Instance.new("\84\101\120\116\76\97\98\101\108", _IIllll)
 _Illl.Size = UDim2.new((178+-177), -(300+-284), bit32.bxor(170,0xAB), bit32.bxor(171,0xAB))
 _Illl.Position = UDim2.new(bit32.bxor(171,0xAB), _P199x._8x6q(870/87), bit32.bxor(171,0xAB), (395-395))
 _Illl.BackgroundTransparency = (168+-167)
 _Illl.Font = Enum.Font.GothamBold
 _Illl.TextSize = _P199x._8x6q(2613/201)
 _Illl.Text = _IllIIl
 _Illl.TextXAlignment = Enum.TextXAlignment.Left
 pthemed(_Illl, "\84\101\120\116\67\111\108\111\114\51", "\97\99\99\101\110\116")
 _lIllllIl = _lIllllIl + (448-447)
 _lllIIl = _IllIIl
 end
 _I1lllIl._llllll.Visible = true
 _I1lllIl._llllll.LayoutOrder = _lIllllIl
 _lIllllIl = _lIllllIl + (84+-83)
 end
 _IlIIl = (#_lIlIIIl > bit32.bxor(171,0xAB))
 _l1IIIl()
 local _I1llI = _P199x._8x6q(0/159)
 for _ in pairs(_llIIl) do _I1llI = _I1llI + (213-212) end
 if _lllIIIl then
 _lIIIl1.Text = "\74\117\103\97\100\111\114\101\115\58\32" .. #_lIlIIIl .. "\32\47\32" .. _I1llI
 else
 _lIIIl1.Text = "\74\117\103\97\100\111\114\101\115\58\32" .. _I1llI
 end
 end
 function _l1IIIl()
 local _lllIIIl = (_lllIllll.Text ~= "")
 local _llllIIl = (next(_llIIl) ~= nil)
 _lIllIllll.Visible =
 (not _IllIIl) and (not _IlIIl) and (_llllIIl or _lllIIIl)
 end
 local function crearTarjeta(_IIlIIIl, _lIllIIl)
 if _llIIl[_IIlIIIl] then return end
 local _l1l1 = _IIlIIIl.UserId
 local _IlllIIl = Instance.new("\70\114\97\109\101", _I1llllI)
 _IlllIIl.Name = "\84\97\114\106\101\116\97\95" .. _IIlIIIl.Name
 _IlllIIl.Size = UDim2.new(_P199x._8x6q(6/6), -(189+-173), (160+-160), bit32.bxor(249,0xAB))
 _IlllIIl.BorderSizePixel = (49+-49)
 _IlllIIl.LayoutOrder = bit32.bxor(171,0xAB)
 _IlllIIl.ClipsDescendants = true
 pthemed(_IlllIIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 Instance.new("\85\73\67\111\114\110\101\114", _IlllIIl).CornerRadius = UDim.new((359-359), bit32.bxor(163,0xAB))
 local _IIllIIl = Instance.new("\85\73\83\116\114\111\107\101", _IlllIIl)
 _IIllIIl.Thickness = bit32.bxor(170,0xAB); _IIllIIl.Transparency = 0.6
 pthemed(_IIllIIl, "\67\111\108\111\114", "\98\111\114\100\101\114")
 _IlllIIl.InputBegan:Connect(function(i)
 if i.UserInputType == Enum.UserInputType.MouseMovement then
 TweenService:Create(_IIllIIl, TweenInfo.new(0.12), { Transparency = 0.2 }):Play()
 TweenService:Create(_IlllIIl, TweenInfo.new(0.12), { BackgroundColor3 = lighten(_IlIIll1("\99\97\114\100"), 0.03) }):Play()
 end
 end)
 _IlllIIl.InputEnded:Connect(function(i)
 if i.UserInputType == Enum.UserInputType.MouseMovement then
 TweenService:Create(_IIllIIl, TweenInfo.new(0.18), { Transparency = 0.6 }):Play()
 TweenService:Create(_IlllIIl, TweenInfo.new(0.18), { BackgroundColor3 = _IlIIll1("\99\97\114\100") }):Play()
 end
 end)
 local _l1llIIl = onPrepaint(function()
 if _IlllIIl.Parent then
 pcall(function() _IIllIIl.Color = _IlIIll1("\98\111\114\100\101\114") end)
 pcall(function() _IlllIIl.BackgroundColor3 = _IlIIll1("\99\97\114\100") end)
 end
 end)
 _IlllIIl.Destroying:Connect(_l1llIIl)
 local _lIIIl = Instance.new("\73\109\97\103\101\76\97\98\101\108", _IlllIIl)
 _lIIIl.Size = UDim2.new((70-70), (484-440), (10+-10), _P199x._8x6q(1584/36))
 _lIIIl.Position = UDim2.new((449-449), bit32.bxor(161,0xAB), (141+-141), (108+-100))
 _lIIIl.Image = _l1II[_l1l1] or _lllllllll
 _lIIIl.BorderSizePixel = _P199x._8x6q(0/111)
 pthemed(_lIIIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\118\97\116\97\114\66\103")
 Instance.new("\85\73\67\111\114\110\101\114", _lIIIl).CornerRadius = UDim.new((41-41), (413-391))
 cargarAvatarAsync(_l1l1, _lIIIl)
 local _I1llIIl = Instance.new("\84\101\120\116\76\97\98\101\108", _IlllIIl)
 _I1llIIl.Size = UDim2.new(bit32.bxor(170,0xAB), -_P199x._8x6q(2924/43), _P199x._8x6q(0/8), bit32.bxor(191,0xAB))
 _I1llIIl.Position = UDim2.new(bit32.bxor(171,0xAB), (111-47), bit32.bxor(171,0xAB), bit32.bxor(163,0xAB))
 _I1llIIl.BackgroundTransparency = bit32.bxor(170,0xAB)
 _I1llIIl.Font = Enum.Font.GothamBold
 _I1llIIl.TextSize = _P199x._8x6q(896/64)
 _I1llIIl.Text = _IIlIIIl.DisplayName
 _I1llIIl.TextXAlignment = Enum.TextXAlignment.Left
 _I1llIIl.TextTruncate = Enum.TextTruncate.AtEnd
 pthemed(_I1llIIl, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _lllllIIl = Instance.new("\84\101\120\116\76\97\98\101\108", _IlllIIl)
 _lllllIIl.Size = UDim2.new(_P199x._8x6q(141/141), -(255+-187), (149+-149), bit32.bxor(187,0xAB))
 _lllllIIl.Position = UDim2.new(_P199x._8x6q(0/122), bit32.bxor(235,0xAB), (142+-142), bit32.bxor(183,0xAB))
 _lllllIIl.BackgroundTransparency = bit32.bxor(170,0xAB)
 _lllllIIl.Font = Enum.Font.Gotham
 _lllllIIl.TextSize = (338-326)
 _lllllIIl.Text = "\64" .. _IIlIIIl.Name
 _lllllIIl.TextXAlignment = Enum.TextXAlignment.Left
 _lllllIIl.TextTruncate = Enum.TextTruncate.AtEnd
 pthemed(_lllllIIl, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _IIlllIIl = Instance.new("\70\114\97\109\101", _IlllIIl)
 _IIlllIIl.Size = UDim2.new(_P199x._8x6q(90/90), -(415-395), bit32.bxor(171,0xAB), (257+-231))
 _IIlllIIl.Position = UDim2.new((247+-247), _P199x._8x6q(20/2), (143+-143), bit32.bxor(153,0xAB))
 _IIlllIIl.BackgroundTransparency = _P199x._8x6q(152/152)
 local _lIlllIIl = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _IIlllIIl)
 _lIlllIIl.FillDirection = Enum.FillDirection.Horizontal
 _lIlllIIl.SortOrder = Enum.SortOrder.LayoutOrder
 _lIlllIIl.Padding = UDim.new((490-490), _P199x._8x6q(48/8))
 _lIlllIIl.VerticalAlignment = Enum.VerticalAlignment.Center
 local _lIlIIl = crearBotonTarjeta(_IIlllIIl, "\78\111\109\98\114\101", _P199x._8x6q(25/25), "\97\99\99\101\110\116", function(_lIlll, _IIlIlI)
 if _IllI(_IIlIIIl.DisplayName) then animarCopiado(_lIlll, _IIlIlI) end
 end)
 local _IIlIIl = crearBotonTarjeta(_IIlllIIl, "\85\115\117\97\114\105\111", bit32.bxor(169,0xAB), "\97\99\99\101\110\116\50", function(_lIlll, _IIlIlI)
 if _IllI(_IIlIIIl.Name) then animarCopiado(_lIlll, _IIlIlI) end
 end)
 local _llIlIIl = crearBotonTarjeta(_IIlllIIl, "\65\110\97\108\105\122\97\114", (341-338), "\103\111\111\100", function()
 analizarEnAnalyzer(_IIlIIIl.Name)
 end)
 _lIlIIl.Size = UDim2.new(_P199x._8x6q(0/24), bit32.bxor(251,0xAB), bit32.bxor(170,0xAB), bit32.bxor(171,0xAB))
 _IIlIIl.Size = UDim2.new((473-473), (103-23), (208-207), bit32.bxor(171,0xAB))
 _llIlIIl.Size = UDim2.new((31+-30), -bit32.bxor(7,0xAB), _P199x._8x6q(41/41), (413-413))
 local _I1lllIl = {
 _llllll = _IlllIIl, _l1l1 = _l1l1,
 _I1llIIl = _I1llIIl, _lllllIIl = _lllllIIl,
 _l1llIl = _IIlIIIl.Name, _llllllIl = _IIlIIIl.DisplayName,
 }
 _llIIl[_IIlIIIl] = _I1lllIl
 _I1lllIl.displayNameConn = _IIlIIIl:GetPropertyChangedSignal("\68\105\115\112\108\97\121\78\97\109\101"):Connect(function()
 _I1lllIl._llllllIl = _IIlIIIl.DisplayName
 _I1llIIl.Text = _IIlIIIl.DisplayName
 actualizarLista()
 end)
 if not _lIllIIl then actualizarLista() end
 end
 local function eliminarTarjeta(_IIlIIIl)
 local _I1lllIl = _llIIl[_IIlIIIl]
 if _I1lllIl then
 if _I1lllIl.displayNameConn then
 pcall(function() _I1lllIl.displayNameConn:Disconnect() end)
 end
 if _I1lllIl._llllll then _I1lllIl._llllll:Destroy() end
 _llIIl[_IIlIIIl] = nil
 actualizarLista()
 end
 end
 local _IlIlIIl = "\83\101\99\99\105\111\110\71\108\111\98\97\108"
 local _lIIlIIl = 100000
 local _IIIlIIl = (42-30)
 local _l1IlIIl = nil
 local _I1IlIIl = _P199x._8x6q(0/105)
 local _lllIlIIl = nil
 local function limpiarGlobales()
 for _, _lIlIlI in ipairs(_I1llllI:GetChildren()) do
 if _lIlIlI:IsA("\70\114\97\109\101") and (_lIlIlI.Name == _IlIlIIl or _lIlIlI.Name:find("\94\71\108\111\98\97\108\95")) then
 _lIlIlI:Destroy()
 end
 end
 _l1IlIIl = nil
 _lllIIl = _P199x._8x6q(0/36)
 _IllIIl = false
 end
 local function crearHeaderGlobal(_I1IIl1)
 local _IIllll = Instance.new("\70\114\97\109\101", _I1llllI)
 _IIllll.Name = _IlIlIIl
 _IIllll.Size = UDim2.new((18+-17), -(91+-75), _P199x._8x6q(0/120), _P199x._8x6q(3744/156))
 _IIllll.BorderSizePixel = _P199x._8x6q(0/132)
 _IIllll.LayoutOrder = _lIIlIIl
 pthemed(_IIllll, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\104\101\97\100\101\114")
 Instance.new("\85\73\67\111\114\110\101\114", _IIllll).CornerRadius = UDim.new((142-142), bit32.bxor(173,0xAB))
 local _Illl = Instance.new("\84\101\120\116\76\97\98\101\108", _IIllll)
 _Illl.Size = UDim2.new(_P199x._8x6q(45/45), -bit32.bxor(187,0xAB), (96-95), bit32.bxor(171,0xAB))
 _Illl.Position = UDim2.new((481-481), bit32.bxor(161,0xAB), _P199x._8x6q(0/77), (81-81))
 _Illl.BackgroundTransparency = bit32.bxor(170,0xAB)
 _Illl.Font = Enum.Font.GothamBold
 _Illl.TextSize = bit32.bxor(166,0xAB)
 _Illl.Text = _I1IIl1
 _Illl.TextXAlignment = Enum.TextXAlignment.Left
 pthemed(_Illl, "\84\101\120\116\67\111\108\111\114\51", "\103\108\111\98\101")
 _l1IlIIl = _Illl
 _IllIIl = true
 end
 local function crearTarjetaGlobal(_l1lI, _lIllllIl)
 local _IlllIIl = Instance.new("\70\114\97\109\101", _I1llllI)
 _IlllIIl.Name = "\71\108\111\98\97\108\95" .. _l1lI._lllI1
 _IlllIIl.Size = UDim2.new((250-249), -_P199x._8x6q(512/32), (48+-48), (409-327))
 _IlllIIl.BorderSizePixel = (90-90)
 _IlllIIl.LayoutOrder = _lIllllIl
 _IlllIIl.ClipsDescendants = true
 pthemed(_IlllIIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\99\97\114\100")
 Instance.new("\85\73\67\111\114\110\101\114", _IlllIIl).CornerRadius = UDim.new((95+-95), bit32.bxor(163,0xAB))
 local _IIlIlIIl = Instance.new("\85\73\83\116\114\111\107\101", _IlllIIl)
 _IIlIlIIl.Thickness = _P199x._8x6q(172/172); _IIlIlIIl.Transparency = 0.6
 pthemed(_IIlIlIIl, "\67\111\108\111\114", "\98\111\114\100\101\114")
 _IlllIIl.InputBegan:Connect(function(i)
 if i.UserInputType == Enum.UserInputType.MouseMovement then
 TweenService:Create(_IIlIlIIl, TweenInfo.new(0.12), { Transparency = 0.2 }):Play()
 TweenService:Create(_IlllIIl, TweenInfo.new(0.12), { BackgroundColor3 = lighten(_IlIIll1("\99\97\114\100"), 0.03) }):Play()
 end
 end)
 _IlllIIl.InputEnded:Connect(function(i)
 if i.UserInputType == Enum.UserInputType.MouseMovement then
 TweenService:Create(_IIlIlIIl, TweenInfo.new(0.18), { Transparency = 0.6 }):Play()
 TweenService:Create(_IlllIIl, TweenInfo.new(0.18), { BackgroundColor3 = _IlIIll1("\99\97\114\100") }):Play()
 end
 end)
 local _lIlIlIIl = Instance.new("\70\114\97\109\101", _IlllIIl)
 _lIlIlIIl.Size = UDim2.new(bit32.bxor(171,0xAB), (30+-27), (311-310), -(265+-253))
 _lIlIlIIl.Position = UDim2.new((174-174), _P199x._8x6q(0/128), (293+-293), _P199x._8x6q(846/141))
 _lIlIlIIl.BorderSizePixel = _P199x._8x6q(0/49)
 pthemed(_lIlIlIIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\103\108\111\98\101")
 Instance.new("\85\73\67\111\114\110\101\114", _lIlIlIIl).CornerRadius = UDim.new((288-288), (494-492))
 local _lIIIl = Instance.new("\73\109\97\103\101\76\97\98\101\108", _IlllIIl)
 _lIIIl.Size = UDim2.new((210-210), bit32.bxor(135,0xAB), (282+-282), bit32.bxor(135,0xAB))
 _lIIIl.Position = UDim2.new((451-451), _P199x._8x6q(580/58), (152-152), bit32.bxor(163,0xAB))
 _lIIIl.Image = _l1II[_l1lI._lllI1] or _lllllllll
 _lIIIl.BorderSizePixel = (209-209)
 pthemed(_lIIIl, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\97\118\97\116\97\114\66\103")
 Instance.new("\85\73\67\111\114\110\101\114", _lIIIl).CornerRadius = UDim.new((355-355), (109-87))
 cargarAvatarAsync(_l1lI._lllI1, _lIIIl)
 local _I1llIIl = Instance.new("\84\101\120\116\76\97\98\101\108", _IlllIIl)
 _I1llIIl.Size = UDim2.new((37+-36), -_P199x._8x6q(6460/95), (275+-275), (108-88))
 _I1llIIl.Position = UDim2.new(bit32.bxor(171,0xAB), bit32.bxor(235,0xAB), (134-134), _P199x._8x6q(296/37))
 _I1llIIl.BackgroundTransparency = _P199x._8x6q(162/162)
 _I1llIIl.Font = Enum.Font.GothamBold
 _I1llIIl.TextSize = _P199x._8x6q(1232/88)
 _I1llIIl.Text = _l1lI._llllllIl
 _I1llIIl.TextXAlignment = Enum.TextXAlignment.Left
 _I1llIIl.TextTruncate = Enum.TextTruncate.AtEnd
 pthemed(_I1llIIl, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 local _lllllIIl = Instance.new("\84\101\120\116\76\97\98\101\108", _IlllIIl)
 _lllllIIl.Size = UDim2.new(bit32.bxor(170,0xAB), -(359-291), (228-228), (244-228))
 _lllllIIl.Position = UDim2.new(bit32.bxor(171,0xAB), (145+-81), (145-145), bit32.bxor(183,0xAB))
 _lllllIIl.BackgroundTransparency = (334-333)
 _lllllIIl.Font = Enum.Font.Gotham
 _lllllIIl.TextSize = (212+-200)
 _lllllIIl.Text = "\64" .. _l1lI._lll
 _lllllIIl.TextXAlignment = Enum.TextXAlignment.Left
 _lllllIIl.TextTruncate = Enum.TextTruncate.AtEnd
 pthemed(_lllllIIl, "\84\101\120\116\67\111\108\111\114\51", "\115\117\98\116\101\120\116")
 local _IIlllIIl = Instance.new("\70\114\97\109\101", _IlllIIl)
 _IIlllIIl.Size = UDim2.new((144+-143), -(139+-119), bit32.bxor(171,0xAB), (252+-226))
 _IIlllIIl.Position = UDim2.new((139+-139), (296+-286), (69+-69), bit32.bxor(153,0xAB))
 _IIlllIIl.BackgroundTransparency = (245+-244)
 local _lIlllIIl = Instance.new("\85\73\76\105\115\116\76\97\121\111\117\116", _IIlllIIl)
 _lIlllIIl.FillDirection = Enum.FillDirection.Horizontal
 _lIlllIIl.SortOrder = Enum.SortOrder.LayoutOrder
 _lIlllIIl.Padding = UDim.new((35+-35), _P199x._8x6q(942/157))
 _lIlllIIl.VerticalAlignment = Enum.VerticalAlignment.Center
 local _llIIIl = crearBotonTarjeta(_IIlllIIl, "\78\111\109\98\114\101", bit32.bxor(170,0xAB), "\97\99\99\101\110\116", function(_lIlll, _IIlIlI)
 if _IllI(_l1lI._llllllIl) then animarCopiado(_lIlll, _IIlIlI) end
 end)
 local _IlIIIl = crearBotonTarjeta(_IIlllIIl, "\85\115\117\97\114\105\111", (258+-256), "\97\99\99\101\110\116\50", function(_lIlll, _IIlIlI)
 if _IllI(_l1lI._lll) then animarCopiado(_lIlll, _IIlIlI) end
 end)
 local _lllIIIl = crearBotonTarjeta(_IIlllIIl, "\65\110\97\108\105\122\97\114", (157-154), "\103\111\111\100", function()
 analizarEnAnalyzer(_l1lI._lll)
 end)
 _llIIIl.Size = UDim2.new(bit32.bxor(171,0xAB), _P199x._8x6q(12800/160), (136-135), (52+-52))
 _IlIIIl.Size = UDim2.new((185+-185), bit32.bxor(251,0xAB), _P199x._8x6q(54/54), (257+-257))
 _lllIIIl.Size = UDim2.new(_P199x._8x6q(54/54), -(162+10), bit32.bxor(170,0xAB), bit32.bxor(171,0xAB))
 end
 local function buscarGlobal(_lIlIIIl)
 _I1IlIIl = _I1IlIIl + (398-397)
 local _IllIIIl = _I1IlIIl
 if _lllIlIIl then pcall(task.cancel, _lllIlIIl); _lllIlIIl = nil end
 local _I1IIl1 = (_lIlIIIl or ""):gsub("\94\37\115\43", ""):gsub("\37\115\43\36", "")
 if #_I1IIl1 < (146+-143) then
 limpiarGlobales()
 _l1IIIl()
 return
 end
 limpiarGlobales()
 crearHeaderGlobal("\82\111\98\108\111\120\32\8212\32\98\117\115\99\97\110\100\111\8230")
 _l1IIIl()
 _lllIlIIl = task.delay(0.45, function()
 _lllIlIIl = nil
 if _IllIIIl ~= _I1IlIIl then return end
 local _IIlIIIl = {}
 for _IIlIIIl, _ in pairs(_llIIl) do _IIlIIIl[_IIlIIIl.UserId] = true end
 local _l1lIIIl, vistos = {}, {}
 local function add(u, _I1lIIIl)
 local _lllI1 = u and u._lllI1
 if not _lllI1 or _IIlIIIl[_lllI1] or vistos[_lllI1] then return end
 vistos[_lllI1] = true
 _P199x._l50o(_l1lIIIl, {
 _lllI1 = _lllI1,
 _lll = u._lll or u.requestedUsername or "\63",
 _llllllIl = u._llllllIl or u._lll or "\63",
 _I1lIIIl = _I1lIIIl and true or false,
 })
 end
 local _llllIIIl = apiPost("\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\110\97\109\101\115\47\117\115\101\114\115", {
 usernames = { _I1IIl1 }, excludeBannedUsers = false,
 })
 if _IllIIIl ~= _I1IlIIl then return end
 if _llllIIIl and _P199x._iy38(_llllIIIl._I1lI) == "\116\97\98\108\101" then
 for _, u in ipairs(_llllIIIl._I1lI) do add(u, true) end
 end
 local _IlII = "\104\116\116\112\115\58\47\47\117\115\101\114\115\46\114\111\98\108\111\120\46\99\111\109\47\118\49\47\117\115\101\114\115\47\115\101\97\114\99\104\63\107\101\121\119\111\114\100\61"
 .. HttpService:UrlEncode(_I1IIl1) .. "\38\108\105\109\105\116\61\50\53"
 local _I1lI = apiGet(_IlII)
 if _IllIIIl ~= _I1IlIIl then return end
 if _I1lI and _P199x._iy38(_I1lI._I1lI) == "\116\97\98\108\101" then
 for _, u in ipairs(_I1lI._I1lI) do
 if #_l1lIIIl >= _IIIlIIl then break end
 add(u, false)
 end
 end
 _P199x._c9pr(_l1lIIIl, function(a, b)
 if a._I1lIIIl ~= b._I1lIIIl then return a._I1lIIIl end
 return false
 end)
 limpiarGlobales()
 if #_l1lIIIl == (44-44) then
 if not _llllIIIl and not _I1lI then
 crearHeaderGlobal("\82\111\98\108\111\120\32\8212\32\115\105\110\32\99\111\110\101\120\105\243\110\32\97\32\108\97\32\65\80\73")
 else
 crearHeaderGlobal("\82\111\98\108\111\120\32\8212\32\115\105\110\32\114\101\115\117\108\116\97\100\111\115")
 end
 _lllIIl = (35-35)
 else
 crearHeaderGlobal("\82\111\98\108\111\120\32\40" .. #_l1lIIIl .. "\41")
 local _lIllllIl = _lIIlIIl + (93+-92)
 for _, u in ipairs(_l1lIIIl) do
 crearTarjetaGlobal(u, _lIllllIl)
 _lIllllIl = _lIllllIl + bit32.bxor(170,0xAB)
 end
 _lllIIl = #_l1lIIIl
 end
 _l1IIIl()
 end)
 end
 local function limpiarSugerencias()
 for _, _lIlIlI in ipairs(_IIlIllll:GetChildren()) do
 if _lIlIlI:IsA("\84\101\120\116\66\117\116\116\111\110") then _lIlIlI:Destroy() end
 end
 end
 local function mostrarSugerencias(_I1IIl1)
 limpiarSugerencias()
 if _I1IIl1 == "" then _IIlIllll.Visible = false; return end
 local _IIllIIIl = _I1IIl1:lower()
 local _lIllIIIl = {}
 for _IIlIIIl, _I1lllIl in pairs(_llIIl) do
 local _lIIIIl    = _P199x._lc3i(_I1lllIl._l1llIl:lower(),    _IIllIIIl, bit32.bxor(170,0xAB), true)
 local _IIIIIl = _P199x._lc3i(_I1lllIl._llllllIl:lower(), _IIllIIIl, (137-136), true)
 if _lIIIIl or _IIIIIl then
 local _llIIIIl = _P199x._7ofy(_lIIIIl or (34+965), _IIIIIl or (1145-146))
 _P199x._l50o(_lIllIIIl, { _IIlIIIl = _IIlIIIl, _I1lllIl = _I1lllIl, _llIIIIl = _llIIIIl })
 end
 end
 if #_lIllIIIl == (12+-12) then _IIlIllll.Visible = false; return end
 _P199x._c9pr(_lIllIIIl, function(a, b) return a._llIIIIl < b._llIIIIl end)
 local _IlIIIIl = _P199x._7ofy(#_lIllIIIl, (491-486))
 local _lIIIIIl = bit32.bxor(183,0xAB)
 for i = (17+-16), _IlIIIIl do
 local _I1lllIl = _lIllIIIl[i]._I1lllIl
 local _I1lllII = Instance.new("\84\101\120\116\66\117\116\116\111\110", _IIlIllll)
 _I1lllII.Size = UDim2.new((348-347), bit32.bxor(171,0xAB), bit32.bxor(171,0xAB), _lIIIIIl)
 _I1lllII.BackgroundTransparency = bit32.bxor(170,0xAB)
 _I1lllII.Text = ""
 _I1lllII.AutoButtonColor = false
 _I1lllII.BorderSizePixel = bit32.bxor(171,0xAB)
 _I1lllII.LayoutOrder = i
 _I1lllII.ZIndex = (138+-132)
 pthemed(_I1lllII, "\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51", "\110\101\117\116\114\97\108")
 local _IIlIlI = Instance.new("\84\101\120\116\76\97\98\101\108", _I1lllII)
 _IIlIlI.Size = UDim2.new((7+-6), -bit32.bxor(187,0xAB), _P199x._8x6q(187/187), bit32.bxor(171,0xAB))
 _IIlIlI.Position = UDim2.new(bit32.bxor(171,0xAB), (423-413), (174-174), bit32.bxor(171,0xAB))
 _IIlIlI.BackgroundTransparency = bit32.bxor(170,0xAB)
 _IIlIlI.Font = Enum.Font.Gotham
 _IIlIlI.TextSize = bit32.bxor(167,0xAB)
 _IIlIlI.Text = _I1lllIl._llllllIl .. "\32\32\183\32\32\64" .. _I1lllIl._l1llIl
 _IIlIlI.TextXAlignment = Enum.TextXAlignment.Left
 _IIlIlI.TextTruncate = Enum.TextTruncate.AtEnd
 _IIlIlI.ZIndex = _P199x._8x6q(315/45)
 pthemed(_IIlIlI, "\84\101\120\116\67\111\108\111\114\51", "\116\101\120\116")
 _I1lllII.MouseEnter:Connect(function()
 TweenService:Create(_I1lllII, TweenInfo.new(0.1), { BackgroundTransparency = bit32.bxor(171,0xAB) }):Play()
 end)
 _I1lllII.MouseLeave:Connect(function()
 TweenService:Create(_I1lllII, TweenInfo.new(0.15), { BackgroundTransparency = (330-329) }):Play()
 end)
 _I1lllII.MouseButton1Click:Connect(function()
 _lllIllll.Text = _I1lllIl._l1llIl
 _IIlIllll.Visible = false
 actualizarLista()
 end)
 end
 _IIlIllll.Size = UDim2.new(_P199x._8x6q(175/175), -_P199x._8x6q(432/27), _P199x._8x6q(0/20), _IlIIIIl * _lIIIIIl)
 _IIlIllll.Visible = true
 end
 _lllIllll:GetPropertyChangedSignal("\84\101\120\116"):Connect(function()
 actualizarLista()
 mostrarSugerencias(_lllIllll.Text)
 buscarGlobal(_lllIllll.Text)
 end)
 _lllIllll.FocusLost:Connect(function()
 onSearchBlur()
 task.delay(0.15, function()
 if _IIlIllll and _IIlIllll.Parent then
 _IIlIllll.Visible = false
 end
 end)
 end)
 ltrack(Players.PlayerAdded:Connect(function(_IIlIIIl) crearTarjeta(_IIlIIIl) end))
 ltrack(Players.PlayerRemoving:Connect(function(_IIlIIIl) eliminarTarjeta(_IIlIIIl) end))
 local _IIIIIIl, inicioInput, inicioPos = false, nil, nil
 local _l1IIIIl = Instance.new("\85\73\83\99\97\108\101", _IIIllll)
 _l1IIIIl.Name = "\68\114\97\103\83\99\97\108\101"; _l1IIIIl.Scale = bit32.bxor(170,0xAB)
 local function esInputArrastre(_Illl)
 return _Illl.UserInputType == Enum.UserInputType.MouseButton1
 or _Illl.UserInputType == Enum.UserInputType.Touch
 end
 local function esMovimientoArrastre(_Illl)
 return _Illl.UserInputType == Enum.UserInputType.MouseMovement
 or _Illl.UserInputType == Enum.UserInputType.Touch
 end
 ltrack(_lIIIllll.InputBegan:Connect(function(_Illl)
 if esInputArrastre(_Illl) then
 _IIIIIIl = true
 inicioInput = _Illl.Position
 inicioPos = _IIIllll.Position
 TweenService:Create(_l1IIIIl, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.97 }):Play()
 _Illl.Changed:Connect(function()
 if _Illl.UserInputState == Enum.UserInputState.End then
 _IIIIIIl = false
 TweenService:Create(_l1IIIIl, TweenInfo.new(0.38, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = _P199x._8x6q(21/21) }):Play()
 end
 end)
 end
 end))
 ltrack(UserInputService.InputChanged:Connect(function(_Illl)
 if _IIIIIIl and esMovimientoArrastre(_Illl) then
 local _I1IIIIl = _Illl.Position - inicioInput
 _IIIllll.Position = UDim2.new(
 inicioPos.X.Scale, inicioPos.X.Offset + _I1IIIIl.X,
 inicioPos.Y.Scale, inicioPos.Y.Offset + _I1IIIIl.Y
 )
 if not maximizado then _IIlIIllll = _IIIllll.Position end
 end
 end))
 for _, _IIlIIIl in ipairs(Players:GetPlayers()) do
 crearTarjeta(_IIlIIIl, true)
 end
 actualizarLista()
 local _lllIIIIl = _IIIllll:FindFirstChild("\68\114\97\103\83\99\97\108\101")
 if _lllIIIIl then
 _lllIIIIl.Scale = 0.92
 _IIIllll.BackgroundTransparency = 0.4
 TweenService:Create(_lllIIIIl, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = bit32.bxor(170,0xAB) }):Play()
 TweenService:Create(_IIIllll, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = (244+-244) }):Play()
 end
 local _IIlIIIIl = (79+-71)
 local function dockNextToAnalyzer()
 local _lIlIIIIl = _I:FindFirstChild("\85\116\105\108\105\116\121\80\97\110\101\108")
 local _ll1IIl = _lIlIIIIl and _lIlIIIIl:FindFirstChild("\109\97\105\110")
 if not _ll1IIl then return false end
 local _I1Ill1 = _ll1IIl.AbsoluteSize
 if _I1Ill1.X <= bit32.bxor(171,0xAB) or _I1Ill1.Y <= (27-27) then return false end
 local _IIlIlll = _ll1IIl.AbsolutePosition
 _IIIllll.Position = UDim2.fromOffset(_IIlIlll.X + _I1Ill1.X + _IIlIIIIl, _IIlIlll.Y)
do local _ztys=math.random(1,999)*0;if _b6lf>1 then print("")end end
 _IIlIIllll = _IIIllll.Position
 return true
do local _cfsebk=1 while _cfsebk>0 do if _cfsebk==1 then
 end
 task.defer(function()
 if not dockNextToAnalyzer() then
 task.wait(0.1)
_cfsebk=0 end end end
 dockNextToAnalyzer()
 end
 end)
 print("\91\76\105\115\116\97\32\100\101\32\74\117\103\97\100\111\114\101\115\32\118\50\46\53\93\32\67\97\114\103\97\100\97\32\183\32\85\73\32\114\101\100\105\115\101\241\97\100\97\32\43\32\97\110\105\109\97\99\105\111\110\101\115\46")
end)()
