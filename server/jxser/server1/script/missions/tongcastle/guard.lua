Include("\\script\\missions\\tongcastle\\tongcastle.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local tbUseMapInfo = {
	[978] = {1, 1},
	[979] = {2, 11},
	[980] = {3, 162},
	[981] = {4, 37},
	[982] = {5, 78},
	[983] = {6, 80},
	[984] = {7, 176},
}

local tbGuardType = {
	[1] = {nNpcId = 1908, szName = "B¨ng §«ng Thñ VÖ", nNpcParam = 4,},
	[2] = {nNpcId = 1909, szName = "HuyÔn Vùng Thñ VÖ", nNpcParam = 5,},
	[3] = {nNpcId = 1910, szName = "Tõ Hµng Thñ VÖ", nNpcParam = 6,},
	[4] = {nNpcId = 1911, szName = "Háa T­êng Thñ VÖ", nNpcParam = 7,},
}

function CheckNearTreeNpc()
	local tbNpc, nCount = GetAroundNpcList(15)
	for i = 1, nCount do 
		local nNpcParam = GetNpcParam(tbNpc[i], 1)
		local nTmpCamp = GetTmpCamp(tbNpc[i])
		if  nNpcParam >= 1 and nNpcParam <= 3 and nTmpCamp == 1 then
			return 1
		end
	end
end

function CallGuard(nType, nItemIndex)
	local nNpcSettingId = %tbGuardType[nType].nNpcId
	local szName = %tbGuardType[nType].szName
	local nNpcParam = %tbGuardType[nType].nNpcParam
	local nX32, nY32, nMapIndex =  GetPos()
	local nMapId = SubWorldIdx2ID(nMapIndex)
	
	if %tbUseMapInfo[nMapId] == nil then
		Talk(1, "", "§Þa ®é hiÖn t¹i kh«ng thÓ triÖu håi Thñ VÖ")
		return
	end
	local nCity = %tbUseMapInfo[nMapId][1]
	local szCityTongName = GetCityOwner(nCity)
	local szTongName = GetTongName()
	if szCityTongName ~= szTongName then
		Talk(1, "", "Ng­¬i chØ cã thÓ triÖu håi Thñ VÖ t¹i bang chiÕm thµnh cña m×nh")
		return
	end
	if TongCastle:GuardIsLimit(nMapId) ~= 1 then
		Talk(1, "", "Thñ VÖ ®· v­ît giíi h¹n, kh«ng thÓ triÖu håi")
		return
	end
	
	if CheckNearTreeNpc() ~= 1 then
		Talk(1, "", "ChØ cã thÓ triÖu håi Thñ VÖ gÇn chç ThÇn Méc")
		return 
	end
	
	local tbNpc = {
		nNpcId = nNpcSettingId,
		szName = szName,
		nLevel = 90,
		nIsboss = 1,
		bNoRevive = 1,
		tbNpcParam = {nNpcParam,},
	}
	local nNewNpcIndex = TongCastle:basemission_CallNpc(tbNpc, nMapId, nX32, nY32)
	local nStackCount = GetItemStackCount(nItemIndex)
	if nStackCount > 1 then
		SetItemStackCount(nItemIndex, nStackCount - 1)
	else
		RemoveItemByIndex(nItemIndex)
	end
	if nNewNpcIndex > 0 then
		SetTmpCamp(1, nNewNpcIndex)
		TongCastle:RegANpc(nMapId, nNpcParam, 0, nNewNpcIndex, GetNpcId(nNewNpcIndex))
	end
end

function main(nItemIndex)
	local szTitle = "ChänThñ VÖ mµ ng­¬i muèn triÖu håi"
	local tbOpt = 
	{
		{"TriÖu håi B¨ng §«ng Thñ VÖ", CallGuard, {1, nItemIndex}},
		{"TriÖu håi HuyÔn Vùng Thñ VÖ", CallGuard, {2, nItemIndex}},
		--{"ÕÙ»½´Èº½ÊØÎÀ", CallGuard, {3, nItemIndex}},
		{"TriÖu håi Háa T­êng Thñ VÖ", CallGuard, {4, nItemIndex}},
		{"KÕt thóc ®èi tho¹i"}
	}
	CreateNewSayEx(szTitle, tbOpt)
	return 1
end