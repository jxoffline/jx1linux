Include("\\script\\event\\funv_jieri\\200903\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")

Include("\\script\\lib\\string.lua")
local tbExpAward = 
{
	--[nSex] = {nExp = nExp}
	[0] = {nExp = 2000000},
	[1] = {nExp = 3000000},
	
}


local tbBless = 
{
	"Nô c­êi th©n th­¬ng, trong v¾t, th¬ ng©y lu«n gi÷ m·i trªn m«i",
	"Lu«n lu«n vui vÎ vµ h¹nh phóc",
	"Lu«n gÆp nhiÒu may m¾n vµ h¹nh phóc",
	"§· ®Ñp, ngµy cµng ®Ñp h¬n, khiÕn hoa ph¶i ghen, tr¨ng ph¶i thÑn",
	"Nh÷ng ®iÒu tèt ®Ñp lu«n ®i kÒ bªn",
	"Lu«n lu«n m¹nh mÏ, tù tin trong cuéc sèng",
	"Con ®­êng ®i lu«n t­¬i th¾m nh­ ®­îc r¶i ®Çy hoa hång",
	"DÔ dµng v­ît qua nh÷ng khã kh¨n trong cuéc sèng",
	"Thêi gian sÏ kh«ng lµm phai mê nhan s¾c",
	"Lu«n c¶m thÊy vui vÎ vµ tho¶i m¸i",
	"Lu«n gi÷ v÷ng niÒm tin vµo cuéc sèng",
	"Lu«n m·i xinh ®Ñp, dÞu dµng nh­ c« TÊm",
	"Lu«n m·i ®Ñp nh­ ®ång cá víi ngµn hoa khoe s¾c",
	"Lu«n ®­îc sèng trong t×nh c¶m cña b¹n bÌ vµ nh÷ng ng­êi th©n yªu",
	"V÷ng tin vµ thµnh c«ng trong sù nghiÖp",
	"M·i lu«n ®Ñp dÞu dµng vµ ®Çy quyÕn rò",
	"Lu«n ®øng lªn mçi khi vÊp ng·, ®Çy ®ñ dòng khÝ v­ît qua gian khã",
	"Mét ngµy 8-3 thËt vui vµ nhiÒu ý nghÜa",
	"Sím t×m ®­îc chç dùa ®Ó lu«n v÷ng b­íc trong ®­êng ®êi",
	"C¶ gia ®×nh lu«n lu«n vui vÎ, h¹nh phóc, kháe m¹nh",
}
local _AddRoseCardExp = function (nItemIndex)
	local nSex = GetSex()
	if tbFunv0903.tbTask:CheckExpFromRose() ~= 1 then
		Msg2Player(format("Mçi nh©n vËt chØ nhËn ®­îc tèi ®a %u kinh nghiÖm tõ thiÖp hoa hång", tbFunv0903.tbTask.nMaxExpFromRose))	
	else
		local tbExp = %tbExpAward[nSex]
		tbAwardTemplet:GiveAwardByList(tbExp, "use "..GetItemName(nItemIndex))
		tbFunv0903.tbTask:AddCurExpFromRose(tbExp.nExp)
	end
	
end

function main(nItemIndex)
	
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "VËt phÈm nµy ®· hÕt h¹n")
		return 0
	end
	
	local nTeamSize = GetTeamSize()
	if GetSex() ~= 0 then
		Talk(1, "", "VËt phÈm nµy chØ cã nh©n vËt nam míi sö dông ®­îc")
		return 1
	end
	if nTeamSize ~= 2 then
		Talk(1, "", "Ph¶i tæ ®éi 2 ng­êi 1 nam 1 n÷ míi sö dông ®­îc.")
		return 1
	end
	local nSexFlag = 0
	local szName_Male = GetName()
	local szName_Female = ""
	for i=1, nTeamSize do
		local nPlayerIndex = GetTeamMember(i)
		local nSex = doFunByPlayer(nPlayerIndex, GetSex)
		local szName = doFunByPlayer(nPlayerIndex, GetName)
		local bRet, szFailMsg = doFunByPlayer(nPlayerIndex, tbFunv0903.IsPlayerEligible, tbFunv0903)
		if bRet ~= 1 then
			local szMsg = format("<color=yellow>%s<color>%s",szName, szFailMsg)
			Msg2Team(szMsg)
			Talk(1, "", szMsg)
			
			return 1
		end
		
		nSexFlag = nSexFlag + nSex
		if szName ~= szName_Male then
			szName_Female = szName
		end
	end
	
	if nSexFlag ~= 1 then --2ÈË×é¶ÓµÄÇé¿öÏÂ£¬Í¬ÐÔ±ðÏà¼Ó±Ø¶¨Îª0+0=0»òÕß1+1=2£¬ÒìÐÍÎª0+1=1
		Talk(1, "", "Ph¶i tæ ®éi 2 ng­êi 1 nam 1 n÷ míi sö dông ®­îc.")
		return 1
	end
	local nColor = toColor(random(0,255), random(0,255), random(0,255)) 
	local szBless = format("<color=%s>%s<color>", tostring(nColor), %tbBless[random(1, getn(%tbBless))])
	local szMsg = format("<color=yellows>%s<color>Chóc<color=yellows>%s<color>: %s", szName_Male, szName_Female, szBless)
	AddGlobalNews(szMsg)
	Msg2SubWorld(szMsg)
	for i=1, nTeamSize do
		local nPlayerIndex = GetTeamMember(i)
		doFunByPlayer(nPlayerIndex, %_AddRoseCardExp, nItemIndex)
	end
	
	
	
	
	
end