-- Created by tsh 2004-12-09
-- °ïÅÉ¿¨
-- »ñµÃËæ»úÁùÕÅ¿¨

szTitle="<#> H·y chän c©u chóc:"
Bless=
{
	"<#> §iÓm kinh nghiÖm ngµn ngµn v¹n, Kim Nguyªn B¶o, Tinh Hång Th¹ch bá ®Çy mét r­¬ng.",
	"<#> Kh«ng cã g× quý gi¸ h¬n t×nh b¹n h÷u trong bang ph¸i, c¸c anh chÞ em trong bang rÊt ®¸ng tr©n träng. ",
	"<#> Huynh ®Ö tû muéi lµ nh÷ng ng­¬i an ñi b¹n trong lóc ®au lßng, chia sÏ niÒm vui cïng b¹n trong lóc gÆt h¸i ®­îc thµnh c«ng.",
	"<#> Chóc huynh ®Ö tû muéi trong bang vui vÎ suèt ®êi, sung tóc c¶ n¨m. ",
	"<#> Chóc huynh ®Ö trong bang søc kháe dåi dµo, tiÒn v« nh­ n­íc.",
	"<#> Bang héi lµ n¬i che chë vµ gióp ®ì ta trªn b­íc ®­êng giang hå! Xin ch©n thµnh göi lêi c¶m ¬n vµ chóc søc kháe ®Õn tÊt c¶ c¸c huynh ®Ö tû muéi trong bang héi!",
}

ITEM_TASK_TEMP=25
UNIQUE_USE_TASK_TEMP=20
--±£Ö¤Ò»¸ö×£¸£Ã»³öÀ´Ç°²»ÄÜÊ¹ÓÃµÚ¶þ¸ö¡£

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=136

FuncBless={}

function main(sel)
	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("B¹n hiÖn ®ang ph¸t c©u chóc! Xin vui lßng ®îi mét l¸t!");
		return 1
	end

	local TongName
	local Result
	TongName, Result = GetTong();
	if (TongName == "") then
		Msg2Player("B¹n ch­a gia nhËp bang ph¸i, kh«ng thÓ sö dông 'ThiÖp Bang ph¸i'")
		SetTaskTemp(ITEM_TASK_TEMP,0);
		SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
		return 1;
	end

	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);

	local nSelectCount = getn(Bless);
	for i=1, nSelectCount do
		FuncBless[i] = Bless[i].."/PlayerSelect"
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "Hñy bá /QueryWiseManCancel"

	Say(szTitle, getn(Bless) + 1, FuncBless);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
--ÏÈ²»É¾³ýÍæ¼ÒµÄ¿¨Æ¬£¬ÔÚÊµ¼Ê·¢ËÍÁË×£¸£Ê±ÔÙÉ¾£¨ÁÙÊ±¼ÇÂ¼ÏÂÀ´×°±¸±àºÅ£©
	return 1;
end

function PlayerSelect(nSelect)
	local TongName
	local Result
	TongName, Result = GetTong();
	if (TongName == "") then
		Msg2Player("B¹n ch­a gia nhËp bang ph¸i, kh«ng thÓ sö dông 'ThiÖp Bang ph¸i'")
		SetTaskTemp(ITEM_TASK_TEMP,0);
		SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
		return
	end
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
			szMsg = GetName().."<#> nãi víi "..TongName.."<#> chóc Bang ph¸i"..Bless[nSelect + 1]
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

function QueryWiseManCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end