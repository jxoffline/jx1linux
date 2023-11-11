--======================================================================
--Author:   Tan Qingyu
--Date:     „Íæ©µÿπ¨ æ´”¢π÷“‘º∞ºŸBOSSΩ≈±æ
--Describe: 2012-05-15
--======================================================================
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")

local nDistance = 20 * 20

tbVngDropItem = 
{
	{szName="CËng Hi’n L‘ bao",tbProp={6,1,30214,1,0,0},nCount=20},
}
function OnDeath(nNpcIndex)
--	--Ph«n th≠Îng dµnh cho team gi’t boss
--	local nTeamSize = GetTeamSize();
--	local szName;
--	if (nTeamSize > 1) then
--		for i=1,nTeamSize do
--			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
--				szName = doFunByPlayer(GetTeamMember(i), GetName);
--			end
--			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, 50e6, 0, "[BosGia]PhanThuongExpDanhchoTeam");
--		end
--	else -- “ª∏ˆ»À
--		szName = GetName();
--		PlayerFunLib:AddExp(50e6, 0,"[BosGia]PhanThuongExpDanhchoTeam");
--	end
	--Ph«n th≠Îng Boss r¨t Item ra ngoµi
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbVngDropItem,"[BossGia]PhanThuongItemBossRotRa", 1);
	--Ph«n th≠Îng dµnh cho nh˜ng ng≠Íi xung quanh
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, 10e6, 0,"[BosGia]PhanThuongExpDanhchoMenberDungGan");
	end
	--NhÀn ph«n th≠Îng kinh nghi÷m cho ng≠Íi ch¨i vµ team gi’t boss
	local nOldPlayer = PlayerIndex
	local tbExpAward = {szName = "ßi”m Kinh Nghi÷m", nExp = 50e6}
	local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex) 
	if GetTeamSize() <= 1 then
		tbAwardTemplet:Give(tbExpAward, 1, {"DiaCungBienKinh", "[BossGia]PhanThuongExpDanhchoTeam"})
	else
		local nTeamSize = GetTeamSize()
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			local nX, nY, nMapIndex = GetPos()
			if PlayerIndex > 0 and GetLife(0) > 0 and CheckDistance(nNpcX, nNpcY, nX, nY) == 1 then
				tbAwardTemplet:Give(tbExpAward, 1, {"DiaCungBienKinh", "[BossGia]PhanThuongExpDanhchoTeam"})
			end
		end
	end
	PlayerIndex = nOldPlayer
end

function CheckDistance(nX1, nY1, nX2, nY2)
	local nTempDis = ((nX1 - nX2)/32)^2 + ((nY1 - nY2)/32)^2
	if nTempDis <= %nDistance then
		return 1
	end
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end