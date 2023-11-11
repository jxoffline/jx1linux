Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--¹¥³ÇÕ½µÄµØÍ¼ID
MSBegin = MS_GCCBEGIN;
Count = g_nMaxGccPerDoor * g_nDoorCount;
NpcTempl = 524;
NpcLevel = 60;

function main()
--¿´µ±Ç°Î»ÖÃÊÇ·ñ´¦ÔÚ¹¥³ÇÕ½µØÍ¼ÉÏ
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID();

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("B¹n kh«ng thÓ sö dông NghiÖt Long Xung Xa t¹i ®©y! ")
	return 1;
end

if (GetCurCamp() ~= 2) then
	Msg2Player("ChØ cã phe C«ng Thµnh míi cã thÓ sö dông NghiÖt Long Xung Xa! ")
	return 1;
end

PosId = GetNearstPos(X*32,Y*32, GccPos);
if (PosId == 0) then 
	Say("B¹n ®øng c¸ch NghiÖt Long Xung Xa qu¸ xa, kh«ng thÓ sö dông! ",0)
	return 1
end;



if (GetMissionV(MS_DOORBEGIN + PosId - 1)  == 0 ) then 
	Msg2Player("Thµnh m«n phÝa tr­íc mÆt ng­¬i ®ang ®øng ®· bÞ c«ng ph¸, kh«ng thÓ sö dông NghiÖt Long Xung Xa ");
	return 1
end;

if (GetMissionV(MSBegin + PosId - 1) == 0) then 
	ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, GccPos[PosId][1], GccPos[PosId][2], 1, "", 1);
	if (ToolIndex > 0) then
		SetNpcCurCamp(ToolIndex, 2);
		SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
		SetMissionV(MSBegin + PosId -1, ToolIndex); 
		SetSiegeVoitureParam(ToolIndex, GetMissionV(MS_DOORBEGIN + PosId - 1))
		Msg2MSAll(MISSIONID, GetName().."S¾p ®Æt thªm mét chiÕc NghiÖt Long Xung Xa, hç trî C«ng Thµnh. ");
		WriteLog(GetLoop()..GetName()..":AddCC"..ToolIndex)
		return 0
	end;
else
	Msg2Player("NghiÖt Long Xung Xa mµ b¹n bè trÝ tr­íc ®©y hiÖn vÉn cßn, t¹m thêi kh«ng thÓ bè trÝ thªm n÷a ");
	return 1
end;

return 0;
end;
