Include("\\script\\missions\\dangboss\\npcdailog.lua")

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
--[DinhHQ]
	--[20101216]:event ngu thai ket tinh
	Include("\\script\\vng_event\\ngusackettinh\\npc\\nskt_gongnv.lua")
	--[20110225]: 8/3/2011
	Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\gongnv.lua")
	Include("\\script\\vng_feature\\top10\\vngtop10.lua")
function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	--[DinhHQ]
	--[20101216]:event ngu thai ket tinh
	if ( tbNSKT_gongnv) then
		tbNSKT_gongnv:addDialog(tbDailog)
	end
	--[20110225]: 8/3/2011
	tbVNGWD2011_GongNV:addDialog(tbDailog)

	if tbTop10:IsActive() == 1 then
		tbDailog:AddOptEntry("Danh s¸ch thËp ®¹i cao thñ", tbTop10.MainDialog, {tbTop10})
	end	
	--end [DinhHQ]
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	tbDailog:AddOptEntry("Ho¹t ®éng ®Êu ng­u", tbDangBossDailog.Main, {tbDangBossDailog})
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog:Show()

end

function OnCancel()
	
end