Include([[\script\missions\libfestival\signin.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	playergetingame();
	newworld_in_add();
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	playerleave();
	newworld_out_add();
	OnLeaveWorldDefault(szParam)
end
