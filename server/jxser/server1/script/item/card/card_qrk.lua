-- Created by tsh 2004-12-09
-- Ãµ¹å¿¨
-- »ñµÃËæ»úÁùÕÅ¿¨

szTitle="<#> H·y chän c©u chóc:"
Message=
{
	{"<#> Ng­êi cã nhí ta nh­ ta nhí ng­êi kh«ng?","<#> BÊt cø lóc nµo ng­êi nhí ®Õn ta th× còng lµ lóc ta ®ang nhí ®Õn ng­êi!"},
	{"<#> Ng­êi lµ lÏ sèng cña ta","<#> Khi ta nãi ng­êi lµ linh hån vµ lÏ sèng cña ta, xin ®õng kinh ng¹c, v× ng­êi kh«ng thÓ thiÕu trong cuéc ®êi ta."},
    {"<#> Ng­êi ®· th¾p s¸ng ngän ®Ìn trong ®ªm tuyÕt r¬i","<#> Bëi khi thÊy ng­êi, c¶m gi¸c Êm ¸p nh­ trong ®ªm tèi bçng nh×n thÊy ngän háa ®¨ng. ChÝnh ng­êi ®· th¾p lªn ngän löa Êm ¸p trong ®ªm!"},
    {"<#> Kh«ng thÓ rêi xa ng­êi trong cuéc ®êi nµy.","<#> 500 n¨m ta ®· nguyÖn cÇu tr­íc ®øc PhËt, mong ­íc ®­îc kÕt duyªn trÇn, cïng ng­êi trän ®êi nµy m·i kh«ng rêi xa."},
    {"<#> NguyÖn cïng ng­êi m·i m·i bªn nhau","<#> §õng nãi nh÷ng lêi ®­êng mËt, ®õng tÆng nhau nh÷ng mãn ®¸t tiÒn! C¸i em cÇn chÝnh lµ tr¸i tim thËt lßng cña anh!"},
    {"<#> Ng­êi vµ ta m·i kh¾ng khÝt bªn nhau, xin ®õng phô rÉy mèi l­¬ng duyªn!","<#> MÆc cho thêi gian yªu nhau bao l©u, mong ng­êi lu«n ©u yÕm bªn ta, xin ®õng phô rÉy mèi l­¬ng duyªn!"},
    {"<#> Tr­êng T­¬ng T­ ","<#> Thiªn tr­êng lé viÔn hån phi khæ, méng hån bÊt ®¸o quan s¬n nan. Tr­êng t­¬ng t­ xÐ n¸t t©m can."},
    {"<#> Tö Thanh B¶o KiÕm cña ta","<#> Tö Thanh B¶o KiÕm cña ta ph¸t ra tÝn hiÖu tu..tu. Hãa ra ý trung nh©n lµ ng­êi, cßn bá ®i ®©u?"},
    {"<#> Ng­êi ®· c­íp mÊt hån ta","<#> Ng­êi sao c­íp mÊt hån ta ®Ó ngµy ®ªm ta mang m·i h×nh bãng ng­êi!"},
}

ITEM_TASK_TEMP=26
UNIQUE_USE_TASK_TEMP=20
--±£Ö¤Ò»¸ö×£¸£Ã»³öÀ´Ç°²»ÄÜÊ¹ÓÃµÚ¶þ¸ö¡£

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=236

FuncBless={}

function main(sel)
	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("B¹n hiÖn ®ang ph¸t c©u chóc! Xin vui lßng ®îi mét l¸t!");
		return 1
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);

	local nSelectCount = getn(Message);
	for i=1, nSelectCount do
		FuncBless[i] = Message[i][1].."/PlayerSelect"
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "Hñy bá /QueryWiseManCancel"

	Say(szTitle, getn(FuncBless), FuncBless);
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
			szMsg = GetName().."<#> nãi víi "..TargetName.."<#> "..Message[nSelect + 1][2]
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