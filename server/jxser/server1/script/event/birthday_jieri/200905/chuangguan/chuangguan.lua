-- Ô½ÄÏ×ÊÁÏÆ¬ÉúÈÕ»î¶¯
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function guoguan_xunbao()
	Say("NhiÕp Thİ TrÇn: Tõ 19/06/2009 ®Õn 24:00 19/07/2009 ®¹i hiÖp cã thÓ tiÕp nhËn nhiÖm vô “Qu¸ quan tÇm b¶o” tõ ta.Sau khi nhËn nhiÖm vô, khi ®¹i hiÖp tham gia “V­ît ¶i cao cÊp” sÏ cã thÓ nhËn ®­îc tİn vËt khai m«n “Hïng T©m KiÕm”, “Hïng T©m KiÕm” nhËn ®­îc nµy  cã sè l­îng nhiÒu hay İt tïy thuéc vµo viÖc ®¹i hiÖp cã thÓ v­ît qua ®­îc ¶i 15, 20, 25 hay 29.", 3,
		"NhËn nhiÖm vô “Qu¸ quan tÇm b¶o”/gettask_chuangguan",
		"Ta ®Õn tr¶ nhiÖm vô “Qu¸ quan tÇm b¶o”/fullfilltask_chuangguan",
		"Ta chØ ®Õn xem./OnCancel");
end

function gettask_chuangguan()
	if (GetLevel() < 90) then
		Say("NhiÕp Thİ TrÇn: §¹i hiÖp ch­a ®ñ ®iÒu kiÖn ®Ó nhËn nhiÖm vô nµy.", 0);
		return
	end
	
	if (GetTask(tbBirthday0905.tbTask.tsk_toll_cg_state) == 1) then
		Say("NhiÕp Thİ TrÇn: §¹i hiÖp ®· nhËn nhiÖm vô nµy råi.", 0);
		return
	end
	
	Say("NhiÕp Thİ TrÇn: Tèt qu¸, chóc ®¹i hiÖp tham gia v­ît ¶i thµnh c«ng.", 0);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_state, 1);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, 0);
end

function fullfilltask_chuangguan()
	if (GetTask(tbBirthday0905.tbTask.tsk_toll_cg_state) == 0) then
		Say("NhiÕp Thİ TrÇn: §¹i hiÖp vÉn ch­a nhËn nhiÖm vô \"Qu¸ quan tÇm b¶o\".", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		Say("NhiÕp Thİ TrÇn: §Ó b¶o ®¶m sù an toµn cho vËt phÈm, xin mêi h·y ®Ó hµnh trang thõa 10 « trèng.", 0);
		return
	end
	
	local nToll = GetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount);
	if (nToll < 15) then
		Say("NhiÕp Thİ TrÇn: Ng­¬i kh«ng thÓ hoµn thµnh nhiÖm vô nµy µ?", 0);
		return
	end
	
	local nAwardCount = 0;
	if (nToll >= 29) then
		nAwardCount = 5;
	elseif (nToll >= 25) then
		nAwardCount = 3;
	elseif (nToll >= 20) then
		nAwardCount = 2;
	else
		nAwardCount = 1;
	end
	Say("NhiÕp Thİ TrÇn: Tèt l¾m, ®©y lµ phÇn th­ëng xøng ®¸ng dµnh cho ®¹i hiÖp!", 0);
	Msg2Player(format("NhËn ®­îc %d Hïng T©m KiÕm.", nAwardCount));
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_state, 0);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, 0);
	for i = 1, nAwardCount do
		AddItem(6, 1, 2070, 1, 0, 0);
	end
end

function OnCancel()

end