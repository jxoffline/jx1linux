Include("\\RelaySetting\\Task\\citywar_head.lua")
LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;

function TaskShedule()
	TaskName("Bang h閕 h駓 b竜 danh c玭g th祅h chi課");
	TaskInterval(1440);	--每天
	TaskTime(0, 0);			--0点 触发
	TaskCountLimit(0);	--无限次

	clearCityWarLeague();
	checkCityWarLeague();
end

function TaskContent()
	clearCityWarLeague();
	checkCityWarLeague();
end;

function checkCityWarLeague()
--启动时检查是否 存在战队
	for i = 1, 7 do
		local szLg = cityid_to_lgname(i);
		local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_SIGN, szLg)	--设置社团信息(类型、名称)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
		
		nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_FIRST, szLg)	--设置社团信息(类型、名称)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
	end;
end;

function clearCityWarLeague()
--	 在24时 执行下面的操作
		for i = 1, 7 do
			local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, TB_CITYWAR_ARRANGE[i][3]);
			if (not FALSE(nlid)) then
				local nCount = LG_GetMemberCount(nlid);
				for k= 0, nCount -1 do
					local szMemberName = LG_GetMemberInfo(nlid, k);
					LGM_ApplyRemoveMember(LEAGUETYPE_CITYWAR_FIRST, TB_CITYWAR_ARRANGE[i][3], szMemberName, "", "", 0);
				end;
			end;
			
			
			nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, TB_CITYWAR_ARRANGE[i][3]);
			if (not FALSE(nlid)) then
				nCount = LG_GetMemberCount(nlid);
				local tbTemMem = {};
				for k = 0, nCount -1 do
					local szMemberName = LG_GetMemberInfo(nlid, k);
					tbTemMem[getn(tbTemMem)+1] = szMemberName;
				end;
				for k = 1, getn(tbTemMem) do
					LGM_ApplyRemoveMember(LEAGUETYPE_CITYWAR_SIGN, TB_CITYWAR_ARRANGE[i][3], tbTemMem[k], "", "", 0);
				end;
			end;
		end;
end;

function cityid_to_lgname(nCityID)
	return TB_CITYWAR_ARRANGE[nCityID][3];
end;

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
