Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
DATE_START	= 20111124
DATE_END	= 20111201
tbVnShop = {}
tbVnShop.tbFormula = 
{
	szComposeTitle = "Mua h¹t gièng hoa hång",
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
	tbMaterial = 
		{
			{szName="Ng©n l­îng",nJxb=300000, nCount = 1},
		},
	tbProduct = {szName = "H¹t gièng hoa hång", tbProp = {6,1,30156,1,0,0}, nExpiredTime = 20111201},
}

function tbVnShop:Main()
	if self.IsAcitve() == 1 then
		self:ComposeItem()
	else
		Talk(1, "", "HiÖn t¹i ta kh«ng cßn h¹t gièng hoa hång nµo c¶, xin ®¹i hiÖp thø lçi!")
	end	
end

function tbVnShop:ComposeItem()
	pCompos = tbActivityCompose:new(self.tbFormula, "MuaHatGiongHoaHong");
	pCompos:ComposeDailog(1);
end

function tbVnShop:IsAcitve()
	local now = tonumber(date("%Y%m%d"));
	if (now >= DATE_END or now < DATE_START) then
		return 0;
	end
	return 1;	
end

local pEventType = EventSys:GetType("AddNpcOption")
if tbVnShop:IsAcitve() == 1 then
	nId = pEventType:Reg("Hµng rong", "Mua h¹t gièng hoa hång", tbVnShop.Main,{tbVnShop})
end	