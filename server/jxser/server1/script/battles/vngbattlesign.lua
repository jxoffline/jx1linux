--by: ngaVN
--Des: Thai doi nguoi choi dang ky tong kim
-------------------------------------------------------------------------
IncludeLib("SETTING")

if not tbVNG2011_ChangeSign then
	tbVNG2011_ChangeSign = {}
end


tbVNG2011_ChangeSign.tbSIGN = {
				[1] = {1050, 1055},
				[2] = {1250, 1255},
				[3] = {1450, 1455},
				[4] = {1650, 1655},
				[5] = {1850, 1855},
				[6] = {2050, 2055},	
				[7] = {2250, 2255},						
};
	
	
--Kiem tra trung sinh cua nguoi choi
function tbVNG2011_ChangeSign:CheckSign()
	local nTransLife = ST_GetTransLifeCount()	
	if (nTransLife < 3) then
		return 0
	end
	return 1
end

--Tr¶ vÒ  trung sinh cua nguoi choi
function tbVNG2011_ChangeSign:GetTransLife()
	local nTransLife = ST_GetTransLifeCount()	
	if (nTransLife < 3) then
		return 0
	end
	return nTransLife
end

----Kiem tra dieu kien nguoi choi	dang ky battle
function tbVNG2011_ChangeSign:CheckChangeSign()
	local nSignHM= tonumber(date("%H%M")) ;
	for i = 1, getn(self.tbSIGN) do
		if ( nSignHM >= self.tbSIGN[i][1] and  nSignHM <= self.tbSIGN[i][2] ) then
			local nRet = self:CheckSign();
			if(nRet ~= 1) then
				return 0
			end
		end	
	end	
	return 1
end


----Kiem tra dieu kien nguoi choi	dang ky battle
function tbVNG2011_ChangeSign:GetTimeNow()
	local nTimeNow= tonumber(date("%H%M")) ;
	local nTime = 0;
	for i = 1, getn(self.tbSIGN) do
		if ( nTimeNow >= self.tbSIGN[i][1] and  nTimeNow <= self.tbSIGN[i][2] ) then
			nTime = self.tbSIGN[i][2] - nTimeNow;
			return nTime
		end	
	end
	return nTime
end
