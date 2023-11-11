Include("\\script\\event\\wulin_2nd\\head.lua")
IncludeLib("TITLE")

_wulin_tb_mem = {}
_wulin_tb_leader = {}
function main()
	nClientID = wl_GetZone()
	if (nClientID == nil or nClientID == WULIN_TB_DISALLOWZONE[nClientID]) then
		wlls_descript("本区服不属于第二届武林大会区服选拔范围，详情请见官方网站jx.kingsoft.com。")
		return
	end
	if (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) >= 3) then
		if (getn(_wulin_tb_mem) == 0) then
			local n_lid = LG_GetFirstLeague(WULIN_LGTYPE_REGISTER)
			while (not FALSE(n_lid)) do
				local rolename = LG_GetLeagueInfo(n_lid)
				_wulin_tb_mem[getn(_wulin_tb_mem) + 1] = rolename
				n_lid = LG_GetNextLeague(WULIN_LGTYPE_REGISTER, n_lid)
			end
		end
		if (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 4) then
			if (getn(_wulin_tb_leader) == 0) then
				local n_lid = LG_GetFirstLeague(WULIN_LGTYPE_REGISTER)
				while(not FALSE(n_lid)) do
					local rolename = LG_GetLeagueInfo(n_lid)
					local leader_rank = LG_GetLeagueTask(n_lid, WULIN_LGTASK_LEADER)
					if (leader_rank ~= 0) then
						_wulin_tb_leader[getn(_wulin_tb_leader) + 1] = {rolename, leader_rank}
					end
					n_lid = LG_GetNextLeague(WULIN_LGTYPE_REGISTER, n_lid)
				end
				sort(_wulin_tb_leader, ascend)
			end
		end
	end

	local aryszContent = {
		register = {	"我要查询提前入围选手名单/wulin_query", 
									"我要确认我的选手资格/wulin_register", 
									"我要参与选手资格竞投/wulin_compete",
									"我要领取选手头衔/wulin_title",},
		leader = {	"我要投票选择总领队/wulin_leader",
								"我要查询大会选手名单/wulin_queryfinal", 
								"我要取回竞投资金/wulin_giveback",
								"我要领取选手头衔/wulin_title",},
		over = {		"我要查询总领队/wulin_queryleader",
								"我要查询大会选手名单/wulin_queryfinal", 
								"我要取回竞投资金/wulin_giveback",
								"我要领取选手头衔/wulin_title",},
		common = {	"第二届武林大会参赛资格预选帮助/wulin_helpinfo",
								"取消/OnCancel"} }
	local szMsg = "第二届武林大会即将开始，目前处于选手选拔阶段，每个服务器将会有<color=yellow>"..WULIN_MAXMEMBER.."名<color>出线选手。<color=yellow>3月3日~3月16日<color>，你可以在我这里确认自己的选手资格或者参与选手资格竞投。在选手名单全部确定后<color=yellow>（3月17日~3月23日）<color>，将进行选手票选总领队。详细预选规则请见官方网站<color=yellow>jx.kingsoft.com<color>。"
	local tbOpp = {}
	local curdate = tonumber(GetLocalDate("%m%d%H%M"))
	if (WULIN_TB_TIME.register.open <= curdate and WULIN_TB_TIME.register.close >= curdate and gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 1) then
		for i = 1, getn(aryszContent.register) do
			tbOpp[getn(tbOpp) + 1] = aryszContent.register[i]
		end
	elseif (WULIN_TB_TIME.leader.open<= curdate and gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 3) then

		for i = 1, getn(aryszContent.leader) do
			tbOpp[getn(tbOpp) + 1] = aryszContent.leader[i]
		end
	elseif (WULIN_TB_TIME.leader.close <= curdate and gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 4) then

		for i = 1, getn(aryszContent.over) do
			tbOpp[getn(tbOpp) + 1] = aryszContent.over[i]
		end
	end
	for i = 1, getn(aryszContent.common) do
		tbOpp[getn(tbOpp) + 1] = aryszContent.common[i]
	end
	wlls_descript(szMsg, tbOpp)
