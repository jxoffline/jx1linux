IL("FILESYS");
IL("ITEM");
IL("LEAGUE");
IL("SETTING");
IL("TITLE");
IL("RELAYLADDER");
IL("BATTLE")


TONGWAR_LGTYPE = 10

--Õ½¶Ó³ÉÔ±Task
TONGWAR_LGMTASK_JOB = 1		--¶Ó³¤Îª1£»¶ÓÔ±Îª0

--Õ½¶Ó¹«ÓÃTask
TONGWAR_LGTASK_TONGCNT = 1	--¹²ÁªÃËÊý
TONGWAR_LGTASK_WIN = 2			--Ê¤Àû´ÎÊý
TONGWAR_LGTASK_LOSE = 3			--Ê§°Ü´ÎÊý
TONGWAR_LGTASK_TIE = 4			--Æ½¾Ö´ÎÊý
TONGWAR_LGTASK_RESULT = 5		--±ÈÈü×Ü»ý·Ö
TONGWAR_LGTASK_POINT = 6		--Ã¿³¡¾»»ý·ÖÀÛ¼Ó
TONGWAR_LGTASK_CITYID = 7		--¸Ã³ÇÊÐid
TONGWAR_LGTASK_CAMP = 8			--¸Ã³¡±ÈÈüÕóÓª
TONGWAR_LGTASK_MAP = 9			--¸Ã³Ç±ÈÈü±ÈÈüµØÍ¼
TONGWAR_LGTASK_RANK = 10		--±ÈÈü×îÖÕÅÅÃû
--11	»Æ½ðÖ®¹û
--12	»Ô»ÍÖ®¹ûÀñ°ü
--13	ÉñÃØºì°üÀñ°ü
--14	ÎäÁÖÃØ¼®
TONGWAR_LGTASK_TITLE = 15		--°ï»áÁªÃËÊÇ·ñÁìÈ¡ÁË¹â»·
TONGWAR_LGTASK_TONGID = 16		--³ÇÖ÷°ï»áID
TONGWAR_LGTASK_SEASON = 17		--Èü¼¾
TONGWAR_LGTASK_ELDER = 18		--³¤ÀÏ½±Àø£¬¹²7¸ö
TONGWAR_LGTASK_MASTER = 19		--°ïÖ÷½±Àø£¬¹²1¸ö
TONGWAR_LGTASK_MSTITLE = 20		--°ïÖ÷³ÆºÅ
--21	Ï´Ëè¾­

--½ÇÉ«Task
TONGWAR_RLTASK_POINT = 2369
TONGWAR_RLTASK_NDEATH = 2370
TONGWAR_RLTASK_KILLPLAYER = 2371
TONGWAR_RLTASK_LASTDTIME = 2372
TONGWAR_RLTASK_CURRANK = 2373
TONGWAR_RLTASK_SERIESKILL = 2374
TONGWAR_RLTASK_MAXSERIESKILL = 2375
TONGWAR_RLTASK_MAXDEATH = 2376
TONGWAR_RLTASK_KEYNUMBER = 2377
TONGWAR_RLTASK_TOTALPOINT = 2378
TONGWAR_RLTASK_AWARD = 1737;	--BYTE1=season ÁìÈ¡¹ýÆÕÍ¨½±Àø
								--BYTE2=³õÊ¼»¯Îª¸öÈËÅÅÃû½±Àø
								--BYTE3=°ïÖ÷ºÍ³¤ÀÏ½±Àø
								--BYTE4=³õÊ¼»¯Îªseason

--Õ½¶Ó±äÁ¿¡ª¡ª½±Àø »Æ½ðÖ®¹û	»Ô»ÍÖ®¹û	ÉñÃØ´óºì°ü	ÎäÁÖÃØ¼®	Ï´Ëè¾­
LG_TASK_AWORD = {11, 12, 13, 14, 21};
PL_TEMPTASK_SECURITY = 193;

