--by 廖志山 [2006-09-12]
--2006教师节活动产生：一字为师

Include([[\script\event\teachersday06_v\head.lua]]);

function IsPickable( nItemIndex, nPlayerIndex )
--	if (GetLevel() >= 80) then
--		Msg2Player("<color=yellow>80级<color>以下的玩家才能拾取。");
--		return 0;
--	end;
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	vt06_addzi();
    return 0;
end
