Include("\\script\\activitysys\\config\\17\\config.lua")
Include("\\script\\activitysys\\config\\17\\head.lua")

function pActivity:Jiluxiaohao_yesou()
	AddStatData("baoxiangxiaohao_kaiyesouxiangzi", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
end

function pActivity:Jiluxiaohao_chengzhan()
	AddStatData("baoxiangxiaohao_kaichengzhanlibao", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
end

function pActivity:Jiluxiaohao_zhizun()
	AddStatData("baoxiangxiaohao_kaizhizunmibao", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
end

function pActivity:Jiluxiaohao_shuizexiangzi()
	AddStatData("baoxiangxiaohao_kaishuizeixiangzi", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
end

--§iÒu chØnh phÇn th­ëng r¬i ra tõ boss thuû tÆc ®¹i ®Çu lÜnh - Modified By ThanhLD - 20140422
function pActivity:VnFFBigBossDrop(nNpcIndex)
	tbVnFFBigBossDrop = {
			-- [1] = {{szName="XÝch L©n LÖnh",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.4},},
			-- [2] = {{szName="M¶nh XÝch L©n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=3},},
			-- [3] = {{szName="XÝch L©n Kim Bµi",tbProp={6,1,3392,1,0,0},nCount=1,nRate=4},},
			-- [4] = {{szName="XÝch L©n Tr¶o",tbProp={6,1,3394,1,0,0},nCount=1,nRate=7},},
			-- [5] = {{szName="XÝch L©n Gi¸c",tbProp={6,1,3395,1,0,0},nCount=1,nRate=4},},
			-- [6] = {{szName="XÝch L©n T×nh",tbProp={6,1,3396,1,0,0},nCount=1,nRate=2.5},},
			-- [7] = {{szName="B¹ch Hæ Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={2,0,0,0,0,0}},},
			-- [8] = {{szName="B¹ch Hæ Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.3,tbParam={6,0,0,0,0,0}},},
			-- [9] = {{szName="B¹ch Hæ Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={5,0,0,0,0,0}},},
			-- [10] = {{szName="B¹ch Hæ H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={1,0,0,0,0,0}},},
			-- [11] = {{szName="B¹ch Hæ Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={9,0,0,0,0,0}},},
			-- [12] = {{szName="B¹ch Hæ Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={8,0,0,0,0,0}},},
			-- [13] = {{szName="B¹ch Hæ Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={4,0,0,0,0,0}},},
			-- [14] = {{szName="B¹ch Hæ Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={3,0,0,0,0,0}},},
			-- [15] = {{szName="B¹ch Hæ H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={10,0,0,0,0,0}},},
			-- [16] = {{szName="B¹ch Hæ KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.2,tbParam={7,0,0,0,0,0}},},
			-- [17] = {{szName="XÝch L©n Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0}},},
			-- [18] = {{szName="XÝch L©n Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={6,0,0,0,0,0}},},
			-- [19] = {{szName="XÝch L©n Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={5,0,0,0,0,0}},},
			-- [20] = {{szName="XÝch L©n H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={1,0,0,0,0,0}},},
			-- [21] = {{szName="XÝch L©n Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0}},},
			-- [22] = {{szName="XÝch L©n Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={8,0,0,0,0,0}},},
			-- [23] = {{szName="XÝch L©n Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={4,0,0,0,0,0}},},
			-- [24] = {{szName="XÝch L©n Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={3,0,0,0,0,0}},},
			-- [25] = {{szName="XÝch L©n H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={10,0,0,0,0,0}},},
			-- [26] = {{szName="XÝch L©n KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.03,tbParam={7,0,0,0,0,0}},},
			-- [27] = {{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.6,nExpiredTime=43200},},
			-- [28] = {{szName="Cèng HiÕn LÔ bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			-- [29] = {{szName="KiÕn ThiÕt LÔ Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			-- [30] = {{szName="ChiÕn BÞ LÔ Bao",tbProp={6,1,30218,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			-- [31] = {{szName="Bao D­îc hoµn ",tbProp={6,1,910,1,0,0},nCount=1,nRate=15,nExpiredTime=20160},},
			-- [32] = {{szName="B¹ch Hæ Trïng LuyÖn Ngäc",tbProp={6,1,3187,1,0,0},nCount=1,nRate=3},},
			-- [33] = {{szName="M¹c B¾c TruyÒn Tèng LÖnh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},},
			-- [34] = {{szName="Vâ L©m MËt TÞch",tbProp={6,1,26,1,0,0},nCount=1,nRate=5},},
			-- [35] = {{szName="TÈy Tñy Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=5},},
			-- [36] = {{szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
			-- [37] = {{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
			-- [38] = {{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
			-- [39] = {{szName="Qu¶ Hoµng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	
	}	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbVnFFBigBossDrop, "PhÇn th­ëng tiªu diÖt Thñy TÆc §¹i §Çu LÜnh", 1)
	tbAward = {szName = "§iÓm kinh nghiÖm", nExp=2e7}
	tbAwardTemplet:Give(tbAward, 1, {"TinhNangKey", "NhanthuongtieudietBoss"})
end

function pActivity:VnUsePirateBox(nItemIdx)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\17\\vnshuizeibaoxiang.lua", "VnPirateBox_main", nItemIdx)
	return nil
end