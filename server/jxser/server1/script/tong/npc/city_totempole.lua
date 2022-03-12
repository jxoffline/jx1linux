--³ÇÊÐÌØ¼¼Í¼ÌÚNPC
--Edit by ×Ó·ÇÓã¡æ
--2006-06-20

Include("\\script\\tong\\tong_setting.lua")
-- Í¬°éÏµÍ³µÄÖ§³Ö
IncludeLib("PARTNER");
IncludeLib("ITEM");
Include([[\script\lib\coordinate.lua]]);--Ö§³ÖÉè¶¨ÎÄ¼þ·ÃÎÊ
LINK_TONG_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>Cét biÓu t­îng bang: <link>"
LINK_CITY_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>Cét biÓu t­îng thµnh thÞ: <link>"

--³ÇÊÐÍ¼ÌÚ
function main()
	local _Name, nTongID = GetTongName()
	
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("Ng­¬i ch­a gia nhËp bang, muèn ®Õn ®©y tham quan sao?")
		return
	end
	
	local nStuntID = tong_GetCityStuntID(nTongID)
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("§©y kh«ng ph¶i lµ l·nh ®Þa cña quý bang, chØ lµ ®Õn tham quan th«i.")
		return
	elseif (nStuntID == 0) then
			totempole_dec("Bang héi quÝ bang ch­a më kü n¨ng thµnh thÞ, kh«ng thÓ sö dông Cét biÓu t­îng. H·y th«ng b¸o ®Õn cÊp l·nh ®¹o bang, t¹i trang chøc n¨ng cã thÓ khai më kü n¨ng thµnh thÞ.")
			return
	end
		--Ö´ÐÐ¶ÔÓ¦ÌØ¼¼
		getglobal(TB_STUNTID_INFO[nStuntID].func)(nTongID, nStuntID)
end



function IsTakeStunt(nTongID,nStuntRight)
	local _Name, nTongID = GetTongName()
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("Ng­¬i ch­a gia nhËp bang, muèn ®Õn ®©y tham quan sao?")
		return
	end
	local nStuntID = tong_GetCityStuntID(nTongID)
	if (nStuntID == 0) then
		print("Kh«ng ph¶i bang chiÕm thµnh!")
		return
	end
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("§©y kh«ng ph¶i lµ l·nh ®Þa cña quý bang, chØ lµ ®Õn tham quan th«i.")
		return
	elseif (TONG_GetWeek(nTongID) > TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD)) then
		totempole_dec("Kü n¨ng thµnh thÞ ®· qu¸ h¹n b¶o tr×, hiÖn t¹i kh«ng thÓ nhËn. H·y thö l¹i thêi gian b¶o tr× h«m nay.")
		return
	end
	
	local nHour = tonumber(GetLocalDate("%H"))
	if (nHour < 20 or nHour > 22) then
		totempole_dec("Thêi gian tiÕp nhËn kü n¨ng thµnh thÞ lµ 20:00 ®Õn 22:00, trong kho¶ng thêi gian nµy h·y ®Õn nhËn kü n¨ng.")
		return
	end
	
	if (nStuntRight == 1) then
	--¹ÜÀíÌØ¼¼µÄÈ¨ÏÞ
		local nFigure = TONGM_CheckRight(nTongID, GetName(), 2006)
		if (nFigure == 1) then
			if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) > 0) then
				return 1
			else
				totempole_dec("Kü n¨ng thµnh thÞ trong tuÇn nµy ®· nhËn hÕt råi, h·y ®îi tuÇn sau míi cã thÓ nhËn n÷a.")
			end
		else
			totempole_dec("Kü n¨ng thµnh thÞ nµy chØ cho phÐp cÊp l·nh ®¹o bang tiÕp nhËn.")
		end
		return
	end
	
	if (GetTask(TASKID_STUNT_LASTWEEK) == TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) and GetTask(TASKID_CITYST_TAKED) >= TB_STUNTID_INFO[nStuntID].cntper) then
		totempole_dec("Trong tuÇn nµy ®· tiÕp nhËn kü n¨ng thµnh thÞ råi, kh«ng thÓ nhËn n÷a.")
		return
	elseif (GetTask(TASKID_STUNT_LASTWEEK) ~= TONG_GetWeek(nTongID)) then
		SetTask(TASKID_STUNT_TAKED, 0)
	end
	
	if (GetTask(TASKID_CITY_LASTDAY) == TONG_GetDay(nTongID)) then
		totempole_dec("Kü n¨ng bang héi mçi ngµy chØ cã thÓ nhËn 1 lÇn, ngµy mai hÕt ®Õn nhÐ.")
		return
	end
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) <= 0) then
		totempole_dec("Kü n¨ng thµnh thÞ h«m nay®· tiÕp nhËn hÕt råi, ngµy mai h·y ®Õn nhÐ.")
		return
	end
	
	--¸öÈËÀÛ»ý¹±Ï×¶ÈÏÞÖÆ
	--if ¸öÈËÀÛ»ý¹±Ï×¶È < MIN then return end
	return nTongID
