Include("\\script\\lib\\composeex.lua")

tbComposeListEx = tbBaseClass:new()


function tbComposeListEx:_init(tbFormulaList)
	

	self.tbFormulaList = tbFormulaList
	self:MakeComposeClass()

end

function tbComposeListEx:MakeComposeClass()
	if not self.tbFormulaList then
		return 
	end
	self.tbComposeList = {}
	for i, tbFormula in self.tbFormulaList do
		
		local tbTemp = tbActivityCompose:new(tbFormula, "compose "..tbFormula.tbProduct.szName)
		
		
		tinsert(self.tbComposeList, tbTemp)
	end
end

function tbComposeListEx:MakeOptByProductName(szPreMsg, bIsAskNumber)
	local tbOpt = {}
	for i=1, getn( self.tbComposeList) do
		local tbCompose = self.tbComposeList[i]
		
		local szOptName = szPreMsg..tbCompose:GetProductName()
		local pOptData = 
		{
			szOptName,
			self.ComposeDailog,
			{self, bIsAskNumber}
		}
		tinsert(tbOpt, pOptData)
	end
	return tbOpt;
end


function tbComposeListEx:MakeOptBytbMaterialList(szPreMsg, bIsAskNumber)
	local tbOpt = {}
	for i=1, getn( self.tbComposeList) do
		local tbCompose = self.tbComposeList[i]
		
		local szOptName = szPreMsg..tbCompose:GetProductName()
		
		local pOptData = 
		{
			szOptName,
			self.ComposeDailog,
			{self, bIsAskNumber}
		}
		tinsert(tbOpt, pOptData)
	end
	return tbOpt;
	
end