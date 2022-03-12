-- À¥ÂØ µÜ×Ó Í¯Ï¦ÑÕ ÈëÃÅÈÎÎñ
-- by£ºDan_Deng(2003-07-30)
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
	UTask_kl = GetTask(9)
	Uworld31 = GetByte(GetTask(31),2)
	if (Uworld31 == 10) then
		if (HaveItem(8) == 1) then
			Talk(2,"Uworld31_get_Monkey","TiÓu th­! Con Kim T¬ HÇu nµy dÔ th­¬ng qu¸! TÆng cho c« ®Êy!","Tõ giê ®· cã ng­êi ch¬i víi ta råi! Hihi! DÔ th­¬ng qu¸! Ta mang cho cha ta xem!")
		else
			Talk(1,"","B¾t khØ cã dÔ kh«ng?")
		end
	elseif (Uworld31 == 0) and (GetFaction() ~= "kunlun") and (GetLevel() >= 10) then		--ÈëÃÅÈÎÎñ
		Say("Ta tõ bĞ ®Õn lín vÉn ch­a ra khái C«n L«n, cha ta nãi ng­êi bªn ngoµi rÊt xÊu, kh«ng cho ta qua l¹i víi nh÷ng ng­êi ®ã! Ta c« ®¬n ®Õn chÕt ®­îc! Nghe nãi rõng 'Kho¸i Ho¹t' cã rÊt nhiÒu khØ, nÕu cã ®­îc 1 con Kim t¬ hÇu ch¬i víi ta th× tèt biÕt chõng nµo! Ng­¬i cã thÓ b¾t cho ta 1 con kh«ng",2,"Kh«ng thµnh vÊn ®Ò!/enroll_get_yes","Ta cã thÓ kh«ng cã thêi gian ®i b¾t khØ /enroll_get_no")
	elseif (Uworld31 >= 20) then
		Talk(1,"","Kim T¬ hÇu thùc lµ dÔ th­¬ng! Ta rÊt thİch nã!")
	else
		Talk(1,"","ThÕ giíi bªn ngoµi nh­ thÕ nµo nhØ?")
	end
end;

function Uworld31_get_Monkey()
	DelItem(8)
	Uworld31 = SetByte(GetTask(31),2,20)
	SetTask(31,Uworld31)
	Msg2Player("§ång TŞch Nhan rÊt thİch nhËn con Kim T¬ HÇu mµ b¹n ®· b¾t ®­îc. ")
	AddNote("§ång TŞch Nhan rÊt thİch nhËn con Kim T¬ HÇu mµ b¹n ®· b¾t ®­îc. ")
end

function enroll_get_yes()
	Talk(1,"","B¾t 1 con khØ cã g× lµ khã! Ta sÏ ®i b¾t ®©y!")
	Uworld31 = SetByte(GetTask(31),2,10)
	SetTask(31,Uworld31)
	Msg2Player("NhËn nhiÖm vô: Gióp §ång TŞch Nhan ®Õn Kho¸i Ho¹t l©m b¾t 1 con Kim T¬ HÇu ")
	AddNote("NhËn nhiÖm vô: Gióp §ång TŞch Nhan ®Õn Kho¸i Ho¹t l©m b¾t 1 con Kim T¬ HÇu ")
end;

function enroll_get_no()
end;
