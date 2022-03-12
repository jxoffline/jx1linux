

local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	
	
	local nNextHour = nStartHour
	local nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	
	if nNextMinute >= 60 then
		
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) 
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end
Include("\\script\\gb_taskfuncs.lua")

function TaskShedule()
	--…Ë÷√∑Ω∞∏√˚≥∆
	TaskName("Chunjie_Jieri2009")
	
	local  nInterval = 10
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);
	

	--…Ë÷√º‰∏Ù ±º‰£¨µ•ŒªŒ™∑÷÷”
	TaskInterval(nInterval) --nInterval∑÷÷”“ª¥Œ
	
	--…Ë÷√¥•∑¢¥Œ ˝£¨0±Ì æŒﬁœﬁ¥Œ ˝
	TaskCountLimit(0)
	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "Chunjie_Jieri2009",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

function TaskContent()
	local nTime = tonumber(date("%H%M"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	local nTaskState = tonumber(date("%y%m%d%H"))
	if nDate < 090116 or nDate > 090215 then --1.1.	‘⁄°∞◊£∫ÿ •µÆ°∞ƒ⁄: 2008-12-05 ÷¡2009-01-04
		return
	end
	
	local flag = 0
	
	if (nWeek == 6 or nWeek == 0 or nWeek == 5) then
		
		if (nTime >= 1950 and nTime <= 1952) then
			flag = 1
		elseif (nTime >= 2000 and nTime <= 2002) then
			flag = 2
		end
	else
		return 
	end
	if flag == 2 then
		local tbMap = 
		{
			{nId = 121, szName = "Long M´n tr n", tbPos = { {251, 261}, {268, 293}	}},
			{nId = 100, szName = "Chu Ti™n tr n", tbPos = { {201, 211}, {219, 182}	}},
			{nId = 101, szName = "ßπo H≠¨ng th´n", tbPos = { {225, 185}, {190, 176} }},
			{nId = 174, szName = "Long Tuy“n th´n", tbPos = { {182, 189}, {193, 216} }},
			{nId = 53, szName = "Ba L®ng huy÷n", tbPos = { {220, 189}, {178, 204} }},
			{nId = 20, szName = "Giang T©n Th´n", tbPos = { {459, 365}, {452, 396} }},
			{nId = 153, szName = "Thπch CÊ tr n", tbPos = { {226, 218}, {184, 217}	}},
			{nId = 99, szName = "V‹nh Lπc tr n", tbPos = { {216, 182}, {185, 199} }},
		}
		local nMapCount = getn(tbMap)
		for i=1, 1 do
			local nIdx = random(1,nMapCount+1-i);
			
			
			local nPosIdx = random(1, getn(tbMap[nIdx].tbPos))
			local nX = tbMap[nIdx].tbPos[nPosIdx][1] * 8
			local nY = tbMap[nIdx].tbPos[nPosIdx][2] * 16
			
			local szExec = format("dwf \\script\\event\\shengdan_jieri\\200811\\newboss\\summonboss.lua shengdan0811_SummonThief(%d, %d, %d)", tbMap[nIdx].nId, nX, nY)
			
			GlobalExecute(szExec)
			local szMsg = format("C„ ng≠Íi nh◊n th y NgÚ ßπi Linh Ng≠u xu t hi÷n Î <color=green>%s<color>, xin h∑y nhanh ch©n Æ’n bæt!", tbMap[nIdx].szName)
			GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
			GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
			--OutputMsg(szMsg);
			tbMap[nMapCount+1-i], tbMap[nIdx] = tbMap[nIdx], tbMap[nMapCount+1-i] --∞——°÷–µƒ∑≈µΩ∫Û√Ê
		end		
		gb_SetTask("shengdan0811_newboss", 1, 1)
	elseif flag == 1 then
		local szMsg = "NgÚ ßπi Linh Ng≠u sœ xu t hi÷n trong vﬂng 10 phÛt n˜a, c∏c nh©n s‹ h∑y chu»n bﬁ tinh th«n Æ” giao Æ u."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		--OutputMsg(szMsg);
	elseif flag == 3 then
		
		gb_SetTask("shengdan0811_newboss", 1, 3)
		--OutputMsg("¡ÏΩ± ±º‰“—æ≠π˝∆⁄°£");
	end
	
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


