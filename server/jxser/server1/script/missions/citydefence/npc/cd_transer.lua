----------------------------------------------------------------
--FileName:	transer.lua
--Creater:	firefox
--Date:		2005-
--Comment:	ÖÜÄ©»î¶¯£ºÎÀ¹úÕ½ÕùÖ®·é»ğÁ¬³Ç
--			¹¦ÄÜ£ºÕ½³¡ÄÚ³µ·ò£¬¸ºÔğ½«Íæ¼Ò´«ËÍµ½±¨Ãûµã
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\head.lua")
--TASKID_FIRE_ADDR
function main()
	Say("Xa phu: ChiÕn tranh ®ang kŞch liÖt! Sím biÕt ta ®· b¸o danh ®i tiÒn ph­¬ng råi! §óng råi! Ng­¬i cã chuyÖn g× vËy?", 2, "Ta cã chuyÖn quan träng b¸o víi T­íng qu©n! Xin mêi «ng ta vÒ hËu doanh!/sure2leave", "Kh«ng cã chi! Ta chØ ®Õn ®©y ch¬i./OnCancel" )
end

function sure2leave()
	--bt_getsignpos(camp)
	local mapid = SubWorldIdx2ID( SubWorld )
	if ( mapid == tbDEFENCE_MAPID[1] ) then
		camp = 1;
	else
		camp = 2;
	end
	SetLogoutRV(0);
	SetRevPos(tbDEFENCE_SIGNMAP[camp], random(3))
	NewWorld(bt_getsignpos(camp))
end

function OnCancel()
end