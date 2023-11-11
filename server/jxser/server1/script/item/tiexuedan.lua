IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\task\\system\\task_string.lua")

function main()
	GiveItemUI("Söa trang bŞ b¹ch kim", "H·y bá trang bŞ b¹ch kim cÇn söa vµo", "repair_platina", "OnCancel", 1);
	return 1;
end

function repair_platina(nCount)

	if nCount ~= 1 then
		CreateTaskSay({"Sè l­îng vËt phÈm bá vµo kh«ng ®óng yªu cÇu", "Thµnh thËt xin lçi, ta sÏ s¾p xÕp l¹i/main", "ThËt ng¹i qu¸, ta sÏ quay l¹i sau./onCancel"});
		return
	end
	
	local nItemIndex	= GetGiveItemUnit(1)
	local nQuality		= GetItemQuality(nItemIndex);			--Æ·ÖÊ
	
	if (nQuality ~= 4) then
		CreateTaskSay({"H·y bá trang bŞ b¹ch kim cÇn söa.", "Thµnh thËt xin lçi, ta sÏ s¾p xÕp l¹i/main", "ThËt ng¹i qu¸, ta sÏ quay l¹i sau./onCancel"});
		return
	end

	
	if (GetPlatinaLevel(nItemIndex) < 6) then
		CreateTaskSay({"ChØ cã thÓ söa trang bŞ b¹ch kim +6 trë lªn.", "Thµnh thËt xin lçi, ta sÏ s¾p xÕp l¹i/main", "ThËt ng¹i qu¸, ta sÏ quay l¹i sau./onCancel"});
		return
	end
	
	if (GetCurDurability(nItemIndex) == GetMaxDurability(nItemIndex)) then
		CreateTaskSay({"Trang b?nµy c?®ñ ®é bÒn lín nhÊt råi, kh«ng cÇn ph¶i söa thªm", "Thµnh thËt xin lçi, ta sÏ s¾p xÕp l¹i/main", "ThËt ng¹i qu¸, ta sÏ quay l¹i sau./onCancel"});
		return
	end
		
	if (ConsumeItem(3, 1, 6, 1, 2163, 1) ~= 1) then	-- É¾³ı±³°üÖĞµÄÌúÑªµ¤
		WriteLog("[ThiÕt huyÕt ®¬n söa  ®é bÒn hiÖn t¹i]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\tXãa thiÕt huyÕt ®¬n thÊt b¹i");
		return
	end
	
	Msg2Player("Söa ch÷a thµnh c«ng!");
	
	SetCurDurability(nItemIndex, GetMaxDurability(nItemIndex));
end