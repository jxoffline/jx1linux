Include("\\script\\lib\\string.lua")

function GetDesc(nItem)
	local _, _, _, _, series = GetItemProp(nItem)
	return "<color=blue>Phèi hîp HuyÒn Tinh Kho¸ng Th¹ch cã thÓ kİch ho¹t"..toSeries(series).."<color=blue>thuéc tİnh hiÖn<color> 1 trªn trang bŞ mµu xanh "
end

function main(nItem)
	return 1
end
