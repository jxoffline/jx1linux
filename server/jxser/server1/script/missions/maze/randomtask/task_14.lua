-- 50只刺猬，要求杀死33只过30秒后还是33只才能过关，不杀够不能完成任务，多杀1只则会出现BOSS刺猬王，要杀死刺猬才能过关，刺猬BOSS比较强悍。
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(14)

function pTask:OnStart()
end

function pTask:OnDestroy()
end
