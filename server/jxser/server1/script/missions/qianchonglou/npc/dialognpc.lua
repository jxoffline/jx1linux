Include("\\script\\missions\\qianchonglou\\rule.lua")
Include("\\script\\missions\\qianchonglou\\challenger.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
IncludeLib("SETTING")
function signup()
	if tbPlayerHandle:CheckDate() ~= 1 then
		local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint) -- ½±Àø·Ö»ñÈ¡Á¿
		local nAwardPointExchange = tbPlayerHandle:GetAwardPointExchange() -- ÒÑ¶Ò»»µÄ½±Àø·Ö
		local nAwardPointAvail = tbPlayerHandle:GetAwardPointMax() - nAwardPointExchange -- Ê£Óà¿É¶Ò»»µÄ½±Àø·Ö
		if nAwardPoint > 0 and nAwardPointAvail > 0 then
			return Talk(1, "", "Ng­¬i ph¶i nhËn phÇn th­ëng tr­íc ®ã míi tiÕp tôc tham gia ®­îc.")
		end
	end
	if ST_IsTransLife() ~= 1  and GetLevel() < 120 then
		return Talk(1, "", format("%d cÊp trë xuèng kh«ng thÓ tham gia ho¹t ®éng nµy", 120))
	end
	local pDungeonType = DungeonType["endless tower"]
	local pChallenger = tbChallenger:new()
	pChallenger:Update()
	if pChallenger:GetPlayTime() <= 0 then
		return Talk(1, "", "Thêi gian h«m nay cña c¸c h¹ ®· sö dông hÕt")
	end
	if pDungeonType then
		local pDungeon = pDungeonType:new_dungeon(pDungeonType.TEMPLATE_MAP_ID, {pChallenger})
		if pDungeon then
			pChallenger:Update()
			local nMapId, nX, nY = pDungeon:GetTowerPos()
			NewWorld(nMapId, nX, nY)
		else
			print("fail")
		end
	end
end

function give_award()
	local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint) -- ½±Àø·Ö»ñÈ¡Á¿
	local nAwardPointExchange = tbPlayerHandle:GetAwardPointExchange() -- ÒÑ¶Ò»»µÄ½±Àø·Ö
	local nAwardPointAvail = tbPlayerHandle:GetAwardPointMax() - nAwardPointExchange -- Ê£Óà¿É¶Ò»»µÄ½±Àø·Ö
	if nAwardPoint <= 0 or (nAwardPointAvail <=0 and tbPlayerHandle:CheckDate() ~= 1)then
		return Talk(1, "","§iÓm phÇn th­ëng cña c¸c h¹ kh«ng ®ñ ®Ó sö dông phÇn th­ëng nµy")
	elseif nAwardPointAvail <=0 then
		return Talk(1, "","§iÓm ®æi phÇn th­ëng h«m nay cña c¸c h¹ ®· ®¹t ®Õn giíi h¹n.")
	end
	if nAwardPointAvail > nAwardPoint then
		nAwardPointAvail = nAwardPoint
	end
	Msg2Player(format("Ng­¬i ®· nhËn %d phÇn th­ëng cña ®iÓm phÇn th­ëng.", nAwardPointAvail))
	tbPlayerHandle:SetAwardPoint(nAwardPoint-nAwardPointAvail)
	tbPlayerHandle:AddAwardPointExchange(nAwardPointAvail)
end

function dialog()
	local szTitle = "Sau khi më phã b¶n, mçi ng­êi ch¬i sÏ nhËn ®­îc sè ®iÓm c¬ së nhÊt ®Şnh, mçi lÇn ph¸t ra c«ng kİch sÏ tiªu hao ®iÓm c¬ së. C¸c b¹o né kh«ng gièng nhau sÏ tiªu hao ®iÓm c¬ së kh«ng gièng nhau, cã thÓ th«ng qua viÖc nhÊn chuét vµo bªn ph¶i bªn tr¸i trªn mµn h×nh ®Ó ®æi ®¼ng cÊp b¹o né. §¼ng cÊp b¹o né cµng cao, th× tØ lÖ ®¸nh tróng qu¸i vËt cµng lín. Sau khi ®¸nh tróng qu¸i vËt sÏ nhËn ®­îc phÇn th­ëng, khi ®iÓm c¬ së bŞ tiªu hao hÕt, th× còng cã thÓ dïng ®iÓm phÇn th­ëng ®Ó ®æi b¹o né. Cø mçi lÇn ®¸nh tróng sè l­îng qu¸i vËt nhÊt ®Şnh, th× cã thÓ nhËn ®­îc l­îng b¹o né t­¬ng ®èi lín, cã thÓ ®¸nh tróng tÊt c¶ ®Şch nh©n trong ph¹m vi xung quanh."
	local tbOpt = 
	{
		{"Ta muèn tham gia", signup},
		{"NhËn l·nh phÇn th­ëng", give_award},
		{"Hñy bá "}
	}
	CreateNewSayEx(szTitle, tbOpt)
end


Include("\\script\\misc\\eventsys\\type\\npc.lua")

--pEventType:Reg("Quan nh¾c nhë Hoµng Thµnh T­", "Thiªn Trïng L©u", dialog, {})