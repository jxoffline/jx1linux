--Change role name 1 -by thanhld 20150818
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")

tbAddChangeName = {}
tbAddChangeName.TASK_KS_ChangeName = 2320
tbAddChangeName.TASK_Use_Time = 2781
tbAddChangeName.WAIT_TIME  = 3*24*60*60 --3 ngµy
tbAddChangeName.LOG_TITLE = "LOG_FEATURE_CTC"
function main(nItemIdx)	
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	--kiem tra trong thoi gian event dua top khong duoc dung
	if tbAddChangeName:ForbitUse_InEvent() ~= 1 then
		Talk(1,"","§ang trong thêi gian sù kiÖn ®ua top kh«ng thÓ sö dông.")
		return 1
	end
	local nCheck, _, _ = tbAddChangeName:Check_TimeReUse()
--	if  nCheck  == 0 then		
--		Talk(1, "", format("Thêi gian chê sö dông lÇn tiÕp theo: <color=yellow>%s<color> h <color=yellow>%s<color> ph.",nHour,nMin))
--		return 1
--	end
	local szTitle = ""
	local tbOpt = {}
	local nState = GetTask(tbAddChangeName.TASK_KS_ChangeName)
	if nState ~= 0 then
		local nCheck, nHour, nMin = tbAddChangeName:Check_TimeReUse()
		szTitle = format("C¸c h¹ ®ang cã mét lÇn ®æi tªn t¹i npc <color=yellow>C¶i TÝnh L·o Nh©n<color> ë c¸c th«n trang. H·y mau ®i gÆp «ng ta")	
	elseif nCheck  == 0 then
		--print("thoi gian su dung chua du")
		local _, nHour, nMin = tbAddChangeName:Check_TimeReUse()
		szTitle = format("Thêi gian chê sö dông lÇn tiÕp theo: <color=yellow>%s<color>h <color=yellow>%s<color>ph.",nHour,nMin)	
	else	
		szTitle = format("Sö dông vËt phÈm nµy c¸c h¹ nhËn ®­îc mét lÇn ®æi tªn t¹i npc <color=yellow>C¶i TÝnh L·o Nh©n<color> ë c¸c th«n trang.")
		tinsert(tbOpt,format("Ta ®ång ý/#tbAddChangeName:AddChangeName(%d)",nItemIdx))
	end	
	tinsert(tbOpt, "Tho¸t/no")
	if getn(tbOpt) > 0 then		
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end


function tbAddChangeName:AddChangeName(nItemIdx)
	if GetTask(self.TASK_KS_ChangeName) ~= 0 then
		Msg2Player("C¸c h¹ ®ang cã mét c¬ héi thay ®æi danh tÝnh råi, h·y ®Õn gÆp C¶i TÝnh L·o Nh©n.")
		Talk(1,"","C¸c h¹ ®ang cã mét c¬ héi thay ®æi danh tÝnh råi, h·y ®Õn gÆp C¶i TÝnh L·o Nh©n.")
		return 
	end
	if IsMyItem(nItemIdx) ~=1 then
		return
	end
	
	RemoveItemByIndex(nItemIdx)
	SetTask(self.TASK_Use_Time,  tonumber( GetCurServerTime()))
	SetTask(self.TASK_KS_ChangeName, 1)
	Msg2Player("§· nhËn ®­îc mét c¬ héi thay ®æi danh tÝnh, h·y ®Õn gÆp C¶i TÝnh L·o Nh©n.")
	Talk(1,"","C¸c h¹ ®· nhËn ®­îc mét c¬ héi thay ®æi danh tÝnh, h·y ®Õn gÆp  <color=yellow>C¶i TÝnh L·o Nh©n<color> ë c¸c th«n trang")
	tbLog:PlayerActionLog(self.LOG_TITLE,"NhanDuoc1LanDoiTen" )
end

--check thoi gian su dung
function tbAddChangeName:Check_TimeReUse()
	local nCurTime = tonumber(GetCurServerTime())
	local nLastUseTime = GetTask(self.TASK_Use_Time)
	
	if nLastUseTime == 0 then		
		return 1
	end	
	local nSpendTime = nCurTime - nLastUseTime
--	print("Check_TimeReUse nCurTime: "..nCurTime)		
--	print("Check_TimeReUse nLastUseTime: "..nLastUseTime)		
--	print("Check_TimeReUse nSpendTime: "..nSpendTime)		
	if (nCurTime > nLastUseTime) and (nSpendTime < self.WAIT_TIME) then
		local nCurWaitTime = self.WAIT_TIME - nSpendTime
		local nHour = floor(nCurWaitTime/(60*60))	
		local nMin = floor((nCurWaitTime - nHour*60*60)/60)		
		--print("Check_TimeReUse: "..nHour.."-"..nMin)		
		
		return 0,nHour, nMin
	end
	--print("Check_TimeReUse: return 1 ")
	return 1
end

--check thoi gian trong event dua top ko dc su dung
--event dua top thang 9
function tbAddChangeName:ForbitUse_InEvent()
	local nStartDate = 201509230000
	local nEndDate   = 201510012400
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if (nCurDate >= nStartDate and nCurDate < nEndDate) then
		return 0
	else
		return 1
	end
end
