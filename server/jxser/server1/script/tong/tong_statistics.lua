--对一个区服的所有超过2级帮会进行统计，
if (not __TONG_STATICS_H__) then
	__TONG_STATICS_H__ = 1;
IL("TONG");
GLB_UPDATEDATE = 921;	--记录该服务期帮会数据更新的日期
T_STATICS = {[2] = {}, [3] = {}, [4] = {}, [5] = {} };

--一日更新一次
function init_statics()
	local nTongID = TONG_GetFirstTong()
	local nLevel;
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	
--	if (nDate == GetGlbValue(GLB_UPDATEDATE)) then --如果已经更新过
--		return
--	end;
	
	SetGlbValue(GLB_UPDATEDATE, nDate);
	--将原来的表清空
	for i = 2, 5 do
		T_STATICS[i] = {};
	end;
	--遍历，构建新的表。将所有的2级以上（包括2级）找出来；
	while (nTongID > 0) do
		nLevel = TONG_GetBuildLevel(nTongID);
		if (nLevel > 1 and nLevel < 6) then
			if (TONG_GetTongMap(nTongID) > 604) then --如果拥有独立的帮会地图；
				tinsert(T_STATICS[nLevel], nTongID);
			end;
		end;
		nTongID = TONG_GetNextTong(nTongID);
	end
	return 1
end;

function get_tonglist(nWorkshopIdx, nLevel)
	local nTongID;
	local nWorkshopLevel;
	local tab_TongList= {};
	local nWorkshopID;
	init_statics()	--进行数据更新，但一天只进行一次
	for i = 2, 5 do
		for j = 1, getn(T_STATICS[i]) do
			nTongID = T_STATICS[i][j];
			if (nTongID > 0) then
				nWorkshopID = TWS_GetFirstWorkshop(nTongID, nWorkshopIdx)
				nWorkshopLevel = TWS_GetLevel(nTongID, nWorkshopID);
				if (nWorkshopLevel >= nLevel) then
					tinsert(tab_TongList, nTongID);
				end;
			end;
		end;
	end;
	return tab_TongList;
end;

function get_tongmap_list(nWorkshopID, nLevel)
	local tab_TongList = get_tonglist(nWorkshopID, nLevel);
	local tab_MapList = {};
	for i = 1, getn(tab_TongList) do
		if (tab_TongList[i] > 0) then
			tinsert(tab_MapList, TONG_GetTongMap(tab_TongList[i]));
		end;
	end;
	return tab_MapList;
end;

function get_workshop_count(nWorkshopID, nLevel)
	local tab_TongList = {};
	tab_TongList = get_tonglist(nWorkshopID, nLevel);

	local nCount = getn(tab_TongList);
	_, nTongID = GetTongName();
	local nWorkshopIdx = TWS_GetFirstWorkshop(nTongID, nWorkshopID);
	if (TWS_GetLevel(nTongID, nWorkshopIdx) >= nLevel) then
		nCount = nCount - 1;
	end;
	return nCount
end;

end; --// end of __TONG_STATICS_H__
