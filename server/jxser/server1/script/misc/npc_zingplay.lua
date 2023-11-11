-- ÍæZingPlay»ñµÃ½±Æ·
-- ÁìÈ¡½±ÀøNPC¡ª¡ª¡ªZingPlayÊ¹Õß

Include("\\script\\task\\system\\task_string.lua");	-- ¶Ô»°´¦ÀíÍ·ÎÄ¼þ

-- COMMON ³£Á¿ --
ZingPlay_Start_Date	= 20081018;		-- »î¶¯ÆðÊ¼Ê±¼ä
ZingPlay_End_Date	= 20081102;		-- ÁìÈ¡ÏÞÆÚ

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local tb_Msg = {"<dec><npc>Tõ 18-10-2008 ®Õn 31-10-2008, TÊt c¶ nh©n sÜ vâ l©m khi tham gia c¸c trß ch¬i cña ZingPlay, khi ®ñ c¸c yªu cÇn thiÕt (tham kh¶o t¹i trang chñ cña ZingPlay) cã thÓ ®Õn gÆp Sø Gi¶ ZingPlay ®Ó nhËn phÇn th­ëng Bao L× X× ZingPlay. Thêi gian nhËn th­ëng ®Õn hÕt ngµy 02-11-2008."};
	
	if (n_date >= ZingPlay_Start_Date and n_date <= ZingPlay_End_Date) then
		tinsert(tb_Msg, "Ta ®Õn nhËn bao l× x× ZingPlay./take_zingplay_bag");
	end
	
	tinsert(tb_Msg, "KÕt thóc ®èi tho¹i/OnCancel");
	
	CreateTaskSay(tb_Msg);
end

function OnCancel()
end

function take_zingplay_bag()
	local ext_pointid = 4;
	local ext_value = GetExtPoint(ext_pointid);
	
	if (ext_value ~= 1) then
		CreateTaskSay({"<dec><npc>C¸c h¹ ch­a thÓ nhËn th­ëng lÇn nµy.", "KÕt thóc ®èi tho¹i/OnCancel"});
		return 0;
	end
	
	PayExtPoint(ext_pointid, 1);
	
	local nIdx = AddItem(6,1,1826,1,1,0);
	local szMsg = format("Thu ®­îc 1 %s",GetItemName(nIdx))
	
	Msg2Player(szMsg);
	
	WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
			GetLocalDate("%Y-%m-%d_%X"),
			GetName(),
			GetAccount(),
			szMsg	));
end
