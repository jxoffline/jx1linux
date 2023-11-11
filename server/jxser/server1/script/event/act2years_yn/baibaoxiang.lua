--2007Ô½ÄÏ¹úÇì»î¶¯
--2007-08-08
--by Ğ¡ÀË¶à¶à
--»ñÈ¡°Ù±¦Ïä

TB_Material = {
 --1.ÎïÆ·Ãû	2.ÊıÁ¿
	["0,10,5"] = "Ngùa cÊp 80",
	["4,490,1"] =	"M¶nh Tµng B¶o §å 1",
	["4,491,1"] =	"M¶nh Tµng B¶o §å 2",
	["4,492,1"] =	"M¶nh Tµng B¶o §å 3",
	["4,493,1"] =	"M¶nh Tµng B¶o §å 4",
	["4,494,1"] =	"M¶nh Tµng B¶o §å 5",
	["4,495,1"] =	"M¶nh Tµng B¶o §å 6",
	["4,496,1"] =	"M¶nh Tµng B¶o §å 7",
	["4,497,1"] =	"M¶nh Tµng B¶o §å 8",
	["4,498,1"] =	"M¶nh Tµng B¶o §å 9",
	["4,499,1"] =	"M¶nh Tµng B¶o §å 10",
	["4,500,1"] =	"M¶nh Tµng B¶o §å 11",
	["4,501,1"] =	"M¶nh Tµng B¶o §å 12",
}
function BaiBaoXiang_Give_UI()
	GiveItemUI("B¸ch b¶o r­¬ng","§iÒu kiÖn ®Ó ®æi B¸ch b¶o r­¬ng lµ ph¶i më réng r­¬ng thø hai, cïng víi mét con ngùa cÊp 80 bÊt kú vµ mét bé m¶nh Tµng b¶o ®å tõ 1 ®Õn 12.","BaiBaoXiang_Get","no",1)
end			

function BaiBaoXiang_Get(nItemCount)
	if CheckStoreBoxState(2) > 0 then
		Say("ThÇn bİ th­¬ng nh©n: §¹i hiÖp ®· cã B¸ch b¶o r­¬ng råi, cÇn g× ®Õn ta n÷a.",1,"§ång ı!/no");
		return 1;
	end
	if	CheckStoreBoxState(1) == 0 then
		Say("ThÇn bİ th­¬ng nh©n: §¹i hiÖp vÉn ch­a më r­¬ng thø hai, ta kh«ng thÓ trao ®æi B¸ch b¶o r­¬ng ®­îc. H·y ®Õn Ba L¨ng HuyÖn më r­¬ng thø hai tr­íc råi h·y t×m ta.",1,"§ång ı!/no");
		return 1;	
	end
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_Material do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end
	--¼ì²âÎïÆ·Æ¥Åä
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		
		local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
		
		
		if (TB_Material[szItemKey] == nil) then
				Say("ThÇn bİ th­¬ng nh©n: Kh«ng ®­îc råi, ta chØ cÇn 1 bé tµng b¶o ®å vµ 1 con ngùa cÊp 80, kh«ng cÇn nh÷ng thø kh¸c.",2,"Ha ha, ®Ó ta thö l¹i vËy./BaiBaoXiang_Give_UI","ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no");
				return
		end
		tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
	end
	
		for szkey, tb_item in TB_Material do
				if (tb_enhanceitem_count[szkey][1] ~= 1) then
					Say("ThÇn bİ th­¬ng nh©n: Kh«ng ®­îc råi, vËt phÈm ta yªu cÇu kh«ng vÉn ch­a ®ñ.",2,"Ha ha, ®Ó ta thö l¹i vËy./BaiBaoXiang_Give_UI","ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no");
				return
				end
		end
		
		--É¾²ÄÁÏ
		for i=1, nItemCount do
			local nIdx = GetGiveItemUnit(i)
			if (RemoveItemByIndex(nIdx) ~= 1) then
				WriteLog(format("[GuoQing2007_BaiBaoXiang]Date:%s\t Account:%s\t Name:%s\t DelItemFail:%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(GetGiveItemUnit(i)) ));
				return
			end
		end
		
		 --¸øÎïÆ·
		Msg2Player("B¹n ®· nhËn ®­îc <color=yellow>B¸ch b¶o r­¬ng<color>.");
		Say("ThÇn bİ th­¬ng nh©n: Xin chóc mõng, ®¹i hiÖp ®· nhËn ®­îc B¸ch b¶o r­¬ng.",1,"§ång ı!/no");
		OpenStoreBox(2);
		WriteLog(format("[GuoQing2007_BaiBaoXiang]\t Date:%s\t Account:%s\t Name:%s\t Effect:Get BaiBaoXiang",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName()));

end

function pack(...)
	return arg
end