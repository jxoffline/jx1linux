if (not __FESTIVAL07_HEAD__) then
	__FESTIVAL07_HEAD__ = 1;
	
IncludeLib("BATTLE");
Include([[\script\lib\coordinate.lua]]);
Include("\\script\\lib\\gb_taskfuncs.lua") --
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\pay.lua")


--³£Öµ²¿·Ö
--DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\enemy\\enemy195\\enemy195_st.spr>Ê¥µ®ÀÏÈË£º<link>"	

CO_DATE_BEGIN = 20070209;
CO_DATE_END = 20070223;

CO_PREPAREMISSIONID = 30;
CO_MISSIONID = 31;
CO_MINIMUM = 5;

CO_FRAME = 18;	--Ã¿Ãë18Ö¡
CO_REFRASHTIME = 15 * CO_FRAME; -- Ã¿15ÃëÖÓË¢Ò»´Î¹Ö
CO_VANISHTIME = 10 * CO_FRAME;	--Ê¥µ®¾«ÁéÍ£Áô3ÃëÖÓ
CO_RUNINTERVER = 30 * CO_FRAME; --30ÃëÒ»´Î£¬¿ÉÒÔ¹«¸æÓÎÏ·
CO_MAXPLAYTIMES = 5; --Ã¿ÈË×î¶àÒ»ÌìÍæ5´Î
CO_LEVELLIMIT = 50; --Íæ¼Ò²Î¼ÓÐèÒªµÄ×îÐ¡¼¶±ð

CO_PREPARETIME = 57; --×¼±¸³¡¼ÆÊ±Æ÷
CO_FAIRY_SMALLTIMERID = 58;	--Ë¢¹Ö¼ÆÊ±Æ÷
CO_REPORT_SMALLTIMERID = 59;	--RunMissionÓÃµÄ¼ÆÊ±Æ÷£»
CO_INTERVER = 5 * CO_FRAME;	--3ÃëÖÓ´¥·¢Ë¢¹ÖºÍÇå³þ¹Ö´¥·¢Æ÷

--GLBÖµ
GLB_CO_PHASE = 849; --´º½Ú»î¶¯µÄÊ±¼ä
--===============ºÍ¹ÖÏà¹Ø==================
CO_NPCID = 1256;	--Ë¢³ö¹ÖµÄNCP index
CO_MAPID = {584, 585};	--Ê¥µ®»î¶¯µØÍ¼Id

CO_SMALLMAPCOUNT = 19;	--Ò»¹²ÓÐ12ÕÅÐ¡µØÍ¼
CO_MOUSECOUNT_MIN = 10;	--Ò»¸öÐ¡µØÍ¼Ò»´Î×îÉÙË¢µØÊóÊýÄ¿
CO_MOUSECOUNT_MAX = 10;	--Ò»¸öÐ¡µØÍ¼Ò»´Î×î¶àË¢µØÊóÊýÄ¿
CO_MAXPLAYERCOUNT = 10;	--Ã¿¸öÓÎÏ·×î¶à10¸öÈË£»
CO_NIANSHOU_XUANYUN = 10;   --ÄêÊÞÃ¿±»¹¥»÷10´Î¾Í±»Ñ£ÔÎ
CO_ALL_MAXPLAYERCOUNT = 100; --Ò»¹²×î¶à120ÈË£»
--=========================================

--=========ÈÎÎñ±äÁ¿===============
TK_CO_LEAVERMAPID = 1123;	--´æ´¢Ã÷ÔÂÕòµÄmapid
TK_CO_LEAVERPOSX = 1124;	--´æ´¢Àë¿ªÓÎÏ·µÄx×ø±êµã
TK_CO_LEAVERPOSY = 1125;	--´æ´¢Àë¿ªÓÎÏ·µÄy×ø±êµã

