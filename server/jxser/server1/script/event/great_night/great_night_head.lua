--»Æ½ğÖ®¹û»î¶¯Í·ÎÄ¼ş£¬ËùÓĞµÄÈë¿Úº¯Êı¶¼ÔÚÕâÀïÁË

Include("\\script\\missions\\basemission\\lib.lua")

Include("\\script\\misc\\eventsys\\type\\map.lua")

--Include("\\script\\lib\\gb_taskfuncs.lua");	 				-- By ÁÎÖ¾É½»Ô»ÍÖ®ÖÖ;
--Include("\\script\\lib\\gb_modulefuncs.lua"); 				-- By ÁÎÖ¾É½»Ô»ÍÖ®ÖÖ;

--ËùÓĞÊı¾İ·Åµ½Õâ¸ö±íÀï
tbFruitData = {
	N_FRUIT_START_DATE = 2011042800,--»î¶¯¿ªÊ¼ÈÕÆÚ
    N_FRUIT_END_DATE = 2011052900,--»î¶¯½áÊøÈÕÆÚ(º¬)
    SZ_FRUIT_MAP_NAME = "ChiÕn Long §éng",
    N_FRUIT_MAP_ID = 959,
    --Éú³¤»Æ½ğÖ®¹ûµÄÎ»ÖÃ
    TB_FRUIT_POS = 
    {
--    	{959,1437,3057},
--    	{959,1477,3084},
--    	{959,1458,3066},
    },
    --Éú³¤»Æ½ğÖ®¹ûµÄÊ±¼ä
    TB_FRUIT_TIME = {1315, 1335, 1050, 1100, 1900, 1920},
    --server startµÄÊ±ºò£¬¸ù¾İTB_FRUIT_TIMEÉú³É
    TB_FRUIT_TIME_MAP = {},--{[1315]=1, [1335]=1, [1900]=1, [1920]=1}
    
    gnSeedTimerId = 0,--Éú³É»Æ½ğÖ®ºËµÄTimerId
    gnFruitTimerId = 0,--»Æ½ğÖ®ºË±ä»Æ½ğÖ®¹ûµÄTimerId
    
    TB_ENTER_POS = 
    {
    	{959,1690,3154},
    	{959,1427,2995},
    	{959,1552,2988},
    },
    
    --±¾ÎÄ¼şµØÖ·
    SZ_THIS_FILE = "\\script\\event\\great_night\\great_night_head.lua",
    
    SZ_PLAYER_SCRIPT = "\\script\\event\\great_night\\player_map_script.lua",
    
    --¼ÇÂ¼½ñÌìµÄÈÕÆÚ,Èç¹ûÈÕÆÚ²»µÈ£¬ÖØĞÂÉú³ÉÈÎÎñÊ±¼ä±í
    nTodayDate = 0
    
    --ÒıÓÃplayer_map_script.luaÍæ¼Ò±í
    --pPlayer=nil,
}

t = tbFruitData--¸øÊı¾İ±íÈ¡¸öºÃÓÃµÄ±ğÃû

--»Æ½ğÖ®¹û·şÎñÆ÷Æô¶¯µÄ»Øµ÷
function OnGreatNightServerStart()

	--Éú³ÉÈÎÎñÊ±¼ä±í
	_GenFrutTimeMap();

	local worldidx = SubWorldID2Idx(t.N_FRUIT_MAP_ID)
	if (worldidx < 0) then	--Èç¹ûµØÍ¼²»ÔÚ¸Ã×é·şÎñÆ÷ÉÏ£¬²»ÓÃ¹ÜÁË
		return
	end;
	
	--É¾³ıĞÂÔöµÄÁ½Ë®¶´µØÍ¼ÖĞµÄNPCºÍTrap
	ClearMapNpc(t.N_FRUIT_MAP_ID)
	ClearMapTrap(t.N_FRUIT_MAP_ID)
	
	_AddOutNpc()--¼ÓÔØ³ö¿ÚNPC
	
	_RegPlayerMapScript()--×¢²áË«Áú¶´µØÍ¼Íæ¼Ò½Å±¾
	
	--Æô¶¯¶¨Ê±Æ÷
--	if t.gnSeedTimerId and t.gnSeedTimerId ~= 0 then
--		DelTimer(t.gnSeedTimerId)
--	end
--	t.gnSeedTimerId = DynamicExecute(t.SZ_THIS_FILE, "AddTimer", 18, "OnTimer", 0)
end

