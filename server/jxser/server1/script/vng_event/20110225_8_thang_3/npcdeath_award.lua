Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
if not tbVNGWD2011_NpcDeath then
	tbVNGWD2011_NpcDeath = {}
end
tbVNGWD2011_NpcDeath.strLog = "[VNG][8thang3]"

function tbVNGWD2011_NpcDeath:onNPCDeath(nNpcIndex)
	if tbVNG_WomenDay2011:IsActive() ~= 1 then
		return 0
	end
	local tbAward = {szName="B¸nh M×",tbProp={6,1,30096,1,0,0},nExpiredTime=20110314}
--	--boss sat thu cap 90	
--	if(NpcFunLib:CheckKillerdBoss(90, nNpcIndex) == 1)then	
--		--PlayerFunLib:GetItem(tbAward, 4,  "[VNG][8thang3][Boss s¸t thñ 90]")				
--		return 0
--	end	
	--thuy tac dau linh
	if (NpcFunLib:CheckBoatBoss(nNpcIndex) == 1) then
		PlayerFunLib:GetItem(tbAward, 15,  self.strLog.."[Thñy TÆc §Çu LÜnh]")
		return 1
	end		
	--boss the gioi
	if (NpcFunLib:CheckWorldBoss(nNpcIndex) == 1) then
		PlayerFunLib:GetItem(tbAward, 15,  self.strLog.."[Boss thÕ giíi]")
		return 1
	end
	--quai thuong
	local szMapIDList = "322, 321, 340, 75, 93, 225, 226, 227, 144, 152";
	if (NpcFunLib:CheckInMap(szMapIDList, nNpcIndex) == 1) then
		local tbRope = {szName="D©y Cét Hoa",tbProp={6,1,30098,1,0,0},nExpiredTime=20110314}
		NpcFunLib:DropSingleItem(tbRope, 1, "4", nNpcIndex)
		return 1;
	end	
end
function tbVNGWD2011_NpcDeath:killerBoss()
	if tbVNG_WomenDay2011:IsActive() ~= 1 then
		return 0
	end
	local tbAward = {szName="B¸nh M×",tbProp={6,1,30096,1,0,0},nExpiredTime=20110314}
	PlayerFunLib:GetItem(tbAward, 10,  self.strLog.."[Boss s¸t thñ 90]")
end