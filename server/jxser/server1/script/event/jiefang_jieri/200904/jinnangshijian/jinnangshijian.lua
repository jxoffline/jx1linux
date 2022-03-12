Include("\\script\\lib\\awardtemplet.lua");

function jf0904_getjinnangshijian()
	jf0904_InitTaskctrl();
	
	if (GetTask(jf0904_TSK_jinnangsj) >= 1) then
		Say("Ng­¬i ®· nhËn vËt phÈm cÈm nang sù kiÖn råi mµ.", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 1) then
		Say("LÔ Quan: Hµnh trang kh«ng ®ñ chç trèng, h·y ®Ó thõa İt nhÊt 1 chç trèng!", 0);
		return
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("CÊp bËc cña ®¹i hiÖp kh«ng ®ñ 50 hoÆc ch­a n¹p thÎ nªn kh«ng thÓ nhËn ®­îc cÈm nang sù kiÖn.", 0);
		return
	end
	
	local nIndex = AddItem(6, 1, 1833, 1, 0, 0);
	ITEM_SetExpiredTime(nIndex, jf0904_item_expiredtime);
	SyncItem(nIndex);
	Say("LÔ Quan: Xin nhËn lÊy!", 0);
	SetTask(jf0904_TSK_jinnangsj, 1);
end