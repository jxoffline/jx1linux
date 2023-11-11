-------------------------------------------------------------------------
-- FileName		:	messenger_turerukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   Ç§±¦¿âÈë¿Ú
-------------------------------------------------------------------------

Include("\\script\\task\\tollgate\\killbosshead.lua") --°üº¬ÁËÍ¼Ïóµ÷ÓÃ
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊı¾İ±í¸ñµÄÀà
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--¿ª±¦Ïä¹¤¾ßº¯Êı

Include("\\script\\lib\\common.lua");

Include("\\script\\activitysys\\functionlib.lua")--ÒıÓÃlib:DoFunByPlayer

function main()
	local tbDialog =
	{
		--"½ÓÊÜÈÎÎñ/ture_gettask",
		"B¾t ®Çu nhiÖm vô /ture_try_starttask",
		"TiÕp tôc nhiÖm vô/ture_continuetask",
	  	"Rêi khái khu vùc/ture_movecity",
	  	"L¸t n÷a quay l¹i /no",
	}
--	if (tbBirthday0905:IsActDate() == 1) then
--		tinsert(tbDialog, 3, "ÔÚÇ§±¦¿âµØÍ¼µÄÈÎÎñ/birthday0905_ture");
--	end
	 Describe(DescLink_YiGuan..": Tõ chæ cña ta ®©y b¾t ®Çu ph©n c«ng nhiÖm vô cô thÓ cho ng­¬i, cè lªn nhĞ. Tæ ®éi do ®éi tr­ëng b¾t ®Çu nhiÖm vô th× cµng dÔ hoµn thµnh nhiÖm vô h¬n. B©y giê ng­¬i muèn lµm g× ®©y ?",getn(tbDialog), unpack(tbDialog))
end

--function ture_gettask()
--	local Uworld1204 = nt_getTask(1204)  --¼ÇÂ¼Íæ¼ÒµÄÈÎÎñ±äÁ¿£¬Ã¿´ÎÈÎÎñ½áÊøÊ±Çå¿Õ
--	local Uworld1028 = nt_getTask(1028)  --ÈÎÎñÁ´ÈÎÎñ±äÁ¿
--
--	if ( GetLevel() < 120 ) then
--		Describe(DescLink_YiGuan.."£º¶Ô²»Æğ£¬Äúµ±Ç°µÈ¼¶Ã»ÓĞ´ïµ½×îĞ¡µÄ120¼¶ÒªÇó¡£Çë´ïµ½µÈ¼¶ÔÙÀ´ÕÒÎÒ°É¡£",1,"½áÊø¶Ô»°/no")	
--	elseif ( Uworld1204 ~= 0 )  then
--		Describe(DescLink_YiGuan.."£º¶Ô²»Æğ£¬Äúµ±Ç°µÄĞÅÊ¹ÈÎÎñÎ´Íê³É£¬²»ÄÜ½ÓÍ¬ÑùµÄÈÎÎñ£¬ÇëÏÈÍê³É¸ÃÈÎÎñ£¬Ğ»Ğ»¡£",1,"½áÊø¶Ô»°/no")
--	elseif (  messenger_givetime() == 10 ) then  --²é¿´½ñÈÕÊÇ·ñ»¹ÓĞ¹Ø¿¨Ê±¼ä
--		Describe(DescLink_YiGuan.."£º¶Ô²»Æğ£¬Äú½ñÌìÔÚĞÅÊ¹ÈÎÎñÖĞµÄÊ±¼äÒÑºÄ¾¡£¬ÇëÃ÷ÈÕÔÙÀ´,Ğ»Ğ»¡£",1,"½áÊø¶Ô»°/no")
--	else
--		nt_setTask( 1204,1 )
--		nt_setTask( 1203,10) --ÉèÖÃĞÅÊ¹ÈÎÎñµÄ²½Öè
--	end
--end

