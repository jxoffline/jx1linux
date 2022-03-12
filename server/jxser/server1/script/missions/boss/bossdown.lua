Include("\\script\\lib\\file.lua")

tangburan = "\\settings\\maps\\Œ˜±±±±«¯\\ƒ™∏ﬂøﬂ\\tangburanboss.txt"

wangzuo = "\\settings\\maps\\∂´±±«¯\\ƒÆ±±≤›‘≠\\wangzuoboss.txt"
qingxiaoshitai = "\\settings\\maps\\∂´±±«¯\\ƒÆ±±≤›‘≠\\qingxiaoshitaiboss.txt"
shansinan = "\\settings\\maps\\∂´±±«¯\\ƒÆ±±≤›‘≠\\shansinanboss.txt"

yanxiaoqian = "\\settings\\maps\\÷–‘≠±±«¯\\∑Á¡Í∂…±±∞∂\\yanxiaoqianboss.txt"
baiyingying = "\\settings\\maps\\÷–‘≠±±«¯\\∑Á¡Í∂…±±∞∂\\baiyingyingboss.txt"
herenwo = "\\settings\\maps\\÷–‘≠±±«¯\\∑Á¡Í∂…ƒœ∞∂\\herenwoboss.txt"

xuanjizi = "\\settings\\maps\\∂´±±«¯\\≥§∞◊…Ω¬¥\\xuanjiziboss.txt"
xuanjuedashi = "\\settings\\maps\\∂´±±«¯\\≥§∞◊…Ω¬¥\\xuanjuedashiboss.txt"

hanmeng = "\\settings\\maps\\Ω≠ƒœ«¯\\Œ˜…Ω”Ï\\hanmengboss.txt"

DAMAHUFILE = "\\settings\\maps\\damahuboss.txt"
DAMAHUMAP = {321, 321, 322, 340, 322, 340, 321}
DAMAHUID = {
			{751, 0},
			{752, 0},
			{753, 1},
			{754, 1},
			{755, 2},
			{756, 2},
			{757, 3},
			{758, 3},
			{759, 4},
			{760, 4}
			}


function main()
	--19:30 
--	if (tonumber(date("%H")) == 19) then
--		mb_mapindex = SubWorldID2Idx(341)
--		if (mb_mapindex >= 0 ) then
--			posx3, posy3 = getadata(qingxiaoshitai)--ƒÆ±±≤›‘≠	19£∫30
--			AddNpcEx(743, 95, 2, mb_mapindex, posx3*32, posy3*32, 1, "«Âæ¯ ¶Ã´", 1)		
--			WriteLog(" ±º‰"..date("%H%M%S").."£∫≤˙…˙ª∆ΩBOSS3°∞«Âæ¯ ¶Ã´°±”⁄ƒÆ±±≤›‘≠x£∫"..posx3..",y£∫".. posy3)
--		end

--		fl_mapindex = SubWorldID2Idx(336)
--		if (fl_mapindex >= 0 ) then
--			posx5, posy5 = getadata(yanxiaoqian)--∑Á¡Í∂…±±∞∂336	--÷–‘≠±±«¯		19£∫30
--			AddNpcEx(744, 95, 2, fl_mapindex, posx5*32, posy5*32, 1, "ÊÃœ˛Ÿª", 1)		
--			WriteLog(" ±º‰"..date("%H%M%S").."£∫≤˙…˙ª∆ΩBOSS5°∞ÊÃœ˛Ÿª°±”⁄∑Á¡Í∂…±±∞∂x£∫"..posx5..",y£∫".. posy5)
--		end
	
--		fl_mapindex = SubWorldID2Idx(336)
--		if (fl_mapindex >= 0 ) then
--			posx7, posy7 = getadata(herenwo)--∑Á¡Í∂…ƒœ∞∂336	--÷–‘≠±±«¯	19£∫30
--			AddNpcEx(745, 95, 3, fl_mapindex, posx7*32, posy7*32, 1, "∫Œ»ÀŒ“", 1)			
--			WriteLog(" ±º‰"..date("%H%M%S").."£∫≤˙…˙ª∆ΩBOSS7°∞∫Œ»ÀŒ“°±”⁄∑Á¡Í∂…ƒœ∞∂x£∫"..posx7..",y£∫".. posy7)	
--		end;
	