TV_LASTDEATHTIME = 2306	
TV_LASTDEATHMAPX = 2307
TV_LASTDEATHMAPY = 2308
TV_SERIESKILL_REALY = 2305  --Íæ¼Òµ±Ç°µÄÊµ¼ÊÁ¬Õ¶Öµ£¨¸ß¼¶É±±È½ÏµÍ¼¶µÄÍæ¼Ò£¬¼ÆÁ¬Õ¶£¬µ«²»¼ÆÕæÊµÁ¬Õ¶£©
--
-- TONG_MASTER = 3;

	
--BATTLE TASK---------------------
		PL_TOTALPOINT = 1
		PL_KILLPLAYER = 2
		PL_KILLNPC = 3
		PL_BEKILLED = 4
		PL_SNAPFLAG = 5
		PL_KILLRANK1 = 6
		PL_KILLRANK2 = 7
		PL_KILLRANK3 = 8
		PL_KILLRANK4 = 9
		PL_KILLRANK5 = 10
		PL_KILLRANK6 = 11
		PL_KILLRANK7 = 12
		PL_MAXSERIESKILL = 13		--Íæ¼ÒÕû¸öÕ½¾ÖµÄ×î´óÁ¬Õ¶Êý
		PL_SERIESKILL = 14			--Íæ¼Òµ±Ç°µÄÁ¬Õ¶Êý
		PL_FINISHGOAL = 15
		PL_1VS1 = 16
		PL_GETITEM = 17
		PL_WINSIDE = 18
		PL_PRISEGRADE = 19	
		PL_AVERAGEGRADE = 20
		PL_WINGRADE = 21	
		PL_PARAM1 = 22
		PL_PARAM2 = 23
		PL_PARAM3 = 24
		PL_PARAM4 = 25
		PL_PARAM5 = 26
		PL_CURRANK = 27	-- =PL_PARAM6 = 27 ±íÊ¾Íæ¼Òµ±Ç°µÄ¹ÙÖ°£¬Ä¿Ç°Ê¹ÓÃµÚ6ºÅ²ÎÊý
		
		PL_BATTLEID=41
		PL_RULEID=42
		PL_BATTLECAMP = 43
		PL_BATTLESERIES = 44 --¼ÇÂ¼Íæ¼ÒÉÏÒ»´Î²Î¼ÓÕ½ÒÛµÄÕ½ÒÛÁ÷Ë®ºÅ
		PL_KEYNUMBER = 45
		PL_LASTDEATHTIME = 46
		PL_BATTLEPOINT = 47	--¼ÇÂ¼Íæ¼Ò±¾Õ½ÒÛµÄ×Ü»ý·Ö£¬×Ü»ý·ÖÊÇÍæ¼ÒËù²Î¼ÓµÄ¸÷³¡Õ½¾ÖµÄ»ý·Ö×ÜºÍ, E(PL_TOTALPOINT1 + PL_TOTALPOINT2+ ...)
		PL_ROUND = 48

		GAME_KEY = 1
		GAME_BATTLEID = 2
		GAME_RULEID = 3
		GAME_MAPID = 4	
		GAME_CAMP1 = 5
		GAME_CAMP2 = 6
		GAME_MAPICONID = 7
		GAME_RESTTIME = 8
		GAME_LEVEL = 9 
		GAME_MODE = 10
		GAME_CAMP1AREA= 11
		GAME_CAMP2AREA= 12
		GAME_BATTLESERIES = 13
		GAME_ROUND = 14

--ÎäÁÖÃË´«ÈË	
WULINMENG_NPC = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>Vâ L©m TruyÒn Nh©n\n   <link>"
--³ÇÊÐ
TONGWAR_CITY = {"Ph­îng T­êng","Thµnh §«","§¹i Lý","BiÖn Kinh","T­¬ng D­¬ng","D­¬ng Ch©u","L©m An",}
TONGWAR_CITYID = {['Ph­îng T­êng']=1,['Thµnh §«']=2,['§¹i Lý']=3,['BiÖn Kinh']=4,['T­¬ng D­¬ng']=5,['D­¬ng Ch©u']=6,['L©m An']=7}
--Change schedule VLDNB 11 - Modified by DinhHQ - 20120507
TONGWAR_CALENDAR = {
			format("<color=red>%s<color><color=yellow>|<color>L©m An vs T­¬ng D­¬ng<color=yellow>|<color>BiÖn Kinh vs D­¬ng Ch©u<color=yellow>|<color>\nThµnh §« vs §¹i Lý<color=yellow>|<color>Ph­îng T­êng kh«ng thi ®Êu.", "06/04"),
			format("<color=red>%s<color><color=yellow>|<color>Ph­îng T­êng vs BiÖn Kinh<color=yellow>|<color>T­¬ng D­¬ng vs D­¬ng \nCh©u<color=yellow>|<color>L©m An vs §¹i Lý<color=yellow>|<color>Thµnh §« kh«ng thi ®Êu.", "07/04"),
			format("<color=red>%s<color><color=yellow>|<color>Thµnh §« vs L©m An<color=yellow>|<color>Ph­îng T­êng vs T­¬ng D­¬ng<color=yellow>|<color>\nD­¬ng Ch©u vs §¹i Lý<color=yellow>|<color>BiÖn Kinh kh«ng thi ®Êu.", "08/04"),
			format("<color=red>%s<color><color=yellow>|<color>BiÖn Kinh vs T­¬ng D­¬ng<color=yellow>|<color>Thµnh §« vs D­¬ng Ch©u<color=yellow>|<color>Ph­îng T­êng vs §¹i Lý<color=yellow>|<color>L©m An kh«ng thi ®Êu.", "09/04"),
			format("<color=red>%s<color><color=yellow>|<color>Ph­îng T­êng vs Thµnh §«<color=yellow>|<color>L©m An vs D­¬ng Ch©u<color=yellow>|<color>\nBiÖn Kinh vs §¹i Lý<color=yellow>|<color>T­¬ng D­¬ng kh«ng thi ®Êu.", "10/04"),
			format("<color=red>%s<color><color=yellow>|<color>Thµnh §« vs BiÖn Kinh<color=yellow>|<color>Ph­îng T­êng vs L©m An <color=yellow>|<color>\nT­¬ng D­¬ng vs §¹i Lý<color=yellow>|<color>D­¬ng Ch©u kh«ng thi ®Êu.", "11/04"),
			format("<color=red>%s<color><color=yellow>|<color>BiÖn Kinh vs L©m An<color=yellow>|<color>Thµnh §« vs T­¬ng D­¬ng<color=yellow>|<color>\nPh­îng T­êng vs D­¬ng Ch©u<color=yellow>|<color>§¹i Lý kh«ng thi ®Êu.", "13/04"),
			}
			
