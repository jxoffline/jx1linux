Include("\\script\\tong\\workshop\\ws_mianju.lua")
function main()
	local szTongName, nTongID = GetTongName()
	if nTongID == 0 then
		Say("<#>Tæng qu¶n DÞ dung ph­êng: Ng­¬i ch­a gia nhËp bang, t×m ta cã viÖc g×?", 0)
		return
	end	
	local nTypeID = wsGetTypeID(NAME_MIANJU)
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID, nTypeID)	
	USE_G_1(nTongID, nWorkshopID)
end