-- ÎÄ¼þÃû¡¡£ºskillexp_150_main.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈÝ¡¡¡¡£º150¼¼ÄÜÊìÁ·¶È¶Ô»°npc
-- ´´½¨Ê±¼ä£º2011-07-27 14:27:15

Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\vng_event\\tochieukynang150\\head.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

--TSK_DAILY_CHANGE = 2902  -- Ã¿Ìì×î¶àÌáÉýµÄ´ÎÊý
--TSK_CHANGE_DAY = 2903	-- ¼ÇÂ¼×îºóÒ»´ÎÌáÉýµÄÈÕÆÚ
--DC 60 lan doi exp, By: ThanhLD 20130611
DAILY_CHANGE_MAX_VALUE = 60		-- Ã¿Ìì¶Ò»»ÉÏÏÞ 
MAP_ID = 967		-- µØÍ¼id
--By: ThanhLD
NDEL_PLAYEXP_PER = 6000000	-- Ã¿´Î¶Ò»»ÐèÒªÏûºÄµÄÍæ¼Ò¾­Ñé
NADD_SKILLEXP_PER = 50		-- Ã¿´Î¶Ò»»¿ÉÒÔ»ñµÃµÄÊìÁ·¶È

szScriptPath = "\\script\\event\\skillexp_150\\skillexp_150_main.lua"
szPosition_chefu = "\\settings\\maps\\skillexp_150\\wagoner.txt"
szPosition_shibei = "\\settings\\maps\\skillexp_150\\shibei.txt"

local tbChefu = {
	{nNpcId = 108, szName = "Èn sü", nLevel = 1, szScriptPath = "\\script\\event\\skillexp_150\\npc_trans.lua"},
		}

-- 24¸öÏà¹ØµÄnpc
local tbShibeiNpc = {
	{nNpcId = 1623, szName = "§¹i Lùc Kim Cang Ch­ëng Bia", tbNpcParam = {1055},},
	{nNpcId = 1623, szName = "Vi §µ hiÕn Xö Bia", tbNpcParam = {1056},},
	{nNpcId = 1623, szName = "Tam Giíi Quy ThiÒn Bia", tbNpcParam = {1057},},
	{nNpcId = 1623, szName = "Tung Hoµnh B¸t Hoang Bia", tbNpcParam = {1059},},
	{nNpcId = 1623, szName = "B¸ V­¬ng T¹m Kim Bia", tbNpcParam = {1060},},
	{nNpcId = 1623, szName = "Hµo Hïng Tr¶m Bia", tbNpcParam = {1058},},
	{nNpcId = 1623, szName = "H×nh Tiªu Cèt LËp Bia", tbNpcParam = {1066},},
	{nNpcId = 1623, szName = "U Hån PhÖ ¶nh Bia", tbNpcParam = {1067},},
	{nNpcId = 1623, szName = "V« ¶nh Xuyªn Bia", tbNpcParam = {1069},},
	{nNpcId = 1623, szName = "ThiÕt Liªn Tø S¸t Bia", tbNpcParam = {1070},},	-- 10
	{nNpcId = 1623, szName = "Cµn Kh«n NhÊt TrÞch Bia", tbNpcParam = {1071},},
	{nNpcId = 1623, szName = "KiÕm Hoa V·n Tinh Bia", tbNpcParam = {1061},},
	{nNpcId = 1623, szName = "B¨ng Vò L¹c Tinh Bia", tbNpcParam = {1062},},
	{nNpcId = 1623, szName = "Ngäc TuyÒn T©m Kinh Bia", tbNpcParam = {1114},},
	{nNpcId = 1623, szName = "B¨ng T­íc Ho¹t Kú", tbNpcParam = {1063},},
	{nNpcId = 1623, szName = "Thñy Anh Man Tó Bia", tbNpcParam = {1065},},
	{nNpcId = 1623, szName = "Giang H¶i Né Lan Bia", tbNpcParam = {1075},},
	{nNpcId = 1623, szName = "TËt Háa LiÖu Nguyªn Bia", tbNpcParam = {1076},},
	{nNpcId = 1623, szName = "Bæng Huýnh L­îc §Þa Bia", tbNpcParam = {1074},},
	{nNpcId = 1623, szName = "Thêi ThÆng Lôc Long Bia", tbNpcParam = {1073},},	-- 20
	{nNpcId = 1623, szName = "KiÕm Thïy Tinh Hµ Bia", tbNpcParam = {1079},},
	{nNpcId = 1623, szName = "T¹o Hãa Th¸i Thanh Bia", tbNpcParam = {1078},},
	{nNpcId = 1623, szName = "Cöu Thiªn C­¬ng Phong Bia", tbNpcParam = {1080},},
	{nNpcId = 1623, szName = "Thiªn L«i ChÊn Nh¹c Bia", tbNpcParam = {1081},},
	}	

