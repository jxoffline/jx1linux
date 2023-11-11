Include("\\script\\missions\\citywar_global\\head.lua")
Include("\\script\\tong\\tong_header.lua")
IncludeLib("LEAGUE")
IncludeLib("TONG")

function main(nItemIndex)
	if checkBangHuiLimit() == 0 then
			Say("Xin lçi! §¹i hiÖp ch­a gia nhËp bang héi nµo c¶!",0);
			return 1
	end
	local szTongName, nTongID = GetTongName();
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure ~= TONG_MASTER) then
		Say("ThËt ®¸ng tiÕc, chØ cã bang chñ míi cã thÓ nhËn phÇn th­ëng.", 0)
		return 1
	end
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, 10000, "", "");
	Msg2Player("§¹i hiÖp nép thµnh c«ng 10.000 Khiªu ChiÕn LÖnh cho Bang Héi !")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."TuiQuaKhieuChienLenh"..GetAccount().."\t"..GetName().."\t".."Nép thµnh c«ng 10000 KCL cho Bang Héi")
	return 0
end