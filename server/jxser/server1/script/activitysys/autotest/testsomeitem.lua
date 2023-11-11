Include("\\script\\lib\\unittest.lua")






tbItemList = 
{
	["Méc ChÕ B¶o H¹p"] = {tbProp={6,1,2318,1,0,0},},
	["§ång ChÕ B¶o H¹p"] = {tbProp={6,1,2319,1,0,0},},
	["Ng©n ChÕ B¶o H¹p"] = {tbProp={6,1,2320,1,0,0},},
	["Hoµng Kim B¶o r­¬ng"] = {tbProp={6,1,2321,1,0,0},},
	["B¶o r­¬ng B¹ch Kim"] = {tbProp={6,1,2322,1,0,0},},
	["B¶o r­¬ng thÇn bÝ cña D· TÈu"] = {tbProp={6,1,2374,1,0,0},},
	["C«ng Thµnh ChiÕn LÔ Bao"] = {tbProp={6,1,2377,1,0,0},},
	["ChÝ T«n BÝ B¶o"] = {tbProp={6,1,2375,1,0,0},},
	["Tµi B¶o Thñy TÆc"] = {tbProp={6,1,2376,1,0,0},},
	["Phong Háa CÈm Nang"] = {tbProp={6,1,2373,1,0,0},},
	
}

tbRequireList = 
{
	["Méc ChÕ B¶o H¹p"] = {nMinCell = 1, },
	["§ång ChÕ B¶o H¹p"] = {nMinCell = 1, },
	["Ng©n ChÕ B¶o H¹p"] = {nMinCell = 1, },
	["Hoµng Kim B¶o r­¬ng"] = {nMinCell = 1, },
	["B¶o r­¬ng B¹ch Kim"] = {nMinCell = 1, },
	["B¶o r­¬ng thÇn bÝ cña D· TÈu"] = 
	{
		nMinCell = 1, 
		tbItem = {tbProp={6,1,2348,1,-1,0}, nCount = 6},
	},
	["C«ng Thµnh ChiÕn LÔ Bao"] = {nMinCell = 1, },
	["ChÝ T«n BÝ B¶o"] = 
	{
		nMinCell = 1, 
		tbItem = {tbProp={6,1,2348,1,-1,0}, nCount = 12},
	},
	["Tµi B¶o Thñy TÆc"] = {nMinCell = 1},
	["Phong Háa CÈm Nang"] = {nMinCell = 1,},

	
}

local tbTestAward = {}

function tbTestAward:GiveAwardByList(tbItem, szLogTitle, nAwardCount)
	self.tbItem = tbItem
	self.szLogTitle = szLogTitle
	self.nAwardCount = nAwardCount
	
	
end


suite = TestSuite:new("§¹o cô hÖ thèng ho¹t ®éng tù ®éng test")



ItemCase = {}

function ItemCase:new(szName)
	local tb = TestCase:new("Sö dông "..szName, self)
	tb.szName = szName
	tb.szExePath = "\\script\\item\\activityitem.lua"
	tb.tbRequire = tbRequireList[szName]
	
	
	return tb
end


function ItemCase:setUp()
	ThrowAllItem()

	if not self.tbAwardClass then
		self.tbAwardClass = DynamicExecute(self.szExePath, "getglobal", "tbAwardTemplet")	
	end
	
	
	DynamicExecute(self.szExePath, "setglobal", "tbAwardTemplet", %tbTestAward)
	
	
	local tbItem = tbItemList[self.szName]
	local tbItemProp = tbItem.tbProp
	local nItemIndex = AddItemNoStack(unpack(tbItemProp))
	self.nItemIndex = nItemIndex
	
	
	if self.tbRequire.tbItem then
		DynamicExecuteByPlayer(PlayerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", self.tbRequire.tbItem, "testitem")
	end
end

function ItemCase:tearDown()
	
	DynamicExecute(self.szExePath, "setglobal", "tbAwardTemplet", self.tbAwardClass)
	
	
	
	RemoveItemByIndex(self.nItemIndex)
	
	if self.tbRequire.tbItem then
		local tbProp = self.tbRequire.tbItem.tbProp
		local nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
		ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3],tbProp[4])
		
		
	end
	
end


--±³°ü¿Õ¼ä²»×ã²»ÄÜÊ¹ÓÃµÀ¾ß
function ItemCase:test_Use2_1()
	local tbItem = {}
	
	for nCell=0, 1 do
		for i=1, CalcFreeItemCellCount() + nCell - self.tbRequire.nMinCell  do
			local nItemIndex = AddItemNoStack(6,0,1,1,0,0,0)
			tinsert(tbItem, nItemIndex)
		end
		local nRet = DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)
		
		if nCell == 0 then
			self:assertTrue(nRet ~= 1, "Hµnh trang ®ñ « nh­ng kh«ng thÓ sö dông")
		else
			self:assertTrue(nRet == 1, "Ch­a thªm giíi h¹n « trèng hµnh trang")
		
			for i=1, getn(tbItem) do
				RemoveItemByIndex(tbItem[i])
			end
		end
	end
end

--Ã»ÓÐÐèÇóµÀ¾ß²»ÄÜÊ¹ÓÃ
function ItemCase:test_Use3()
	local tbRequireItem = self.tbRequire.tbItem
	
	
	if not tbRequireItem then
		return 
	end
	local tbProp = tbRequireItem.tbProp
	ConsumeEquiproomItem(tbRequireItem.nCount - 1, tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	
	local nOldCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	
	
	local nRet = DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)
	
	self:assertTrue(nRet == 1, "Nguyªn liÖu kh«ng ®ñ còng cã thÓ sö dông"..nRet)
	local nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	self:assertEquals(nCount, nOldCount, "Sö dông thÊt b¹i hoµn khÊu nguyªn liÖu")
	
	ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", tbRequireItem, "testitem", 2)	
	
	nRet = DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)

	
	self:assertTrue(nRet ~= 1, "Nguyªn liÖu ®ñ còng kh«ng thÓ sö dông")
	
	nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	self:assertEquals(nCount, tbRequireItem.nCount, "KhÊu trõ nhiÒu h¬n nguyªn liÖu cÇn thiÕt")	
	
	
end


function ItemCase:test_Use1()
	
	
	
	
	
	DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)
	self:assertTrue(%tbTestAward.szLogTitle ~= nil, format("Sö dông %s nhËn ®­îc phÇn th­ëng, kh«ng cã nhËt ký", GetItemName(self.nItemIndex)))	
	local tbItem = %tbTestAward.tbItem
	local nTotalRate = 0
	self:assertTrue(tbItem ~= nil, format("Sö dông %s nhËn kh«ng ®­îc phÇn th­ëng", GetItemName(self.nItemIndex)))
	
	if not tbItem then
		return
	end
	
	for i=1, getn(tbItem) do
		nTotalRate = nTotalRate + tbItem[i].nRate	
	end
	self:assertEquals(nTotalRate, 100, format("PhÇn th­ëng %s cã x¸c suÊt kh«ng ®ñ 100%%", GetItemName(self.nItemIndex)) )
end


for key, value in tbItemList do
	suite:add(ItemCase:new(key))
end