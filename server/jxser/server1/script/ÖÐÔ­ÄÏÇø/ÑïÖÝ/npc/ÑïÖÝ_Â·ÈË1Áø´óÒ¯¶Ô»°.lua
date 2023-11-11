-- ÑïÖİ Â·ÈËNPC Áø´óÒ¯£¨Ø¤°ïÈëÃÅÈÎÎñ£©
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
	if (Uworld30 == 10) and (HaveItem(72) == 0) then		--ÈëÃÅÈÎÎñÖĞ²¢ÇÒÃ»ÓĞ¸ÃÎïÆ·
		Say("Ph¶i khen thÕ nµo ®©y?",4,"Tµi phóc /prise_1","Con ch¸u. /prise_2","c«ng danh /prise_3","Rêi khái/prise_exit")
	else					--ÔÚÆÕÍ¨¶Ô»°ÖĞ¸øÒ»µãµãÈÎÎñÌáÊ¾¡£
		i = random(0,2)
		if (i == 0) then
			Talk(1,""," Sèng trªn ®êi, cÇn ph¶i cã lßng tõ t©m!")
		elseif (i == 1) then
			Talk(1,"","Ha!Ha! Kh«ng sai! Kh«ng sai! Ta b×nh sinh mÆc dï kham khæ,nh­ng b©y giê th× khæ tËn cam lai,con ch¸u l¹i rÊt hiÕu thuËn. Ta ®· cã thÓ tù hµo víi tæ t«ng cña m×nh råi!")
		else
			Talk(1,"","C¶ ®êi ta chØ ®eo ®uæi mét giÊc méng nµy th«i! Ha! Ha! Xem ra ta lµ ng­êi h¹nh phóc nhÊt trªn ®êi")
		end
	end
end

function prise_1()
	Talk(2,"","L·o gia nµy, võa nh×n ®· biÕt ng­êi giµu cã, gia tµi v¹n quan!","Kh«ng sai kh«ng sai! Tuy ta ¨n mÆc kh«ng thiÕu, nh­ng gia c¶nh chØ b×nh th­êng, ®iÒu vui nhÊt lµ con ch¸u rÊt hiÕu thuËn")
end

function prise_2()
	Talk(4,"","L·o gia, võa nh×n ta ®· biÕt «ng lµ ng­êi giµu cã, nhÊt ®Şnh lµ dßng dâi danh gia","Ha!Ha! Kh«ng sai! Kh«ng sai! Ta b×nh sinh mÆc dï kham khæ, nh­ng b©y giê th× khæ tËn cam lai,con ch¸u l¹i rÊt hiÕu thuËn. Ta ®· cã thÓ tù hµo víi tæ t«ng cña m×nh råi!","L·o gia! cã thÓ cho ta 1 sîi r©u cña «ng kh«ng?","Th»ng nhá nµy thËt lµ kú qu¸i! Muèn xin mét sîi r©u cña ta ®Ó lµm g×? Nh­ng mµ dï sao th× ng­¬i còng cã duyªn víi ta ®ã! §­îc! Ta tÆng ng­¬i mét sîi r©u!")
	AddEventItem(72)
	Msg2Player("Cã sîi r©u tõ chç l·o giµ. ")
	AddNote("B¹n cã mét sîi r©u ")
end

function prise_3()
	Talk(2,"","VŞ l·o gia nµy võa nh×n ®· biÕt häc thøc uyªn th©m! Thêi trai trÎ ®· häc qu¸ cao trung råi!","Ta vèn kh«ng mµng ch÷ nghÜa, tr­íc giê ch­a ®Ó m¾t ®Õn c«ng danh, ng­êi khen qu¸ lµm ta ng¹i!")
end

function prise_exit()
end
