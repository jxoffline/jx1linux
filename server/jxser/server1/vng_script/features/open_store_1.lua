--Open Storebox 1 -by thanhld 30032015
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")

tbOpenStoreBox = {}
function main(nItemIdx)	
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = "C¸c h¹ muèn më réng r­¬ng chø?."
	local tbOpt = {}
	tinsert(tbOpt,format("Më réng r­¬ng sè 1/#tbOpenStoreBox:Open_Store_1(%d)",nItemIdx))
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "Tho¸t/no")
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end

function tbOpenStoreBox:Open_Store_1(nItemIdx)
	if CheckStoreBoxState(1) > 0 then
			Msg2Player("C¸c h¹ ®· më r­¬ng 1 råi, kh«ng thÓ më n÷a.")
			return
		end
	if IsMyItem(nItemIdx) ~=1 then
		return
	end
	RemoveItemByIndex(nItemIdx)
	OpenStoreBox(1)
	Msg2Player("Chóc mõng c¸c h¹ ®· më réng r­¬ng 1.")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VNG_LOG_FEATURE_MoRongRuong_1"..GetAccount().."\t"..GetName().."\t".."KichHoatRuong1_ThanhCong")
end
