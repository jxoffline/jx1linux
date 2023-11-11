Include("\\script\\lib\\sharedata.lua");
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\remoteexc.lua");

tbzhongqiu = {};
tbzhongqiu.szShareDataKey = "EVENT_TRUNGTHU_2012";
tbzhongqiu.tbShapeDemand  = {0, 999, 2999};
--tbzhongqiu.tbShapeDemand  = {0, 9, 29};
tbzhongqiu.tbShareData    = {nCount = 0, nShape = 1};

function tbzhongqiu:LoadData()
	OutputMsg("Load Data Trung Thu");
	local handle = OB_Create();	
	OB_LoadShareData(handle, self.szShareDataKey, 0, 0);
	if OB_IsEmpty(handle) ~= 1 then
		self.tbShareData = ObjBuffer:PopObject(handle);
	end
	OB_Release(handle);
end

function tbzhongqiu:ClearData()
	self.tbShareData    = {nCount = 0, nShape = 1};
	tbzhongqiu:SynShape();
	tbzhongqiu:SaveData();
end

function tbzhongqiu:SynShape() 
	RemoteExc("\\script\\event\\zhongqiu_jieri\\201209\\zhongqiu.lua", "tbzhongqiu:TaskNpcChangeShape", {self.tbShareData.nShape}, "", "", {});
end

function tbzhongqiu:SaveData()
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, self.szShareDataKey);
	ObjBuffer:PushObject(handle, 0);
	ObjBuffer:PushObject(handle, 0);
	ObjBuffer:PushObject(handle, self.tbShareData);
	SaveShareData(handle);
	OB_Release(handle);	
end
--HiÖu øng ph¸o hoa nÕu ®ñ sè l­îng lµ 30000 ng­êi nép
function tbzhongqiu:Fireworks()
	if self.tbShareData.nShape ~= getn(self.tbShapeDemand) then
		return
	end
	RemoteExc("\\script\\event\\zhongqiu_jieri\\201209\\zhongqiu.lua", "tbzhongqiu:Fireworks", {self.tbShareData.nCount }, "", "", {});
end
--T¨ng thªm sè l­îng ngõoi ch¬i nép vËt phÈm.
function tbzhongqiu:AddCount(szName)
	self.tbShareData.nCount = self.tbShareData.nCount + 1;
	local nShape = 1;
	for i = 1,getn(self.tbShapeDemand) do
		if self.tbShareData.nCount > self.tbShapeDemand[i] then
			nShape = i;
		end
	end	
	if nShape ~= self.tbShareData.nShape then
		self.tbShareData.nShape = nShape;
		tbzhongqiu:SynShape();
	end
	tbzhongqiu:SaveData();
	return 	szName, self.tbShareData.nCount;
end