PREPARE_MAP = 961 --准备场地图
GAME_MAP = 958 --比赛场地图
MAXGAMETIME = 3 --每天最多参加场数

----------------------测试
MAXPLAYERCOUNT = 10 --每个比赛场最多10人，总共12个比赛场
GAMECOUNT = 12 --每场有12张地图,GAMECOUNT = 1 
ALL_MAXPLAYERCOUNT = 120 --每场最多120人，每次开启比赛可以有很多场
ALLPLAYERCOUNT = 360 --每开启一次最多允许360个玩家参加
LEASTPLAYERCOUNT = 6 --每场允许的最少玩家数
--------------------

-------------------------测试
PREPARETIME = 5 --准备时间，单位分钟
GAMETIME = 10 --比赛时间，单位分钟
-------------------------

MINLEVEL = 125   --玩家等级限制，至少125级，转身不限制等级
PREPAREPOSENDLINE = 15 --"\\settings\\maps\\chrismas\\player.txt"中往准备场传送点的结束行
GAMEPOSLINECOUNT = 7 --"\\settings\\maps\\chrismas\\player.txt"中往各个比赛场传送点的行数
TSK_LEAVERMAPID = 2323	--存储离开报名点的mapid
TSK_LEAVERPOSX = 2324	--存储离开报名点的x坐标点
TSK_LEAVERPOSY = 2325	--存储离开报名点的y坐标点

TSK_DAYKEY = 2326	--记录是哪一天
TSK_PLAYTIMES = 2327 --记录一天内玩的次数

TSK_COUNT_ONETIME = 2328	--记录一场点了多少个
TSK_RANK = 2329		--记录一场的排名；

TSK_GROUPID = 2330	--记录玩家的Group号

TSK_IS_AWARD = 2331 --记录是否已经领奖
TSK_IS_AWARD_DAYKEY = 2332 --记录是哪天的领奖

POSPATH = "\\settings\\maps\\chrismas\\player.txt"

function ResetTaskA(TSK_A, TSK_DATE_A)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local nRecordDate = GetTask(TSK_DATE_A)
	
	if nCurDate ~= nRecordDate then
		SetTask(TSK_DATE_A, nCurDate)
		SetTask(TSK_A, 0)
	end
end

function AddTaskA(TSK_A, TSK_DATE_A, nAddValue)
	ResetTaskA(TSK_A, TSK_DATE_A)
	local nValue = GetTask(TSK_A)
	return SetTask(TSK_A, nValue + nAddValue)	
end

function GetTaskA(TSK_A, TSK_DATE_A)
	ResetTaskA(TSK_A, TSK_DATE_A)
	return GetTask(TSK_A)
end

function setentermapstate()
		ForbitSkill(1)

		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
		SetTaskTemp(200,1)
		--设置战斗状态
		SetFightState(0)
		--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
		SetLogoutRV(1)
		--无死亡惩罚
		SetPunish(0)
		--关闭组队功能
		SetCreateTeam(0)
		
		--禁止光环
		ForbitAura(1)
		--设置仇杀
		ForbidEnmity(1)
		--禁止pk
		SetPKFlag(0)
		--禁止交易
		DisabledStall(1)
		ForbitTrade(0)
		--禁止改变PK状态
		ForbidChangePK(1)
		--禁止使用回程
		DisabledUseTownP(1)
end

function setleavemapstate()
		ForbitSkill(0)

		SetTaskTemp(200,0)
		SetFightState(0)
		SetPunish(1)
		SetCreateTeam(1)
		
		ForbitAura(0)
		ForbidEnmity(0)
		SetPKFlag(0)
		DisabledStall(0)
		ForbitTrade(0)
		
		ForbidChangePK(0)
		DisabledUseTownP(0)
end

function getplayermapid(nPlayerIndex)
	local _, _, nMapIndex = CallPlayerFunction(nPlayerIndex, GetPos)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	return nMapId
end

