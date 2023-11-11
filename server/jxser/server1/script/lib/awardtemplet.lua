

-- 文件名　：awardtemplet.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-03-20 18:55:45
IncludeLib("ITEM")
IncludeLib("ITEM")

tbAwardTemplet = {}

tbAwardTemplet.TYPE = {}

function tbAwardTemplet:RegType(szKey, pClass)
	self.TYPE[szKey] = pClass
end

function tbAwardTemplet:GivByRandom(tbItem, nAwardCount, tbLogTitle)
	if tbItem == nil then
		return 0
	end
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			return self:Give(tbItem[i], nAwardCount, tbLogTitle)
		end
	end
end

function tbAwardTemplet:Give(tbItem, nAwardCount, tbLogTitle)
	if not tbItem then --物品表为空
		return 0
	end
	nAwardCount = nAwardCount or 1
	if type(tbItem[1]) == "table" then -- 如果是多个物品
		if tbItem[1].nRate then --按概率给某一个
			for i = 1, nAwardCount do
				self:GivByRandom(tbItem, 1, tbLogTitle)
			end
			return 1
		else --按顺序给全部
			for i = 1,  getn(tbItem) do
				self:Give(tbItem[i], nAwardCount, tbLogTitle)
			end	
			return 1;
		end
	else
		for k, v in self.TYPE do
			if tbItem[k] then
				v:Give(tbItem, nAwardCount, tbLogTitle)
				return 1
			end
		end
	end
end

function tbAwardTemplet:GiveAwardByList(tbItem, szLogTitle, nAwardCount)
	return self:Give(tbItem, nAwardCount, {szLogTitle})
end