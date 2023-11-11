Include( "\\script\\item\\checkmapid.lua" )
IncludeLib("SETTING")
SJ_TRAPITEM_COUNT = 50
function EatMedicine(nItemIdx)
	local _,_,detail = GetItemProp(nItemIdx)
	local n_param = tonumber(GetItemParam(nItemIdx,1)) + 1
	local s_name = GetItemName(nItemIdx)
	local n_curtime = GetGameTime();		--Ãë
	local n_lasttime = GetTaskTemp(113);
	
	if (ST_IsRideHorse() == 1) then
		Msg2Player("C­ìi ngùa kh«ng thÓ sö dông vËt phÈm nµy!")
		return -1
	end;
	
	if (n_curtime <= n_lasttime) then
		Msg2Player("1 gi©y sau míi cã thÓ tiÕp tôc sö dông!")
		return -1
	end;
	
	if(detail == 393) then --´©ÐÄÁî
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill( 343,7);	
			Msg2Player("B¹n ®· sö dông 1 Xuyªn T©m LÖnh");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill( 343,9);	
			Msg2Player("B¹n ®· sö dông 1 Xuyªn T©m LÖnh");
		else
			CastSkill( 343,14);	
			Msg2Player("B¹n ®· sö dông 1 Xuyªn T©m LÖnh");
		end
	end
	
	if(detail == 394) then --¶¾´ÌÁî
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill( 303,5);	
			Msg2Player("B¹n ®· sö dông 1 §éc Thø LÖnh");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill( 303,8);	
			Msg2Player("B¹n ®· sö dông 1 §éc Thø LÖnh");
		else
			CastSkill( 303,12);	
			Msg2Player("B¹n ®· sö dông 1 §éc Thø LÖnh");
		end
	end	

	if(detail == 395) then --º®±ùÁî
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill(345 ,7);	
			Msg2Player("B¹n ®· sö dông 1 Hµn B¨ng LÖnh");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill(345 ,9);	
			Msg2Player("B¹n ®· sö dông 1 Hµn B¨ng LÖnh");
		else
			CastSkill( 345,14);	
			Msg2Player("B¹n ®· sö dông 1 Hµn B¨ng LÖnh");
		end
	end
	
	if(detail == 396) then --µØ»ðÁî
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill( 347,7);	
			Msg2Player("B¹n ®· sö dông 1 §Þa Háa LÖnh");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill( 347,9);	
			Msg2Player("B¹n ®· sö dông 1 §Þa Háa LÖnh");
		else
			CastSkill( 347,14);	
			Msg2Player("B¹n ®· sö dông 1 §Þa Háa LÖnh");
		end
	end
	
	if(detail == 397) then --À×»÷Áî
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill( 349,7);	
			Msg2Player("B¹n ®· sö dông 1 L«i KÝch LÖnh");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill( 349,9);	
			Msg2Player("B¹n ®· sö dông 1 L«i KÝch LÖnh");
		else
			CastSkill( 349,14);	
			Msg2Player("B¹n ®· sö dông 1 L«i KÝch LÖnh");
		end
	end		
	
	SetTaskTemp(113, GetGameTime());	--¼ÇÏÂ×îºó´ÎÊ¹ÓÃµÄÊ±¼ä
	
	if ((n_param) >= SJ_TRAPITEM_COUNT) then
		RemoveItemByIndex(nItemIdx)
		Msg2Player("<#> "..s_name.."<#> ®· sö dông"..SJ_TRAPITEM_COUNT.."<#> lÇn, kh«ng thÓ dïng ®­îc n÷a!")
	else
		SetSpecItemParam(nItemIdx,1,n_param)
		SyncItem(nItemIdx)
		Msg2Player("<#> "..s_name.."<#> cßn cã thÓ sö dông"..(SJ_TRAPITEM_COUNT - n_param).."<#> lÇn")
	end
	return -1
end

function GetDesc( nItemIdx )
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItemIdx, 1 ))
	szDesc = szDesc..format("\nCã thÓ sö dông<color=yellow>%d<color>lÇn", (SJ_TRAPITEM_COUNT - n_param));
	return szDesc;
end

