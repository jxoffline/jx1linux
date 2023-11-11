-------------------------------------------------------------------------
-- FileName		:	messenger_turenpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 10:46:14
-- Desc			:   Ç§±¦¿â¹Ø¿¨µÄ³ö¿Ú´¦¶Ô»°npc£¬ÏôÕò
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀµ
Include("\\script\\task\\tollgate\\killbosshead.lua") --°üº¬ÁËÍ¼Ïóµ÷ÓÃ
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊı¾İ±í¸ñµÄÀµ
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --Ôö¼ÓÍ¬°é¾çÇéÈÎÎñÍê³ÉµÄ¿ØÖÆÅĞ¶Ï
Include("\\script\\activitysys\\g_activity.lua")			--»î¶¯±µ¼­Æ÷
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")		--»î¶¯±µ¼­Æ÷

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--¿ª±¦Ïä¹¤¾ßº¯Êı

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>VŞ nµy anh hïng, t×m ta cã chuyÖn g× kh«ng?"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)

	tbDailog:AddOptEntry("Ta muèn ®i ra ngoµi",messenger_main);
	
	--µ¯³ö¶Ô»°¿ò
	tbDailog:Show()
end

function messenger_main()
--	local Uworld1206 = nt_getTask(1206)
	local name = GetName()

	if ( messenger_middletime() == 10 ) then
		Msg2Player("ThËt xin lçi ! "..name.."! thêi gian nhiÖm vô tİn sø ®· hÕt, nhiÖm vô thÊt b¹i !.")
		losemessengertask()
	else
		Describe(DescLink_XiaoZhen..":"..name..",cã ph¶i hay kh«ng ng­¬i ®· th«ng qua thiªn b¶o kho ®İch kh¶o nghiÖm ? cÇn rêi ®i quan t¹p sao?"
			,3
		,"Ta muèn rêi ®i /messenger_comeback" 
                ,"Ta cßn kh«ng hoµn thµnh kh¶o nghiÖm, ta muèn ®i ra ngoµi mét håi /messenger_icantdo" 
                ,"Ta cßn muèn tiÕp tôc thö mét chót/no")	
		
		if ( Uworld1206 == 0 ) then 
                          Describe(DescLink_XiaoZhen..":"..name.." ,Ng­¬i cã ph¶i hay kh«ng ®· th«ng qua thiªn b¶o kho kh¶o nghiÖm, cÇn xuÊt quan ? ",3,"§óng vËy, ta ph¶i ra khái quan/messenger_comeback","Ta kh«ng xong thµnh kh¶o nghiÖm, bÊt qu¸ ta kh«ng muèn tiÕp tôc lµm /messenger_icantdo","Kh«ng ph¶i lµ, ta cßn muèn n÷a ng¬ ng¸c/no") 
                elseif ( Uworld1206 == 1 ) then 
                          Describe(DescLink_XiaoZhen..": Méc bµi tİn sø "..name..", ngµi lµ kh«ng ph¶i lµ ®· th«ng qua thiªn b¶o kho ®İch kh¶o nghiÖm, cÇn xuÊt quan ? ",3,"§óng vËy, ta ph¶i ra khái quan /messenger_comeback","Ta kh«ng xong thµnh kh¶o nghiÖm, bÊt qu¸ ta kh«ng muèn tiÕp tôc lµm /messenger_icantdo","Kh«ng ph¶i lµ, ta cßn muèn n÷a ng¬ ng¸c /no") 
                elseif ( Uworld1206 == 2 ) then 
                          Describe(DescLink_XiaoZhen..": §ång bµi tİn sø "..name.." §¹i nh©n ! ngµi lµ kh«ng ph¶i lµ ®· th«ng qua thiªn b¶o kho ®İch kh¶o nghiÖm, cÇn xuÊt quan ? ",3,"§óng vËy, ta ph¶i ra khái quan /messenger_comeback","Ta kh«ng xong thµnh kh¶o nghiÖm, bÊt qu¸ ta kh«ng muèn tiÕp tôc lµm /messenger_icantdo","Kh«ng ph¶i lµ, ta cßn muèn n÷a ng¬ ng¸c /no") 
                elseif ( Uworld1206 == 3 ) then 
                          Describe(DescLink_XiaoZhen..": Ng©n bµi tİn sø "..name.." §¹i nh©n ! khæ cùc ngµi kĞo ! ng­¬i cã ph¶i hay kh«ng ®· th«ng qua thiªn b¶o kho ®İch kh¶o nghiÖm, cÇn xuÊt quan ? ",3,"§óng vËy , Ta ph¶i ra khái quan /messenger_comeback","Ta kh«ng xong thµnh kh¶o nghiÖm, bÊt qu¸ ta kh«ng muèn tiÕp tôc lµm /messenger_icantdo","Kh«ng ph¶i lµ, ta cßn muèn n÷a ng¬ ng¸c /no") 
                elseif ( Uworld1206 == 4 ) then 
                          Describe(DescLink_XiaoZhen..": Kim bµi tİn sø "..name.." §¹i nh©n ! lín nh­ vËy thËt xa ®İch ch¹y tíi thËt lµ lao ngµi phİ t©m, ngµi b©y giê lµ kh«ng ph¶i lµ ®· th«ng qua thiªn b¶o kho ®İch kh¶o nghiÖm, cÇn xuÊt quan ? ",3,"§óng vËy, ta ph¶i ra khái quan /messenger_comeback","Ta kh«ng xong thµnh kh¶o nghiÖm, bÊt qu¸ ta kh«ng muèn tiÕp tôc lµm /messenger_icantdo","Kh«ng ph¶i lµ, ta cßn muèn n÷a ng¬ ng¸c /no") 
                elseif ( Uworld1206 == 5 ) then 
                         Describe(DescLink_XiaoZhen..": Ngù tø kim bµi tİn sø "..name.." §¹i nh©n ! ta cßn cho tíi b©y giê ch­a tõng thÊy ngù tø kim bµi ®©y, h«m nay coi lµ më réng tÇm m¾t liÔu ! ngµi thËt lµ lîi h¹i. Ngµi lµ kh«ng ph¶i lµ ®· th«ng qua thiªn b¶o kho ®İch kh¶o nghiÖm, cÇn xuÊt quan ? ",3,"§óng vËy, ta ph¶i ra khái quan /messenger_comeback","Ta kh«ng xong thµnh kh¶o nghiÖm, bÊt qu¸ ta kh«ng muèn tiÕp tôc lµm /messenger_icantdo","Kh«ng ph¶i lµ, ta cßn muèn n÷a ng¬ ng¸c /no") 
                end
	end
