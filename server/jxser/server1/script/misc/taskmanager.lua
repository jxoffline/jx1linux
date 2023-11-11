-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 任务变量管理
-- 文件名　：taskmanager.lua
-- 创建者　：钟朝龙
-- 创建时间：2010-01-13 10:39:47
-- Include("\\script\\misc\\taskmanager.lua") 自己
-- ======================================================
--请勿直接使用该文件，尽量通过活动系统来调用
--迫不得已必须使用时，请用 TaskGroup
local TaskGroup = {}
TaskManager = {}
TaskManager.tbUseGroup = {}
TaskManager.tbTaskGroup = 
{
	
	[1] = 
		-- date:2010-02-04~2010-03-22;	VN主题活动by一帆;
		-- 永久;	VN富贵锦盒by一帆;
	{
		nCurrentVersion = 2,
		nVersionTask = 852,
		tbTaskSet = {853,854,855,856,857,858,859,862,863,864,865,866,867,868,869,870,871,872,873},
	},
	[2] = 
		-- date:2010-02-04~2010-03-29;	VN新年幡旗by董治;
		-- date:2010-06-28~2010-08-06;	VN神算子by钟朝龙;
		-- 2011年06月06日0h:00到2011年06月30日0h：00	VN剑网生日活动
		--2012/4/2到2012/4/30/24:00 护送马车活动
	{
		nCurrentVersion = 4,
		nVersionTask = 874,
		tbTaskSet = {875,876,877,878,879,880,881,882,883,884,885,886,887,888,889,890,891,892,893,},
	},
	[3] = 
		-- date:2010-02-04~2010-03-29; VN新年梅树by王斌
		-- date:2010-06-28~2010-08-06;	VN主题活动by董治;
		-- date:2011-10-01~2011-10-31   vn 十月活动
		-- date:2012-03-05 ~ 2012-03-21 vn 3月活动
		-- date: 问卷调查
	{
		nCurrentVersion = 5,
		nVersionTask = 894,
		tbTaskSet = {895,896,897,898,899,900,901,902,903,904,905,906,907,908,909,910,911,912,913,},
	},
	[4] = 
		-- date:2010-02-04~2010-03-29; VN财禄红包by钟朝龙
		-- date:2010-11-18~2010-12-09; VN教师节活动by李晶晶
		-- date:2011-03-28~2011-04-04; VN2011植树节活动by戴泽军
		-- date:2012-02-10~2012-02-29   vn 情人节活动
	{
		nCurrentVersion = 4,
		nVersionTask = 914,
		tbTaskSet = {915,916,917,918,919,920,921,922,923,924,925,926,927,928,929,930,931,932,933,},
	},
	[5] = 
	{
		nCurrentVersion = 3,
		-- date:2010-04-09 00:00~2010-06-07 00:00	JXVN解放日幸福育苗by一帆
		-- date:2010-12-21 00:00~2011-01-11 00:00	JXVN元旦圣诞活动by一帆
		-- date:2012-01-01 00:00~2012-02-01 00:00	JXVN春节活动 by 王静君
		nVersionTask = 934,
		tbTaskSet = {935,936,937,938,939,940,941,942,943,944,945,946,947,948,949,950,951,952,953,},
	},
	[6] = 
	{
		nCurrentVersion = 3,
		-- date:2010-04-09 00:00~2010-06-07 00:00	JXVN解放日战士衣by一帆
		-- date:2011年2月12日0点~2011年2月28日24点	JXVN&IB 2011情人节活动by潘愉扬
		-- date:2012-01-01 00:00~2012-02-01 00:00	JX1-vng春节活动 by 王静君
		nVersionTask = 954,
		tbTaskSet = {955,956,957,958,959,960,961,962,963,964,965,966,967,968,969,970,971,972,973,},
	},
	[7] = 
	{
		nCurrentVersion = 3,
		-- date:2010-04-26 00:00~2010-06-07 00:00	JXVN解放日炼金by董治
		-- date:2011年2月12日0点~2011年2月28日24点	JXVN&IB 2011情人节活动by潘愉扬
		--20120402 00:00 - 20120501 00:00

		nVersionTask = 974,
		tbTaskSet = {975,976,977,978,979,980,981,982,983,984,985,986,987,988,989,990,991,992,993,},
	},
	[8] = 
	{
		nCurrentVersion = 3,
		
		-- date:2011-12-01 00:00~2011-12-31 24:00	JXVN圣诞活动by钟朝龙
		-- 2012-05-04 ~ 2012-07-31 6月采水稻小活动
		nVersionTask = 994,
		tbTaskSet = {995,996,997,998,999,1194,1195,1196,1197,1198,1278,1279,1280,1281,1282,1283,1284,1285,1286,},
	},
	[9] = 
	{
		nCurrentVersion = 3,
		-- date:2011-01-20 00:00~2011-2-20 24:00	JXVN春节大宴群侠
		--从2012年4月2日开始到2012年4月30日24:00点结束 
		nVersionTask = 1287,
		tbTaskSet = {1288,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1299,1300,1310,1311,1312,1313,1314,1315,},
	},
	[10] = 
	{
		nCurrentVersion = 4,
		-- date:2010-06-10 00:00~2010-06-28 00:00	JXVN世界杯活动by董治
		-- date:2010-08-13 00:00~2010-08-31 24:00	JXVN祝福活动
		--20120503-20120601 五月活动
		--20120901-20121001 9月活动 by 刘军(LIUJUN4)
		nVersionTask = 1316,
		tbTaskSet = {1317,1318,1319,1320,1321,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1332,1333,1334,1335,},
	},
	[11] = 
	{
		nCurrentVersion = 3,
		-- date:2010-09-20~2010-10-18 00:00				JXVN中秋活动by董治
		-- date:2011-09-01~2011-09-30 24:00				JXVN国庆活动
		-- 永久											活动模板
		nVersionTask = 1336,
		tbTaskSet = {1337,1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,1351,1352,1353,1354,1355},
	},
	[12] = 
	{
		-- date:2011/04/21/0h:00~2011/05/23/0h:00			JXVN解放日送花by戴泽军
		-- date:2011/12/01/0h:00~2011/12/31/0h:00			JXVN圣诞活动by王静君
		-- date:2012/12/01/0h:00~2013/01/01/0h:00			JXVN2012圣诞活动
		nCurrentVersion = 4,
		nVersionTask = 1356,
		tbTaskSet = {1357,1358,1359,1360,1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373,1374,1375,},
	},
	[13] = 
	{
		-- date:2011/11/01/00:00~2011/11/30/24:00			JXVN 11月教师节活动 by王静君
		-- date:2013/03/03/00:00~2013/03/31/24:00			JXVN 3月活动 by ZhangFan4
		nCurrentVersion = 4,
		nVersionTask = 1376,
		tbTaskSet = {1377,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392,1393,1394,1395,},
	},
	[14] = 
	{
		--2012-05-10~2012-06-01 五月活动 第二个小活动
		nCurrentVersion = 1,
		nVersionTask = 1501,
		tbTaskSet = {1502,1503,1504,1506,1507,1508,1509,1510,1520,1521,1522,1523,1524,1525,1526,1527,1528,1529,1530,},
	},
	[15] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1531,
		tbTaskSet = {1532,1533,1534,1535,1536,1537,1538,1539,1540,1541,1542,1543,1544,1545,1546,1547,1548,1549,1552,},
	},
	[16] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1553,
		tbTaskSet = {1554,1555,1556,1557,1558,1559,1560,1561,1562,1563,1564,1565,1566,1567,1568,1569,1582,1583,1584,},
	},
	[17] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1585,
		tbTaskSet = {1586,1587,1588,1589,1590,1591,1592,1593,1594,1595,1596,1597,1598,1599,1760,1761,1762,1763,1764,},
	},
	[18] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1765,
		tbTaskSet = {1766,1767,1768,1769,1770,1771,1780,1781,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,},
	},
	[19] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1885,
		tbTaskSet = {1886,1887,1888,1889,1890,1891,1892,1893,1894,1895,1896,1897,1898,1899,1900,1901,1902,1903,1904,},
	},
	[20] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1905,
		tbTaskSet = {1906,1907,1908,1909,1910,1911,1912,1913,1914,1915,1916,1917,1918,1919,1920,1921,1922,1923,1924,},
	},
	
	--VN Task, event 14/2
	[100] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 2972,
		tbTaskSet = {2973, 2974, 2975, 2976, 2977, 2978, 2979, 2980},
	},
}

