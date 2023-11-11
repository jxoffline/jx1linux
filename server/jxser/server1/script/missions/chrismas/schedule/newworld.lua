Include([[\script\missions\chrismas\ch_head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	setplayerjoinstate();
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
