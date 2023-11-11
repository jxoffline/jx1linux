-- Created by tsh 2004-12-09
-- Ãµ¹å¿¨
-- »ñµÃËæ»úÁùÕÅ¿¨

szTitle="<#> H·y chän c©u chóc:"
Bless=
{
	"<#> Hy väng chóng ta sÏ b¸ch niªn giai l·o. Ta sÏ m·i m·i yªu nµng. Ng­êi yªu ¬i!",
--	"<#>ÄãµÄÑÛ¾¦Õ£Ò»ÏÂ,ÎÒ¾ÍËÀÈ¥,ÄãµÄÑÛ¾¦ÔÙÕ£Ò»ÏÂ,ÎÒ¾Í»î¹ıÀ´,ÄãµÄÑÛ¾¦²»Í£µØÕ£À´Õ£È¥,ÓÚÊÇÎÒ±ãËÀÈ¥»îÀ´!",
	"<#> Yªu em lµ duyªn trêi xu«i khiÕn, cïng em ®i suèt qu·ng ®­êng ®êi lµ niÒm h¹nh phóc nhÊt ®êi ta!",
	"<#> C¶m ¬n NguyÖt L·o ®· cho chóng ta ë bªn nhau, ta ph¶i tr©n träng mèi se duyªn nµy!",
	"<#> T«i yªu em, em lµ ng­êi duy nhÊt trong cuéc ®êi t«i.",
}

ITEM_TASK_TEMP=26
UNIQUE_USE_TASK_TEMP=20
--±£Ö¤Ò»¸ö×£¸£Ã»³öÀ´Ç°²»ÄÜÊ¹ÓÃµÚ¶ş¸ö¡£

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=138

FuncBless={}

function main(sel)
	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("B¹n hiÖn ®ang ph¸t c©u chóc! Xin vui lßng ®îi mét l¸t!");
		return 1
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);

	local nSelectCount = getn(Bless);
	for i=1, nSelectCount do
		FuncBless[i] = Bless[i].."/PlayerSelect"
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "Hñy bá /QueryWiseManCancel"

	Say(szTitle, getn(Bless), FuncBless);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
--ÏÈ²»É¾³ıÍæ¼ÒµÄ¿¨Æ¬£¬ÔÚÊµ¼Ê·¢ËÍÁË×£¸£Ê±ÔÙÉ¾£¨ÁÙÊ±¼ÇÂ¼ÏÂÀ´×°±¸±àºÅ£©
	return 1;

end

function PlayerSelect(nSelect)
	QueryWiseMan("BlessPlayerOnline", "BlessPlayerOffline", nSelect);
end

function BlessPlayerOnline(TargetName, nSelect, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	local ItemIdx
	ItemIdx = GetTaskTemp(ITEM_TASK_TEMP);
	local ItemGenre
	local DetailType
	local ParticularType
	local Level
	local Series
	local Luck
	ItemGenre,DetailType,ParticularType,Level,Series,Luck = GetItemProp(ItemIdx)
	if (ItemIdx > 0 and ItemGenre == ITEM_GENRE and DetailType == ITEM_DETAIL and ParticularType == ITEM_PARTI) then
		if (RemoveItemByIndex(ItemIdx) == 1) then
			local szMsg
			szMsg = GetName().."<#> nãi víi "..TargetName.."<#> "..Bless[nSelect + 1]
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

function BlessPlayerOffline(TargetName, nSelect)
	Msg2Player("Ng­êi mµ b¹n muèn chóc phóc hiÖn kh«ng cã trªn m¹ng! §îi lóc sau thö l¹i!.");
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function QueryWiseManCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end