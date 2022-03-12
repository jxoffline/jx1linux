--特殊用地	比武大会会场
--Trap ID：比武大会会场 1

IncludeLib("SETTING");
Include("\\script\\missions\\olympic\\head.lua");

function main(sel)
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab);
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 7) and (GetTask(TONGSCORE) == 1) then 
		n3 = floor(GetTask(AREAID)/2);
		for i = 1,16 do
			ny,n1,n2 = TableSDD_GetValue("olympictab",i);
			if (ny ~= "") and (n3 == floor(n2/2)) then
				if (GetTong() == ny) then
					TableSDD_SetValue("olympictab",i,ny,1,n2)
				else
					TableSDD_SetValue("olympictab",i,"",0,0)
				end;
			end;
		end;
		j = 17;
		k = 32;
		f = 0;
		for i = 1,16 do
			ny,n1,n2 = TableSDD_GetValue("olympictab",i)
			if (ny ~= "") then
				TableSDD_SetValue("olympictab",j,ny,n1,n2)
				j = j + 1;
				if (n1 == 0) then
					f = 1;
				end
			else
				TableSDD_SetValue("olympictab",k,"",0,0)
				k = k - 1;
			end;
		end;
		if (f == 0) then
			SetMissionV(MS_STATE,8);
			for i = 1,16 do
				ny,n1,n2 = TableSDD_GetValue("olympictab",i+16);
				TableSDD_SetValue("olympictab",i,ny,0,0)
				TableSDD_SetValue("olympictab",i+16,"",0,0)
			end;
			SortTong();
		end;
	end;
	SubWorld = OldSubWorld;
	SetTask(TONGSCORE,0);
	SetTask(AREAID,0);
	NewWorld(176, 1468, 3247);
end;
