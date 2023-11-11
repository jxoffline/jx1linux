-- Ô½ÄÏ×ÊÁÏÆ¬ÉúÈÕ»î¶¯
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\awardtemplet.lua")
tbBirthday0905_msg_award =
{
	[1]	= {szName="B¸ V­¬ng Th­¬ng", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 2},
	[2]	= {szName="B¸ V­¬ng Th­¬ng", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 1},
	[3]	= {szName="B¸ V­¬ng Th­¬ng", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 1},
	[4]	= {szName="Thiªn Tµn §ao", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 1},
	[5]	= {szName="Thiªn Tµn §ao", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 2},
	[6]	= {szName="Thiªn Tµn §ao", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 3},
	[7]	= {szName="H¹ NhËt Cung", tbProp={6, 1, 2073, 1, 0, 0}, nCount = 1 },
	[8]	= {szName="H¹ NhËt Cung", tbProp={6, 1, 2073, 1, 0, 0}, nCount = 1},
};
tbBirthday0905_msg_tskgoal =
{
	500, 6,100,100,1,1,2,100,
};

function birthday0905_settask_message(nIdx)
	if (nIdx == 0) then
		return
	end
	
	if (GetLevel() < 120) then
		Say("DÞch Quan: §¹i hiÖp ch­a ®ñ ®iÒu kiÖn ®Ó nhËn nhiÖm vô nµy", 0);
		return
	end
	
	local ndate 	= tonumber(GetLocalDate("%y%m%d"));
	local ntskid 	= GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk);
	local ntskdate	= GetTask(tbBirthday0905.tbTask.tsk_msg_date+nIdx); 
	if (ntskid == 0) then
		if (ntskdate ~= ndate) then
			Say("DÞch Quan: §¹i hiÖp h·y cè g¾ng v­ît qua thö th¸ch nµy!", 0);
			SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, nIdx);
		else
			Say("DÞch Quan: §¹i hiÖp ®· hoµn thµnh ®ñ sè l­îng nhiÖm vô trong ngµy h«m nay råi. Ngµy sau h·y quay l¹i nhÐ.", 0);
		end
	else
		if (ntskid == nIdx) then
			Say("DÞch Quan: §¹i hiÖp ®· nhËn nhiÖm vô nµy råi.", 0);
		else
			Say("DÞch quan: Mét lÇn chØ  cã thÓ nhËn ®­îc 1 nhiÖm vô tÝn sø.", 0);
		end
	end
end

function birthday0905_gettask_message(nIdx)
	local ndate 	= tonumber(GetLocalDate("%y%m%d"));
	local ntskid 	= GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk);
	local ntskdate	= GetTask(tbBirthday0905.tbTask.tsk_msg_date+nIdx); 
	local ntskcount	= GetTask(tbBirthday0905.tbTask.tsk_msg_needcount);
	if (ntskid ~= nIdx) then
		Say("DÞch quan: Ng­¬i vÉn ch­a nhËn nhiÖm vô nµy.", 0);
		return
	end
	
	if (ntskcount < tbBirthday0905_msg_tskgoal[nIdx]) then
		Say("DÞch Quan: Ng­¬i kh«ng ®ñ søc m¹nh vµ lßng tin ®Ó v­ît qua thö th¸ch nµy sao?", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		Say("DÞch quan: §Ó b¶o ®¶m sù an toµn cho vËt phÈm, xin mêi h·y ®Ó hµnh trang thõa 10 « trèng.", 0);
		return
	end
	
	SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, 0);
	SetTask(tbBirthday0905.tbTask.tsk_msg_date + nIdx, ndate);
	SetTask(tbBirthday0905.tbTask.tsk_msg_needcount, 0);
	Say("DÞch Quan: Lµm tèt l¾m, ®©y lµ phÇn th­ëng xøng ®¸ng dµnh cho ®¹i hiÖp!", 0);
	tbAwardTemplet:GiveAwardByList(tbBirthday0905_msg_award[nIdx], "Hoat dong SNVLTK_Phan thuong nhiem vu tin su")
end

function birthday0905_cancel_message()
	local ntsk 	= tbBirthday0905.tbTask.tsk_msg_curtsk;
	if (GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk) == 0) then
		Say("DÞch quan: HiÖn t¹i ®¹i hiÖp vÉn ch­a nhËn nhiÖm vô mµ!", 0);
		return
	end
	SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, 0)
	SetTask(tbBirthday0905.tbTask.tsk_msg_needcount, 0);
	Say("DÞch quan: §¹i hiÖp ®· hñy bá thµnh c«ng nhiÖm vô hiÖn t¹i!", 0);
end