--		cbn_mapindex = SubWorldID2Idx(321)--≥§∞◊…Ωƒœ321		--∂´±±«¯		19£∫30
--		if (cbn_mapindex >= 0) then
--			posx8, posy8 = getadata(xuanjizi)
--			AddNpcEx(747, 95, 4, cbn_mapindex, posx8*32, posy8*32, 1, "ËØÁ·◊”", 1)		
--			WriteLog(" ±º‰"..date("%H%M%S").."£∫≤˙…˙ª∆ΩBOSS8°∞ËØÁ·◊”°±”⁄≥§∞◊…Ωƒœx£∫"..posx8..",y£∫".. posy8)	
--		end
--	end
	
	--21:00
	if (tonumber(date("%H")) == 21) then
--		mb_mapindex = SubWorldID2Idx(341)--ƒÆ±±≤›‘≠	21£∫00
--		if (mb_mapindex >= 0 ) then
--			posx4, posy4 = getadata(shansinan)
--			AddNpcEx(746, 95, 4, mb_mapindex, posx4*32, posy4*32, 1, "µ•Àºƒœ", 1)		
--			WriteLog(" ±º‰"..date("%H%M%S").."£∫≤˙…˙ª∆ΩBOSS4°∞µ•Àºƒœ°±”⁄ƒÆ±±≤›‘≠x£∫"..posx4..",y£∫".. posy4)
--		end;
	
--		fl_mapindex = SubWorldID2Idx(336)--∑Á¡Í∂…±±∞∂	21£∫00
--		if (fl_mapindex >= 0 ) then
--			posx6, posy6 = getadata(baiyingying)
--			AddNpcEx(742, 95, 1, fl_mapindex, posx6*32, posy6*32, 1, "∞◊”®”®", 1)		
--			WriteLog(" ±º‰"..date("%H%M%S").."£∫≤˙…˙ª∆ΩBOSS6°∞∞◊”®”®°±”⁄∑Á¡Í∂…±±∞∂x£∫"..posx6..",y£∫".. posy6)
--		end

--		xsy_mapindex = SubWorldID2Idx(342)		--Œ˜…Ω”Ï342		Ω≠ƒœ«¯		21£∫00
--		if (xsy_mapindex >= 0) then
--			posx10, posy10 = getadata(hanmeng)
--			AddNpc(748, 95, xsy_mapindex, posx10*32, posy10*32, 1, "∫´√…", 1)
--			WriteLog(" ±º‰"..date("%H%M%S").."£∫≤˙…˙ª∆ΩBOSS9°∞∫´√…°±”⁄Œ˜…Ω”Ïx£∫"..posx10..",y£∫".. posy10)
--		end
		
		damahu_boss()	--ª∆Ωboss¥Û¬Ìª¢£¨ÀÊª˙≥ˆœ÷‘⁄ƒ™∏ﬂøﬂ°¢≥§∞◊…Ωƒœ°¢≥§∞◊…Ω±±
	end
	
	--23:00
--	if (tonumber(date("%H")) == 23) then
--		mg_mapindex = SubWorldID2Idx(340)--ƒ™∏ﬂøﬂ340	--Œ˜±±±±«¯	23£∫00
--		if (mg_mapindex >= 0 ) then
--			posx1, posy1 = getadata(tangburan)
--			AddNpcEx(741, 95, 1, mg_mapindex, posx1*32, posy1*32, 1, "Ã∆≤ª»æ", 1)		
--			WriteLog(" ±º‰"..date("%H%M%S").."£∫≤˙…˙ª∆ΩBOSS1°∞Ã∆≤ª»æ°±”⁄ƒ™∏ﬂøﬂx£∫"..posx1..",y£∫".. posy1)
--		end;

