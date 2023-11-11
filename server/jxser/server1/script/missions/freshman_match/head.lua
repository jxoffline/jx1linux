Include("\\script\\lib\\file.lua")
IncludeLib("RELAYLADDER")
IncludeLib("TITLE")
IncludeLib("ITEM")
Include( "\\script\\missions\\freshman_match\\freshman_data.lua" )
Include( "\\script\\missions\\freshman_match\\freshman_info.lua" )

function transtoplace()

	if (GetLastFactionNumber() == -1) then
		Say("Vâ L©m Minh Chñ cã lÖnh: ChØ cã ng­êi cña ThËp ®¹i ph¸i ®­îc tham gia §¹i héi vâ l©m, ng­¬i kh«ng m«n kh«ng ph¸i kh«ng thÓ tham gia. Sau khi gia nhËp ThËp ®¹i ph¸i míi ®­îc tham gia thi ®Êu!", 0)
		return
	else
		if(GetLastFactionNumber() == 0) then
			NewWorld(CP_MAPTAB[1][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ÉÙÁÖ
		elseif (GetLastFactionNumber() == 1) then
			NewWorld(CP_MAPTAB[2][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ÌìÍõ
		elseif (GetLastFactionNumber() == 2) then
			NewWorld(CP_MAPTAB[3][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ÌÆÃÅ
		elseif (GetLastFactionNumber() == 3) then
			NewWorld(CP_MAPTAB[4][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--Îå¶¾
		elseif (GetLastFactionNumber() == 4) then
			NewWorld(CP_MAPTAB[5][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--¶ëáÒ
		elseif (GetLastFactionNumber() == 5) then
			NewWorld(CP_MAPTAB[6][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--´äÑÌ
		elseif (GetLastFactionNumber() == 6) then
			NewWorld(CP_MAPTAB[7][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--Ø¤°ï
		elseif (GetLastFactionNumber() == 7) then
			NewWorld(CP_MAPTAB[8][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ÌìÈÌ
		elseif (GetLastFactionNumber() == 8) then
			NewWorld(CP_MAPTAB[9][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--Îäµ±
		elseif (GetLastFactionNumber() == 9) then
			NewWorld(CP_MAPTAB[10][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--À¥ÂØ
		end
		Msg2Player( "B¹n ®· vµo ®Êu tr­êng Vâ l©m kiÖt xuÊt" )
	end
end

--ÅÅĞĞ°ñIDÒª¸Ä----------------------------------------------------------
function checkmap(flag)
	local mapid = SubWorldIdx2ID(SubWorld)
	local ladder = 0
	if (mapid == 397 or mapid == 396) then
		mapname = "ThiÕu L©m"
		ladder = 10131
	elseif (mapid == 399 or mapid == 398) then
		mapname = "Thiªn V­¬ng"
		ladder = 10132
	elseif (mapid == 401 or mapid == 400) then
		mapname = "§­êng M«n"
		ladder = 10133
	elseif (mapid == 403 or mapid == 402) then
		mapname = "Ngò §éc"
		ladder = 10134
	elseif (mapid == 405 or mapid == 404) then
		mapname = "Nga Mi"
		ladder = 10135
	elseif (mapid == 407 or mapid == 406) then
		mapname = "Thóy Yªn"
		ladder = 10136
	elseif (mapid == 409 or mapid == 408) then
		mapname = "C¸i Bang"
		ladder = 10137
	elseif (mapid == 411 or mapid == 410) then
		mapname = "Thiªn NhÉn"
		ladder = 10138
	elseif (mapid == 413 or mapid == 412) then
		mapname = "Vâ §ang"
		ladder = 10139
	elseif (mapid == 415 or mapid == 414) then
		mapname = "C«n L«n"
		ladder = 10140
	end
	if (flag == 1) then
		return mapname
	elseif(flag == 2) then
		return ladder
	end
end
---------ÅÅĞĞ°ñIDÒª¸Ä----------------------------------------------------

function validateDate(startt,endt)
	local now = tonumber(date("%y%m%d%H"))
	if(now >= startt and now < endt) then
		return 1
	end
	return nil
end

function AddAword(level, result)
	local awardpro = {}
	local fac = 1

	if ( level >= 50 and level <=59 ) then
		fac = 1
	elseif ( level >= 60 and level <= 69 ) then
		fac = 1.3
	elseif ( level >= 70 and level <= 79 ) then
		fac = 1.8
	elseif ( level >= 80 ) then
		fac = 3.8
	end
	aword = (700 + ( level * 4 - 150 ) / 5 * 100 ) * result * fac
	AddOwnExp(aword)
	
	if( result ~= 60 )then
		return
	end
	for i = 1, getn(CP_AWARD_ITEM) do
		awardpro[i] = CP_AWARD_ITEM[i][3]
	end
	numth = randByProbability(awardpro)
	if (getn(CP_AWARD_ITEM[numth][2]) == 6 ) then
		AddItem(CP_AWARD_ITEM[numth][2][1], CP_AWARD_ITEM[numth][2][2], CP_AWARD_ITEM[numth][2][3], CP_AWARD_ITEM[numth][2][4], CP_AWARD_ITEM[numth][2][5], CP_AWARD_ITEM[numth][2][6])
	else
		AddEventItem(CP_AWARD_ITEM[numth][2][2])
	end
	Msg2Player("B¹n nhËn ®­îc mét"..CP_AWARD_ITEM[numth][1])
end

function randByProbability(aryProbability)
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = mod( random( nSum ) + random( 1009 ), nSum ) + 1;
	for i = nArgCount, 1, -1 do
		nSum = nSum - aryProbability[i];
		if( nRandNum > nSum ) then
			return i;
		end
	end
end


------------------TaskValue µÄ²Ù×÷	BEGIN-----------------------------------------------
-- ÉèÖÃÈÎÎñ×´Ì¬
function nt_settask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- Í¬²½µ½¿Í»§¶Ë
end

-- »ñÈ¡ÈÎÎñ×´Ì¬
function nt_gettask(nTaskID)
	return GetTask(nTaskID)
end
------------------TaskValue µÄ²Ù×÷	END-----------------------------------------------

------------------IniÎÄ¼şµÄ²Ù×÷	BEGIN---------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end
--------------------IniÎÄ¼şµÄ²Ù×÷	END--------------------------------------------

------------ÎÄ¼şµÄ²Ù×÷	BEGIN--------------------------------------------------
-- ´ò¿ªÒ»¸öÎÄ¼ş
function biwu_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
	end
end

--»ñµÃÎÄ¼şÖĞµÄszSectionµÄkeyµÄÖµ
function biwu_getdata(filename, szsect, szkey)
	return IniFile_GetData(filename, szsect, szkey)
end

--ÉèÖÃÎÄ¼şÖĞµÄszSectionµÄkeyÖµÎªszValue
function biwu_setdata(filename, szsect, szkey, szvalue)
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function biwu_save(filename)
	IniFile_Save(filename, filename)
end
----------------ÎÄ¼şµÄ²Ù×÷	END--------------------------------------------------------------------


function Sort_Point(array)
	local orgindex = PlayerIndex
	local point_1 = 0
	local point_2 = 0
	local wincount_1 = 0
	local wincount_2 = 0
	local winrate_1 = 0
	local winrate_2 = 0
	for i = 1, getn(array) do
		for j = getn(array), 2, -1 do
			PlayerIndex = array[j]
			point_1 = nt_gettask(CP_TASKID_ROUND)
			wincount_1 = nt_gettask(CP_TASKID_WIN)
			if (point_1 == 0 or wincount_1 == 0) then
				winrate_1 = 0
			else
				winrate_1 = wincount_1/point_1
			end
			
			PlayerIndex = array[j - 1]
			point_2 = nt_gettask(CP_TASKID_ROUND)
			wincount_2 = nt_gettask(CP_TASKID_WIN)
			if (point_2 == 0 or wincount_2 == 0) then
				winrate_2 = 0
			else
				winrate_2 = wincount_2/point_2
			end
			
			if (winrate_1 > winrate_2) then
				a = array[j]
				array[j] = array[j - 1]
				array[j - 1] = a
			end
		end
	end
	PlayerIndex = orgindex
	return array
end


function WL_set_pl_state()
	LeaveTeam()		--Àë¿ª¶ÓÎé
	SetCreateTeam(0);	--½ûÖ¹×é¶Ó
	SetTaskTemp(200, 1)		--½ûÖ¹¸ü»»ÕóÓª
	SetLogoutRV(1);		--¶ÏÏßÓëËÀÍöÎªÒ»¸öÖØÉúµã
	SetFightState(0)	--·ÇÕ½¶·×´Ì¬
	SetPKFlag(2)	--ÍÀÉ±Ä£Ê½
	ForbidChangePK(1);	--½ûÖ¹¸ü»»PKÄ£Ê½
	SetPunish(0);	--ÎŞËÀÍö³Í·£
	DisabledStall(1)	--½ûÖ¹°ÚÌ¯
	ForbitTrade(1);		--½ûÖ¹½»Ò×
	DisabledUseTownP(1)	--ÏŞÖÆÆäÔÚ×¼±¸Ï¯ºÍ±ÈÈüÓÃµØÄÚÊ¹ÓÃ»Ø³Ç·û
end

function WL_clear_pl_state()

	camp = GetCamp();
	SetCurCamp(camp);	--ÁÙÊ±ÕóÓªÓëÕæÊµÕóÓªÒ»ÖÂ
	SetCreateTeam(1);	--ÔÊĞí×é¶Ó
	DisabledStall(0);	--ÔÊĞí°ÚÌ¯
	SetTaskTemp(200, 0);	--ÔÊĞí¸ü»»°ïÅÉÕóÓª
	SetFightState(0);	--ÖÃÎª·ÇÕ½¶·×´Ì¬
	SetPunish(1);	--ÓĞËÀÍö³Í·£
	ForbidChangePK(0);	--ÔÊĞí¸Ä±äÕ½¶·Ä£Ê½
	SetPKFlag(0);	--Õ½¶·Ä£Ê½ÖÃÎªÁ·¹¦
	ForbitTrade(0);		--ÔÊĞí½»Ò×
	SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	RestoreOwnFeature();
end


function OnCancel()
end