--¶¨Ê±»Øµ÷
function OnTimer()
	return 0--»Æ½ğÖ®ÖÖÓÉGC¿ØÖÆ²úÉú
--	local nCurDateTime = tonumber(GetLocalDate("%m%d%H%M%S"))
--	--print(format("OnTimer(%d)", nCurDateTime))
--	local nCurTime = mod(nCurDateTime, 100^3)-- tonumber(GetLocalDate("%H%M%S"))
--	if CheckFruitDate() == 1 then
--		local nDate = floor(nCurTime / 100^3)--tonumber(GetLocalDate("%Y%m%d"))
--    	if nDate ~= t.nTodayDate then
--    		t.nTodayDate = nDate
--    		_GenFrutTimeMap()--µ½µÚ¶şÌìÁË ÖØĞÂÉú³ÉÊ±¼ä±í
--    	end
--    	local nCurHM = floor(nCurTime / 100)
--    	if t.TB_FRUIT_TIME_MAP[nCurHM] and t.TB_FRUIT_TIME_MAP[nCurHM] > 0 then
--    		t.TB_FRUIT_TIME_MAP[nCurHM] = 0
--    		_GenFruit(1)--²úÉú»Æ½ğÖ®ºË
--    	end
--	end
--	return _GetNextTimerTime(nCurTime)
end

--Éú³ÉÈÎÎñÊ±¼ä±í
function _GenFrutTimeMap()
	t.TB_FRUIT_TIME_MAP = {}
	for i=1,getn(t.TB_FRUIT_TIME) do
		t.TB_FRUIT_TIME_MAP[t.TB_FRUIT_TIME[i]] = 1
	end
end

--¸ù¾İµ±Ç°Ê±¼äÈ·¶¨ÏÂÒ»´Î¶¨Ê±Æ÷µÄ³¤¶È
function _GetNextTimerTime(nCurTime)
	local nCurHM = floor(nCurTime/100)
	local nCurSec = mod(nCurTime, 100)
	local nNextHM = nCurHM + 1
	if mod(nNextHM, 100) >= 60 then
		nNextHM = (floor(nCurHM/100) + 1) * 100
	end
	local nRet = 0
	local nDateFlag = CheckFruitDate()
	if nDateFlag ~= 1 then
    	if nDateFlag == 0 then
    		--²»ÔÚÓĞĞ§ÆÚ¾Í²»ÓÃ¼ì²éµÄÄÇÃ´Æµ·±ÁË£¬µ½ÏÂÒ»¸öÕûµãÔÙ¼ì²éÒ»´Î
    		local nCurMin = mod(nCurHM, 100)
    		nRet = 60 * 60 - (nCurMin * 60 + nCurSec)
    	else
    		nRet = 0--ÓĞĞ§ÆÚÒÑ¾­¹ıÁË£¬É¾³ı¶¨Ê±Æ÷£¬²»ÓÃÔÙ¼ÆÊ±ÁË
    	end
	elseif t.TB_FRUIT_TIME_MAP[nNextHM] then--ÏÂÒ»·ÖÖÓÓĞÈÎÎñ¼ì²éÆµ·±Ò»µã
		local nFastSec = 55
		if nCurSec < nFastSec then
			nRet = (nFastSec - nCurSec)
		else
			nRet = 1
		end
	else
		nRet = (60 - nCurSec)--µ½ÏÂÒ»·ÖÖÓ¿ªÊ¼µÄÊ±ºò
	end
	return nRet*18--½«Ãë×ª»»³ÉÖ¡
end

--²úÉúÒ»×é»Æ½ğÖ®ºË
function _GenFruit(nStep)
	_ShowSeed(t.N_FRUIT_MAP_ID,t.N_FRUIT_MAP_ID, 4, 3, t.TB_FRUIT_POS, t.SZ_FRUIT_MAP_NAME, nStep)
	
	if 1== nStep then
		--5·ÖÖÓÖ®ºó±ä»Æ½ğÖ®¹û
		t.gnFruitTimerId = DynamicExecute(t.SZ_THIS_FILE, "AddTimer", 5*60*18, "_GenFruit", nStep+1)
	else
		t.gnFruitTimerId = 0
	end
	return 0--Èç¹ûÍ¨¹ı¶¨Ê±Æ÷µ÷ÓÃ£¬Í¨Öª¶¨Ê±Æ÷É¾³ı