end

function messenger_comeback()
	if check_task_state()==30 then
		nt_setTask(1203,30)  --Ç§±¦¿âÈÎÎñµÄÈÎÎñ±äÁ¿ÉèÖÃÎªÈÎÎñÍê³É×´Ì¬
		nt_setTask(1213,0)  --Ë«±¶¾­ÑéÊ±¼ä
		nt_setTask(1215,0)  --bossË¢¹Ö¿ª¹Ø
		local nRealjifen = 0;
		if ( Uworld1214 ~= 0 ) then
			--¸ù¾İ¾È³öµÄÈËÊı¸øÓè¶ÔÓ¦½±Àø
			if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
				AddOwnExp(50000*Uworld1214)
				local Uworld3000 = nt_getTask(3000)
				nRealjifen = Uworld1214*16;
				nt_setTask(3000,Uworld1214*16+Uworld3000)
			elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
				AddOwnExp(100000*Uworld1214)
				local Uworld3000 = nt_getTask(3000)
				nRealjifen = Uworld1214*18;
				nt_setTask(3000,Uworld1214*18+Uworld3000)
			elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
				AddOwnExp(150000*Uworld1214)
				local Uworld3000 = nt_getTask(3000)
				nRealjifen = Uworld1214*24;
				nt_setTask(3000,Uworld1214*24+Uworld3000)		
			end				 
			nt_setTask(1214,0)
		end
		local nBeishu = greatnight_huang_event(2);--by Ğ¡É½
		if (nBeishu > 0) then--by Ğ¡É½
			nOrgRealjifen = floor(nRealjifen / nBeishu);--by Ğ¡É½
		end;
		tongaward_message(nRealjifen);	--by Ğ¡É½
		
		nt_setTask(1203,30)

		DisabledUseTownP(0)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
