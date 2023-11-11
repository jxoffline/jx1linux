-- Created by tsh 2004-12-09
-- ×£¸£¿¨
-- »ñµÃËæ»úÁùÕÅ¿¨

szTitle="<#> H·y chän c©u chóc:"
Bless=
{
	"<#> Mét ngµy nµo ®ã nÕu b¹n thÊy buån t«i kh«ng thÓ lµm cho b¹n vui nh­ng Ýt ra cã thÓ khãc cïng b¹n.",
	"<#> NguþÖn nh÷ng ®iÒu tèt lµnh, t×nh th­¬ng yªu mäi ng­êi, ng«i sao may m¾n lu«n lu«n dµnh cho b¹n.",
	"<#> C¶m ¬n b¹n trong lóc trèng v¾ng ®Õn bªn t«i, h¹nh phóc biÕt bao!",
	"<#> Sù xuÊt hiÖn cña b¹n lµ niÒm vui lín nhÊt trong ®êi t«i, chóc b¹n lu«n lu«n vui vÎ.",
}

ITEM_TASK_TEMP=24
UNIQUE_USE_TASK_TEMP=20
--±£Ö¤Ò»¸ö×£¸£Ã»³öÀ´Ç°²»ÄÜÊ¹ÓÃµÚ¶þ¸ö¡£

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=135

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

	Say(szTitle, nSelectCount, FuncBless);

	SetTaskTemp(ITEM_TASK_TEMP,sel);
--ÏÈ²»É¾³ýÍæ¼ÒµÄ¿¨Æ¬£¬ÔÚÊµ¼Ê·¢ËÍÁË×£¸£Ê±ÔÙÉ¾£¨ÁÙÊ±¼ÇÂ¼ÏÂÀ´×°±¸±àºÅ£©
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