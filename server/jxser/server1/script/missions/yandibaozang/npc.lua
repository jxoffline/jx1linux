-- Ñ×µÛ±¦²Ø
-- by Ð¡ÀË¶à¶à
-- 2007.10.24
-- ÎÒ..
-- ÕýÔÚ³¢ÊÔ×Å..
-- Ñ°ÕÒ×ÅÊôÓÚÎÒµÄÌìµØ..


Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")

-- ¹ÖÎïÊýÁ¿<=>Î»ÖÃÎÄ¼þ
YDBZ_map_posfiles = {
	[1]={	--Ç°10¹Ø¹ÖµÄÈýÂ·µÄ×ø±êµã
		[1] = {
			[1] = {"\\settings\\maps\\yandibaozang\\waya_01.txt", 1},	
			[2] = {"\\settings\\maps\\yandibaozang\\waya_02.txt", 1},
			[3] = {"\\settings\\maps\\yandibaozang\\waya_03.txt", 1},	
			[4] = {"\\settings\\maps\\yandibaozang\\waya_04.txt", 1},
			[5] = {"\\settings\\maps\\yandibaozang\\waya_05.txt", 1},	
			[6] = {"\\settings\\maps\\yandibaozang\\waya_06.txt", 1},
			[7] = {"\\settings\\maps\\yandibaozang\\waya_07.txt", 1},	
			[8] = {"\\settings\\maps\\yandibaozang\\waya_08.txt", 1},
			[9] = {"\\settings\\maps\\yandibaozang\\waya_09.txt", 1},	
			[10]= {"\\settings\\maps\\yandibaozang\\waya_10.txt", 1},	
		},
		[2] = {
			[1] = {"\\settings\\maps\\yandibaozang\\wayb_01.txt", 1},	
			[2] = {"\\settings\\maps\\yandibaozang\\wayb_02.txt", 1},
			[3] = {"\\settings\\maps\\yandibaozang\\wayb_03.txt", 1},	
			[4] = {"\\settings\\maps\\yandibaozang\\wayb_04.txt", 1},
			[5] = {"\\settings\\maps\\yandibaozang\\wayb_05.txt", 1},	
			[6] = {"\\settings\\maps\\yandibaozang\\wayb_06.txt", 1},
			[7] = {"\\settings\\maps\\yandibaozang\\wayb_07.txt", 1},	
			[8] = {"\\settings\\maps\\yandibaozang\\wayb_08.txt", 1},
			[9] = {"\\settings\\maps\\yandibaozang\\wayb_09.txt", 1},	
			[10]= {"\\settings\\maps\\yandibaozang\\wayb_10.txt", 1},		
		},
		[3] = {
			[1] = {"\\settings\\maps\\yandibaozang\\wayc_01.txt", 1},	
			[2] = {"\\settings\\maps\\yandibaozang\\wayc_02.txt", 1},
			[3] = {"\\settings\\maps\\yandibaozang\\wayc_03.txt", 1},	
			[4] = {"\\settings\\maps\\yandibaozang\\wayc_04.txt", 1},
			[5] = {"\\settings\\maps\\yandibaozang\\wayc_05.txt", 1},	
			[6] = {"\\settings\\maps\\yandibaozang\\wayc_06.txt", 1},
			[7] = {"\\settings\\maps\\yandibaozang\\wayc_07.txt", 1},	
			[8] = {"\\settings\\maps\\yandibaozang\\wayc_08.txt", 1},
			[9] = {"\\settings\\maps\\yandibaozang\\wayc_09.txt", 1},	
			[10]= {"\\settings\\maps\\yandibaozang\\wayc_10.txt", 1},		
		},
	},
	[2] = {--ÖÐ¼äÕù¶áµØ´øboss×ø±êµã
		[1] = {"\\settings\\maps\\yandibaozang\\wayfinial.txt", 1},			
	},
};