--function ture_starttask()
--	if ( nt_getTask(1203) == 10 ) then
--		nt_setTask(1211,GetGameTime())              --:ÉèÖÃÈÎÎñ¿ªÊ¼Ê±¼ä
--		nt_setTask(1203,20)
--		DisabledUseTownP(1)			--½ûÓÃ»Ø³Ç·û				--1£º½ûÓÃ	--0£ºÆôÓÃ
--		SetFightState(1);			--´ò¿ªÕ½¶·×´Ì¬				--1£º´ò¿ª	--0£º¹Ø±Õ
--		SetLogoutRV(1);				--¶ÏÏßºÍËÀÍö²»ÎªÒ»¸öÖØÉúµã		--1£º¶ÏÏßºÍËÀÍöÎªÒ»¸öÖØÉúµã	--0£º¶ÏÏßºÍËÀÍö²»ÎªÒ»¸öÖØÉúµã
--		SetPunish(0);				--¹Ø±ÕËÀÍö³Í·£					--1£ºÓĞËÀÍö³Í·£		--0£ºÃ»ÓĞËÀÍö³Í·£
--		SetCreateTeam(1);			--ÔÊĞí×é¶Ó					--1£ºÔÊĞí×é¶Ó		--0£º²»ÔÊĞí×é¶Ó
--		ForbidChangePK(1);   		--²»ÄÜ¸ü¸Äpk×´Ì¬		--1£º²»ÄÜ¸ü¸Äpk×´Ì¬		--0:¿ÉÒÔ¸ü¸Äpk×´Ì¬
--		SetPKFlag(0);               --ÉèÖÃÎªÁ·¹¦Ä£Ê½            
--		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
--		SetPos(1414,3191);
--		Msg2Player("ÈÎÎñ¿ªÊ¼¼ÆÊ±ÁË")
--	elseif ( nt_getTask(1203) == 20 ) then
--		Describe(DescLink_YiGuan.."£ºÄãÒÑ¾­¿ªÊ¼ÁËÈÎÎñ£¬ÎŞĞèÔÙ¿ªÊ¼ÀÕ¡£",1,"½áÊø¶Ô»°/no")
--	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
--		Describe(DescLink_YiGuan.."£ºÄãÒÑ¾­Íê³ÉÁËÈÎÎñ£¬ÔõÃ´»¹Òª¿ªÊ¼ÈÎÎñÄØ£¿ËÙËÙÀë¿ª°É¡£",1,"½áÊø¶Ô»°/no")
--	elseif ( nt_getTask(1203) == 0 ) then
--		Describe(DescLink_YiGuan.."£ºÄãµÄĞÅÊ¹ÈÎÎñÒÑ¾­Ê§°Ü£¬ÇëËÙËÙÀë¿ª¡£",1,"½áÊø¶Ô»°/no")
--	end
--end

function ture_try_starttask()
	if ( nt_getTask(1203) == 10 ) then
		--×Ô¼º¿ªÊ¼ÈÎÎñ
		local nTeamSize = GetTeamSize();
		if nTeamSize > 1 and IsCaptain() ~= 1 then
			Describe(DescLink_YiGuan..": Ng­¬i kh«ng ph¶i ®éi tr­ëng, kh«ng thÓ b¾t ®Çu nhiÖm vô.",1,"KÕt thóc ®èi tho¹i/no")
			return
		end
		
		local nTaskCode,_ = %get_task_order()
		ture_real_starttask_one(nTaskCode);
		
    	if (nTeamSize > 1) then
    		--ËùÓĞ¶ÓÔ±¿ªÊ¼ÈÎÎñ
    		for i=1,nTeamSize do
    			local nMemberIndex = GetTeamMember(i)
    			print(format("nMemberIndex:%d", nMemberIndex))
    			if nMemberIndex >= 0 then
    			
--    			if(CallPlayerFunction(nMemberIndex, IsCaptain)~=1)then
--    				CallPlayerFunction(nMemberIndex, ture_real_starttask_member, nTaskCode)
--    			end
        			if(lib:DoFunByPlayer(nMemberIndex, IsCaptain)~=1)then
    					lib:DoFunByPlayer(nMemberIndex, ture_real_starttask_member, nTaskCode);
    				end
    			else
    				print(format("nMemberIndex:%d error", nMemberIndex))
				end
    		end
    	end
    	
    	WriteLog(format("Account:%s[Name:%s] b¾t ®Çu nhiÖm vô Tİn Sø, nh©n sè tæ ®éi lµ [%d]",
			GetAccount(),
			GetName(),
			nTeamSize
			)
		);
	elseif ( nt_getTask(1203) == 20 or nt_getTask(1203) == 21 ) then
		Describe(DescLink_YiGuan..": Ng­¬i ®· b¾t ®µu nhiÖm vô, kh«ng cÇn ph¶i l¹i b¾t ®Çu n÷a.",1,"KÕt thóc ®èi tho¹i/no")
	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		Describe(DescLink_YiGuan..": NhiÖm vô cña ng­¬i ®· hoµn thµnh, sao l¹i ph¶i b¾t ®Çu n÷a ? Nhanh ch©n rêi khái ®©y ®i.",1,"KÕt thóc ®èi tho¹i/no")
	elseif ( nt_getTask(1203) == 0 ) then
		Describe(DescLink_YiGuan..": Ng­¬i ®· hoµn thµnh nhiÖm vô Tİn sø råi! Nhanh ch©n rêi khái ®©y ®i!",1,"KÕt thóc ®èi tho¹i/no")
	end
