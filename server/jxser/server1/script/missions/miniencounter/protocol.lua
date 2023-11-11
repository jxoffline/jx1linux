-- Include Files
Include("\\script\\lib\\objbuffer_head.lua");
Include("\\script\\missions\\basemission\\dungeon.lua");
Include("\\script\\missions\\miniencounter\\player.lua");
Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");

IncludeLib("SETTING");

tbPlayerQueue = {} --Íæ¼Ò±¨ÃûÁÐ¶Ó£¬

-- Function	: apply_signup
-- Description : player signs up from officer 
function apply_signup()
	if DungeonGlobalData:CheckActivityTime() ~= 1 then
		Talk(1, "", "Mçi ngµy tõ 9 giê ®Õn 23 giê Phï Li Xung §ét ChiÕn míi më, ng­¬i ®îi thªm ®i.");
		return nil;
	end

	-- Check Current Player State
	if ST_GetOffliveState() == 1 then						   -- ÀëÏßÍÐ¹Ü
		Talk(1, "", "ñy th¸c rêi m¹ng kh«ng thÓ tiÕn hµnh b¸o danh.");
		return nil;
	end

	if GetOnlineCommissionStatus() == 1 then					-- ÔÚÏßÍÐ¹Ü
		Talk(1, "", "ñy th¸c trªn m¹ng kh«ng thÓ tiÕn hµnh b¸o danh.");
		return nil;
	end

	if GetStallState() == 1 then								-- °ÚÌ¯×´Ì¬
		Talk(1, "", "B¸n hµng kh«ng thÓ tiÕn hµnh b¸o danh.");
		return nil;
	end

	local nCurMapID = GetWorldPos();
	if DungeonGlobalData:CheckLegalPrepareMap(nCurMapID) ~= 1 then
		Talk(1, "", "ChØ cã thÓ ë thµnh chÝnh vµ T©n Thñ th«n tiÕn hµnh b¸o danh.");
		return nil;
	end

	if ST_IsTransLife() ~= 1 and GetLevel() < DungeonGlobalData.PLAYER_LEVEL_LIMIT then
		Talk(1, "", format("CÊp %d trë lªn hoÆc ng­êi ch¬i trïng sinh míi cã thÓ tiÕn hµnh b¸o danh.", DungeonGlobalData.PLAYER_LEVEL_LIMIT));
		return nil;
	end

	if (-1 == GetLastFactionNumber()) then
		Talk(1, "", "ChiÕn sÜ phe nµo gia nhËp s­ m«n häc vâ nghÖ míi ®­îc b¸o danh, chiÕn tr­êng khèc liÖt kh«ng thÓ ®ïa ®­îc!");
		return nil;
	end
	
	-- Notify Relay
	local szRoleName = GetName();							   -- ½ÇÉ«Ãû

	local hObject = OB_Create();								-- ´´½¨Ò»¸ö¶ÔÏó
	ObjBuffer:PushObject(hObject, szRoleName);
	ObjBuffer:PushObject(hObject, nCurMapID)
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "apply_signup", hObject, "apply_signup_callback");
	OB_Release(hObject);
end

