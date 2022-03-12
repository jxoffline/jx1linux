Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");
Include("\\script\\lib\\awardtemplet.lua")
--Phong v©n lÖnh bµi - hoµn thµnh 1 lÇn nhiÖm vô thu thËp c«ng tr¹ng lÖnh - Modified by DinhHQ - 20110920
Include("\\script\\activitysys\\g_activity.lua")
tbjf0904_shuizei_exp =
{
	[1]	= {nExp = 30, 	nRate = 0.3},
	[2]	= {nExp = 30, 	nRate = 0.4},
	[3]	= {nExp = 30, 	nRate = 0.2},
	[4]	= {nExp = 30, 	nRate = 0.05},
	[5]	= {nExp = 30, 	nRate = 0.05},
};


function join_shuizei_act()
	if (0 == jf0904_shuizei_IsActtime()) then
		Say("Kh«ng ph¶i lµ trong thêi gian ho¹t ®éng.", 0);
		return
	end
	
	jf0904_InitTaskctrl();
	
	if(GetTask(jf0904_TSK_shuizei_GetTask) ~= 0) then
		Say("Ng­¬i ®· nhËn nhiÖm vô tiªu diÖt thñy tÆc råi.", 0);
		return
	end
	
	Say("ThuyÒn phu bê B¾c: D¹o nµy Thñy TÆc th­êng hoµnh hµnh b¸ ®¹o, c­íp bãc nhiÒu chiÕc thuyÒn qua l¹i 2 bê Phong L¨ng §é. Ng­¬i cã muèn thÕ thiªn hµnh ®¹o, tiªu diÖt nh÷ng tªn c­íp nµy kh«ng?", 2, "Ta ®· cho chóng 1 bµi häc ®Ých ®¸ng./join_shuizei_act_cf", "Ta ®ang rÊt bËn, khi kh¸c sÏ quay l¹i./OnCancel");
end

function join_shuizei_act_cf()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("§¹i hiÖp vÉn ch­a ®ñ cÊp 50 hoÆc vÉn ch­a nép thÎ, v× vËy kh«ng thÓ tham gia ho¹t ®éng", 0);
		return
	end

	if (GetTask(jf0904_TSK_shuizei_FulfilTaskTime) <= 0) then
		Say("H«m nay kh«ng thÓ nhËn thªm nhiÖm vô Tiªu diÖt thñy tÆc n÷a.", 0);
		return
	end
	
	Say("NhËn nhiÖm vô tiªu diÖt thñy tÆc thµnh c«ng!", 0);
	SetTask(jf0904_TSK_shuizei_FulfilTaskTime, GetTask(jf0904_TSK_shuizei_FulfilTaskTime) - 1);
	SetTask(jf0904_TSK_shuizei_GetTask, 1);
end

function fullfill_shuizei_act()
	if (0 == jf0904_shuizei_IsActtime()) then
		Say("Kh«ng ph¶i lµ trong thêi gian ho¹t ®éng.", 0);
		return
	end
	
	if (GetTask(jf0904_TSK_shuizei_GetTask) ~= 1) then
		Say("VÉn ch­a nhËn nhiÖm vô thñy tÆc, v× vËy kh«ng thÓ tr¶ nhiÖm vô ®­îc!", 0);
		return
	end
	
	give_shuizei_award_lingpai();
end


function give_shuizei_award_lingpai()
	GiveItemUI("Giao truy c«ng lÖnh", "Xin mêi bá truy c«ng lÖnh vµo « bªn d­íi, mçi lÇn chØ ®­îc bá 1 c¸i.", "submit_zhuigongling", "no")
end

function submit_zhuigongling(nCount)
	if (nCount ~= 1) then
		Say("Bá vµo sè l­îng kh«ng ®óng!", 2, "Xin lçi! Ta sÏ bá l¹i./give_shuizei_award_lingpai", "Ta sÏ quay l¹i sau/no")
		return 
	end
	local nItemIdx = GetGiveItemUnit(1);
	local ng, nd, np = GetItemProp(nItemIdx);
	if (ng == 6 and nd == 1 and np == 2015) then
		RemoveItemByIndex(nItemIdx);
		SetTask(jf0904_TSK_shuizei_GetTask, 0);
		Say("ThuyÒn phu: Chóc mõng ®¹i hiÖp! §©y lµ phÇn th­ëng xøng ®¸ng dµnh cho vÞ anh hïng.", 0);
		--Phong v©n lÖnh bµi - hoµn thµnh 1 lÇn nhiÖm vô thu thËp c«ng tr¹ng lÖnh - Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FLD_Collect_Item_VNG");
		give_shuizei_award_exp();
	else
		Say("VËt phÈm b¹n ®Ó vµo kh«ng chÝnh x¸c!", 2, "Xin lçi! Ta sÏ bá l¹i./give_shuizei_award_lingpai", "Ta sÏ quay l¹i sau/no");
	end
end


function give_shuizei_award_exp()
	local nstep = random(1, 100000);
	local ncurstep 	= 0;
	local naddedexp = 0;
	for i = 1, getn(tbjf0904_shuizei_exp) do
		if (ncurstep + tbjf0904_shuizei_exp[i].nRate * 100000 >= nstep) then
			naddedexp = tbjf0904_shuizei_exp[i].nExp;
			break;
		end
		ncurstep = ncurstep + tbjf0904_shuizei_exp[i].nRate * 100000;
	end
	
	AddOwnExp(naddedexp * 10000);
	
end

function jf0904_shuizei_IsActtime()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	return (nDate >= jf0904_act_dateS);
end

function about_shuizei()
	Say("LÔ quan: Ho¹t ®éng tiªu diÖt thñy tÆc b¾t ®Çu tõ ngµy 28/04/2009. Trong thêi gian ho¹t ®éng ®¹i hiÖp cã thÓ ®Õn 6 ®iÓm cña bê b¾c nam Phong L¨ng §é ®Ó lÜnh th­ëng.", 0);
end