function addnpc(szfile, tbNpc)
	local nX = 0
	local nY = 0
	if (TabFile_Load(szfile, szfile) == 0) then
		print(format("can not open file %s", szPosition_chefu))
		return
	end
	local nCount = TabFile_GetRowCount(szfile)
	if (nCount < 2) then
		return
	end
	for i=2,nCount do
		nX = tonumber(TabFile_GetCell(szfile, i, "TRAPX"))
		nY = tonumber(TabFile_GetCell(szfile, i, "TRAPY"))
		local nNpcIndex = basemission_CallNpc(tbNpc[i-1], MAP_ID, nX, nY)
	end
end

function initialization()
	addnpc(szPosition_chefu, %tbChefu)
	
	for i=1,getn(%tbShibeiNpc) do
		%tbShibeiNpc[i].szScriptPath = szScriptPath
	end
	addnpc(szPosition_shibei, %tbShibeiNpc)
end

function checkDailyTask(nSkillId)
--	local nDay = GetTask(TSK_CHANGE_DAY)
--	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
--	if nDay ~= nCurDate then
--		SetTask(TSK_CHANGE_DAY, nCurDate)
--		SetTask(TSK_DAILY_CHANGE, 0)
--	end
	tbTrainSkill150:ResetDailyTask()
	
	local nDayTime;

	if GetCurrentMagicLevel(nSkillId, 0) < 18 then
		 nDayTime = tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Free_Use)  + tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Fee_Use);
	else
		nDayTime = tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Fee_Use)
	end
	local nMaxValue =  tbTrainSkill150:GetMaxTask(nSkillId)
	if nDayTime < nMaxValue then
		return 1
	end
	return 0
end

function addDailyTask_Free(nValue)
--	local nDay = GetTask(TSK_CHANGE_DAY)
--	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
--	if nDay ~= nCurDate then
--		SetTask(TSK_CHANGE_DAY, nCurDate)
--		SetTask(TSK_DAILY_CHANGE, 0)
--	end
-- DC sè lÇn ®æi lªn 60 lÇn/ngµy, by ThanhLD 20130611
	tbTrainSkill150:ResetDailyTask();
	local nDayTime = tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Free_Use)
	if nDayTime > 60 then
		tbTrainSkill150:addDailyTask_Fee(1)
	else
		tbVNG_BitTask_Lib:addTask(tbTrainSkill150.tbBIT_Free_Use, nValue)
	end
end

-- npc ±»µã»÷Ö÷º¯Êý
function main()
	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	local nSkillId = GetNpcParam(nNpcIdx, 1)
	local nPlayerLevel = GetLevel()
	if checkDailyTask(nSkillId) ~= 1 then
		Msg2Player("Sè lÇn h«m nay cña ng­¬i ®· hÕt, ngµy mai h·y l¹i ®©y nhÐ")
		return
	end
	preMsg2Player(nSkillId)
	if nPlayerLevel >= 200 then
		return
	end
	--¿ªÆô½ø¶ÈÌõ
	tbProgressBar:OpenByConfig(10, playerexp2skillexp, {nNpcIdx, dwNpcId, nSkillId},onbreak)
end

function playerexp2skillexp(nNpcIndex, dwNpcId, nSkillId)
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return 0
	end
	
	local szSkillName = GetSkillName(nSkillId)
	local nSkillLevel = HaveMagic(nSkillId)
--	print("nSkillId = " .. nSkillId)
	if nSkillLevel == -1 then
		Msg2Player("§èi víi lo¹i vâ c«ng nµy hµo v« ®Çu tù, hay lµ ®i lÜnh ngé c¸i kh¸c ®i")
		return
	end
	
	if GetCurrentMagicLevel(nSkillId, 0) >= GetSkillMaxLevel(nSkillId) then
		Msg2Player("Kü n¨ng hiÖn t¹i ®· ®¹t giíi h¹n cao nhÊt, kh«ng cÇn ph¶i t¨ng thªm n÷a")
		return
	end
	
	if nSkillLevel == 20 then
		Msg2Player("KÜ n¨ng cÊp 21 nµy kh«ng thÓ th«ng qua c¸ch nµy ®Ó tiÕn hµnh tu luyÖn. ")
		return
	end
	
	local nCurPlayerExp = GetExp()
	local nNeedPlayerExp = getNeedPlayerExp(nSkillId)
	local nPlayerLevel = GetLevel()
	
	--KiÓm tra trïng sinh ®Ó giíi h¹n luyÖn cÊp
	local nlevelskill150 = tbTrainSkill150:CheckTS();
	if (GetCurrentMagicLevel(nSkillId, 0) >= nlevelskill150 and nlevelskill150 > 0) then
		if tbTrainSkill150:Check_UseItem(nSkillId) == 0 then
			Msg2Player("Kü n¨ng hiÖn t¹i ®· ®¹t giíi h¹n cao nhÊt, §¹i hiÖp h·y trïng sinh lªn ®Ó t¨ng thªm cÊp")
			return
		end
	end
	
	if nNeedPlayerExp > nCurPlayerExp then
		Msg2Player(format("L·nh ngé cÇn ph¶i cã %d kinh nghiÖm, kinh nghiÖm hiÖn t¹i cña ng­¬i kh«ng ®ñ", nNeedPlayerExp))
		return 
	end
	