function apply_signup_callback(nParam, ParamHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);		-- ½ÇÉ«Ãû
	local nSignupResult = ObjBuffer:PopObject(ParamHandle);	 -- RelayÉÏ±¨Ãû´¦Àí½á¹û£º1 - ±¨Ãû³É¹¦, 2 - ÒÑ±¨Ãû, 3 - ÔÚºÚÃûµ¥, ÆäËûÖµÎªÊ§°Ü
	
	local nPlayerIndex =  SearchPlayer(szRoleName)
	if (not nPlayerIndex) or (nPlayerIndex <= 0) then
		return
	end 
	
	local szMag

	if nSignupResult == 1 then
		szMsg = "B¸o danh thµnh c«ng! H·y kiªn nhÉn ®îi ë thµnh chÝnh vµ T©n Thñ th«n ®Ó b¾t ®Çu, ®õng ®i ®Õn b¶n ®å phi ph¸p, bµy hµng, ñy th¸c hoÆc ®¨ng xuÊt nÕu kh«ng ng­¬i cã thÓ bÞ cÊm ®Êu 10 phót. NÕu nh­ ng­¬i vÉn cßn chuyÖn kh¸c cÇn lµm th× hñy b¸o danh ®i."
	elseif nSignupResult == 2 then
		szMsg = "Ng­¬i ®· trong danh s¸ch xÕp hµnh råi, kh«ng cÇn b¸o danh l¹i."
	elseif nSignupResult == 3 then
		szMsg = format(
			"Nam tö H¸n ®¹i tr­îng phu nhÊt ng«n cöu ®Ønh. §· muèn ra chiÕn tr­êng tham chiÕn t¹i sao l¹i cßn do dù sî sÖt? %d phót sau ng­¬i quay l¹i ®i.", 
			DungeonGlobalData.BLACK_LIST_TIME
		)
	elseif nSignupResult == 4 then
		szMsg = "TrËn chiÕn tr­íc vÉn ch­a kÕt thóc, mau chãng quay l¹i tiÒn tuyÕn giÕt ®Þch ®i."
	else
		szMsg = "B¸o danh thÊt b¹i, xin thö l¹i!"
	end
	
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", szMsg)
end

function return_map()
	local szRoleName = GetName();

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "return_map", hObject);
	OB_Release(hObject);
end

function cancel_signup()
	local szRoleName = GetName();
	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "cancel_signup", hObject);
	OB_Release(hObject);
end

function allocate_map_dynamically(ParamHandle)
	local szRoleName   = ObjBuffer:PopObject(ParamHandle);

	-- TODO : ¿ªÆôµØÍ¼·Åµ½ÈËÊý½ÏÉÙµÄGSÉÏÃæ
	local nGs = mod(EncounterMapManager.nCurrentGs, 8) + 1;
	local nChooseMapId = DungeonGlobalData.tbGameServerInfo[nGs];

	EncounterMapManager.nCurrentGs = EncounterMapManager.nCurrentGs + 1;
	EncounterMapManager.nCurrentGs = mod(EncounterMapManager.nCurrentGs, 8);

	local nChooseMapIdx = SubWorldID2Idx(nChooseMapId);
	if nChooseMapIdx == nil or nChooseMapIdx < 0 then
		print(">> Debug : not this server.");
		return nil;
	end

	-- create a miniencounter dungeon instance
	local tbDungeonType = DungeonType["miniencounter"];
	if tbDungeonType == nil then
		print(">> Error : tbDungeonType is nil, get miniencounter dungeon failed.");
		return nil;
	end

	local tbDungeon = tbDungeonType:new_dungeon(tbDungeonType.nTemplateMapID);		  -- Create a dungeon instance
	if tbDungeon == nil then
		print(">> Error : tbDungeon is nil, tbDungeonType:new_dungeon() failed.");
		return nil;
	end

	local nMapID  = tbDungeon.nMapId;

	-- [¼ÓÈë±¾Ì¨GSµÄtbMapList] --
	tbDungeon.nGameState = 1;
	EncounterMapManager:AddMap(tbDungeon);

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, nMapID);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "allocate_map_dynamically", hObject);
	OB_Release(hObject);

end

