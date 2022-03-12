-- 战役流程头文件
-- Fanghao Wu
-- 2004.12.15

DBKEY_BATTLE = "BATTLE_%d_%d";						-- 战役信息的数据库KEY
DBKEY_BATTLE_LATEST_INFO = "BATTLE_LATEST_INFO";	-- 战役最后一局信息的数据库KEY

-- 生成指定战役战役信息的数据库KEY
function makeBattleDBKey( nBattleID, nBattleLevel )
	return format( DBKEY_BATTLE, nBattleID, nBattleLevel );
end

-- 启动新一轮战役
function battle_StartNewIssue( nBattleID, nBattleLevel )
	local bDBSuccess, nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, nBattleMapID, nWorldMapID, strMapName, nRuleID;
	local arynMapPatternID, arynFollowingRoundID, arynRuleID;
	
	bDBSuccess, nLatestIssueID, nRoundCount, nRoundID = battle_GetLatestIssueInfo( nBattleID, nBattleLevel );
	if( bDBSuccess ~= 1 ) then	-- 第一期战役
		nLatestIssueID = 1;
	else
		nLatestIssueID = nLatestIssueID + 1;
	end
	nRoundCount = 1;
	nRoundID = 1;
	
	arynMapPatternID, arynFollowingRoundID = Battle_GetRoundInfo( nBattleID, nRoundID );
	nMapPatternID = arynMapPatternID[ Random( getn( arynMapPatternID ) ) + 1 ];
	nBattleMapID, arynRuleID = Battle_GetMapPatternInfo( nBattleID, nMapPatternID );
	nWorldMapID, arystrMapName = Battle_GetBattleMapInfo( nBattleID, nBattleMapID, nBattleLevel );
	strMapName = arystrMapName[ Random( getn( arystrMapName ) ) + 1 ];
	nRuleID = arynRuleID[ Random( getn( arynRuleID ) ) + 1 ];
	
	battle_SaveRoundInfo( nBattleID, nBattleLevel, nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, strMapName, nRuleID, 0 );
	battle_Msg_NewRound( nBattleID, nBattleLevel, nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, nBattleMapID, nWorldMapID, strMapName, nRuleID );

	return nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, strMapName, nRuleID;
end

-- 获取指定战役最后一局的期数及局数信息
function battle_GetLatestIssueInfo( nBattleID, nBattleLevel )
	local bDBSuccess;
	local nLatestIssueID, nRoundCount;
	bDBSuccess, nLatestIssueID, nRoundCount = GetCustomDataFromSDB( DBKEY_BATTLE_LATEST_INFO, nBattleID, nBattleLevel, "ii" );
	return bDBSuccess, nLatestIssueID, nRoundCount;
end

-- 获取指定战役战局的战局详细信息
function battle_GetSpecRoundInfo( nBattleID, nBattleLevel, nIssueID, nRoundCount )
	local strBattleDBKey;
	local bDBSuccess;
	local nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult;
	
	strBattleDBKey = makeBattleDBKey( nBattleID, nBattleLevel );
	bDBSuccess, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult = GetCustomDataFromSDB( strBattleDBKey, nIssueID, nRoundCount, "iisii" );
	
	return bDBSuccess, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult;
end

-- 获取指定战役最后一局的战局详细信息
function battle_GetLatestRoundInfo( nBattleID, nBattleLevel )
	local bDBSuccess;
	local nLatestIssueID, nRoundCount;
	local nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult;
	
	bDBSuccess, nLatestIssueID, nRoundCount = battle_GetLatestIssueInfo( nBattleID, nBattleLevel );
	
	if( bDBSuccess == 1 ) then
		bDBSuccess, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult = battle_GetSpecRoundInfo( nBattleID, nBattleLevel, nLatestIssueID, nRoundCount );
	end
	
	return bDBSuccess, nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult;
end

-- 保存战局详细信息
function battle_SaveRoundInfo( nBattleID, nBattleLevel, nIssueID, nRoundCount, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult )
	SaveCustomDataToSDBOw( DBKEY_BATTLE_LATEST_INFO, nBattleID, nBattleLevel, "ii", nIssueID, nRoundCount );
	local strBattleDBKey = makeBattleDBKey( nBattleID, nBattleLevel );
	SaveCustomDataToSDBOw( strBattleDBKey, nIssueID, nRoundCount, "iisii", nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult );
end

-- 输出日志分隔符
function battle_Msg_Separator()
	OutputMsg( "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" );
end

-- 输出新战局日志
function battle_Msg_NewRound( nBattleID, nBattleLevel, nIssueID, nRoundCount, nRoundID, nMapPatternID, nBattleMapID, nWorldMapID, strMapName, nRuleID, strExtraMsg )
	battle_Msg_Separator();
	OutputMsg( format( "[%s]  NEW BATTLE START", date( "%Y-%m-%d %H:%M:%S" ) ) );
	OutputMsg( format( "BattleID: %d   BattleLevel: %d   Issue: %d   %dth.Round", nBattleID, nBattleLevel, nIssueID, nRoundCount ) );
	OutputMsg( format( "RoundID: %d   MapPattern: %d   BattleMapID:  %d   WorldMapID: %d   MapName: %s   RuleID: %d", nRoundID, nMapPatternID, nBattleMapID, nWorldMapID, strMapName, nRuleID ) );
	if( strExtraMsg ~= nil ) then
		OutputMsg( strExtraMsg );
	end
	battle_Msg_Separator();
end

-- 输出战局结束日志
function battle_Msg_RoundResult( nBattleID, nBattleLevel, nIssueID, nRoundCount, nRoundID, nBattleResult, strExtraMsg )
	battle_Msg_Separator();
	OutputMsg( format( "[%s]  BATTLE END", date( "%Y-%m-%d %H:%M:%S" ) ) );
	OutputMsg( format( "BattleID: %d   BattleLevel: %d   Issue: %d   %dth.Round RoundId: %d   Result: %d", nBattleID, nBattleLevel, nIssueID, nRoundCount, nRoundID, nBattleResult ) );
	if( strExtraMsg ~= nil ) then
		OutputMsg( strExtraMsg );
	end
	battle_Msg_Separator();
end