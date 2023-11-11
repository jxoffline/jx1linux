Include("\\script\\lib\\composeclass.lua")
if not tbComposeListClass then
	tbComposeListClass = tbBaseClass:new()
end

function tbComposeListClass:_init(szClassName, tbFormulaList)
	
	
	if szClassName == nil or szClassName == "" then
		error("tbComposeListClass:_init param#1 szClassName is nil")
		return 
	end
		
	self.szClassName = szClassName
	
	self.tbFormulaList = tbFormulaList
	
	self:MakeComposeClass()
	setglobal(szClassName, self)
end

function tbComposeListClass:MakeComposeClass()
	if not self.tbFormulaList then
		return 
	end
	self.tbComposeList = {}
	for i, tbFormula in self.tbFormulaList do
		
		local szName = self.szClassName..i
		local tbTemp = tbComposeClass:new(szName, tbFormula, "compose "..tbFormula.tbProduct.szName)
		
		
		tinsert(self.tbComposeList, tbTemp)
	end
end

function tbComposeListClass:MakeOptByProductName(szPreMsg)
	local tbOpt = {}
	for i=1, getn( self.tbComposeList) do
		local tbCompose = self.tbComposeList[i]
		local szOpt = format("%s/#%s:ComposeDailog()", szPreMsg..tbCompose:GetProductName(),tbCompose.szClassName)
		tinsert(tbOpt, szOpt)
	end
	return tbOpt;
end