end

function OnCancel()
end

--³ÇÊÐÌØ¼¼£º»Æ½ðÁî
function stunt_huangjinling(nTongID, nStuntID)

	TB_STUNT_HUANGJINLING = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>"..GetCityAreaName(nCityID).."Kü n¨ng thµnh thÞ: "..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.name.."<color>"..
	"<enter>QuyÒn tiÕp nhËn kü n¨ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_HUANGJINLING.right].."<color>"..
	"<enter>T¸c dông cña kü n¨ng ®Æc biÖt:"..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.describe.."<color>"..
	"<enter>Thêi gian hiÖu lùc kü n¨ng lµ 7 ngµy. H«m nay vÉn cho phÐp "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng­êi n÷a ®Õn nhËn kü n¨ng nµy.", 
	"TiÕp nhËn kü n¨ng/stunt_huangjinling1",
	"Rêi khái/OnCancel")
end

function stunt_huangjinling1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("Hµnh trang cÇn <color=yellow>%d<color> « trèng.",5))
		return
	end
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_HUANGJINLING.right)) then
		return
	end
	if (AddItem(6, 1, 1107, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		--ÕâÁ½¾äÔÚÕâÀïÆäÊµ²»±ØÒª
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("NhËn ®­îc 1 <color=yellow>Hoµng Kim LÖnh!<color>")
		Msg2Tong(nTongID, GetName().."NhËn ®­îc 1 Hoµng Kim LÖnh kü n¨ng thµnh thÞ")
		TONG_ApplyAddEventRecord(nTongID, GetName().."NhËn ®­îc 1 Hoµng Kim LÖnh kü n¨ng thµnh thÞ")
	end
end

--³ÇÊÐÌØ¼¼£ºÁé²ÎÁ¦
function stunt_lingshenli(nTongID, nStuntID)
	TB_STUNT_LINGSHENLI = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>"..GetCityAreaName(nCityID).."Kü n¨ng thµnh thÞ: "..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.name.."<color>"..
	"<enter>QuyÒn tiÕp nhËn kü n¨ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_LINGSHENLI.right].."<color>"..
	"<enter>T¸c dông cña kü n¨ng ®Æc biÖt:"..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.describe.."<color>"..
	"<enter>Thêi h¹n cña kü n¨ng nµy lµ 7 ngµy, trong thêi h¹n nµy cho phÐp tèi ®a "..TB_STUNT_LINGSHENLI.maxmem.." ng­êi tiÕp nhËn kü n¨ng, mçi ngµy mét ng­êi chØ nhËn ®­îc 1 lÇn. H«m nay cßn cho phÐp "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng­êi n÷a ®Õn nhËn kü n¨ng nµy.", 
	"TiÕp nhËn kü n¨ng/stunt_lingshenli1",
	"Rêi khái/OnCancel")
	
end

function stunt_lingshenli1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_LINGSHENLI.right)) then
		return
	end
	if (AddItem(6, 1, 1110, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("NhËn ®­îc mét <color=yellow>Hép nh©n s©m<color>, më ra lËp tøc nhËn ®­îc linh lùc cña nh©n s©m ngµn n¨m.")
	else
		Msg2Player("NhËn linh s©m lùc thÊt b¹i!")
	end
end

--112
function stunt_shiweiying(nTongID, nStuntID)
	TB_STUNT_SHIWEIYING = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."Kü n¨ng thµnh thÞ: "..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.name.."<color>"..
	"<enter>QuyÒn tiÕp nhËn kü n¨ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_SHIWEIYING.right].."<color>"..
	"<enter>T¸c dông cña kü n¨ng ®Æc biÖt:"..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.describe.."<color>"..
	"<enter>Thêi h¹n cña kü n¨ng nµy lµ 7 ngµy, trong thêi h¹n nµy cho phÐp tèi ®a "..TB_STUNT_SHIWEIYING.maxmem.." ng­êi tiÕp nhËn kü n¨ng, mçi ngµy mét ng­êi chØ nhËn ®­îc 1 lÇn. H«m nay cßn cho phÐp "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng­êi n÷a ®Õn nhËn kü n¨ng nµy.", 
	"TiÕp nhËn kü n¨ng/stunt_shiweiying1",
	"Rêi khái/OnCancel")
end

function stunt_shiweiying1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_SHIWEIYING.right)) then
		return
	end
	if (PARTNER_Count() >= 5) then
		totempole_dec("Sè l­îng b¹n ®ång hµnh ®· ®¹t giíi h¹n, chØ cã xãa bá 1 b¹n ®ång hµnh míi cã thÓ nhËn kü n¨ng nµy. Nh­ng xãa bá 1 b¹n ®ång hµnh rÊt tµn nhÉn, ng­¬i h·y suy nghÜ cho kü.")
		return
	end
	totempole_dec("Chän ngò hµnh cho b¹n ®ång hµnh.",
	"hÖ Kim/stunt_shiweiying2",
	"hÖ Méc/stunt_shiweiying2",
	"hÖ Thñy/stunt_shiweiying2",
	"hÖ Háa/stunt_shiweiying2",
	"hÖ Thæ /stunt_shiweiying2",
	"Ta muèn suy nghÜ l¹i/OnCancel"	)
