--by ÁÎÖ¾É½ [2006-09-12]
--2006ÖĞÇï»î¶¯Ö®»î¶¯¶ş£ºÑ°ÕÒÔÆÓÎÍ¼ºÍÏÉÎèÍ¼.
--Illustration: ÏÉÅ® -- fairy au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);

--ÏÉÅ®»î¶¯Èë¿Úº¯Êı
function au06_entrance_fairy()
	if (au06_IsPayed_player() == 0) then
		Say("ChØ cã ng­êi ch¬i n¹p thÎ míi cã thÓ tham gia ho¹t ®éng Trung thu", 0);
		return
	end;
	
	local tab_Content = {
		"Ta ®· thu thËp ®ñ c¸c m¶nh tranh./handup_picture",
		"ChØ ®Õn th¨m «ng chót th«i!/oncancel"
	};
	Describe("LiÔu Êt th­¬ng nh©n ®ang muèn t×m hai bøc danh häa H»ng Nga Tiªn Tö. 2 bøc tranh nµy ®· bŞ ph©n thµnh nhiÒu m¶nh t¶n l¹c kh¾p n¬i. Nghe nãi D· TÈu ®ang cã ®ñ c¸c m¶nh tranh ®ã. NÕu ng­¬i cã ®­îc nh÷ng m¶nh nµy, ta sÏ gióp ng­¬i ghĞp l¹i.", getn(tab_Content), tab_Content);
end;

--¸øÓè½çÃæ
function handup_picture()
	--Èç¹û¾­Ñé´ïµ½ÉÏÏŞ
	GiveItemUI("Giao tranh", "C¸ch ghĞp: xÕp theo ®óng vŞ trİ, dïng « ®Çu tiªn bªn tr¸i lµm chuÈn ®Ó ghĞp tranh.", "pic_award", "oncancel");
end;

tab_boxcheck = 
{{1207, 1208, 1209, 1210, 1211, 1212},
 {1213, 1214, 1215, 1216, 1217, 1218}
}
--ÅĞ¶ÏÊÇ·ñ¸ø½±Àø
function pic_award(nCount)
	local bCorrectItem = 0
	local idxItem = 0

	if (nCount ~= 6) then
		Describe("Mét bøc tranh cã s¸u m¶nh, ng­¬i ®em ®Õn ch­a ®ñ.", 1, "VËy ta xin c¸o tõ./oncancel");
		return
	end
	
	bFull = 1;
	idxItem = GetGiveItemUnit(1);
	local g, d, p = GetItemProp(idxItem);
	local nIndex = 0;
	if (p <= 1212 and p >= 1207 and d == 1 and g == 6) then
		nIndex = 1;
	elseif(p <= 1218 and p >= 1213 and d == 1 and g == 6) then
		nIndex = 2;
	end;
	if (0 == nIndex) then
		Describe("Nh÷ng m¶nh tranh cña ng­¬i kh«ng ®ñ ®Ó ghĞp, h·y t×m ®ñ råi quay vÒ gÆp ta.", 1, "VËy ta xin c¸o tõ./oncancel");
		return
	end

	tab_items = {};
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i)
		g, d, p = GetItemProp(idxItem)
		if (d ~= 1 or g ~= 6) then
			bFull = 0;
			break
		end
		tab_items[i] = p;
	end
	
	tab_items = au06_sort(tab_items); -- ÉıĞòÅÅĞò
	
	for i = 1, getn(tab_items) do
		if (tab_items[i] ~= tab_boxcheck[nIndex][i]) then
			bFull = 0;
			break;
		end;
	end;
	
	if (0 == bFull) then
		Describe("Nh÷ng m¶nh tranh cña ng­¬i kh«ng ®ñ ®Ó ghĞp, h·y t×m ®ñ råi quay vÒ gÆp ta.", 1, "VËy ta xin c¸o tõ./oncancel");
		return
	end
	
	--É¾³ı»­
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(idxItem);
	end
	
	--¸ø½±Àø
	local str = "1 <color=yellow>Th­¬ng Cæ LÖnh Bµi<color>";
	AddItem(6, 1, 1252, 1, 0, 0, 0);
	
	--¸øÌáÊ¾
	Describe("ThËt kh«ng ngê ng­¬i cã thÓ t×m ®ñ bé. §©y lµ <color=yellow>Th­¬ng Cæ LÖnh Bµi<color>, mang ®ñ 10 tÊm lÖnh bµi nµy ®Õn gÆp LiÔu Êt th­¬ng nh©n ë T­¬ng D­¬ng ®Ó ®æi lÊy b¸nh trung thu thÇn kú", 1, "NhËn phÇn th­ëng/oncancel")
	Msg2Player("B¹n ®¹t ®­îc"..str);
end;

function au06_sort(table)
	if (not table or type(table) ~= "table") then
		return {};
	end;
	
	local nCount = getn(table);
	for i = 2, nCount do	--²ÉÓÃÒ»¸öÃ°ÅİÅÅĞò
		for j = nCount, i, -1 do
			if (table[j] < table[j - 1]) then	--²ÉÓÃ½µÉıĞòÅÅĞò
				temptab = table[j];
				table[j] = table[j - 1];
				table[j - 1] = temptab;
			end;
		end;
	end;
	
	return table;
end

