Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--¹¥³ÇÕ½µÄµØÍ¼ID
MSBegin = MS_TSCBEGIN;
Count = g_nMaxTscPerDoor * g_nDoorCount;
NpcTempl = 525;
NpcLevel = 60;

function main()

--¿´µ±Ç°Î»ÖÃÊÇ·ñ´¦ÔÚ¹¥³ÇÕ½µØÍ¼ÉÏ
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID();

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("B¹n kh«ng thÓ sö dông Hçn Th¹ch LiÖt t¹i ®©y ")
	return 1;
end

if (GetCurCamp() ~= 2) then 
	Msg2Player("ChØ cã phe C«ng Thµnh míi ®­îc sö dông Hçn Th¹ch LiÖt ")
	return 1
end;

PosId = GetNearstPos(X*32,Y*32, TscPos);

if (PosId == 0) then 
	Say("B¹n ®øng c¸ch Hçn Th¹ch LiÖt qu¸ xa, kh«ng thÓ sö dông! ",0)
	return 1
end;

DoorId = floor( (PosId - 1) / g_nMaxTscPerDoor ) + 1;

if (GetMissionV(MS_DOORBEGIN + DoorId - 1)  ~= 0 and (mod(PosId, 3) == 2) ) then 
	Msg2Player("Thµnh m«n ngay phÝa tr­íc m¨t ng­¬i vÉn ch­a bÞ c«ng ph¸, vÞ trÝ nµy ®­¬ng nhiªn lµ kh«ng thÓ dïng ®­îc Hçn Th¹ch LiÖt ")
	return 1
end;

if (GetMissionV(MSBegin + PosId - 1) == 0) then 
	ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, TscPos[PosId][1], TscPos[PosId][2], 1, "", 1);
	if (ToolIndex > 0) then
		SetNpcCurCamp(ToolIndex, 2);
		SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
		SetMissionV(MSBegin + PosId -1, ToolIndex); 
		Msg2MSAll(MISSIONID, GetName().."Bè trÝ thªm mét c¸i Hçn Th¹ch LiÖt, hç trî C«ng Thµnh ");
		SetMangonelParam(ToolIndex, TscPos[PosId][3], TscPos[PosId][4], 200);
		WriteLog(GetLoop()..GetName()..":AddHSL"..ToolIndex)
		return 0
	end;
else
	Msg2Player("§èi diÖn víi b¹n ®· ®­îc bè trÝ mét c¸i Hçn Th¹ch LiÖt, t¹m thêi kh«ng thÓ bè trÝ thªm n÷a ");
	return 1
end;

return 0;
end;
