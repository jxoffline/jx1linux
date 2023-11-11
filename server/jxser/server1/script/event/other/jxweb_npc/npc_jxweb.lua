-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏÊÕ·Ñ°æ - JxWeb¹µÍ¨Ê¹Õß
-- ÎÄ¼şÃû¡¡£ºnpc_jxweb.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-04-13 15:24:37

-- ======================================================
IncludeLib("ITEM");
Include("\\script\\event\\other\\jxweb_npc\\jxweb_head.lua");		-- Í·ÎÄ¼ş

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local tb_Msg = {};
	
	if (n_date >= JxWeb_Start_Date and n_date <= JxWeb_End_Date) then
		tb_Msg = {"<dec><npc>".."HiÖn ®ang trong thêi gian diÔn ra ho¹t ®éng Open Beta cña JX WebC¸c vŞ ®¹i hiÖp nhanh ch©n tham gia vµo thÕ giíi cña JX Web ®Ó nhËn lÊy nhiÒu phÇn th­ëng hÊp dÉn."};
		tinsert(tb_Msg, "Ho¹t ®éng Hç trî t©n thñ/jxweb_take_bag_1");
		tinsert(tb_Msg, "Ho¹t ®éng §ua TOP phån vinh/jxweb_other_dec");
	else
		jxweb_other_dec()
		return 0;
	end
	
	tinsert(tb_Msg, "KÕt thóc ®èi tho¹i/OnCancel");
	
	CreateTaskSay(tb_Msg);
end

function OnCancel()
end


function jxweb_take_bag_1()
	CreateTaskSay({"<dec><npc>".."Ho¹t ®éng {{Hç trî t©n thñ}}:diÔn ra tõ ngµy 01-05-2009 ®Õn 24:00 22-05-2009. Trong thêi gian ho¹t ®éng, ngµy h«m tr­íc hoµn thµnh 1 nhiÖm vô thu thËp th× b¾t ®Çu 10h-24h ngµy h«m sau ®¹i hiÖp sÏ cã thÓ nhËn ®­îc {{Liªn T©m §an}}.", 
					format("NhËn %s/jxweb_take_bag_2", "Liªn T©m §¬n"), 
					"KÕt thóc ®èi tho¹i/OnCancel"});
end

function jxweb_take_bag_2()
	local ext_pointid = 5;
	local ext_value = GetExtPoint(ext_pointid);
	
	if (ext_value ~= 1) then
		CreateTaskSay({"<dec><npc>C¸c h¹ ch­a thÓ nhËn th­ëng lÇn nµy.", "KÕt thóc ®èi tho¹i/OnCancel"});
		return 0;
	end
	
	if (CalcFreeItemCellCount() < 2) then
		Talk(1, "", "Hµnh trang ph¶i cã hai « trèng.");
		return
	end
	
	PayExtPoint(ext_pointid, 1);
	
	local nIdx = AddItem(6,1,2023,1,1,0);
	ITEM_SetExpiredTime(nIdx, JxWeb_Item_Expire_Date);
	SyncItem(nIdx);
	SetItemBindState(nIdx, -2);
	
	local szMsg = format("Thu ®­îc 1 %s",GetItemName(nIdx))
	
	Msg2Player(szMsg);
	CreateTaskSay({"<dec><npc>"..szMsg, "§a t¹ huynh ".."/OnCancel"});
	
	WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
			GetLocalDate("%Y-%m-%d_%X"),
			GetName(),
			GetAccount(),
			szMsg	));
end


function jxweb_other_dec()
	CreateTaskSay({"<dec><npc>".."Ho¹t ®éng {{§ua Top ®iÓm phån vinh}}:diÔn ra tõ ngµy 01-05-2009 ®Õn 24:00 22-05-2009. 10 ng­êi cã ®iÓm phån vinh cao nhÊt sÏ cã thÓ nhËn ®­îc phÇn th­ëng hÊp dÉn.", 
					"KÕt thóc ®èi tho¹i/OnCancel"});
end
