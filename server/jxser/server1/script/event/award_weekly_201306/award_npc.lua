--nhan diem lanh dao, by: ThanhLD 20130612
IncludeLib("SETTING")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\award_weekly_201306\\head.lua")
tbAwardWeekly = tbAwardWeekly or {}

tbAwardWeekly.Award =
 {
	{szName = "ßi”m Kinh Nghi÷m", nExp=500000000},	
	{szName="Ch©n Nguy™n ß¨n (Æπi)",tbProp={6,1,30229,1,0,0},nCount=10,nBindState=-2,nExpiredTime=10080},
	{szName="M∆t nπ - Anh hÔng chi’n tr≠Íng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080, nUsageTime = 60},

}
function tbAwardWeekly:main()
	do return end
	if (IsActive() == 0 )then
		return Talk(1,"","L≠u ˝: ThÍi gian nhÀn th≠Îng tı 24-06-2013 Æ’n 29-09-2013")
	end
	if (CheckCondition()==0) then
		return Talk(1,"","Ph«n th≠Îng chÿ giµnh cho nh©n vÀt TrÔng Sinh 4 level 191 trÎ l™n.")
	end
	if (CheckTaskWeekly() ==0) then		 		
		return Talk(1,"","MÁi tu«n chÿ nhÀn Æ≠Óc 1 l«n ph«n th≠Îng, tu«n sau   h∑y gh– lπi.")
	end
	if CalcFreeItemCellCount() <= 1 then		
		return Talk(1, "", "Xin h∑y chıa 2 ´ trËng trong hµnh trang rÂi mÌi nhÀn th≠Îng")
	end
	local CurWeek = tonumber(GetLocalDate("%Y%W")) 
	SetTask(TASK_AWARD_WEEK,CurWeek)
	tbAwardTemplet:Give(self.Award, 1, {"NhanThuongHangTuan", "DaNhanPhanThuongTuan"})	
end

--EventSys:GetType("AddNpcOption"):Reg("Chi’n T©m T´n Gi∂","NhÀn th≠Îng hªng tu«n", tbAwardWeekly.main, {tbAwardWeekly})

	

