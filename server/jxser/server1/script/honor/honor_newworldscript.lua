Include("\\script\\maps\\newworldscript_default.lua")
Include("\\script\\honor\\honor_head.lua")

function OnNewWorld(szParam)
    if (tbHonor_Sys_2009.bLoaded ~= 1)then
        tbHonor_Sys_2009.bLoaded = 1;
        tbHonor_Sys_2009:honor_sys_startup();
        
    end
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	OnLeaveWorldDefault(szParam)
end