-- NPCµÄID¿ÉÒÔÎªÈýÖÖÀàÐÍ£ºÊý×Ö¡¢±í¸ñ¡¢º¯Êý
-- NPC²ÎÊý¸÷ÁÐµÄº¬Òå£º<NPCÀàÐÍÊýÁ¿>, <½±Àø>, <ºóÐø´¦Àí¡¢ID¡¢Ãû×Ö¡¢µÈ¼¶¡¢ÎåÐÐ¡¢ÊÇ·ñBOSS(0,1)¡¢ÊýÁ¿¡¢Î»ÖÃ>
--Î»ÖÃtable {x,y,nway} nway´ú±íÄÄ¹Ø,1-10´ú±íA¶ÓµÄ10¹Ø,11-20´ú±íB¶ÓµÄ10¹Ø,21-30´ú±íC¶ÓµÄ10¹Ø
-- ¹ÖÎï
YDBZ_map_npc = {
	-- 1
	{
		{nil, 1299, "M«n ®Ö Thiªn V­¬ng Bang", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1289, "Cæ Thiªn KhuyÕt", 95, 0, 1, 1, func_npc_getpos}
	},
	-- 2
	{
		{nil, 1300, "§Ö tö ThiÕu l©m", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1290, "Chøng Ng«n", 95, 0, 1, 1, func_npc_getpos}
	},
	-- 3
	{
		{nil, 1301, "Ngò §éc gi¸o ®å", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1291, "ChiÕu NhËt MiÖn", 95, 1, 1, 1, func_npc_getpos}
	},
	-- 4
	{
		{nil, 1302, "§­êng M«n gia ®inh", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1292, "§­êng H¹o", 95, 1, 1, 1, func_npc_getpos}
	},
	-- 5
	{
		{nil, 1303, "§Ö tö Nga My", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1293, "DiÖu NhÊt", 95, 2, 1, 1, func_npc_getpos}
	},
	-- 6
	{
		{nil, 1304, "§Ö t?Thóy Yªn ", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1294, "LÖ ChiÕt Mai", 95, 2, 1, 1, func_npc_getpos}
	},
	-- 7
	{
		{nil, 1305, "Thiªn NhÉn Gi¸o ®å", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1295, "§oan Méc Li", 95, 3, 1, 1, func_npc_getpos}
	},
	-- 8
	{
		{nil, 1306, "§Ö tö C¸i Bang", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1296, "B¹ch Lang", 95, 3, 1, 1, func_npc_getpos}
	},
	-- 9
	{
		{nil, 1307, "§Ö tö Vâ §ang", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1297, "TÇn HiÓu Th­", 95, 4, 1, 1, func_npc_getpos}
	},
	-- 10
	{
		{nil, 1308, "§Ö tö C«n L«n", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1298, "L¨ng Tiªu Tö", 95, 4, 1, 1, func_npc_getpos}
	},
};

--nÂ·Ïß,m¹Ø boss
YDBZ_map_npcBossEx = 
{
	[1] = 
	{
		[3] = {nil, 1310, "Cæ Thiªn KhuyÕt (Né)", 95, 0, 1, 1, func_npc_getpos},
		[6] = {nil, 1312, "ChiÕu NhËt MiÖn (Né)", 95, 1, 1, 1, func_npc_getpos},
	},
	[2] = 
	{
		[3] = {nil, 1317, "B¹ch Lang (Né)", 95, 3, 1, 1, func_npc_getpos},
		[6] = {nil, 1314, "DiÖu NhÊt (Né)", 95, 2, 1, 1, func_npc_getpos},
	},
	[3] =
	{
		[3] = {nil, 1318, "TÇn HiÓu Th­ (Né)", 95, 4, 1, 1, func_npc_getpos},
		[6] = {nil, 1319, "L¨ng Tiªu Tö (Né)", 95, 4, 1, 1, func_npc_getpos},
	},
}

YDBZ_map_npcYuanJun =
{
	{nil, 1338, "Dung Binh", 90, -1, 1, 5, func_npc_getpos},
}
--Î»ÖÃtable {x,y,nway} nway´ú±íÄÄ¹Ø,40-´ú±íÕù¶áµãboss
YDBZ_map_npcboss = {
	{nil, 1311, "ChÝnh Ng«n (Né)", 95, 0, 1, 1, func_npc_getpos},
	{nil, 1313, "§­êng H¹o (Né)", 95, 1, 1, 1, func_npc_getpos},
	{nil, 1315, "LÖ ChiÕt Mai (Né)", 95, 2, 1, 1, func_npc_getpos},
	{nil, 1316, "§oan Méc Li (Né)", 95, 3, 1, 1, func_npc_getpos},
}

YDBZ_map_npcfinal = {
	{nil, 1309, "L­¬ng Mi Nhi", 95, -1, 1, 1, func_npc_getpos},
}

-- »ñÈ¡NPCµÄID
function YDBZ_get_npc_id(item, index)
	local id = item[YDBZ_NPC_ATTRIDX_ID];
	local id_type = type(id);
	if (id_type == "function") then
		return id(item, index);
	elseif (id_type == "number") then
		return id;
	elseif (id_type == "table") then
		local pos = random(1, getn(id));
		return id[pos];
	end
end

