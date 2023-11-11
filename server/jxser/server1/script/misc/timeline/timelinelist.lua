--时间轴配置文件
--strName:时间轴名称(不能重名)
--tbTimeLineData:时间轴参数
--				nBeginDayLimit/nEndDayLimit:		距离开始/结束事件发生多少天以后开放/关闭
--				strBeginEventType/strEndEventType:	开始/结束事件的类型,目前支持(不填就没有限制)	
--													1.ServerOpenTimeEvent 	服务器开启事件																							
--													2.RefTimeEvent			某个时间轴的开始或者结束事件																						
--													3.FixTimeEvent			固定日期
--				strBeginEventName/strEndEventName:	开始/结束事件的名称
--
--例如:如下配置表示,在服务器开启100天之后"开放十黄"这个时间轴激活,在"开放十黄"这个时间轴激活后的300天关闭时间轴
--	[1] =
--	{
--		strName = "开放十黄",
--
--		tbTimeLineData = 
--		{
--			nBeginDayLimit = 100,
--			nEndDayLimit = 300,
--			strBeginEventType = "ServerOpenTimeEvent",
--			strEndEventType = "RefTimeEvent",
--			strBeginEventName = "开放十黄",
--			strEndEventName = "关闭十黄",
--		},
--		tbBeginEventData = 
--		{
--		},
--		tbEndEventData = 
--		{
--			strRefTimeLineName = "开放十黄", --以"开放十黄"这个时间轴的开启日期为参照事件
--			bBeginOrEnd = 0,				 --0表示以时间轴开启日期为参照,1表示时间轴结束日期为参照,默认不填的话为0
--		},
--	},
--
--	在2010年5月14号之后5天也就是2010年5月19号"开启白金+6"时间轴激活,在"开放十黄"这个时间轴关闭后的20天关闭"开启白金+6"时间轴
--	[2] =
--	{
--		strName = "开启白金+6",

--		tbTimeLineData = 
--		{
--			nBeginDayLimit = 5,
--			nEndDayLimit = 20,
--			strBeginEventType = "FixTimeEvent",
--			strEndEventType = "RefTimeEvent",
--			strBeginEventName = "开启白金+6",
--			strEndEventName = "关闭白金+6",
--		},
--		tbBeginEventData = 
--		{
--			nEventDate = 20100514
--		},
--		tbEndEventData = 
--		{
--			strRefTimeLineName = "开放十黄",
--			bBeginOrEnd = 1,
--		},
--	},


tbTimeLineList = 
{
	[1] =
	{
		strName = "ItemExchange1",

		tbTimeLineData = 
		{
			nBeginDayLimit = 0,
			nEndDayLimit = 30,
			strBeginEventType = "FixTimeEvent",
			strEndEventType = "RefTimeEvent",
			strBeginEventName = "OpenItemExchange1",
			strEndEventName = "CloseItemExchange1",
		},
		tbBeginEventData = 
		{
			nEventDate = 20100901,
		},
		tbEndEventData = 
		{
			strRefTimeLineName = "ItemExchange1", --以"开放十黄"这个时间轴的开启日期为参照事件
			bBeginOrEnd = 0,				 --0表示以时间轴开启日期为参照,1表示时间轴结束日期为参照,默认不填的话为0
		},
	},
	[2] =
	{
		strName = "ItemExchange2",

		tbTimeLineData = 
		{
			nBeginDayLimit = 0,
			nEndDayLimit = 30,
			strBeginEventType = "RefTimeEvent",
			strEndEventType = "RefTimeEvent",
			strBeginEventName = "OpenItemExchange2",
			strEndEventName = "CloseItemExchange2",
		},
		tbBeginEventData = 
		{
			strRefTimeLineName = "ItemExchange1",
			bBeginOrEnd = 1,
		},
		tbEndEventData = 
		{
			strRefTimeLineName = "ItemExchange2",
			bBeginOrEnd = 0,
		},
	},
	[3] =
	{
		strName = "ItemExchange3",

		tbTimeLineData = 
		{
			nBeginDayLimit = 0,
			nEndDayLimit = 30,
			strBeginEventType = "RefTimeEvent",
			strEndEventType = "RefTimeEvent",
			strBeginEventName = "OpenItemExchange3",
			strEndEventName = "CloseItemExchange3",
		},
		tbBeginEventData = 
		{
			strRefTimeLineName = "ItemExchange2",
			bBeginOrEnd = 1,
		},
		tbEndEventData = 
		{
			strRefTimeLineName = "ItemExchange3",
			bBeginOrEnd = 0,
		},
	},
	[4] =
	{
		strName = "ItemExchange4",

		tbTimeLineData = 
		{
			nBeginDayLimit = 0,
			nEndDayLimit = 30,
			strBeginEventType = "RefTimeEvent",
			strEndEventType = "RefTimeEvent",
			strBeginEventName = "OpenItemExchange4",
			strEndEventName = "CloseItemExchange4",
		},
		tbBeginEventData = 
		{
			strRefTimeLineName = "ItemExchange3",
			bBeginOrEnd = 1,
		},
		tbEndEventData = 
		{
			strRefTimeLineName = "ItemExchange4",
			bBeginOrEnd = 0,
		},
	},
	[5] =
	{
		strName = "ItemExchange5",

		tbTimeLineData = 
		{
			nBeginDayLimit = 0,
			strBeginEventType = "RefTimeEvent",
			strBeginEventName = "OpenItemExchange5",
		},
		tbBeginEventData = 
		{
			strRefTimeLineName = "ItemExchange4",
			bBeginOrEnd = 1,
		},
	},
}