--		taskProcess_002_08:doTaskEntity()
		SetDeathScript("");
		
--		local n_level = GetLevel();
--		G_ACTIVITY:OnMessage("FinishMail", 3, n_level);
		
		SetPos(1414,3197);
	else
		Describe(DescLink_XiaoZhen..": ThËt xin lçi, tr­íc m¾t ng­¬i cßn ch­a hoµn thµnh x«ng quan môc tiªu, ë thiªn b¶o kho trªn b¶n ®å, ng­¬i cÇn dùa theo nhiÖm vô trËt tù më ra 5 c¸ b¶o r­¬ng míi cã thÓ coi nh­ lµ qu¸ quan.",1,"KÕt thóc ®èi tho¹i/no")
	end
end

function messenger_icantdo()
	if nt_getTask(1203) ==25 then
		Talk(1, "", "NhiÖm vô cña ng­¬i ®· hoµn thµnh, nÕu kh«ng ta trùc tiÕp ®­a ng­¬i xuÊt quan ®i.")
		messenger_comeback()
	else
		Describe(DescLink_XiaoZhen..": Ng­¬i quyÕt ®Şnh ®i ra ngoµi sao ? nhiÖm vô kh«ng hoµn thµnh nh­ cò cã thÓ trë vÒ tíi, bÊt cø lóc nµo ®Òu ®­îc !",2,"Ta muèn rêi ®i /q_fallmessengertask","§Ó cho ta/no")
	end
end

function q_fallmessengertask()
	local Uworld1207 = nt_getTask(1207)  --ĞÅÊ¹ÈÎÎñµ±Ç°É±¹Ö¼ÇÊıÆ÷
	local Uworld1204 = nt_getTask(1204)  --ËÍĞÅÈÎÎñËùµ½µØµãÈÎÎñ±äÁ¿
	local Uworld1214 = nt_getTask(1214)  --»ñ¾ÈÉÙÅ®¾çÇé
	local name = GetName()
	
		nt_setTask(1203,25)  --Ç§±¦¿âÈÎÎñµÄÈÎÎñ±äÁ¿ÉèÖÃÎª¼òµ¥ÈÎÎñÍê³É×´Ì¬
		nt_setTask(1213,0)  --Ë«±¶¾­ÑéÊ±¼ä
		nt_setTask(1215,0)  --bossË¢¹Ö¿ª¹Ø
		local nRealjifen = 0;
		if ( Uworld1214 ~= 0 ) then
			--¸ù¾İ¾È³öµÄÈËÊı¸øÓè¶ÔÓ¦½±Àø
			if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
				AddOwnExp(50000*Uworld1214)
				local Uworld3000 = nt_getTask(3000)
               			nRealjifen = Uworld1214*16;
				nt_setTask(3000,Uworld1214*16+Uworld3000)
			elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
				AddOwnExp(100000*Uworld1214)
				local Uworld3000 = nt_getTask(3000)
				nRealjifen = Uworld1214*18;
				nt_setTask(3000,Uworld1214*18+Uworld3000)
			elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
				AddOwnExp(150000*Uworld1214)
				local Uworld3000 = nt_getTask(3000)				
                                nRealjifen = Uworld1214*24;
				nt_setTask(3000,Uworld1214*24+Uworld3000)		

			end				 
			nt_setTask(1214,0)
		end
		local nBeishu = greatnight_huang_event(2);--by Ğ¡É½
		if (nBeishu > 0) then--by Ğ¡É½
			nOrgRealjifen = floor(nRealjifen / nBeishu);--by Ğ¡É½
		end;
		tongaward_message(nRealjifen);	--by Ğ¡É½

		nt_setTask(1203,25)  --Ç§±¦¿âÈÎÎñµÄÈÎÎñ±äÁ¿ÉèÖÃÎª¼òµ¥ÈÎÎñÍê³É×´Ì¬

		DisabledUseTownP(0)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬
		nt_setTask(1203,21)--ÔİÊ±ÖĞ¶ÏÈÎÎñ
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1414,3197);
end

function no()
end
