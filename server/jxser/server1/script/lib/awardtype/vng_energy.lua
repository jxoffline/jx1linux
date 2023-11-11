Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\awardtype\\simple.lua")
VngEnergyType = SimpleType:new("nVngEnergy")
VngEnergyType.pFun = AddEnergy
VngEnergyType.szMsgFormat = "NhËn ®­îc %d ®iÓm tinh lùc"
VngEnergyType:Reg()