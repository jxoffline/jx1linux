-- 自动加载npc脚本
Include( "\\script\\global\\addxishancunnpc.lua" )
Include( "\\script\\task\\tollgate\\killbosshead.lua" )
Include( "\\script\\task\\tollgate\\addtollgatenpc.lua" ) --加载关卡任务涉及的NPC
Include( "\\script\\task\\partner\\partner_head.lua" )    --加载同伴任务涉及的NPC
Include ("\\script\\missions\\freshman_match\\add_championnpc.lua")
Include("\\script\\event\\mid_autumn\\add_zhongqiunpc.lua")
Include("\\script\\missions\\newcitydefence\\cd_addsignnpc.lua")
Include("\\script\\misc\\league_cityinfo.lua")
Include ("\\script\\missions\\leaguematch\\wlls_autoexec.lua")	--WLLS 武林联赛
Include ("\\script\\missions\\statinfo\\head.lua")	--数据统计
Include("\\script\\event\\wulin_2nd\\wulin_addmaster.lua")
Include("\\script\\global\\addspreadernpc.lua")			--游戏推广员
Include("\\script\\missions\\tongwar\\tongwar_autoexec.lua")
Include("\\script\\task\\lv120skill\\head.lua")	-- 120级技能任务
Include("\\script\\tong\\addtongnpc.lua")
Include("\\script\\中原北区\\汴京\\汴京\\trap\\bianjing_ximen_trap.lua")
Include("\\script\\江南区\\金山岛\\addnpcandtrap.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\npc.lua");	-- 黄连老叟
Include("\\script\\event\\change_destiny\\npc.lua");	-- 逆天改命
Include("\\script\\missions\\newpracticemap\\addnpc.lua");	-- 新练级地图	
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua"); -- 寻花打虎
Include("\\script\\misc\\timeline\\timelinemanager.lua") --时间轴
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\global\\eurofun\\npc\\add_npc.lua")
Include("\\script\\global\\huashan2013\\npc_hoason.lua")
Include("\\script\\global\\vuhon\\npc_vuhon.lua")
Include("\\script\\global\\autoexec_npc.lua")
Include("\\script\\global\\thinh\\npc\\add_npc.lua")

if (GetProductRegion() == "vn") then
	-- 2006 中秋节活动头文件
	Include("\\script\\event\\mid_autumn06\\autoexe.lua");
	Include("\\script\\global\\judgeoffline_special.lua")	--用于无名谷——托管服务器地图
	Include("\\script\\event\\collect_juanzhou\\autoaddnpc.lua")--收集神秘卷轴任务，明月镇npc
	Include("\\script\\event\\act2years_yn\\head.lua")       --越南两周年活动，明月镇npc
	Include("\\script\\两湖区\\南岳镇\\heisha_autoexec.lua")	-- 越南增加南岳镇to黑沙洞trap点
	
	Include("\\script\\event\\great_night\\great_night_head.lua")	--双龙洞黄金之核
end

MSID_LOCALNEWS = 17 --系统自动发送LocalNews计时器事件编号

Include([[\script\event\springfestival07\head.lua]]);

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\event\\other\\shensuanzi\\class.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")

function main()

	DynamicExecute("\\script\\missions\\tianchimijing\\floor1\\gamefloor1.lua","GameFloor1:Start")
	DynamicExecute("\\script\\missions\\tianchimijing\\floor2\\gamefloor2.lua","GameFloor2:Start")
	DynamicExecute("\\script\\missions\\tianchimijing\\floor3\\gamefloor3.lua","GameFloor3:Start")
	DynamicExecute("\\script\\missions\\tianchimijing\\floor4\\gamefloor4.lua","GameFloor4:Start")
	