function enter_map(ParamHandle)	
	local tbPlayerList = ObjBuffer:PopObject(ParamHandle);
	local nMapID	   = ObjBuffer:PopObject(ParamHandle);
	local nReason	  = ObjBuffer:PopObject(ParamHandle);
	local nGameStartTime = ObjBuffer:PopObject(ParamHandle);
	
	if type(tbPlayerList) ~= "table" then
		return
	end
	
	local tbMap = EncounterMapManager:FindInMapList(nMapID);
	if tbMap then
		tbMap.nGameStartTime = nGameStartTime
		if nReason == 0 then
			tbMap:StartWait()
		end
	end

	for i = 1, getn(tbPlayerList) do
		local szRoleName = tbPlayerList[i][1]
		local nCamp = tbPlayerList[i][2]
		tbPlayerQueue[szRoleName] = nil
		
		local nPlayerIndex = SearchPlayer(szRoleName);
		if nPlayerIndex and nPlayerIndex > 0 then
		
			if CallPlayerFunction(nPlayerIndex, DungeonGlobalData.CheckPlayerState, DungeonGlobalData) then
				local nPosX, nPosY = EncounterMap:GetNewWorldPos(nCamp);
				CallPlayerFunction(nPlayerIndex, SetTask, DungeonGlobalData.TASK_BATTLE_PLAYER_CAMP, nCamp);
				CallPlayerFunction(nPlayerIndex, NewWorld, nMapID, nPosX, nPosY);
			else
				CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Tr¹ng th¸i cña ng­¬i phi ph¸p kh«ng thÓ vµo b¶n ®å chiÕn tr­êng.")
			end
		end
	end
end

