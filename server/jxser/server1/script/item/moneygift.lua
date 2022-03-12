function main(nItemIndex)
	Say("Quèc Kh¸nh vui vÎ!B¹n cã thÓ ®em quµ Quèc Kh¸nh ®Õn c¸c thµnh thŞ gÆp lÔ quan ®Ó ®æi ng©n l­îng. Yªu cÇu ®¼ng cÊp trªn 50, mçi tµi kho¶n chØ ®­îc 3 nh©n vËt tham gia.", 2,
	"Hñy bá vËt phÈm nµy./#del_moneygift("..nItemIndex..")",
	"Hñy bá /OnCancel");
	return 1;
end;

function OnCancel()
end;

function del_moneygift(nItemIndex)
	RemoveItemByIndex(nItemIndex);
end;