-- 对话NPC列表 
-- wangbin 2010.12.10
-- 用这个类就不用再为新建对话NPC设置对话脚本，只要直接实现一个类就可以

-- 例如：可以在你的脚本代码中实现一个类NpcChefu
-- 车夫
-- NpcChefu = {
-- 	m_Caption = "车夫：要坐车去哪里？",
-- 	m_Options = {
-- 		"我要去成都",
-- 		"我要去大理",
-- 		"我要去汴京",
-- 		"我要去襄阳",
-- 		"我要去扬州",
-- 		"我要去临安",
-- 		"哪儿也不去"
-- 	}
-- }
-- 返回值：string, {string, string, ...}
-- 或者：string
-- function NpcChefu:Say(player, param)
-- 	return self.m_Caption, self.Options
-- end
-- 
-- sel是m_Options的索引
-- function NpcChefu:OnAnswer(player, sel, param)
-- 	if (sel > 0 and sel < 8) then
-- 		local mapid, x, y = GetStationPos(sel)
-- 		if (mapid ~= nil and NewWorld(mapid, x, y) == 1) then
-- 			Msg2Player("坐好了！咱们走啰！")
-- 		end
-- 	end
-- end
-- 增加车夫NPC：参数依次为：名字，npcid，mapid, x, y, 实现类
-- nNpcIndex = DlgNpcManager:AddNpc("车夫", 238, 949, 51264, 101984, NpcChefu)
-- 删除车夫NPC:
-- DlgNpcManager:DelNpc(nNpcIndex)

Include("\\script\\global\\playerlist.lua")

DlgNpcManager = {
	m_Npcs = {},
	m_Idxs = {},
	m_Index = 0,
}

function DlgNpcManager:AddNpc(name, npcid, mapid, x, y, npc, param)
	local index = AddNpc(npcid, 1, SubWorldID2Idx(mapid), x, y, 1, name, 0)
	if (index <= 0) then
		WriteLog(format("[ERROR]Failed to create dialog npc(%s,%d,%d,%d,%d)", name, npcid, mapid, x, y))
		return 0
	end
	local tb = {}
	tb.Npc = npc
	tb.Index = index
	tb.PackNo = curpack()
	tb.Param = param
	SetNpcScript(index, "\\script\\global\\dlgnpc_list.lua", index)
	self.m_Index = self.m_Index + 1
	self.m_Npcs[self.m_Index] = tb
	self.m_Idxs[index] = self.m_Index
	return self.m_Index
end

function DlgNpcManager:DelNpc(index)
	local tb = self.m_Npcs[index]
	if (tb ~= nil) then
		if (tb.Index > 0) then
			DelNpc(tb.Index)
		end
		self.m_Npcs[index] = nil
		self.m_Idxs[tb.Index] = nil
	end
end

function DlgNpcManager:GetNpcIndex(index)
	local tb = self.m_Npcs[index]
	if (not tb) then
		return 0 
	end
	return tb.Index
end

function DlgNpcManager:GetNpc(index)
	local nIndex = self.m_Idxs[index]
	if (not nIndex) then
		return nil
	end
	return self.m_Npcs[nIndex]
end

function say(player, index, caption, options)
	if (caption ~= nil) then
		base = base or 0
		if (not options) then
			player:Say(caption)
		elseif (type(options) == "table") then
			local answers = {}
			for i = 1, getn(options) do
				tinsert(answers, format("%s/#select(%d,%d)", options[i], index, i))
			end
			player:Say(caption, getn(answers), answers)
		elseif (type(options) == "string") then
			local option = format("%s/select(%d,%d)", options, index, 1)
			player:Say(caption, 1, option)
		end
	end
end

function main(index)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return
	end
	local tb = DlgNpcManager:GetNpc(index)
	if (not tb or not tb.Npc or not tb.Npc.Say) then
		return
	end
	local pack = usepack(tb.PackNo)
	local caption, options, base = tb.Npc:Say(player, tb.Param)
	say(player, index, caption, options)
	usepack(pack)
end

function select(index, sel)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return
	end
	local tb = DlgNpcManager:GetNpc(index)
	if (not tb or not tb.Npc or not tb.Npc.OnAnswer) then
		return
	end
	local pack = usepack(tb.PackNo)
	local caption, options = tb.Npc:OnAnswer(player, sel, tb.Param)
	say(player, index, caption, options)
	usepack(pack)
end
