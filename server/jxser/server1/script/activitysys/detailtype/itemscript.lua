Include("\\script\\activitysys\\activitydetail.lua")


local _Detail = ActivityDetailClass:NewType("ItemScript")

function _Detail:RegisteMessage(gActivity)
	
	local tbDefItem = self:GetItem()	
	gActivity:RegisteItemScript(tbDefItem, self)
end

function _Detail:Init()
	self.tbItem = self.tbParam[1]
	if type(self.tbParam[1]) == "string" then
		self.tbItem = dostring(self.tbParam[1])
	end
end

function _Detail:GetItem()
	if not self.tbItem then
		self:Init()
	end
	return self.tbItem
end

function _Detail:UseItem(nItemIndex)
	local szMsg = format("%s\tAccount:%s\tName:%s\tItemName:%s", GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), GetItemName(nItemIndex))
	if self:IsExpired() == 1 then
		Talk(1, "", "V藅 ph萴 n祔  h誸 h筺")
		--WriteLog(format("%s\t%s.","[活动物品使用过期]", szMsg) )
		return 1
	end
	
	for i=1, getn(self.tbCondition) do
		if not self:CallFunction(self.tbCondition[i], nItemIndex) then
			return 1
		end
	end
	for i=1, getn(self.tbAction) do
		self:CallFunction(self.tbAction[i], nItemIndex)
	end
	WriteLog(format("%s\t%s.","[UseItemSucc]", szMsg ) )
	return 0
end

function _Detail:MatchItem(tbCurItem)
	local tbDefItem = self:GetItem()
	local tbProp = tbDefItem.tbProp
	local tbCurProp = tbCurItem.tbProp
	
	for i=1, getn(tbProp) do
		if tbProp[i] ~= - 1 and tbProp[i] ~= tbCurProp[i] then
			return
		end
	end
	
	return 1
end

function _Detail:OnMessage(tbParam) 

	
end