end

function wulin_register()
	local curdate = tonumber(GetLocalDate("%m%d%H%M"))
	local rolename = GetName()
	local n_gtype = wulin_canregister(rolename) 
	if (n_gtype== nil) then
	elseif (n_gtype == 0) then
		wlls_descript("您不具备提前入围资格，请查询入围选手名单以核对本人资格。详情请见官方网站<color=yellow>jx.kingsoft.com<color>。")
	else
		local szParam = GetName().." "..GetAccount().." "..tostring(GetLevel()).." "..tostring(GetLastFactionNumber()).." "..tostring(n_gtype)
		--通知relay，将本人加入战对，并记log：Name、Account、Level、Faction
		LG_ApplyDoScript(1, "", "", "\\script\\event\\wulin_2nd\\members.lua", "wulin_register", szParam , "", "")
		SetTask(WULIN_TASK_LOGIN, 1)
		WriteLog(date().." Name:"..GetName().."\tAccount:"..GetAccount().."\t确认了提前入围武林大会选手资格")
	end
end

function wulin_canregister(rolename)
	if (not FALSE(LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, rolename))) then
		wlls_descript("您的名字已经在第二届武林大会花名簿上登记，您只需安心做准备，待武林大会的帷幕正式揭开，就可大展身手，决战武林。")
		return nil
	elseif (GetLevel()< 90) then
		wlls_descript("武林大会乃是天下英雄论剑比武之地，你等级还不到90级，造诣上怕还欠缺些火候，还是回去继续研习武艺为好！")
		return nil
	elseif (GetLastFactionNumber() == -1) then
		wlls_descript("武林大会乃是天下英雄论剑比武之地，你在造诣上怕还欠缺些火候，还是回去继续研习武艺为好！")
		return nil
	end
	local n_gtype = wulin_check_player(rolename)
	if (n_gtype == nil) then	--不在名单中
		return 0
	elseif (n_gtype == 6) then		--上届卫冕冠军
		if (GetTask(CP_TASKID_TITLE) ~= 9) then	--名字可能与上届卫冕冠军重名，并没有参加过上届武林大会
			return 0
		end
	elseif (GetLevel() < 120) then		--联赛选手都在120级上
		return 0
	end
	return n_gtype
end

--由哪届武林联赛获得的选手资格
function wulin_check_player(strRoleName)
--	do return WULIN_TB_ROLES[nClientID][strRoleName] end
	
	for n_gtype, tb_gname in WULIN_TB_HISTORY[nClientID] do
		if n_gtype == 3 then
			for n_ftype, tb_fname in tb_gname do
				for i = 1, getn(tb_fname) do
					if (strRoleName == tb_fname[i]) then
						return n_gtype
					end
				end
			end
		else
			for i = 1, getn(tb_gname) do
				if (strRoleName == tb_gname[i]) then
					return n_gtype
				end
			end
		end
	end
	return nil
end

function wulin_query()
	local aryszContent = {"世界十大高手（截至2月28日）/#wulin_want2query(1)",
				"第一届武林联赛之双人赛/#wulin_want2query(2)",
				"第二届武林联赛之单项赛/#wulin_want2query(3)",
				"第三届武林联赛之师徒赛/#wulin_want2query(4)",
				"第四届武林联赛之双人赛/#wulin_want2query(5)",
				"上届武林大会卫冕冠军/#wulin_want2query(6)",}
	local tbOpp = {"返回/main",
				"取消/OnCancel"}
	for i = 6, 1, -1 do
		if (not FALSE(getn(WULIN_TB_HISTORY[nClientID][i]))) then
			tinsert(tbOpp, 1, aryszContent[i])
		end
	end
	if (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_REGCNT) == 0) then
		wlls_descript("<color=red>当前还没有选手来确认资格，请选择提前入围资格选手类别：<color>", tbOpp)
	else
		wlls_descript("<color=red>当前已有<color=yellow>"..gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_REGCNT).."名<color>选手确认资格，请选择提前入围资格选手类别：<color>", tbOpp)
	end
