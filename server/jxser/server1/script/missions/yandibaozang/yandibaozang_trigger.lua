-- 炎帝宝藏
-- by 小浪多多
-- 2007.10.24
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..


Include("\\script\\missions\\yandibaozang\\trigger_include.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")

function YDBZ_OnTrigger()
	-- DEBUG
	print("yandibaozang_tigger start...");
	-- TODO: 修改任务参数
	-- 重启missions
	YDBZ_ready_close_missions(YDBZ_MAP_MAP,YDBZ_MISSION_MATCH, YDBZ_VARV_STATE);
	YDBZ_ready_close_missions(YDBZ_READY_MAP, YDBZ_READY_MISSION, YDBZ_READY_STATE);
	YDBZ_ready_missions(YDBZ_READY_MAP, YDBZ_READY_MISSION);
end

--OnTrigger();