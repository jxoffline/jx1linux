-- ÊôĞÔ¿óÊ¯
-- Fanghao_Wu 2004.12.15

IncludeLib( "ITEM" );
IncludeLib( "FILESYS" );
Include( "\\script\\lib\\string.lua" );
Include( "\\script\\item\\item_header.lua" );

FILE_MAGIC_INDEX = "magicattriblevel_index.txt";

loadItemTabFiles( FILE_MAGIC_INDEX );

function main( nItemIdx )
	Talk( 2, "", "Sö dông kho¸ng th¹ch cã thuéc tİnh cã thÓ n©ng cÊp thuéc tİnh mµu xanh t­¬ng øng lªn trang bŞ. NÕu nh­ <color=yellow>kho¸ng th¹ch cã thuéc tİnh Èn<color>, trong lóc n©ng cÊp cÇn ph¶i ngò hµnh thuéc tİnh cña kho¸ng gièng ngò hµnh thuéc tİnh trang bŞ.", "T¹i thî rÌn ë mçi thŞ trÊn ®Òu cã thÓ thao t¸c ®óc luyÖn c¸c trang bŞ Hoµng Kim vµ Trang bŞ HuyÒn Tinh." );
	return 1;
end

function GetDesc( nItemIdx )
	local strDesc = "";
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( nItemIdx );
	if( mod( nParticular, 2 ) == 1 ) then
		strDesc = strDesc.."Thuéc tİnh ngò hµnh:"..toSeries( nSeries ).."\n";
	end
	strDesc = strDesc.."<color=blue>Thuéc tİnh:"..getMagicDesc( nItemIdx ).."\n";
	strDesc = strDesc.."<color=blue>PhÈm chÊt thuéc tİnh:<color=yellow>"..nLevel.."\n";
	strDesc = strDesc.."<color=orange>Lo¹i trang bŞ cã thÓ kh¶m n¹m:"..getMagicFitEquip( nItemIdx );
	return strDesc;
end

function getMagicDesc( nItemIdx )
	local nItemVer = ITEM_GetItemVersion( nItemIdx );
	local nMagicID = GetItemParam( nItemIdx, 1 );
	local strMagIdxPath = makeItemFilePath( nItemVer, FILE_MAGIC_INDEX );
	local nSearchRow = TabFile_Search( strMagIdxPath, "MAGIC_ID", nMagicID );
	if( nSearchRow > 1 ) then
		return TabFile_GetCell( strMagIdxPath, nSearchRow, "DESC", "" );
	else
		return "";
	end
end

function getMagicFitEquip( nItemIdx )
	local nItemVer = ITEM_GetItemVersion( nItemIdx );
	local nMagicID = GetItemParam( nItemIdx, 1 );
	local strMagIdxPath = makeItemFilePath( nItemVer, FILE_MAGIC_INDEX );
	local nSearchRow = TabFile_Search( strMagIdxPath, "MAGIC_ID", nMagicID );
	if( nSearchRow > 1 ) then
		return TabFile_GetCell( strMagIdxPath, nSearchRow, "FIT_EQUIP", "" );
	else
		return "";
	end
end