-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 任务变量管理
-- 文件名　：taskmanager.lua
-- 创建者　：钟朝龙
-- 创建时间：2010-01-13 10:39:47
-- Include("\\script\\misc\\taskmanager.lua") 自己
-- ======================================================
--请勿直接使用该文件，尽量通过活动系统来调用
--迫不得已必须使用时，请用 TaskGroup
--此文件为VNG开发的活动变量所用

Include("\\script\\misc\\taskmanager.lua")

local tbTaskGroup = 
{
	[1] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1336,
		tbTaskSet = {1337,1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,1351,1352,1353,1354,1355},
	},
	[2] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1356,
		tbTaskSet = {1357,1358,1359,1360,1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373,1374,1375,},
	},
	[3] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1376,
		tbTaskSet = {1377,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392,1393,1394,1395,},
	},
	[4] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1501,
		tbTaskSet = {1502,1503,1504,1506,1507,1508,1509,1510,1520,1521,1522,1523,1524,1525,1526,1527,1528,1529,1530,},
	},
	[5] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1531,
		tbTaskSet = {1532,1533,1534,1535,1536,1537,1538,1539,1540,1541,1542,1543,1544,1545,1546,1547,1548,1549,1552,},
	},
	[6] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1553,
		tbTaskSet = {1554,1555,1556,1557,1558,1559,1560,1561,1562,1563,1564,1565,1566,1567,1568,1569,1582,1583,1584,},
	},
	[7] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1585,
		tbTaskSet = {1586,1587,1588,1589,1590,1591,1592,1593,1594,1595,1596,1597,1598,1599,1760,1761,1762,1763,1764,},
	},
	[8] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1765,
		tbTaskSet = {1766,1767,1768,1769,1770,1771,1780,1781,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,},
	},
	[9] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1885,
		tbTaskSet = {1886,1887,1888,1889,1890,1891,1892,1893,1894,1895,1896,1897,1898,1899,1900,1901,1902,1903,1904,},
	},
	[10] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1905,
		tbTaskSet = {1906,1907,1908,1909,1910,1911,1912,1913,1914,1915,1916,1917,1918,1919,1920,1921,1922,1923,1924,},
	},
}

VngTaskManager = TaskManager:NewManager(tbTaskGroup)
if not VngTaskManager then
	print("======== [ERROR]!!! in vng_script\\activitysys\\vngtaskmanager.lua")
end
