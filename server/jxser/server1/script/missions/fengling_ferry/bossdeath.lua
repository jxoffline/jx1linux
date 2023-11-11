Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\fengling_ferry\\fld_head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
Include("\\script\\event\\change_destiny\\mission.lua");	-- ƒÊÃÏ∏ƒ√¸

Include("\\script\\battles\\battlehead.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")

SIGNET_DROPCOUNT = 2

		local tbBossHat={
		--{szName="Hat",tbProp={6,1,5122,0,0,0,0},nCount=10},
	}	

function OnDeath( nNpcIndex )
	local x, y, world = GetNpcPos(nNpcIndex);
	local maxcount = SIGNET_DROPCOUNT;
	local _, nTongID = GetTongName();
	-- if (nTongID > 0) then
	-- 	if (IsDoubledMoneyBox(nTongID)) then
	-- 		--maxcount = getSignetDropRate(SIGNET_DROPCOUNT);
	-- 	end;
	-- end;
	local nCurtime = GetCurServerTime() + 7 * 24 *60 * 60
	local nYear = tonumber(FormatTime2String("%Y", nCurtime))
	local nMonth = tonumber(FormatTime2String("%m", nCurtime))
	local nDay = tonumber(FormatTime2String("%d", nCurtime))
	-- for i = 1, maxcount do
	-- 	local nItemIdx = DropItem(world, x, y, PlayerIndex, 6, 1, 1094, 1, 0, 0, 0, 0, 0, 0, 0, 0);--th› gi∂ chi  n
	-- 	SetSpecItemParam(nItemIdx, 1, nCurtime);
	-- 	SetSpecItemParam(nItemIdx, 2, nYear)
	-- 	SetSpecItemParam(nItemIdx, 3, nMonth)
	-- 	SetSpecItemParam(nItemIdx, 4, nDay)
	-- 	SyncItem(nItemIdx);
	-- end;

	-- if (jf0904_shuizei_IsActtime() == 1) then
	-- 	local nItemIdx = DropItem(world, x, y, PlayerIndex, 6,1,2015, 1, 0, 0, 0, 0, 0, 0, 0, 0);
		
	-- 	local nCurtime = tonumber(GetLocalDate("%H%M"));
	-- 	local nRestMin = 24 * 60 - (floor(nCurtime/100)*60+floor(mod(nCurtime, 100)));
	-- 	ITEM_SetExpiredTime(nItemIdx, nRestMin);
	-- 	SyncItem(nItemIdx);
		
	-- 	local nRate = 0.005;
	-- 	local nCurRate	= random(10000000)
	-- 	if (nCurRate <= 10000000 * nRate) then		
	-- 		local x, y, world = GetNpcPos(nNpcIndex);
	-- 		local nItemIdx = DropItem(world, x, y, PlayerIndex, 6,1,2115, 1, 0, 0, 0, 0, 0, 0, 0, 0);
	-- 	end
	-- end
	-- 	local nHour = tonumber(GetLocalDate("%H"))
	-- if (nHour == 00 or nHour == 14 or nWeekDay == 16 or nWeekDay == 17 or nWeekDay == 20) then
	-- --RoiDoPho()
	-- end
	--AddItem(6,1,5038,1,0,0)
	--AddItem(6,1,5038,1,0,0)
	--AddItem(6,1,5038,1,0,0)
	--AddItem(6,1,5038,1,0,0)
	tbChangeDestiny:completeMission_WaterThief();
	--AddOwnExp(150000)
	--local MapId = SubWorldIdx2ID( SubWorld )
	--if ( MapId == 338) then
	AddOwnExp(150000)
	--end

	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbBossHat,format("killed_%s",GetNpcName(nNpcIndex)))
end




function RoiDoPho()
local mm =  random(1,84)
if mm == 1 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,239,1,0},nCount=1,},}, "test", 1);
end
if mm == 2 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,239,1,0},nCount=1,},}, "test", 1);

--tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,240,1,0},nCount=1,},}, "test", 1); --MÈng Long Kim Ti Ch›nh HÂng Cµ Sa
end
if mm == 3 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,241,1,0},nCount=1,},}, "test", 1);
end

if mm == 4 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,244,1,0},nCount=1,},}, "test", 1);
end

if mm == 5 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,246,1,0},nCount=1,},}, "test", 1);
end

if mm == 6 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,248,1,0},nCount=1,},}, "test", 1);
end

if mm == 7 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,249,1,0},nCount=1,},}, "test", 1);
end

if mm == 8 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,251,1,0},nCount=1,},}, "test", 1);
end

if mm == 9 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,252,1,0},nCount=1,},}, "test", 1);
end

