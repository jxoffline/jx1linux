--Î÷±±ÄÏÇø ·ïÏè¸® Â·ÈË4´ä´ä¶Ô»°
Include("\\script\\event\\funv_jieri\\200803\\shenmixianhua.lua")--08¸¾Å®½Ú»î¶¯£¬08.4.1ºó¿ÉÉ¾³ı
function main(sel)
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate >= 8030800 and ndate <= 8033124 then
		funv_jieri_shenmi:xianhua()	---08¸¾Å®½Ú»î¶¯£¬08.4.1ºó¿ÉÉ¾³ı
	else
		Say("Tay cña chŞ Tó X¶o thËt khĞo lĞo, biÕt c¾t nh÷ng c¸i hoa giÊy ®Ñp nh­ vËy. Sau nµy lín lªn em còng häc c¾t giÊy.", 0)
	end
end;