--======================================================================
--Author:   Tan Qingyu
--Date:     ãê¾©µØ¹¬ µÆµûBOSS½Å±¾
--Describe: 2012-05-15
--======================================================================

Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")

local nDistance = 20 * 20
tbVngDropItem = 
{
	[1] = {--PhÇn th­ëng rít ra ngÉu nhiªn Hoa §¨ng §iÖp
		{szName="2 Hoa §¨ng §iÖp",tbProp={6,1,30316,1,0,0},nCount=2,nRate=25},
		{szName="4 Hoa §¨ng §iÖp",tbProp={6,1,30316,1,0,0},nCount=4,nRate=25},
		{szName="6 Hoa §¨ng §iÖp",tbProp={6,1,30316,1,0,0},nCount=6,nRate=25},
		{szName="8 Hoa §¨ng §iÖp",tbProp={6,1,30316,1,0,0},nCount=8,nRate=15},
		{szName="10 Hoa §¨ng §iÖp",tbProp={6,1,30316,1,0,0},nCount=10,nRate=10},
	},	
--	[2] = {
--		[1] = {{szName="ThiÕt La H¸n",tbProp={6,1,23,1,0,0},nCount=1,nRate=100},},
--		[2] = {{szName="Phi Tèc hoµn",tbProp={6,0,6,1,0,0},nCount=5,nRate=100},},
--		[3] = {{szName="§¹i Lùc hoµn",tbProp={6,0,3,1,0,0},nCount=5,nRate=100},},
--		[4] = {{szName="Khiªu chiÕn lÖnh",tbProp={6,1,1499,1,0,0},nCount=10,nRate=100},},
--	},
	[2] = {--Danh s¸ch phÇn th­ëng
		[1] = {{szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=5},},
		[2] = {{szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=2},},
		[3] = {{szName="§å Phæ B¹ch Hæ Hµi",tbProp={6,1,3175,1,0,0},nCount=1,nRate=5},},
		[4] = {{szName="§å Phæ B¹ch Hæ Yªu §¸i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=5},},
		[5] = {{szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=1,nRate=5},},
		[6] = {{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=1,nRate=5},},
		[7] = {{szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=1,nRate=5},},
		[8] = {{szName="§å Phæ B¹ch Hæ Th­îng Giíi",tbProp={6,1,3180,1,0,0},nCount=1,nRate=3},},
		[9] = {{szName="B¹ch Hæ §å Phæ H¹ Giíi",tbProp={6,1,3181,1,0,0},nCount=1,nRate=3},},
		[10] = {{szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=1,nRate=2},},
		[11] = {{szName="B¹ch Hæ B¶o Th¹ch",tbProp={6,1,3184,1,0,0},nCount=1,nRate=10},},
		[12] = {{szName="B¹ch Hæ Thiªn Th¹ch",tbProp={6,1,3185,1,0,0},nCount=1,nRate=7},},
		[13] = {{szName="B¹ch Hæ ThÇn Th¹ch",tbProp={6,1,3186,1,0,0},nCount=1,nRate=3},},
		[14] = {{szName="B¶o r­¬ng B¹ch Hæ(NgÉu nhiªn trang bÞ)",tbProp={6,1,30315,1,0,0},nCount=1,nRate=15},},
		[15] = {{szName="B¶o R­¬ng Kim ¤ Kh«i (lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=4,tbParam={2,0,0,0,0,0}},},
		[16] = {{szName="B¶o R­¬ng Kim ¤ Y (lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=4,tbParam={6,0,0,0,0,0}},},
		[17] = {{szName="B¶o R­¬ng Kim ¤ Hµi (lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=4,tbParam={8,0,0,0,0,0}},},
		[18] = {{szName="B¶o R­¬ng Kim ¤ Yªu §¸i (lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=4,tbParam={5,0,0,0,0,0}},},
		[19] = {{szName="B¶o R­¬ng Kim ¤ Hé UyÓn (lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=4,tbParam={4,0,0,0,0,0}},},
		[20] = {{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn (lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=4,tbParam={1,0,0,0,0,0}},},
		[21] = {{szName="B¶o R­¬ng Kim ¤ Béi (lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=4,tbParam={9,0,0,0,0,0}},},
		[22] = {{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi (lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=3,tbParam={3,0,0,0,0,0}},},
		[23] = {{szName="B¶o R­¬ng Kim ¤ H¹ Giíi (lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=3,tbParam={10,0,0,0,0,0}},},
		[24] = {{szName="B¶o R­¬ng Kim ¤ Vò KhÝ (lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=2,tbParam={7,0,0,0,0,0}},},
		[25] = {{szName="Lam Thñy Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=50},},
		[26] = {{szName="Lôc Thñy Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=50},},
		[27] = {{szName="Bao D­îc hoµn",tbProp={6,1,910,1,0,0},nCount=1,nRate=50,nExpiredTime=43200},},
		[28] = {{szName="Tö Thñy Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=50},},
		[29] = {{szName="Hµnh HiÖp LÖnh",tbProp={6,1,2566,1,0,0},nCount=10,nRate=100},},
		[30] = {{szName="ThiÕt La H¸n",tbProp={6,1,23,1,0,0},nCount=1,nRate=100},},
		[31] = {{szName="Phi Tèc hoµn",tbProp={6,0,6,1,0,0},nCount=5,nRate=100},},
		[32] = {{szName="§¹i Lùc hoµn",tbProp={6,0,3,1,0,0},nCount=5,nRate=100},},
		[33] = {{szName="Khiªu chiÕn lÖnh",tbProp={6,1,1499,1,0,0},nCount=10,nRate=100},},
	},
}
function OnDeath(nNpcIndex)
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbVngDropItem,"[BossThat]PhanThuongItemBossRotRa", 1);
	--PhÇn th­ëng dµnh cho nh÷ng ng­êi xung quanh
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, 20e6, 0,"[BosThat]PhanThuongExpDanhchoMenberDungGan");
	end
	--NhËn phÇn th­ëng kinh nghiÖm cho ng­êi ch¬i vµ team giÕt boss
	local nOldPlayer = PlayerIndex
	local tbExpAward = {szName = "§iÓm Kinh NghiÖm", nExp = 100e6}
	local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex) 
	if GetTeamSize() <= 1 then
		tbAwardTemplet:Give(tbExpAward, 1, {"DiaCungBienKinh", "[BossThat]PhanThuongExpDanhchoTeam"})
	else
		local nTeamSize = GetTeamSize()
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			local nX, nY, nMapIndex = GetPos()
			if PlayerIndex > 0 and GetLife(0) > 0 and CheckDistance(nNpcX, nNpcY, nX, nY) == 1 then
				tbAwardTemplet:Give(tbExpAward, 1, {"DiaCungBienKinh", "[BossThat]PhanThuongExpDanhchoTeam"})
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
