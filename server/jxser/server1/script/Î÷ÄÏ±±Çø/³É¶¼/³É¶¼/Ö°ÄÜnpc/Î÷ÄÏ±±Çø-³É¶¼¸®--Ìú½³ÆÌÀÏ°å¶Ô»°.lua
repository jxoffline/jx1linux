--description: Î÷ÄÏ±±Çø ³É¶¼¸® Ìú½³ÆÌÀÏ°å ¶ëáÒÅÉ10¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/24
-- Update: Dan_Deng(2003-08-12)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Cã høng thó ®Õn ta lµm ®å ®Ö kh«ng? Cã chç ¨n chç ë ®µng hoµng!"

function main(sel)
	UTask_em = GetTask(1)
	if ((UTask_em == 10*256+20) and (HaveItem(18) == 1) and (HaveItem(19) == 1)) then
		Talk(5, "", "§¹i ca! Cã thÓ gióp ta hµn l¹i hai m¶nh g­¬ng ®ång nµy kh«ng?", "NÕu ®æi cho ng­êi kh¸c muèn kh«i phôc g­¬ng ®ång th× khã nh­ lªn trêi, nh­ng ®èi víi ta th× cã mét bÝ truyÒn ®Ó v¸ l¹i, ng­¬i t×m ®óng ng­êi råi ®ã, nh­ng mµ...", "CÇn bao nhiªu tiÒn ®Ó kh«i phôc g­¬ng ®ång?", "ChØ cÇn ng­¬i gióp ta t×m mét lo¹i kho¸ng cã tªn L­îng Ng©n Kho¸ng, ta sÏ gióp ng­¬i v¸ l¹i g­¬ng ®ång, nghe nãi kho¸ng nµy cã ë khu rõng bªn Thµnh T©y, nh­ng v× n¬i ®ã cã nhiÒu d· thó nªn kh«ng ai d¸m lui tíi.","§­îc råi, ta ®Ó hai m¶nh g­¬ng ë ®©y, lËp tøc ®i t×m L­îng Ng©n Kho¸ng.")
		DelItem(18)
		DelItem(19)
		SetTask(1, 10*256+40)
		AddNote("§Õn Thµnh §« t×m ®­îc thî rÌn, biÕt ®­îc cÇn cã L­îng Ng©n Kho¸ng ®Ó v¸ g­¬ng ®ång")
		Msg2Player("§Õn Thµnh §« t×m ®­îc thî rÌn, biÕt ®­îc cÇn cã L­îng Ng©n Kho¸ng ®Ó v¸ g­¬ng ®ång")
	elseif (UTask_em == 10*256+40) then
		if (HaveItem(118) == 1) then
			Talk(1, "", "Tèt! §· cã L­îng Ng©n Kho¸ng, ta sÏ gióp ng­¬i v¸ l¹i g­¬ng ®ång.")
			DelItem(118)
			AddEventItem(20)
			SetTask(1, 10*256+60)
			AddNote("Giao L­îng Ng©n Kho¸ng cho thî rÌn, lÊy ®­îc g­¬ng ®ång hoµn chØnh")
			Msg2Player("NhËn ®­îc ®­îc g­¬ng ®ång hoµn chØnh")
		else
			tiejiang_city("<dec><npc>Nghe nãi khu rõng ë phÝa t©y thµnh cã L­îng Ng©n Kho¸ng, kh«ng cã L­îng Kho¸ng th¹ch th× kh«ng thÓ söa ch÷a g­¬ng b»ng ®ång ®­îc.");
		end
	elseif ((UTask_em == 10*256+60) and (HaveItem(20) == 0)) then		-- ÈÎÎñÖÐ£¬Í­¾µ¶ªÁË
		AddEventItem(20)
		Msg2Player("Cã ®­îc g­¬ng ®ång ®· v¸ xong.")
		Talk(1,"","G­¬ng ®ång ng­¬i ®Ó ®©y kh«ng lÊy n÷a µh?")
	else
		tiejiang_city(TIEJIANG_DIALOG);
	end
end;

function yes()
Sale(13)  			--µ¯³ö½»Ò×¿ò
end;