--		mb_mapindex = SubWorldID2Idx(341)--ƒÆ±±≤›‘≠341	--∂´±±	23£∫00
--		if (mb_mapindex >= 0 ) then
--			posx2, posy2 = getadata(wangzuo)
--			AddNpcEx(739, 95, 0, mb_mapindex, posx2*32, posy2*32, 1, "Õı◊Ù", 1)			
--			WriteLog(" ±º‰"..date("%H%M%S").."£∫≤˙…˙ª∆ΩBOSS2°∞Õı◊Ù°±”⁄ƒÆ±±≤›‘≠x£∫"..posx2..",y£∫".. posy2)
--		 end
	 
--		cbb_mapindex = SubWorldID2Idx(322)--≥§∞◊…Ω±±322		--∂´±±«¯		23£∫00
--		if (cbb_mapindex >= 0) then
--			posx9, posy9 = getadata(xuanjuedashi)
--			AddNpcEx(740, 95, 0, cbb_mapindex, posx9*32, posy9*32, 1, "–˛æı¥Û ¶", 1)	
--			WriteLog(" ±º‰"..date("%H%M%S").."£∫≤˙…˙ª∆ΩBOSS9°∞–˛æı¥Û ¶°±”⁄≥§∞◊…Ω±±x£∫"..posx9..",y£∫".. posy9)
--		end
--	end
end
	
		
		
function getadata(file)
	local totalcount = GetTabFileHeight(file);
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function damahu_boss()
	--ÀÊª˙¥”»˝∏ˆµÿÕº≥È≥ˆ“ª∏ˆ
	local d = tonumber(date("%d"))
	local m = tonumber(date("%m"))
	local y = tonumber(date("%y"))
	local w = tonumber(date("%W"))
	local xx = tonumber(date("%w"))
	local ss = d + m + y + w + xx
	local zz = mod(xx, 7)
	if (zz == 0) then
		zz = 7
	end
	damahu_mapid = DAMAHUMAP[zz]
    damahu_mapindex = SubWorldID2Idx(damahu_mapid)
    if (damahu_mapid == 321) then
    	mapname = "Tr≠Íng Bπch s¨n Nam "
    	file = "\\settings\\maps\\∂´±±«¯\\≥§∞◊…Ω¬¥\\xuanjiziboss.txt"
   elseif (damahu_mapid == 322) then
    	mapname = "Tr≠Íng Bπch s¨n Bæc"
    	file = "\\settings\\maps\\∂´±±«¯\\≥§∞◊…Ω¬¥\\xuanjuedashiboss.txt"
    elseif (damahu_mapid == 340) then
    	mapname = "Mπc Cao QuÀt"
    	file = "\\settings\\maps\\Œ˜±±±±«¯\\ƒ™∏ﬂøﬂ\\tangburanboss.txt"
    end
    
    if (damahu_mapindex >= 0) then
    --ÀÊª˙…Ë÷√¥Û¬Ìª¢µ√ŒÂ–– Ù–‘°¢∫Õƒ£∞Êid
	rannum = random(10)
    	posx,posy =getadata(file)
    	local npcidx = AddNpcEx(DAMAHUID[rannum][1], 95, DAMAHUID[rannum][2], damahu_mapindex, posx*32, posy*32, 1, "ßπi M∑ HÊ ", 1)
    	SetNpcDeathScript(npcidx, "\\script\\missions\\boss\\bossdeath.lua");
	WriteLog("ThÍi gian"..date("%H%M%S")..": Xu t hi÷n BOSS Hoµng Kim 'ßπi M∑ HÊ' mapid:"..damahu_mapid..", t‰a ÆÈ x:"..posx..", y:".. posy..". ßπi M∑ HÊ (ID lµ:"..DAMAHUID[rannum][1]..", thuÈc t›nh ngÚ hµnh:"..DAMAHUID[rannum][2])
	AddGlobalNews("ßπi M∑ HÊ xu t hi÷n tπi "..mapname.." ("..floor(posx/8)..","..floor(posy/16)..")")
	end
end
