--ITEMTYPE
--SKILLTYPE
--SKILLLEVEL
--SKILLNAME

Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx and race_ItemMapCheck() == 0) then
		Talk(1, "", "§¹o cô nµy kh«ng dïng ®­îc ë khu vùc nµy.");
		return 1;
	end;
	CastSkill(SKILLTYPE, SKILLLEVEL)
	Msg2Player("<#> B¹n ®· bè trÝ mét <color=0xB5FDD7>"..SKILLNAME.."<color>");
end;
