-- Created by firefox
-- ÈçÒâ¿¨
-- ¿ÉÒÔ×Ô¼º±à¼­×£¸£
IL("SETTING")
IL("LEAGUE");
Include("\\script\\lib\\gb_modulefuncs.lua")

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=1016
STSK_OTHERNAME = 3
TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}
function main(nIndex)
	if (gb_GetModule("ThiÖp th«ng b¸o chóc mõng mµu") == 1) then
		Say("§©y lµ 1 Nh­ ý ThiÕp. Tr­íc tiªn h·y nhËp ®èi t­îng cÇn chóc phóc råi sau ®ã míi nhËp néi dung cÇn chóc.", 
			2, 
			"B¾t ®Çu chóc phóc/want2bless",
			"L¸t n÷a míi gëi/OnCancel")
	end
	return 1
end

function want2bless(nIndex)
	AskClientForString("PlayerSelect", "", 1, 16, "Xin nhËp tªn ®èi ph­¬ng");
end

function PlayerSelect(rolename)
	if (ST_CheckTextFilter(rolename) ~= 1) then
		Say("Xin lçi! Tªn b¹n nhËp vµo cã ch÷ kh«ng hîp lÖ, h·y thö l¹i lÇn n÷a!", 0)
		return
	end
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(rolename, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin lçi! Tªn b¹n nhËp vµo cã ch÷ kh«ng hîp lÖ, h·y thö l¹i lÇn n÷a!", 0)
			return
		end
	end
	SetStringTask(STSK_OTHERNAME,rolename)
	AskClientForString("BlessPlayer", "", 1, 100, "Xin nhËp lêi chóc phóc vµo");
end

function BlessPlayer(szBless)
	if (ST_CheckTextFilter(szBless) ~= 1) then
		Say("Xin lçi! Tªn b¹n nhËp vµo cã ch÷ kh«ng hîp lÖ, h·y thö l¹i lÇn n÷a!", 0)
		return
	end
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szBless, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin lçi! Tªn b¹n nhËp vµo cã ch÷ kh«ng hîp lÖ, h·y thö l¹i lÇn n÷a!", 0)
			return
		end
	end
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg
		szMsg = GetName().."<#> nãi víi "..GetStringTask(STSK_OTHERNAME).."<#> "..szBless
		AddGlobalCountNews(szMsg,3);
	else
		Msg2Player("Kh«ng t×m ®­îc thÎ! Xin thö l¹i 1 lÇn!.")
	end
end