end

function wulin_want2query(nSel)
	if (nSel == 3) then	--如果门派单项赛,特殊一下
		wulin_query2faction()
	else
		if (not WULIN_TB_HISTORY[nClientID][nSel] or getn(WULIN_TB_HISTORY[nClientID][nSel]) == 0) then
			wlls_descript("该类型入围资格没有提前入围选手。", "返回/wulin_query", "取消/OnCancel")
			return
		end
		wulin_query2member(WULIN_TB_HISTORY[nClientID][nSel])
	end
end

function wulin_query2faction()
	local tbOpp = {"少林单项赛/wulin_factmember",
				"天王单项赛/wulin_factmember",
				"唐门单项赛/wulin_factmember",
				"五毒单项赛/wulin_factmember",
				"峨嵋单项赛/wulin_factmember",
				"翠烟单项赛/wulin_factmember",
				"丐帮单项赛/wulin_factmember",
				"天忍单项赛/wulin_factmember",
				"武当单项赛/wulin_factmember",
				"昆仑单项赛/wulin_factmember",
				"返回/wulin_query",
				"取消/OnCancel"}
	wlls_descript("<color=red>请选择单项赛门派：<color>", tbOpp)
end

function wulin_factmember(nSel)
	local faction = nSel + 1
	local tb_mem = WULIN_TB_HISTORY[nClientID][3][faction]
	if (getn(tb_mem) == 0) then
		wlls_descript("该门派没有选手入围。", "返回/wulin_query2faction", "取消/OnCancel")
		return
	end
	wulin_query2member(tb_mem)
end


function wulin_query2member(tb_mem)
	local szmsg = "<color=red>选手名单如下：<color>\n"
	for i = 1, getn(tb_mem) do
		if (not FALSE(LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, tb_mem[i]))) then
			szmsg = safeshow(szmsg..tb_mem[i]).."    <color=red>（已报名）<color>\n"
		else
			szmsg = safeshow(szmsg..tb_mem[i]).."\n"
		end
	end
	wlls_descript(szmsg)
end

--竞投选手资格
function wulin_compete()
	local curdate = tonumber(GetLocalDate("%m%d%H%M"))
	if (WULIN_TB_TIME.elector.open > curdate or WULIN_TB_TIME.elector.close < curdate) then
		wlls_descript("竞投武林大会选手资格于<color=yellow>2006年3月10日0：00~2006年3月16日24：00<color>（以服务器时间为准）进行。\n　　参与竞投的玩家等级不小于<color=yellow>90级<color>。每名玩家可以自由投注金额，每次以<color=yellow>100万<color>为最低投标金额。\n　　竞投成功的玩家，其投注金额将作为竞投资金，由系统收取；竞投失败的玩家，则可以全额领会自己的投注金额。")
		return
	end

	if (wulin_canregister(GetName()) == nil) then
		
	elseif(not FALSE(wulin_canregister(GetName()))) then
		wlls_descript("您已具备提前入围武林大会的资格，只要在我这里确认报名即可拥有正式选手资格，不必参与竞投。", "我要确认选手资格/wulin_register", "先让我考虑考虑/OnCancel")
	else
		local n_money, rank = LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, GetName(), WULIN_LGTASK_MONEY), LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, GetName(), WULIN_LGTASK_RANK) 
		local szmsg = ""
		if (n_money ~= 0 and rank == 0) then
			szmsg = "您当前的竞投金额为<color=red>"..(n_money * WULIN_MONEYBASE).."<color>两，暂时还没有名次，可以稍后查询排名。\n　　"
		elseif (n_money ~= 0 and rank ~= 0) then
			szmsg = "您当前的竞投金额为<color=red>"..(n_money * WULIN_MONEYBASE).."<color>两，当前名次为第<color=red>"..rank.."<color>名。\n　　"
		end
		wlls_descript(szmsg.."本区服提前入围选手共<color=green>"..wl_GetMember().."名<color>，已确认入围资格选手名额为<color=green>"..gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_REGCNT).."名<color>。\n　　<color=yellow>竞投名额<color>：本区服共有<color=red>"..(WULIN_MAXMEMBER-wl_GetMember()).."名<color>固定的武林大会竞投选手名额。同时，在规定时间内没有确认报名参加武林大会的（拥有入围资格的）选手其名额，将自动计入竞投选手名额中，我会根据投注金额顺次选取玩家获取第二届武林大会选手资格。\n　　<color=yellow>竞投规则<color>：每一次最少投注<color=red>100万<color>，最多投注<color=red>5亿<color>。玩家可进行<color=red>多次投注<color>，投标资金的<color=red>上限不封顶<color>。参与竞投的玩家等级不小于<color=red>90级<color>。竞投成功的玩家，其投注金额将作为竞投资金，由系统收取；竞投失败的玩家，则可以全额领会自己的投注金额。", "我要竞投选手资格/wulin_want2compete", "我考虑考虑先/OnCancel")
	end
