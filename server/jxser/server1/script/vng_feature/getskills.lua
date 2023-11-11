--½­ºþºÀÏÀÀñ°üµÀ¾ß½Å±¾
--2012.09

Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\lib\\log.lua")
--Include("\\script\\misc\\eventsys\\type\\npc.lua")
tbFaction = 
{
	["emei"] = 1,
	["tangmen"]   = 2,
	["tianwang"] = 3,
	["tianren"] = 4,
	["wudang"] = 5,
	["cuiyan"] = 6,
	["shaolin"] = 7,
	["gaibang"]   = 8,
	["kunlun"] = 9,
	["wudu"] = 10,
}

function SetSkills(szFaction)
	--Thªm kü n¨ng, thªm danh hiÖu
	if szFaction == "emei" then
		for i=1,7 do add_em(i*10) end
		--X­ng hiÖu m«n ph¸i
		SetRank(64)

	elseif szFaction == "tangmen" then
		for i=1,7 do add_tm(i*10) end
		--X­ng hiÖu m«n ph¸i
		SetRank(76)

	elseif szFaction == "tianwang" then
		for i=1,7 do add_tw(i*10) end
		--X­ng hiÖu m«n ph¸i
		SetRank(69)
	elseif szFaction == "tianren" then
		for i=1,7 do add_tr(i*10) end
		--X­ng hiÖu m«n ph¸i
		SetRank(81)

	elseif szFaction == "wudang" then
		for i=1,7 do add_wd(i*10) end
		--X­ng hiÖu m«n ph¸i
		SetRank(73)

	elseif szFaction == "cuiyan" then
		for i=1,7 do add_cy(i*10) end
		--X­ng hiÖu m«n ph¸i
		SetRank(67)

	elseif szFaction == "shaolin" then
		for i=1,7 do add_sl(i*10) end
		--X­ng hiÖu m«n ph¸i
		SetRank(72)

	elseif szFaction == "gaibang" then
		for i=1,7 do add_gb(i*10) end
		--X­ng hiÖu m«n ph¸i
		SetRank(78)

	elseif szFaction == "kunlun" then
		for i=1,7 do add_kl(i*10) end
		--X­ng hiÖu m«n ph¸i
		SetRank(75)

	elseif szFaction == "wudu" then
		for i=1,7 do add_wu(i*10) end
		--X­ng hiÖu m«n ph¸i
		SetRank(80)

	else
		Msg2Player("Kh«ng cã m«n ph¸i kh«ng thÓ sö dông")
		return nil
	end

	--TÈy ®iÓm, häc khinh c«ng
	local nDodgePoint = HaveMagic(210)		-- Khinh c«ng, thao t¸c kh¸c
	local nRollBackPoint = RollbackSkill()

	local nAddPoint = 0
	if(nDodgePoint ~= -1) then
		nAddPoint = nRollBackPoint - nDodgePoint
	else
		nAddPoint = nRollBackPoint
		AddMagic(210,1)
	end

	AddMagicPoint(nAddPoint)
	if (nDodgePoint ~= -1) then AddMagic(210,nDodgePoint) end			-- NÕu ®· häc qua khinh c«ng ph¶i trë vÒ ®¼ng cÊp tr­íc ®ã
end

--ThiÕt ®Æt hµm sè biÕn l­îng liªn quan
function SetAllTasks(szFaction)
	--ThiÕt ®Æt tr¹ng th¸i nhiÖm vô m«n ph¸i
	SetTask(tbFaction[szFaction], 70*256)
	--ThiÕt ®Æt biÕn l­îng nhiÖm vô khinh c«ng
	SetTask(32,80)
end

--Cho hµm sè liªn quan ®Õn phÇn th­ëng
function GiveAllAwards(szFaction)
	--Cho s¸ch kü n¨ng 90
	--PlayerFunLib:GetItem({tbProp={6,1,2426,1,0,0}, nBindState = -2,},1,"[½­ºþºÀÏÀÀñ°ü]Ê¹ÓÃÀñ°ü¸øÓèÎïÆ·")



	--Cho danh väng
	--AddRepute(570)
	--Cho ®iÓm l·nh ®¹o
	--AddLeadExp(2222000)
	
	--Cho kü n¨ng, tÈy ®iÓm
	SetSkills(szFaction)

	--thiÕt ®Æt m«n ph¸i, trËn doanh liªn quan
	SetFaction("")
	SetCamp(4)
end

-- NhËp hµm sè item
function VnGetSkill_main()

	local szFaction = GetFaction()

	--Ph¸n ®o¸n ®· trïng sinh hay ch­a
--	if ST_IsTransLife() == 1 then
--		Msg2Player(format("ChØ cã ®¹i hiÖp ch­a trïng sinh míi ®­îc phÐp nhËn kü n¨ng"))
--		return 1
--	end
	
	if GetLevel() < 120 then
		Msg2Player("§¼ng cÊp kh«ng ®ñ, cÇn ph¶i trªn 120 míi ®­îc phÐp nhËn kü n¨ng.")
		return
	end
	
	--Ph¸n ®o¸n lµ ®· xuÊt s­ hay ch­a
	if tbFaction[szFaction] == nil or GetTask(tbFaction[szFaction]) >= 70*256 then
		Msg2Player(format("ChØ cã ®¹i hiÖp ch­a xuÊt s­ míi ®­îc nhËn kü n¨ng"))
		return 1
	end

	--Ph¸n ®o¸n BÝ TuyÒn Chi Thñy
--	if CalcItemCount(-1, 6, 1, 2427, -1) < 5 then
--		Msg2Player(format("CÇn ph¶i cã 5 c¸i BÝ TuyÒn Chi Thñy míi më ®­îc lÔ bao nµy"))
--		return 1
--	end
	
	
	--Ph¸n ®o¸n kh«ng gian hµnh trang
--    if PlayerFunLib:CheckFreeBagCell(34,"Hµnh trang cña ®¹i hiÖp kh«ng ®ñ chç trèng , cÇn ph¶i cã 34 « trèng (trong ®ã Ýt nhÊt ph¶i cã 1 kho¶ng trèng 2*3)") ~= 1 
--	   or PlayerFunLib:CheckFreeBagCellWH(2, 3, 1, "default") ~= 1 then
--	   
--	   return 1;
--    	end
	
	--if ConsumeItem(-1, 5, 6, 1, 2427, -1) == 1 then
		%SetAllTasks(szFaction)
		%GiveAllAwards(szFaction)
		tbLog:PlayerActionLog("NhanKyNang","NhanKyNangThanhCong")
		--Hoµn thµnh tÊt c¶ thao t¸c, ®¸ ng­êi ch¬i ra khái trß ch¬i
		KickOutPlayer(GetName())

		--return nil
	--end

	--Msg2Player("Më lÔ bao thÊt b¹i.")
	--return 1	
end

--pEventType:Reg("ChiÕn T©m T«n Gi¶", "NhËn kü n¨ng cÊp 10 ®Õn 60", VnGetSkill_main)