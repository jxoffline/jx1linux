--ITEMTYPE
--SKILLTYPE
--SKILLLEVEL
--SKILLNAME

Include([[\script\missions\tong\tong_springfestival\head.lua]]);

-- LLG_ALLINONE_TODO_20070802
Include([[\script\item\springfestival2006\itemhead.lua]]);

function main()
    local nOldPlayer = PlayerIndex;
    tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	if (0 == festival_checkinterver()) then
        return 1;
    end;
	local pidx = get_most_close_nianshou(SF_MISSIONID);
	if (-1 == pidx) then
	    PlayerIdex = nOldPlayer;
	    Msg2Player("<#> Xung quanh b¹n kh«ng cã Qu¸i thó, ®õng nªn sö dông hoang phÝ!");
	    return 1;
	end;
	
	local nNPCIdx;
	nNPCIdx = PIdx2NpcIdx(pidx);

	CastSkill(SKILLTYPE, SKILLLEVEL, -1, nNPCIdx);
	
	PlayerIdex = nOldPlayer;
	Msg2Player("<#> B¹n ®· sö dông mét <color=0xB5FDD7>"..SKILLNAME.."<color>");
end;


function get_most_close_nianshou(nMissionID)
    local nOldPlayer = PlayerIndex;
    local Player_world, Player_x, Player_y;
    Player_world, Player_x, Player_y = GetWorldPos();
    
    local nGroupID = GetTask(TK_GROUPID);
    local nNianShou_GroupID = festival_getgroupid(nGroupID);
    local tabPlayer = {};
    local idx, pidx;
    idx = 0;
    local i;
    for i = 1, 400 do
		idx, pidx = GetNextPlayer(nMissionID, idx, nNianShou_GroupID);
		if (pidx > 0) then
			tabPlayer[i] = pidx;
		end;
		
		if (0 == idx) then
			break;
		end;
		
	end;
	local tabDistance = {};
	local world, x, y;
	local nCount = getn(tabPlayer);
	if (nCount == 0) then
	    return -1;
	end;
	for i = 1, nCount do
	    PlayerIndex = tabPlayer[i];
	    world, x, y = GetWorldPos();
	    tabDistance[i] = caculate_dis(x, y, Player_x, Player_y);
	end;
    PlayerIndex = nOldPlayer;
    
    if (nCount == 1) then
        return tabPlayer[1];
    end;
	if (tabDistance[1] <= tabDistance[2]) then
	    return tabPlayer[1];
	else
	    return tabPlayer[2];
	end;
end;

function caculate_dis(x, y, xx, yy)
    local nResult = (x - xx) * (x - xx) + (y - yy) * (y - yy);
    return floor(nResult);
end;