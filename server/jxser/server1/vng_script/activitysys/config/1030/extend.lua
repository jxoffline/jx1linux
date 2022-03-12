Include("\\vng_script\\activitysys\\config\\1030\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1030\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1030\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

pActivity.nPak = curpack()

function pActivity:OnServerStart()

end

function pActivity:CheckLimitUseTienDon()
	local nUseTienDon = tbVNG_BitTask_Lib:getBitTask(tbBITTSK_LIMIT_USE_TIENDON)
	local nCurUseVanNien = tbVNG_BitTask_Lib:getBitTask(tbBITTSK_LIMIT_USE_VANNIEN_TL)
	local nMaxUse = MOC_2000 + MOC_1000*nUseTienDon
	--print("=====CheckLimitUseHHDB nMaxUse: "..nMaxUse)
	if nCurUseVanNien >= nMaxUse then
		if nUseTienDon == 0 then
			Talk(1,"",format("C¸c h¹ cã thÓ sö dông tèi ®a: <color=yellow>%d V¹n Niªn Tr©n Lé<color>, Sö dông <color=yellow>Tiªn §¬n<color> cã thÓ t¨ng giíi h¹n sö dông V¹n Niªn Tr©n Lé.",nMaxUse))			
		else
			Talk(1,"",format("C¸c h¹ cã thÓ sö dông tèi ®a: <color=yellow>%d V¹n Niªn Tr©n Lé<color>, ®· ®¹t giíi h¹n sö dông, kh«ng thÓ sö dông thªm.",nMaxUse))			
		end
		return nil
	end
	return 1
end

