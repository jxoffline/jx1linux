Include("\\script\\lib\\file.lua")
CP_MAPTAB = {
				{396, 397},
				{398, 399},
				{400, 401},
			 	{402, 403},
			 	{404, 405},
			 	{406, 407},
			 	{408, 409},
			 	{410, 411},
			 	{412, 413},
			 	{414, 415},
			 }
CP_TRAPIN = "\\settings\\maps\\freshman_match\\linantoplace_trap.txt"
CP_TRAPOUT = ""
CP_TRAPIN_FILE = "\\script\\missions\\freshman_match\\trap\\trap_linantoplace.lua"
CP_TRAPOUT_FILE = "\\script\\missions\\freshman_match\\trap\\trap_placetolinan.lua"

CHAMPIONNPC = {
	{393, 1461, 3022,"Xa phu","\\script\\missions\\freshman_match\\npc\\chefu.lua"},
	{625, 1522, 3083, "R­¬ng chøa ®å", "\\script\\missions\\freshman_match\\obj\\box.lua"},
	{389, 1556, 3050, "Chñ d­îc ®iÕm", "\\script\\missions\\freshman_match\\npc\\yaofan.lua"},
	{308, 1584, 2965, "ThÞ vÖ héi tr­êng","\\script\\missions\\freshman_match\\npc\\shiwei_nei.lua"},
	{308, 1514, 3015, "Quan viªn héi tr­êng","\\script\\missions\\freshman_match\\npc\\shiwei_wai.lua"},
	{308, 1534, 3050, "Quan viªn héi tr­êng","\\script\\missions\\freshman_match\\npc\\shiwei_wai.lua"},
	{308, 1484, 2999, "Quan viªn héi tr­êng","\\script\\missions\\freshman_match\\npc\\shiwei_wai.lua"}
	}
CHAMPIONSHIP_GUANYUAN = {
					{308, 1624,3233, "Sø gi¶ kiÖt xuÊt", "\\script\\missions\\freshman_match\\npc\\manager.lua"},
					{308, 1457,3259, "Quan viªn §¹i héi vâ l©m", "\\script\\missions\\championship\\npc\\manager.lua"}
					}

function add_championnpc()
--¼ÓÔØ»á³¡NPC
	local npcidx = 0
	local mapidx = 0
	for j = 1 , getn(CP_MAPTAB) do
		for i = 1 , getn(CHAMPIONNPC) do 
			mapidx = SubWorldID2Idx(CP_MAPTAB[j][1]);
			if (mapidx >= 0) then
				npcidx = AddNpc(CHAMPIONNPC[i][1],1,mapidx,CHAMPIONNPC[i][2]*32,CHAMPIONNPC[i][3]*32,1,CHAMPIONNPC[i][4]);
				SetNpcScript(npcidx, CHAMPIONNPC[i][5]);
			end;
		end;
	end;
	if (SubWorldID2Idx(176) > 0) then
		for i = 1, getn(CHAMPIONSHIP_GUANYUAN) do
			npcidx = AddNpc(CHAMPIONSHIP_GUANYUAN[i][1],1,SubWorldID2Idx(176),CHAMPIONSHIP_GUANYUAN[i][2]*32,CHAMPIONSHIP_GUANYUAN[i][3]*32,1,CHAMPIONSHIP_GUANYUAN[i][4]);
			SetNpcScript(npcidx, CHAMPIONSHIP_GUANYUAN[i][5]);
		end
	end
--¼ÓÔØÁÙ°²µ½»á³¡µÄTRAP
	trapidx = SubWorldID2Idx(176)
	if ( trapidx > 0) then
		local count = GetTabFileHeight(CP_TRAPIN)
		for i=1 , count do 
			local posx = GetTabFileData(CP_TRAPIN, i + 1, 1)
			local posy = GetTabFileData(CP_TRAPIN, i + 1, 2)
			AddMapTrap(176, posx * 32, posy * 32, CP_TRAPIN_FILE);
		end
	else
		print("ANNOUNCE: THE LINAN IS NOT IN THIS SEVER, AND CAN'T ADD TRAP OF CHAMPIONSHIP!!!!")
	end
	
end

------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end
------------------------------------------------------------------------------------