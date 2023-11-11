--Æß´ó³ÇÊÐ ·þÎñÆ÷
--Ö÷³Ç³ÇÖ÷½±Àø

Include("\\script\\lib\\gb_taskfuncs.lua");		--gb_Task
Include("\\script\\misc\\league_cityinfo.lua")
TB_MAINCITY_CITYWAR_T = {
--[³ÇÊÐ±àºÅ]={¹¥³ÇÐÇÆÚ£¬³ÇÊÐMap£¬³ÇÊÐÃû}
	{4, 1, "Ph­îng T­êng"},
	{2, 11, "Thµnh §«"},
	{3, 162, "§¹i Lý"},
	{6, 37, "BiÖn Kinh"},
	{5, 78, "T­¬ng D­¬ng"},
	{1, 80, "D­¬ng Ch©u"},
	{7, 176, "L©m An"},
}

TB_MAINCITY_AWARDARY = {
--g,d,p,l,s,luck, count, free
	[1] = {6,1,1339,1,1,1, 10, 10},
	[2] = {6,1,1340,1,1,1, 100, 50},
}

--GetCityOwner()
function maincity_award_entry()
	local city_id = gb_GetTask("MAINCITYCFG", 1);
	if (GetTongMaster() ~= GetName() or GetCityOwner(city_id) ~= GetTongName()) then
		Say("<#>Ng­¬i kh«ng ph¶i lµ Th¸i thó cña <"..GetCityAreaName(city_id).."Phñ>, kh«ng thÓ nhËn phÇn th­ëng!", 0);
		return 0;
	end;
	
	Say("<#>NhËn phÇn th­ëng dµnh cho Th¸i Thó ",
	3,
	"<#>NhËn Thµnh chñ LÔ bao/take_maincity_award",
	"<#>NhËn Thµnh chñ LÔ phÈm/take_maincity_award",
	"<#> T¹m thêi ta kh«ng l·nh ®©u/OnCancel");
end;

function take_maincity_award(nSel)
	local nlg_tsk = nSel + 1;
	local city_id = gb_GetTask("MAINCITYCFG", 1);
	if (check_award_condition(city_id, nlg_tsk, 1) ~= 1) then
		return 0;
	end;
	
	local ncount = TB_MAINCITY_AWARDARY[nlg_tsk][8];
	local ncurcount = get_citybonus_task(city_id, nlg_tsk);
	if (CalcFreeItemCellCount() < ncount) then
		Say("<#>Hµnh trang cña ng­¬i kh«ng ®ñ chç trèng, xin h·y s¾p xÕp l¹i!", 0);
		return 0;
	end;
	local ng, nd, np, nl, ns, nluck = TB_MAINCITY_AWARDARY[nlg_tsk][1],TB_MAINCITY_AWARDARY[nlg_tsk][2],TB_MAINCITY_AWARDARY[nlg_tsk][3],
																		TB_MAINCITY_AWARDARY[nlg_tsk][4],TB_MAINCITY_AWARDARY[nlg_tsk][5],TB_MAINCITY_AWARDARY[nlg_tsk][6];
	
	
	local szLogmsg = "";
	if (nlg_tsk == 1) then
		szLogmsg = " nhËn Thµnh chñ LÔ bao";
	else
		szLogmsg = "Thµnh chñ LÔ phÈm";
		if (ncurcount >= ncount) then
			szLogmsg = "NhËn ®ît thø 2: "..szLogmsg;
		else
			szLogmsg = "NhËt ®ît thø 1: "..szLogmsg;
		end;
	end;
	
	set_citybonus_task(city_id, nlg_tsk, ncount+ncurcount);
	for i = 1, ncount do
		AddItem(ng, nd, np, nl, ns, nluck);
	end;
	WriteLog("[PhÇn th­ëng server ThÊt §¹i Thµnh ThÞ]\t"..GetLocalDate("%Y-%m-%d %H:%M:%S\t").."Name:"..GetName().." Account:"..GetAccount()..szLogmsg..ncount.."c¸i");
	Say("<#>Ng­¬i "..szLogmsg..". Xin chóc mõng!", 0);
end;

function check_award_condition(city_id, nlg_tsk, show_talk)
	if (city_id > 7 or city_id < 1) then
		if (show_talk) then
			Say("<#>ChØ ®Þnh Th¸i thó sai sãt, xin liªn l¹c víi ng­êi qu¶n lý!", 0);
		end;
		return 0
	end;
	local nDeadline = get_maincity_deadline(city_id);
	
	local ncurweek = tonumber(GetLocalDate("%w"));
	if (ncurweek == 0) then
		ncurweek = 7;
	end;
	if (TB_MAINCITY_CITYWAR_T[city_id][1] == ncurweek and tonumber(GetLocalDate("%H%M")) >= 2000 and tonumber(GetLocalDate("%H%M")) < 2230) then
		Say("<#>§ang thêi gian c«ng thµnh, Thµnh chñ kh«ng thÓ nhËn phÇn th­ëng.", 0);
		return 0;
	end;
	local nTskDate = get_maincitybonus_date(city_id);
	if (nDeadline ~= nTskDate) then
		set_citybonus_task(city_id, CITYINFO_LEAGUETASK_BONUS, 0);
		set_citybonus_task(city_id, CITYINFO_LEAGUETASK_GIFT, 0);
		set_citybonus_task(city_id, CITYINFO_LEAGUETASK_DATE, nDeadline);
	end;
	local ntskvalue = get_citybonus_task(city_id, nlg_tsk);
	
	if (ntskvalue >= TB_MAINCITY_AWARDARY[nlg_tsk][7]) then
		if (show_talk) then
			Say("<#>Ng­¬i ch¼ng ph¶i ®· nhËn phÇn th­ëng tuÇn nµy råi sao?", 0);
		end;
		return 0;
	end;
	return 1;
end;

function get_maincity_deadline(city_id)
	local nServerTime = GetCurServerTime();
	local nCurWeek = tonumber(GetLocalDate("%w"));
	if (nCurWeek == 0) then
		nCurWeek = 7;
	end;
	local nCurDate = floor(FormatTime2Number(nServerTime) / 10000);
	local nCurTime = mod(FormatTime2Number(GetCurServerTime()) , 10000);
	local naddtime = 0;
	if (TB_MAINCITY_CITYWAR_T[city_id][1] == nCurWeek) then
		if (nCurTime < 2000) then
			return nCurDate;
		else
			naddtime = 7;
		end;
	elseif (TB_MAINCITY_CITYWAR_T[city_id][1] < nCurWeek) then
		naddtime = (7 - nCurWeek + TB_MAINCITY_CITYWAR_T[city_id][1]);
	elseif (TB_MAINCITY_CITYWAR_T[city_id][1] > nCurWeek) then
		naddtime = (TB_MAINCITY_CITYWAR_T[city_id][1] - nCurWeek);
	end;
	return floor(FormatTime2Number(nServerTime + naddtime * 24 * 60 * 60) / 10000)
end;

