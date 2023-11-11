Include("\\script\\tong\\tong_header.lua")
Include("\\script\\lib\\common.lua")
IncludeLib("TONG")
tbZhongQiu200909 = {}
tbZhongQiu200909.tbNpcPos = {}
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

local tbTongTSK_ExploitFlag = 
{
	TONGTSK_Gongde_meici_flag,
	TONGTSK_Gongde_meizhou_flag
}

-- °ï»á¹¦µÂ+nCount
function tbZhongQiu200909:AddExploit(nTongID, szTongName, nCount)
	
	local nOldCount1 = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[1]);
	local nOldCount2 = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[2]);
	local nOldCount3 = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[3]);
	
	if self:UpdateExploit(nTongID, 1) == 1 then
		nOldCount1 = 0
	end
	if self:UpdateExploit(nTongID, 2) == 1 then
		nOldCount2 = 0
	end
	

	Ladder_NewLadder(%tbLadderId[1], szTongName, nOldCount1+ nCount, 0)
	Ladder_NewLadder(%tbLadderId[2], szTongName, nOldCount2+ nCount, 0)
	Ladder_NewLadder(%tbLadderId[3], szTongName, nOldCount3+ nCount, 0)
	
	TONG_ApplyAddTaskValue(nTongID, %tbTongTSK_Exploit[1], nCount);
	TONG_ApplyAddTaskValue(nTongID, %tbTongTSK_Exploit[2], nCount);
	TONG_ApplyAddTaskValue(nTongID, %tbTongTSK_Exploit[3], nCount);
	OutputMsg(nTongID)
	Msg2Tong(nTongID, format("§iÓm c«ng ®øc bang héi t¨ng %d, ®iÓm c«ng ®øc bang héi hiÖn t¹i lµ %d", nCount, nOldCount1+ nCount))
	OutputMsg(format("§iÓm c«ng ®øc bang héi t¨ng %d, ®iÓm c«ng ®øc bang héi hiÖn t¹i lµ %d", nCount, nOldCount1+ nCount))
end

-- °ï»á¹¦µÂÖµ¸üÐÂ
function tbZhongQiu200909:UpdateExploit(nTongID, nId)
	local nFlag = self:GetCurFlag(nId);
	
	if (TONG_GetTaskValue(nTongID, %tbTongTSK_ExploitFlag[nId]) ~= nFlag) then
		local nCount = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[nId]);
		TONG_ApplySetTaskValue(nTongID, %tbTongTSK_Exploit[nId], 0);
		TONG_ApplySetTaskValue(nTongID, %tbTongTSK_ExploitFlag[nId], nFlag);
		return 1
	end
end

-- »ñµÃÄ¿Ç°±êÖ¾Öµ
function tbZhongQiu200909:GetCurFlag(nId)
	if (nId == 2) then
		return tonumber(date("%W%Y"));
	end
		
	if (nId == 1) then
		ndate = date("%y%m%d");
		if (tonumber(date("%H")) <= 16) then
			return tonumber(ndate.."1");
		else
			return tonumber(ndate.."2");
		end
	end
end

function tbZhongQiu200909_AddExploit(szParam)
	local tbParam = split(szParam, ",")
	local nTongID, szTongName, nCount = tonumber(tbParam[1]),tbParam[2],tonumber(tbParam[3])
	
	tbZhongQiu200909:AddExploit(nTongID, szTongName, nCount)
end