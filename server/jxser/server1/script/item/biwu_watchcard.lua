IncludeLib("ITEM")
function main( nItemIdx )
	local nMon =  GetItemParam(nItemIdx,1)
	local nDay =  GetItemParam(nItemIdx,2)
	--Say("ÄãµÄ¹ÛÖÚÈ¯µÄÊ¹ÓÃÈÕÆÚÎª<color=yellow>2005Äê"..nMon.."ÔÂ"..nDay.."ÈÕ<color>¡£¹ÛÖÚÈ¯Ö»ÄÜÊ¹ÓÃÒ»´Î£¬Ê¹ÓÃºó£¬¼´¿ÉÔÚ¹ÛÖÚÈ¯µÄÈÕÆÚÊ±¶ÎÄÚµÇÈëÎäÁÖ´ó»á×Ü¾öÈü·şÎñÆ÷£¬¹ÛÕ½¡£ÓâÆÚÎŞĞ§¡£ÄãÈ·¶¨ÒªÏÖÔÚÊ¹ÓÃÂğ£¿", 2, "ÎÒÒªÏÖÔÚÊ¹ÓÃ/#sure2usewatchcard("..nItemIdx..")", "»¹ÊÇÉÔµÈ°É/OnCancel")
	Say("Xin lçi! VĞ cña b¹n sö ®· qu¸ h¹n sö dông!",0);
end

function sure2usewatchcard(nItemIdx)
	local count = CalcEquiproomItemCount( 6, 1, 443, 1 )
	if ( count == 0 ) then
		Say("VĞ cña b¹n ®©u? Kh«ng cã th× kh«ng dïng ®­îc!", 0)
		return
	end
	local nMon =  GetItemParam(nItemIdx,1)
	local nDay =  GetItemParam(nItemIdx,2)
	local nDate = nMon * 100 + nDay
	AddExtPoint(1,nDate)
	Say("VĞ theo dâi cã h¹n sö dông lµ <color=yellow>2005-"..nMon.."nguyÖt "..nDay.." ngµy<color>, Xin ®¨ng kı m¸y dŞch vô thi ®Êu §¹i héi Vâ l©m trong ngµy cã hiÖu lùc ®Ó xem thi ®Êu!", 0)
	DelCommonItem(6,1,443)
end

function GetDesc( nItem )
	local szDesc;
	local nIssueID, nIDCount;
	local nPayYear1, nPayMonth1, nPayDay1, nPayYear2, nPayMonth2, nPayDay2;
		
	nPayYear1 = 2005
	nPayMonth1 = GetItemParam( nItem, 1 )
	nPayDay1 = GetItemParam( nItem, 2 )

	szDesc = ""
	szDesc = szDesc..format( "\nVĞ tham quan vâ l©m ®¹i héi: <color=yellow>%04d-%02d-%02d<color=>, c¶ ngµy", nPayYear1, nPayMonth1, nPayDay1 );
	return szDesc;
end

