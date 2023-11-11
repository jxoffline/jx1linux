-- 2005ÖÐÇï½Ú»î¶¯ »¨µÆNPC½Å±¾ by wangbin 2005-09-02

IncludeLib("FILESYS")
Include("\\script\\event\\mid_autumn\\oddsaward.lua")
Include("\\script\\event\\mid_autumn\\create_lanterns.lua")
Include("\\script\\tong\\tong_award_head.lua");

LANTERN_TSKID_DATE = 1604;
LANTERN_TSKID_WCNT = 1605;
MX_LANTERN_COUNT = 100;
LANTERN_FILE = "\\settings\\event\\zhongqiuhuodong\\zhongqiudengmi.txt"

function main()
	local npcidx = GetLastDiagNpc()
	if (GetNpcParam(npcidx, 4) == 0 ) then
		return
	end
	
	local nDay = tonumber(date("%m%d"))
	if ( GetTask(LANTERN_TSKID_DATE) ~= nDay ) then
		SetTask(LANTERN_TSKID_DATE, nDay)
		SetTask(LANTERN_TSKID_WCNT, 0)
	end
	
	if ( GetTask(LANTERN_TSKID_WCNT) >= MX_LANTERN_COUNT ) then
		Say("<#> B¹n ®· ®o¸n ®óng 100 c©u ®è råi! Nh­êng c¬ héi cho ng­êi kh¸c ®i!", 0)
		return
	end
	local rannum = random(100)
	if ( rannum <= 1 ) then
		AddItem(6, 1, 900, 1, 0, 0, 0)		--<#>¡°»ðÆáÃÜº¯¡±
		local str = "<#> Xem c©u ®è tiÕp theo /#show_riddle (0, '<#> c©u ®è nh­ sau: <enter>') "
		Say("<#> B¹n ch¨m chó xem, cuèi cïng ph¸t hiÖn trªn ngän ®Ìn giÊu mét m¶nh giÊy, kü thuËt rÊt tinh vi", 1, str)
		Msg2Player("<#> B¹n nhËn ®­îc 'Háa tÊt MËt Hµm'")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account:"..GetAccount()..",Name:"..GetName()..",in the mid_autumn get shenzhaoyuan shougao.")
	else
		show_riddle(0, "<#> c©u ®è nh­ sau: <enter>" )
	end
	SetNpcParam(npcidx,4,0)
	delnpcsafe(npcidx)	--delete npc
end

function delnpcsafe(nNpcIndex)
	if (nNpcIndex <= 0 )  then
		return
	end
	
	PIdx = NpcIdx2PIdx(nNpcIndex);
	if (PIdx > 0) then 
		WriteLog("ERROR!!!DelNpc WANT TO DELETE Player");
		return
	end;
	
	DelNpc(nNpcIndex)
	local mapid = SubWorldIdx2ID(SubWorld)
	for i = 1, getn( tbLANTERNS_NPC ) do
		if ( tbLANTERNS_NPC[i][1] == mapid ) then
			SetGlbValue( tbLANTERNS_NPC[i][2], (GetGlbValue( tbLANTERNS_NPC[i][2] ) - 1) )
			break
		end
	end
end;

-- ÏÔÊ¾µÆÃÕ¶Ô»°
tbl_answer_index = {
	['A'] = 1,
	['B'] = 2,
	['C'] = 3,
	['D'] = 4,
	['a'] = 1,
	['b'] = 2,
	['c'] = 3,
	['d'] = 4,
};

tbl_answer_order = {
	"A",
	"B",
	"C",
	"D",
};

-- ¸ÅÂÊ
tbl_odds = {
	15,
	15,
	15,
	27.639,
	5,
	15,
	5,
	1.5,
	0.3,
	0.05,
	0.05,
	0.05,
	0.2,
	0.05,
	0.01,
	0.001,
	0.02,
	0.02,
	0.02,
	0.02,
	0.02,
	0.01,
	0.01,
	0.01,
	0.01,
	0.01,
};


