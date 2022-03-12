IncludeLib("SETTING");
IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")

DTMISSIONID = 14;		--
FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟
TIMER_1 = 10 * FRAME2TIME-----10秒计时一次
TIMER_2 = 3 * 60 * FRAME2TIME----单挑时间
EXPRETIME = (TIMER_2 - 10 * FRAME2TIME) / TIMER_1--最后10秒提示将要退出

MS_TIME1_ACC = 2			--记TIMER_1（10秒）执行的次数，
MS_ORGWORLDINDEX = 3		--来时世界地图的INDEX
MS_ORGMISSION = 4		--来时世界的MISSION	
MS_ORGMAPID = 5			--来时世界的MAPID
MS_LEVEL = 	6			--世界的等级
MS_ORGBACK_X1 = 7		--退出单挑后的重生点
MS_ORGBACK_Y1 =	8		
MS_ORGBACK_X2 = 9
MS_ORGBACK_Y2 = 10
MISSIONID = DTMISSIONID

MS_DTWORLDINDEX = 12		--单挑世界地图的INDEX
MS_DTMISSION = 13			--单挑世界的MISSION

PL_NAME_1 = 1				--missions
PL_NAME_2 = 2				--missions

MS_PL_INDEX_1 = 14
MS_PL_CURCAMP_1 = 15
MS_PL_ADDPOINT_1 = 16
MS_PL_INDEX_2 = 17
MS_PL_CURCAMP_2 = 18
MS_PL_ADDPOINT_2 = 19
 


function dt_winbonus(nCamp)
	OldPlayer = PlayerIndex
	OldSubWorld = SubWorld
	
	if (nCamp == 1) then
		RoleIndex = GetMissionV(MS_PL_INDEX_1)
		WinnerName = GetMissionS(1);
		LoserName =  GetMissionS(2)
		str = "phe T鑞g "..WinnerName.." s竧 tr鋘g thng ngi phe Kim "..LoserName.."gi祅h th緉g l頸!";
	else
		RoleIndex = GetMissionV(MS_PL_INDEX_2)
		WinnerName = GetMissionS(2);
		LoserName =  GetMissionS(1)
		str = "Phe Kim"..WinnerName.." s竧 tr鋘g thng ngi phe T鑞g"..LoserName.."gi祅h th緉g l頸!";
	end
	Msg2MSAll(DTMISSIONID, str)
	
	PlayerIndex = RoleIndex;
	SubWorld = GetMissionV(MS_ORGWORLDINDEX)
	BT_SetData(PL_1VS1, BT_GetData(PL_1VS1) + 1);
	bt_addtotalpoint(BT_GetTypeBonus(PL_1VS1, GetCurCamp()))
	Msg2MSAll(GetMissionV(MS_ORGMISSION), str);
	
	PlayerIndex = OldPlayer
	SubWorld = OldSubWorld
end;

