Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

tbEnterPosConfigPath = {
	[1] = "\\settings\\maps\\tianchimijing\\floor1\\enter1.txt",
	[2] = "\\settings\\maps\\tianchimijing\\floor1\\enter2.txt",
	[3] = "\\settings\\maps\\tianchimijing\\floor1\\enter3.txt",
	[4] = "\\settings\\maps\\tianchimijing\\floor1\\enter4.txt",
	[5] = "\\settings\\maps\\tianchimijing\\floor1\\enter5.txt",
	[6] = "\\settings\\maps\\tianchimijing\\floor1\\enter6.txt",
  [7] = "\\settings\\maps\\tianchimijing\\floor1\\enter7.txt",
	[8] = "\\settings\\maps\\tianchimijing\\floor1\\enter8.txt",
	[9] = "\\settings\\maps\\tianchimijing\\floor1\\enter9.txt"							
	}

function main()
		local nNpcIndex = GetLastDiagNpc()
		local szNpcName = GetNpcName(nNpcIndex)
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<#><npc>vÞ tiÓu hiÖp nµy, ta ph¸t hiÖn trong ®Çm n­íc nµy cã mét ®­êng mËt ®¹o, trong mËt ®¹o nµy bµy bè rÊt nhiÒu c¬ quan c¹m bÉy, cÇn ph¶i luyÖn tËp Khinh C«ng ®¹i hiÖp míi cã thÓ ®i qua ®­îc, nghe ®ån r»ng ë ®o¹n cuèi cña mËt ®¹o cã v« sè B¶o Tµng"
		G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
		tinsert(tbDailog, {"Ta muèn t×m hiÓu mét chót", Realize})
		tinsert(tbDailog, {"KÕt thóc ®èi tho¹i"})
		CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function Realize()
	local tbOpt = {}
	local szTitle = "<#><npc>Chç mËt ®¹o nµy h×nh nh­ kh«ng cã ®¸y, nh÷ng ng­êi tõ chç nµy ®i vµo tõ tr­íc ®Õn nay còng ch­a cã mét ai mµ ra ®­îc, nghe ®ån r»ng ë trong mËt ®¹o nµy Èn nÊp rÊt nhiÒu ng­êi Kim, bän hä rÊt lµ tµn ¸c, tiÓu hiÖp ng­¬i tèt nhÊt lµ t×m thªm vµi ng­êi cïng nhau tæ ®éi ®Ó ®i vµo."
	tinsert(tbOpt, {"§i vµo mËt ®¹o", ReadyGo})
	--Check team member condition - Modified By DinhHQ - 20120405
	if GetTeamSize() >= 2 then
		tinsert(tbOpt, {"KiÓm tra ®iÒu kiÖn tæ ®éi", VnCheckTeamCondition, {1, 1}})
	end
	tinsert(tbOpt, {"Hay lµ th«i  nhÐ"})
	CreateNewSayEx(szTitle, tbOpt)
end

function ReadyGo()
	if GetTeamSize() <= 1 then
		SingleEnter()
	else
		TeamEnter()
	end
end

function SingleEnter()
	local tbOpt = {}
	local szTitle = "<#><npc> ThiÕu hiÖp ng­¬i x¸c ®Þnh v­ît mËt ®¹o mét m×nh ­ ?"
	tinsert(tbOpt, {"§óng råi.",SingleEnterSure})
	tinsert(tbOpt, {"§Ó ta suy nghÜ ®·"})
	CreateNewSayEx(szTitle, tbOpt)
end

function TeamEnter()
	if IsCaptain() ~= 1 then
		DealWithNotCaption()
	else
		DealWithIsCaption()
	end
end

function DealWithNotCaption()
	local tbOpt = {}
	local szTitle = "<#><npc> ThiÕu hiÖp ng­¬I kh«ng ph¶i lµ ®éi tr­ëng, hay lµ mêi ®éi tr­ëng cña ng­¬i ®Õn ®©y nhÐ"
	tinsert(tbOpt, {"§­îc råi."})
	CreateNewSayEx(szTitle, tbOpt)
end

function DealWithIsCaption()
	local nTeamSize = GetTeamSize()
	local szTitle = ""
	local _, _, nMapId = GetPos()
	local tbOpt = {}
	local bInSameMap = 1
	for i = 1, nTeamSize do
		local nPlayerIndex = GetTeamMember(i);
		local _, _, nTempMapId = DynamicExecuteByPlayer(nPlayerIndex, "", "GetPos")
		--Check enter pass - Modified By DinhHQ - 20120405
		local nHavePass = DynamicExecuteByPlayer(nPlayerIndex, "", "CalcItemCount", 3, 6, 1, 30194, -1)
		if nTempMapId ~= nMapId or not nHavePass then
			bInSameMap = 0
			break
		end
	end
	if bInSameMap ~= 0 then
		TeamEnterSure()
	else	
		szTitle = "<#><npc> HiÖp sü trong ®éi ngò cña ng­¬i cßn cã ng­êi ch­a chuÈn bÞ xong, xin h·y triÖu tËp tÊt c¶ mäi ng­êi ®Õn chç cña ta ®©y míi cã thÓ ®i vµo ®­îc."
		tinsert(tbOpt, {"§­îc, ta triÖu tËp hä l¹i ngay b©y giê."})
		CreateNewSayEx(szTitle, tbOpt)
	end
