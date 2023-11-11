---Script -- By-NguyenKhai-------
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\global\\judgeoffline_limit.lua");
Include("\\script\\missions\\basemission\\lib.lua")
IncludeLib("ITEM")
IncludeLib("LEAGUE")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\activitysys\\g_activity.lua")
IncludeLib("TASKSYS");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\Â·ÈË_Àñ¹Ù.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\composelistclass.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\lib\\droptemplet.lua")


function thuytacdaulinh()
--bossben1A()
--bossben1B()
--bossben2A()
--bossben2B()
--bossben3A()
--bossben3B()
end

function bossben1A()
nNpcIndex = AddNpc(513, 85,SubWorldID2Idx(337), 1636*32, 3221*32, 1, "DiÖu Nh­", 1)
if nNpcIndex > 0 then
SetNpcDeathScript(nNpcIndex,"\\script\\global\\tamhiep\\callbossdeathmini.lua");
SetNpcTimer(nNpcIndex,900*18)
end
end
function bossben1B()
nNpcIndex = AddNpc(511, 85,SubWorldID2Idx(337), 1632*32, 3221*32, 1, "Tr­¬ng T«ng ChÝnh", 1)
if nNpcIndex > 0 then
SetNpcDeathScript(nNpcIndex,"\\script\\global\\tamhiep\\callbossdeathmini.lua");
SetNpcTimer(nNpcIndex,900*18)
end
end


function bossben2A()
nNpcIndex = AddNpc(513, 85,SubWorldID2Idx(338), 1636*32, 3221*32, 1, "DiÖu Nh­", 1)
if nNpcIndex > 0 then
SetNpcDeathScript(nNpcIndex,"\\script\\global\\tamhiep\\callbossdeathmini.lua");
SetNpcTimer(nNpcIndex,900*18)
end
end
function bossben2B()
nNpcIndex = AddNpc(511, 85,SubWorldID2Idx(338), 1632*32, 3221*32, 1, "Tr­¬ng T«ng ChÝnh", 1)
if nNpcIndex > 0 then
SetNpcDeathScript(nNpcIndex,"\\script\\global\\tamhiep\\callbossdeathmini.lua");
SetNpcTimer(nNpcIndex,900*18)
end
end


function bossben3A()
nNpcIndex = AddNpc(513, 85,SubWorldID2Idx(339), 1636*32, 3221*32, 1, "DiÖu Nh­", 1)
if nNpcIndex > 0 then
SetNpcDeathScript(nNpcIndex,"\\script\\global\\tamhiep\\callbossdeathmini.lua");
SetNpcTimer(nNpcIndex,900*18)
end
end
function bossben3B()
nNpcIndex = AddNpc(511, 85,SubWorldID2Idx(339), 1632*32, 3221*32, 1, "Tr­¬ng T«ng ChÝnh", 1)
if nNpcIndex > 0 then
SetNpcDeathScript(nNpcIndex,"\\script\\global\\tamhiep\\callbossdeathmini.lua");
SetNpcTimer(nNpcIndex,900*18)
end
end


function OnTimer(nNpcIndex,nTimeOut)
DelNpc(nNpcIndex)
end






