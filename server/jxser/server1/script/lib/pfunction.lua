Include("\\script\\lib\\baseclass.lua")

FunctionClass = tbBaseClass:new()



function FunctionClass:_init(szFuncion, tbParam)
	
	self.Class = nil
	self.fn = nil
	self.tbParam = tbParam
	self.szClassName, self.szName = self:ParseFunction(szFuncion)
end

function FunctionClass:GetGlobal()
	local pClass, pFn = nil, nil;
	if not self.fn then
		if self.szClassName ~= "" then
			pClass = getglobal(self.szClassName)
			if pClass == nil then
				error(format("------%s class is nil fun %s------", self.szClassName, self.szName))
			else
				pFn = pClass[self.szName]
				
			end
		else
			pFn = getglobal(self.szName)
			
		end
		self.Class = pClass
		self.fn = pFn
	end
end

function FunctionClass:exec(tbExtParam)
	
	if self.fn then
		local tbParam = {}
		if self.Class ~= nil then
			tinsert( tbParam, self.Class)
		end
		for i=1, getn(self.tbParam) do
			tinsert(tbParam, self.tbParam[i])				
		end
		if tbExtParam then	
			for i=1, getn(tbExtParam) do
				tinsert(tbParam, tbExtParam[i])
			end
		end
		return call(self.fn, tbParam)
	else
		print(self.szClassName, self.szName, "H祄 kh玭g t錸 t筰")
	end
end

function FunctionClass:Match(szParam, tbPattan)
	
	local nStart, _, szRet, szLeftParam =  strfind(szParam, "("..tbPattan.szPattan.."),?(.*)")	
	return nStart, tbPattan.proc(szRet), szLeftParam
	
end

function FunctionClass:ParseParam(szParam)
	local tbFormat = 
	{
		{
			szPattan = "-?%d+", 
			proc = function (szRet)
				if szRet then
					return tonumber(szRet)
				end
			end
		},
		{
			szPattan = "%b\"\"",
			proc = function (szRet)
				if szRet then
					return strsub(szRet, 2, strlen(szRet) -1 )
				end
			end
		},
--暂时没用上
--		{
--			szPattan = "[a-zA-Z_]*[:%.]?%w+%(.*%)",
--			proc = function (szRet)
--				
--				local pf = %self:new(szRet)
--				if pf then
--					
--					return pf
--				end
--			end
--		},
--		{
--			szPattan = "%w+",
--			proc = function (szRet)
--				if szRet then
--					return getglobal(szRet)
--				end
--			end
--		}
			
	}
	if not szParam then
		return
	end
	local nStart, pRet, szLeftParam = strlen(szParam) + 1
	for i=1, getn(tbFormat) do
		local nStart_T, pRet_T, szLeftParam_T = self:Match(szParam, tbFormat[i])
		
		if nStart_T and nStart_T < nStart then
			nStart = nStart_T
			pRet = pRet_T
			szLeftParam = szLeftParam_T
		end
	end
	return pRet, szLeftParam
	
end

function FunctionClass:ParseFunction(szFunction)
	local szClassName = ""
	local szFunctionName = szFunction
	local nIdx = strfind(szFunctionName, "[:%.]")
	if nIdx then
		szClassName = strsub(szFunctionName, 1, nIdx-1)
		szFunctionName = strsub(szFunctionName, nIdx+1)
	end
	
	return szClassName, szFunctionName
	
end

function FunctionClass:Parse(szMsg)
	
	local _, _,szFunctionName, szParam = strfind(szMsg, "([a-zA-Z_0-9]*[:%.]?%w+)%((.*)%)")

	local szClassName = ""
	local nIdx = strfind(szFunctionName, "[:%.]")
	if nIdx then
		
		szClassName = strsub(szFunctionName, 1, nIdx-1)
		
		szFunctionName = strsub(szFunctionName, nIdx+1)
	end
		
	local t = {}
	szParam = gsub(szParam, "\\\"","<doublequotation>");
	while szParam ~= nil and szParam ~= "" do
		szRet, szParam = self:ParseParam(szParam)
		
		if type(szRet) ~= "string" then
			tinsert(t, szRet)
		else
			szRet = gsub(szRet, "<doublequotation>", "\"")
			tinsert(t, szRet)
		end
	end
	
	
	return szClassName, szFunctionName, t
end