PHB_WULIN = 10227 --ÎäÁÖÊ®´óÅÅÃû
PHB_CHENGSHI = {['Thµnh §«'] = 10228 ,--³É¶¼Ê®´óÅÅÃû
				['Ph­îng T­êng'] = 10229 ,--·ïÏèÊ®´óÅÅÃû
				['BiÖn Kinh'] = 10230 ,--ãê¾©Ê®´óÅÅÃû
				['L©m An'] = 10231 ,--ÁÙ°²Ê®´óÅÅÃû
				['§¹i Lý'] = 10232 ,--´óÀíÊ®´óÅÅÃû
				['T­¬ng D­¬ng'] = 10233 ,--ÏåÑôÊ®´óÅÅÃû
				['D­¬ng Ch©u'] = 10234 --ÑïÖÝÊ®´óÅÅÃû
			}

TAB_AWORD_GOOD = 
		{
			{{tbProp={6,1,907 ,1},szName="Qu¶ Hoµng Kim",nExpiredTime=10080}, {30, 15, 10, 10, 5, 5, 5}},	--»Æ½ðÖ®ÖÖµÄ½±ÀøÁÐ±í
			--{{tbProp={6,1,1075,1},szName="LÔ hép qu¶ huy hoµng"}, {150, 100, 80, 60, 50, 30, 10}},	--»Ô»ÍÖ®ÖÖµÄ½±ÀøÁÐ±í
			{{tbProp={6,1,2263,1},szName="Tö Kim Ch©n §¬n",tbParam={0,20}}, {8, 4, 2, 1, 0, 0, 0}},	--×Ï½ðÕæµ¤£¨20ÒÚ£©µÄ½±ÀøÁÐ±í
			{{tbProp={6,1,2271,1},szName="V¹n Niªn Huy Hoµng qu¶"}, {80, 60, 50, 40, 30, 20, 10}},	--Ç§Äê»Ô»ÍÖ®¹ûµÄ½±ÀøÁÐ±í
			--VLDNB 11 - Modified By DinhHQ - 20120507
			{{tbProp={6,1,30301,1},szName="Hçn nguyªn ch©n ®¬n"}, {30, 20, 10, 5, 0, 0, 0}},			
			{{szName="Phi Phong CÊp PhÖ Quang (hãa gi¶i s¸t th­¬ng)",tbProp={0,3477},nQuality = 1,nExpiredTime=86400,}, {1, 0, 0, 0, 0, 0, 0}},	--ÐþÔ³ÁîµÄ½±ÀøÁÐ±í
			
			
--		{{6, 1, 1074, TONGTASK_AWORD_SMDHB, "ÉñÃØ´óºì°üÀñºÐ"}, {80, 50, 30, 20, 15, 10, 5}},	--ÉñÃØ´óºì°üµÄ½±ÀøÁÐ±í
--		{{6, 1, 26, TONGTASK_AWORD_CBT, "ÎäÁÖÃØ¼®"}, {15, 10, 8, 6, 5, 3, 1}},	--ÎäÁÖÃØ¼®µÄ½±ÀøÁÐ±í
--		{{6, 1, 22, TONGTASK_AWORD_CBT, "Ï´Ëè¾­"}, {15, 10, 8, 6, 5, 3, 1}},	--Ï´Ëè¾­µÄ½±ÀøÁÐ±í
		}

function tongwar_contribute(szPlayerName, szCityName, nRecord)--¸üÐÂÅÅÐÐ°ñ
	--addrecord totalrecord
	--ladder_(ncity, record)   taskvalue
	--ladder_(record)
	--1.½«¸öÈË»ý·Ö¼Óµ½ÎäÁÖÅÅÐÐ°ñ¸ú³ÇÊÐÅÅÐÐ°ñÖÐÈ¥£»
	if (not szCityName or not szPlayerName) then
		return
	end;
	local taskid_record;
	local nPlayerRecord = GetTask(TONGWAR_RLTASK_TOTALPOINT);
--	nPlayerRecord = nPlayerRecord + nRecord;
--	SetTask(TONGWAR_RLTASK_TOTALPOINT, nPlayerRecord);
	if (tongwar_citynamecheck(szCityName)) then
		Ladder_NewLadder(PHB_CHENGSHI[szCityName], szPlayerName, nPlayerRecord, 0);
		Ladder_NewLadder(PHB_WULIN, szPlayerName, nPlayerRecord, 0);
	end;
	
end;

function tongwar_citynamecheck(szCityName)
	local bIsCity = 0;
	local i;
	for i = 1, getn(TONGWAR_CITY) do
		if (szCityName == TONGWAR_CITY[i]) then
			bIsCity = 1;
			break;
		end;
	end;
	return bIsCity;
end;

