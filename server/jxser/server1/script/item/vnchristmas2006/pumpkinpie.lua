Include([[\script\item\vnchristmas2006\xmas_head.lua]])
function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H"));
	if (nDate >= 2007013124) then
		Say("B¸nh ®· qu¸ h¹n, kh«ng dïng ®­îc n÷a!", 0);
		return 0;
	end;
	if (isAddExp_Xmasgift(100000) == 1) then
		Msg2Player("B¹n ®· ¨n mét b¸nh bÝ ®á.");
	else
		Msg2Player("Tæng kinh nghiÖm kh«ng ®­îc qu¸ 300 triÖu. B¹n kh«ng thÓ dïng tiÕp n÷a.");
		return 1;
	end;
end;

function GetDesc(nItemIdx)
	local szDesc = "\nThêi h¹n sö dông: <color=blue>0 giê ngµy 31 th¸ng 1 n¨m 2007<color>"
	return szDesc;
end