if mm == 10 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,254,1,0},nCount=1,},}, "test", 1);
end
if mm == 11 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,258,1,0},nCount=1,},}, "test", 1);
end
if mm == 12 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,259,1,0},nCount=1,},}, "test", 1);
end
if mm == 13 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,260,1,0},nCount=1,},}, "test", 1);
end
if mm == 14 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,261,1,0},nCount=1,},}, "test", 1);
end
if mm == 15 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,264,1,0},nCount=1,},}, "test", 1);
end
if mm == 16 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,265,1,0},nCount=1,},}, "test", 1);
end
if mm == 17 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,266,1,0},nCount=1,},}, "test", 1);
end
if mm == 18 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,269,1,0},nCount=1,},}, "test", 1);
end
if mm == 19 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,271,1,0},nCount=1,},}, "test", 1);
end
if mm == 20 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,272,1,0},nCount=1,},}, "test", 1);
end
if mm == 21 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,274,1,0},nCount=1,},}, "test", 1);
end
if mm == 22 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,256,1,0},nCount=1,},}, "test", 1);
end
if mm == 23 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,277,1,0},nCount=1,},}, "test", 1);
end
if mm == 24 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,278,1,0},nCount=1,},}, "test", 1);
end
if mm == 25 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,279,1,0},nCount=1,},}, "test", 1);
end
if mm == 26 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,280,1,0},nCount=1,},}, "test", 1);
end
if mm == 27 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,282,1,0},nCount=1,},}, "test", 1);
end
if mm == 28 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,283,1,0},nCount=1,},}, "test", 1);
end
if mm == 29 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,284,1,0},nCount=1,},}, "test", 1);
end
if mm == 30 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,286,1,0},nCount=1,},}, "test", 1);
end
if mm == 31 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,287,1,0},nCount=1,},}, "test", 1);
end
if mm == 32 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,289,1,0},nCount=1,},}, "test", 1);
end
if mm == 33 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,291,1,0},nCount=1,},}, "test", 1);
end
if mm == 34 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,292,1,0},nCount=1,},}, "test", 1);
end
if mm == 35 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,294,1,0},nCount=1,},}, "test", 1);
end
if mm == 36 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,296,1,0},nCount=1,},}, "test", 1);
end
if mm == 37 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,298,1,0},nCount=1,},}, "test", 1);
end
if mm == 38 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,299,1,0},nCount=1,},}, "test", 1);
end
if mm == 39 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,300,1,0},nCount=1,},}, "test", 1);
end
if mm == 40 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,302,1,0},nCount=1,},}, "test", 1);
end
if mm == 41 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,304,1,0},nCount=1,},}, "test", 1);
end
if mm == 42 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,305,1,0},nCount=1,},}, "test", 1);
end
if mm == 43 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,307,1,0},nCount=1,},}, "test", 1);
end
if mm == 44 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,309,1,0},nCount=1,},}, "test", 1);
end
if mm == 45 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,310,1,0},nCount=1,},}, "test", 1);
end
if mm == 46 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,311,1,0},nCount=1,},}, "test", 1);
end
if mm == 47 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,314,1,0},nCount=1,},}, "test", 1);
end
if mm == 48 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,315,1,0},nCount=1,},}, "test", 1);
end
if mm == 49 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,316,1,0},nCount=1,},}, "test", 1);
end
if mm == 50 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,319,1,0},nCount=1,},}, "test", 1);
end
if mm == 51 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,321,1,0},nCount=1,},}, "test", 1);
end
if mm == 52 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,323,1,0},nCount=1,},}, "test", 1);
end
if mm == 53 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,324,1,0},nCount=1,},}, "test", 1);
end
if mm == 54 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,325,1,0},nCount=1,},}, "test", 1);
end
if mm == 55 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,327,1,0},nCount=1,},}, "test", 1);
end
if mm == 56 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,330,1,0},nCount=1,},}, "test", 1);
end
if mm == 57 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,331,1,0},nCount=1,},}, "test", 1);
end
if mm == 58 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,332,1,0},nCount=1,},}, "test", 1);
end
if mm == 59 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,334,1,0},nCount=1,},}, "test", 1);
end
if mm == 60 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,336,1,0},nCount=1,},}, "test", 1);
end
if mm == 61 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,337,1,0},nCount=1,},}, "test", 1);
end
if mm == 62 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,339,1,0},nCount=1,},}, "test", 1);
end
if mm == 63 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,340,1,0},nCount=1,},}, "test", 1);
end
if mm == 64 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,341,1,0},nCount=1,},}, "test", 1);
end
if mm == 65 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,341,1,0},nCount=1,},}, "test", 1);

--tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,344,1,0},nCount=1,},}, "test", 1); --Ma Thﬁ Li÷t Di÷m Qu∏n Mi÷n
end
if mm == 66 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,347,1,0},nCount=1,},}, "test", 1);
end
if mm == 67 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,348,1,0},nCount=1,},}, "test", 1);
end
if mm == 68 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,349,1,0},nCount=1,},}, "test", 1);
end
if mm == 69 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,350,1,0},nCount=1,},}, "test", 1);
end
if mm == 70 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,351,1,0},nCount=1,},}, "test", 1);
end
if mm == 71 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,354,1,0},nCount=1,},}, "test", 1);
end
if mm == 72 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,356,1,0},nCount=1,},}, "test", 1);
end
if mm == 73 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,357,1,0},nCount=1,},}, "test", 1);
end
if mm == 74 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,359,1,0},nCount=1,},}, "test", 1);
end
if mm == 75 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,360,1,0},nCount=1,},}, "test", 1);
end
if mm == 76 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,361,1,0},nCount=1,},}, "test", 1);
end
if mm == 77 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,366,1,0},nCount=1,},}, "test", 1);
end
if mm == 78 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,367,1,0},nCount=1,},}, "test", 1);
end
if mm == 79 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,369,1,0},nCount=1,},}, "test", 1);
end
if mm == 80 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,370,1,0},nCount=1,},}, "test", 1);
end
if mm == 81 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,371,1,0},nCount=1,},}, "test", 1);
end
if mm == 82 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,374,1,0},nCount=1,},}, "test", 1);
end
if mm == 83 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,377,1,0},nCount=1,},}, "test", 1);
end
if mm == 84 then
tbAwardTemplet:GiveAwardByList({{szName="M∑nh",tbProp={6,1,378,1,0},nCount=1,},}, "test", 1);
end
end
