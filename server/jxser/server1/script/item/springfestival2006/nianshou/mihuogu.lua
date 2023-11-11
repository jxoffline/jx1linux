Include([[\script\missions\tong\tong_springfestival\head.lua]]);

-- LLG_ALLINONE_TODO_20070802
Include([[\script\item\springfestival2006\itemhead.lua]]);

function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
    if (0 == itemuseplacecheck(2)) then
		return 1;
	end;
    local subworld, x, y;
    subworld, x, y = GetWorldPos();
    subworld = SubWorldID2Idx(TAB_ACTION[tabidx][1]);
    nItemIdx = DropItem(subworld, x * 32, y * 32, -1, 6, 1, 1050, 1, 0, 0, 0);
    if (nItemIdx >= 0) then
        SetSpecItemParam(nItemIdx, 1, 2); --1表示真的，2表示假的
        SetSpecItemParam(nItemIdx, 2, 1); --只让一个玩家拣
    end;
end;