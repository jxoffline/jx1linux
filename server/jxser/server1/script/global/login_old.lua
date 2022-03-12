-- 登录脚本
-- By: LaiLiGao(2004-06-20)
-- Update: Dan_Deng(2004-07-09) 添加自动更新技能功能
Msg2Player("Call to login_lod.lua")
do return end

Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\systemconfig.lua") -- 系统配置

Include("\\script\\missions\\autohang\\function.lua")		-- for 挂机功能
Include("\\script\\global\\skills_table.lua")				-- 自动更新技能
Include("\\script\\task\\newtask\\newtask_head.lua")	

-- LLG_ALLINONE_TODO_20070802 待确认
Include ("\\script\\event\\newbielvlup\\event.lua")
Include("\\script\\event\\qingming\\event.lua")
Include("\\script\\event\\playerlvlup\\event_temp.lua")

Include("\\script\\shitu\\shitu.lua")
Include("\\script\\global\\titlefuncs.lua")
IL("TITLE");
Include("\\script\\lib\\log.lua")

function main_old()
	check_update()					-- 技能更新、门派加标识（2004-05-31）
	patchShituProcess(PlayerIndex)
-- login_enterthd()				-- 自动进入挂机地图	
	login_check_dupe()
	--GetNewBulletin()
	check_townpotol()
	title_loginactive()
	if (SYSCFG_PARTNER_OPEN) then
		SyncPartnerMasterTask();  -- 同步同伴剧情任务变量
	end
	
	local nValue = GetTask(9)
	if nValue > 80*256 then
		if GetLastFactionNumber() ~= 9 then
			SetTask(9,0)
			DelMagic(372)
			DelMagic(375)
			DelMagic(394)
			tbLog:PlayerActionLog("fix taskid 9", "for kunlun")
		else
			SetTask(9,70*256)
			tbLog:PlayerActionLog("fix taskid 9", "for other")
		end
	end
end

------------------
-- 第一次延时同步的数据，在此添加
function delaysync_1()
	GetNewBulletin();
	return 0;
end

-- 第二次延时同步的数据，在此添加
function delaysync_2()
	SyncTaskValue(1082)		--同步Boss杀手任务变量到客户端
	messenger_copytaskvalue()  --同步信使任务的任务变量
	SyncPartnerMasterTask()    -- 同步同伴剧情任务
	return 0;
end

-- 第三次延时同步的数据，在此添加
function delaysync_3()
	GetAllCitySummary();
	SyncTaskValue(1569)	--中秋月饼
	return 1;
end


-------------------------------------------
function check_townpotol()
	if (GetTask(1505) == 1) then
		DisabledUseTownP(0)
		SetTask(1505,0)
	end
end

function login_enterthd()
	mapList = {235, 236, 237, 238, 239, 240, 241};
	MapCount = getn(mapList);

	-- 若已在挂机地图，则不用再进了
	nCurSWID = SubWorldIdx2ID();
	for i = 1, MapCount do
		if (nCurSWID == mapList[i]) then
			return 0;
		end
	end
	
	nMapID = random(1, MapCount);
	aexp_gotothd(mapList[nMapID]);
end;

-- 检测是否有复制装备标记，并发擎告
function login_check_dupe()
	local nValue = GetTask(156);
	if (nValue > 0) then
		Say("<color=red>B筺 s?d鬾g v藅 ph萴  b?ph鬰 ch? h?th鑞g ph竧 hi謓 v? x鉧! N誹 b筺 c?ki課 nghi g?xin li猲 h?v韎 ngi qu秐 l? C秏 琻 b筺  h頿 t竎!<color>", 1, "Tho竧/dupe_warning");

		SetTask(156, nValue - 1);
	end
end

function dupe_warning()
	Msg2Player("B筺 s?d鬾g v藅 ph萴  b?ph鬰 ch? h?th鑞g ph竧 hi謓 v? x鉧! N誹 b筺 c?ki課 nghi g?xin li猲 h?v韎 ngi qu秐 l? C秏 琻 b筺  h頿 t竎!");
end

function messenger_copytaskvalue()
	
	SyncTaskValueMore(1201, 1247, 1)
	--for i = 1201, 1247 do 
	--	SyncTaskValue(i)
	--end
end

function no()
end;

-- 同步同伴剧情任务变量
function SyncPartnerMasterTask()

local i=0;

	SyncTaskValue(1262);
	SyncTaskValue(1256);
	
	-- 同步同伴随机任务
	SyncTaskValue(1301);
	SyncTaskValue(1302);
	SyncTaskValue(1303);
	SyncTaskValue(1304);
	SyncTaskValue(1305);
	SyncTaskValue(1306);
	
	-- 同步任务引擎所用的变量
	for i=2000, 2300 do
		SyncTaskValue(i);
	end;

end;

--加入旧的Login main函数
if login_add then login_add(main_old, 0) end
--加入旧的分步同步函数
if login_add then login_add(delaysync_1, 1) end
if login_add then login_add(delaysync_2, 2) end
if login_add then login_add(delaysync_3, 3) end
