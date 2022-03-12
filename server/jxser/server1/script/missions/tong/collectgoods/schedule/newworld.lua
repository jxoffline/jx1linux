Include([[\script\missions\tong\collectgoods\head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	collg_setplayerjoinstate();
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	collg_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
