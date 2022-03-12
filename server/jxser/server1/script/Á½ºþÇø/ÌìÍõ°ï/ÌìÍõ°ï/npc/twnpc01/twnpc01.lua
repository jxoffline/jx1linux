--description: ÌìÍõ°ïËïµÀÁì¡¡ÌìÍõÈëÃÅÈÎÎñ
--author: yuanlan	
--date: 2003/4/24
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tw = GetTask(3)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld38 == 0) and (GetFaction() ~= "tianwang") and (GetLevel() >= 10) then			-- ¼ÇÃûµÜ×ÓÈÎÎñÆô¶¯
		Say("Muèn trë thµnh ®Ö tö chÝnh thøc cña bæn bang ph¶i cïng nhau ra søc kh¸ng Tèng chèng Kim, bän ta ®­¬ng nhiªn lµ hoan nghªnh v« ®iÖu kiÖn, chØ cÇn ng­¬i®em mét vß r­îu vÒ cho mäi ng­êi cïng uèng, cïng chóc mõng, coi nh­ ng­¬i®· ®­îc nhËp m«n", 2, "TiÕp nhËn nhiÖm vô /Uworld38_get_yes", "VËy th«i ®i/no")
	elseif (Uworld38 == 80) and (HaveItem(90) == 1) then					-- ÓÐÅîÀ³´º£¬ÈÎÎñÍê³É
		Uworld38_prise()
--	elseif (UTask_tw == 5*256+80) then		-- ÎªÌìÍõÈÎÎñ±äÁ¿±»ÒâÍâ¸Ä±äÈÝ´í
--		if (GetSeries() == 0) and (GetFaction() == "tianwang") then	-- Èç¹ûÊÇÌìÍõ°ïÈË£¬ÔòÖÃÎª¸ÕÈë°ï£¬·ñÔòÇåÁã
--			SetTask(3,10*256)
--		else
--			SetTask(3,0)
--		end
	elseif (Uworld38 >= 20) and (Uworld38 < 127) then		-- ÈëÃÅÈÎÎñ½øÐÐÖÐ
		Talk(1,"","Mçi lÇn nghÜ ®Õn r­îu 'Bång lai xu©n' lµ con s©u r­îu trong ng­êi ta l¹i b¾t ®Çu cÊu xÐ ")
	elseif (GetFaction() == "tianwang") then   				--ÒÑ¾­ÈëÃÅ£¬ÉÐÎ´³öÊ¦
		Talk(1,"","H¶o huynh ®Ö! Cã r¶nh chóng ta cïng uèng vµi ly!")
	elseif (UTask_tw ==70*256) then 					--±¾ÃÅ³öÊ¦£¬·ÇÃÅÅÉÄÚ×´Ì¬
		Talk(2,"","Kh«ng sao c¶, mäi ng­êi cïng uèng nµo ","Anh ta,,, rèt cuéc ®· say hay lµ lÇn tr­íc cßn ch­a tØnh chø? ")
	else
		Talk(1,"","Nghe nãi qu¸n r­îc ë <color=Red>Ba L¨ng huyÖn<color> cã b¸n mét lo¹i r­îu gäi lµ <color=Red>Bång Lai Xu©n<color>,®©y qu¶ lµ lo¹i r­îu tiªn phÈm, chØ nghÜ ®Õn lµ muèn uèng ngay!")
	end
end

function Uworld38_get_yes()
	Talk(1,"","Nghe nãi qu¸n r­îc ë <color=Red>Ba L¨ng huyÖn<color> cã b¸n mét lo¹i r­îu gäi lµ <color=Red>Bång Lai Xu©n<color>,®©y qu¶ lµ lo¹i r­îu tiªn phÈm, chØ nghÜ ®Õn lµ muèn uèng ngay!")
	Uworld38 = SetByte(GetTask(38),1,20)
	SetTask(38,Uworld38)
	AddNote("T¹i cöa vµo Thuû tr¹i ë phÝa Nam gÆp T«n §¹o LÜnh, nhËn<color=red>nhiÖm vô Ký danh ®Ö tö<color>, ®Õn huyÖn Ba L¨ng mua r­îu'Liªn Lai Xu©n'. ")
	Msg2Player("T¹i cöa vµo Thuû tr¹i ë phÝa Nam gÆp T«n §¹o LÜnh, nhËn nhiÖm vô Ký danh ®Ö tö, ®Õn huyÖn Ba L¨ng mua r­îu'Liªn Lai Xu©n'. ")
end;

function Uworld38_prise()
	Talk(1,"","Bång Lai Xu©n! Qu¶ thËt lµ h¶o töu! Võa më n¾p ra ®· ngöi thÊy mïi th¬m ngµo ng¹t! Xem ra ng­¬icòng lµ mét ng­êi cã khÝ ph¸ch, mäi ng­êi cïng nhau l­u l¹c giang hå nµo!")
	DelItem(90)
	Uworld38 = SetByte(GetTask(38),1,127)
	SetTask(38,Uworld38)
	i = ReturnRepute(15,19,2)		-- È±Ê¡ÉùÍû£¬×î´óÎÞËðºÄµÈ¼¶£¬Ã¿¼¶µÝ¼õ
	AddRepute(i)
	AddNote("VÒ ®Õn Thiªn V­¬ng ®¶o, ®em Liªn Lai Xu©n giao cho T«n §¹o LÜnh, hoµn thµnh nhiÖm vô Ký danh ®Ö tö. ")
	Msg2Player("VÒ ®Õn Thiªn V­¬ng ®¶o, ®em Liªn Lai Xu©n giao cho T«n §¹o LÜnh, hoµn thµnh nhiÖm vô Ký danh ®Ö tö, Danh väng cña b¹n t¨ng thªm. "..i.."®iÓm.")
end;

function no()
end;
