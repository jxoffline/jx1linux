Include("\\script\\missions\\basemission\\lib.lua")
local tbMap = 
		{
			{nId = 121, szName = "Long M«n trÊn", tbPos = { {251, 261}, {268, 293}	}},
			{nId = 100, szName = "Chu Tiªn trÊn", tbPos = { {201, 211}, {219, 182}	}},
			{nId = 101, szName = "§¹o H­¬ng th«n", tbPos = { {225, 185}, {190, 176} }},
			{nId = 174, szName = "Long TuyÒn th«n", tbPos = { {182, 189}, {193, 216} }},
			{nId = 53, szName = "Ba L¨ng huyÖn", tbPos = { {220, 189}, {178, 204} }},
			{nId = 20, szName = "Giang T©n Th«n", tbPos = { {459, 365}, {452, 396} }},
			{nId = 153, szName = "Th¹ch Cæ trÊn", tbPos = { {226, 218}, {184, 217}	}},
			{nId = 99, szName = "VÜnh L¹c trÊn", tbPos = { {216, 182}, {185, 199} }},
		}
		
function shengdan0811_SummonThief(nMapId, nPosX, nPosY)
	local tbNpc = {
			{nNpcId = 1386, nLevel = 95, szName = "Linh Ng­u", nIsboss = 1,nTime = 60*60*23, nSeries = 0},
			{nNpcId = 1387, nLevel = 95, szName = "Linh Ng­u", nIsboss = 1,nTime = 60*60*23, nSeries = 1},
			{nNpcId = 1388, nLevel = 95, szName = "Linh Ng­u", nIsboss = 1,nTime = 60*60*23, nSeries = 2},
			{nNpcId = 1389, nLevel = 95, szName = "Linh Ng­u", nIsboss = 1,nTime = 60*60*23, nSeries = 3},
			{nNpcId = 1390, nLevel = 95, szName = "Linh Ng­u", nIsboss = 1,nTime = 60*60*23, nSeries = 4},
		}
	
	for i=1, getn(tbNpc) do
		tbNpc[i].szDeathScript = "\\script\\event\\shengdan_jieri\\200811\\newboss\\bossdeath.lua";
		tbNpc[i].szScriptPath = "\\script\\event\\shengdan_jieri\\200811\\newboss\\bossdeath.lua";
		
		basemission_CallNpc(tbNpc[i], nMapId, (nPosX+(2-i)) * 32, (nPosY+(i-2)) * 32);
	end
end

