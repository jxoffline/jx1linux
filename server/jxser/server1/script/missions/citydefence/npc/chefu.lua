----------------------------------------------------------------
--FileName:	chefu.lua
--Creater:	firefox
--Date:		2005-
--Comment:	ÖÜÄ©»î¶¯£ºÎÀ¹úÕ½ÕùÖ®·é»ðÁ¬³Ç
--			¹¦ÄÜ£º±¨Ãûµã³µ·ò£¬¿ÉÒÔÈ¥Íù7´ó³ÇÊÐ
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\headinfo.lua")
function main()
	Say("Xa phu: ChiÕn tranh liªn miªn, l·o b¸ t¸nh sèng rÊt c¬ cùc! Kh«ng biÕt lóc nµo míi ngãc ®Çu ®­îc? Ng­¬i muèn ®Õn thµnh nµo?", 8, tbDEFENCE_RETURN[1][3].."/#cd_transtocity(1)", tbDEFENCE_RETURN[11][3].."/#cd_transtocity(11)", tbDEFENCE_RETURN[37][3].."/#cd_transtocity(37)", tbDEFENCE_RETURN[78][3].."/#cd_transtocity(78)", tbDEFENCE_RETURN[80][3].."/#cd_transtocity(80)", tbDEFENCE_RETURN[162][3].."/#cd_transtocity(162)", tbDEFENCE_RETURN[176][3].."/#cd_transtocity(176)", "Kh«ng cÇn/OnCancel" )
end

function OnCancel()
end

function cd_transtocity(cityid)
	Msg2Player("Ngåi yªn! ChuÈn bÞ khëi hµnh!"..tbDEFENCE_RETURN[cityid][3])
	NewWorld( cityid, tbDEFENCE_RETURN[cityid][1], tbDEFENCE_RETURN[cityid][2] )
end