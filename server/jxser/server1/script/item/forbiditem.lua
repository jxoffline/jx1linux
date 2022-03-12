IncludeLib("FILESYS")
IncludeLib("ITEM")
Include("\\script\\lib\\common.lua");

--物品类型对应仅能使用的地图
tb_ItemType = {}
--物品对应其类型
tb_ItemDetail = {}
--地图ID对应其类型
tb_MapDetail = {}
--地图类型对应不能使用的物品
tb_MapType = {}




--//获得当前地图ID的类型，返回类型string，否则nil
function get_MapType(nMapID)
	return tb_MapDetail[nMapID]
end

function set_MapType(nMapID, szType)
	tb_MapDetail[nMapID] = szType
end

function del_MapType(nMapID)
	tb_MapDetail[nMapID] = nil
end

function add_Item2Map(szMapType, szItemType)
	tb_MapType[szMapType] = tb_MapType[szMapType] or {}
	tinsert(tb_MapType[szMapType], szItemType)
end


--//获得当前详细类别物品类型，返回类型string，否则nil
function get_ItemType(g, d, p)
	local str = pack_ItemDetail(g, d, p);
	if (str ~= nil and tb_ItemDetail[str]) then
		return tb_ItemDetail[str].itemtype;
	end;
	return nil;
end;


--//物品类型->仅能使用地图
function LoadItemType()
	local b1 = TabFile_Load("\\settings\\item_type.txt", "ItemType");
	if (b1 ~= 1) then
		print("Kh雐 ng t謕 lo筰 h譶h v藅 ph萴 th蕋 b筰!");
		return
	end;
	local nRowCount = TabFile_GetRowCount("ItemType");
	for i = 3, nRowCount do
		local sType = TabFile_GetCell("ItemType", i, "ITEM_TYPE");
		local sMap = TabFile_GetCell("ItemType", i, "ONLY_IN_MAP_TYPE");
		if (sMap == "" or sMap == nil) then
			tb_ItemType[sType] = nil;	--??怎样处理好呢？
		else
			tb_ItemType[sType] = split(sMap);
		end;
	end;
end;
LoadItemType()


--//物品类型->具体物品参数
function LoadItemDetail()
	local b1 = TabFile_Load("\\settings\\item_detail.txt", "ItemDetail");
	if b1~=1 then
		print("Kh雐 ng t謕 ph﹏ lo筰 v藅 ph萴 th蕋 b筰!");
		return
	end;
	local nRowCount = TabFile_GetRowCount("ItemDetail");
	for i = 3, nRowCount do
		local sType = TabFile_GetCell("ItemDetail", i, "ITEM_TYPE");
		if (sType ~= "" and sType ~= nil) then
			local nG = tonumber(TabFile_GetCell("ItemDetail", i, "GENRE"));
			local nD = tonumber(TabFile_GetCell("ItemDetail", i, "DETAIL"));
			local nP = tonumber(TabFile_GetCell("ItemDetail", i, "PARTICULAR"));
			local szKey = pack_ItemDetail(nG, nD, nP);
			tb_ItemDetail[szKey] = {};
			tb_ItemDetail[szKey].itemtype = sType;
		end;
	end;
end;

function pack_ItemDetail(g, d, p)
	if (g ~= nil and d ~= nil and p ~= nil) then
		return g..","..d..","..p;
	end;
	return nil;
end;
LoadItemDetail()


--//地图类型->具体地图ID
function LoadMapDetail()
	local b1 = TabFile_Load("\\settings\\map_type.txt", "MapDetail");
	if (b1 ~= 1) then
		print("Kh雐 ng t謕 ph﹏ lo筰 map th蕋 b筰!");
		return
	end;
	local nRowCount = TabFile_GetRowCount("MapDetail");
	for i = 3, nRowCount do 
		local szMapType = TabFile_GetCell("MapDetail", i, "MAP_TYPE");
		local str = TabFile_GetCell("MapDetail", i, "MAP_ID");
		str = replace(str, "\"", [[]]);
		local tbStr = split(str);
		for j = 1,getn(tbStr) do
			tbmap = split(tbStr[j], [[|]]);
			if (getn(tbmap) == 1) then
			local nmap = tonumber(tbmap[1]);
				tb_MapDetail[nmap] = szMapType;
			else
				nMap1 = tonumber(tbmap[1]);
				nMap2 = tonumber(tbmap[2]);
				for k = nMap1, nMap2 do 
					tb_MapDetail[k] = szMapType
				end;
			end;
		end;
		
		--//地图类型->禁止使用物品
		--tb_MapType = {}
		local szForbidType = TabFile_GetCell("MapDetail", i, "FORBIT_ITEM_TYPE");
		if (szForbidType ~= "" and szForbidType ~= nil) then
			tb_MapType[szMapType] = split(szForbidType);
		end;
	end;
end;
LoadMapDetail()

--//检查物品使用权限
--//返回1可用，-1不可用
function Check_ItemUsable(nSubWorldID, nItemGenre, nItemDetailType, nItemParticular)		
	if DynamicExecute("\\script\\vng_feature\\forbiditem\\vngforbidspecialitem.lua", "tbVNGForbidItem:CheckItemUsable", nSubWorldID, pack_ItemDetail(nItemGenre, nItemDetailType, nItemParticular)) == 0 then
		return 0
	end
	local szItemType = get_ItemType(nItemGenre, nItemDetailType, nItemParticular);
	if (szItemType == nil) then
		return 1;
	end;
	local szMapType = get_MapType(nSubWorldID);
	if (szMapType == nil) then
		szMapType = "";
	end;
	if (tb_ItemType[szItemType] ~= nil) then
		--仅能使用的地图
		for i = 1, getn(tb_ItemType[szItemType]) do
			if (tb_ItemType[szItemType][i] == szMapType) then
				return 1;
			end;
		end;
		return 0;
	--地图禁止使用物品
	elseif (tb_MapType[szMapType] ~= nil) then
		for i = 1, getn(tb_MapType[szMapType]) do
			if (tb_MapType[szMapType][i] == szItemType) then
				return 0;
			end;
		end;
	end;
	return 1;
end;
