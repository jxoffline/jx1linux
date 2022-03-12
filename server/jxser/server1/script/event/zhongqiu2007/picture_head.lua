--ÖÐÇï2007»î¶¯ ÂÌ¶¹ÔÂ±ý
--by Ð¡ÀË¶à¶à
--2007-09-07

--¸øÓè½çÃæ
TSK_TEMP = 51					--Àà±ðÁÙÊ±±äÁ¿
function makeItemUI()
	--Èç¹û¾­Ñé´ïµ½ÉÏÏÞ
	GiveItemUI("Giao tranh", "C¸ch ghÐp: xÕp theo ®óng vÞ trÝ, dïng « ®Çu tiªn bªn tr¸i lµm chuÈn ®Ó ghÐp tranh.", "pic_award", "oncancel");
end;

tab_boxcheck = 
{	
	{1207, 1208, 1209, 1210, 1211, 1212},
	{1213, 1214, 1215, 1216, 1217, 1218}
}
--ÅÐ¶ÏÊÇ·ñ¸ø½±Àø
function pic_award(nCount)
	local bCorrectItem = 0
	local idxItem = 0

	if (nCount ~= 6) then
		Describe("Viªn ngo¹i: Bøc tranh gåm cã 6 m¶nh tranh, ng­¬i giao ch­a ®ñ sè.", 1, "VËy ta xin c¸o tõ./oncancel");
		return
	end
	
	bFull = 1;
	idxItem = GetGiveItemUnit(1);
	local g, d, p = GetItemProp(idxItem);
	local nIndex = 0;
	local nsign = GetTaskTemp(TSK_TEMP)
	local nitem = 0
	if nsign == 1 then 
		if (p <= 1212 and p >= 1207 and d == 1 and g == 6) then
			nIndex = 1;
			nitem = 128;
		end
	elseif nsign == 2 then
		if(p <= 1218 and p >= 1213 and d == 1 and g == 6) then
			nIndex = 2;
			nitem = 127;
		end
	end
	if (0 == nIndex) then
		Describe("Viªn ngo¹i: Nh÷ng m¶nh tranh nµy kh«ng thÓ ghÐp thµnh 1 bøc tranh hoµn chØnh, h·y t×m ®óng c¸c m¶nh ghÐp råi h·y ®Õn t×m ta.", 1, "VËy ta xin c¸o tõ./oncancel");
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
	
	tab_items = au06_sort(tab_items); -- ÉýÐòÅÅÐò
	
	for i = 1, getn(tab_items) do
		if (tab_items[i] ~= tab_boxcheck[nIndex][i]) then
			bFull = 0;
			break;
		end;
	end;
	
	if (0 == bFull) then
		Describe("Viªn ngo¹i: Nh÷ng m¶nh tranh nµy kh«ng thÓ ghÐp thµnh 1 bøc tranh hoµn chØnh, h·y t×m ®óng c¸c m¶nh ghÐp råi h·y ®Õn t×m ta.", 1, "VËy ta xin c¸o tõ./oncancel");
		return
	end
	
	--É¾³ý»­
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(idxItem);
	end
	
	--¸ø½±Àø
	local nidx = AddItem(6,1,nitem,1,0,0)
	Msg2Player(format("B¹n nhËn ®­îc 1 <color=yellow>%s<color>",GetItemName(nidx)));
	WriteLog(format("[zhongqiu2007_qiannenyuebing]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	SetTaskTemp(9,0)
	SetTaskTemp(10,0)
end;

function au06_sort(table)
	if (not table or type(table) ~= "table") then
		return {};
	end;
	
	local nCount = getn(table);
	for i = 2, nCount do	--²ÉÓÃÒ»¸öÃ°ÅÝÅÅÐò
		for j = nCount, i, -1 do
			if (table[j] < table[j - 1]) then	--²ÉÓÃ½µÉýÐòÅÅÐò
				temptab = table[j];
				table[j] = table[j - 1];
				table[j - 1] = temptab;
			end;
		end;
	end;
	
	return table;
end

