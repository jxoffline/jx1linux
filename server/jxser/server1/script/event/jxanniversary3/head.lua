
--随机卷轴
Include("\\script\\task\\random\\task_head.lua");

JXANNIVERSARY3_OPENDATE	= 20060901;			--三周年活动开始时间
JXANNIVERSARY3_ENDDATE	= 20060926;			--三周年活动结束时间
JXANNIVERSARY3_SHOUTAONUM	= 3;					--每日最多制作寿桃的个数
JXANNIVERSARY3_MAXOWNEXP	= 100000000;	--豆沙寿桃最大获得经验值
JXANNIVERSARY3_ONCEEXP		= 3000000;		--豆沙寿桃每次给与的经验

tb_JXAN_SHOUTAOKIND = {
	{	szstart="<dec><npc>豆沙寿桃需要2份白米粉、2份白砂糖、1份新鲜的豆沙,",
		szend="<dec><npc>呵,香甜可口的豆沙寿桃已经做好了。",
							--g,d,p,count
		resource={ {6,1,1175,2},{6,1,1176,2},{6,1,1177,1} },
		shoutao={6,1,1179}},
	{	szstart="<dec><npc>枣泥寿桃需要2份白米粉、2份白砂糖、1份新鲜的枣泥,",
		szend="<dec><npc>呵,香甜可口的枣泥寿桃已经做好了。",
		resource={ {6,1,1175,2},{6,1,1176,2},{6,1,1178,1} },
		shoutao={6,1,1180}},
};

tb_JXAN_RESOURCERATE = {
	{ {6, 1, 1175}, "白米粉", 40 },
	{ {6, 1, 1176}, "白砂糖", 40 },
	{ {6, 1, 1177}, "新鲜的豆沙", 10 },
	{ {6, 1, 1178}, "新鲜的红枣",   10 },
}

tb_JXAN_SHOUXIGIFT = {
	{{6,1,147,4}, "四级玄晶", 150},
	{{6,1,147,5}, "五级玄晶", 285},
	{{6,1,147,6}, "六级玄晶", 10},
	{{6,1,147,7}, "七级玄晶", 3},
	{{6,1,147,8}, "八级玄晶", 1},
	{{6,1,398,1}, "神秘矿石", 1},
	{{4,238,1,1}, "蓝水晶", 50},
	{{4,240,1,1}, "绿水晶", 50},
	{{4,239,1,1}, "紫水晶", 50},
	{{6,2,2,0}, "任务卷轴", 400},
}

tb_JXAN_TSK_ADDR =
{
	{{2, 293*8, 218*16}, "华山"},
	{{21, 328*8, 281*16}, "青城山" },
	{{193, 238*8, 176*16}, "武夷山"},
	{{167, 190*8, 200*16}, "点苍山"}
} 

---------Task ID-------------
TASKID_JXAN_SHOUTAODATE	= 2473;				--寿桃最后制作的日期
TASKID_JXAN_SHOUTAONUM	= 2474;				--寿桃制作的个数
TASKID_DOUSHASHOUTAO_EXP	= 2475;			--豆沙寿桃获得经验（上限1亿）


---------Function------------
function JxAn_cloud_join()
	if (IsCharged() ~= 1) then
		Msg2Player("只有充值用户才能参加庆典活动。", 0);
		return -1;
	end;
	if (GetLevel() < 80) then
		Msg2Player("你的等级还不够80级，不能参加庆典活动。", 0);
		return -1;
	end;
	return 1;
end;

-- 由指定的任务编号创建一个任务卷轴
function shouxi_CreateBook()
	-- 选择一个第二层的随机任务
	local nRandomTaskID = TaskNo(selectNextTask());
	
	if nRandomTaskID~=nil and nRandomTaskID~=0 then
		-- 生成一个任务卷轴
		nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
		SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
		-- 同步物品魔法属性
		SyncItem(nRandomItemIndex);
		Msg2Player("您得到了<color=green>任务卷轴一个！<color>");
		WriteLog(date().."\t[剑网三周年]\tName:"..GetName().."\tAccount:"..GetAccount().."\t从寿禧礼包中获得一个任务卷轴其任务编号为："..nRandomTaskID.." 索引为："..nRandomItemIndex)
	else
		WriteLog(date().."\t[剑网三周年]\tName:"..GetName().."\tAccount:"..GetAccount().."\t从寿禧礼包中获得任务卷轴失败")
	end;
end;

--判断玩家是否充过卡
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;
