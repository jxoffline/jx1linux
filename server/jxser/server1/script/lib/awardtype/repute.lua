Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\awardtype\\simple.lua")
ReputeType = SimpleType:new("nRepute")
ReputeType.pFun = AddRepute
ReputeType.szMsgFormat = "ßi”m Danh V‰ng t®ng cao %d"
ReputeType:Reg()