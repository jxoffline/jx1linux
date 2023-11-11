-- 洗点功能(ClearSkillPoint)

-- 任务ID：记录临时重生点
CSP_TID_RevivalSWID 	= 204; -- 重生地图ID
CSP_TID_ReviveID 		= 205; -- 重生点ID
-- 任务ID：记录免费洗技能/潜能点次数
CSP_TID_ClearFreeTime	= 144;
-- 任务ID：记录宝石洗点模式(洗技能点、洗潜能点、全洗)
CSP_TID_ClearType		= 145;
CSP_CTYPE_NONE			= 0; -- 不洗任何点标记
CSP_CTYPE_SKILL			= 1; -- 洗技能点标记
CSP_CTYPE_PROP			= 2; -- 洗潜能点标记
CSP_CTYPE_ALL			= 3; -- 全洗标记(技能点&潜能点)

CSP_TID_JewelEnterTime	= 150;	-- 使用宝石进入的次数

CSP_NEEDJEWEL_SKILL		= 3; -- 需技能水晶的个数
CSP_NEEDJEWEL_PROP		= 6; -- 需潜能宝石的个数

CSP_NEEDJEWEL_SKILL2		= 1;		-- 1个白玉
CSP_NEEDJEWEL_PROP2			= 1;		-- 1个紫玉


CSP_NEEDLEVEL			= 50; -- 可洗点的最小级别
CSP_MAXClearTime		= 1; -- 最大洗点次数

CSP_RevieSWID			= 1; -- 重生点ID
CSP_MaxTestMapCount		= 10; --每一组PK洞的数量

-- 七大城市地图
-- 1-凤翔, 2-成都, 3-大理, 4-汴京, 5-襄阳, 6-扬州, 7-临安
CSP_CityMapTab = {1, 11, 162, 37, 78, 80, 176}


-- 洗点地图
CSP_ClearMapTab 	=  {242, 243, 244, 245, 246, 247, 248}
CSP_TestMapBeginTab =  {249, 259, 269, 279, 289, 299, 309,} --每一个城市一组PK洞的第一个洞的MapId,其它的是连续的



--PK洞的对应Mission任务ID
MISSIONID = 10;
JOINSTATE = 100;


--梦境/梦境山洞地图切换：
--PK测试洞四个入口坐标
CSP_TestHoleTab = {{1621,3236},{1533,3235},{1520,3352},{1670,3347}};

--从测试洞到梦境的四个坐标
CSP_ClearHoleTab = {{1407,3331},{1741,3264},{1737,2998},{1443,2975}};

--梦境战斗区域/非战斗区域：梦境四个切换战斗状态的坐标，每个分两个坐标，一个是战斗位置坐标，另一个是非战斗位置坐标
CSP_ClearTrapTab = {{1584,3232,1592,3222 }, {1657,3243, 1648,3232}, {1653,3172,1645,3184},{1581,3166,1591,3174} }

--进入测试洞同时最大人数
MAX_MEMBER_COUNT = 20;

CSP_PKTIME = 18 * 60 * 5;
CSP_CAMPMANX = 1582 * 32;
CSP_CAMPMANY = 3303 * 32;

------------------------------------------------------
-- 根据城市序号，取相应洗点地图ID
-- nCityIndex: 城市序号
function CSP_GetClearMapID(nCityIndex)
	nCount = getn(CSP_ClearMapTab);
	if (nCityIndex < 1) or (nCityIndex > nCount) then
		return -1;
	end
	
	return CSP_ClearMapTab[nCityIndex];
end;

-- 根据城市序号 ，获得当前空闲的洗点测试地图MapId
function CSP_GetFreeTestMapID(nCityIndex)
	nCount = getn(CSP_TestMapBeginTab);
	if (nCityIndex < 1) or (nCityIndex > nCount) then
		return -1;
	end
	
	nRet = -1;
	OldSubWorld = SubWorld
	
	for i = 1, CSP_MaxTestMapCount do 
		nMapId = CSP_TestMapBeginTab[nCityIndex] + i - 1;
		idx = SubWorldID2Idx(nMapId);

		if (idx == -1) then 
			print("GetFreeTestMapID Error!!!");
		else
			SubWorld = idx
			if (GetMissionV(1) == 0) then
				nRet = nMapId
				break
			end;
		end;
	end;
	
	SubWorld = OldSubWorld
	return nRet
end;

-- 根据城市序号，取相应城市地图ID
function CSP_GetCityMapID(nCityIndex)
	nCount = getn(CSP_CityMapTab);
	if (nCityIndex < 1) or (nCityIndex > nCount) then
		return -1;
	end
	
	return CSP_CityMapTab[nCityIndex];
end;

--------------------------------------------
-- 根据洗点地图ID，取城市序号(从1开始算)
function CSP_GetCityIndexByClearMap(nMapID)
	nCount = getn(CSP_ClearMapTab);
	for i = 1, nCount do
		if (nMapID == CSP_ClearMapTab[i]) then 
			return i;
		end;
	end;
	return -1
end;

-- 根据洗点测试地图ID，取城市序号(从1开始算)
function CSP_GetCityIndexByTestMap(nMapID)
	nCount = getn(CSP_TestMapBeginTab);
	for i = 1, nCount do
		if (nMapID >= CSP_TestMapBeginTab[i] and nMapID < (CSP_TestMapBeginTab[i] + CSP_MaxTestMapCount)) then 
			return i;
		end;
	end;
	return -1
end;

-- 根据城市地图ID，取城市序号(从1开始算)
function CSP_GetCityIndexByCityMap(nMapID)
	nCount = getn(CSP_CityMapTab);
	for i = 1, nCount do
		if (nMapID == CSP_CityMapTab[i]) then 
			return i;
		end;
	end;
	return -1	
end;

--------------------------------------------
-- 检查状态合法性(1- 合法， 0 - 非法)
function CSP_CheckValid()
	-- 可以使用回城符！！很严重的问题！！
	if (IsDisabledUseTownP() ~= 1) then
		return 0;
	end;
		
	return 1;
end
--------------------------------------------
function CSP_SwitchTrap(trapIndex)
	if (GetFightState() == 0) then 
		SetFightState(1)
		SetPKFlag(0)
		ForbidChangePK(1);
		SetPunish(0)
		--玩家退出时，保存RV，并在下次等入时用RV(城市重生点，非退出点)
		SetLogoutRV(1);
		
		SetPos(CSP_ClearTrapTab[trapIndex][1],CSP_ClearTrapTab[trapIndex][2])
	else
		SetFightState(0)	
		SetPKFlag(1)
		ForbidChangePK(0);
		SetPos(CSP_ClearTrapTab[trapIndex][3],CSP_ClearTrapTab[trapIndex][4])
	end;
end

--------------------------------------------
function CSP_WriteLog(str)
	WriteLog(" [T葃 T駓 o]"..date("%H%M%S")..": T礽 kho秐:"..GetAccount()..", nh﹏ v藅:"..GetName()..","..str);
end
