--帮会宣战，主函数
function ClaimWar(nClaimWarSrcTongID, nClaimWarDestTongID, nLeftMinutes)
	local strSrcTongName  = GetTongNameByID(nClaimWarSrcTongID);
	local strDestTongName = GetTongNameByID(nClaimWarDestTongID);
	
	local szMsg = format("Bang h閕 %s   tuy猲 chi課 v韎 bang h閕 %s, th阨 gian chi課 u c遪 %d ph髏.", strSrcTongName, strDestTongName, nLeftMinutes);
	local szEndMsg = format("Bang h閕 %s k誸 th骳 tuy猲 chi課 v韎 bang h閕 %s.", strSrcTongName, strDestTongName);
	if (nLeftMinutes == 0) then
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szEndMsg));
	else
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg));
	end;
end