Include("\\script\\lib\\baseclass.lua")
AreaClass = tbBaseClass:new()
function AreaClass:_init(szName, nMapId, nLeft, nTop, nRight, nBottom)
	self.szName = szName
	self.nMapId = nMapId
	self.nLeft = nLeft
	self.nTop = nTop
	self.nRight = nRight
	self.nBottom = nBottom
	self.nState = 0
end

function AreaClass:IsInArea(nMapId, nX, nY)
	return self.nMapId == nMapId and self.nLeft <= nX and nX <= self.nRight and self.nTop <= nY and nY <= self.nBottom
end

function AreaClass:MakeFence(nX, nY)
	if self.nState == 1 then
		AddObstacleObj(474, self.nMapId, nX, nY)
	else
		ClearObstacleObj(self.nMapId, nX ,nY)
	end
end

function AreaClass:ChangeState(nState)
	if nState == self.nState then
		return
	end
	self.nState = nState
	for i=0, ceil(floor(self.nRight- self.nLeft)/32) do
		self:MakeFence(self.nLeft + i*32, self.nTop)
		self:MakeFence(self.nLeft + i*32, self.nBottom)
	end
	for i=0, ceil(floor(self.nBottom- self.nTop)/32) do
		self:MakeFence(self.nLeft, self.nTop + i*32)
		self:MakeFence(self.nRight, self.nTop + i*32)
	end
end