-------------------------------------------------------------------------
-- FileName		:	enemy_flynpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-07 10:23:14
-- Desc			:   ·çÖ®Æï¹Ø¿¨µÄ³ö¿Ú´¦¶Ô»°npc£¬·çÖ®Æï½«°×Òí
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀµ
Include("\\script\\task\\tollgate\\killbosshead.lua") --°üº¬ÁËÍ¼Ïóµ÷ÓÃ
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊı¾İ±í¸ñµÄÀµ
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --Ôö¼ÓÍ¬°é¾çÇéÈÎÎñÍê³ÉµÄ¿ØÖÆÅĞ¶Ï
Include("\\script\\activitysys\\g_activity.lua")			--»î¶¯±µ¼­Æ÷
Include("\\script\\activitysys\\playerfunlib.lua")		--»î¶¯±µ¼­Æ÷

function main()
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	
	if ( messenger_middletime() == 10 ) then 
               Msg2Player("ThËt xin lçi ! "..name.."! ng­¬i ®· kh«ng cßn thêi gian nhiÖm vô tİn sø, nhiÖm vô thÊt b¹i !.") 
               losemessengertask() 
       else 
            if ( Uworld1206 == 0 ) then 
                Describe(DescLink_BaiYi..":"..name..", Ng­¬i kh«ng ph¶i lµ ®· xuyªn qua phong kş khiªu chiÕn sao ? NghÜ ra quan a ?",3,"Ta muèn rêi ®i/messenger_comeback","Ta vÉn ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng thÓ tiÕp tôc lµm/messenger_icantdo","Kh«ng ph¶i, ta cßn muèn tiÕp tôc lµm/no") 
            elseif ( Uworld1206 == 1 ) then 
                Describe(DescLink_BaiYi..": Tİn sø lÖnh - méc "..name..", ng­¬i kh«ng ph¶i lµ ®· xuyªn qua phong kş khiªu chiÕn sao ? NghÜ ra quan a ?",3,"Ta muèn rêi ®i /messenger_comeback","Ta kh«ng hoµn thµnh kh¶o nghiÖm, nh­ng lµ kh«ng muèn tiÕp tôc lµm /messenger_icantdo","Kh«ng ph¶i lµ, ta cßn muèn tiÕp tôc/no") 
            elseif ( Uworld1206 == 2 ) then 
                Describe(DescLink_BaiYi..": Tİn sø lÖnh - ®ång "..name.." ®¹i nh©n, cã ph¶i hay kh«ng ng­¬i ®· qua liÔu phong kş ®İch khiªu chiÕn ? NghÜ ra quan ph¶i kh«ng ?",3,"Ta muèn rêi ®i /messenger_comeback","Ta kh«ng hoµn thµnh kh¶o nghiÖm, nh­ng lµ kh«ng muèn tiÕp tôc lµm /messenger_icantdo","Kh«ng ph¶i lµ , ta cßn muèn tiÕp tôc /no") 
            elseif ( Uworld1206 == 3 ) then 
                Describe(DescLink_BaiYi..": Tİn sø lÖnh - ng©n "..name.." ®¹i nh©n, cã ph¶i hay kh«ng ng­¬i ®· qua liÔu phong kş ®İch khiªu chiÕn ? NghÜ ra quan ph¶i kh«ng ?",3,"Ta muèn rêi ®i /messenger_comeback","Ta kh«ng hoµn thµnh kh¶o nghiÖm, nh­ng lµ kh«ng muèn tiÕp tôc lµm /messenger_icantdo","Kh«ng ph¶i lµ , ta cßn muèn tiÕp tôc /no") 
            elseif ( Uworld1206 == 4 ) then 
                Describe(DescLink_BaiYi..": Tİn sø lÖnh - kim "..name.." ®¹i nh©n, cã ph¶i hay kh«ng ng­¬i ®· qua liÔu phong kş ®İch khiªu chiÕn ? NghÜ ra quan ph¶i kh«ng ?",3,"Ta muèn rêi ®i /messenger_comeback","Ta kh«ng hoµn thµnh kh¶o nghiÖm, nh­ng lµ kh«ng muèn tiÕp tôc lµm /messenger_icantdo","Kh«ng ph¶i lµ , ta cßn muèn tiÕp tôc /no") 
            elseif ( Uworld1206 == 5 ) then 
                Describe(DescLink_BaiYi..": Ngù tø kim bµi - kim "..name.." ®¹i nh©n, ta ch­a thÊy qua ngù tø kim bµi, h«m nay coi nh­ lµ më réng ra nh·n giíi. Ng­¬i thËt lµ lîi h¹i. Ng­¬i ®· qua liÔu phong kş ®İch khiªu chiÕn, nghÜ ra quan ph¶i kh«ng ?",3,"Ta muèn rêi ®i /messenger_comeback","Ta kh«ng hoµn thµnh kh¶o nghiÖm, nh­ng lµ kh«ng muèn tiÕp tôc lµm /messenger_icantdo","Ta cßn muèn tiÕp tôc /no") 
            end 
       end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 5 ) then
		nt_setTask(1201,30)  --·çÖ®ÆïÈÎÎñµÄÈÎÎñ±äÁ¿ÉèÖÃÎªÈÎÎñÍê³É×´Ì¬
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
		taskProcess_002_06:doTaskEntity()  --Í¬°é¾çÇéÈÎÎñ
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 1, n_level);
		
		SetPos(1563,3118);
	else
		Describe(DescLink_BaiYi..": ThËt xin lçi, ng­¬i kh«ng v­ît qua kiÓm tra, ë phong kş trªn b¶n ®å İt nhÊt ng­¬i muèn x¸c ®Şnh <color=red>5 c¸i täa ®é<color> míi cã thÓ v­ît qua kiÓm tra.",1,"KÕt thóc ®èi tho¹i /no")
	end
end

function messenger_icantdo()
	    Describe(DescLink_BaiYi..": Ng­¬i nghÜ rêi ®i ph¶i kh«ng ? NÕu nh­ kh«ng hoµn thµnh nhiÖm vô liÒn rêi ®i, ng­¬i còng cã thÓ ®Õn dŞch quan n¬i ®ã ®ãng nhiÖm vô cïng nhËn th­ëng, nh­ng lµ, phÇn th­ëng sÏ İt ®i rÊt nhiÒu. ",2,"Ta muèn rêi ®i /f_fallmessengertask","§Ó cho ta muèn /no")
end

function f_fallmessengertask()	
		nt_setTask(1201,25)  --·çÖ®ÆïÈÎÎñµÄÈÎÎñ±äÁ¿ÉèÖÃÎª¼òµ¥ÈÎÎñÍê³É×´Ì¬
		nt_setTask(1213,0)  --Ë«±¶¾­ÑéÊ±¼ä
		nt_setTask(1214,0)  --¶¨µã´ò¹Ö¿ª¹Ø
		nt_setTask(1215,0)  --bossË¢¹Ö¿ª¹Ø
		nt_setTask(1211,0)
		DisabledUseTownP(0)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1563,3118);
end


function no()
end
