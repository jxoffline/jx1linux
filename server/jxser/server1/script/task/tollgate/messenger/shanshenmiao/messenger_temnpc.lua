-------------------------------------------------------------------------
-- FileName		:	messenger_temnpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:29:14
-- Desc			:   É½ÉñÃí¹Ø¿¨µÄ³ö¿Ú´¦¶Ô»°npc£¬ÄÉÀ¼Çà³Ç
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\killbosshead.lua") --°üº¬ÁËÍ¼Ïóµ÷ÓÃ
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊı¾İ±í¸ñµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --Ôö¼ÓÍ¬°é¾çÇéÈÎÎñÍê³ÉµÄ¿ØÖÆÅĞ¶Ï
Include("\\script\\activitysys\\g_activity.lua")			--»î¶¯±à¼­Æ÷
Include("\\script\\activitysys\\playerfunlib.lua")		--»î¶¯±à¼­Æ÷

function main()
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()

	if ( messenger_middletime() == 10 ) then
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô Tİn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	else
		if ( Uworld1206 == 0 ) then
			Describe(DescLink_NaLanQingCheng..":"..name..", cã ph¶i ®· qua kh¶o nghiÖm MiÕu S¬n ThÇn kh«ng, muèn rêi khái µh?",3,"§óng! Ta muèn rêi khái/messenger_comeback","Ta ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng muèn tiÕp tôc lµm n÷a/messenger_icantdo","Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")	
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_NaLanQingCheng..": Tİn Sø LÖnh - Méc"..name..", cã ph¶i ®· qua kh¶o nghiÖm MiÕu S¬n ThÇn kh«ng, muèn rêi khái µh?",3,"§óng! Ta muèn rêi khái/messenger_comeback","Ta ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng muèn tiÕp tôc lµm n÷a/messenger_icantdo","Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_NaLanQingCheng..": Tİn sø lÖnh - §ång"..name.."Cã ph¶i ng­¬i ®· tr¶i qua kh¶o nghiÖm MiÕu S¬n ThÇn kh«ng, muèn rêi khái µh?",3,"§óng! Ta muèn rêi khái/messenger_comeback","Ta ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng muèn tiÕp tôc lµm n÷a/messenger_icantdo","Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_NaLanQingCheng..": Tİn sø lÖnh - B¹c"..name.."vÊt v¶ cho ng­¬i qu¸! Cã ph¶i ®· tr¶i qua kh¶o nghiÖm MiÕu S¬n ThÇn kh«ng, muèn rêi khái µh?",3,"§óng! Ta muèn rêi khái/messenger_comeback","Ta ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng muèn tiÕp tôc lµm n÷a/messenger_icantdo","Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_NaLanQingCheng..": Tİn sø lÖnh - Vµng"..name.."Ng­¬i tõ xa tíi vÊt v¶ nhØ, cã ph¶i ®· tr¶i qua kh¶o nghiÖm MiÕu S¬n ThÇn kh«ng, muèn rêi khái µh?",3,"§óng! Ta muèn rêi khái/messenger_comeback","Ta ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng muèn tiÕp tôc lµm n÷a/messenger_icantdo","Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_NaLanQingCheng..": Ngù Tø lÖnh bµi - Vµng"..name.."Tr­íc giê ta ch­a thÊy qua Ngù Tø Kim Bµi bao giê, h«m nay xem nh­ ®­îc më tÇm nh×n! Ng­¬i ®óng lµ lîi h¹i. Cã ph¶i ng­¬i ®· tr¶i qua kh¶o nghiÖm MiÕu S¬n ThÇn kh«ng, muèn rêi khái µh?",3,"§óng! Ta muèn rêi khái/messenger_comeback","Ta ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng muèn tiÕp tôc lµm n÷a/messenger_icantdo","Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")
		end
	end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 2 ) then
		nt_setTask(1202,30)  --É½ÉñÃíÈÎÎñµÄÈÎÎñ±äÁ¿ÉèÖÃÎªÈÎÎñÍê³É×´Ì¬
		nt_setTask(1213,0)  --Ë«±¶¾­ÑéÊ±¼ä
		nt_setTask(1214,0)  --¶¨µã´ò¹Ö¿ª¹Ø
		nt_setTask(1215,0)  --bossË¢¹Ö¿ª¹Ø
		DisabledUseTownP(0)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		taskProcess_002_07:doTaskEntity()
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 2, n_level);
		
		SetPos(1337,3154);
	else
		Describe(DescLink_NaLanQingCheng..": Xin lçi!   b¹n ch­a hoµn thµnh cöa ¶i phİa tr­íc, t¹i b¶n ®å MiÕu S¬n ThÇn b¹n ph¶i h¹ İt nhÊt <color=red>hai tªn §ao Yªu<color> míi tİnh qua ¶i.",1,"KÕt thóc ®èi tho¹i/no")
	end
end

function messenger_icantdo()
	Describe(DescLink_NaLanQingCheng..": Cã ph¶i b¹n muèn rêi khái, nÕu ch­a hoµn thµnh nhiÖm vô mµ rêi khái, b¹n còng cã thÓ ®Õn DŞch Quan giao tr¶ nhiÖm vô vµ nhËn phÇn th­ëng nh­ng phÇn th­ëng sÏ gi¶m xuèng rÊt nhiÒu.",2,"§óng! Ta muèn rêi khái/s_fallmessengertask","§Ó ta nghÜ l¹i xem sao/no")

end

function s_fallmessengertask()
		nt_setTask(1202,25)  --É½ÉñÃíÈÎÎñµÄÈÎÎñ±äÁ¿ÉèÖÃÎª¼òµ¥Íê³É×´Ì¬
		nt_setTask(1213,0)  --Ë«±¶¾­ÑéÊ±¼ä
		nt_setTask(1214,0)  --¶¨µã´ò¹Ö¿ª¹Ø
		nt_setTask(1215,0)  --bossË¢¹Ö¿ª¹Ø
		DisabledUseTownP(0)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1337,3154);
end

function no()
end