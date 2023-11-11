--change TKLSV: Ban bac nen - Created by ThanhLD - 20130514
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")

function Sell_item()	
	Say("Chç ta b¸n<color=yellow>  B¹c NÐn <color> víi gi¸ 250 v¹n l­îng 1 c¸i. C¸c h¹ cã muèn mua kh«ng", 
		     2, 
			"Ta mua/BuySillver",       
			"§Ó khi kh¸c/no")
end

function BuySillver ()
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "H·y chõa 1 «  trèng trong hµnh trang" )
		return
	end
	if (GetCash()<2500000) then
		Talk(1, "", "C¸c h¹ kh«ng mang theo ®ñ ng©n l­îng, h·y quay l¹i sau")
		return
	end
	Pay(2500000)
	local tbAward = {szName = "B¹c nÐn", tbProp = {6,1,3036,0,0,0}, nCount = 1}	
	tbAwardTemplet:Give(tbAward, 1, {"TongKimLienServer", "BanBacNentaiNpcHangRong"})	
end

local pEventType = EventSys:GetType("AddNpcOption")
pEventType:Reg("Hµng rong", "Mua B¹c NÐn", Sell_item)



