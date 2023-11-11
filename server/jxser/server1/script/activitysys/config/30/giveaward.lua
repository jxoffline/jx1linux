Include("\\script\\activitysys\\config\\30\\head.lua")
Include("\\script\\activitysys\\config\\30\\config.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

szEventName = "Event_NhaGiaoVN"

tbItem = {
	[1]={szName="C﹜ B髏",tbProp={6,1,3040,1,0,0},nExpiredTime=20111201},
}

tbBaizhi = {
	[1]={szName="Gi蕐 Tr緉g",tbProp={6,1,3039,1,0,0},nExpiredTime=20111201,nRate=5,}, 
}

	
-- nKind 积分类型，1为大于1000且小于3000，2为大于3000
function pActivity:GiveSongjinAward(nKind)
	--print("宋金结束，nKind = " .. nKind)
	local tbSongjin = {
		[1] = {10, "TongKim1000NhanCayBut"},	
		[2] = {30, "TongKim3000NhanCayBut"}
		}

	if tbSongjin[nKind] then
		tbAwardTemplet:Give(tbItem, tbSongjin[nKind][1], {szEventName,tbSongjin[nKind][2]})
	end
end

-- nKind 积分类型，1为闯关17，2为闯关28关
function pActivity:GiveChuangguanAward(nGuan)
--	print("时间的挑战闯关成功，nguan = " .. nGuan)
	local tbChuangguan = {
		[17] = {10, "VuotAi17NhanCayBut"},	
		[28] = {10, "VuotAi28NhanCayBut"}
		}

	if tbChuangguan[nGuan] then
		tbAwardTemplet:Give(tbItem, tbChuangguan[nGuan][1], {szEventName,tbChuangguan[nGuan][2]})
	end
end

-- 杀手
function pActivity:GiveShashouAward()
--	print("杀死杀手boss成功")
	local tbShashou = {2, "TieuDietBossSatThuNhanCayBut"}
	tbAwardTemplet:Give(tbItem, tbShashou[1], {szEventName,tbShashou[2]})
end

-- 炎帝宝藏 闯过10关
function pActivity:GiveYDBZAward(nGuan)
--	print("炎帝宝藏闯过10关")
	local tbYDBZ = {
		[10] = {15, "VuotAiViemDe10NhanCayBut"},
	}
	if tbYDBZ[nGuan] then
		tbAwardTemplet:Give(tbItem, tbYDBZ[nGuan][1], {szEventName,tbYDBZ[nGuan][2]})
	end
end

-- 风陵渡
-- nKind 1 为杀死水贼头领，2为杀死水贼大头领
function pActivity:GiveFenglinduAward(nKind)
--	print("杀死水贼头领成功, nKind = " .. nKind)
	local tbFenglingdu = {
		[1] = {5, "TieuDietThuyTacDauLinhNhanCayBut"},	
		[2] = {10, "TieuDietThuyTacDaiDauLinhNhanCayBut"}
		}

	if tbFenglingdu[nKind] then
		tbAwardTemplet:Give(tbItem, tbFenglingdu[nKind][1], {szEventName,tbFenglingdu[nKind][2]})
	end
end

-- 黄金boss
function pActivity:GiveGoldBossAward()
--	print("杀死黄金boss成功")
	local tbGoldBoss = {20, "TieuDietBossTheGioiNhanCayBut"}
	tbAwardTemplet:Give(tbItem, tbGoldBoss[1], {szEventName, tbGoldBoss[2]})
end

-- 指定地图野外打怪掉落白纸道具
function pActivity:GiveYewaiguaiAward()
--	print("野外打怪成功")
	local tbMonster = {1, "killedmonstergetpaper"}
	tbAwardTemplet:Give(tbBaizhi, tbMonster[1], {szEventName, tbMonster[2]})
end

pActivity.nPak = curpack()