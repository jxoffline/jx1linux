Include("\\script\\activitysys\\config\\1010\\head.lua")
Include("\\script\\activitysys\\config\\1010\\variables.lua")
Include("\\script\\activitysys\\config\\1010\\award_ext.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
IL("TONG")

local tbItemOtherAward = {
	["use50banhkem"] = {
			[50] 		= "SuDung2LoaiBanhKem50Lan",
	},
	["banhsinhnhat"] = {
			[50] 		= "SuDungBanhSinhNhatVLTK50Lan",
			[100] 	= "SuDungBanhSinhNhatVLTK100Lan",
			[150] 	= "SuDungBanhSinhNhatVLTK150Lan",
			[200] 	= "SuDungBanhSinhNhatVLTK200Lan",
	},
	["banhkem"] = {
			[100] 	= "SuDung2LoaiBanhKem100Lan",
			[200] 	= "SuDung2LoaiBanhKem200Lan",
			[300] 	= "SuDung2LoaiBanhKem300Lan",
			[400] 	= "SuDung2LoaiBanhKem400Lan",
			[500] 	= "SuDung2LoaiBanhKem500Lan",
			[600] 	= "SuDung2LoaiBanhKem600Lan",
			[700] 	= "SuDung2LoaiBanhKem700Lan",
			[800] 	= "SuDung2LoaiBanhKem800Lan",
			[900] 	= "SuDung2LoaiBanhKem900Lan",
			[1000] 	= "SuDung2LoaiBanhKem1000Lan",
			[1100] 	= "SuDung2LoaiBanhKem1100Lan",
			[1200] 	= "SuDung2LoaiBanhKem1200Lan",
			[1300] 	= "SuDung2LoaiBanhKem1300Lan",
			[1400] 	= "SuDung2LoaiBanhKem1400Lan",
			[1500] 	= "SuDung2LoaiBanhKem1500Lan",
	},		
}
function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {78,1579,3208,},
	}
	local tbNpc = {	
			szName = "Thî Lµm B¸nh", 
			nLevel = 95,
			nNpcId = 1888,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc, nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:CheckAwardExp(strFailMessage)
		local tb = {[1] = 201206110000, [2] = 201206112400}
		local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
		if nDate >= tb[1] and nDate <= tb[2] then
			return 1
		end 
		Talk(1, "", strFailMessage)
		return nil
end
--Hµm sö dông b¸nh kem Tr¸i c©y vµ b¸nh kem chocolate
function pActivity:UseCake(nTask,nLimit,nRes)
	local tbLog = %tbItemOtherAward["banhkem"]
	local nCount = tbVNG_BitTask_Lib:getBitTask(nTask)
	-- PhÇn th­ëng mèc 1500
	if(nCount == nLimit)then
		tbAwardTemplet:Give(%tbAward_Ext["award1500"], 1 , {%EVENT_LOG_TITLE, "SuDungBanhKemChocolatehoacTraicaydat1500"})
	end
	--PhÇn th­ëng ®Æc biÖt
	if tbLog[nCount] then
		tbAwardTemplet:Give(%tbAward_Ext["awardspecial"], 1 , {%EVENT_LOG_TITLE, tbLog[nCount]})
	end
	--PhÇn th­ëng Server ®èi víi B¸nh kem tr¸i c©y
	if nRes == 1 then
			local tbLog50 =  %tbItemOtherAward["use50banhkem"][nCount] or "PhanThuongServersudungbanhkem"
			tbAwardTemplet:Give(%tbAward_Ext["awardnomal"], 1 , {%EVENT_LOG_TITLE, tbLog50})
	end
end
--Hµm sö dông b¸nh kem Sinh NhËt
function pActivity:UseCakeBirthday(nTask,nLimit)
	local tbAward = %tbAward_Ext["awardnomal"];
	local nCount = tbVNG_BitTask_Lib:getBitTask(nTask)
	-- PhÇn th­ëng ngÉu nhiªn khi ®¹t møc 200
	if(nCount == nLimit)then
		tbAwardTemplet:Give(%tbAward_Ext["award200"], 1 , {%EVENT_LOG_TITLE, "SuDungBanhKemSinhNhatdatmoc200"})
	end
	--PhÇn th­ëng Server ®èi víi B¸nh sinh nhËt
	local tbLogAward =  %tbItemOtherAward["banhsinhnhat"][nCount] or "PhanThuongServersudungbanhkemsinhnhat"
	tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, tbLogAward} )
end

function pActivity:DropItemRandom(nNpcIndex)
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, %ITEM_DROP_MOTER, "DropMaterialBag", 1)
end
