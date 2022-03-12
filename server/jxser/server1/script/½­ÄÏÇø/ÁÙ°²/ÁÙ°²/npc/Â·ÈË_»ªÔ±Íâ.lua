-- ÁÙ°²¡¡Â·ÈË¡¡»ªÔ±Íâ
-- by£ºDan_Deng(2003-09-16)
-- edit by Ğ¡ÀË¶à¶à
Include("\\script\\event\\zhongqiu2007\\picture_head.lua")
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0709220000 and ndate < 0710312400 then
		SetTaskTemp(TSK_TEMP,1)
		Describe("Hoa viªn ngo¹i: Trung thu ®· ®Õn, chØ cÇn thu thËp ®ñ 6 <color=red>m¶nh tranh V©n Du<color> ®Ó hîp thµnh 1 bøc tranh hoµn chØnh mang ®Õn cho ta, ta sÏ tÆng l¹i ®¹i hiÖp 1 b¸nh <color=red>Cèng NguyÖt Phï Dung<color>.",2,"§æi b¸nh Cèng NguyÖt Phï Dung/makeItemUI","Nh©n tiÖn ghĞ qua th«i/NoChoice")
	else
		if (random(0,1) == 0) then
			Talk(1,"","Ta vèn kh«ng ph¶i lµ ng­êi trong chèn quan tr­êng nh­ng l¹i quen thuéc víi nhiÒu ng­êi næi danh trong Giang hå. ChØ cÇn cã tiÒn b¹c, viÖc g× mµ ch¼ng xong!")
		else
			Talk(1,"","Ai ai còng ®Òu muèn lµm quan v× ch­a hiÓu ®­îc hiÓm nguy lu«n r×nh rËp. Ch¼ng b»ng ®­îc ta, tiªu diªu tù t¹i")
		end
	end
end;
