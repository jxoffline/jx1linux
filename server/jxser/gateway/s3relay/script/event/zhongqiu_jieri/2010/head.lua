-- ShareData     格式
-- Key: 			   EVENT_MIDAUT_2010 
-- Param 1:		   0
-- Param 2:		   0		
-- Data:				 {
--									nCount = 0,	-- 数量
--									nShape = 1, -- 形状: 1->小、 2->中、 3->大
--							 }

Include("\\script\\lib\\sharedata.lua");
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\remoteexc.lua");

tbMidAut2010 = {};
tbMidAut2010.szShareDataKey = "EVENT_MIDAUT_2010";
tbMidAut2010.tbShapeDemand  = {0, 19999, 39999};
tbMidAut2010.tbShareData    = {nCount = 0, nShape = 1,};

-- 增加数量
function tbMidAut2010:AddCount(szName)
	self.tbShareData.nCount = self.tbShareData.nCount + 1;
	
	local nShape = 1;
	for i = 1,getn(self.tbShapeDemand) do
		if self.tbShareData.nCount > self.tbShapeDemand[i] then
			nShape = i;
		end
	end
	
	-- 变形
	if nShape ~= self.tbShareData.nShape then
		self.tbShareData.nShape = nShape;
		tbMidAut2010:SynShape();
	end
	
	tbMidAut2010:SaveData();
	return 	szName, self.tbShareData.nCount;
end

-- 设置数量
function tbMidAut2010:SetCountForDeBug(nCount) 
	
	self.tbShareData.nCount = nCount;
	
	local nShape = 1;
	for i = 1,getn(self.tbShapeDemand) do
		if self.tbShareData.nCount > self.tbShapeDemand[i] then
			nShape = i;
		end
	end
	
	-- 变形
	if nShape ~= self.tbShareData.nShape then
		self.tbShareData.nShape = nShape;
		tbMidAut2010:SynShape();
	end
	
	tbMidAut2010:SaveData();
end

-- 同步形态
function tbMidAut2010:SynShape() 
	RemoteExc("\\script\\event\\zhongqiu_jieri\\201009\\support.lua", "tb2010ZhongQiu:TaskNpcChangeShape", {self.tbShareData.nShape}, "", "", {});
end

-- 放烟花
function tbMidAut2010:Fireworks()
	
	if self.tbShareData.nShape ~= getn(self.tbShapeDemand) then
		return
	end
	
	RemoteExc("\\script\\event\\zhongqiu_jieri\\201009\\support.lua", "tb2010ZhongQiu:Fireworks", {}, "", "", {});
end

-- 读盘
function tbMidAut2010:LoadData()
	
	OutputMsg("MidAut2010 LoadData");
	local handle = OB_Create();	
	OB_LoadShareData(handle, self.szShareDataKey, 0, 0);
	if OB_IsEmpty(handle) ~= 1 then
		self.tbShareData = ObjBuffer:PopObject(handle);
	end
	OB_Release(handle);
	
end

-- 清盘
function tbMidAut2010:ClearData()

	self.tbShareData = {nCount = 0, nShape = 1,};
	tbMidAut2010:SynShape();
	tbMidAut2010:SaveData();

end

-- 存盘
function tbMidAut2010:SaveData()

	local handle = OB_Create();
	ObjBuffer:PushObject(handle, self.szShareDataKey);
	ObjBuffer:PushObject(handle, 0);
	ObjBuffer:PushObject(handle, 0);
	ObjBuffer:PushObject(handle, self.tbShareData);
	SaveShareData(handle);
	OB_Release(handle);	

end
