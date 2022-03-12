if MODEL_GAMESERVER == 1 then
	IncludeLib("TONG")
	Include("\\script\\tong\\tong_header.lua")
end

function  main(nItem)
	local _Name, nTongID = GetTongName()
	if(nTongID == 0) then
		Msg2Player("Kh«ng ë trong bang héi, kh«ng thÓ sö dông ®¹o cô nµy.");
		return 1
	end
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_MASTER or figure == TONG_ELDER)then
		Say("<#>MÆt n¹ bang héi cã thÓ gióp cho toµn thÓ thµnh viªn c¶i trang gièng nhau trong vßng 3 giê, cã muèn sö dông kh«ng?", 2, "Tæ ®éi ta sÏ c¶i trang gièng nhau./#yes("..nItem..")", "T¹m thêi kh«ng/no");
		return 1
	else
		Msg2Player("ChØ cã bang chñ hoÆc tr­ëng l·o míi cã thÓ sö dông ®¹o cô nµy.");
		return 1
	end
end

function yes(nItem)
	local a,b = GetTongName();
	if(b == 0) then
		Msg2Player("Kh«ng ë trong bang héi, kh«ng thÓ sö dông ®¹o cô nµy.");
		return 1
	end
	local figure = TONGM_GetFigure(b, GetName())
	if (figure ~= TONG_MASTER and figure ~= TONG_ELDER)then
		Msg2Player("ChØ cã bang chñ hoÆc tr­ëng l·o míi cã thÓ sö dông ®¹o cô nµy.");
		return 1
	end	
	local name = GetName();
	local nfeature  = GetItemParam(nItem, 1);
	if RemoveItemByIndex(nItem) ~= 1 then
		return
	end
	TONG_ChangeAllMemberFeature(b,nfeature,194400)
	Msg2Tong(b, name.."Sö dông mÆt n¹ bang héi, thµnh viªn trªn m¹ng c¶i trang gièng nhau, kÐo dµi trong 3 giê.");
end

function GetDesc(nItem)
	local nNpcSettingIdx = GetItemParam(nItem, 1)
	local nAction = random(0, 13)
	local szSpr = GetMaskActionSpr(nNpcSettingIdx, nAction)
	if (not szSpr)then 
		return ""
	end
	return "<spr="..szSpr..">"
end

function no()
end