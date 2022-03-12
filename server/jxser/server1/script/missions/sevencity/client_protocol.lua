Include("\\script\\missions\\sevencity\\war.lua")
Include("\\script\\lib\\objbuffer_head.lua")

ClientProtocol = {}

function ClientProtocol:Process(playerindex, event)
	local handle = OB_Create()
	local player = Player:New(playerindex)
	self:SendReport(event, player, handle)
	OB_Release(handle)
end

function ClientProtocol:SendReport(event, player, handle)
	local tb = BattleWorld:GetStandings(player:GetName())
	OB_PushString(handle, event)
	OB_PushInt(handle, 2)	-- table count

	-- 杀敌数、击破龙柱数
	OB_PushInt(handle, 1)	-- first table index
	OB_PushInt(handle, 3)	-- cell count
	OB_PushInt(handle, 1)	-- 第一个表第一个元素的行坐标
	OB_PushInt(handle, 1)	-- 第一个表第一个元素的列坐标
	OB_PushString(handle, tostring(tb.KillWarriorCount))	-- 杀敌数
	OB_PushInt(handle, 2)	-- 第一个表第二个元素的行坐标
	OB_PushInt(handle, 1)	-- 第一个表第二个元素的列坐标
	OB_PushString(handle, tostring(tb.KillMonsterCount))	-- 击破龙柱数
	OB_PushInt(handle, 3)	-- 第一个表第三个元素的行坐标
	OB_PushInt(handle, 1)	-- 第一个表第三个元素的列坐标
	OB_PushString(handle, tostring(tb.TimeScore))			-- 时间积分
	
	-- 杀敌数量前10的玩家
	local topten = BattleWorld:GetTopList()
	OB_PushInt(handle, 2)	-- second table index
	local count = 0
	if (topten) then
		count = getn(topten)
	end
	OB_PushInt(handle, count)
	for i = 1, count do
		OB_PushInt(handle, i)
		OB_PushInt(handle, 1)
		local item = topten[i]
		OB_PushString(handle, format("%s(%d)", item[1], item[2]))
	end
	player:SendScriptData(4, handle)
end