end

TB_SERIES_NAME = {"Kim", "Méc", "Thñy ", "Háa", "Thæ "}
TB_CHARACTOR = {"Dòng M·nh","VÖ Chñ  ","L­u Mang ","Näa Nh­îc"}
function stunt_shiweiying2(nSel)
	SetTaskTemp(112, nSel)
	totempole_dec("§· lùa chän ngò hµnh b¹n ®ång hµnh lµ hÖ "..TB_SERIES_NAME[nSel+1].." , h·y tiÕp tôc chän lùa tÝnh c¸ch.",
	TB_CHARACTOR[1].."/stunt_shiweiying3",
	TB_CHARACTOR[2].."/stunt_shiweiying3",
	TB_CHARACTOR[3].."/stunt_shiweiying3",
	TB_CHARACTOR[4].."/stunt_shiweiying3",
	"KÕt thóc ®èi tho¹i/OnCancel"	)
end

function stunt_shiweiying3(nSel)
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_SHIWEIYING.right)) then
		return
	end
	local nseries = GetTaskTemp(112)
	local ncharactor = nSel + 1
	if (nseries == 0) then
		partnerIndex = PARTNER_AddFightPartner(5, 0, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 1) then
		partnerIndex = PARTNER_AddFightPartner(4, 1, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 2) then
		partnerIndex = PARTNER_AddFightPartner(2, 2, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 3) then
		partnerIndex = PARTNER_AddFightPartner(3, 3, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	else
		partnerIndex = PARTNER_AddFightPartner(1, 4, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	end
	if (partnerIndex == -1) then
		totempole_dec("TiÕp nhËn b¹n ®ång hµnh thÊt b¹i, h·y thö l¹i sao.")
		return
	end
	PARTNER_SetCurPartner(partnerIndex)
	PARTNER_CallOutCurPartner(1)
	local nlevel = random(1,49)
	for i = 1, nlevel do
		PARTNER_AddExp(partnerIndex, 825500)	--50¼¶ÐèÒª¾­Ñé
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
	totempole_dec("NhËn ®­îc 1 b¹n ®ång hµnh hÖ <color=yellow>"..TB_SERIES_NAME[nseries+1].."<color>, lo¹i h×nh <color=yellow>"..TB_CHARACTOR[ncharactor].."<color>.")
end

--ÌÕÖìÇ®´ü
function stunt_moneybox(nTongID, nStuntID)
	TB_STUNT_MONEYBOX = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."Kü n¨ng thµnh thÞ: "..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.name.."<color>"..
	"<enter>QuyÒn tiÕp nhËn kü n¨ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_MONEYBOX.right].."<color>"..
	"<enter>T¸c dông cña kü n¨ng ®Æc biÖt:"..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.describe.."<color>"..
	"<enter>Thêi h¹n cña kü n¨ng nµy lµ 7 ngµy, trong thêi h¹n nµy cho phÐp tèi ®a "..TB_STUNT_MONEYBOX.maxmem.." ng­êi tiÕp nhËn kü n¨ng, mçi ngµy mét ng­êi chØ nhËn ®­îc 1 lÇn. H«m nay cßn cho phÐp "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng­êi n÷a ®Õn nhËn kü n¨ng nµy.", 
	"TiÕp nhËn kü n¨ng/stunt_moneybox1",
	"Rêi khái/OnCancel")
end

function stunt_moneybox1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_RIGHT_DS.right)) then
		return
	end
	
	local ntime = floor(GetCurServerTime()/60) + 2 * 24 * 60
	SetTask(TASKID_MONEYBOX_LASTTIME, ntime)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
	totempole_dec("B¹n nhËn ®­îc 1 <color=yellow>§µo Chu TiÒn<color>, cã hiÖu qu¶ trong 2 ngµy!")