--底层接口，请勿使用，请用TaskGroup
function TaskManager:GetTask(nGroupId, nIndex)
	self:ResetTaskGroup(nGroupId)
	return GetTask(self:GetTaskId(nGroupId, nIndex))
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:SetTask(nGroupId, nIndex, nValue)
	self:ResetTaskGroup(nGroupId)
	return SetTask(self:GetTaskId(nGroupId, nIndex), nValue)
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:AddTask(nGroupId, nIndex, nValue)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex)
	return SetTask(nTaskId, GetTask(nTaskId) + nValue)
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:GetTaskBit(nGroupId, nIndex, nBitPos, nBitCount)
	self:ResetTaskGroup(nGroupId)
	return GetBitTask(self:GetTaskId(nGroupId, nIndex), nBitPos, nBitCount)
end
--底层接口，请勿使用，请用TaskGroup
function TaskManager:SetTaskBit(nGroupId, nIndex, nBitPos, nBitCount, nValue)
	self:ResetTaskGroup(nGroupId)
	return SetBitTask(self:GetTaskId(nGroupId, nIndex), nBitPos, nBitCount, nValue)
end

--获取某组任务变量里的任务变量Id
function TaskManager:GetTaskId(nGroupId, nIndex)

	if type(self:GetGroupTaskTable(nGroupId)[nIndex]) ~= "number" then
		return error(format("tbTaskGroup[%s].tbTaskSet[%s] is not a number", nGroupId, nIndex))
	end
	
	return self.tbTaskGroup[nGroupId].tbTaskSet[nIndex]
