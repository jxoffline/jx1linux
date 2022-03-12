--支持参数是表格的CreateTaskSay 《dec》版本
--
--选项的写法
----tbOpt = 
--{
--	[1] = { "选项名", 函数, {参数1，参数2} }，
--	[2] = { "选项名", 函数, {参数1，参数2} }
--}

--AskData = {函数, {参数1，参数2}}



Include("\\script\\task\\system\\task_string.lua")

G_PlayerDailogData = {}
G_PlayerAskClientNumberData = {}
G_PlayerAskClientStringData = {}
G_PlayerGiveItemUIData = {}

function CreateNewSayEx(szTitle, tbOpt)
	if G_PlayerDailogData[PlayerIndex] ~= nil then
		--Msg2Player("你还有没有处理的对话。")
		--return 
	end
	
	G_PlayerDailogData[PlayerIndex] = tbOpt
	
	local tbSayOpt = {}
	for i= 1, getn(tbOpt) do
		tinsert(tbSayOpt, tbOpt[i][1].. format("/#g_DailogBack(%d)", i))
	end
	if type(szTitle) == "number" then
		Describe(szTitle, getn(tbSayOpt), tbSayOpt)
	else
		TaskSay("<dec>"..szTitle, tbSayOpt)
	end
	
end

function g_DailogBack(nSelectId, nCount)
	
	local tbOpt = G_PlayerDailogData[PlayerIndex]
	G_PlayerDailogData[PlayerIndex] = nil
	
	if tbOpt and tbOpt[nSelectId] then
		local nParamCount = getn(tbOpt[nSelectId])
		if nParamCount == 1 then
			return
		elseif nParamCount == 2 then
			local pFun = tbOpt[nSelectId][2]
			pFun()
		elseif nParamCount == 3 then
			local pFun = tbOpt[nSelectId][2]
			local tbParam = tbOpt[nSelectId][3]
			
			call(pFun, tbParam)	
		end
	end
end


function g_AskClientStringEx(nDefaultString, nMinLen, nMaxLen, szTitle, pData)
	if G_PlayerAskClientStringData[PlayerIndex] ~= nil then
	--	Msg2Player("目前你有一个输入框没有处理，将不会弹出新的输入框。")
	--	return
	end
	G_PlayerAskClientStringData[PlayerIndex] = pData
	AskClientForString("g_AskClientStringBackEx", nDefaultString, nMinLen, nMaxLen, szTitle);
end

function g_AskClientStringBackEx(szInput)
	local pData = G_PlayerAskClientStringData[PlayerIndex]
	G_PlayerAskClientStringData[PlayerIndex] = nil
	if pData then
		if getn(pData) == 1 then
			pData[1](szInput)
		else
			local pFun = pData[1]
			local tbParam = pData[2]
			tinsert(tbParam, szInput)
			call(pFun, tbParam)	
		end
		
	end
end


function g_AskClientNumberEx(nDefaultNumber, nMaxCount, szTitle, pData)
	if G_PlayerAskClientNumberData[PlayerIndex] ~= nil then
	--	Msg2Player("目前你有一个输入框没有处理，将不会弹出新的输入框。")
	--	return
	end
	G_PlayerAskClientNumberData[PlayerIndex] = pData
	AskClientForNumber("g_AskClientNumberBackEx", nDefaultNumber, nMaxCount, szTitle);
end

function g_AskClientNumberBackEx(nCount)
	local pData = G_PlayerAskClientNumberData[PlayerIndex]
	G_PlayerAskClientNumberData[PlayerIndex] = nil
	if pData then
		if getn(pData) == 1 then
			pData[1](nCount)
		else
			local pFun = pData[1]
			local tbParam = pData[2]
			tinsert(tbParam, nCount)
			call(pFun, tbParam)	
		end
		
	end
end


function g_GiveItemUI(szTitle, szContent, pFunData, pCancelData, nParam)
	G_PlayerGiveItemUIData[PlayerIndex] = {pFunData, pCancelData}
	
	GiveItemUI(szTitle, szContent, "g_GiveItemUIBack", "g_GiveItemUICancel", nParam)
end

function g_GiveItemUIBack(nCount)
	local pData = G_PlayerGiveItemUIData[PlayerIndex]
	G_PlayerGiveItemUIData[PlayerIndex] = nil
	if pData and pData[1] then
		pFunData = pData[1]	
		if getn(pFunData) == 1 then
			pFunData[1](nCount)
		else
			local pFun = pFunData[1]
			local tbParam = pFunData[2]
			tinsert(tbParam, nCount)
			call(pFun, tbParam)
		end
	end
end

function g_GiveItemUICancel()
	local pData = G_PlayerGiveItemUIData[PlayerIndex]
	G_PlayerGiveItemUIData[PlayerIndex] = nil
	if pData and pData[2] then
		pFunData = pData[2]	
		if getn(pFunData) == 1 then
			pFunData[1]()
		else
			
			local pFun = pFunData[1]
			local tbParam = pFunData[2]
			call(pFun, tbParam)	
		end
	end
end