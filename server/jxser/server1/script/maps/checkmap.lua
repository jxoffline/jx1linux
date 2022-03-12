-- 城市地图
ARY_CITY_MAP =
{
	[11]	=	1,	-- 成都
	[1]		=	1,	-- 凤翔
	[37]	=	1,	-- 汴京
	[176]	=	1,	-- 临安
	[162]	=	1,	-- 大理
	[78]	=	1,	-- 襄阳
	[80]	=	1,	-- 扬州
}

-- 新手村地图
ARY_FRESHMAN_MAP =
{
	[174]	=	1,	-- 龙泉
	[121]	=	1,	-- 龙门
	[153]	=	1,	-- 石鼓
	[101]	=	1,	-- 稻香
	[99]	=	1,	-- 永乐
	[100]	=	1,	-- 朱仙
	[20]	=	1,	-- 江津
	[53]	=	1,	-- 巴陵
	[54]	=	1,	-- 南岳
	[175]	=	1,	-- 西山
}

-- 公共帮会地图
ARY_TONG_TEMPLATE_MAP_PUBLIC =
{
	[586]	=	1,	-- 公共帮会地图一
	[595]	=	1,	-- 公共帮会地图二
	[596]	=	1,	-- 公共帮会地图三
	[597]	=	1,	-- 公共帮会地图四
}

-- 自建帮会地图
ARY_TONG_TEMPLATE_MAP_PRIVATE =
{	
	[587]	=	1,	-- 山城帮会地图
	[588]	=	1,	-- 苗疆帮会地图
	[589]	=	1,	-- 沙漠帮会地图
	[590]	=	1,	-- 京师帮会地图
	[591]	=	1,	-- 边塞帮会地图
	[593]	=	1,	-- 江南帮会地图
	[594]	=	1,	-- 雪岭帮会地图
}

-- 判断是否城市地图
function IsCityMap(dwMapID)
	if (ARY_CITY_MAP[dwMapID] == 1) then
		return 1;
	else
		return 0;
	end
end

-- 判断是否新手村地图
function IsFreshmanMap(dwMapID)
	if (ARY_FRESHMAN_MAP[dwMapID] == 1) then
		return 1;
	else
		return 0;
	end
end

-- 判断是否帮会地图（bPublicOrPrivate: nil=所有帮会地图, 0=公共帮会地图, 1=自建帮会地图）
function IsTongMap(dwMapID, bPublicOrPrivate)
	local dwSubWorldIdx = SubWorldID2Idx(dwMapID);
	if (dwSubWorldIdx < 0) then
		return 0;
	end
	local dwMapCopyID = SubWorldIdx2MapCopy(dwSubWorldIdx);
	if (bPublicOrPrivate == nil) then
		if (ARY_TONG_TEMPLATE_MAP_PUBLIC[dwMapCopyID] == 1 or ARY_TONG_TEMPLATE_MAP_PRIVATE[dwMapCopyID] == 1) then
			return 1;
		end
	elseif (bPublicOrPrivate == 0) then
		if (ARY_TONG_TEMPLATE_MAP_PUBLIC[dwMapCopyID] == 1) then
			return 1;
		end
	elseif (bPublicOrPrivate == 1) then
		if (ARY_TONG_TEMPLATE_MAP_PRIVATE[dwMapCopyID] == 1) then
			return 1;
		end
	end
	return 0;
end