end

function wulin_want2compete()
	AskClientForNumber("wulin_sure2compete", 1000000, 500000000, "请输入投注金额:");
end

function wulin_sure2compete(nMoney)
	--检查投注金额
	if (nMoney < 1000000 or nMoney > 500000000) then
		wlls_descript("每次竞投最低100万，最高不超过5亿，请确认你输入的金额。")
		return
	end
	if (mod(nMoney, WULIN_MONEYBASE) ~= 0) then
		wlls_descript("竞投每次以<color=red>100万<color>为最低投标金额，竞投金额需为<color=red>100万<color>的整数倍。请重新竞投。")
		return
	end
	wlls_descript("您投注的金额为<color=red>"..nMoney.."两<color>，请确认您的金额数。", "我确认/#wulin_final2compete("..nMoney..")", "取消竞投/OnCancel")
end

function wulin_final2compete(nMoney)
	--再次确认竞投资格
	if (wulin_canregister(GetName()) == nil or wulin_canregister(GetName()) == 1) then
		return
	end
	if (GetCash() >= nMoney) then
		local result, rank = wulin_docompete(GetName(), GetAccount(), nMoney)
		if (result) then
			Pay(nMoney)
			if (rank == 0) then
				wlls_descript("您成功参与本次竞投，当前竞投金额为<color=red>"..(result * WULIN_MONEYBASE).."两<color>，暂时还没有名次，请稍后查询您的当前名次。")
			else
				wlls_descript("您成功参与本次竞投，当前竞投金额为<color=red>"..(result * WULIN_MONEYBASE).."两<color>，暂时排名为<color=yellow>"..rank.."<color>名，排名还没有刷新，请稍后再来查询您的当前名次。")
			end
			WriteLog(date().."\tName:"..GetName().."\tAccount:"..GetAccount().."\t竞投武林大会选手资格投入"..nMoney.."两，共投入"..(result * WULIN_MONEYBASE).."两。")
		else--失败
			wlls_descript("竞投出现问题，请稍候再来。")
		end
	else
		wlls_descript("您身上好像没有带够<color=red>"..nMoney.."<color>银两哦，是真的要来竞投吗？可不要开我玩笑啊！还是带够银两再来吧。")
	end
end

function wulin_docompete(rolename, roleaccount, n_money)
	local n_lid = LG_GetLeagueObj(WULIN_LGTYPE_ELECTOR, rolename)
	if (FALSE(n_lid)) then	--如果战队还未建立，现在创建
		wulin_creatNewmember(WULIN_LGTYPE_ELECTOR, rolename, roleaccount)
		local n_level = GetLevel()
		local n_faction = GetLastFactionNumber()
		LG_ApplySetLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_FACTION, n_faction)
		LG_ApplySetLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_LEVEL, n_level)
	end
