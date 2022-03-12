tbTONGWAR_MAP = { 608, 609, 610, 611, 612, 613 }
tbTONGWAR_NPC = {
	{ 393, 1597, 3139, "Xa phu",		"\\script\\missions\\tongwar\\npc\\chefu.lua" },
	{ 625, 1590, 3132, "R­¬ng chøa ®å",	"\\script\\missions\\tongwar\\npc\\openbox.lua" },
	{ 389, 1580, 3151, "Chñ d­îc ®iÕm",		"\\script\\missions\\tongwar\\npc\\doctor.lua" },
--	{389, 1589, 3148, "trap", "\\script\\missions\\tongwar\\trap\\tongwar_trap.lua"}
	
}
TONGWAR_TRAPTXT = "\\settings\\maps\\tongwar\\signup_trap.txt"
function tongwar_addsignnpc()
local oldSubWorld = SubWorld
	for i = 1, getn( tbTONGWAR_MAP ) do
		local sidx = SubWorldID2Idx( tbTONGWAR_MAP[i] )
		if ( sidx >= 0 ) then
			SubWorld = sidx
			for j = 1, getn(tbTONGWAR_NPC) do
				local npcidx = AddNpc( tbTONGWAR_NPC[j][1], 1, sidx, tbTONGWAR_NPC[j][2]*32, tbTONGWAR_NPC[j][3]*32, 1, tbTONGWAR_NPC[j][4] )
				if (npcidx > 0) then
					SetNpcScript(npcidx, tbTONGWAR_NPC[j][5]);
				end
			end
			maphigh = GetTabFileHeight(TONGWAR_TRAPTXT)
			for j = 1, maphigh do
				x = GetTabFileData(TONGWAR_TRAPTXT, j + 1, 1);
				y = GetTabFileData(TONGWAR_TRAPTXT, j + 1, 2);
				AddMapTrap(tbTONGWAR_MAP[i], x,y, "\\script\\missions\\tongwar\\trap\\tongwar_trap.lua");
			end;
			SubWorld = oldSubWorld
		end
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	--THDNB13 §iÒu chØnh thêi gian add npc sø gi¶  - Modified by DinhHQ - 20130409
	if (nDate >= 20130415 and nDate <= 20130422) then
		local sidx = SubWorldID2Idx(2);
		if (sidx >= 0) then
			SubWorld = sidx;
			local npcidx = AddNpc(53, 1, sidx, 2608*32,3496*32, 1, "Sø gi¶ Thiªn H¹ §Ö NhÊt Bang");
			if (npcidx > 0) then
				SetNpcScript(npcidx, "\\script\\event\\tongwar\\npc_shizhe.lua");
			end;
		end;
	end;
end