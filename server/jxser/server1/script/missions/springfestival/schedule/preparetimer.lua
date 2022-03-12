Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\libfestival\schedule\preparetimer.lua]]);

function startgame_add(nBeginMap)
	local szFile = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\player.txt]];
	local PosX, PosY = getadatatow(szFile, 8 + 8 * nBeginMap, 15 + 8 * nBeginMap);
	NewWorld(CO_MAPID[2], floor(PosX / 32), floor(PosY / 32));
end;
