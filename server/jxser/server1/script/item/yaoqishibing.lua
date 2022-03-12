Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--¹¥³ÇÕ½µÄµØÍ¼ID
MSBegin = MS_TOOLBEGIN;
Count = g_nMaxToolCount;
NpcTempl = 527;
NpcLevel = 60;

function main()

--¿´µ±Ç°Î»ÖÃÊÇ·ñ´¦ÔÚ¹¥³ÇÕ½µØÍ¼ÉÏ
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID(SubWorld);

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("B¹n kh«ng thÓ sö dông V©n Kú Binh phï t¹i ®©y ")
	return 1;
end

if (GetCurCamp() ~= 1) then 
	Msg2Player("ChØ cã phe phßng thñ míi ®­îc sö dông V©n Kú Binh phï t¹i ®©y ")
	return 1
end;


bAdd = 0
for i  = 1, Count do 
	if (GetMissionV(MSBegin + i - 1) == 0) then 
		ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, X * 32, Y * 32, 1, GetName().." LÝnh ®¸nh thuª ", 1);
		if (ToolIndex > 0) then
			SetNpcCurCamp(ToolIndex, 1);
			SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
			SetMissionV(MSBegin + i - 1, ToolIndex); 
			Msg2MSAll(MISSIONID, GetName().."Ph¸i ®Õn mét vâ sÜ ®Ó kÐo cê, hç trî chiÕn ®Êu ");
			WriteLog(GetLoop()..GetName().."T¨ng thªm mét yaoqi"..ToolIndex)
			bAdd = 1
			return 0
		end;
	end;
end

if (bAdd == 0) then 
	Msg2Player("Tr­íc m¾t sè qu©n ph¸i ®Õn hç trî ®· ®ñ, t¹m thêi kh«ng thÓ ph¸i thªm n÷a ")
	return 1
end;

return 0;
end;