TK_CO_DAYKEY = 1126;	--¼ÇÂ¼ÊÇÄÄÒ»Ìì
TK_CO_PLAYTIMES = 1127; --¼ÇÂ¼Ò»ÌìÄÚÍæµÄ´ÎÊý
TK_CO_TOTAL = 1794;		--¼ÇÂ¼Ò»¹²ÍæÁË¶àÉÙ´Î£»

TK_CO_COUNT_ONETIME = 1128;	--¼ÇÂ¼Ò»³¡µãÁË¶àÉÙ¸ö

TK_CO_RANK = 1129;		--¼ÇÂ¼Ò»³¡µÄÅÅÃû£»

TK_CO_GROUPID = 1130;	--¼ÇÂ¼Íæ¼ÒµÄGroupºÅ
TK_CO_EXP_BEISHU = 1131; -- »ñµÃ¾­ÑéµÄ±¶Êý
TK_CO_EXP_TIME = 1132;  -- »ñµÃË«±¶µÄÊ±¼ä
	
TK_CO_ATTACKED_TIMES = 1133;    --¼ÇÂ¼ÄêÊÞ±»¹¥»÷µÄ´ÎÊý
TK_CO_ATTACKED_INTERVER = 1134;     --ÆÕÍ¨Íæ¼ÒÊ¹ÓÃµÀ¾ß¼ä¸ô
--================================

--MS²¿·Ö£»
MS_CO_STATE = 1;
MS_CO_TIMERSTATE = 2; --ÓÃÀ´¼ÇÂ¼ÓÃÓÚ½»ÌæµÄ½øÐÐË¢¹ÖºÍÇå³ý¹Ö£º0£­Çå³ý¹Ö£»1£­Ë¢³ö¹Ö
MS_CO_NEWSVALUE = 3; --
MS_CO_BEGINGMAPID = 10; --¼ÇÂ¼¿ªÊ¼µÄµØÍ¼µÄID
MS_CO_PREPARENEWSVALUE = 5; --×¼±¸³¡¼ÆÊ±±äÁ¿
MS_CO_GAMECOUNT = 6;    --  ¼ÇÂ¼Ò»³¡¿ªÊ¼µÄÓÎÏ·µÄ¸öÊý
--³£Á¿²¿·Ö£»
FESTIVAL_SHREWMOUSE = "springfestival07";
CO_ANIMALNAME = "¤ng ba m­¬i";
CO_MOUSENAME = "Heo tr¾ng"; --Ê¥µ®¾«ÁéµÄÃû×Ö
CO_GIFTNAME = "LÔ vËt ®Ó l¹i";       --ÀñÎïNPCµÄÃû×Ö
CO_SIGNNPCNAME = "<color=yellow>Nha m«n sai dÞch<color>:";    --±¨ÃûÊ¥µ®ÀÏÈËµÄÃû×Ö
CO_MAPPOINTFLORDER = "springfestival2006";
FESTIVAL_OK = 1;    --ÉèÖÃ×´Ì¬¿Ï¶¨±íÊ¾
FESTIVAL_NO = 0;    --ÉèÖÃ×´Ì¬·ñ¶¨±íÊ¾
FESTIVAL_ENTERSPEED = 16; --½øÐÐÓÎÏ·µÄÍæ¼ÒµÄËÙ¶È
FESTIVAL_LEAVERSPEED = -1; --Àë¿ªÓÎÏ·µÄÍæ¼ÒµÄËÙ¶È

Include([[\script\missions\libfestival\head.lua]]);

--	ÊÇ·ñÔÚ»î¶¯Ê±¼ä
function sf06_isactive()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < CO_DATE_BEGIN or nDate > CO_DATE_END or gb_GetTask("shut_springfestival07", 1) == 1) then
		return 0
	end;
	return 1;
end;

--Éú³ÉÒ»¸öÏà¶ÔÓÚµ±Ç°Íæ¼ÒµÄÑ¡Ïî
function festival_make_option(szFunName)
	local szName = GetName()
	return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
end

