Include("\\script\\tong\\tong_header.lua")
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

local tbLadderId = 
{
	10263,10264,10265
}
local tbTongTSK_Exploit = 
{
	TONGTSK_Gongde_meici,
	TONGTSK_Gongde_meizhou,
	TONGTSK_Gongde_Total,
}


IncludeLib("TONG")
function TaskShedule()
	--…Ë÷√∑Ω∞∏√˚≥∆
	TaskName("÷–«Ô…Ò∆ÊÈ≈ ˜")
	
	local  nInterval = 30
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--…Ë÷√º‰∏Ù ±º‰£¨µ•ŒªŒ™∑÷÷”
	TaskInterval(nInterval) --nInterval∑÷÷”“ª¥Œ
	--…Ë÷√¥•∑¢¥Œ ˝£¨0±Ì æŒﬁœﬁ¥Œ ˝
	

	TaskCountLimit(0)

	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "MidA200909",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

local clearLaddderData = function (nId)
	OutputMsg("clear ladder ing ...");
	Ladder_ClearLadder(%tbLadderId[nId])
	local nTongID = TONG_GetFirstTong();
	while(nTongID and nTongID ~= 0)do
		TONG_ApplySetTaskValue(nTongID, %tbTongTSK_Exploit[nId], 0);
		nTongID = TONG_GetNextTong(nTongID);
	end
	OutputMsg("clear ladder over");
end

local _PublicRank = function(nId)
	local szName, nValue = Ladder_GetLadderInfo(%tbLadderId[nId], 1);
	local szMsg = ""
	if szName ~= nil and szName ~= "" then
		if nId == 1 then
			szMsg = format("ChÛc mıng %s %s Æ∑ Æπt Æ≠Óc hπng nh t, thµnh vi™n trong bang hÈi ÆÒ Æi“u ki÷n c„ th” nhÀn %u kinh nghi÷m",szName, "B∂ng x’p hπng ÆÓt nµy", 6e7)
		elseif nId == 2 then
			szMsg = format("ChÛc mıng %s %s Æ∑ Æπt Æ≠Óc hπng nh t, thµnh vi™n trong bang hÈi ÆÒ Æi“u ki÷n c„ th” nhÀn %u kinh nghi÷m",szName, "B∂ng x’p hπng tu«n", 15e7)
		elseif nId == 3 then
			szMsg = format("ChÛc mıng %s %s Æ∑ Æπt Æ≠Óc hπng nh t, thµnh vi™n trong bang hÈi ÆÒ Æi“u ki÷n c„ th” nhÀn %u kinh nghi÷m",szName, "B∂ng x’p hπng suËt thÍi gian hoπt ÆÈng", 20e7)
		end
	end
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
end

function TaskContent()
	local nTime = tonumber(date("%H%M"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	local nTaskState = tonumber(date("%y%m%d%H"))
	
	if nDate < 091211 or nDate > 100124 then
		return
	end
	
	
	--π´∏Ê
	if nTime >= 2000 and nTime < 2030 then
		local szMsg = ""
		if ( nWeek == 5 or nWeek == 6 or nWeek == 0)  then
			%_PublicRank(1)
		end
		if nWeek == 0 then
			%_PublicRank(2)
		end
		if nDate == 100124 then
			
			%_PublicRank(3)
		end
	end
	
	
	local callnpc_flag = 0
	
	if (nTime >= 1930 and nTime < 2000 ) and ( nWeek == 5 or nWeek == 6 or nWeek == 0) then
		callnpc_flag = 1	
	elseif (nTime >= 0000 and nTime < 0100) then
		%clearLaddderData(1)
		if nWeek == 1 then
			%clearLaddderData(2)
		end
		
	end
	
	local tbPos = 
	{
		{121,226*8*32,275*16*32 },
		{100,183*8*32,203*16*32 },
		{101,171*8*32,198*16*32 },
		{174,218*8*32,192*16*32 },
		{53, 220*8*32,200*16*32},
		{20, 432*8*32,359*16*32},
		{153,232*8*32,180*16*32 },
		{99, 189*8*32,223*16*32 },
	}
	if callnpc_flag == 1 then
		local nId = random(1, getn(tbPos))
		--À¢
		local szExeMsg = format("dwf \\script\\event\\zhongqiu_jieri\\200909\\rongshu\\addnpc.lua tbZhongQiu200909:AddTree(%d,%d,%d,%d)", 1496, tbPos[nId][1],tbPos[nId][2],tbPos[nId][3])
		OutputMsg(szExeMsg)
		GlobalExecute(szExeMsg)
		--tbPos[nId], tbPos[4] = tbPos[4], tbPos[nId]
	end
	
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end