-- ÎÄ¼þÃû¡¡£ºdailog.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-04-17 11:00:21
--±¨ÃûµÄ¶Ô»°
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\racegame\\ready\\ready.lua")
function racegame_SignUp_main(nStep)
	jiefang_0804_ResetTask()
	local tbSay = {}
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc> Trong thêi gian tõ 11-06-2008 ®Õn 24:00 13-07-2008, Vâ l©m minh chñ sÏ tæ chøc Cuéc ®ua 4 mïa ë c¸c thµnh thÞ. 30 ng­êi ®Çu tiªn ch¹y vÒ ®Ých vµ nãi chuyÖn víi ¤ng chñ tr­êng ®ua sÏ nhËn ®­îc phÇn th­ëng hËu hØ, ng­¬i cã muèn tham gia ho¹t ®éng nµy kh«ng?",
			"Ta sÏ kh«ng bá qua ngµn n¨m cã mét nµy!/#racegame_SignUp_main(2)",
			"T×m hiÓu th«ng tin ho¹t ®éng/#racegame_SignUp_main(3)",
			"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./OnCancel",	
		}
	elseif nStep == 2 then
		local nReadyMissionState = gb_GetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState)
		local nMissionState = gb_GetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.MissionState)
		--local nPlayerCount	= racegame_tbReadyMission:GetMSPlayerCount()
		
--		if nPlayerCount >= racegame_tbReadyMission.nPlayerCountLimit then
--			Say("Õâ³¡»î¶¯ÈËÊýÒÑ¾­´ïµ½ÉÏÏÞ£¬Äã²Î¼ÓÏÂÒ»³¡°É£¡",0)
--			return 
--		end
		
		if GetLevel() < racegame_tbReadyMission.nLevelLimit then
			Say(format("§¼ng cÊp kh«ng ®ñ %s, kh«ng thÓ tham gia ho¹t ®éng.", racegame_tbReadyMission.nLevelLimit), 0 )
			return 
		end
		
		
		if nReadyMissionState == 1 then
			
			local w = GetWorldPos()
			SetTask(jiefang_0804_TSK_MapId, w)			
			local nRandId = random(1, getn(racegame_tbReadyMission.tbWaitPos) )
			return NewWorld(racegame_tbReadyMission.nMapId, racegame_tbReadyMission.tbWaitPos[nRandId][1], racegame_tbReadyMission.tbWaitPos[nRandId][2])
		elseif (nReadyMissionState == 0 and nMissionState ~= 0) or nReadyMissionState == 3 then
			tbSay = 
			{
				"§¹i hiÖp ®· trÔ mÊt råi, cuéc ®ua ®· b¾t ®Çu. Thêi gian thi ®Êu mçi tuÇn: <enter>Thø 2 ®Õn thø 6, s¸ng 10:00 ®Õn 11:00, chiÒu 22:00 ®Õn 23:00<enter>Thø 7; ngµy 30 th¸ng 4 vµ 01 th¸ng 5, r¹ng s¸ng 02:00 ®Õn 03:00, s¸ng 10:00 ®Õn 11:00, chiÒu 14:00 ®Õn 15:00, tèi 22:00 ®Õn 23:00<enter>Chñ nhËt, s¸ng 10:00 ®Õn 11:00, tr­a 14:00 ®Õn 15:00, tèi 22:00 ®Õn 23:00.",
				"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./OnCancel",	
			}
			tbSay[1] = "<dec><npc>"..tbSay[1]
		elseif nReadyMissionState == 0 and nMissionState == 0 then
			tbSay = 
			{
				"Cuéc ®ua vÉn ch­a b¾t ®Çu. Thêi gian thi ®Êu mçi tuÇn:<enter>Thø 2 ®Õn thø 6, s¸ng 10:00 ®Õn 11:00, chiÒu 22:00 ®Õn 23:00<enter>Thø 7; ngµy 30 th¸ng 4 vµ 01 th¸ng 5, r¹ng s¸ng 02:00 ®Õn 03:00, s¸ng 10:00 ®Õn 11:00, chiÒu 14:00 ®Õn 15:00, tèi 22:00 ®Õn 23:00<enter>Chñ nhËt, s¸ng 10:00 ®Õn 11:00, tr­a 14:00 ®Õn 15:00, tèi 22:00 ®Õn 23:00.",
				"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./OnCancel",
			}
			tbSay[1] = "<dec><npc>"..tbSay[1]
		end
	elseif nStep == 3 then
		tbSay = 
		{
			"<dec><npc>Mçi cuéc ®ua diÔn ra trong 15 phót, trong ®ã cã 1 phót ®Ó chuÈn bÞ. Sau khi b¸o danh tham gia, ng­êi ch¬i sÏ ®­îc ®­a ®Õn khu vùc chuÈn bÞ. Sau khi cuéc tranh tµi b¾t ®Çu, c¸c tuyÓn thñ ph¶i ra søc ch¹y thËt nhanh vÒ ®Ých. Trong qu¸ tr×nh ®ua, trªn ®­êng ®ua sÏ xuÊt hiÖn c¸c ®¹o cô hç trî, sö dông ®¹o cô nµy cã thÓ gióp t¨ng tèc ®é ch¹y cña b¶n th©n hoÆc lµm gi¶m tèc ®é cña ng­êi kh¸c. 30 ng­êi ®Çu tiªn vÒ ®Ých vµ nãi chuyÖn víi ¤ng chñ ®­êng ®ua sÏ nhËn ®­îc phÇn th­ëng cã gi¸ trÞ.",
			"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./OnCancel",	
		}
		
	end
	CreateTaskSay(tbSay)