--		local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
--		LG_SetLeagueInfo(nNewLeagueID, WULIN_LGTYPE_ELECTOR, rolename)	--设置社团信息(类型、名称)
--		LG_ApplyAddLeague(nNewLeagueID, "", "")
--		LG_FreeLeagueObj(nNewLeagueID)
--		--加入战队以账号
--		local nMemberID = LGM_CreateMemberObj()	--生成社团成员数据对象(返回对象ID)
--		--设置社团成员的信息(角色名、职位、社团类型、社团名称)
--		LGM_SetMemberInfo(nMemberID, roleaccount, 0, WULIN_LGTYPE_ELECTOR, rolename)
--		LGM_ApplyAddMember(nMemberID, "", "")
--		LGM_FreeMemberObj(nMemberID)
--	end
	local pre_money = LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_MONEY)
	LG_ApplyAppendLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_MONEY, floor(n_money / WULIN_MONEYBASE))	--投注金额
	LG_ApplySetLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_DATE, tonumber(GetLocalDate("%d%H")))	--投注日期
	LG_ApplySetLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_TIME, tonumber(GetLocalDate("%M%S")))	--投注时间
	return (pre_money + floor(n_money / WULIN_MONEYBASE)),LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_RANK)
end

--票选总领队
function wulin_leader()
	if (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 3) then
		--n_lid, rolename
		if (getn(_wulin_tb_mem) == 0) then
			local n_lid = LG_GetFirstLeague(WULIN_LGTYPE_REGISTER)
			while (not FALSE(n_lid)) do
				local rolename = LG_GetLeagueInfo(n_lid)
				_wulin_tb_mem[getn(_wulin_tb_mem) + 1] = rolename
				n_lid = LG_GetNextLeague(WULIN_LGTYPE_REGISTER, n_lid)
			end
		end
		if (not FALSE(wulin_check_canleader())) then
			wlls_descript("<color=yellow>票选总领队<color>：2006年3月17日0：00~2006年3月23日24：00（以服务器时间为准）期间，在确定的武林大会选手名单中，投票选择您所在区服的总领队，每人仅限一票。您可以在我这里投票。", "根据指定选手投票/wulin_askforleadername", "根据武林大会选手列表投票/#wulin_showmember(0,1)", "取消/OnCancel")
		end
	end
end

function wulin_check_canleader()
	if (FALSE(LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, GetName()))) then
		wlls_descript("您不是第二届武林大会选手，不能参加票选总领队。")
		return nil
	elseif (LG_GetLeagueTask(WULIN_LGTYPE_REGISTER, GetName(), WULIN_LGTASK_CANVOTE) ~= 0) then--已经投过票
		wlls_descript("您已经投过票了，就不能再对选手进行投票。")
		return nil
	end
	return 1
end

function wulin_askforleadername()
	AskClientForString("wulin_want2leader", "", 1, 16, "请输入角色名");
end

function wulin_showmember(start, pages)
	local tbOpp = {}
	if (getn(_wulin_tb_mem) - start <= 10) then
		for i = 1, getn(_wulin_tb_mem) - start do
			tbOpp[getn(tbOpp) + 1] = safeshow(_wulin_tb_mem[start + i]).."/#wulin_want2leader(\""..safestr(_wulin_tb_mem[start + i]).."\")"
		end
	else
		for i = 1, 10 do
			tbOpp[getn(tbOpp) + 1] = safeshow(_wulin_tb_mem[start + i]).."/#wulin_want2leader(\""..safestr(_wulin_tb_mem[start + i]).."\")"
		end
		tbOpp[getn(tbOpp) + 1] = "下一页/#wulin_showmember("..(start + 10)..","..(pages + 1)..")"
	end
	if (pages ~= 1) then
		tbOpp[getn(tbOpp) + 1] = "上一页/#wulin_showmember("..(start - 10)..","..(pages - 1)..")"
	end
	tbOpp[getn(tbOpp) + 1] = "取消/OnCancel"
	wlls_descript("名单如下，请选择：<color=red>（"..wulin_getPage(pages).."）<color>", tbOpp)
