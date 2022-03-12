Include("\\script\\lib\\pay.lua")
IncludeLib("FILESYS")
tbLANTERNS_NPC = {
		{ 2, 	36, 280, 600,	"\\settings\\event\\zhongqiuhuodong\\huashan_lantern.txt",		"\\script\\event\\great_night\\lantern\\lantern.lua", "Hoa S¬n" },
		{ 21,	37, 300, 600,	"\\settings\\event\\zhongqiuhuodong\\qingcheng_lantern.txt",	"\\script\\event\\great_night\\lantern\\lantern.lua", "Thanh Thµnh S¬n" },
		{ 167, 	38, 300, 600,	"\\settings\\event\\zhongqiuhuodong\\diancang_lantern.txt",		"\\script\\event\\great_night\\lantern\\lantern.lua", "§iÓm Th­¬ng s¬n" },
		{ 193, 	39, 300, 600,	"\\settings\\event\\zhongqiuhuodong\\wuyi_lantern.txt",			"\\script\\event\\great_night\\lantern\\lantern.lua", "Vò Di s¬n" },
}

tbLANTERN_ENTER_POS = {
		[2] = { 	--huashan
			{ 2287 ,4092 },
			{ 2595, 3501 },
			{ 2546, 3618 },
			{ 2360, 3758 },
			{ 2332, 3912 },
			{ 2355, 4045 },
			{ 2428, 4054 },
			{ 2525, 4052 },
			{ 2290, 4087 },
			{ 2546, 4035 },
		 },
		[21] = { 	--qingchengshan
			{ 2621, 4501 },
			{ 2577, 3292 },
			{ 2387, 3706 },
			{ 2561, 3313 },
			{ 2365, 4016 },
			{ 2735, 3965 },
			{ 2542, 3915 },
			{ 2270, 3842 },
			{ 2830, 3700 },
			{ 2049, 4107 },
		 },
		[167] = { 	--diancangshan
			{ 1606, 3214 },
			{ 1373, 2532 },
			{ 1689, 2620 },
			{ 1430, 2692 },
			{ 1617, 2738 },
			{ 1216, 2805 },
			{ 1586, 2850 },
			{ 1430, 2950 },
			{ 1671, 3034 },
			{ 1517, 3215 },
		 },
		[193] = { 	--wuyishan
			{ 1937, 2851},
			{ 1071, 2843 },
			{ 1130, 3074 },
			{ 1113, 2641 },
			{ 1447, 3243 },
			{ 1808, 2705 },
			{ 1513, 2497 },
			{ 1213, 2565 },
			{ 1431, 2776 },
			{ 1310, 2435 },
		 },
}

LANTERN_START	= 1900;
LANTERN_END		= 2100;

function lantern_enter_lantern(area)
	local tb_enter_pos = tbLANTERN_ENTER_POS[area]
	if ( tb_enter_pos ~= nil ) then
		local randnum = random( getn( tb_enter_pos ) )
		NewWorld(area, tb_enter_pos[randnum][1], tb_enter_pos[randnum][2])
		SetFightState(1)
	end
end

--NPCID:1077, 1, 
-- Éú³ÉµÆÁýNPC
function create_lanterns()
	OldSubWorld = SubWorld
	for i = 1, getn(tbLANTERNS_NPC) do
		local addcount = 0
		local world = SubWorldID2Idx(tbLANTERNS_NPC[i][1])
		if (world >= 0) then
			ClearMapNpcWithName(tbLANTERNS_NPC[i][1], "Hoa ®¨ng");
			SubWorld = world
			local lantern_count = 0					-- GetGlbValue( tbLANTERNS_NPC[i][2] ) ²»ÔÙ¼ÆËãÉÏ´ÎÊ£Óà»¨µÆÊýÁ¿
			local lantern_addent = tbLANTERNS_NPC[i][3]
			if ( lantern_count + lantern_addent > tbLANTERNS_NPC[i][4] ) then
				lantern_addent = tbLANTERNS_NPC[i][4] - lantern_count
			end
			
			if ( lantern_addent > 0 ) then
				addcount = add_rand_lanterns( tbLANTERNS_NPC[i][5], tbLANTERNS_NPC[i][6], 1077, lantern_addent )
--				SetGlbValue( tbLANTERNS_NPC[i][2], (GetGlbValue( tbLANTERNS_NPC[i][2] ) + addcount) )
			end
			SubWorld = OldSubWorld
		end
	end
end

function add_rand_lanterns( npcfile, scriptfile, npcid, count )
	TabFile_Load(npcfile, npcfile)
	local addcount = 0
	local filehigh = TabFile_GetRowCount(npcfile) - 1
	local num = 0
	local tbrow = {}
	while ( num < count ) do	--Ëæ»úÑ¡Ôñ×ø±ê±íµÄ²»ÖØ¸´µÄÐÐ£¬×÷ÎªnpcµÄÖØÉúµã
		local rannum = random( filehigh );
		if (not tbrow[rannum]) then
			tbrow[rannum] = 1;
			num = num + 1;
		end;
	end
	for k, v in tbrow do
		xpos = TabFile_GetCell(npcfile, k + 1, 1)
		ypos = TabFile_GetCell(npcfile, k + 1, 2)
		local npcidx = AddNpc(npcid, 1, SubWorld, xpos, ypos, 1, "Hoa ®¨ng");
		if ( npcidx > 0 ) then
			SetNpcScript(npcidx, scriptfile)
			SetNpcParam(npcidx,4,1)
			addcount = addcount + 1
		end
	end
	return addcount
end

function go_lanternplace()
	if ( IsCharged() ~= 1 ) then
		Say("<#>B¹n ph¶i n¹p thÎ míi cã thÓ tham gia Ho¹t ®éng Hoa ®¨ng!", 0)
		return 0;
	end;
	
	local ntime = tonumber(GetLocalDate("%H%M"));
	if (ntime < LANTERN_START or ntime >= LANTERN_END) then
		Say("Ho¹t ®éng Hoa ®¨ng chØ b¾t ®Çu tõ 19h:00 ®Õn 21h:00! Xin quay l¹i sau nhÐ!", 0)
		return 0;
	end;
	
	Say("B¹n muèn ®Õn khu vùc nµo ®Ó tham gia Hoa ®¨ng: Thanh Thµnh s¬n, Vò Di S¬n, §iÓm Th­¬ng s¬n, Hoa s¬n?",5, "<#> Thanh Thµnh s¬n/#lantern_enter_lantern(21)", "<#> Vò Di s¬n/#lantern_enter_lantern(193)", "<#> §iÓm Th­¬ng s¬n/#lantern_enter_lantern(167)", "<#> Hoa S¬n/#lantern_enter_lantern(2)", "<#> KÕt thóc ®èi tho¹i!/OnCancel");
end;

function del_all_lantern()
	for i = 1, getn(tbLANTERNS_NPC) do
		local world = SubWorldID2Idx(tbLANTERNS_NPC[i][1])
		if (world >= 0) then
			ClearMapNpcWithName(tbLANTERNS_NPC[i][1], "Hoa ®¨ng");
		end
	end
end
