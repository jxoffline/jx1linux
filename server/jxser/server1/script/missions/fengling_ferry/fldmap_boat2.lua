Include("\\script\\missions\\fengling_ferry\\fld_head.lua")
function main()
	mapid = boatMAPS[2]
	orgworld = SubWorld
	boatidx = SubWorldID2Idx(mapid)
	if (boatidx < 0) then
		local SignMapId = SubWorldIdx2ID(SubWorld);
		print("ERROR !!!BoatMap2 Is Not In This Server!", mapid); 
		return
	end
	SubWorld = boatidx
	OpenMission(MISSIONID)
	str = "Cuéc ®ua thuyÒn ë Phong L¨ng §é chuÈn bÞ khai cuéc, h·y mau ®Õn Bê Nam Phong L¨ng §é gÆp ThuyÒn phu Êt nép Phong L¨ng §é lÖnh bµi hoÆc 200 quyÓn MËt ®å thÇn bÝ ®Ó ®¨ng ký thuyÒn!"
	AddGlobalCountNews(str, 3)
	SetMissionV(MS_STATE, 2)
	SubWorld = orgworld
end