Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\misc\\eventsys\\type\\func.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\vng_event\\thapnienlenhbai\\mainfuc.lua")

-- Ëæ»ú½±Àø£¬Ëæ»ú»ùÊıÎª100000 ½±ÀøĞŞ¸Ä½«ÏÉ²İ¼¸ÂÊ¼Óµ½1¼¶Ğş¾§£¬»Æ½ğ¼¸ÂÊ¼Óµ½3¼¶Ğş¾§ ¸£ÔµÖ±½Ó¶ÔÓ¦Ğş¾§
map_random_awards = {
	100000,													-- Ëæ»ú»ùÊıÎª100000
	{0.005, 		{"Tinh Hång B¶o Th¹ch",		353}},					-- ĞÉºì±¦Ê¯
	{0.005, 		{"Lam Thñy Tinh", 			238}},					-- À¼Ë®¾§
	{0.005, 		{"Tö Thñy Tinh", 			239}},					-- ×ÏË®¾§
	{0.005, 		{"Lôc Thñy Tinh", 			240}},					-- ÂÌË®¾§
	{0.0005, 	{"Vâ L©m MËt TŞch", 		6, 1, 26, 1, 0, 0}},	-- ÎäÁÖÃØ¼®
	{0.0005, 	{"TÈy Tñy Kinh",			6, 1, 22, 1, 0, 0}},	-- Ï´Ëè¾­
	{0.2, 		{"Phóc Duyªn Lé (§¹i) ",	6, 1, 124, 1, 0, 0}},	-- ¸£ÔµÂ¶£¨´ó£©
	{0.19587, 		{"Phóc Duyªn Lé (Trung) ", 	6, 1, 123, 1, 0, 0}},	-- ¸£ÔµÂ¶£¨ÖĞ£©
	{0.18, 		{"Phóc Duyªn Lé (TiÓu) ",	6, 1, 122, 1, 0, 0}},	-- ¸£ÔµÂ¶£¨Ğ¡£©
	{0.15, 	{"Tiªn Th¶o Lé",			6, 1, 71, 1, 0, 0}},	-- ÏÉ²İÂ¶
	{0.1, 		{"Thiªn s¬n  B¶o Lé ",		6, 1, 72, 1, 0, 0}},	-- ÌìÉ½ÓñÂ¶
	{0.1, 		{"B¸ch Qu¶ Lé",			6, 1, 73, 1, 0, 0}},	-- °Ù¹ûÂ¶
--	{0.00, 		{"´ó°×¾ÔÍè",		6, 1, 130, 1, 0, 0}},	-- ´ó°×¾ÔÍè
	{0.05, 		{"LÖnh bµi Phong L¨ng §é",		489}},					-- ·çÁê¶ÉÁîÅÆ
	--{0.0005, 	{" §å phæ Hoµng Kim - §Şnh Quèc Thanh Sa Tr­êng Sam",	0, 159}},				-- ¶¨¹úÖ®ÇàÉ´³¤ÉÀ
--	{0.0005, 	{"§Şnh Quèc ¤ Sa Ph¸t Qu¸n",	0, 160}},				-- ¶¨¹úÖ®ÎÙÉ°·¢¹Ú
	--{0.0005,		{"§Şnh Quèc Xİch Quyªn NhuyÔn Ngoa",	0, 161}},				-- ¶¨¹úÖ®³à¾îÈíÑ¥
	--{0.0005,		{" §å phæ Hoµng Kim - §Şnh Quèc Tö §»ng Hé uyÓn",	0, 162}},				-- ¶¨¹úÖ®×ÏÌÙ»¤Íó
	--{0.0005,		{" §å phæ Hoµng Kim - §Şnh Quèc Ng©n Tµm Yªu ®¸i",	0, 163}},				-- ¶¨¹úÖ®Òø²ÏÑü´ø
	--{0.0001,	{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",0, 164}},				-- °²°îÖ®±ù¾§Ê¯ÏîÁ´
	--{0.0001,	{" §å phæ Hoµng Kim - An Bang Cóc Hoa Th¹ch ChØ hoµn",0, 165}},				-- °²°îÖ®¾Õ»¨Ê¯Ö¸»·
	--{0.0001,	{" §å phæ Hoµng Kim - An Bang §iÒn Hoµng Th¹ch Ngäc Béi",0, 166}},				-- °²°îÖ®Ìï»ÆÊ¯ÓñÅå
	--{0.0001,	{"An Bang Kª HuyÕt Th¹ch Giíi ChØ ",0, 167}},				-- °²°îÖ®¼¦ÑªÊ¯½äÖ¸
--	{0.00001, {"Méng Long Kim Ti Chİnh Hång Cµ Sa",	0, 2}},				-- ÃÎÁúÖ®½ğË¿ÕıºìôÂôÄ
	--{0.00001, {"Tø Kh«ng Gi¸ng Ma Giíi ®ao",	0, 11}},				-- ËÄ¿ÕÖ®½µÄ§½äµ¶
--	{0.00001,	{"Phôc Ma Tö Kim C«n",	0, 6}},				-- ·üÄ§Ö®×Ï½ğ¹÷
--	{0.00001,	{"KÕ NghiÖp B«n L«i Toµn Long th­¬ng",	0, 21}},				-- ¼ÌÒµÖ®±¼À××êÁúÇ¹
--	{0.00001,	{"Ngù Long L­îng Ng©n B¶o ®ao",	0, 26}},				-- ÓùÁúÖ®ÁÁÒø±¦µ¶
--	{0.00001,	{"§Şa Ph¸ch H¾c DiÖm Xung Thiªn Liªn",0, 87}},				-- µØÆÇÖ®ºÚÑæ³åÌìÁ´
--	{0.00001,	{"B¨ng Hµn §¬n ChØ Phi §ao",0, 71}},				-- ±ùº®Ö®µ¯Ö¸·Éµ¶
--	{0.00001,	{"S©m Hoang Phi Tinh §o¹t Hån",0, 81}},				-- É­»ÄÖ®·ÉĞÇ¶á»ê
	--{0.00001,	{"Thiªn Quang §Şnh T©m Ng­ng ThÇn Phï ",0, 77}},				-- Ìì¹âÖ®¶¨ĞÄÄıÉñ·û
--	{0.00001, {"Chó Ph­îc DiÖt L«i C¶nh Phï ",	0, 67}},				-- Öä¸¿Ö®ÃğÀ×¾±·û
--	{0.00001, {"Minh ¶o Tµ S¸t §éc NhËn",	0, 61}},				-- Ú¤»ÃÖ®Ğ°É²¶¾ÈĞ
--	{0.00001,	{"Tª Hoµng Phông Nghi ®ao",	0, 46}},				-- ÆÜ»ËÖ®·ïÒÇµ¶
--	{0.00001,	{"Bİch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao",	0, 51}},				-- ±Ìº£Ö®Ô§ÑìÁ¬»·µ¶
--	{0.00001,	{"V« Ma Hång Truy NhuyÔn Th¸p hµi",	0, 40}},				-- ÎŞ÷ÊÖ®ºìç»Èí¶NĞ¬
--	{0.00001,	{"V« Ma TÈy T­îng Ngäc KhÊu ",0, 39}},				-- ÎŞ÷ÊÖ®Ï´ÏóÓñ¿Û
--	{0.00001,	{"CËp Phong Tam Thanh Phï ",0, 122}},				-- ¼°·áÖ®ÈıÇå·û
--	{0.00001,	{"Vô ¶o B¾c Minh §¹o qu¸n",0, 136}},				-- Îí»ÃÖ®±±Ú¤µÀ¹Ú
--	{0.00001,	{"S­¬ng Tinh Thiªn Niªn Hµn ThiÕt",0, 126}},				-- Ëª¾§Ö®Ç§Äêº®Ìú
--	{0.00001,	{"L«i Khung Thiªn §Şa Hé phï ",	0, 132}},				-- À×ñ·Ö®ÌìµØ»¤·û
--	{0.00001,	{"Ma ThŞ s¬n  H¶i Phi Hång Lı ",	0, 115}},				-- Ä§ÊÈÖ®É½º£·ÉºèÂÄ
--	{0.00001,	{"Ma Hoµng ¸n XuÊt Hæ H¹ng Khuyªn",	0, 107}},				-- Ä§»ÍÖ®°´³ö»¢ÏîÈ¦
--	{0.00001,	{"§ång Cõu Kh¸ng Long Hé UyÓn",0, 94}},				-- Í¬³ğÖ®¿ºÁú»¤ÊÖ
--	{0.00001,	{"§Şch Kh¸i Lôc Ngäc Tr­îng",0, 96}},				-- µĞâéÖ®ÂÌÓñÕÈ
}

-- ±ÈÈüÍ¨¹Ø½±Àø£ºÎå»¨¡¢¾­Ñé¡¢ÎïÆ·
tbAward_Success = {
	[1] = {
		[1]=function(time) -- ±ÈÈüÍ¨¹Ø½±Àø¾­Ñéº¯Êı
					local min = floor(time / 60);
					if (min >= 25) then
						return 15;
					else
						return floor(172 * (1 - min / 25)) + 10;
					end
			end,
		[2]=0,
		[3]=nil
	},-- Level 1
	[2] = {
		[1]=function(time) -- ±ÈÈüÍ¨¹Ø½±Àø¾­Ñéº¯Êı
				local min = floor(time / 60);
				if (min >= 25) then
					return 30;
				else
					return floor(233 * (1 - min / 25)) + 20;
				end
			end,
		[2]=0,
		[3]=nil
	},-- Level 2
}

local tbAward_batch = 
{
	[15] = 2,
	[28] = 2,
}
local tbPro = {szName="B¶o r­¬ng v­ît ¶i",tbProp={6, 1, 2742, 1, 0, 0},}
function award_batch_extend(batch)
	
	local tbPlayerList = GetMatchPlayerList()
	
	for i=1,getn(tbPlayerList) do
		local nPlayerIndex = tbPlayerList[i]
		
		--¼Ó°ï»á¹±Ï×¶È
		--CallPlayerFunction(nPlayerIndex, award_batch_contribution, batch)
		-- Ô½ÄÏÉúÈÕ»î¶¯Ê±¼äÌôÕ½ÈüµÄ¹ı¹ØÊı
		--CallPlayerFunction(nPlayerIndex, SetTask, tbBirthday0905.tbTask.tsk_toll_cg_passcount, batch)
		-- ´³¹Øµ÷Õû by wangjingjun 2011.03.01
			--if %tbAward_batch[batch] and GetMissionV(VARV_BATCH_MODEL) == 1 then
				--%tbPro.nCount = %tbAward_batch[batch]
				--CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbPro, "chuangguan award", 1)
			--end
			-- Ğ¡Äôß±³¾½±Àø
		if GetMissionV(VARV_BATCH_MODEL) == 1 and batch == GetMissionV(VARV_XIAONIESHICHEN_BATCH) then
			--%tbPro.nCount = 1
			--CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbPro, "xiaonieshichen awrad", 1)
			
			--local nExpCount = 10000000
			local nExpCount = 20000

			--nExpCount = Chuangguan_checkdoubleexp(nExpCount)
			CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, {nExp_tl=1,nCount = nExpCount,}, "xiaonieshichen awrad", 1)
		end
	end
	
