--ÁúÈª´å Â·ÈË Åí·Å
--ÁúÈª´åĞÂÊÖÈÎÎñ£ºĞŞµ¶
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")
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
	UTask_world19 = GetTask(19)
	if (UTask_world19 == 0) and (GetLevel() >= 2) then 		--ĞŞµ¶ÈÎÎñÆô¶¯
		if (GetSex() == 0) then
			W19_rank = "hËu sinh"
		else
			W19_rank = "C« n­¬ng"
		end
		Talk(2,"W19_get","Bµnh Phãng:"..W19_rank.."cã thÓ gióp t¹i h¹ kh«ng?","Gióp g× ®©y? ")
	elseif (UTask_world19 == 2) and (HaveItem(229) == 0) then
		AddEventItem(229)
		Talk(1,"", 10903)
	elseif (UTask_world19 == 8) and HaveItem(230) then		-- ÈÎÎñÍê³É
		Talk(1,"", 10904)
		DelItem(230)
		SetTask(19,10)
		AddNote("Mang b¶o ®ao ®· söa xong vÒ cho Bµnh Phãng, hoµn thµnh nhiÖm vô ")
		Msg2Player("Mang b¶o ®ao ®· söa xong vÒ cho Bµnh Phãng, hoµn thµnh nhiÖm vô ")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0) then
			AddItem(0, 8, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("NhËn ®­îc Ng­u B× Hé UyÓn ")
		else
			AddItem(0, 8, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("NhËn ®­îc Ng­u B× Hé UyÓn ")
		end
		AddRepute(6)
		Msg2Player("Danh väng cña b¹n t¨ng thªm 6 ®iÓm ")
	else
		Talk(1,"", 10905)
	end
end;

function W19_get()
	Say(10906 ,2,"Gióp ®ì h¾n! /W19_get_yes","Kh«ng cÇn do dù /W19_get_no")
end

function W19_get_yes()
	SetTask(19,2)
	AddEventItem(229)
	Talk(1,"", 10907)
	AddNote("TiÕp nhËn nhiÖm vô: Gióp Bµnh Phãng mang ®ao ®i söa ")
	Msg2Player("TiÕp nhËn nhiÖm vô: Gióp Bµnh Phãng mang ®ao ®i söa ")
end

function W19_get_no()
end
