Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\head.lua")

tbVNGWD2011_gardener = {}

function main()
	if tbVNG_WomenDay2011:IsActive() ~= 1 or tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 
	end
	tbVNGWD2011_gardener:MainDialog()	
end

function tbVNGWD2011_gardener:MainDialog()
	if tbVNG_WomenDay2011:IsActive() ~= 1 then
		return
	end
	local tbMainDialog = tbVNGWD2011_NpcHead:CreateDialog()
	tbMainDialog:AddOptEntry("TÆng b¸nh m×", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "TÆng B¸nh M×"})
	tbMainDialog:AddOptEntry("§æi bã hoa hång", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "Hîp thµnh Bã Hoa Hång"})
	tbMainDialog:AddOptEntry("Mua d©y cét hoa", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "Mua D©y Cét Hoa"})
	tbMainDialog:Show()			
end