end

function _ShowSeed(worldidx, mapid, seedlevel, count, tbPos ,szMapName, nBatch)
	--
	local nCurDate = tonumber(GetLocalDate("%m%d"))
	--ÖÖ×Ó¶Ô°×
	local szScriptFile = "\\script\\activitysys\\config\\31\\npc_great_seed.lua"
	--ÆÕÍ¨¹ûÊµ¶Ô°×
	local szGrowScriptFile = "\\script\\activitysys\\config\\31\\npc_great_fruit.lua"
	--»Æ½ğÖÖ×Ó¶Ô°×
	local szGoldFruitScriptFile = "\\script\\activitysys\\config\\31\\golden_fruit.lua";
	
	local szGoldSeedName = "H¹t Hoµng Kim"
	local szGrowSeedName = "h¹t Huy Hoµng"
	local szGoldFruitName = "Qu¶ Hoµng Kim"
	local szGrowFruitName = "Qu¶ Huy Hoµng"
	
	--local nBeginNumber = gb_GetTask("»Ô»ÍÖ®ÖÖ",12)
	local nNpcTmpl = 1110
	local szNpcScriptFile = szScriptFile
	local szNpcName = "h¹t Huy Hoµng"
	if mod(nBatch	,2 ) == 0 then
		--Èç¹ûÎª¹ûÊµÅú´Î£¬ÔòÇå³ıÖÖ×ÓNPC
		ClearMapNpcWithName(mapid, "h¹t Huy Hoµng")
		ClearMapNpcWithName(mapid, szGoldSeedName);
		if seedlevel == 4  then
			nNpcTmpl = 1118
			szNpcScriptFile = szGoldFruitScriptFile
			szNpcName = szGoldFruitName
		else
			nNpcTmpl = 1111
			szNpcScriptFile = szGrowScriptFile
			szNpcName = "Qu¶ Huy Hoµng"
		end
	elseif seedlevel ==  4 then
			nNpcTmpl = 1117
			szNpcName = szGoldSeedName
	end
	--
	local nLineCount = getn(tbPos);
	--Èç¹û·¢·ÅÊıÁ¿´óÓÚ×ø±êÊıÁ¿Ôò¿³È¥¶àÓàµÄ²¿·Ö
	count = (nLineCount < count ) and nLineCount or  count 
	for i = 1, count do
			local nMap = tbPos[i][1]
			local nPosX = tbPos[i][2]
			local nPosY = tbPos[i][3]
			if (nil ~= nPosX and nil ~= nPosY) then
				local tbNpc = {
            		szName = szNpcName, 
            		szTitle = nil,
            		nLevel = 95,
            		nNpcId = nNpcTmpl,
            		nIsboss = 0,
            		szScriptPath = szNpcScriptFile,
            	}

            	local nNpcIndex = %basemission_CallNpc(tbNpc, nMap, nPosX*32, nPosY*32)
            	if nNpcIndex and nNpcIndex > 0 then
            		--nBeginNumber = nBeginNumber + 1
					--gb_SetTask("»Ô»ÍÖ®ÖÖ",12,nBeginNumber)
					SetNpcParam(nNpcIndex, 1, seedlevel);
					--SetNpcParam(nNpcIndex, 2, nBeginNumber*10000 +  nCurDate ); --  nCurDate --¼ÓÉÏµ±Ç°ÈÕÆÚ
					if szNpcName == szGoldFruitName or szNpcName == szGoldSeedName then
						Msg2SubWorld("<color=yellow>"..szNpcName.."<color>".." xuÊt hiÖn t¹i "..szMapName.."("..floor(nPosX / 8)..","..floor(nPosY / 16)..").")
					end
            	end
			end;
	end;
end;

function CheckFruitDate()
	return 1--ÎŞÊ±¼äÏŞÖÆ
--	local nDate = tonumber(GetLocalDate("%Y%m%d%H"))
--	if nDate < t.N_FRUIT_START_DATE then--×¢ÒâÕâÀïÃ»ÓĞ=
--		return 0
--	elseif nDate >= t.N_FRUIT_END_DATE then--×¢ÒâÕâÀïÓĞ=
--		return 2
--	else
--		return 1
--	end
--	if (nDate >= t.N_FRUIT_START_DATE and nDate <= t.N_FRUIT_END_DATE) then
--		return 1
--	end
end

