Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\tianchimijing\\floor1\\gamefloor1.lua")
Include("\\script\\lib\\composeex.lua")
--Bonus award - Modified By DinhHQ - 20120405
Include("\\script\\missions\\tianchimijing\\vnextaward.lua")
function main()
	if GetFightState() == 1 then
		DealWithFightPlayer()
	else
		DealWithUnFightPlayer()
	end	
end

function DealWithFightPlayer()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc> Con ®­êng nµy ®øt ®o¹n, duy nhÊt chØ cã Khinh C«ng míi ®i qua ®­îc, muèn nhËn ®­îc n¨ng lùc sö dông Khinh C«ng, th× h·y ®i t×m §ao, Th­¬ng, KiÕm bÞ thÊt l¹c cña ta mang ®Õn ®©y, nh÷ng lo¹i binh khÝ nµy cã ë trong R­¬ng Binh KhÝ trªn mÆt ®Êt."
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tinsert(tbDailog, {"Ta ®· t×m ®­îc råi", ThrowPlayer})
	tinsert(tbDailog, {"§Ó ta suy nghÜ ®·"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function ThrowPlayer()
	local tbOpt = {}
	local szTitle = ""
	local tbFormula =
	{
		szFailMsg = "¢n ThÕ Cao Nh©n: Ng­¬i ®em ®Õn nh÷ng thø mµ ta kh«ng cÇn ®Õn, ng­¬i muèn lõa g¹t ta ­ ?",
		nFreeItemCellLimit = 0,
		szComposeTitle = "",
		tbMaterial = 
		{
			{szName = "§ao ", tbProp = {6, 1, 2592}, nCount = 1},
			{szName = "th­¬ng ", tbProp = {6, 1, 2593}, nCount = 1},
			{szName = "KiÕm ", tbProp = {6, 1, 2594}, nCount = 1},
		},
		tbProduct = 
		{
			szName = nil,
			pFun = function (self, nItemCount, szLogTitle)
			end	
		},
		pLimitFun = function (self, nItemCount)
			return 1
		end
	}
	local pCompose = tbActivityCompose:new()
	pCompose:_init(tbFormula, "§ao Th­¬ng KiÕm cña Thiªn Tr× MËt c¶nh ®æi lÊy Khinh C«ng.")
	local nRetCode = pCompose:Compose(1)
	if nRetCode == 1 then
		--Bonus award - Modified By DinhHQ - 20120405
		tbVnExtAward:SetAwardFlag(1)
		SetAForbitSkill(210, 0)
		szTitle = "<#><npc> ha ha , tèt tèt , qu¶ nhiªn lµ ®ao binh cña ta, râ råi ,Khinh C«ng lµ sö dông nh­ vÇy! ( ng­¬i cã thÓ sö dông Khinh C«ng råi )"
		tinsert(tbOpt, {"§a t¹ ®¹i hiÖp"})
		CreateNewSayEx(szTitle, tbOpt)
	else
	end
end

function DealWithUnFightPlayer()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>TiÓu hiÖp, ta ®· ®îi ng­¬i l©u l¾m råi, ng­¬i cã cÇn ta ®em ng­¬i vµo trong kia kh«ng? vßa ®ã råi th× kh«ng ra ®­îc ®©u nhÐ!"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tinsert(tbDailog, {"Xin h·y ®­a ta vµo", TransPlayer})
	tinsert(tbDailog, {"§Ó ta suy nghÜ ®·"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end


function TransPlayer()
	--Bonus award - Modified By DinhHQ - 20120405
	tbVnExtAward:SetAwardFlag(1)
	GameFloor1:MoveToTrap("§iÓm truyÒn tèng cña ¢n ThÕ Cao Nh©n")
end