--月歌岛
	DynamicExecute("\\script\\missions\\yuegedao\\yuegedao\\yuegedaoworld.lua", "YueGeDaoWorld:Start")
	DynamicExecute("\\script\\missions\\yuegedao\\yuegemigu\\yuegemiguworld.lua", "YueGeMiGuWorld:Start")

	DynamicExecute("\\script\\changefeature\\initmap.lua", "AddDailogNpc")
	DynamicExecute("\\script\\global\\npc\\huoke.lua", "CallHuoKeInit")
	DynamicExecute("\\script\\missions\\tianchimijing\\floor1\\yunchihead.lua", "AddEnterNpc")
	tbShenSuanZi:Init()
	
	OpenGlbMission(8)
	
	-- 启动数据统计任务
	OpenGlbMission(MSID_STAT_GOODS_SALE)

	buildAllCityInfoLeague()
	
	-- 挂机地图任务
	load_mission_aexp();
	add_dialognpc(adddialognpc);
	add_dialognpc(nw_npclist)
	add_dialognpc(npclist_sevencity)
	add_newtasknpc(addnewtasknpc);
	add_xishancunnpc(xishancunnpc);
	
	add_spreadernpc(spreadernpc);		--加载游戏推广员
	add_killertasknpc(addkillertasknpc);
	add_alltollgatenpc();   --加载关卡任务的相关npc
	--add_allpartnernpc();     --加载同伴任务的相关npc
	--add_zhongqiunpc();		--加载中秋活动npc
	cd_addsignnpc()			--加载卫国战争报名点NPC
	wlls_autoexe()	--WLLS 武林联赛
	--两周年活动NPC    
	add_dialognpc(tbActNpcList)
	tongwar_addsignnpc()
	add_tongnpc()	--加载帮会相关npc
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local szRegion = GetProductRegion();

	if (szRegion == "vn") then
		--add_dialognpc(ACT2YEAR_YN_NPC);	--两周年活动NPC   by子非鱼 2008-10-09删除过期NPC
		AnonymVale_auto();			--托管地图
		add_dialognpc(tab_springfestivalNPC);
		--add_dialognpc(addmoontown_mulao);	--收集神秘卷轴任务，明月镇npc by子非鱼 2008-10-09删除过期NPC
		--add_dialognpc(tbxmas2007_girl_binger) --2007圣诞活动，冰儿
		--add_dialognpc(newyear_2008_chunjiecailu) --2008新年采禄活动
		--西山屿
		add_dialognpc(tbaddJinShanDao_NpcAndTrap.tbDialogNpc);--增加对话npc
		tbaddJinShanDao_NpcAndTrap:AddTrapR()--增加右trap点
		tbaddJinShanDao_NpcAndTrap:AddTrapL()--增加左trap点
		tbaddJinShanDao_NpcAndTrap:AddMons()--增加怪物
		--add_obstacle_map();
		
		if(SubWorldID2Idx(11) >= 0) then
			local npcidx = AddNpc(245, 1, SubWorldID2Idx(11), 390 * 8 * 32, 317 * 16 * 32, 1, "Ho祅g Li猲 L穙 L穙");
			SetNpcScript(npcidx, "\\script\\event\\jiefang_jieri\\200904\\denggao\\npc.lua");
		end
		add_dialognpc(au06_tab_kidnpc);
		
		tbChangeDestiny:addNpc();	-- 逆天改命
		tbNewPracticeMap:addNpc();	-- 新练级地图
		tbBeatTiger:AddNpc();		-- 寻花打虎
	end

	--增加汴京西城门trap点
	add_trap_bianjingximen()
	add_heisha_entertrap();
	
	G_ACTIVITY:LoadActivitys()
	G_TASK:LoadAllConfig()
	G_ACTIVITY:OnMessage("ServerStart");
	
	tbTimeLineManager:LoadAllTimeLine(tbTimeLineList);
	AutoFunctions:Run()
	add_npc_thinh()
	add_npc_hoason()
    add_npc_vuhon()
	add_npc_vng_new()
	local szFile = "\\script\\event\\great_night\\great_night_head.lua"
	DynamicExecute(szFile, "OnGreatNightServerStart")
end;

function load_mission_aexp()
	mapTab = {235, 236, 237, 238, 239, 240, 241};
	nCount = getn(mapTab);
	
	oldSubWorld = SubWorld;
	for i = 1, nCount do
		idx = SubWorldID2Idx(mapTab[i]);
		if (idx ~= -1) then 
			SubWorld = idx;
			OpenMission(9);	-- 9为挂机Mission ID
		end;
	end;
	
	SubWorld = oldSubWorld;
end;

function add_dialognpc(Tab)
	for i = 1 , getn(Tab) do 
		local itemlist = Tab[i]
		SId = SubWorldID2Idx(itemlist[2]);
		if (SId >= 0) then
			
			npcindex = AddNpc(itemlist[1], 1, SId, itemlist[3] * 32, itemlist[4] * 32, 1, itemlist[6]);
			SetNpcScript(npcindex, itemlist[5]);
		else
			if itemlist[1] == 1454 then
				print(itemlist[6], itemlist[2])
			end
		end;
	end	
end;

function add_newtasknpc(Tab1)
	for i = 1 , getn(Tab1) do
		Mid = SubWorldID2Idx(Tab1[i][4]);
		if (Mid >= 0 ) then
			TabValue5 = Tab1[i][5] * 32
			TabValue6 = Tab1[i][6] * 32
			newtasknpcindex = AddNpc(Tab1[i][1],Tab1[i][2],Mid,TabValue5,TabValue6,Tab1[i][7],Tab1[i][8]);
			SetNpcScript(newtasknpcindex, Tab1[i][10]);
		end;
	end;
end;

