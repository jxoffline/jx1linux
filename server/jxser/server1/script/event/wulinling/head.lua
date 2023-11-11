--武林令活动
--By 小浪
--2007-03-29

WULINLING_DATE = {"2007040600","2007042624"}
WULINLING_LGTYPE = 536;
WULINLING_ITEM = 1388;
WULINLING_LGTASK = 1;		--数量
WULINLING_LGTASKPH = 2;	--排名
WULINLING_LGTASKDATA = 3;	--提交时间
WULINLING_LGMEMTASK = 1;
WULINLING_PHTB = {{},{}} --[1]存储前10名,[1][1]帮会名,[1][2]奖牌数量    [2]存储更新日期


function wulinling_date()
	local nowdate = tonumber(GetLocalDate("%Y%m%d%H"));
	if  nowdate >= tonumber(WULINLING_DATE[1]) and nowdate <= tonumber(WULINLING_DATE[2])  then
		return 1;
	else
		return 0;
	end
end

function checkwulinlingLimit()
	local TongName,TongID = GetTongName();
	if TongName == "" or TongName == nil then
		return 0;
	else
		return 1;
	end
end

function checkCreatLG(szlgname)
	local nlid = LG_GetLeagueObj(WULINLING_LGTYPE,szlgname)
	if nlid == 0 or nlid == nil then
		local nNewLeagueID = LG_CreateLeagueObj()
		LG_SetLeagueInfo(nNewLeagueID, WULINLING_LGTYPE,szlgname)	--设置社团信息(类型、名称)
		local ret = LG_ApplyAddLeague(nNewLeagueID, "", "") 
		LG_FreeLeagueObj(nNewLeagueID)
	end
end

function checkJoinLG(szlgname)
	local roleid = LG_GetLeagueObjByRole(WULINLING_LGTYPE,GetName());
	if roleid == 0 or roleid == nil then
		local nMemberID = LGM_CreateMemberObj() -- 生成社团成员数据对象(返回对象ID)
		--设置社团成员的信息(角色名、职位、社团类型、社团名称)
		LGM_SetMemberInfo(nMemberID,GetName(), 0, WULINLING_LGTYPE, szlgname) 
		local ret = LGM_ApplyAddMember(nMemberID, "", "") 
		LGM_FreeMemberObj(nMemberID)
	end
end
function wulinlingPhdo()
		nlg_idx = LG_GetFirstLeague(WULINLING_LGTYPE)
		while	nlg_idx ~= 0 and nlg_idx ~= nil do
			nph = LG_GetLeagueTask(nlg_idx, WULINLING_LGTASKPH);
			if nph <= 10 and nph > 0 then
				local TongName = LG_GetLeagueInfo(nlg_idx);
				local nSum = LG_GetLeagueTask(nlg_idx,WULINLING_LGTASK);
				WULINLING_PHTB[1][nph] = {};
				WULINLING_PHTB[1][nph][1] = TongName;
				WULINLING_PHTB[1][nph][2] = nSum;
				
			end
			nlg_idx = LG_GetNextLeague(WULINLING_LGTYPE, nlg_idx);
		end
		--WULINLING_PHTB[2] = {};
		WULINLING_PHTB[2][1] = tonumber(GetLocalDate("%Y%m%d"));
end

function checkwulinlingPh()
	local nowdate = tonumber(GetLocalDate("%Y%m%d"));
	if WULINLING_PHTB == nil or WULINLING_PHTB[2][1]== nil then	--如果TB为空则刷新排行
			wulinlingPhdo();
	elseif tonumber(GetLocalDate("%H%M")) > 0005  then --在Relay刷新排行后5分钟内.Server不做排行刷新.防止Relay延迟
			if nowdate ~= WULINLING_PHTB[2][1] then
				wulinlingPhdo();
			end
	end
	
end