-- »ñÈ¡NPCµÄÃû×Ö
function YDBZ_get_npc_name(item, index)
	local name = item[YDBZ_NPC_ATTRIDX_NAME];
	local name_type = type(name);
	-- DEBUG
--	print(format("get_npc_name(): item is %s", name_type));
	
	if (name_type == "string") then
		return name;
	elseif (name_type == "function") then
		return name(item, index);
	elseif (name_type == "table") then
		local func = name[1];
		return func(item, index);
	else
		return nil;
	end
end

-- »ñÈ¡NPCµÄ¼¶±ð
function YDBZ_get_npc_level(item, index)
	-- DEBUG
--	print(format("get_npc_level():%d", item[NPC_ATTRIDX_LEVEL]));
	return item[YDBZ_NPC_ATTRIDX_LEVEL];
end

-- »ñÈ¡NPCµÄÎåÐÐ
function YDBZ_get_npc_series(item, index)
	local series = item[YDBZ_NPC_ATTRIDX_SERIES];
	local series_type = type(series);
	if (series_type == "function") then
		return series(item, index);
	elseif (series_type == "number") then
		if (series < 0) then
			local pos = random(1, getn(YDBZ_map_series));
			return YDBZ_map_series[pos];
		else
			return series;
		end
	else
		return nil;
	end
end

-- NPCµÄºóÐø´¦Àí£¨ÀÛ¼Óµ±Ç°Ê¹ÓÃµÄÍæ¼ÒË÷Òý£©
function YDBZ_npc_proceed(item)
	local proceed = item[YDBZ_NPC_ATTRIDX_PROCEED];
	local proceed_type = type(proceed);
	if (proceed_type == "function") then
		YDBZ_proceed(item);
	end
end

-- »ñÈ¡NPCµÄÊýÁ¿
function YDBZ_get_npc_count(item)
	return item[YDBZ_NPC_ATTRIDX_COUNT];
end

-- »ñÈ¡NPCµÄÎ»ÖÃ
function YDBZ_get_npc_pos(item, index,nnpclist)
	local pos = item[YDBZ_NPC_ATTRIDX_POSITION];
	local pos_type = type(pos);
	if (pos_type == "table") then
		return pos[1], pos[2];
	elseif (pos_type == "function") then
		return pos(item, index,nnpclist);
	else
		return nil;
	end
end

-- ÊÇ·ñBOSS
function YDBZ_get_npc_isboss(item,index)
	return item[YDBZ_NPC_ATTRIDX_ISBOSS];
end

-- µ±Ç°±ÈÈüÊÇ·ñ¸ß¼¶±ÈÈü
function advanced()
	world = SubWorldIdx2ID(SubWorld);
	return map_isadvanced[world] ~= 0;
end

-- µ±Ç°NPCÉèÖÃ±í¡¡
function current_npc_map()
	if (advanced()) then
		return map_hnpc;
	else
		return map_lnpc;
	end
end

-- »ñÈ¡Åú´ÎÊýÁ¿
function get_batch_count()
	return getn(current_npc_map());
end