end

-- Òş²ØÈÎÎñ½±Àø
function award_hidden_mission()
	local tbPlayerList = GetMatchPlayerList()
	for i=1,getn(tbPlayerList) do
		local nPlayerIndex = tbPlayerList[i]
		CallPlayerFunction(nPlayerIndex, award_random_object, map_random_awards);
		-- Ô½ÄÏÉúÈÕ»î¶¯Ê±¼äÌôÕ½ÈüµÄ¹ı¹ØÊı
		CallPlayerFunction(nPlayerIndex, SetTask, tbBirthday0905.tbTask.tsk_toll_cg_passcount, 29);
	end
	local n_level = GetMatchLevel();
	EventSys:GetType("ChuanGuan"):OnEvent("OnPass", 29, tbPlayerList, n_level)
end

-- ½±ÀøÎïÆ·
function award_item(item)

	local name = item[1];
	if (getn(item) == 2) then
		AddEventItem(item[2]);
	elseif (getn(item) == 3) then
		AddGoldItem(item[2], item[3]);
	elseif (getn(item) == 7) then
		AddItem(item[2], item[3], item[4], item[5], item[6], item[7]);
	end
	Msg2Player("<#> B¹n nhËn ®­îc " .. name .. "!");
	
end

-- ½±ÀøËæ»úÎïÆ·
function award_random_object(objects)
	local base = objects[1];		-- Ëæ»ú»ùÊıÔÚµÚÒ»¸öÎ»ÖÃ
	local sum = 0;
	local num = random(1, base);
	for i = 2, getn(objects) do		-- Ëæ»úÎïÆ·´ÓµÚ¶ş¸öÎ»ÖÃ¿ªÊ¼
		local odds = objects[i][1];
		local item = objects[i][2];
		sum = sum + odds * base;
		if (num <= sum) then
			award_item(item)
			break;
		end
	end
