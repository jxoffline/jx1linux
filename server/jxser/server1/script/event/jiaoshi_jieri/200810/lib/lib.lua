function jiaoshi0810_TransferDigit2CnNum(nDigit)
	local tbModelUnit = {
		[1]	= "",
		[2]	= " v筺",
		[3] = " tr╩ tri謚", 	
	};
	
	local nDigitTmp = nDigit;	-- 临时变量,
	local n4LenNum	= 0;		-- 每一次对nDigit取4位操作,n4LenNum表示取出来的数的值
	local nPreNum	= 0;		-- 记录前一次进行取4位操作的n4LenNum的值
	local szCnNum	= "";		-- 就是所要求的结果
	local szNumTmp	= "";		-- 临时变量,每取四位的操作中得到的中文数字
	
	if (nDigit == 0) then
		szCnNum = "0";
		return szCnNum;
	end

	if (nDigit < 0) then
		nDigitTmp = -nDigit;
	end
	
	-- 分别从个,万,亿三段考虑,因为nDigit的值小于1万亿,所以每一段都不超过4位
	for i = 1, getn(tbModelUnit) do
		szNumTmp	= "";
		n4LenNum	= mod(nDigitTmp , 10000);
		if (n4LenNum ~= 0) then
			--szNumTmp = transfer4LenDigit2CnNum(n4LenNum);					-- 得到该四位的中文表达式
			szNumTmp = n4LenNum
			szNumTmp = szNumTmp..tbModelUnit[i];								-- 加上单位
		end
		szCnNum	= szNumTmp..szCnNum;
		
		nPreNum	= n4LenNum;
		nDigitTmp = floor(nDigitTmp / 10000);
		if (nDigitTmp == 0) then
			break;
		end
	end
	if (nDigit < 0) then
		szCnNum = "-"..szCnNum;
	end
	return szCnNum;
end