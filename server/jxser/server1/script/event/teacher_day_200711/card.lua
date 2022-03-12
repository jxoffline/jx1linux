--ÇéÈË½ÚÀñºÐ
--²¢¹ö¶¯¹«¸æ×£¸£Óï
IL("SETTING")
TEMPSK_ITEM_PID = 192
TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}
tbTeacherDay200711CardBless = 
{
	[1588] = {szName = "ThiÖp chóc s­ phô", GreetingWord = "Dïng ®Ó göi lêi chóc ®Õn s­ phô", szBless = "<color=green>%s<color>  chóc s­ phô <color=green>%s<color> tiÒn tµi nh­ n­íc, lªn cÊp vÌo vÌo."},
	[1589] = {szName = "ThiÖp chóc ®Ö tö", GreetingWord = "Dïng ®Ó göi lêi chóc ®Õn ®Ö tö", szBless = "<color=green>%s<color> chóc ®Ö tö <color=green>%s<color> häc nghÖ tinh th«ng, r¹ng danh m«n ph¸i."},
	[1590] = {szName = "ThiÖp chóc h¶o h÷u", GreetingWord = "Dïng ®Ó göi lêi chóc ®Õn h¶o h÷u", szBless = "<color=green>%s<color> chóc h¶o h÷u <color=green>%s<color> c«ng thµnh danh to¹i, r­¬ng ®Çy nguyªn b¶o."},
	[1591] = {szName = "ThiÖp chóc cõu nh©n", GreetingWord = "Dïng ®Ó göi lêi chóc ®Õn cõu nh©n", szBless = "<color=green>%s<color> chóc cõu nh©n <color=green>%s<color> b¸n th©n bÊt to¹i, toµn th©n bÊt ®éng."},
	[1592] = {szName = "ThiÖp chóc bang héi", GreetingWord = "Dïng ®Ó göi lêi chóc ®Õn bang héi", szBless = "<color=green>%s<color> chóc bang héi <color=green>%s<color> tr¨m trËn tr¨m th¾ng, may m¾n Hoµng Kim."},
	[1593] = {szName = "ThiÖp chóc gi¸o chñ", GreetingWord = "Dïng ®Ó göi lêi chóc ®Õn gi¸o chñ", szBless = "<color=green>%s<color> chóc gi¸o chñ <color=green>%s<color> vâ c«ng c¸i thÕ, nhÊt thèng thiªn h¹."},
	[1594] = {szName = "ThiÖp chóc s­ muéi", GreetingWord = "Dïng ®Ó göi lêi chóc ®Õn s­ muéi", szBless = "<color=green>%s<color> chóc s­ muéi <color=green>%s<color> xinh x¾n dÔ th­¬ng, sím ngµy xuÊt gi¸."},
	[1595] = {szName = "ThiÖp chóc bang chñ", GreetingWord = "Dïng ®Ó göi lêi chóc ®Õn bang chñ", szBless = "<color=green>%s<color> chóc bang chñ <color=green>%s<color> thÇn c«ng hé thÓ, thiªn h¹ v« ®èi."},
	[1596] = {szName = "ThiÖp chóc s­ ®Ö", GreetingWord = "Dïng ®Ó göi lêi chóc ®Õn s­ ®Ö", szBless = "<color=green>%s<color> chóc s­ ®Ö <color=green>%s<color> th«ng minh lanh lîi, sím ngµy thµnh th©n."},
	[1597] = {szName = "ThiÖp chóc s­ huynh", GreetingWord = "Dïng ®Ó göi lêi chóc ®Õn s­ huynh", szBless = "<color=green>%s<color> chóc s­ huynh <color=green>%s<color> häc ®­îc thÇn c«ng, hµnh hiÖp tr­îng nghÜa."},
}

function TeacherDay200711_card_main(nParti)
	SetTaskTemp(TEMPSK_ITEM_PID, nParti);
	Say(tbTeacherDay200711CardBless[nParti].GreetingWord, 2,"Göi tÆng/TeacherDay200711_card_want2present", "Hñy bá /TeacherDay200711_card_OnCancel");
	return 1
end

function TeacherDay200711_card_want2present()
	AskClientForString("TeacherDay200711_card_PlayerSelect", "", 1, 16, "Xin nhËp tªn ®èi ph­¬ng");
end

function TeacherDay200711_card_PlayerSelect(szRoleName)
	if (ST_CheckTextFilter(szRoleName) ~= 1) then
		Say("Xin lçi! Tªn b¹n nhËp vµo cã ch÷ kh«ng hîp lÖ, h·y thö l¹i lÇn n÷a!", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szRoleName, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin lçi! Tªn b¹n nhËp vµo cã ch÷ kh«ng hîp lÖ, h·y thö l¹i lÇn n÷a!", 0)
			return
		end
	end
	local nParti = GetTaskTemp(TEMPSK_ITEM_PID)
	if (nParti == 0) then
		return
	end
	SetTaskTemp(TEMPSK_ITEM_PID,0)
	local szBless = format(tbTeacherDay200711CardBless[nParti].szBless,GetName(),szRoleName);	
	if (CalcEquiproomItemCount(6, 1, nParti, -1) >= 1) then
		ConsumeEquiproomItem(1, 6, 1, nParti, -1);
		AddGlobalNews(szBless,1);
		SetTask(TSK_TeacherDay200711_CardUseTime,GetCurServerTime());
	else
		Say(format("T×m kh«ng thÊy %s, h·y thö l¹i!",tbTeacherDay200711CardBless[nParti].szName), 0)
	end
end

function TeacherDay200711_card_BlessPlayerOnline(szBless)
	
end

function TeacherDay200711_card_OnCancel()
	SetTaskTemp(TEMPSK_ITEM_PID,0)
end