end

function award_to_player_success()
	tbAwardTemplet:GiveAwardByList(tbExtItem, "finish challengeoftime")
	tbTimerLog:weiMing(tbExtItem[1].nPrestige)
end

-- ½±ÀøÍæ¼Ò
function award_player(exp, objects, time)
	
	--Storm Ôö¼Ó»ı·Ö
	if(GetMissionV(VARV_MISSION_RESULT) == 1) then	--×îÖÕ½±Àø
		storm_addpoint(2, LIMIT_FINISH - time)
	end

	-- ½±Àø¾­Ñé
	local experience = exp;
	if (type(exp) == "function") then
		experience = exp(time);
	end	
	if (experience ~= 0) then
		local point = experience * 1000;
		--¸øÓë120¼¼ÄÜÊìÁ·¶È
		AddExp_Skill_Extend(point);
--		if(greatnight_huang_event(3) == 1) then
--		elseif(greatnight_huang_event(3) == 2) then
--			point = point * 2;
--		elseif(greatnight_huang_event(3) == 3) then
--			point = point * 3;
--		else
--		end;
		-- ÊÇ·ñ¶Ó³¤
		local name = GetMissionS(VARS_TEAM_NAME);
		if (GetName() == name) then
			point = point * (1 + 0.2);	--½±Àø¸ü¶à
		end;
		if (GetMatchLevel() == 2) then
			point = point * 2;
		end
		
		point = BigBoss:AddChuangGuanPoint(point);
		--point = Chuangguan_checkdoubleexp(point)
		AddOwnExp(point);
		Msg2Player("<#> B¹n nhËn ®­îc " .. point .. "®iÓm kinh nghiÖm.");
	end
	
	-- ½±ÀøËæ»úÎïÆ·
	if (objects ~= nil) then
		award_random_object(objects);
	end