end

function wulin_want2leader(rolename)
	wlls_descript("您将要对<color=red>"..safeshow(rolename).."<color>进行投票吗？", "我确认/#wulin_sure2leader(\""..safestr(rolename).."\")", "我还在考虑/OnCancel")
end

function wulin_sure2leader(rolename)
	if (FALSE(wulin_check_canleader())) then
		return
	end
	if (FALSE(LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, rolename))) then
		wlls_descript("玩家<color=red>"..rolename.."<color>不是武林大会选手，不能对该玩家进行投票。")
		return
	end
	
	LG_ApplyAppendLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_VOTEDCNT, 1)--投票+1
	LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_DATE, date("%d"))
	LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_TIME, date("%H%M"))
	LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, GetName(), WULIN_LGTASK_CANVOTE, 1)--已投票
	wlls_descript("您对<color=yellow>"..safeshow(rolename).."<color>的投票成功！")
	WriteLog(date().." Name:"..GetName().." Account:"..GetAccount().."\t向["..rolename.."]投票选总领队")
end

function  wulin_getPage(page)
	local tb_pagename = {
		[1] = "第一页",
		[2] = "第二页",
		[3] = "第三页",
		[4] = "第四页",
		[5] = "第五页",
		[6] = "第六页",
		[7] = "第七页",
		[8] = "第八页",
		[9] = "第九页",
		[10] = "第十页",
		[11] = "第十一页",
		[12] = "第十二页",
	}
	return tb_pagename[page]
end

function wulin_queryfinal()
	wulin_showqueryfinal(0,1)
end

function wulin_showqueryfinal(start, pages)
	local tbOpp = {}
	local szMsg = "选手名单如下：<color=red>（"..wulin_getPage(pages).."）<color>"
	if (getn(_wulin_tb_mem) - start <= 10) then
		for i = 1, getn(_wulin_tb_mem) - start do
			szMsg = szMsg.."\n　　"..safeshow(_wulin_tb_mem[start + i])
		end
	else
		for i = 1, 10 do
			szMsg = szMsg.."\n　　"..safeshow(_wulin_tb_mem[start + i])
--			tbOpp[getn(tbOpp) + 1] = _wulin_tb_mem[start + i].."/#wulin_showqueryfinal("..(start + 10)..","..(pages + 1)..")"
		end
		tbOpp[getn(tbOpp) + 1] = "下一页/#wulin_showqueryfinal("..(start + 10)..","..(pages + 1)..")"
	end
	if (pages ~= 1) then
		tbOpp[getn(tbOpp) + 1] = "上一页/#wulin_showqueryfinal("..(start - 10)..","..(pages - 1)..")"
	end
	tbOpp[getn(tbOpp) + 1] = "取消/OnCancel"
	wlls_descript(szMsg, tbOpp)
end

function wulin_giveback()
	if (FALSE(wulin_check_cangiveback())) then
		return
	end
	local n_money = LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, GetName(), WULIN_LGTASK_MONEY)
	if (n_money > 500) then
		wlls_descript("由于您所投金额为<color=red>"..(n_money*WULIN_MONEYBASE).."两<color>大于<color=red>5亿<color>，我将分次退还您的所有投注金额，每次退还金额上限为<color=red>5亿<color>。", "明白了，请退还给我/#wulin_sure2giveback(500)", "我稍候再来领取/OnCancel")
	else
		wlls_descript("您的投注金额为<color=red>"..(n_money*WULIN_MONEYBASE).."<color>两，现在取回吗？", "恩，请退还给我/#wulin_sure2giveback("..n_money..")", "我稍候再来领取/OnCancel")
	end
end