end

--ÎÞË«É±Õó--------------------------------
function stunt_wushuang(nTongID, nStuntID)
	TB_STUNT_WSSZ = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."Kü n¨ng thµnh thÞ: "..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.name.."<color>"..
	"<enter>QuyÒn tiÕp nhËn kü n¨ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WSSZ.right].."<color>"..
	"<enter>T¸c dông cña kü n¨ng ®Æc biÖt:"..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.describe.."<color>"..
	"<enter>Thêi h¹n kü n¨ng nµy lµ 7 ngµy.", 
	"TiÕp nhËn kü n¨ng/wsh_getwushuangshazhen",
	"Lo¹i h×nh V« song s¸t trËn/wsh_typewushuangshazhen",
	"Rêi khái/OnCancel")
end

--ÁìÈ¡ ÎÞË«É±Õó
function wsh_getwushuangshazhen()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("Hµnh trang cÇn <color=yellow>%d<color> « trèng.",5))
		return
	end
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_WSSZ.right)) then
		SetTaskTemp(193, 0);
		return
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)

	local nItem = AddItem(6, 1, 1106, 1, 0, 0, 0); --µÃµ½Ò»¸ö ÎÞË«É±Õó
	
	if (nItem > 0) then
		SetSpecItemParam(nItem, 1, 120);
		SyncItem(nItem)
		totempole_dec("NhËn ®­îc <color=yellow>Vo song s¸t trËn<color>.")
		Msg2Player("NhËn thµnh c«ng 1 <color=yellow>V« song s¸t trËn<color>.");
		Msg2Tong(nTongID, GetName().."NhËn ®­îc kü n¨ng thµnh thÞ - V« song s¸t trËn")
		TONG_ApplyAddEventRecord(nTongID, GetName().."NhËn ®­îc kü n¨ng thµnh thÞ - V« song s¸t trËn")
	end;
	
	SetTaskTemp(193, 0);
end;

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- Í¬²½µ½¿Í»§¶Ë
end