-- ½±Àø
tbl_awards = {
	{5, nil},
	{10, nil},
	{15, nil},
	{30, nil},
	{50, nil},
	{0, {"<#> 1 Tiªn Th¶o lé ", 6, 1, 71, 0}},
	{0, {"<#> 1 Phóc Duyªn lé (tiÓu) ", 6, 1, 122, 0}},
	{0, {"<#> 1 Phóc Duyªn lé (trung) ", 6, 1, 123, 0}},
	{0, {"<#> 1 Phóc Duyªn lé (®¹i) ", 6, 1, 124, 0}},
	{0, {"<#> 1 Lam Thñy Tinh", 238}},
	{0, {"<#> 1 Lôc Thñy Tinh", 240}},		
	{0, {"<#> 1 Tö Thñy Tinh", 239}},
	{0, {"<#> 1 HuyÒn Tinh Kho¸ng Th¹ch cÊp 4", 6,1,147,4}},
	{0, {"<#> 1 HuyÒn Tinh Kho¸ng Th¹ch cÊp 5", 6,1,147,5}},
	{0, {"<#> 1 HuyÒn Tinh Kho¸ng Th¹ch cÊp 6", 6,1,147,6}},
	{0, {"<#> 1 ThÇn BÝ Kho¸ng th¹ch", 6, 1, 398, 0}},
	{0, {"<#> Mét bé Gi¸ng Sa Bµo 6 thuéc tÝnh (Kim) ", 2,0,2,3,10,0,1,-1}},
	{0, {"<#> Mét bé Gi¸ng Sa Bµo 6 thuéc tÝnh (Méc) ", 2,0,2,3,10,1,1,-1}},
	{0, {"<#> Mét bé Gi¸ng Sa Bµo 6 thuéc tÝnh (Thñy) ", 2,0,2,3,10,2,1,-1}},
	{0, {"<#> Mét bé Gi¸ng Sa Bµo 6 thuéc tÝnh (Háa) ", 2,0,2,3,10,3,1,-1}},
	{0, {"<#> Mét bé Gi¸ng Sa Bµo 6 thuéc tÝnh (Thæ) ", 2,0,2,3,10,4,1,-1}},
	{0, {"<#> Mét bé C÷u VÜ B¹ch Hå 6 thuéc tÝnh (Kim) ", 2,0,2,9,10,0,1,-1}},
	{0, {"<#> Mét bé C÷u VÜ B¹ch Hå 6 thuéc tÝnh (Méc) ", 2,0,2,9,10,1,1,-1}},
	{0, {"<#> Mét bé C÷u VÜ B¹ch Hå 6 thuéc tÝnh (Thñy) ", 2,0,2,9,10,2,1,-1}},
	{0, {"<#> Mét bé C÷u VÜ B¹ch Hå 6 thuéc tÝnh (Háa) ", 2,0,2,9,10,3,1,-1}},
	{0, {"<#> Mét bé C÷u VÜ B¹ch Hå 6 thuéc tÝnh (Thæ) ", 2,0,2,9,10,4,1,-1}},
};

-- ·¢½±
function issue(items)
local szLog = date("%y-%m-%d,%H:%M,").."Account:"..GetAccount()..",Name:"..GetName()..",in the mid_autumn "
	if (items[1] ~= 0) then
		local exp = items[1] * 10000
		AddOwnExp(exp)
		Msg2Player("<#> B¹n nhËn ®­îc " .. exp .. "®iÓm kinh nghiÖm.");
		szLog = szLog.."get "..exp.." point experience;"
	end
	local attrs = items[2]
	if (attrs ~= nil) then
		local count = getn(attrs)
		if (count == 2) then
			AddEventItem(attrs[2])
		elseif (count == 5) then
			AddItem(attrs[2], attrs[3], attrs[4], attrs[5], 0, 0, 0)
		elseif (count == 9) then
			AddQualityItem(attrs[2], attrs[3], attrs[4], attrs[5], attrs[6], attrs[7], attrs[8], attrs[9])
		end
		Msg2Player("<#> B¹n nhËn ®­îc " .. attrs[1] .. "!");
		szLog = szLog.."get "..attrs[1]..";"
	end
	WriteLog(szLog)
end

g_count = 0
-- ÏÔÊ¾µÆÃÕÎÊÌâ
function show_riddle(count, caption)
--	print(format("g_count:%d", g_count))
	g_count = g_count + 1
	file = LANTERN_FILE
	TabFile_Load(file, file)
	local row_count = TabFile_GetRowCount(file) - 1
	if (row_count > 1) then
		local row = random(2, row_count)
		local answer = TabFile_GetCell(file, row, 2)
		local question = format("%s%s", caption, TabFile_GetCell(file, row, 3))
		local options = {}
		local tbi = {}
		
		for i = 1, 4 do
			options[i] = TabFile_GetCell(file, row, 3 + i)
			if (tbl_answer_index[answer] == i) then
				options[i] = format("%s/#answer_ok(%d)", options[i], count)
			else
				options[i] = format("%s/answer_fail", options[i])
			end
		end
		ReSort(options)
		Say(question, 5, options[1], options[2], options[3], options[4], "<#> Hñy bá /answer_cancel")
	end
end

function ReSort(options)
	local count = getn(options)
	for i = 1, count do
		j = random(1, count)
		local tmp = options[i]
		options[i] = options[j]
		options[j] = tmp  
	end
	
	for i = 1, count do
		options[i] = format("%s. %s", tbl_answer_order[i], options[i])
	end
end

-- µÆÃÕ»Ø´ðÕýÈ·
function answer_ok(count)
	tongaward_riddle()
	-- print(format("answer_ok(%d)", count))
	if (count >= 2) then
		-- ·¢½±
		local index = get_odds_award(tbl_odds, 100)
		if (index >= 1) then
			issue(tbl_awards[index])
			Talk(1, "", "<#> Chóc mõng b¹n ®· ®¸p ®óng liªn tôc 3 c©u! Xin nhËn phÇn th­ëng.")
			SetTask(LANTERN_TSKID_WCNT, GetTask(LANTERN_TSKID_WCNT) + 1)
		end
	else
		show_riddle(count + 1, "<#> b¹n ®· ®¸p ®óng. H·y tiÕp tôc.<enter>")
	end
end

-- µÆÃÕ»Ø´ð´íÎó
function answer_fail()
	show_riddle(0, "<#> b¹n ®· ®¸p sai. H·y tiÕp tôc.<enter>")
end

-- È¡ÏûµÆÃÕÎÊ´ð 
function answer_cancel()
	-- nothing
end