function wulin_sure2giveback(n_money)
	if (FALSE(wulin_check_cangiveback())) then
		return
	end
	local curmoney =  LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, GetName(), WULIN_LGTASK_MONEY)
	if (n_money > curmoney) then
		return
	end
	LG_ApplyAppendLeagueTask(WULIN_LGTYPE_ELECTOR, GetName(), WULIN_LGTASK_MONEY, (-n_money))
	Earn(n_money * WULIN_MONEYBASE)
	if (n_money == curmoney) then
		wlls_descript("您的投注金<color=red>"..(n_money * WULIN_MONEYBASE).."<color>两，已经退还给您，请验收。")
	else
		wlls_descript("您的投注金<color=red>"..(n_money * WULIN_MONEYBASE).."<color>两，已经退还给您，请验收。您还有剩余款额"..((curmoney - n_money) * WULIN_MONEYBASE).."，请记得来取回。")
	end
	WriteLog(date().." Name:"..GetName().." Account:"..GetAccount().." 领取回投注金"..(n_money*WULIN_MONEYBASE))
end

function wulin_check_cangiveback()
	if (FALSE(LG_GetLeagueObj(WULIN_LGTYPE_ELECTOR, GetName()))) then
		wlls_descript("您没有过参加武林大会选手资格的竞投。只有参加竞投并且竞投失败的玩家才能领回全额的投注金额。")
		return nil
	else
		if (not FALSE(LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, GetName()))) then
			wlls_descript("您成功竞投为武林大会选手，就不用再想着拿回投注金了。")
			return nil
		elseif (LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, GetName(), WULIN_LGTASK_MONEY) <= 0) then
			wlls_descript("您已经全额领回了投注金，没有什么可以退还给您的喽！")
			return nil
		elseif (GetCash() >= 1000000000) then
			wlls_descript("您身上带的钱太多，以防万一，您还是先将背包的钱存了再来取吧。")
			return nil
		end
	end
	return 1
end

WULIN_TB_INFO = {
	"　　　　　　<color=red>武林大会提前资格确认<color>\n　　具备入围资格的选手，在一定期限<color=yellow>（3月3日~3月16日）<color>内，在我这里确定报名参加第二届武林大会，则可以获得第二届武林大会-选手资格。在规定时间内，没有确定报名参加的选手则视为<color=yellow>自动弃权<color>，其名额自动计入竞投选手名额中。\n　　<color=yellow>具有提前入围资格的选手包括：<color>\n　　当前世界十大高手（截止2006年2月28日24：00）。\n　　上届武林大会所有比赛（团体赛除外）的卫冕冠军。\n　　各届武林联赛前4名（根据各区服并服的不同情况有所不同）\n<color=red>详情请见官方网站jx.kingsoft.com<color>",
	"　　　　　　<color=red>武林大会选手资格竞投<color>\n　　每组服务器拥有<color=yellow>"..WULIN_MAXMEMBER.."名<color>武林大会选手，除去提前入围资格的选手，会余下一定的竞投选手名额，同时在规定时间内，没有确定报名参加武林大会的（拥有入围资格的）选手则视为自动弃权，其名额自动计入竞投选手名额中。\n　　竞投方法采取<color=yellow>暗标竞投<color>。每名玩家可以自由投注金额，但只能查询自己的<color=yellow>投注金额以及排名情况<color>。在竞投时间<color=yellow>（3月10日~3月16日）<color>结束后，会根据投注金额排名，给与相应选手第二届武林大会-选手资格。\n　　竞投成功的选手，其投注金额将作为竞投资金，由系统收取；竞投失败的选手，则可以全额领回自己的投注金。每次最多退返给选手的金额上限为5亿。\n　　参与竞投的玩家等级必须<color=yellow>不小于90级<color>，并且拜入过某个<color=yellow>门派<color>。已获取提前入围资格和武林大会选手资格的选手不能参与竞投。",
	"　　　　　　<color=red>票选武林大会总领队<color>\n　　在武林大会选手资格确定以后，所有选手可以在我这里投票选择本区服的总领队，选择方法为<color=yellow>填写名字或直接列出选手名选项<color>，每名选手只能<color=yellow>投1票<color>。投票时间<color=yellow>（3月17日~3月23日）<color>截止后，票数第一的选手成为该区服的<color=yellow>总领队<color>（即武林大会服务器该服务器帮会的帮主）；票数第2-8名则为武林大会服务器该服务器帮会的<color=yellow>长老<color>。"
}
--武林大会预选帮助
function wulin_helpinfo()
	wlls_descript(WULIN_TB_INFO[1], "武林大会选手资格竞投/wulin_helpinfo_1", "票选武林大会总领队/wulin_helpinfo_2", "谢谢，我清楚了/OnCancel")