end
--获取组当前版本号
function TaskManager:GetCurrentVersion(nGroupId)
	if type(self.tbTaskGroup[nGroupId]) ~= "table" then
		return error(format("tbTaskGroup[%s] is not a table", nGroupId))
	end
	
	if type(self.tbTaskGroup[nGroupId].nCurrentVersion) ~= "number" then
		return error(format("tbTaskGroup[%s].nCurrentVersion is not a number", nGroupId))
	end
	return self.tbTaskGroup[nGroupId].nCurrentVersion
end


--获得某组任务变量组的任务变量集合
function TaskManager:GetGroupTaskTable(nGroupId)
	if type(self.tbTaskGroup[nGroupId]) ~= "table" then
		return error(format("tbTaskGroup[%s] is not a table", nGroupId))
	end
	if type(self.tbTaskGroup[nGroupId].tbTaskSet) ~= "table" then
		return error(format("tbTaskGroup[%s].tbTaskSet is not a table", nGroupId))
	end
	return self.tbTaskGroup[nGroupId].tbTaskSet
end




--获得某组任务变量组的版本号任务变量Id
function TaskManager:GetVersionTaskId(nGroupId)
	if type(self.tbTaskGroup[nGroupId]) ~= "table" then
		return error(format("tbTaskGroup[%s] is not a table", nGroupId))
	end
	
	if type(self.tbTaskGroup[nGroupId].nVersionTask) ~= "number" then
		return error(format("tbTaskGroup[%s].nVersionTask is not a number", nGroupId))
	end
	return self.tbTaskGroup[nGroupId].nVersionTask
end

--检查任务变量组的版本号是否一致
function TaskManager:CheckTaskGroup(nGroupId)
	if GetTask(self:GetVersionTaskId(nGroupId)) == self:GetCurrentVersion(nGroupId) then
		return 1
	end
end

--重置一组任务变量
function TaskManager:ResetTaskGroup(nGroupId)
	
	if self:CheckTaskGroup(nGroupId) ~= 1 then
		SetTask(self:GetVersionTaskId(nGroupId), self:GetCurrentVersion(nGroupId))
	
		for i=1, getn(self:GetGroupTaskTable(nGroupId)) do
			SetTask(self:GetTaskId(nGroupId, i), 0)
	
		end
	end
end

--重置在使用表用的任务变量组
function TaskManager:ResetUseGroup()
	for nGroupId, bUse in self.tbUseGroup do
		if bUse == 1 then
			self:ResetTaskGroup(nGroupId)
		end
	end
end

--添加一组任务变量到使用组里
function TaskManager:AddUseGroup(nGroupId)
	if self.tbUseGroup[nGroupId] == 1 then
		return
	end
	self.tbUseGroup[nGroupId] = 1
end

--测试检查有没有填写重复的TaskId
function TaskManager:DebugCheck()
	local tbFlag = {}
	local tbGroup = TaskManager.tbTaskGroup
	
	for i=1, getn(tbGroup) do
		local Group = tbGroup[i]
		local nId = Group.nVersionTask
		
		if tbFlag[nId] then
			error(format("%d, %d",i, nId))
		else
			tbFlag[nId] = 1
		end
		
		for j=1, getn(Group.tbTaskSet) do 
			local nId = Group.tbTaskSet[j]
			if tbFlag[nId] then
				error(format("%d, %d, %d",i, j, nId))
			else
				tbFlag[nId] = 1
			end
		end
		
	end
end

function TaskManager:Create(nGroupId, nVersion)
	
	--if self:GetCurrentVersion(nGroupId) ~= nVersion then
	--	return error(format("not permission to access TaskGroupId %d by Version %d", nGroupId, nVersion))
	--end

	self:AddUseGroup(nGroupId)
	local tb = {}
	for key , value in %TaskGroup do
		if type(value) == "function" then
			tb[key] = value
		end
	end
	tb:_init(nGroupId, nVersion)
	tb.TaskManager = self
	return tb
end


function TaskGroup:_init(nGroupId, nVersion)
	self.nGroupId = nGroupId
	self.nVersion = nVersion
end

function TaskGroup:GetTask(nIndex)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetTask(self.nGroupId, nIndex)
end

function TaskGroup:SetTask(nIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
		
	end
	return self.TaskManager:SetTask(self.nGroupId, nIndex, nValue)
end

function TaskGroup:AddTask(nIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
		
	end
	return self.TaskManager:AddTask(self.nGroupId, nIndex, nValue)
end

function TaskGroup:GetTaskBit(nIndex, nBitPos, nBitCount)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetTaskBit(self.nGroupId, nIndex, nBitPos, nBitCount)
end

function TaskGroup:SetTaskBit(nIndex, nBitPos, nBitCount, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
		
	end
	return self.TaskManager:SetTaskBit(self.nGroupId, nIndex, nBitPos, nBitCount, nValue)
end
