Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\singlefight\\dt_head.lua")

function OnTimer()
	dtworld = GetMissionV(MS_DTWORLDINDEX)
	orgworld = GetMissionv(MS_ORGWORLDINDEX)

	State = GetMissionV(MS_STATE) ;
	if (State == 0) then
		return
	end;
	
	local str = "<#> Thêi gian ®¬n ®Êu kÕt thóc, phe Kim"..GetMissionS(1).."<#> vµ phe Tèng"..GetMissionS(2).."<#> hßa nhau!"
	
	Msg2MSAll(MISSIONID, str);
	SubWorld = orgworld
	Msg2MSAll(GetMissionV(MS_ORGMISSION),str)--Í¨ÖªËÎ½ðÕ½µÄËùÓÐÈË
	SubWorld = dtworld
	CloseMission(MISSIONID);
end;
  