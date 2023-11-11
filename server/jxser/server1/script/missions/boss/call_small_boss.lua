tbBossTieu = {
	[1] = {szName = "TÞnh Kh«ng", 								nLevel = 95, nSeries = 0 , nId = 1356,tbPos = {103, {{195, 215}, {233, 196},{200, 210}, {199, 180},},},},
	[2] = {szName = "Ng¹o Thiªn T­íng Qu©n",			nLevel = 95, nSeries = 0 , nId = 1357,tbPos = {59, {{189, 194}, {213, 208},{193, 209}, {210, 203},},},},
	[3] = {szName = "LiÔu Thanh Thanh",						nLevel = 95, nSeries = 1 , nId = 1358,tbPos = {25, {{483, 331}, {499, 332},{522, 325}, {486, 314},},},},
	[4] = {szName = "T©y V­¬ng Tµ §éc",					nLevel = 95, nSeries = 1 , nId = 1359,tbPos = {183, {{195, 202}, {179, 205},{170, 192}, {187, 205},},},},
	[5] = {szName = "DiÖu Nh­",									nLevel = 95, nSeries = 2 , nId = 1360,tbPos = {13, {{208, 315}, {285, 302},{223, 316}, {266, 312},},},},
	[6] = {szName = "Do·n Thanh V©n",						nLevel = 95, nSeries = 2 , nId = 1361,tbPos = {154, {{47, 77}, {58,102}, {76,84}, {35/87},},},},
	[7] = {szName = "ThËp Ph­¬ng C©u DiÖt",				nLevel = 95, nSeries = 3 , nId = 1363,tbPos = {45, {{200, 200}, {212, 202},{212, 192}, {195, 192},},},},
	[8] = {szName = "H¾c Y S¸t Thñ",							nLevel = 95, nSeries = 3 , nId = 1362,tbPos = {115, {{200, 200}, {192, 249},{180, 207}, {170, 203},},},},
	[9] = {szName = "Tr­¬ng T«ng ChÝnh",					nLevel = 95, nSeries = 4 , nId = 1364,tbPos = {81, {{191, 216}, {237, 178},{201, 210}, {215, 200},},},},
	[10]={szName = "Thanh Y Tö",								nLevel = 95, nSeries = 4 , nId = 1365,tbPos = {131, {{173, 208}, {210, 207},{202, 189}, {175, 190},},},},
}

function Call_Small_Boss()
	for i = 1, getn(tbBossTieu) do
		local nId = tbBossTieu[i].nId 
		local nLevel = tbBossTieu[i].nLevel 
		local nSeries = tbBossTieu[i].nSeries 
		local tbPos = tbBossTieu[i].tbPos 
		local szName = tbBossTieu[i].szName
		local nW = tbPos[1]
		local randomloc = random(1,4) 
		local nX, nY = tbPos[2][randomloc][1], tbPos[2][randomloc][2] 
		local mapidx = SubWorldID2Idx(nW)
		local szMapName = SubWorldName(mapidx)
		if (mapidx < 0) then
			return
		end
		local nNpcIndex = AddNpcEx(nId, nLevel, nSeries, mapidx, nX*8*32, nY*16*32, 1, szName, 1)
		if (nNpcIndex > 0) then
			SetNpcScript(nNpcIndex,"\\script\\missions\\boss\\bosstieu.lua")
			SetNpcTimer(nNpcIndex, 60*60*18);
			local szNews = format("Boss tiÓu Hoµng Kim:<color=yellow>" ..szName.. "<color> ®· xuÊt hiÖn t¹i <color=green>"..szMapName.."<color> ("..nX.."/"..nY..")")
			Msg2Player(szNews)
			WriteBossLog(format("%s:%s,%s,%d,%d", "BOSS tiÓu Hoµng Kim", szName, mapidx, nX, nY));
			AddGlobalNews(szNews)
		end
	end
end;

function WriteBossLog(szLog)
	WriteLog("[CALLBOSS TiÓu]\t"..GetLocalDate("%Y-%m-%d %H:%M:%S\t")..szLog);
end;