end

-- µôÂäÎïÆ·
function drop_item(index, count)
	local x, y, world = GetNpcPos(index);
	if (count ~= 0) then
		for i = 1, count do
			-- µôÂäÎå»¨
			DropItem(world, x, y, -1, 1, 2, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0);
		end
	end
	-- µôÂäÀñÆ·ºĞ
	--if ( random(1,100) <= 5 ) then
	--	DropItem(world, x, y, -1, 6, 1, 1392, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	--end
end

-- ½±Àø
function award_batch_item(item, npc_index, time)
	-- ¸øÃ¿¸ö¶ÓÔ±¾­ÑéºÍ½±Àø
	local tbPlayerList = GetMatchPlayerList()
	for i=1, getn(tbPlayerList) do
			CallPlayerFunction(tbPlayerList[i], award_player, item[1], item[3], time)
	end
	
	-- µôÂäÎïÆ·
	drop_item(npc_index, item[2]);
end

-- Åú´Î½±Àø
--´¥·¢Ìõ¼ş£ºµ±±¾¹ØËùÓĞNPCËÀÍöºó£¬²¢¸øÓÚËùÓĞÍæ¼Ò»ù±¾½±Àøºó£¬½«±»µ÷ÓÃ¡£
--´ËÊ±µÄPlayerIndexÊÇ´òËÀ×îºóÒ»Ö»±¾¹Ø¹ÖµÄÈË 
--Èç¹ûĞèÒª¶ÔËùÒÔÍæ¼Ò½±ÀøÊ±£¬±ØĞëÊ¹ÓÃGetNextPlayerµÄ·½Ê½£¬Ò»Ò»»ñµÃ¡£
function award_batch(batch, npc_index)
	local tbNpcList = GetNpcList();
	award_batch_item(tbNpcList[batch][2], npc_index, 0);

	local tbAllPlayer = GetMatchPlayerList()
	local n_level = GetMatchLevel();
	local nTime = GetMissionV(VARV_BOARD_TIMER)
	
	G_ACTIVITY:OnMessage("Chuanguan", batch, tbAllPlayer, n_level);
	EventSys:GetType("ChuanGuan"):OnEvent("OnPass", batch, tbAllPlayer, n_level, nTime)
	--ThËp Niªn LÖnh Bµi hç trî t©n thñ - NgaVN
--	tbThapnienLenhbai:ChuanguanAward(nBatch, tbAllPlayer)
	--§ãng Phong V©n LÖnh Bµi tæ ®éi hæ trî t©n thñ - Modified By NgaVN - 20140615
	--tbPVLB_PtSpprt:COTAward(batch, tbAllPlayer)
	
	-- LLG_ALLINONE_TODO_20070802
	award_batch_extend(batch)
end

--¼Ó°ï»á¹±Ï×¶È
function award_batch_contribution(batch)
	tongaward_challengeoutoftime(batch)
end


function GetMissionCompleteAward()
	local nLevel = GetMatchLevel()
	if not nLevel then
		return nil
	end
	return tbAward_Success[nLevel]
end

-- Í¨¹Ø½±Àø
function award_success(npc_index, time)
	local item = GetMissionCompleteAward()
	award_batch_item(item, npc_index, time)
end
