-- Created by tsh 2004-12-09
-- ÐÂÄê¿¨
-- »ñµÃËæ»úÁùÕÅ¿¨

szTitle="<#> H·y chän c©u chóc:"
Bless=
{
	"<#> NguyÖn nh÷ng lêi chóc tèt ®Ñp nhÊt theo giã bay ®Õn bªn b¹n 'Chóc b¹n n¨m míi vui vÎ'!",
	"<#> Mõng n¨m míi, chóc b¹n søc kháe dåi dµo, v¹n sù nh­ ý.",
	"<#> Chóc b¹n n¨m míi vui vÎ, ph¸t tµi ph¸t léc, an khang th­êng l¹c.",
	"<#> Kh«ng biÕt nãi g× h¬n ngoµi lêi chóc b¹n cã ®­îc mét n¨m míi vui vÎ trµn ®Çy h¹nh phóc bªn ng­êi th©n gia ®×nh.",
	"<#> Ngµn lêi nãi trong lßng kh«ng biÕt nãi g× h¬n 'Chóc b¹n n¨m míi vui vÎ'.",
	"<#> N¨m míi chóc b¹n lu«n vui vÎ h¹nh phóc!",
}

ITEM_TASK_TEMP=23
UNIQUE_USE_TASK_TEMP=20
--±£Ö¤Ò»¸ö×£¸£Ã»³öÀ´Ç°²»ÄÜÊ¹ÓÃµÚ¶þ¸ö¡£

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=140

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