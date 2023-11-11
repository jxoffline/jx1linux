-- ÑïÖİ Â·ÈËNPC ÈÎÌìÑÄ£¨ÈëÃÅÈÎÎñ£©
-- by£ºDan_Deng(2003-07-28)
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta ®Õn t×m «ng cã viÖc kh¸c", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end
function old_main()
	Uworld30 = GetByte(GetTask(30),2)
	if ((Uworld30 == 10) and (HaveItem(73) == 0)) then		--ÈëÃÅÈÎÎñÖĞ²¢ÇÒÃ»ÓĞ¸ÃÎïÆ·
		Say("Ph¶i khen thÕ nµo ®©y?",4,"Con ch¸u. /prise_1","T­íng m¹o /prise_2","c«ng danh /prise_3","Rêi khái/prise_exit")
	else					--ÔÚÆÕÍ¨¶Ô»°ÖĞ¸øÒ»µãµãÈÎÎñÌáÊ¾¡£
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","TiÓu sinh gia c¶nh bÇn hµn ®Õn nay thª tö vÉn ch­a cã: 'Cæ nh©n v©n,bÊt hiÕu h÷u tam,v« hËu vi ®¹i'. NÕu nh­ vÇy sau nµy ta lµm sao cã thÓ nh×n mÆt tæ t«ng?!")
		elseif (i == 1) then
			Talk(1,"","Chİnh v× ta lín lªn xÊu xİ nh­ vÇy nªn kh«ng cã c« g¸i nµo chŞu g¶ cho ta c¶! T¹i sao c¸c c« g¸i trªn ®êi lÊy chång ®Òu chØ thİch nh×n t­íng m¹o?")
		else
			Talk(1,"","ThËp niªn hµn song v« nh©n hiÓu; nhÊt cö thµnh danh thiªn h¹ tri'? Ph¶i ch¨ng chØ ®Õn khi nµo ta thµnh danh th× míi mong ®Õn chuyÖn thª tö?")
		end
	end
end;

function prise_1()
	Talk(2,"","VŞ huynh ®µi nµy, võa nh×n thÊy t­íng m¹o, ®· biÕt ngay lµ ng­êi cã phóc sè, con ch¸u ®Çy nhµ!","TiÓu sinh gia c¶nh bÇn hµn ®Õn nay thª tö vÉn ch­a cã: 'cæ nh©n v©n,bÊt hiÕu h÷u tam,v« hËu vi ®¹i'. NÕu nh­ vÇy sau nµy ta lµm sao cã thÓ nh×n mÆt tæ t«ng?!")
end;

function prise_2()
	Talk(2,""," VŞ huynh ®µi nµy, võa nh×n thÊy t­íng m¹o, ®· biÕt ngay lµ ng­êi cã phóc sè, con ch¸u ®Çy nhµ!","Ng­¬i ®õng cã ®ïa giìn n÷a! Chİnh v× ta lín lªn xÊu xİ nh­ vÇy nªn kh«ng cã c« g¸i nµo chŞu g¶ cho ta c¶! T¹i sao c¸c c« g¸i trªn ®êi lÊy chång ®Òu chØ thİch nh×n t­íng m¹o?")
end;

function prise_3()
	Talk(2,""," VŞ huynh ®µi nµy, võa nh×n thÊy t­íng m¹o, ®· biÕt ngay lµ ng­êi cã phóc sè, con ch¸u ®Çy nhµ!","Nh©n sinh khã cã tri ©m, ng­¬i thËt lµ tri kû cña ta! TiÓu sinh kh«ng cã vËt g× ®¸ng gi¸, chØ cã phiÕn qu¹t nµy, tÆng ng­¬i gäi lµ lÔ t­¬ng kiÕn")
	AddEventItem(73)
	Msg2Player("NhiÖm Thiªn Nhai tÆng b¹n chiÕc qu¹t ")
	AddNote("NhiÖm Thiªn Nhai tÆng b¹n chiÕc qu¹t ")
end;

function prise_exit()
end;
