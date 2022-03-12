Include("\\script\\lib\\objbuffer_head.lua")

tbCallBossNewRandom = tbCallBossNewRandom or {}

tbCallBossNewRandom.tbBossNewPos = {
		{nRan=1,nId=1,tbPos={71,1681,3011},},
		{nRan=1,nId=2,tbPos={71,1661,3125},},
		{nRan=1,nId=3,tbPos={71,1699,3131},},
		{nRan=1,nId=4,tbPos={71,1614,3161},},
		{nRan=1,nId=5,tbPos={71,1669,3205},},
		{nRan=1,nId=6,tbPos={71,1594,3236},},
		{nRan=1,nId=7,tbPos={71,1644,3331},},
		{nRan=1,nId=8,tbPos={73,1569,3193},},
		{nRan=1,nId=9,tbPos={73,1507,2864},},
		{nRan=1,nId=10,tbPos={73,1492,3003},},
		{nRan=1,nId=11,tbPos={73,1575,3104},},
		{nRan=1,nId=12,tbPos={73,1657,2952},},
		{nRan=1,nId=13,tbPos={4,1655,3150},},
		{nRan=1,nId=14,tbPos={4,1584,3113},},
		{nRan=1,nId=15,tbPos={4,1656,2975},},
		{nRan=1,nId=16,tbPos={5,1667,3495},},
		{nRan=1,nId=17,tbPos={5,1520,3315},},
		{nRan=1,nId=18,tbPos={5,1831,3548},},
		{nRan=1,nId=19,tbPos={5,1522,3480},},
		{nRan=1,nId=20,tbPos={6,1527,3134},},
		{nRan=1,nId=21,tbPos={6,1700,3335},},
		{nRan=1,nId=22,tbPos={6,1624,3423},},
		{nRan=1,nId=23,tbPos={6,1405,3169},},
		{nRan=1,nId=24,tbPos={22,1798,3139},},
		{nRan=1,nId=25,tbPos={22,1867,3230},},
		{nRan=1,nId=26,tbPos={22,1588,3200},},
		{nRan=1,nId=27,tbPos={23,1762,3033},},
		{nRan=1,nId=28,tbPos={23,1829,3260},},
		{nRan=1,nId=29,tbPos={23,1618,3174},},
		{nRan=1,nId=30,tbPos={23,1640,3260},},
		{nRan=1,nId=31,tbPos={23,1773,3373},},
		{nRan=1,nId=32,tbPos={182,2201,3496},},
		{nRan=1,nId=33,tbPos={182,1914,3119},},
		{nRan=1,nId=34,tbPos={182,1606,3209},},
		{nRan=1,nId=35,tbPos={182,1694,3307},},
		{nRan=1,nId=36,tbPos={180,1524,3005},},
		{nRan=1,nId=37,tbPos={180,1527,3162},},
		{nRan=1,nId=38,tbPos={180,1670,3068},},
		{nRan=1,nId=39,tbPos={180,1807,3008},},
		{nRan=1,nId=40,tbPos={194,1646,3415},},
		{nRan=1,nId=41,tbPos={194,1531,3119},},
		{nRan=1,nId=42,tbPos={194,1678,3039},},
		{nRan=1,nId=43,tbPos={94,1597,3147},},
		{nRan=1,nId=44,tbPos={94,1675,3197},},
		{nRan=1,nId=45,tbPos={94,1631,3032},},
		{nRan=1,nId=46,tbPos={42,1655,3050},},
		{nRan=1,nId=47,tbPos={42,1639,2972},},
		{nRan=1,nId=48,tbPos={42,1593,2953},},
		{nRan=1,nId=49,tbPos={42,1510,3162},},
		{nRan=1,nId=50,tbPos={91,1614,3129},},
		{nRan=1,nId=51,tbPos={91,1643,3008},},
		{nRan=1,nId=52,tbPos={91,1591,2791},},
		{nRan=1,nId=53,tbPos={91,1720,2774},},
}

tbCallBossNewRandom.tbBossNewNameMap = {
	[71] = "B¹ch Thñy §éng",
	[73] = "Phôc L­u §éng",
	[4] = "Kim Quang §éng",
	[5] = "Kinh Hoµng §éng",
	[6] = "Táa V©n §éng",
	[22] = "B¹ch V©n §éng",
	[23] = "ThÇn Tiªn §éng",
	[182] = "NghiÖt Long §éng",
	[180] = "Long Cung §éng",
	[194] = "Ngäc Hoa §éng",
	[94] = "Linh Cèc §éng",
	[42] = "Thiªn T©m §éng",
	[91] = "Kª Qu¸n §éng",
}

tbCallBossNewRandom.tbNomal_Boss_Info ={
	[1]	= {n_level = 90, 	n_series = 1,n_npcid = 523,sz_name = "LiÔu Thanh Thanh"},
	[2]	= {n_level = 90, 	n_series = 2,n_npcid = 513,sz_name = "DiÖu Nh­ "},
	[3]	= {n_level = 90, 	n_series = 4,n_npcid = 511,sz_name = "Tr­¬ng T«ng ChÝnh"},
}


function tbCallBossNewRandom:GetBossPosGS()
--	randomseed( tonumber( date("%m%d%H%M%S") ) )
	local tbTemp = {}
	for i=1, getn(self.tbBossNewPos) do
		tbTemp[i] = tbTemp[i] or {}
		tbTemp[i].nRan =  random(1,100);
		tbTemp[i].nId =  self.tbBossNewPos[i].nId;
	end
	sort(tbTemp, function(x,y) return tonumber(x.nRan) > tonumber(y.nRan) end)
	return tbTemp
end


function tbCallBossNewRandom:GetBossNewPos(nId)
	local tbTmp = self.tbBossNewPos
	for _,k in self.tbBossNewPos do
		if(k.nId == nId) then
			return k.tbPos
		end	
	end
	return
end

function tbCallBossNewRandom:CallBossNewFixureGS(ParamHandle)
	for i,k in self.tbNomal_Boss_Info do
		local nId = ObjBuffer:PopObject(ParamHandle)
		local tbPosNew = self:GetBossNewPos(nId)
		if(not tbPosNew) then return end
		local nlvl, nseries, nid, szname, nworldidx	= 	k.n_level, k.n_series, k.n_npcid, k.sz_name, SubWorldID2Idx(tbPosNew[1]);
		if (nworldidx >= 0) then
			local nNpcIndex = AddNpcEx(nid, nlvl, nseries, nworldidx, tbPosNew[2] * 32,tbPosNew[3] * 32, 1, szname, 1);
			if nNpcIndex > 0 then
				SetNpcScript(nNpcIndex,"\\script\\missions\\boss\\bossstat.lua")
				SetNpcTimer(nNpcIndex, 18*10);
				local szMsg = format("[%s:%s] %s,%d,%d", "BOSS", szname, tbPosNew[1], tbPosNew[2], tbPosNew[3] )
				print(szMsg)
			else
				WriteLog(format("[CALLBOSS ERROR]\t%s\t%s\t%d\t%d\r\n", szname, self.tbBossNewNameMap[tbPosNew[1]], tbPosNew[2], tbPosNew[3]));
			end
			
			
		end
	end
end