TTK_FACE = {1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033};
MAPFILE = [[\settings\item\004\mask.txt]];
function wsh_typewushuangshazhen()
	local nMaskIdx;
	local szMaskName;
	local szContent = "khu«n mÉu v« song s¸t trËn cña quý bang hiÖn t¹i lµ: <color=yellow>"; 
	local tab_mask = {};
	
	local _, nTongID = GetTongName()
	local nFigure = TONGM_CheckRight(nTongID, GetName(), RIGHTID_STUNT);
	if (nFigure ~= 1) then
		SetTaskTemp(193, 0);
		totempole_dec("<color=yellow>khu«n mÉu<color> v« song s¸t trËn chØ cã cÊp l·nh ®¹o bang héi míi cã thÓ thay ®æi.");
		return
	end
	
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_mask, szMaskName);
		end;
	end;
	
	if (getn(tab_mask) > 0) then
		szContent = szContent..tab_mask[1];
		for i = 2, getn(tab_mask) do
			szContent = szContent..", "..tab_mask[i];
		end;
		szContent = szContent.."<color>.";
	else
		szContent = "V« song s¸t trËn cña quý bang vÉn ch­a cã khu«n mÉu g×, ";
	end;
	
	Say(szContent.."Ng­¬i muèn tiÕn hµnh thao t¸c g×?", 3, 
		"Ta muèn thªm vµo khu«n mÉu/add_face", 
		"Ta muèn bá bít khu«n mÉu/removeface", 
		"Rêi khái/OnCancel");
end;

function add_face()
	local nFaceCount = getfacecount();
	if (nFaceCount >= 10) then
		Say("B¹n ®· lùa chän 10 khu«n mÉu, nÕu muèn thªm khu«n mÉu míi cÇn ph¶i bá bít 1 khu«n mÉu, cã muèn tiÕp tôc kh«ng?", 2, "Ta muèn thªm vµo khu«n mÉu míi./removeface", "§Ó ta suy nghÜ l¹i/no")
		return
	end;
	
	--Ð´Ò»¸ö·ÅÈë½çÃæ
	GiveItemUI("H·y ®­a vµo 1 mÆt n¹", "§· ®­a vµo 1 mÆt n¹, sau khi V« song s¸t trËn ph¸t huy t¸c dông sÏ biÕn thµnh h×nh d¸ng mong muèn?", "add_ui_confirm", "no");
end;

function add_ui_confirm(nCount)
	if (nCount ~= 1) then
		Say("Sè l­îng vËt phÈm bá vµo kh«ng ®óng.", 0);
		return
	end;
	
	local nItemIdx = GetGiveItemUnit(1);
	nItemGenre, nDetailType, nParticualrType = GetItemProp(nItemIdx);
	
	if (nItemGenre ~= 0 or nDetailType ~= 11) then
		Say("VËt phÈm bá vµo kh«ng ph¶i lµ mÆt n¹.", 0);
		return
	end;
	
	if (nParticualrType == 366) then
		Say("<color=yellow>MÆt n¹ ngôy trang<color> kh«ng thÓ lµm khu«n mÉu V« song s¸t trËn.", 0);
		return
	end;
	
	if (itemcheck(nParticualrType) == 0) then
		Say("khu«n mÉu mÆt n¹ nµy ®· cã råi.", 0);
		return
	end;
	
	addoneface(nParticualrType); --Ôö¼ÓÒ»¸öÍâÐÎ
	Msg2Player("B¹n ®· thªm vµo khu«n mÉu V« song s¸t trËn cho bang héi.");
end;

function itemcheck(nParticualrType)
	_, nTaskID = GetTongName();
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) == nParticualrType) then
			return 0;
		end;
	end;
	return 1;
end;

function removeface()
	local tab_sel = {};
	_, nTongID = GetTongName();
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_sel, "Hñy bá"..szMaskName.."T¹o khu«n/#deloneface("..i..")");
		end;
	end;
	tinsert(tab_sel, "§Ó ta suy nghÜ kü l¹i xem/OnCancel");
	if (getn(tab_sel) <= 0) then
		Say("Ch­a chän khu«n mÉu V« song s¸t trËn nµo.", 0);
		return
	end;
	Say("Muèn hñy bá khu«n mÉu nµo?", getn(tab_sel), tab_sel);
end;

function getfacecount()
	_, nTaskID = GetTongName();
	local nCount = 0;
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) ~= 0) then
			nCount = nCount + 1;
		end;
	end;
	return nCount;
end;

function addoneface(nValue)
	_, nTaskID = GetTongName();
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) == 0) then
			TONG_ApplySetTaskValue(nTaskID, TTK_FACE[i], nValue);
			return
		end;
	end;
end;

