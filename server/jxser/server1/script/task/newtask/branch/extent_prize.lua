--为了以后活动增加一个统一的接口
--如：所有支线任务完成要加的奖励则添到：ex_add_all()里
--如：所有支线正派任务要加的奖励则添到：ex_add_zhengpai()

if (not __H_EXTENTPRIZE__) then
	__H_EXTENTPRIZE__ = 1;

Include([[\script\event\teachersday06_v\head.lua]]);

--所有阶段任务完成都加
function ex_add_all()
	vt06_addzi();	--越南教师节活动给所有支线任务加奖励
end;

--所有阶段任务完成都加:正派
function ex_add_zhengpai()

end;

--所有阶段任务完成都加:正派
function ex_add_zhongli()

end;

--所有阶段任务完成都加:正派
function ex_add_xiepai()

end;

--所有阶段任务完成都加:20级
function ex_add_level20()

end;

--所有阶段任务完成都加:30级
function ex_add_level30()

end;

--所有阶段任务完成都加:40级
function ex_add_level40()

end;

--所有阶段任务完成都加:50级
function ex_add_level50()

end;

--所有阶段任务完成都加:60级
function ex_add_level60()

end;

--===========================正派系列=====================================
--所有阶段任务完成都加:20级
function ex_add_zp_level20()
	ex_add_all();
	ex_add_zhengpai();
	ex_add_level20();
end;

--所有阶段任务完成都加:30级
function ex_add_zp_level30()
	ex_add_all();
	ex_add_zhengpai();
	ex_add_level30();
end;

--所有阶段任务完成都加:40级
function ex_add_zp_level40()
	ex_add_all();
	ex_add_zhengpai();
	ex_add_level40();
end;

--所有阶段任务完成都加:50级
function ex_add_zp_level50()
	ex_add_all();
	ex_add_zhengpai();
	ex_add_level50();
end;

--所有阶段任务完成都加:60级
function ex_add_zp_level60()
	ex_add_all();
	ex_add_zhengpai();
	ex_add_level60();
end;
--===========================正派系列=====================================

--===========================中立系列=====================================
--所有阶段任务完成都加:20级
function ex_add_zl_level20()
	ex_add_all();
	ex_add_zhongli();
	ex_add_level20();
end;

--所有阶段任务完成都加:30级
function ex_add_zl_level30()
	ex_add_all();
	ex_add_zhongli();
	ex_add_level30();
end;

--所有阶段任务完成都加:40级
function ex_add_zl_level40()
	ex_add_all();
	ex_add_zhongli();
	ex_add_level40();
end;

--所有阶段任务完成都加:50级
function ex_add_zl_level50()
	ex_add_all();
	ex_add_zhongli();
	ex_add_level50();
end;

--所有阶段任务完成都加:60级
function ex_add_zl_level60()
	ex_add_all();
	ex_add_zhongli();
	ex_add_level60();
end;
--===========================中立系列=====================================

--===========================邪派系列=====================================
--所有阶段任务完成都加:20级
function ex_add_xp_level20()
	ex_add_all();
	ex_add_xiepai();
	ex_add_level20();
end;

--所有阶段任务完成都加:30级
function ex_add_xp_level30()
	ex_add_all();
	ex_add_xiepai();
	ex_add_level30();
end;

--所有阶段任务完成都加:40级
function ex_add_xp_level40()
	ex_add_all();
	ex_add_xiepai();
	ex_add_level40();
end;

--所有阶段任务完成都加:50级
function ex_add_xp_level50()
	ex_add_all();
	ex_add_xiepai();
	ex_add_level50();
end;

--所有阶段任务完成都加:60级
function ex_add_xp_level60()
	ex_add_all();
	ex_add_xiepai();
	ex_add_level60();
end;
--===========================邪派系列=====================================

end; --__H_EXTENTPRIZE__