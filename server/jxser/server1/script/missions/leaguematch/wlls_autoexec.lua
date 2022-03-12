Include("\\script\\missions\\leaguematch\\head.lua")

--³ÇÊÐNPC
WLLS_NPC_CITY = {
	{308,	"Sø gi¶ kiÖt xuÊt",	"\\script\\missions\\leaguematch\\npc\\officer.lua",	{{176, 1457, 3259}, {37, 1777, 3063}, {78,1546,3117}}},
	{308,	"Sø gi¶ liªn ®Êu ",		"\\script\\missions\\leaguematch\\npc\\officer.lua",	{{80, 1753, 3035}, {162, 1599, 3150}, {1,1673,3219}, {11,3214,5149}}},
	{87,	"Sø gi¶ liªn ®Êu",			"\\script\\missions\\leaguematch\\npc\\helper.lua",		{{162,1592,3168}, {80,1737,3040}, {37,1760,3086}, {176,1452,3279}, {1,1683,3240}, {11,3226,5161}, {78,1558,3116}}},
}

--±¨ÃûµãNPC
WLLS_NPC_SIGNUP = {
	--NpcID, X, Y,	ScriptFile,	NpcName
	{308, 1514, 3015, "\\script\\missions\\leaguematch\\npc\\signup.lua",	"Quan viªn héi tr­êng"},
	{308, 1534, 3050, "\\script\\missions\\leaguematch\\npc\\signup.lua",	"Quan viªn héi tr­êng"},
	{308, 1484, 2999, "\\script\\missions\\leaguematch\\npc\\signup.lua",	"Quan viªn héi tr­êng"},
	{389, 1556, 3050, "\\script\\missions\\leaguematch\\npc\\yaoshang.lua",	"Chñ d­îc ®iÕm"},
	{393, 1461, 3022, "\\script\\missions\\leaguematch\\npc\\chefu.lua",	"Xa phu"},
	{625, 1522, 3083, "\\script\\missions\\leaguematch\\npc\\chuwuxiang.lua","R­¬ng chøa ®å"},
}

--×¼±¸³¡NPC
WLLS_NPC_PREP = {
	--NpcID, X, Y,	ScriptFile,	NpcName
	{308, 1584, 2965,"\\script\\missions\\leaguematch\\npc\\housecarl.lua","ThÞ vÖ héi tr­êng"},
}

wlls_tmp_map = {}

function wlls_autoexe()
	--³ÇÊÐNPC
	for _, tb in WLLS_NPC_CITY do
		wlls_add_citynpc(unpack(tb))
	end
	
	--Èü³¡NPC
	local n_npcidx = 0
	local n_mapidx = 0
	for _, tb_data in WLLS_TAB do
		for _, tb_mtype in tb_data.match_type do
			for _, tb_group in tb_mtype.map do
				wlls_add_matchnpc(tb_group[1], WLLS_NPC_SIGNUP)
				wlls_add_matchnpc(tb_group[2], WLLS_NPC_PREP)
			end;
		end;
	end;
end;

function wlls_add_citynpc(n_id, str_name, str_script, tb_poss)
	for _, tb_pos in tb_poss do
		local n_idx = SubWorldID2Idx(tb_pos[1]);
		if (n_idx >= 0) then
			local N_npcidx = AddNpc(n_id, 1, n_idx, tb_pos[2]*32, tb_pos[3]*32, 1, str_name);
			SetNpcScript(N_npcidx, str_script);
		end;
	end
end;

function wlls_add_matchnpc(n_mapid, tb_npcs)
	if (wlls_tmp_map[n_mapid]) then	--¸ÃµØÍ¼¼ÓÔØ¹ýNPC
		return
	else
		wlls_tmp_map[n_mapid] = 1
	end
	n_mapidx = SubWorldID2Idx(n_mapid);
	if (n_mapidx >= 0) then
		for _, tb_npc in tb_npcs do 
			n_npcidx = AddNpc(tb_npc[1], 1, n_mapidx, tb_npc[2]*32, tb_npc[3]*32, 1, tb_npc[5]);
			SetNpcScript(n_npcidx, tb_npc[4]);
		end;
	end;
end;

