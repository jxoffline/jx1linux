--Ô½ÄÏ½ÌÊ¦½Ú»î¶¯£¬¡°Ò»¡±¡¢¡°×Ö¡±¡¢¡°Îª¡±¡¢¡°Ê¦¡± µÀ¾ß¡£
--Í¨¹ýÕâÐ©µÀ¾ßÏòÊ¦¸¸ÔùËÍÀñÎï
if (not __H_WORDCARD__) then
	__H_WORDCARD__ = 1;

Include "/script/shitu/shitu.lua"
Include([[\script\event\teachersday06_v\head.lua]]);

function main(nItemIndex)
	if (vt06_shifu_isactive() == 0) then
		return 1;
	end;
	
	if (mastercheck() == 0) then --Èç¹ûÊ¦¸¸²»ÔÚÏß£¬Ôò·µ»Ø
		return 1;
	end;
	
	GiveItemUI("D©ng lÔ ¢n S­","Xin ®Æt 4 ch÷ “NhÊt”,”Tù”,”Vi”,”S­” vµo « thÝch hîp!", "sendgift", "no" );
	return 1;
end;

tab_Goods = {1289, 1290, 1291, 1292};

function sendgift(nCount)
	if (mastercheck() == 0) then --Èç¹ûÊ¦¸¸²»ÔÚÏß£¬Ôò·µ»Ø
		return 1;
	end;
	if (nCount ~= 4) then
		Say("Sè ch÷ b¹n ®Æt vµo ch­a ®óng!", 0);
		return
	end
	
	--¼ì²é¡°Ò»¡±¡¢¡°×Ö¡±¡¢¡°Îª¡±¡¢¡°Ê¦¡±
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i)
		if (GetItemStackCount(idxItem) > 1) then
			Say("Kh«ng thÓ ®Æt chång 2 ch÷!", 0);
			return
		end;
	end;
	local bFull = 1;
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
	
	au06_sort(tab_items); -- ÉýÐòÅÅÐò
	
	for i = 1, getn(tab_items) do
		if (tab_items[i] ~= tab_Goods[i]) then
			bFull = 0;
			break;
		end;
	end;
	
	if (0 == bFull) then
		Say("B¹n ®Æt kh«ng ®óng sè ch÷!", 0);
		return
	end

	
	--É¾³ý»­
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(idxItem);
	end
	
	--¸ø½±Àø
	prize(); 		--½±ÀøÍ½µÜ
	prizemaster();	--½±ÀøÊ¦¸¸
end;

--Í½µÜ½±Àø
function prize()
	AddItem(6, 1, 1295, 1, 0, 0, 0);
	Msg2Player("B¹n nhËn ®­îc <color=yellow>ThÎ Cao §å<color>, mang ®Õn ch­ëng m«n nhËn th­ëng!");
end;

--Ê¦¸¸½±Àø
function prizemaster()
	local masterName = GetMaster(GetName());
	if(not masterName) then
		return 0;
	end
	
	local masterIdx = SearchPlayer(masterName)
	if(not masterIdx or masterIdx <= 0) then
		return 0;
	end
	
	local OldPlayer = PlayerIndex;
	PlayerIndex = masterIdx;
	AddItem(6, 1, 1293, 1, 0, 0, 0);
	Msg2Player("B¹n nhËn ®uîc <color=yellow> ThÎ ¢n S­<color>, mang ®Õn ch­ëng m«n nhËn th­ëng!");
	PlayerIndex = OldPlayer;
end;

--¼ì²âÊ¦¸¸ÊÇ·ñÔÚÏß£¬ÊÇÔò·µ»Ø1
function mastercheck()
	local szName = GetName();
	local masterName = GetMaster(szName);
	if(not masterName or masterName == szName) then
		Say("VËt phÈm nµy dïng ®Ó b¶y tá lßng biÕt ¬n cña ®Ö tö víi s­ phô. B¹n hiÖn ch­a cã S­ phô!", 0);
		return 0;
	end
	
	local masterIdx = SearchPlayer(masterName)
	if(not masterIdx or masterIdx <= 0) then
		Say("S­ phô kh«ng trªn m¹ng, kh«ng thÓ d©ng lÔ!", 0);
		return 0;
	end
	return 1;
end;

function no()
	
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


end; --__H_WORDCARD__