end

function ture_real_starttask_one(nTaskCode)
	nt_setTask(1202,0)--Çå¿Õµ±Ç°ÈÎÎñ½ø¶È
	ture_real_starttask(nTaskCode)
	
	local szMsg,nCount = get_task_string(nTaskCode)
	szMsg = format("Ng­¬i b¾t ®Çu nhiÖm vô Thiªn B¶o Khè §­a Tin, h·y n¾m b¾t thêi gian ®i më 5 B¶o R­¬ng hoµn thµnh nhiÖm vô ®i, h·y chó ı më ®óng thø tù: <color=yellow>%s<color>", szMsg)
	Msg2Player(szMsg)
end

function ture_real_starttask_member(nTaskCode)
	local nMapId, nX, nY = GetWorldPos()
	if nMapId == 395 then
    	if ( nt_getTask(1203) == 10 ) then
    		nt_setTask(1202,0)--Çå¿Õµ±Ç°ÈÎÎñ½ø¶È
    		ture_real_starttask(nTaskCode)
    		
    		local szMsg,nCount = get_task_string(nTaskCode)
    		szMsg = format("§éi tr­ëng cña ng­¬i ®· b¾t ®Çu nhiÖm vô Thiªn B¶o Khè §­a Tin, h·y n¾m b¾t thêi gian ®Õn b¶n ®å <color=yellow> Thiªn B¶o Khè<color> më B¶o R­¬ng hoµn thµnh nhiÖm vô ®I, h·y chó ı më r­¬ng ®óng thø tù: <color=yellow>%s<color>", szMsg)
    		Msg2Player(szMsg)
    		return
    	elseif ( nt_getTask(1203) == 20 or nt_getTask(1203) == 21 ) then
    		Msg2Player("§éi tr­ëng cña ng­¬i ®· b¾t ®Çu nhiÖm vô Thiªn B¶o Khè §­a Tin, nhiÖm vô cña ng­¬i kh«ng gièng víi ®éi ngò, h·y tù m×nh hoµn thµnh nhĞ")
    	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
    		Msg2Player("§éi tr­ëng cña ng­¬i ®· b¾t ®Çu nhiÖm vô Thiªn B¶o Khè §­a Tin, nhiÖm vô cña ng­¬I ®· hoµn thµnh, kh«ng gièng víi ®éi ngò, h·y rêi ®éi ®i giao nhiÖm vô ®i")
    	elseif ( nt_getTask(1203) == 0 ) then
    		Msg2Player("§éi tr­ëng cña ng­¬i ®· b¾t ®Çu nhiÖm vô Thiªn B¶o Khè §­a Tin, ng­¬I vÉn ch­a tiÕp nhËn nhiÖm vô nµy, h·y rêi khái ®éi ngò ®i")
    	end
    else
    	Msg2Player("§éi tr­ëng cña ng­¬i ®· b¾t ®Çu nhiÖm vô Thiªn B¶o Khè §­a Tin, ng­¬i kh«ng ë b¶n ®å<color=yellow>Thiªn B¶o Khè<color>, xin h·y tù m×nh hoµn thµnh")
	end
	
	Msg2Team(format("<color=yellow>%s<color>TiÕn ®é nhiÖm vô kh«ng gièng víi ®éi ngò", GetName()))
end

function ture_real_starttask(nTaskCode)
	nt_setTask(1211,GetGameTime())              --:ÉèÖÃÈÎÎñ¿ªÊ¼Ê±¼ä
	nt_setTask(1203,20)
	nt_setTask(1201,nTaskCode)
	DisabledUseTownP(1)			--½ûÓÃ»Ø³Ç·û				--1£º½ûÓÃ	--0£ºÆôÓÃ
	SetFightState(1);			--´ò¿ªÕ½¶·×´Ì¬				--1£º´ò¿ª	--0£º¹Ø±Õ
	SetLogoutRV(1);				--¶ÏÏßºÍËÀÍö²»ÎªÒ»¸öÖØÉúµã		--1£º¶ÏÏßºÍËÀÍöÎªÒ»¸öÖØÉúµã	--0£º¶ÏÏßºÍËÀÍö²»ÎªÒ»¸öÖØÉúµã
	SetPunish(1);				--´ò¿ªËÀÍö³Í·£					--1£ºÓĞËÀÍö³Í·£		--0£ºÃ»ÓĞËÀÍö³Í·£
	--SetCreateTeam(1);			--ÔÊĞí×é¶Ó					--1£ºÔÊĞí×é¶Ó		--0£º²»ÔÊĞí×é¶Ó
	ForbidChangePK(0);   		--ÔÊĞí¸ü¸Äpk×´Ì¬		--1£º²»ÄÜ¸ü¸Äpk×´Ì¬		--0:¿ÉÒÔ¸ü¸Äpk×´Ì¬
	SetPKFlag(0);               --ÉèÖÃÎªÁ·¹¦Ä£Ê½            
	SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
	SetPos(1414,3191);
	--Cho bÊt tö 3 gi©y, tr¸h bŞ ®å s¸t - Modifiec by DinhHQ - 20110502
	SetProtectTime(3*18)
	AddSkillState(963, 1, 0, 18*3) 	
