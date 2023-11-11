
SecondHandGoodsList = {}

SecondHandGoodsList.Map = {}
SecondHandGoodsList.nCount = 0
SecondHandGoodsList.BeginNode = {}
SecondHandGoodsList.LastNode = nil
SecondHandGoodsList.CurUsedIdx = 0


function SecondHandGoodsList:NewNode(nIdx, Data)
	local tb = {}
	tb.PrevNode = nil
	tb.NextNode = nil
	tb.Data = Data
	tb.nIdx = nIdx
	self.Map[nIdx] = tb
	return tb
end

function SecondHandGoodsList:GetFristNode()
	return self.BeginNode.NextNode
end

function SecondHandGoodsList:SetFristNode(Node)
	self.BeginNode.NextNode = Node
	self.LastNode = Node
	Node.PrevNode = self.BeginNode
end

function SecondHandGoodsList:GetNode(nIdx)
	if nIdx then
		return self.Map[nIdx]
	end
end

function SecondHandGoodsList:AddNode(Goods)
	local CurNode = self:NewNode(Goods.nIdx, Goods)
	
	if not self:GetFristNode() then
		self:SetFristNode(CurNode)
	else
		self.LastNode.NextNode = CurNode
		CurNode.PrevNode = self.LastNode
		self.LastNode = CurNode
	end	
	self.nCount = self.nCount + 1
	return CurNode
end

function SecondHandGoodsList:DelNode(nIdx)	
	local CurNode = self:GetNode(nIdx)
	if not CurNode then
		return
	end
	
	local CurPrevNode = CurNode.PrevNode
	local CurNextNode = CurNode.NextNode
	
	CurPrevNode.NextNode = CurNextNode

	if CurNextNode then
		CurNextNode.PrevNode = CurPrevNode
	else
		self.LastNode = CurPrevNode
	end
	
	CurNode.PrevNode = nil
	CurNode.NextNode = nil
	
	self.Map[nIdx] = nil
	self.nCount = self.nCount - 1
	return CurNode
end

function SecondHandGoodsList:DelFristNode()
	local CurNode = self:GetFristNode()
	self:DelNode(CurNode.nIdx)
end

function SecondHandGoodsList:NewIdx()
	self.CurUsedIdx = self.CurUsedIdx + 1
	return self.CurUsedIdx
end

function SecondHandGoodsList:GetIdList()
	local tbList = {}
	local CurNode = self:GetFristNode()	
	while(CurNode) do
		if CurNode.Data then
			tinsert(tbList, CurNode.nIdx)
		end
		CurNode = CurNode.NextNode
	end
	return tbList
end

function SecondHandGoodsList:GetList(nPage, nPrePageCount)
	local tbList = {}
	local CurNode = self:GetFristNode()
	local nBeginCount = (nPage - 1) * nPrePageCount + 1
	local nCurCount = 0
	local nNextPage = -1
	if nBeginCount + nPrePageCount <= self.nCount then
		nNextPage = nPage + 1
	end
	
	
	if nBeginCount > self.nCount then
		return tbList, nNextPage
	end
	
	while(CurNode) do
		if CurNode.Data then
			nCurCount = nCurCount + 1
			if nCurCount >= nBeginCount then
				tinsert(tbList, CurNode.Data)
			end
			if nCurCount >= nBeginCount + nPrePageCount -1 then
				break;
			end
		end
		CurNode = CurNode.NextNode
	end
	
	
	
	return tbList, nNextPage
end