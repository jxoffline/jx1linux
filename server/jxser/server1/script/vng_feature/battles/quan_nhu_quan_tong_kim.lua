Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
function VnLoadBattleNpcs()	
	local tbNpc = {
		{ szName = "MÈ Binh Quan (Vµng)", 	nLevel = 95, nNpcId = 62, nMapId = 162, nPosX = 1615*32, nPosY = 3262*32, nIsboss = 0, szScriptPath = "\\script\\battles\\battlejoin1.lua",},
		{ szName = "MÈ Binh Quan (T›m)", 	nLevel = 95, nNpcId = 61, nIsboss = 0, nMapId = 162, nPosX = 1571*32, nPosY = 3283*32, szScriptPath = "\\script\\battles\\battlejoin2.lua",},
		{ szName = "Qu©n Nhu Quan", 	nLevel = 95, nNpcId = 55, nIsboss = 0, nMapId = 162, nPosX = 1606*32, nPosY = 3269*32, szScriptPath = "\\script\\global\\Ãÿ ‚”√µÿ\\ÀŒΩ±®√˚µ„\\npc\\song_shop.lua",},
		{ szName = "Qu©n Nhu Quan", 	nLevel = 95, nNpcId = 49, nIsboss = 0, nMapId = 162, nPosX = 1562*32, nPosY = 3289*32, szScriptPath = "\\script\\global\\Ãÿ ‚”√µÿ\\ÀŒΩ±®√˚µ„\\npc\\jin_shop.lua",},
	}
	for i=1,getn(tbNpc) do		
		basemission_CallNpc(tbNpc[i])	
	end
end

AutoFunctions:Add(VnLoadBattleNpcs)