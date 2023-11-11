Include("\\script\\vng_event\\LunarYear2011\\vng_ly2011_head.lua")
Include("\\script\\lib\\awardtemplet.lua")

if not tbMasterGift then
	tbMasterGift = {}
end	
tbMasterGift.TSK_DAY_LIMIT = 2760

function tbMasterGift:addDialog(tbDialog, strFaction)
	if tbVNG_LY2011:isActive() ~= 1 then
		return
	end
	tbDialog:AddOptEntry("TÆng b¸nh ngµy xu©n", tbMasterGift.getGift, {tbMasterGift, strFaction})
end

function tbMasterGift:getGift(strFaction)
	if tbVNG_LY2011:checkCondition() ~= 1 then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn sö dông vËt phÈm! Yªu cÇu cÊp ®é trªn 50 vµ ®·  n¹p thÎ.")
		return
	end
--	local tbFactionList = 
--		{
--			["shaolin"] = "ThiÕu L©m",
--			["tianwang"] = "Thiªn V­¬ng Bang",
--			["tangmen"] = "§­êng M«n",
--			["wudu"] = "Ngò §éc Gi¸o",
--			["emei"] = "Nga My",
--			["cuiyan"] = "Thóy Yªn M«n",
--			["gaibang"] = "C¸i Bang",
--			["tianren"] = "Thiªn NhÉn Gi¸o",
--			["wudang"] = "Vâ §ang",
--			["kunlun"] = "C«n L«n",
--		}
--	if GetFaction() ~= strFaction then
--		Talk(1, "", format("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña <color=red>%s<color>, mãn quµ nµy ta kh«ng d¸m nhËn. H·y ®em vÒ cho s­ phô cña ng­¬i ®i.", tbFactionList[strFaction]))
--		return
--	end
	if CalcItemCount(-1, 6, 1, 30089, -1) < 1 then
		Talk(1, "", "Con nãi tÆng quµ cho ta, sao ta kh«ng thÊy?")
		return
	end
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"))
	if GetTask(self.TSK_DAY_LIMIT) >= nCurDay then
		Talk(1, "", "Con thËt cã lßng nh­ng h«m nay con ®·  tÆng quµ cho ta råi, h·y gi÷ l¹i mµ dïng.")
		return
	end	
	if ConsumeEquiproomItem(1, 6, 1, 30089, 1) == 1 then
		SetTask(self.TSK_DAY_LIMIT, nCurDay)
		local tbExp = {nExp=10000000}
		tbAwardTemplet:GiveAwardByList(tbExp, "[VNG][Lunar Year 2011][TÆng b¸nh cho ch­ëng m«n]")
		Talk(2, "", "B¸nh thËt th¬m ngon. C¶m ¬n con vµ chóc con n¨m míi gÆp nhiÒu ®iÒu tèt lµnh.", "§a t¹ s­ phô.")
	end
end