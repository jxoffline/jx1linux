Include("\\script\\vng_event\\LunarYear2011\\vng_ly2011_head.lua")
Include("\\script\\item\\ib\\shenxingfu.lua")

function main()
	if tbVNG_LY2011:isActive() == 0 then
		return
	end
	local tbMainDiaglog = 
		{
			"ThiÕu L©m Ph¸i/#visitMaster(2)",
			"Thiªn V­¬ng Bang/#visitMaster(1)",
			"§­êng M«n/#visitMaster(3)",
			"Ngò §éc Gi¸o/#visitMaster(4)",
			"Nga My Ph¸i/#visitMaster(5)",
			"Thóy Yªn M«n/#visitMaster(6)",
			"C¸i Bang/#visitMaster(8)",
			"Thiªn NhÉn Gi¸o/#visitMaster(7)",
			"Vâ §ang Ph¸i/#visitMaster(9)",
			"C«n L«n Ph¸i/#visitMaster(10)",
			"§ãng/onCancel"
		}
	Say("Tèn 10 v¹n l­îng ta sÏ ®­a ng­¬i ®i gÆp tr­ëng m«n c¸c ph¸i.", getn(tbMainDiaglog), tbMainDiaglog)
end
function visitMaster(nFactionID)
--Msg2Player(nFactionID)
	if (GetCash() < 100000) then
		Talk(1, "", "H×nh nh­ ng­¬i kh«ng mang theo tiÒn!")
		return
	end
--	local tbFactionList = 
--		{
--			["shaolin"] = 2,
--			["tianwang"] = 1,
--			["tangmen"] = 3,
--			["wudu"] = 4,
--			["emei"] = 5,
--			["cuiyan"] = 6,
--			["gaibang"] = 8,
--			["tianren"] = 7,
--			["wudang"] = 9,
--			["kunlun"] = 10,
--		}
--	local strFaction = GetFaction()
--	if tbFactionList[strFaction] ~= nill then
		if Pay(100000) == 1 then
			gopos_step3(9, nFactionID)
		end
--	else
--		Talk(1, "", "Ng­¬i vÉn ch­a nhËp ph¸i!")
--	end
end
function onCancel()
end