function deloneface(nIdx)
	_, nTaskID = GetTongName();
	if (nIdx < 1 or nIdx > 10) then
		return
	end;
	TONG_ApplySetTaskValue(nTaskID, TTK_FACE[nIdx], 0);
	Msg2Player("Hñy bá 1 khu«n mÉu V« song s¸t trËn cña bang héi.");
end;
-------------------------------------------------------------
--¶ÍÎä»ê-----
REPAREATT = 40; --Ã¿´ÎÔö¼Ó¶àÉÙÄÍ¾Ã¶È
function stunt_duanwuhun(nTongID, nStuntID)
	TB_STUNT_DWH = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."Kü n¨ng thµnh thÞ: "..
	"<enter><color=yellow>    "..TB_STUNT_DWH.name.."<color>"..
	"<enter>QuyÒn tiÕp nhËn kü n¨ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_DWH.right].."<color>"..
	"<enter>T¸c dông cña kü n¨ng ®Æc biÖt:"..
	"<enter><color=yellow>    "..TB_STUNT_DWH.describe.."<color>"..
	"<enter>Thêi h¹n cña kü n¨ng nµy lµ 7 ngµy, trong thêi h¹n nµy cho phÐp tèi ®a "..TB_STUNT_DWH.maxmem.." ng­êi tiÕp nhËn kü n¨ng, mçi ngµy mét ng­êi chØ nhËn ®­îc 1 lÇn. H«m nay cßn cho phÐp "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng­êi n÷a ®Õn nhËn kü n¨ng nµy.", 
		"§óng vËy, dïng LuyÖn vâ hån ®Ó gia cè vò khÝ./dwh_Enhance", 
		"Sau nµy h·y nãi!/OnCancel");
end

function dwh_Enhance()
	TRepair("EnhanceRepair( %d )");
end;

--½øÐÐÇ¿»¯ÎäÆ÷
function EnhanceRepair(nItemIdx)
	
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "Trang bÞ nµy kh«ng thÓ c­êng hãa.")
	end
	local nDur = GetCurDurability(nItemIdx);
	local nRepairDur = nDur + REPAREATT;
	if (nRepairDur > 255) then
		nRepairDur = 255;
	end;
	
	totempole_dec("<#>Söa gia cè trang bÞ nµy cã thÓ n©ng cao ®é bÒn, mçi lÇn t¨ng thªm <color=yellow>"..REPAREATT.."<color> ®iÓm, ®é bÒn cao nhÊt lµ <color=yellow>"..(255).."<color> ®iÓm, ®é bÒn hiÖn t¹i cña trang bÞ lµ <color=yellow>"..nDur.."<color>, sau khi gia cè ®é bÒn sÏ lµ <color=yellow>"..nRepairDur.."<color>, ng­¬i muèn söa ch÷a kh«ng?",
		"Söa ch÷a/#Enhance_Repair("..nItemIdx..", "..nRepairDur..")", 
		"Kh«ng cÇn ®©u/cancel")
end

function Enhance_Repair(nItemIdx, nRepairDur)
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_DWH.right)) then
		return
	end
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "Trang bÞ nµy kh«ng thÓ c­êng hãa.")
	end

	if (nItemIdx > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		
		EH_SetCurDurability(nItemIdx, nRepairDur);
		Msg2Player("Trang bÞ ®· ®­îc gia cè.");
	end;
end

function stunt_fenghuang(nTongID, nStuntID)
	TB_STUNT_FHY = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."Kü n¨ng thµnh thÞ: "..
	"<enter><color=yellow>    "..TB_STUNT_FHY.name.."<color>"..
	"<enter>QuyÒn tiÕp nhËn kü n¨ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_FHY.right].."<color>"..
	"<enter>T¸c dông cña kü n¨ng ®Æc biÖt:"..
	"<enter><color=yellow>    "..TB_STUNT_FHY.describe.."<color>"..
	"<enter>Thêi h¹n cña kü n¨ng nµy lµ 7 ngµy, trong thêi h¹n nµy cho phÐp tèi ®a "..TB_STUNT_FHY.maxmem.." ng­êi tiÕp nhËn kü n¨ng, mçi ngµy mét ng­êi chØ nhËn ®­îc 1 lÇn. H«m nay cßn cho phÐp "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng­êi n÷a ®Õn nhËn kü n¨ng nµy.", 
		"§óng vËy, ta muèn nhËn Phông Hoµng Ên/fhy_getfenghuangyin", 
		"Sau nµy h·y nãi!/OnCancel");
