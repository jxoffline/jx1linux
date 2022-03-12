--ÇéÈË½ÚÀñºĞ
--2006Äê2ÔÂ14ÈÕ~2006Äê2ÔÂ21ÈÕ 50¼¶¼°ÒÔÉÏ ³åÖµÍæ¼Ò¿ÉÒÔ»ñµÃ
--ÏÀÊ¿Ö»ÄÜ¸øÏÀÅ®ÔùËÍ¡°ÇéÅ¨Ãµ¹å»¨¡±
--ÏÀÅ®Ö»ÄÜ¸øÏÀÊ¿ÔùËÍ¡°ĞÄÒâÇÉ¿ËÁ¦¡±
--ÒÔ±äÁ¿À´¼Æ
--²¢¹ö¶¯¹«¸æ×£¸£Óï
IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

ITEM_GENRE = 6
ITEM_DETAIL = 1
ITEM_PARTI = 1058
STSK_OTHERNAME = 4
TEMPSK_MAPID = 192
TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}

Bless=
{
	"<#> Méng nh­ giã xu©n, lµn giã qua ®i kh«ng ®Ó l¹i dÊu vÕt, chØ v× nçi nhí trong lßng, xin gëi mét lêi chóc phóc nång nµn.",
	"<#> Dï t­¬ng lai cã thÕ nµo ®i n÷a t«i còng sÏ yªu nµng cho ®Õn h¬i thë cuèi cïng.",
	"<#> Ngµy r¶nh rçi cã b¹n ®Õn hµn huyªn, dï cuéc sèng cã thÕ nµo t«i còng ®Òu thİch.",
	"<#> Con ®­êng t«i ®i cã b¹n ®ång hµnh dï ch«ng gai t«i còng cam lßng.",
	"<#> KÕt duyªn thµnh phu thª, m·i bªn nhau trän ®êi.  ",
	"<#> Chóc lÔ t×nh nh©n vui vÎ! CÇu mong nh÷ng ®iÒu tèt lµnh nhÊt sÏ ®Õn víi b¹n!!",
	--"<#>ÈÃÔÆÉÓÈ¥ÂúĞÄµÄ×£¸££¬µã×ºÄãÌğÃÛµÄÃÎ£¬Ô¸ÄãÓµÓĞÒ»¸öĞÒ¸£¿ìÀÖµÄĞÂÄê£¡",
}

function main()
if (gb_GetModule("LÔ vËt t×nh nh©n") == 1) then
	if (GetSex() == 0) then	--ÄĞ
		Say("<#>  Sö dông 'LÔ vËt t×nh nh©n' cã thÓ tÆng cho <color=yellow>'ng­êi Êy'<color> mét ®ãa <color=yellow>'Hoa hång t×nh ı'<color> ®ång thêi nãi lªn lêi chóc phóc cña b¹n.", 2, "<#> TÆng hoa hång/want2present", "<#> Hñy bá /OnCancel")
	elseif (GetSex() == 1) then	--Å®
		Say("<#>  Sö dông 'LÔ vËt t×nh nh©n' cã thÓ tÆng cho <color=yellow>'ng­êi Êy'<color> mét miÕng <color=yellow>'S« c« la t×nh yªu'<color> ®ång thêi nãi lªn lêi chóc phóc cña b¹n.", 2, "<#> TÆng S« c« la/want2present", "<#> Hñy bá /OnCancel")
	end
end
	return 1
end

function want2present()
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
	QueryWiseManForSB("BlessPlayerOnline", "BlessPlayerOffline", 1000, rolename);
end

function BlessPlayerOnline(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect)
	if (nSex == GetSex()) then
		if (nSex == 0) then
			Say("<#> 'Hoa hång t×nh ı' chØ cã thÓ tÆng cho hiÖp n÷ th«i!", 0)
		elseif (nSex == 1) then
			Say("<#> 'S« c« la t×nh yªu' chØ cã thÓ tÆng cho tr¸ng sÜ th«i!", 0)
		end
		return
	end
	SetTaskTemp(TEMPSK_MAPID, nSubWorldID)
	Say("<#> Xin nhËp lêi chóc phóc cña b¹n vµo hoÆc chän nh÷ng lêi chóc phóc cã s½n:", 3, "NhËp lêi chóc phóc vµo/inputmsg", "Chän lêi chóc phóc cã s½n/selectmsg", "Hñy bá /OnCancel")
end

function inputmsg()
	AskClientForString("BlessPlayer", "", 1, 100, "Xin nhËp lêi chóc phóc vµo");
end

function selectmsg()
	local tbOpp = {}
	for  i = 1, getn(Bless) do
		tbOpp[i] = Bless[i].."/BlessPlayer"
	end
	tbOpp[getn(tbOpp) + 1] = "Hñy bá /OnCancel"
	Say("<#> H·y chän c©u chóc:", getn(tbOpp), tbOpp)
end

function BlessPlayer(szBless)
	if (type(szBless) == "number") then
		szBless = Bless[szBless + 1]
	end
	if (ST_CheckTextFilter(szBless) ~= 1) then
		Say("Xin lçi! Lêi chóc phóc cña b¹n cã ch÷ kh«ng hîp lÖ, h·y thö l¹i lÇn n÷a!", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szBless, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin lçi! Tªn b¹n nhËp vµo cã ch÷ kh«ng hîp lÖ, h·y thö l¹i lÇn n÷a!", 0)
			return
		end
	end
	if (GetStringTask(STSK_OTHERNAME) == nil or GetStringTask(STSK_OTHERNAME) == "" or GetTaskTemp(TEMPSK_MAPID) == 0) then
		return
	end
	
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg = ""
		szMsg = GetName().." <#> nãi "..GetStringTask(STSK_OTHERNAME).." <#> r»ng:"..szBless
		AddGlobalNews(szMsg)
		local szParam = GetStringTask(STSK_OTHERNAME).." "..GetTaskTemp(TEMPSK_MAPID).." "..GetName()
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "valentine_bless_anywhere", szParam, "", "")
	else
		Say("<#> Kh«ng t×m ra lÔ vËt t×nh nh©n, xin h·y thö l¹i.", 0)
	end
end

function BlessPlayerOffline(TargetName)
	Say("<#> Xin lçi! "..TargetName.."HiÖn t¹i c« Êy (anh Êy) kh«ng cã trªn m¹ng.",0)
end

function OnCancel()
end