Include("\\script\\lib\\awardtemplet.lua")
FunType = {}

function FunType:Give(tbItem, nAwardCount, tbLogTitle)
	if type(tbItem.pFun) == "function" then
		tbItem:pFun((nAwardCount or 1) * (tbItem.nCount or 1), tbLogTitle)
	end
end

tbAwardTemplet:RegType("pFun", FunType)