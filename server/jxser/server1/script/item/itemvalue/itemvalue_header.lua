-- 价值量脚本头文件
-- Fanghao_Wu 2005.1.12

--------------------------------------------------------------------------------------------------------------------------------
-- 功能：物品价值量概率转移函数对外接口
-- 参数：dSrcItemVal 源物品价值量，arydDesItemVal 目标物品价值量数组
-- 返回：选中的目标物品索引（0表示出错或者没有选中任何一个目标物品），各个目标物品的选中概率数组，所有目标物品的选中概率之和
function TransItemVal( dSrcItemVal, arydDesItemVal )
	if( dSrcItemVal <= 0 or getn( arydDesItemVal ) <= 0 ) then
		return 0, nil, 0;
	end
	
	local nDesItemCount = getn( arydDesItemVal );
	local dProbRandNum = random();
	local arydDesItemValSort = {};
	local arynDesItemValIdx = {};
	local arydDesItemValTemp = {};
	local arydDesItemProbSort = {};
	local arydDesItemProb = {};
	local dDesItemProbSum = 0;
	local nSelDesItemIdx = 0;
	
	-- 初始化
	for i = 1, nDesItemCount do
		arydDesItemValSort[i] = arydDesItemVal[i];
		arydDesItemValTemp[i] = arydDesItemVal[i];
		arydDesItemProbSort[i] = 0;
	end
	-- 从小到大排序
	inssort( arydDesItemValSort, 1, nDesItemCount );
	-- 保存排序后（arydDesItemValSort）的和排序前（arydDesItemVal）的索引对应关系： arynDesItemValIdx[排序后索引] = 排序前索引
	for i = 1, nDesItemCount do
		for j = 1, nDesItemCount do
			if( arydDesItemValSort[i] == arydDesItemValTemp[j] ) then
				arynDesItemValIdx[i] = j;
				arydDesItemValTemp[j] = -1;
				break;
			end
		end
	end
	-- 计算价值量转移概率
	transItemValImpl( dSrcItemVal, arydDesItemValSort, arydDesItemProbSort );
	-- 随机选择目标物品
	for i = 1, nDesItemCount do
		dDesItemProbSum = dDesItemProbSum + arydDesItemProbSort[i];
		if( nSelDesItemIdx == 0 and dDesItemProbSum > 0 and dProbRandNum <= dDesItemProbSum ) then
			nSelDesItemIdx = arynDesItemValIdx[i];
		end
	end
	-- 设置排序前的概率数组
	for i = 1, nDesItemCount do
		arydDesItemProb[arynDesItemValIdx[i]] = arydDesItemProbSort[i];
	end

--	local fileLog = openfile( "./Logs/KSG_CompoundLog_Prob.txt", "a+" );
--	local dDesItemProbSum = 0;
--	local dGenVal = 0;
--	print( format( "SrcVal\t%0.0f", dSrcItemVal ) );
--	Msg2Player( format( "SrcVal\t%0.0f", dSrcItemVal ) );
--	write( fileLog, format( "SrcVal\t%0.0f\r\n", dSrcItemVal ) );
--	for i = 1, nDesItemCount do
--		print( format( "DesVal\t%0.0f\t%0.4f%%", arydDesItemVal[arynDesItemValIdx[i]], arydDesItemProbSort[i] * 100 ) );
--		Msg2Player( format( "DesVal\t%0.0f\t%0.4f%%", arydDesItemVal[arynDesItemValIdx[i]], arydDesItemProbSort[i] * 100 ) );
--		write( fileLog, format( "DesVal\t%0.0f\t%0.4f%%\r\n", arydDesItemVal[arynDesItemValIdx[i]], arydDesItemProbSort[i] * 100 ) );
--		dDesItemProbSum = dDesItemProbSum + arydDesItemProbSort[i];
--		dGenVal = dGenVal + arydDesItemVal[arynDesItemValIdx[i]] * arydDesItemProbSort[i];
--	end
--	Msg2Player( "ProbSum:"..dDesItemProbSum );
--	Msg2Player( "GenVal:"..dGenVal );
	return nSelDesItemIdx, arydDesItemProb, dDesItemProbSum;
end