-- ¸ù¾ÝÉè¶¨´´½¨NPC£¬·µ»Ø´´½¨µÄNPCµÄÊýÁ¿
function YDBZ_add_npc(file,nteams,nway,nstate)
	local file_name = file[1];	-- ×ø±êÎÄ¼þÃû
	local pos_count = file[2];	-- ×ø±êÁÐÊýÁ¿
	local column = 2 * (random(1, pos_count) - 1) + 1;
	local ntype = GetMissionV(YDBZ_NPC_TYPE[nteams][nway])
		local	items = YDBZ_map_npc[ntype]
	--for npcitem=1,getn(items) do
		local item = items[nstate]
		if nstate == 21 then
			item = YDBZ_map_npcBossEx[nteams][nway]
		end
		local npc_count = YDBZ_get_npc_count(item);			-- NPCÊýÁ¿
		local res_count = 0;							-- ²úÉúµÄNPCÊýÁ¿
		local radomitem = {}
		
		local npc_create_point = YDBZ_GetTabFileHeight(file_name)
		local nlistsum = 0 
		if npc_create_point < npc_count then
			nlistsum = npc_count
		else
			nlistsum = npc_create_point
		end
		for i=1,nlistsum do
			if i > npc_create_point then
				radomitem[i] = random(1,npc_create_point)
			else
				radomitem[i] = i
			end
		end
	  radomitem = YDBZ_get_randomlist(radomitem,nlistsum)
		for index = 1, npc_count do
			local id = YDBZ_get_npc_id(item, index);			-- NPCµÄID
			local level = YDBZ_get_npc_level(item, index);	-- NPCµÈ¼¶
			local isboss = YDBZ_get_npc_isboss(item, index);	-- ÊÇ·ñboss
			local series = YDBZ_get_npc_series(item, index);
			local name = YDBZ_get_npc_name(item, index);
			
			--print(nteams.." way:"..nway.."callnpc:"..radomitem[index])
			local px,py = YDBZ_get_file_pos(file_name, radomitem[index] + 1, column);
			YDBZ_npc_proceed(item);
			
			-- DEBUG
	--		print("AddNpcEx");
	--		print(format("id:%d", id));
	--		print(format("level:%d", level));
	--		print(format("series:%d", series));
	--		print(format("isboss:%d", isboss));
	--		print(format("name:%s", name));
	--		print(format("pos: %d, %d", px, py));
	
			local npc_index = AddNpcEx(
				id,			-- ID
				level,		-- µÈ¼¶
				series,		-- ÎåÐÐ
				SubWorld,	-- µØÍ¼
				px ,	-- X×ø±ê
				py ,	-- Y×ø±ê
				1,			-- ²»ÖØÉú
				name,		-- Ãû×Ö
				isboss);	-- ÊÇ·ñBOSS
			if (npc_index ~= nil and npc_index > 0) then
				res_count = res_count + 1;
				-- ÉèÖÃËÀÍö½Å±¾
				if isboss == 1 and ( nstate == 2 or nstate == 21 ) then
					SetNpcParam(npc_index,1,((nteams-1)*10 + nway))
				else
					SetNpcParam(npc_index,1,0)
					SetNpcParam(npc_index,2,(nteams-1)*10 + ntype)
				end
				SetNpcDeathScript(npc_index, YDBZ_SCRIPT_NPC_DEATH);
			else
				-- DEBUG
				local msg = format("Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!!!",
					id, level, series, SubWorld, px/32, py/32, 1, name, isboss);
				print(msg);
			end
			--print("²ú¹ÖÊýÁ¿£º"..res_count)
		end
	--end
end

function YDBZ_add_npcboss(file,nway)
	local file_name = file[1];	-- ×ø±êÎÄ¼þÃû
	local pos_count = file[2];	-- ×ø±êÁÐÊýÁ¿
	local column = 2 * (random(1, pos_count) - 1) + 1;
	local radomlist = {}
	local radsum = getn(YDBZ_map_npcboss)
	for i=1,radsum do
			radomlist[i] = i
	end
	radomlist = YDBZ_get_randomlist(radomlist,radsum)
	for index=1,radsum do
		local item = YDBZ_map_npcboss[radomlist[index]]
		local npc_count = YDBZ_get_npc_count(item);			-- NPCÊýÁ¿
		local res_count = 0;							-- ²úÉúµÄNPCÊýÁ¿
		local id = YDBZ_get_npc_id(item, index);			-- NPCµÄID
		local level = YDBZ_get_npc_level(item, index);	-- NPCµÈ¼¶
		local isboss = YDBZ_get_npc_isboss(item, index);	-- ÊÇ·ñboss
		local series = YDBZ_get_npc_series(item, index);
		local name = YDBZ_get_npc_name(item, index);
		local px,py = YDBZ_get_file_pos(file_name, index + 1, column);
		YDBZ_npc_proceed(item);
		
		-- DEBUG
--		print("AddNpcEx");
--		print(format("id:%d", id));
--		print(format("level:%d", level));
--		print(format("series:%d", series));
--		print(format("isboss:%d", isboss));
--		print(format("name:%s", name));
--		print(format("pos: %d, %d", px, py));

		local npc_index = AddNpcEx(
			id,			-- ID
			level,		-- µÈ¼¶
			series,		-- ÎåÐÐ
			SubWorld,	-- µØÍ¼
			px ,	-- X×ø±ê
			py ,	-- Y×ø±ê
			1,			-- ²»ÖØÉú
			name,		-- Ãû×Ö
			isboss);	-- ÊÇ·ñBOSS
		if (npc_index ~= nil and npc_index > 0) then
			res_count = res_count + 1;
			-- ÉèÖÃËÀÍö½Å±¾
			if isboss == 1 then
				SetNpcParam(npc_index,1,40)
				local nsum = GetMissionV(YDBZ_NPC_BOSS_COUNT)
				SetMissionV(YDBZ_NPC_BOSS_COUNT,(nsum+1))
			end
			SetNpcDeathScript(npc_index, YDBZ_SCRIPT_NPC_DEATH);
		else
			-- DEBUG
			local msg = format("Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!!!",
				id, level, series, SubWorld, px, py, 1, name, isboss);
			print(msg);
		end
	end