end

function fhy_getfenghuangyin()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("Hµnh trang cÇn <color=yellow>%d<color> « trèng.",5))
		return
	end
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_FHY.right)) then
		SetTaskTemp(193, 0);
		return
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)

	AddItem(6, 1, 1105, 1, 0, 0, 0);
	totempole_dec("B¹n nhËn ®­îc 1 <color=yellow>Phông Hoµng Ên<color>.")
	Msg2Player("NhËn thµnh c«ng 1<color=yellow>Phông Hoµng Ên<color>.");
	
	SetTaskTemp(193, 0);
end;

function totempole_dec(szMsg, ...)
	if (szMsg == nil) then
		return
	end	
		
	szMsg = LINK_CITY_TOTEMPOLE..szMsg
	if (getn(arg) == 0) then
		Describe(szMsg, 1, "KÕt thóc ®èi tho¹i/OnCancel")
	else
		Describe(szMsg, getn(arg), arg)
	end
end

function stunt_wushenbless(nTongID, nStuntID)
	TB_STUNT_WUSHENBLESS = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."Kü n¨ng thµnh thÞ: "..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.name.."<color>"..
	"<enter>QuyÒn tiÕp nhËn kü n¨ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WUSHENBLESS.right].."<color>"..
	"<enter>T¸c dông cña kü n¨ng ®Æc biÖt:"..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.describe.."<color>"..
	"<enter>Thêi h¹n cña kü n¨ng nµy lµ 7 ngµy, trong thêi h¹n nµy cho phÐp tèi ®a "..TB_STUNT_WUSHENBLESS.maxmem.." ng­êi tiÕp nhËn kü n¨ng, mçi ngµy mét ng­êi chØ nhËn ®­îc 1 lÇn. H«m nay cßn cho phÐp "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng­êi n÷a ®Õn nhËn kü n¨ng nµy.", 
	"TiÕp nhËn kü n¨ng/stunt_wushenbless1",
	"Rêi khái/OnCancel")
end;

function stunt_wushenbless1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("Hµnh trang cÇn <color=yellow>%d<color> « trèng.",5))
		return
	end
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_WUSHENBLESS.right)) then
		return
	end
	local nItemIdx = AddItem(6, 1, 1264, 1, 1, 1);
	if (nItemIdx > 0) then
		local nlasttime = getExpiredTime2DayEnd() * 60;
		local nlastday = 7 - tonumber(GetLocalDate("%w"));
		if (nlastday == 7) then
			nlastday = 0;
		end;
		local ntime = GetCurServerTime() + nlasttime + nlastday * 24 * 60 * 60;
		
		SetSpecItemParam(nItemIdx, 1, ntime);
		SetSpecItemParam(nItemIdx, 2, tonumber(FormatTime2String("%y",ntime)));
		SetSpecItemParam(nItemIdx, 3, tonumber(FormatTime2String("%m",ntime)));
		SetSpecItemParam(nItemIdx, 4, tonumber(FormatTime2String("%d",ntime)));
		SyncItem(nItemIdx);
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("NhËn ®­îc <color=yellow>Vâ ThÇn Tø Phóc<color>, sau khi sö dông sÏ nhËn ®­îc 2 giê nh©n ®«i ®iÓm cèng hiÕn (chØ víi ho¹t ®éng Tèng Kim, nhiÖm vô tÝn sø, thö th¸ch thêi gian, vâ l©m liªn ®Êu, D· TÈu, ®ªm Huy Hoµng).")
	else
		Msg2Player("NhËn Vâ thÇn tø phóc thÊt b¹i!")
	end
end;

-------»ñµÃµ½±¾ÈÕ24Ê±µÄÊ±¼ä²î£¬µ¥Î»£º·Ö
function getExpiredTime2DayEnd()
	local nNowHour = tonumber(GetLocalDate("%H"));
	local nNowMin = tonumber(GetLocalDate("%M"));
	
	return (24 - nNowHour - 1) * 60 + (60 - nNowMin);
end;