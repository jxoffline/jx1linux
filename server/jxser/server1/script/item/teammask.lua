function  main(nItem)
	Say("<#>MÆt n¹ tæ ®éi gióp cho tÊt c¶ thµnh viªn trong ®éi trë nªn gièng nhau trong 2 giê, muèn sö dông kh«ng?", 2, "Tæ ®éi ta sÏ c¶i trang gièng nhau./#yes("..nItem..")", "T¹m thêi kh«ng/no");
	return 1
end

function yes(nItem)
	if(GetTeamSize() <= 0) then
		Msg2Player("Kh«ng cã trong ®éi ngò, kh«ng thÓ sö dông ®¹o cô nµy");
		return 1
	end
	local teamid = GetTeam();
	local name = GetName()
	local nfeature = GetItemParam(nItem, 1);
	if RemoveItemByIndex(nItem) ~= 1 then
		return
	end	
	ChangeTeamFeature(teamid, nfeature, 129600);
	Msg2Team(name.."Sö dông mÆt n¹ ®éi ngò, ®éi viªn c¶i trang gièng nhau, kÐo dµi trong 2 giê.");
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