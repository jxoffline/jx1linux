-------------------------------------------------------------------------
-- FileName		:	partner_master_lib.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-26 17:25:25
-- Desc			:	同伴剧情任务队伍内分享函数
-------------------------------------------------------------------------
--master_taskid：		玩家做任务的变量
--master_value：		玩家做任务应该达到的变量值
--partner_uworld：		记录获得物品数量的变量
--partner_master_exp：	玩家可获得的经验
--partner_taskid：		数值决定了玩家将随机获得哪个任务的物品
--BMapId：				玩家应当所在的地图
--partner_valuebit：    要改变的任务变量的位数

Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\partner\\partner_head.lua") --包含了图象调用
IncludeLib("PARTNER")

----------------------------------------------------------小怪挂掉后调用的给队内所有玩家加经验和道具数量的脚本---------------------------------------------------
function lib_master_shanzei(master_taskid,master_value,partner_uworld,partner_master_exp,partner_taskid,BMapId)  
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local yaocai = random(1,2)
	if (nMemCount == 0 ) then
		AddOwnExp(partner_master_exp)
		if ( yaocai == 1 ) and ( nt_getTask(master_taskid) == master_value ) then
			nt_setTask(partner_uworld,nt_getTask(partner_uworld)+1)
			if ( partner_taskid == 1 ) then
				Msg2Player("您获得了一株地黄草。")
			elseif 	( partner_taskid == 2 ) then
				Msg2Player("您获得了一株费叶。")
			end
		end
		PlayerIndex = nPreservedPlayerIndex;
		return
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember(i)
			local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --获得当前玩家所在位置
			if ( BMapId == prize_mapid ) then   --判断是否在杀死怪物的玩家的所在地图
				AddOwnExp(partner_master_exp)
				if ( yaocai == 1 ) and ( nt_getTask(master_taskid) == master_value ) then
					nt_setTask(partner_uworld,nt_getTask(partner_uworld)+1)
					if ( partner_taskid == 1 ) then
						Msg2Player("您获得了一株地黄草。")
					elseif 	( partner_taskid == 2 ) then
						Msg2Player("您获得了一株费叶。")
					end
				end
			end
		end
		PlayerIndex = nPreservedPlayerIndex;
		return
	end
end;

---------------------------------------------------------boss挂掉后给给队内所有玩家增加经验和杀掉后开关的共享脚本----------------------------------

function lib_master_zhaizhu(master_taskid,master_value,partner_master_exp,partner_taskid,partner_valuebit,BMapId) 
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	if (nMemCount == 0 ) then
		AddOwnExp(partner_master_exp)
		if ( nt_getTask(master_taskid) == master_value ) then
			nt_setTask(partner_taskid,SetBit(GetTask(partner_taskid),partner_valuebit,1))
		end
		PlayerIndex = nPreservedPlayerIndex;
		return
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember(i)
			local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --获得当前玩家所在位置
			if ( BMapId == prize_mapid ) then   --判断是否在杀死怪物的玩家的所在地图
				AddOwnExp(partner_master_exp)
				if ( nt_getTask(master_taskid) == master_value ) then
					nt_setTask(partner_taskid,SetBit(GetTask(partner_taskid),partner_valuebit,1))
				end
			end
		end
		PlayerIndex = nPreservedPlayerIndex;
		return
	end
end

---------------------------------------------------------boss挂掉后给给队内所有玩家增加经验和改变变量的共享脚本----------------------------------
function lib_master_shenzeiwang(master_taskid,master_value,partner_master_exp,partner_taskid,partner_value,BMapId) 
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	if (nMemCount == 0 ) then
		AddOwnExp(partner_master_exp)
		if ( nt_getTask(master_taskid) == master_value ) then
			nt_setTask(partner_taskid,partner_value)
		end
		PlayerIndex = nPreservedPlayerIndex;
		return
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember(i)
			local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --获得当前玩家所在位置
			if ( BMapId == prize_mapid ) then   --判断是否在杀死怪物的玩家的所在地图
				AddOwnExp(partner_master_exp)
				if ( nt_getTask(master_taskid) == master_value ) then
					nt_setTask(partner_taskid,partner_value)
				end
			end
		end
		PlayerIndex = nPreservedPlayerIndex;
		return
	end
end