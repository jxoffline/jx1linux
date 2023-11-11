Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\vng_event\\ngusackettinh\\npc\\nskt_compose_item.lua")

tbNSKT_gongnv = {}

function tbNSKT_gongnv:addDialog(tbDialog)
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"));
	if ((nCurDay >= tbNSKT_head.nStartDay) and (nCurDay < tbNSKT_head.nItemExpiredTime)) then
		tbDialog:AddOptEntry("Ho¹t ®éng Ngò Th¸i KÕt Tinh",tbNSKT_gongnv.main,{tbNSKT_gongnv})
	end			
end

function tbNSKT_gongnv:main()	
	local tbMainDialog = 	self:createDiaglog()
	tbMainDialog.szTitleMsg = "Mïa ®«ng ®Õn råi mµ ta ch­a kÞp chuÈn bÞ g×, hiÖn ta ®ang cÇn mét c©y th«ng ®Ó trang hoµng ®ªm gi¸ng sinh, nÕu ng­¬i gióp ®­îc ta, ta sÏ cã mãn quµ dµnh cho ng­¬i"
	if (tbNSKT_head:isActive() == 1)then
		tbMainDialog:AddOptEntry("Giíi thiÖu ho¹t ®éng", tbNSKT_gongnv.description, {tbNSKT_gongnv})
		tbMainDialog:AddOptEntry("Hîp thµnh kÕt tinh", tbNSKT_gongnv.crystalCompose, {tbNSKT_gongnv})
	end	
	tbMainDialog:AddOptEntry("Ho¹t ®éng ng«i sao may m¾n", tbNSKT_gongnv.luckyStarActivity, {tbNSKT_gongnv})
	tbMainDialog:AddOptEntry("§æi ngùa Phiªn Vò", tbNSKT_gongnv.horseAward, {tbNSKT_gongnv})
	tbMainDialog:Show()			
end

function tbNSKT_gongnv:description()	
	local tbDescDialog =	self:createDiaglog()
	tbDescDialog.szTitleMsg = "Gi¸ng sinh s¾p ®Õn råi, mäi ng­êi ®ang tÊt bËt chuÈn bÞ, sao c¸c h¹n cßn ë ®©y?. H·y  xem c¸ch thøc tham gia ë trang chñ nhÐ!"
	tbDescDialog:AddOptEntry("Trë l¹i", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbDescDialog:Show()
end

function tbNSKT_gongnv:crystalCompose()
	local tbComposeDialog =	self:createDiaglog()
	tbComposeDialog.szTitleMsg = "KÕt tinh thËt ®Ñp, d­êng nh­ chóng còng Èn chøa nhiÒu bÊt ngê."
	tbComposeDialog:AddOptEntry("Tam s¾c kÕt tinh", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"KÕt Tinh Tam S¾c"})
	tbComposeDialog:AddOptEntry("Tø s¾c kÕt tinh", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"KÕt Tinh Tø S¾c"})
	tbComposeDialog:AddOptEntry("Ngò s¾c kÕt tinh", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"KÕt Tinh Ngò S¾c"})
	tbComposeDialog:AddOptEntry("Trë l¹i", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbComposeDialog:Show()	
end

function tbNSKT_gongnv:luckyStarActivity()
	local tbStarActDialog =	self:createDiaglog()
	tbStarActDialog.szTitleMsg = "C©y th«ng gi¸ng sinh thËt ®Ñp, ng­¬i tÆng ta sao?"
	tbStarActDialog:AddOptEntry("TÆng", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"Ng«i Sao"})
	tbStarActDialog:AddOptEntry("Trë l¹i", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbStarActDialog:Show()	
end

function tbNSKT_gongnv:horseAward()
	local tbHorseAwardDialog =	self:createDiaglog()
	tbHorseAwardDialog.szTitleMsg = "Cã 2 c¸ch ®æi Phiªn Vò:<enter>Phiªn Vò h¹n sö dông 6 th¸ng : <color=red>60<color> lÖnh bµi<enter>Phiªn Vò kh«ng h¹n sö dông: <color=red>200<color> lÖnh bµi"	
	tbHorseAwardDialog:AddOptEntry("§æi Phiªn Vò cã h¹n sö dông", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"Phiªn Vò"})
	tbHorseAwardDialog:AddOptEntry("§æi Phiªn Vò kh«ng h¹n sö dông", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"Phiªn Vò Kh«ng H¹n Sö Dông"})
	tbHorseAwardDialog:AddOptEntry("Trë l¹i", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbHorseAwardDialog:Show()		
end

function tbNSKT_gongnv:createDiaglog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	return DailogClass:new(szNpcName)
end

function tbNSKT_gongnv:onCancel()
end