function unforbid_msg(ParamHandle, ResultHandle)
	local szRoleName   = ObjBuffer:PopObject(ParamHandle)
	
	local nPlayerIndex = SearchPlayer(szRoleName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ng­¬i ®· ®­îc më khãa, cã thÓ b¸o danh Phï Li Xung §ét ChiÕn.")
end

function return_map_msg(ParamHandle)
	local szRoleName   = ObjBuffer:PopObject(ParamHandle);

	local nPlayerIndex = SearchPlayer(szRoleName);
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return nil;
	end
	
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ng­¬i kh«ng cã tham gia Phï Li Xung §ét ChiÕn hoÆc trËn ®Êu ®· kÕt thóc, mêi b¸o danh l¹i.")
end

function cancel_signup_msg(ParamHandle, ResultHandle)
	local szRoleName   = ObjBuffer:PopObject(ParamHandle);
	local nCancelResult = ObjBuffer:PopObject(ParamHandle);	   -- È¡Ïû½á¹û£º1 - È¡Ïû³É¹¦£¬-1 - È¡ÏûÊ§°Ü£¬0 - Î´±¨Ãû

	if nCancelResult == nil then
		return nil;
	end
	
	if nCancelResult == 1 then
		tbPlayerQueue[szRoleName] = nil
	end

	local nPlayerIndex = SearchPlayer(szRoleName);
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		print(">> Error : nPlayerIndex is invalid.");
		return nil;
	end

		local szMsg
	if nCancelResult == 1 then
		szMsg = "Hñy b¸o danh thµnh c«ng."
	elseif nCancelResult == -1 then
		szMsg = "Hñy b¸o danh thÊt b¹i, xin lµm l¹i."
	elseif nCancelResult == 0 then
		szMsg = "HiÖn t¹i ng­¬i kh«ng cã b¸o danh kh«ng cÇn hñy b¸o danh."
	elseif nCancelResult == 2 then
		szMsg = "TrËn chiÕn mµ ng­¬i tham gia b¸o danh ®· vang lªn, b©y giê b¾t ®Çu hèi hËn ®· muén. Mau chãng ®Õn tiÒn tuyÕn giÕt ®Þch th«i"
	end
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", szMsg)
end

-- º¯Êý£ºsend_forbid_msg2player
-- ËµÃ÷£ºrelay·¢Æð·¢ËÍÀ­ºÚÐÅÏ¢¸øÍæ¼Ò
-- ·µ»ØÖµ£ºÎÞ¡£
function send_forbid_msg2player(ParamHandle, ResultHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);
	if szRoleName == nil then
		return nil;
	end
	
	tbPlayerQueue[szRoleName] = nil

	local nPlayerIndex = SearchPlayer(szRoleName);
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return nil;
	end
	
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ng­¬i kh«ng ë trong b¶n ®å hîp ph¸p, ®· hñy b¸o danh vµ bÞ hÖ thèng cho vµo danh s¸ch ®en.")
end

-- º¯Êý£ºsend_prepare_fight_msg2player
-- ËµÃ÷£ºrelay·¢Æð·¢ËÍ×¼±¸ÐÅÏ¢¸øÍæ¼Ò
-- ·µ»ØÖµ£ºÎÞ¡£
function send_prepare_fight_msg2player(ParamHandle, ResultHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);
	if szRoleName == nil then
		print(">> Error : szRoleName is invalid.");
		return nil;
	end

	local nPlayerIndex = SearchPlayer(szRoleName);
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	
	CallPlayerFunction(nPlayerIndex, Msg2Player, "Phï Li Xung §ét ChiÕn s¾p b¾t ®Çu, mäi ng­êi h·y mau chuÈn bÞ!")
end

-- º¯Êý£ºgame_finish
-- ËµÃ÷£ºrelayÉ¾³ýµØÍ¼ÊÍ·Å×ÊÔ´ºó»Øµ÷µ½gs×ö×ÊÔ´ÊÍ·Å²Ù×÷
-- ·µ»ØÖµ£ºÎÞ¡£
function game_finish(ParamHandle, ResultHandle)
	local nMapID = ObjBuffer:PopObject(ParamHandle);
	if nMapID == nil or nMapID <= 0 then
		print(">> Error : nMapID is invalid.");
		return nil;
	end

	EncounterMapManager:DelMap(nMapID)
end

-- º¯Êý£ºprepare_query
-- ËµÃ÷£ºµ½relay²éÑ¯×¼±¸¶ÓÁÐÈËÊý
-- ·µ»ØÖµ£ºÎÞ¡£
function prepare_query()
	local hObject = OB_Create();								-- ´´½¨Ò»¸ö¶ÔÏó

	RemoteExecute(
		"\\script\\missions\\miniencounter\\protocol.lua",
		"get_prepare_list_num",
		hObject,
		"prepare_qurey_callback"
	);

	OB_Release(hObject);
end

-- º¯Êý£ºprepare_qurey_callback
-- ËµÃ÷£ºµ½relay²éÑ¯×¼±¸¶ÓÁÐÈËÊý»Øµ÷º¯Êý
-- ·µ»ØÖµ£ºÎÞ¡£
function prepare_qurey_callback(nParam, ParamHandle)
	local nPrepareNum = ObjBuffer:PopObject(ParamHandle);
	if nPrepareNum == nil or nPrepareNum < 0 then
		Talk(1, "", "KiÓm tra sè liÖu bÊt th­êng, xin kiÓm tra l¹i!");
		return nil;
	end
	
	local strMsg = format("HiÖn t¹i sè ng­êi trong danh s¸ch xÕp hµng lµ: %d ng­êi.", nPrepareNum);
	Talk(1, "", strMsg);
end

-- º¯Êý£ºnotify_relay_game_finish
-- ËµÃ÷£ºÍ¨Öªrelay±ÈÈü½áÊø£¬É¾³ýµØÍ¼
-- ·µ»ØÖµ£ºÎÞ¡£
function notify_relay_game_finish(nMapId)
	if nMapId == nil then
		print(">> Error : nMapId is invalid");
		return nil;
	end
	
	-- Í¨Öªrelay±ÈÈü½áÊø£¬É¾³ýµØÍ¼
	local hObject = OB_Create();							-- ´´½¨Ò»¸ö¶ÔÏó
	ObjBuffer:PushObject(hObject, nMapId);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "game_finish", hObject);
	OB_Release(hObject);
end

function AddPlayerToQueue(ParamHandle)
	local szPlayer = ObjBuffer:PopObject(ParamHandle)
	tbPlayerQueue[szPlayer] = 1
end

function DelPlayerFromQueue(ParamHandle)
	local szPlayer = ObjBuffer:PopObject(ParamHandle)
	tbPlayerQueue[szPlayer] = nil
end
