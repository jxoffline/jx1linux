--ITEMTYPE
--SKILLTYPE
--SKILLLEVEL2
--SKILLLEVEL3
--SKILLLEVEL41
--SKILLLEVEL42
--SKILLEFECT

Include([[\script\missions\tong\tong_springfestival\head.lua]]);

-- LLG_ALLINONE_TODO_20070802
Include([[\script\item\springfestival2006\itemhead.lua]]);

function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	if (0 == itemuseplacecheck(ITEMTYPE)) then
		return 1;
	end;
	AddSkillState(SKILLTYPE, SKILLLEVEL2, SKILLLEVEL3, SKILLLEVEL41 * SKILLLEVEL42); --第二个参数是技能的级别；
	Msg2Player("<#> B筺 nh薾 頲 <color=0xB5FDD7>"..SKILLEFECT.."<color>");
end;