--´«ËÍµ½ĞÂÁ½Ë®¶´µØÍ¼£¨²É¼¯»Æ½ğÖ®¹û£©
function OnGoToNewLiangShuiDong()
	if CheckFruitDate() == 1 then
		local nCount = getn(t.TB_ENTER_POS)
		local nRand = random(1,nCount)
		if nRand >= 1 and nRand <= nCount then
			NewWorld(unpack(t.TB_ENTER_POS[nRand]))
		end
	else
		Talk(1, "", "Xin l­îng thø, hiÖn t¹i kh«ng ph¶I thêi gian ho¹t ®éng, thø lçi cho ta kh«ng thÓ ®­a ng­¬I ®I ®­îc")
	end
end

--NPC»á»°Ñ¡Ïî
function OnNpcTalk()
	local szMapName = t.SZ_FRUIT_MAP_NAME
	local szDesc = format("<color=yellow>%s<color>HiÖn t¹i trong vâ l©m m­a hßa giã thuËn. ®Ó tá lßng c¶m t¹ ®èi víi c¸c vŞ giang hå ®¹i hiÖp, Vâ L©m Minh Chñ §éc C« KiÕm ®¾c ı vµo<color=yellow>00:00-28-04-2011~00:00-29-05-2011<color>më ra mét ho¹t ®éng<color=yellow> “H¹t Hoµng Kim”<color>víi quy m« lín.<enter>", "Vâ L©m Minh Chñ TruyÒn Nh©n")
	szDesc = format("%strong thêi gian ho¹t ®éng mçi ngµy <color=yellow>13:15, 13:35, 19:00, 19:20<color>t¹i<color=yellow>%s<color>b¶n ®å sÏ xuÊt hiÖn 3 H¹t Hoµng Kim , mét thêi gian sau ®ã c¸c vŞ ®¹i hiÖp cã thÓ thu thËp ®­îc Qu¶ cña nã, khi sö dông sÏ lµm t¨ng c«ng lùc cña Qu¶ Hoµng Kim.<enter>", szDesc, szMapName)
	szDesc = format("%s chØ cã thÓ th«ng qua ta ®©y míi cã thÓ ®­a ng­¬i ®Õn<color=yellow>%s<color>", szDesc, szMapName)
	Describe(szDesc, 2,
		"Xin h·y ®­a ta ®Õn ChiÕn Long §éng/OnGoToNewLiangShuiDong",
		"HiÓu råi/no"
	)
end

function no()
end

--Ìí¼ÓË«Áú¶´³ö¿ÚNPC
function _AddOutNpc()
	local nOffset = 3
	local tbNpcPos = t.TB_ENTER_POS
	local tbNpc = {
		szName = "Ng­êi truyÒn tèng ChiÕn Long §éng", 
		szTitle = "<npc>Ta cã thÓ ®­a ng­¬i vÒ thµnh",
		nLevel = 95,
		nNpcId = 238,
		nIsboss = 0,
		szScriptPath = "\\script\\event\\great_night\\fruit_chukou_npc.lua",
	}
	for _, tbTmpPos in tbNpcPos do
		local nMapId, nPosX, nPosY = unpack(tbTmpPos)
		nPosX = nPosX + nOffset
		nPosY = nPosY + nOffset
		%basemission_CallNpc(tbNpc, nMapId, nPosX*32, nPosY*32)	
	end
end

--×¢²áÍæ¼ÒÔÚË«Áú¶´µØÍ¼µÄĞĞÎª
function _RegPlayerMapScript()
	local pPlayer = DynamicExecute(t.SZ_PLAYER_SCRIPT, "getglobal", "tbPlayer")
	t.pPlayer = pPlayer
	
	t.nRegIdLeave = EventSys:GetType("LeaveMap"):Reg(t.N_FRUIT_MAP_ID, pPlayer.OnLeaveMap, pPlayer)
	t.nRegIdEnter = EventSys:GetType("EnterMap"):Reg(t.N_FRUIT_MAP_ID, pPlayer.OnEnterMap, pPlayer)
end