end



function racegame_Award_main()
	jiefang_0804_ResetTask()
	local nAwardState = GetTask(jiefang_0804_TSK_AwardState)
	local nPlayerMapId = GetTask(jiefang_0804_TSK_MapId)
	if nPlayerMapId == 0 then
		nPlayerMapId = 520
	end
	if nAwardState == 1 then
		return NewWorld(nPlayerMapId, racegame_tbMission.tbSignUpPos[1], racegame_tbMission.tbSignUpPos[2])
	end
	local nRankCount = racegame_tbMission:GetMissionV(racegame_tbMission.tbMissionV.RANK_COUNTER)
	nRankCount = nRankCount + 1
	racegame_tbMission:SetMissionV(racegame_tbMission.tbMissionV.RANK_COUNTER, nRankCount)
	local szMsg = format("Ha ha, ®¹i hiÖp trong cuéc ®ua nµy ®­îc xÕp h¹ng <color=yellow>%d<color>.",  nRankCount)
	
	Msg2MSAll(racegame_tbMission.nMissionId, format("<color=yellow>%s<color> trong cuéc ®ua nµy ®­îc xÕp h¹ng <color=yellow>%d<color>.",GetName(),  nRankCount))
	Msg2Player(szMsg)
	if nRankCount >= 1 and nRankCount <= 10 then
		AddOwnExp(2000000)
		if random(1,100) <=50 then
			AddItem(4, 239, 1, 1, 0, 0)
			Msg2Player("NhËn ®­îc 1 Tö Thñy Tinh")
		end
	elseif nRankCount >= 11 and nRankCount <= 20 then
		AddOwnExp(1000000)
	elseif nRankCount >= 21 and nRankCount <= 30 then
		AddOwnExp(500000)
	end 
	
	SetTask(jiefang_0804_TSK_AwardState, 1)
	if nRankCount >= 30 then
		racegame_tbMission:CloseGame();
	end
	
	NewWorld(nPlayerMapId, racegame_tbMission.tbSignUpPos[1], racegame_tbMission.tbSignUpPos[2])
end

function OnCancel()
end