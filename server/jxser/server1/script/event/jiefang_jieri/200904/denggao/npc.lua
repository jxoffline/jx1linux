Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\denggao.lua");


function main()
	jf0904_InitTaskctrl();
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < jf0904_act_dateS or nDate >= jf0904_act_dateE) then
		Say("Kh«ng thuéc trong thêi gian ho¹t ®éng.", 0);
		return
	end
	Say("Hoµng Liªn L·o L·o: Tõ 28-04-2009 ®Õn 31-05-2009 c¸c vŞ ®¹i hiÖp cã thÓ tham gia cuéc thi “Chinh phôc ®Ønh Fanxipan”. §Ønh Fanxipan cßn ®­îc gäi lµ “Nãc nhµ §«ng D­¬ng”,lµ ®Ønh nói cao nhÊt §«ng D­¬ng,con ®­êng chinh phôc ®Ønh Fanxipan rÊt khã kh¨n gian khæ,b»ng c¶ søc m¹nh vµ ı chİ míi cã thÓ thµnh c«ng.Ng­êi chiÕn th¾ng sÏ ®­îc phÇn th­ëng hÊp dÉn.§¹i hiÖp cã muèn tham dù cuéc chinh phôc nµy kh«ng?", 5,
		"Nép c¸c item ®Ó nhËn ®iÓm tİch lòy./item_exchange_score",
		"Xem sè ®iÓm ®· tİch lòy./view_score",
		"Xem danh s¸ch TOP 10 ng­êi ®iÓm cao nhÊt./view_top10_player",
		"NhËn th­ëng top 10 chinh phôc ®Ønh FanXiPan/get_award",
		"Ta chØ ®Õn xem!/");
end