Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\awardtype\\simple.lua")
VngEnergyType = SimpleType:new("nVngContribute")
VngEnergyType.pFun = function(nAmount)
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(nAmount)		
	end
end
VngEnergyType.szMsgFormat = "NhËn ®­îc %d ®iÓm cèng hiÕn bang héi"
VngEnergyType:Reg()