--------------------------------------------------------------------------------------------------------------------------------
-- 功能：价值量概率转移函数接口
--       根据需要选择不同版本号的价值量概率转移函数，价值量概率转移函数的参数和功能必须符合该接口定义
-- 参数：dSrcItemVal 源物品价值量， arydDesItemValSort 按从低到高排序的目标物品价值量数组， arydDesItemProbSort 目标物品被选中的概率
-- transItemValImpl(dSrcItemVal, arydDesItemValSort, arydDesItemProbSort) = ...

	----------------------------------------------------------------------------------------------------------------------------
	-- 功能：价值量概率转移函数，版本1（2005.1.12）：
	--       在传入的整个目标物品数组中计算挑选目标物品
	--       越接近源物品价值量的目标物品被选中的概率越大，而越远离源物品价值量的目标物品被选中的概率越迅速降低
	function _transItemValImpl_1(dSrcItemVal, arydDesItemValSort, arydDesItemProbSort)
		for i = 1, getn(arydDesItemValSort) do
			arydDesItemProbSort[i] = 1;
		end
		_calcProbLoop(arydDesItemValSort, arydDesItemProbSort, 1, getn(arydDesItemValSort), dSrcItemVal);
	end
	-- 内部递归函数
	function _calcProbLoop( arydValue, arydProb, nStartIdx, nEndIdx, dDivVal )
		-- 如果全部等值且等于切分值dDivVal，则均分概率
		if( nStartIdx < nEndIdx and arydValue[nStartIdx] == arydValue[nEndIdx] and dDivVal == arydValue[nStartIdx] ) then
			for i = nStartIdx, nEndIdx do
				arydProb[i] = arydProb[i] / ( nEndIdx - nStartIdx + 1 );
			end
		-- 如果切分值dDivVal小于等于最小值
		elseif( dDivVal <= arydValue[nStartIdx] ) then
			local nEqualCount = 0;
			for i = nStartIdx, nEndIdx do
				if( arydValue[nStartIdx] == arydValue[i] ) then
					nEqualCount = nEqualCount + 1;
				else
					break;
				end
			end
			for i = nStartIdx, nStartIdx + nEqualCount - 1 do
				arydProb[i] = arydProb[i] * ( dDivVal / arydValue[i] ) / nEqualCount;
			end
			for i = nStartIdx + nEqualCount, nEndIdx do
				arydProb[i] = 0;
			end
		-- 如果切分值dDivVal大于等于最大值
		elseif( dDivVal >= arydValue[nEndIdx] ) then
			local nEqualCount = 0;
			for i = nEndIdx, nStartIdx, -1 do
				if( arydValue[nEndIdx] == arydValue[i] ) then
					nEqualCount = nEqualCount + 1;
				else
					break;
				end
			end
			for i = nStartIdx, nEndIdx - nEqualCount do
				arydProb[i] = 0;
			end
			for i = nEndIdx - nEqualCount + 1, nEndIdx do
				arydProb[i] = arydProb[i] / nEqualCount;
			end
		-- 如果切分值dDivVal介于最小和最大值之间
		else
			local nDivIdx = nStartIdx;
			local dLessSum = 0;
			local dMoreSum = 0;
			
			for i = nStartIdx, nEndIdx do
				if( arydValue[i] <= dDivVal ) then
					dLessSum = dLessSum + arydValue[i];
					nDivIdx = nDivIdx + 1;
				else
					dMoreSum = dMoreSum + arydValue[i];
				end
			end
			
			local dLessMean = ( dLessSum / (nDivIdx - nStartIdx) + arydValue[nDivIdx-1] ) / 2;
			local dMoreMean = ( dMoreSum / (nEndIdx - nDivIdx + 1) + arydValue[nDivIdx] ) / 2;
			local dLessProb = ( dMoreMean - dDivVal ) / ( dMoreMean - dLessMean );
			local dMoreProb = 1 - dLessProb;
	
			for i = nStartIdx, nDivIdx - 1 do
				arydProb[i] = arydProb[i] * dLessProb;
			end
			for i = nDivIdx, nEndIdx do
				arydProb[i] = arydProb[i] * dMoreProb;
			end
	
			if( nStartIdx < nDivIdx - 1 ) then
				calcProbLoop( arydValue, arydProb, nStartIdx, nDivIdx - 1, dLessMean );
			end
			if( nDivIdx < nEndIdx ) then
				calcProbLoop( arydValue, arydProb, nDivIdx, nEndIdx, dMoreMean );
			end
		end
	end
	
	----------------------------------------------------------------------------------------------------------------------------
	-- 功能：价值量概率转移函数，版本2（2006.9.16）：
	--       只在传入的整个目标物品数组中价值量为源物品价值量高低2级的4个物品中计算挑选目标物品
	
	--       [各物品价值量变量关系]：
	--       arydLowVal[1] <= arydLowVal[2] <  （dSrcItemVal）  <= arydHiVal[1] <= arydHiVal[2]
	
	--       [计算函数]：
	--       dSrcItemVal = dLowProb * (arydLowVal[1] * (1 - LOW_NEAR_PERCENT) + arydLowVal[2] * LOW_NEAR_PERCENT) + 
	--                     dHiProb * (arydHiVal[1] * HI_NEAR_PERCENT + arydHiVal[2] * (1 - HI_NEAR_PERCENT))
	--       dLowProb + dHiProb = 1
	
	--       [各目标物品概率结果]：
	--       arydLowProb[1]	=	dLowProb * (1 - LOW_NEAR_PERCENT)
	--       arydLowProb[2]	=	dLowProb * LOW_NEAR_PERCENT
	--       arydHiProb[1]	=	dHiProb * HI_NEAR_PERCENT
	--       arydHiProb[2]	=	dHiProb * (1 - HI_NEAR_PERCENT)
	
	LOW_NEAR_PERCENT	= 0.95;		-- 源物品价值量低1级物品所占概率
	HI_NEAR_PERCENT		= 0.95;		-- 源物品价值量高1级物品所占概率
	
	function _transItemValImpl_2(dSrcItemVal, arydDesItemValSort, arydDesItemProbSort)
		-- 找目标物品中价值量 > 源物品价值量中最低的一个目标物品索引
		local nSrcItemValIdx = 0;
		for i = 1, getn(arydDesItemValSort) do
			if (arydDesItemValSort[i] > dSrcItemVal) then
				nSrcItemValIdx = i;
				break;
			end
		end
		
		-- 源物品价值量 >= 所有单个目标物品的价值量，则100%选中最高价值量的目标物品
		if (nSrcItemValIdx == 0) then
			arydDesItemProbSort[getn(arydDesItemValSort)] = 1;
			return
		end
		-- 源物品价值量 < 所有单个目标物品的价值量，则选不中任何目标物品，所有目标物品概率都保持0%
		if (nSrcItemValIdx == 1) then
			return
		end
		
		-- 计算低2级目标物品价值量混合值
		local dLowValSum = 0;
		if (nSrcItemValIdx > 2) then
			dLowValSum = arydDesItemValSort[nSrcItemValIdx - 1] * LOW_NEAR_PERCENT + 
						 arydDesItemValSort[nSrcItemValIdx - 2] * (1 - LOW_NEAR_PERCENT);
		else
			dLowValSum = arydDesItemValSort[1];
		end
		-- 计算高2级目标物品价值量混合值
		local dHiValSum = 0;
		if (nSrcItemValIdx < getn(arydDesItemValSort)) then
			dHiValSum = arydDesItemValSort[nSrcItemValIdx] * HI_NEAR_PERCENT +
						arydDesItemValSort[nSrcItemValIdx + 1] * (1 - HI_NEAR_PERCENT);
		else
			dHiValSum = arydDesItemValSort[getn(arydDesItemValSort)];
		end
		
		-- 计算低2级目标物品概率和
		local dLowProb = (dHiValSum - dSrcItemVal) / (dHiValSum - dLowValSum);
		-- 计算高2级目标物品概率和
		local dHiProb = 1 - dLowProb;
		
		-- 计算低2级目标物品的最终概率
		if (nSrcItemValIdx > 2) then
			arydDesItemProbSort[nSrcItemValIdx - 1] = dLowProb * LOW_NEAR_PERCENT;
			arydDesItemProbSort[nSrcItemValIdx - 2] = dLowProb * (1 - LOW_NEAR_PERCENT);
		else
			arydDesItemProbSort[1] = dLowProb;
		end
		-- 计算高2级目标物品的最终概率
		if (nSrcItemValIdx < getn(arydDesItemValSort)) then
			arydDesItemProbSort[nSrcItemValIdx] = dHiProb * HI_NEAR_PERCENT;
			arydDesItemProbSort[nSrcItemValIdx + 1] = dHiProb * (1 - HI_NEAR_PERCENT);
		else
			arydDesItemProbSort[getn(arydDesItemValSort)] = dHiProb;
		end		
	end
	
	----------------------------------------------------------------------------------------------------------------------------

-- 使用版本2的价值量概率转移函数
transItemValImpl = _transItemValImpl_2;

--------------------------------------------------------------------------------------------------------------------------------

-- 插入排序
function inssort( aryNumber, nStartIdx, nEndIdx )
	if( nStartIdx >= nEndIdx ) then
		return
	end
	for i = nStartIdx + 1, nEndIdx do
		for j = i, nStartIdx + 1, -1 do
			if( aryNumber[j] < aryNumber[j-1] ) then
				aryNumber[j-1], aryNumber[j] = aryNumber[j], aryNumber[j-1];
			end
		end
	end
end