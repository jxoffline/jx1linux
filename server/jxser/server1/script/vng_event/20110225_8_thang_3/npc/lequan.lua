Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

tbVNGWD2011_LeQuan ={}
tbVNGWD2011_LeQuan.TSK_DAY_LIMIT = 2751

function tbVNGWD2011_LeQuan:AddDialog(tbDialog)
	if tbVNG_WomenDay2011:IsActive() ~= 1 or tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 
	end
	
	tbDialog:AddOptEntry("Quµ tÆng mõng ngµy Quèc TÕ Phô N÷",tbVNGWD2011_LeQuan.main,{tbVNGWD2011_LeQuan})
end

function tbVNGWD2011_LeQuan:main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"))
	if GetTask(self.TSK_DAY_LIMIT) >= nCurDay then
		tbMainDialog.szTitleMsg = "H«m nay c¸c h¹ ®· nhËn quµ råi. Mai h·y ®Õn vËy."
	else
		tbMainDialog.szTitleMsg = "§Ó chóc mõng ngµy Quèc TÕ Phô N÷, ta cã chót quµ tÆng cho Vâ L©m §ång §¹o, mçi ngµy h·y ®Õn gÆp ta ®Ó nhËn nhÐ!"
		tbMainDialog:AddOptEntry("NhËn", tbVNGWD2011_LeQuan.GetAward, {tbVNGWD2011_LeQuan})
	end		
	tbMainDialog:Show()
end

function tbVNGWD2011_LeQuan:GetAward()
	if (CalcFreeItemCellCount() < 10) then
		Talk(1, "", format("§Ó b¶o vÖ tµi s¶n, xin vui lßng chõa <color=red>%d<color> « trèng trong hµnh trang råi míi nhËn th­ëng!", 10))
		return
	end
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"))
	SetTask(self.TSK_DAY_LIMIT, nCurDay)
Msg2Player(GetTask(self.TSK_DAY_LIMIT))
	local tbAward = {szName="B¸nh M×",tbProp={6,1,30096,1,0,0},nCount=10,nExpiredTime=20110314}
	tbAwardTemplet:GiveAwardByList(tbAward, "[VNG][8thang3][NhËn b¸nh m× t¹i NPC LÔ Quan]")
end