end

function SingleEnterSure()
	--Check enter pass - Modified By DinhHQ - 20120405
	if not VnCheckPass(PlayerIndex) or not VnConsumePass(PlayerIndex) then
		Talk(1, "", "ChØ cÇn giao cho ta 1 c¸i <color=red>Thiªn Tr× MËt LÖnh<color> ta sÏ chØ cho ng­¬i lèi vµo.")
		return
	end
	local nTbSize = getn(tbEnterPosConfigPath)
	local nConfigId = random(1, nTbSize)
	local szConfigPath = tbEnterPosConfigPath[nConfigId]
	local nTmp = TabFile_Load(szConfigPath, szConfigPath);
	local nTotalRow = TabFile_GetRowCount(szConfigPath)
	local nRowId = random(2, nTotalRow)
	local nPosX = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPX"))
	local nPosY = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPY"))
	NewWorld(935, nPosX/32, nPosY/32)
end

function TeamEnterSure()
	--Last time check team enter pass- Modified By DinhHQ - 20120405
	if not VnCheckTeamCondition(1) then
		return
	end
	local nTeamSize = GetTeamSize()
	local nTbSize = getn(tbEnterPosConfigPath)
	local nConfigId = random(1, nTbSize)
	local szConfigPath = tbEnterPosConfigPath[nConfigId]
	local nTmp = TabFile_Load(szConfigPath, szConfigPath);
	local nTotalRow = TabFile_GetRowCount(szConfigPath)
	for i = 1, nTeamSize do 
		local nPlayerIndex = GetTeamMember(i)		
		if VnConsumePass(nPlayerIndex) then
			local nRowId = random(2, nTotalRow)
			local nPosX = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPX"))
			local nPosY = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPY"))
			DynamicExecuteByPlayer(nPlayerIndex, "", "NewWorld", 935, nPosX/32, nPosY/32)			
		end		
	end
end

--Check enter pass - Modified By DinhHQ - 20120404
function VnCheckPass(nPlayerIdx)
	local nOldPlayer = PlayerIndex
	PlayerIndex = nPlayerIdx
	if CalcItemCount(3, 6, 1, 30194, -1) < 1 then		
		PlayerIndex = nOldPlayer
		return nil
	end
	PlayerIndex = nOldPlayer
	return 1
end
function VnConsumePass(nPlayerIdx)
	local nOldPlayer = PlayerIndex
	PlayerIndex = nPlayerIdx
	if ConsumeItem(3, 1, 6, 1, 30194, -1) ~= 1 then
		PlayerIndex = nOldPlayer
		return nil
	end
	PlayerIndex = nOldPlayer
	return 1
end
function VnCheckTeamCondition(bShowDialog1, bShowDialog2)
	if IsCaptain() ~= 1 then
		Talk(1, "", "Ng­¬i kh«ng ph¶i lµ ®éi tr­ëng kh«ng thÓ thùc hiÖn thao t¸c nµy, h·y kªu ®éi tr­ëng cña ng­¬i tíi ®©y!")
		return
	end
	local tbDialog = {}
	local nTeamSize = GetTeamSize()	
	local nOldPlayer = PlayerIndex
	for i = 1, nTeamSize do		
		--Check enter pass
		PlayerIndex = GetTeamMember(i)
		if not VnCheckPass(PlayerIndex) then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "Kh«ng cã Thiªn Tr× MËt LÖnh"))
		end	
	end
	PlayerIndex = nOldPlayer
	if getn(tbDialog) > 0 then		
		if bShowDialog1 then
			local strTittle = "Tæ ®éi hiÖn t¹i kh«ng thÓ vµo Thiªn Tr× MËt C¶nh:"
			for i = 1, getn(tbDialog) do
				strTittle = strTittle.."\n"..tbDialog[i]
			end
			Describe(strTittle, 1, "§ãng/OnCancel")
		end
		return nil
	else
		if bShowDialog2 then
			local strTittle = "Tæ ®éi hiÖn t¹i cã thÓ vµo Thiªn Tr× MËt C¶nh"
			Describe(strTittle, 1, "§ãng/OnCancel")
		end
		return 1
	end
end