end

function YDBZ_add_final_npc(world,x,y)
	for index=1,getn(YDBZ_map_npcfinal) do
		local item = YDBZ_map_npcfinal[index]
		local npc_count = YDBZ_get_npc_count(item);			-- NPCÊýÁ¿
		local res_count = 0;							-- ²úÉúµÄNPCÊýÁ¿
		local id = YDBZ_get_npc_id(item, index);			-- NPCµÄID
		local level = YDBZ_get_npc_level(item, index);	-- NPCµÈ¼¶
		local isboss = YDBZ_get_npc_isboss(item, index);	-- ÊÇ·ñboss
		local series = YDBZ_get_npc_series(item, index);
		local name = YDBZ_get_npc_name(item, index);
		local nsubworld = world
		local px = x
		local py = y
		local npc_index = AddNpcEx(
				id,			-- ID
				level,		-- µÈ¼¶
				series,		-- ÎåÐÐ
				nsubworld,	-- µØÍ¼
				px ,	-- X×ø±ê
				py ,	-- Y×ø±ê
				1,			-- ²»ÖØÉú
				name,		-- Ãû×Ö
				isboss);	-- ÊÇ·ñBOSS
		if (npc_index ~= nil and npc_index > 0) then
			if isboss == 1 then
				SetNpcParam(npc_index,1,50)
				--local nsum = GetMissionV(YDBZ_NPC_BOSS_COUNT)
				--SetMissionV(YDBZ_NPC_BOSS_COUNT,(nsum+1))
			end
			SetNpcDeathScript(npc_index, YDBZ_SCRIPT_NPC_DEATH);
		else
			-- DEBUG
			local msg = format("Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!!!",
				id, level, series, SubWorld, px, py, 1, name, isboss);
			print(msg);
		end
	end
end
function YDBZ_create_all_npc()
	--print("²úÉú¹ÖÎï")
	for nteam=1,getn(YDBZ_map_posfiles[1]) do
		
		local radomlist = {}
		local radsum = getn(YDBZ_map_posfiles[1][nteam])
		for i=1,radsum do
			radomlist[i] = i
		end
		radomlist = YDBZ_get_randomlist(radomlist,radsum)
		for i=1,radsum do
			SetMissionV(YDBZ_NPC_TYPE[nteam][i],radomlist[i])
		end
		local file = YDBZ_map_posfiles[1][nteam][1];
		YDBZ_add_npc(file,nteam,1,1,1)

	end
	for nway = 1,getn(YDBZ_map_posfiles[2]) do
		local file = YDBZ_map_posfiles[2][nway]
		YDBZ_add_npcboss(file,nway)
	end
end
YDBZ_YuanJunPos = 		--Íæ¼ÒÕù¶áÇø´«ËÍµãºÍÖØÉúµã£¬Ëæ»ú
{
	[1]=
	{
		{1797,3514},
	},
	[2]=
	{
		{1806,3568},
	},
	[3]=
	{
		{1763,3524},
	},
}
function YDBZ_AddNpc_YuanJun(nTeam,nCurCamp)
	
	local item = YDBZ_map_npcYuanJun[1]
	local npc_count = YDBZ_get_npc_count(item);			-- NPCÊýÁ¿
	for index = 1, npc_count do
		local id		= YDBZ_get_npc_id(item, index);			-- NPCµÄID
		local level		= YDBZ_get_npc_level(item, index);	-- NPCµÈ¼¶
		local isboss	= YDBZ_get_npc_isboss(item, index);	-- ÊÇ·ñboss
		local series	= YDBZ_get_npc_series(item, index);
		local name		= YDBZ_get_npc_name(item, index);
		local tbPos		= YDBZ_YuanJunPos[nTeam][random (1, getn(YDBZ_YuanJunPos[nTeam]))]
		local px		= ( tbPos[1]+random(-3,3) ) * 32
		local py		= ( tbPos[2]+random(-3,3) ) * 32
		YDBZ_npc_proceed(item);
			
		local npc_index = AddNpcEx(
				id,			-- ID
				level,		-- µÈ¼¶
				series,		-- ÎåÐÐ
				SubWorld,	-- µØÍ¼
				px ,	-- X×ø±ê
				py ,	-- Y×ø±ê
				1,			-- ²»ÖØÉú
				name,		-- Ãû×Ö
				isboss);	-- ÊÇ·ñBOSS
		SetNpcCurCamp( npc_index, nCurCamp )
	end
end
