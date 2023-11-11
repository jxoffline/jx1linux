Include("\\script\\lib\\common.lua")

TAB_ACTION = 
{--{µØÍ¼¡¢missionid¡¢grouptaskid¡¢maxplayercount¡¢ÊÇ·ñÎª´òÄêÊÞ»î¶¯¡¢{¾­Ñé±¶Êý¡¢¾­ÑéÊ±¼ä}¡¢¶ÝµØ·ûÇ¬À¤Å²ÒÆ·ûÎÄ¼þ}
	{822, 38, 2330, 10, {0}, 10, {2331, 2332}, [[\settings\maps\chrismas\player.txt]]},
	{824, 40, 2409, 10, {1, 19}, 10, {2410, 2411}, [[\settings\maps\springfestival2006\player.txt]]}
}

--¼ì²éµÀ¾ßÊÇ·ñ¿ÉÒÔ±»Ê¹ÓÃ
function itemmapcheck(tab)
	if (tab == nil or type(tab) ~= "table") then
		Talk(1, "", "§¹o cô nµy kh«ng dïng ®­îc ë khu vùc nµy.");
		return 0;
	end;
    local ww, xx, yy = GetWorldPos();
    for i = 1, getn(tab) do
	    if (tab[i][1] == ww) then
	    	return i;
	    end;
	end;
    Talk(1, "", "§¹o cô nµy kh«ng dïng ®­îc ë khu vùc nµy.");
    return 0;
end;

--¼ì²é¸ÃÍæ¼ÒÊÇ·ñÈÔÔÚÓÎÏ·ÖÐ£¬³É¹¦·µ»ØPlayerIndex·ñÔò·µ»Ønil
function check_pl(szPlayName, nMissionID)
	local nPlIdx = SearchPlayer(szPlayName)	--Íæ¼ÒÊÇ·ñÔÚµ±Ç°·þÎñÆ÷
	if (nPlIdx > 0) then
		local nPlMsIdx = PIdx2MSDIdx(nMissionID, nPlIdx)	--Íæ¼ÒÊÇ·ñÔÚÖ¸¶¨MissionÖÐ
		if (nPlMsIdx > 0) then
			return nPlIdx
		end
	end
end

--Éú³ÉÒ»¸öÏà¶ÔÓÚµ±Ç°Íæ¼ÒµÄÑ¡Ïî
function make_option(szFunName)
	local szName = GetName()
	return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
end

--ÕÒµ½¶ÔÁ¢ÕóÓª£¬ÄêÊÞ¡ª¡ª>Íæ¼Ò£¬Íæ¼Ò¡ª¡ª>ÄêÊÞ
function getgroupid(nGroupId, SMALLMAPCOUNT)
    if (nGroupId < 1) then
        return nil
    end;
    
    if (nGroupId > SMALLMAPCOUNT) then
        return nGroupId - SMALLMAPCOUNT;
    else
        return nGroupId + SMALLMAPCOUNT;
    end;
end;