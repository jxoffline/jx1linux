-- 2007ÄêÐÂÄêºØ¿¨
-- ¹²4ÕÅ

Include("\\script\\lib\\string.lua")

--<playerbless> -- [ÊÕ¿¨ÈËÃû×Ö]
--<name> -- [·¢¿¨ÈËÃû×Ö]
tbMessage={
	["6,1,1346"] = "Chóc <color=red><playerbless><color> mét n¨m míi An Khang ThÞnh V­îng.<color=red><name><color>",
	["6,1,1347"] = "Chóc <color=red><playerbless><color> n¨m míi V¹n Sù Nh­ ý, lµm ¨n ph¸t tµi.<color=red><name><color>",
	["6,1,1348"] = "Chóc <color=red><playerbless><color> n¨m míi TÊn Tµi TÊn Léc, V¹n Sù Hanh Th«ng.<color=red><name><color>",
	["6,1,1349"] = "Chóc <color=red><playerbless><color> An Khang ThÞnh V­îng, gia quyÕn m¹nh kháe, lµm ¨n ph¸t ®¹t.<color=red><name><color>",
	}

ITEM_TASK_TEMP=26
UNIQUE_USE_TASK_TEMP=20
--±£Ö¤Ò»¸ö×£¸£Ã»³öÀ´Ç°²»ÄÜÊ¹ÓÃµÚ¶þ¸ö¡£

function main(sel)

	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("B¹n hiÖn ®ang ph¸t c©u chóc! Xin vui lßng ®îi mét l¸t!");
		return 1;
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
	
	Say("B¹n muèn nh©n dÞp TÕt göi ®Õn nh÷ng th©n h÷u nh÷ng lêi chóc tèt ®Ñp nhÊt kh«ng?", 2, "Muèn/sendWish","T¹m thêi kh«ng/wishCancel");
	return 1;
end

function sendWish()
		QueryWiseMan("BlessPlayerOnline", "BlessPlayerOffline", 1);
end

function BlessPlayerOnline(TargetName, nSelect, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	local ItemIdx = GetTaskTemp(ITEM_TASK_TEMP);
	local ItemGenre
	local DetailType
	local ParticularType
	
	ItemGenre,DetailType,ParticularType = GetItemProp(ItemIdx)
	local szItemkey = ItemGenre..","..DetailType..","..ParticularType;
	if (ItemIdx > 0 and tbMessage[szItemkey] ~= nil) then
		if (RemoveItemByIndex(ItemIdx) == 1) then
			local szMsg
			szMsg = replace(tbMessage[szItemkey],"<playerbless>",TargetName);
			szMsg = replace(szMsg,"<name>",GetName());
			AddGlobalCountNews(szMsg,1);
		else
			Msg2Player("Kh«ng t×m ®­îc thÎ! Xin thö l¹i 1 lÇn!.")
		end
	else
		Msg2Player("Sö dông thÎ thÊt b¹i, xin thö l¹i 1 lÇn.")
	end
	SetTaskTemp(ITEM_TASK_TEMP,0)
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function BlessPlayerOffline(TargetName, nP)
	Msg2Player("Ng­êi mµ b¹n muèn chóc phóc hiÖn kh«ng cã trªn m¹ng! §îi lóc sau thö l¹i!.");
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function wishCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end