end

function wulin_helpinfo_1()
	wlls_descript(WULIN_TB_INFO[2], "武林大会提前资格确认/wulin_helpinfo", "票选武林大会总领队/wulin_helpinfo_2", "谢谢，我清楚了/OnCancel")
end

function wulin_helpinfo_2()
	wlls_descript(WULIN_TB_INFO[3], "武林大会提前资格确认/wulin_helpinfo", "武林大会选手资格竞投/wulin_helpinfo_1", "谢谢，我清楚了/OnCancel")
end

function OnCancel()
end

--查询总领队
function wulin_queryleader()
	local szMsg = "总领队（帮主）及副领队（长老）如下："
	for i = getn(_wulin_tb_leader), 1, -1 do
		if (_wulin_tb_leader[i][2] == 1) then
			szMsg = szMsg.."\n　　"..safeshow(_wulin_tb_leader[i][1]).."<color=red>（帮主）<color>"
		else
			szMsg = szMsg.."\n　　"..safeshow(_wulin_tb_leader[i][1]).."<color=red>（长老）<color>"
		end
	end
	wlls_descript(szMsg)
end

function wulin_creatNewmember(n_lgtype, pname, paccount)
	--创建战队
	local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
	LG_SetLeagueInfo(nNewLeagueID, n_lgtype, pname)	--设置社团信息(类型、名称)
	LG_ApplyAddLeague(nNewLeagueID, "", "")
	LG_FreeLeagueObj(nNewLeagueID)

	--加入战队
	--将account做为另一个战队
	--WULIN_LGTYPE_ACCOUNT
	--roleaccount
	if (FALSE(LG_GetLeagueObj(WULIN_LGTYPE_ACCOUNT, paccount))) then
		local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
		LG_SetLeagueInfo(nNewLeagueID, WULIN_LGTYPE_ACCOUNT, paccount)	--设置社团信息(类型、名称)
		LG_ApplyAddLeague(nNewLeagueID, "", "")
		LG_FreeLeagueObj(nNewLeagueID)
	end
		
	--加入战队以账号
	local nMemberID = LGM_CreateMemberObj()	--生成社团成员数据对象(返回对象ID)
	--设置社团成员的信息(角色名、职位、社团类型、社团名称)
	LGM_SetMemberInfo(nMemberID, pname, 0, WULIN_LGTYPE_ACCOUNT, paccount)
	LGM_ApplyAddMember(nMemberID, "", "")
	LGM_FreeMemberObj(nMemberID)
end

function wulin_title()
	wlls_descript("所有获得第二届武林大会选手资格的玩家，可以领取<color=red>“第二届武林大会选手”<color>的称号。该称号持续时间至<color=red>4月30日<color>，您确定现在领取吗？", "我要领取/wulin_sure2title", "取消/OnCancel")
end

function wulin_sure2title()
	if (not FALSE(LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, GetName()))) then
			Title_AddTitle(99, 2, 4302359);	--以游戏时间截止,月日时分
			Title_ActiveTitle(99);
			SetTask(1122, 99)
			wlls_descript("恭喜您获得<color=red>“第二届武林大会选手称号”<color>。")
	else
		wlls_descript("您现在不是第二届武林大会选手，请您通过确认提前入围资格或者竞投大会选手取得选手资格后再来领取选手头衔。")
	end
end