end

function ture_movecity()
--Fix bug vÉn pk ®c trong thµnh nÕu dŞch chuyÓn b»ng npc DŞch Quan khi hoµn thµnh nhiÖm vô tİn sø - Modified by DinhHQ - 20110518
	DisabledUseTownP(0)
	SetFightState(0)	
	SetPunish(1)
	SetCreateTeam(1);
	SetPKFlag(0)
	ForbidChangePK(0);
	SetDeathScript("");
	local name = GetName()
	if ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("DŞch tr¹m Thiªn  B¶o khu"..name.."§¹i nh©n ®Õn"..citygo[i][4].."DŞch tr¹m!")
			end
		end	
	elseif ( nt_getTask(1203) == 10 ) or ( nt_getTask(1203) == 0 ) or ( nt_getTask(1203) == 20) or ( nt_getTask(1203) == 21 ) then
		SetLogoutRV(0);
		NewWorld(11,3021,5090)
	end
end

function birthday0905_ture()
	tbBirthday0905.tbTask:reset_task();
	Say("DŞch Quan: Tõ ngµy 19/06/2009 ®Õn 24h ngµy 19/07/2009 , nÕu ®¹i hiÖp cã thÓ v­ît qua ®­îc mét trong nh÷ng thö th¸ch sau ®©y th× ®¹i hiÖp sÏ nhËn ®­îc mét trong bèn tİn vËt v« cïng quı gi¸ lµ “Thiªn Tµn §ao”. §¹i hiÖp cã b»ng lßng tham gia thö th¸ch kh«ng?", 8, 
		"NhËn nhiÖm vô Më 100 b¶o r­¬ng./#birthday0905_settask_message(4)",
		"NhËn nhiÖm vô Tiªu diÖt 1 §¹o tÆc./#birthday0905_settask_message(5)",
		"NhËn nhiÖm vô T×m 1 ThiÕu n÷ bŞ thÊt l¹c./#birthday0905_settask_message(6)",
		"Ta ®· hoµn thµnh nhiÖm vô Më 100 b¶o r­¬ng./#birthday0905_gettask_message(4)",
		"Ta ®· hoµn thµnh nhiÖm vô Tiªu diÖt 1 §¹o tÆc./#birthday0905_gettask_message(5)",
		"Ta ®· hoµn thµnh nhiÖm vô T×m 1 ThiÕu n÷ bŞ thÊt l¹c./#birthday0905_gettask_message(6)",
		"Ta muèn hñy nhiÖm vô hiÖn t¹i/birthday0905_cancel_message",
		"Ta cã chuyÖn gÊp, sÏ quay l¹i sau./no");
end

function no()
end

function ture_continuetask()
	if ( nt_getTask(1203) == 10 ) then
		Describe(DescLink_YiGuan..": NhiÖm vô cña ng­¬i vÉn ch­a b¾t ®Çu, kh«ng thÓ tiÕp tôc nhiÖm vô.",1,"KÕt thóc ®èi tho¹i/no")
	elseif ( nt_getTask(1203) == 20 ) then
		Describe(DescLink_YiGuan..": NhiÖm vô cña ng­¬i ®· b¾t ®Çu, h·y nhanh chãng ®i më 5 B¶o R­¬ng ®i.",1,"KÕt thóc ®èi tho¹i/no")
	elseif ( nt_getTask(1203) == 21 ) then
		ture_real_starttask(nt_getTask(1201))
		Msg2Player("NhiÖm vô cña ng­¬i cã thÓ tiÕp tôc")
	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		Describe(DescLink_YiGuan..": NhiÖm vô cña ng­¬i ®· hoµn thµnh, kh«ng cÇn ph¶i tiÕp tôc n÷a.",1,"KÕt thóc ®èi tho¹i/no")
	elseif ( nt_getTask(1203) == 0 ) then
		Describe(DescLink_YiGuan..": NhiÖm vô cña ng­¬i ®· thÊt b¹i, nhanh chãng rêi khái ®©y.",1,"KÕt thóc ®èi tho¹i/no")
	end
end

