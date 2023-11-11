Include("\\vng_script\\activitysys\\config\\1034\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1034\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1034\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")

pActivity.nPak = curpack()

function pActivity:CheckIsAccTDB2()
	local nCheck = nil
	local nIDTitle = nil
	for k,v in TITLE_EXT_ID_TDB2 do
		if VngExtPointLib:GetBitValueByVersion(v) == 1 then
			nCheck = 1
			nIDTitle = k
		end
	end
	return nCheck, nIDTitle
end

function pActivity:GetTitle_TDB_2()
	local nCheck, nTitleId = self:CheckIsAccTDB2()
	if  nCheck ~= 1 then
		Talk(1,"","C¸c h¹ kh«ng phï hîp ®iÒu kiÖn lÜnh th­ëng")
		return
	end		
	local nTitleIdtype = Title_GetTitleInfo(nTitleId)
	
	if nTitleIdtype ~= 0 then
		Title_RemoveTitle(nTitleId)
	end
	
	SetTask(TASK_ACTIVE_TITLE, nTitleId)	
	tbVNG_BitTask_Lib:setBitTask(TITLE_TAKSID_TDB2[nTitleId], 1)
	VngExtPointLib:SetBitValueByVersion(TITLE_EXT_ID_TDB2[nTitleId],0)
	
	 local nTime = Tm2Time(2016, 5, 1, 0 )
	Title_AddTitle(nTitleId, 2, nTime)
	Title_ActiveTitle(nTitleId)
	
	local sz_title = Title_GetTitleName(nTitleId)	
	tbLog:PlayerActionLog(EVENT_LOG_TITLE,"NhanThanhCong: "..sz_title)
	Talk(1,"",format("Chóc mõng b¹n ®· nhËn ®­îc danh hiÖu <color=yellow>%s<color>", sz_title))
	Msg2Player(format("Chóc mõng b¹n ®· nhËn ®­îc danh hiÖu <color=yellow>%s<color>", sz_title))
end