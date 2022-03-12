Include("\\vng_script\\activitysys\\config\\1036\\head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")

pActivity.nPak = curpack()

function pActivity:InitAddNpc()
	self:AddAmbienceNpc()
	--self:AddPlutus()
end

function pActivity:AddAmbienceNpc()
	Include("\\vng_script\\activitysys\\config\\1036\\ambience_npc.lua")
	DynamicExecute("\\vng_script\\activitysys\\config\\1036\\ambience.lua", "tbAmbience:CreateNpc",tbAmbienceNpc)
end

function pActivity:AddPlutus()
	local szNpcName = "ßπi Th«n Tµi"
	local nNpcId = 1528
	local tbNpcPos = {
		{176,1585,2953},
		{1,1584,3192},
		{37,1709,3118},
		{162,1621,3183},
		{78,1586,3223},
		{11,3139,5063}}
			
	NpcFunLib:AddDialogNpc(szNpcName, nNpcId, tbNpcPos)
end
