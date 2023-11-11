Include("\\script\\tong\\workshop\\ws_liwu.lua")
function main()
	local szTongName, nTongID = GetTongName()
	if nTongID == 0 then
		Say("<#>Tæng qu¶n LÔ phÈm ph­êng: Ng­¬i ch­a gia nhËp bang, t×m ta cã viÖc g×?", 0)
		return
	end
	local nTypeID = wsGetTypeID(NAME_LIWU)
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID, nTypeID)
	USE_G_1(nTongID, nWorkshopID)
end