-- Created by Danielsun 2006-12-07
-- ×£¸£¿¨
-- Ò»¹²ÓÐÁùÕÅ×£¸£¿¨,Ã¿ÕÅµÄ×£¸£Óï¶¼²»Í¬.

Include("\\script\\lib\\string.lua")

--<playerbless> -- [ÊÕ¿¨ÈËÃû×Ö]
--<name> -- [·¢¿¨ÈËÃû×Ö]
tbMessage={
	["6,1,1328"] = "Chuc <color=red><playerbless><color> mot Giang Sinh va Nam moi vui ve <color=red><name><color>",
	["6,1,1329"] = "<color=red><playerbless><color> than yeu, chuc nang mot giang sinh vui ve <color=red><name><color>",
	["6,1,1330"] = "<color=red><playerbless><color> than yeu, chuc chang mot giang sinh vui ve <color=red><name><color>",
	["6,1,1331"] = "Voi tat ca tam long, ta xin chuc cho <color=red><playerbless><color> mot Giang sinh vui ve. <color=red><name><color>",
	["6,1,1332"] = "Voi tat ca tam long, ta xin chuc cho <color=red><playerbless><color> mot nam moi vui ve va hanh phuc <color=red><name><color>",
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
	
	Say("B¹n cã muèn gëi thiÖp chóc gi¸ng sinh cho b¹n bÌ kh«ng?", 2, "Muèn/sendWish","T¹m thêi kh«ng/wishCancel");
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