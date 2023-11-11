--ÁúÈª´å Ö°ÄÜ Ìú½³
--ÁúÈª´åĞÂÊÖÈÎÎñ£ºĞŞµ¶
-- By: Dan_Deng(2003-09-03)
Include("\\script\\global\\global_tiejiang.lua")
Include("\\Script\\Global\\TimerHead.lua")

TIEJIANG_DIALOG = "<dec><npc>Muèn mua lo¹i binh khİ nµo? T¹i ®©y rÊt næi tiÕng vÒ vò khİ, kh«ng tin ng­¬i ®i hái thanh danh cña Long TuyÒn Hoµng Gia thö xem!"

function main(sel)
	UTask_world19 = GetTask(19)
	if(UTask_world19 == 2) then
		if (HaveItem(229) == 1) then
			tiejiang_village("<dec><npc>C©y ®ao nµy h­ háng nÆng nÒ, ph¶i bá kh«ng İt tiÒn ®Ó s öa nã. TiÒn tu söa 120 ng©n l­îng.", "§­a tiÒn söa ®ao/W19_repair")
		else
			Talk(2,"","Muèn söa c©y ®ao? Xin h·y ®­a cho ta xem thö ","Th«i råi! C©y ®ao cña ta ®· bá quªn ë chç Bµnh Phãng! Ta sÏ quay vÒ ®Ó lÊy nã ")
		end
	elseif (UTask_world19 == 4) then
		tiejiang_village("<dec><npc>C©y ®ao cña ®¹i hiÖp ®ang söa, xin mêi ®îi mét l¸t n÷a"..GetRestSec(7).."<#> Gi©y råi l¹i lÊy.")
	elseif (UTask_world19 == 6) then
		Talk(2,"","§ao cña ng­êi ®· söa xong råi","Tèt l¾m! C¶m ¬n!")
		SetTask(19,8)
		AddEventItem(230)
		AddNote("LÊy l¹i c©y b¶o ®ao tr¶ cho Bµnh Phãng.")
		Msg2Player("LÊy l¹i c©y b¶o ®ao tr¶ cho Bµnh Phãng.")
	elseif (UTask_world19 == 8) and (HaveItem(230) == 0) then
		Talk(1,"","Ng­¬i ®· bá quªn c©y ®ao ë chç ta")
		AddEventItem(230)
		Msg2Player("Ta lÊy l¹i c©y b¶o ®ao ®· ®Ó quªn ë chç thî rÌn.")
	else
		tiejiang_village();
	end
end;

function W19_repair()
	if (GetTimerId() > 0) then		-- ÁíÓĞ¼ÆÊ±Æ÷ÔÚÔËĞĞÖĞ
		Talk(1,"","Ng­¬i ®ang mang nhiÖm vô cÊp b¸ch nh­ thÕ, mµ cßn ch¹y lung tung µ?")
	else
		if (GetCash() < 120) then
			Talk(1,"","Ng­¬i ®­a ch­a ®ñ tiÒn")
		else
			Talk(1,"","§­îc! Hai giê sau ng­¬i ®Õn ®Ó lÊy ®ao")
			Pay(120)
			SetTask(19,4)
			DelItem(229)
			SetTimer(2 * CTime * FramePerSec, 7)
			AddNote("Giao b¶o ®ao cho thî rÌn söa, hai giê sau l¹i lÊy.")
			Msg2Player("Giao b¶o ®ao cho thî rÌn söa, hai giê sau l¹i lÊy.")
		end
	end
end;

function yes()
Sale(28);  				--µ¯³ö½»Ò×¿ò
end;
