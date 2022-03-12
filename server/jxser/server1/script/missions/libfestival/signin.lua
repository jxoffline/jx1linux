--	报名部分的写在这个脚本里面
if (not _H_SIGNIN_) then
	_H_SIGNIN_ = 1;

--报名函数
function signin()
	local nNowTime = tonumber(date("%Y%m%d"));
	if (GetTask(TK_CO_DAYKEY) ~= nNowTime) then
		SetTask(TK_CO_DAYKEY, nNowTime);
		SetTask(TK_CO_PLAYTIMES, 0);
	end;
	
	if (signin_add() == 0) then
		return 0;
	end;

	local ww, xx, yy = GetWorldPos();
	SetTask(TK_CO_LEAVERMAPID, ww);
	SetTask(TK_CO_LEAVERPOSX, xx);
	SetTask(TK_CO_LEAVERPOSY, yy);
	local nPosX, nPosY;
	nPosX, nPosY = getadatatow(SZFILE, 2, 15);
	NewWorld(CO_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
end;


function playergetinprepare()	--玩家进入准备场时候进行状态设置
	ForbitSkill(FESTIVAL_OK);
	SetMoveSpeed(FESTIVAL_ENTERSPEED);
	SetTaskTemp(200, 1);		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetFightState(FESTIVAL_NO);	--设置战斗状态
	SetLogoutRV(FESTIVAL_OK);	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetPunish(FESTIVAL_NO);		--无死亡惩罚
	SetCreateTeam(FESTIVAL_NO);	--关闭组队功能
	ForbitAura(FESTIVAL_OK)		--禁止光环
	ForbidEnmity(FESTIVAL_OK)	--设置仇杀
	SetPKFlag(FESTIVAL_NO)		--打开PK开关 
	DisabledStall(FESTIVAL_OK);	--禁止交易;
	ForbitTrade(FESTIVAL_NO);
	ForbidChangePK(FESTIVAL_OK);
	DisabledUseTownP(FESTIVAL_OK);	--禁止使用回程；
	playergetinprepare_add();
end;

function playerleave()	--玩家离开游戏时候进行状态设置
	ForbitSkill(FESTIVAL_NO);
	SetMoveSpeed(FESTIVAL_LEAVERSPEED);
	
	RestoreOwnFeature();    --将所有人变成原来样子
	ForbitAura(FESTIVAL_NO)
	SetTaskTemp(200,0);
	SetFightState(FESTIVAL_NO);
	SetPunish(FESTIVAL_OK);
	SetCreateTeam(FESTIVAL_NO);
	ForbidEnmity( FESTIVAL_NO )
	SetPKFlag(FESTIVAL_NO)
	DisabledStall(FESTIVAL_NO);
	ForbitTrade(FESTIVAL_NO);
	local nCamp = GetCamp();
	SetCurCamp(nCamp);
	ForbidChangePK(FESTIVAL_NO);
	DisabledUseTownP(FESTIVAL_NO);	--禁止使用回程；
	playerleave_add();
end;

function playergetingame()	--玩家进入游戏的时候进行状态设置
	ForbitSkill(FESTIVAL_OK);
	SetMoveSpeed(FESTIVAL_ENTERSPEED);
	SetTaskTemp(200, 1);		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetLogoutRV(FESTIVAL_OK);	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetPunish(FESTIVAL_NO);		--无死亡惩罚
	SetCreateTeam(FESTIVAL_NO);	--关闭组队功能
	ForbitAura(FESTIVAL_OK)		--禁止光环
	ForbidEnmity(FESTIVAL_OK)	--设置仇杀
	DisabledStall(FESTIVAL_OK);	--禁止交易;
	ForbitTrade(FESTIVAL_NO);
	ForbidChangePK(FESTIVAL_OK);
	DisabledUseTownP(FESTIVAL_OK);	--禁止使用回程；
	SetFightState(FESTIVAL_OK);
	SetPKFlag(FESTIVAL_OK)
	playergetingame_add();
end;

end;	--	end of _H_SIGNIN_