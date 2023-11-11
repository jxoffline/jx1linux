
if MODEL_GAMECLIENT ~= 1 then
	return
end

Include("\\script\\event\\bingo_machine\\bingo_machine_def.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\script_protocol\\protocol_def_c.lua")

function BingoMachine:RecvResult(nResult, nRefiningCount, nType, nLevel)
	-- do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end

	if nResult == ROTATE_ERROR_STATUS then
		Msg2Player("Ng­¬i vÉn ch­a lÜnh th­ëng kh«ng thÓ ®Æt c­îc")
	elseif nResult == ROTATE_ERROR_PRINING then
		Msg2Player("Hçn Nguyªn Linh Lé cña ng­¬i kh«ng ®ñ")
	end
	ResultAwardInfo(nResult, nRefiningCount, nType, nLevel);
end


function BingoMachine:ApplyRotate(nOdds)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_STRING, GetSelfName())
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, C2S_OPERATION_ROTATE)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nOdds)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BINGO_MACHINE", handle)
	OB_Release(handle)
end

function BingoMachine:ApplyAward(nType)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_STRING, GetSelfName())
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, C2S_OPERATION_AWARD)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nType)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BINGO_MACHINE", handle)
	OB_Release(handle)
end

function BingoMachine:ApplyOpenWindon()
	-- do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end

	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_STRING, GetSelfName())
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, C2S_OPERATION_OPEN)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, 0)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BINGO_MACHINE", handle)
	OB_Release(handle)
end

function BingoMachine:ApplyOpenShop()
	-- do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end

	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_STRING, GetSelfName())
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, C2S_OPERATION_SHOP)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, 0)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BINGO_MACHINE", handle)
	OB_Release(handle)
end

function BingoMachine:OpenWindow(nStat, nOdds, uAward, uCurAward, uTime, nRefining)
	-- do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	
	local nType = GetByte(uAward, 1)
	local strAward = ""

	if nType > 0 and nType < 6 then
		local tbAward1 = tbBingoMachineAward[nType][1]
		local tbAward2 = tbBingoMachineAward[nType][2]
		local mark = ""
		for i=1,getn(tbAward1) do 
			strAward = strAward .. mark .. tbAward1[i].nCount .. tbAward1[i].szName
			mark = ","
		end	
		strAward = strAward .. ";"
		mark = ""
		for i=1,getn(tbAward2) do 
			strAward = strAward .. mark .. tbAward2[i]
			mark = ","
		end		
		strAward = strAward .. ";"
	end
	OpenTreasureChest(nStat, nOdds, uAward, uCurAward, uTime, nRefining, strAward)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_STRING, GetSelfName())
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BINGO_GET_COIN", handle)
	OB_Release(handle)
end

function BingoMachine:RecvCoin(uCoin, uBigAward)
	SetBigAwardInfo(uCoin, uBigAward)
end

function BingoMachine:GetAwardResult(nResult, nRefiningCount)
	BingoGetAwardResult(nResult, nRefiningCount)
end

function BingoMachine:GetAwardDesc(nType)
	local strAward = ""
	if nType > 0  and nType < 6 then
		local tbAward1 = tbBingoMachineAward[nType][1]
		local tbAward2 = tbBingoMachineAward[nType][2]
		local mark = ""
		for i=1,getn(tbAward1) do 
				strAward = strAward .. mark .. tbAward1[i].nCount .. tbAward1[i].szName
				mark = ","
		end	
		
		strAward = strAward .. ";"
		mark = ""
		for i=1,getn(tbAward2) do 
			strAward = strAward .. mark .. tbAward2[i]
			mark = ","
		end		
		strAward = strAward .. ";"	
	end
	SetBingoAwardInfo(strAward)
end

function BingoMachine:GetDeductCount(nIdx)
	BingoGetDeductCount(ODDS2COIN[nIdx][1], ODDS2COIN[nIdx][2])
end




