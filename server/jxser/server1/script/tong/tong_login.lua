Include("\\script\\global\\login_head.lua")
Include("\\script\\tong\\workshop\\ws_huodong.lua");

if login_add then login_add(tong_gh_getagain, 0) end

function sync_lingpai_task()
	for i = 1745, 1756 do
		SyncTaskValue(i);
	end;
	
	-- 帮会活动坊异常退出时恢复技能使用
	ForbitSkill(0);
end;

if login_add then login_add(sync_lingpai_task, 2) end;
