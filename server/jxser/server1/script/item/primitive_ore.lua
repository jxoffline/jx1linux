-- Ô­Ê¼ÊôĞÔ¿óÊ¯
-- Fanghao_Wu 2004.1.28

Include( "\\script\\lib\\string.lua" );

function main()
	Talk( 2, "", "Sö dông kho¸ng th¹ch cã thuéc tİnh cã thÓ n©ng cÊp thuéc tİnh mµu xanh t­¬ng øng lªn trang bŞ. NÕu nh­ <color=yellow>kho¸ng th¹ch cã thuéc tİnh Èn<color>, trong lóc n©ng cÊp cÇn ph¶i ngò hµnh thuéc tİnh cña kho¸ng gièng ngò hµnh thuéc tİnh trang bŞ.", "T¹i thî rÌn ë mçi thŞ trÊn ®Òu cã thÓ thao t¸c ®óc luyÖn c¸c trang bŞ Hoµng Kim vµ Trang bŞ HuyÒn Tinh." );
	return 1;
end

function GetDesc( nItemIdx )
	local strDesc = "";
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( nItemIdx );
	if( mod( nParticular, 2 ) == 0 ) then
		strDesc = strDesc.."Thuéc tİnh ngò hµnh:"..toSeries( nSeries ).."\n";
	end
	return strDesc;
end