--¼ì²é¸ÃÍæ¼ÒÊÇ·ñÈÔÔÚÓÎÏ·ÖÐ£¬³É¹¦·µ»ØPlayerIndex·ñÔò·µ»Ønil
function festival_check_pl(szPlayName)
	local nPlIdx = SearchPlayer(szPlayName)	--Íæ¼ÒÊÇ·ñÔÚµ±Ç°·þÎñÆ÷
	if (nPlIdx > 0) then
		local nPlMsIdx = PIdx2MSDIdx(CO_MISSIONID, nPlIdx)	--Íæ¼ÒÊÇ·ñÔÚÖ¸¶¨MissionÖÐ
		if (nPlMsIdx > 0) then
			return nPlIdx
		end
	end
end
--¼ì²éµÀ¾ßÊÇ·ñ¿ÉÒÔ±»Ê¹ÓÃ
function itemuseplacecheck(nType)   --nType :1¡ª¡ª¹«¹²µÀ¾ß£»2¡ª¡ªÄêÊÞ×¨ÓÃµÀ¾ß£»3¡ª¡ªÆÕÍ¨Íæ¼Ò×¨ÒµµÀ¾ß
    local ww, xx, yy = GetWorldPos();
    if (CO_MAPID[2] ~= ww) then
	    Talk(1, "", "VËt phÈm nµy chØ dïng trong ho¹t ®éng ngµy Xu©n.");
        return 0;
    end;
    
    if (GetTask(TK_CO_GROUPID) <= CO_SMALLMAPCOUNT and 2 == nType) then
	    Talk(1, "", "ChØ cã ng­êi ch¬i '¤ng ba m­¬i' míi cã thÓ sö dông ®¹o cô nµy.");
        return 0;
    end;
    
    if (GetTask(TK_CO_GROUPID) > CO_SMALLMAPCOUNT and 3 == nType) then
	    Talk(1, "", "ChØ cã ng­êi ch¬i b×nh th­êng míi sö dông ®­îc vËt phÈm nµy.");
        return 0;
    end;
    
    return 1
end;
--ÕÒµ½¶ÔÁ¢ÕóÓª£¬ÄêÊÞ¡ª¡ª>Íæ¼Ò£¬Íæ¼Ò¡ª¡ª>ÄêÊÞ
function festival_getgroupid(nGroupId)
    if (nGroupId < 1) then
        return nil
    end;
    
    if (nGroupId > CO_SMALLMAPCOUNT) then
        return nGroupId - CO_SMALLMAPCOUNT;
    else
        return nGroupId + CO_SMALLMAPCOUNT;
    end;
end;

function festival_go_other_place()  --Ëæ»ú´«µ½ÆðÊ¼µã
    local nBeginMapID = GetMissionV(MS_CO_BEGINGMAPID);
	local nGroupId = GetTask(TK_CO_GROUPID);
	
	local nMapId = nBeginMapID + nGroupId - 1;
	nMapId = mod(nMapId, CO_SMALLMAPCOUNT) + 1;
	local szFile = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\elf_]]..nMapId..[[.txt]];
	local PosX, PosY = getadata(szFile);
	SetPos(floor(PosX / 32), floor(PosY / 32));
	SubWorld = OldSubWorld;
end;

function festival_go_back(nBeginMapID)  --Ëæ»ú´«µ½ÆðÊ¼µã
	local nGroupId = GetTask(TK_CO_GROUPID);
	
	local nMapId = nBeginMapID + nGroupId - 1;
	nMapId = mod(nMapId, CO_SMALLMAPCOUNT) + 1;
	local szFile = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\player.txt]];
	local PosX, PosY = getadatatow(szFile, 8 + 8 * nMapId, 15 + 8 * nMapId);
	SetPos(floor(PosX / 32), floor(PosY / 32));
	SubWorld = OldSubWorld;
end;

function festival_checkinterver()
    local gametime = GetGameTime();
    if (GetTask(TK_CO_ATTACKED_INTERVER) > gametime) then
        return 0;
    else
        SetTask(TK_CO_ATTACKED_INTERVER, gametime + 2);
        return 1;
    end;
end;
end;