--	print("nSkillId = " .. nSkillId)
	local nNextExp = GetSkillNextExp(nSkillId)	- GetSkillExp(nSkillId)
--	print("nNextExp = " .. nNextExp)
	local nExp = NADD_SKILLEXP_PER					-- Ôö¼ÓÊìÁ·¶È	
	local nTotalExp = NADD_SKILLEXP_PER	
	if not nNextExp then
		return
	end
	ReduceOwnExp(nNeedPlayerExp)	
	if GetCurrentMagicLevel(nSkillId, 0) < 18 then
		
		if tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Free_Use) < tbTrainSkill150:GetValueMaxTask(nSkillId)then
			addDailyTask_Free(1)		-- Ôö¼Ó¶Ò»»µÄ¼ÆÊý
		else
			tbTrainSkill150:addDailyTask_Fee(1)
		end
	else
		tbTrainSkill150:addDailyTask_Fee(1)
	end
	while nExp > nNextExp do
		if nNextExp <= 0 then
--			print("150¼¶¼¼ÄÜÊìÁ·¶È£¬ÏÂÒ»¸öµÈ¼¶ËùÐèÒªµÄ¼¼ÄÜÎª0£¬³ö´íÁË%%%%%%%%%")
			break
		end 
		-- ´ïµ½
		local ncurlevel = GetCurrentMagicLevel(nSkillId, 0)
--		print("ncurlevel = " .. ncurlevel)
		if GetCurrentMagicLevel(nSkillId, 0) >= GetSkillMaxLevel(nSkillId) then
			postMsg2Player(nSkillId)
			return 
		end
		nNeedAddExp = nNextExp
		nExp = nExp - nNeedAddExp
--		print("nExp = " .. nExp)
		AddSkillExp(nSkillId, nNeedAddExp, 1)		
		nNextExp = GetSkillNextExp(nSkillId)
--		print("nNextExp = " .. nNextExp)
	end
--	print("while end")
--	print("nExp = " .. nExp)
	AddSkillExp(nSkillId, nExp, 1)
	
	postMsg2Player(nSkillId)
end

function onbreak()
	Msg2Player("L·nh ngé cña ng­¬i bÞ ®øt ®o¹n.")
end

function OnTimer(nNpcIndex)
end

function getNeedPlayerExp(nSkillId, nNumber)
	local nNeedPlayerExp = NDEL_PLAYEXP_PER
	local nPlayerLevel = GetLevel()
	--By: ThanhLD 60 lan doi dau tien thi Exp = 600000, sau 50 lan sau Exp = 8000000
	local nDayTime = tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Free_Use) + tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Fee_Use)
	if nDayTime > DAILY_CHANGE_MAX_VALUE then
		nNeedPlayerExp = 8000000
	end
	if(nNumber == 1 and nDayTime + 1 > DAILY_CHANGE_MAX_VALUE) then
		nNeedPlayerExp = 8000000
	end

	local _, nRet = tbTrainSkill150:GetMaxTask(nSkillId)
	if 	nRet == 1 then
		nNeedPlayerExp = 8000000
	end
	-- 200¼¶ÌØÊâ´¦Àí
	if nPlayerLevel >= 200 then		
		nNeedPlayerExp = 0
	end
	return nNeedPlayerExp
end

function preMsg2Player(nSkillId)
	local nNeedPlayerExp = getNeedPlayerExp(nSkillId, 1)
	local nPlayerLevel = GetLevel()
	local szSkillName = GetSkillName(nSkillId)
	if nPlayerLevel >= 200 then
		Msg2Player(format("Nh©n vËt cÊp 200 kh«ng thÓ n©ng cao <color=yellow> %s <color> ®é tu luyÖn", szSkillName))
	else
		Msg2Player(format("Tiªu hao <color=yellow> %d <color> kinh nghiÖm n©ng cao ®èi víi <color=yellow> %s <color> ®é tu luyÖn.",nNeedPlayerExp,szSkillName))
	end
end

function postMsg2Player(nSkillId)
	local nPlayerLevel = GetLevel()
	local nNeedPlayerExp = getNeedPlayerExp(nSkillId)
	local szSkillName = GetSkillName(nSkillId)
	local nTotalExp = NADD_SKILLEXP_PER
	
	if nPlayerLevel == 200 then
		Msg2Player(format("Kü n¨ng cña ng­¬i <color=yellow> %s <color> ®é tu luyÖn ®­îc n©ng cao %d",szSkillName, nTotalExp))
	else
		Msg2Player(format("§· tiªu hao <color=yellow> %d <color> kinh nghiÖm ®Ó kü n¨ng <color=yellow> %s <color> ®ä tu luyÖn ®­îc n©ng cao <color=yellow> %d <color>",nNeedPlayerExp, szSkillName,nTotalExp))
	end
end

AutoFunctions:Add(initialization)