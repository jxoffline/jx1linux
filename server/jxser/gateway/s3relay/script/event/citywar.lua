Include("\\script\\lib\\common.lua")

function citywar_removemem(szParam)
	local aryParam = split(szParam, " ")
	local szLGName = aryParam[1];
	local szMemName = aryParam[2];
	LGM_ApplyRemoveMember(509, szLGName, szMemName, "", "", 0);
end;

function test_zwy_citywar(n)
	StartCityWar(tonumber(n));
end