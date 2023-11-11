-- ´óÀí¡¡Â·ÈË¡¡³µÀÏÌ«
-- by£ºDan_Deng(2003-09-16)
Include("\\script\\event\\funv_jieri\\200803\\shenmixianhua.lua")--08¸¾Å®½Ú»î¶¯£¬08.4.1ºó¿ÉÉ¾³ı
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate >= 8030800 and ndate <= 8033124 then
		funv_jieri_shenmi:xianhua()	---08¸¾Å®½Ú»î¶¯£¬08.4.1ºó¿ÉÉ¾³ı
	else	
		Talk(1,"","Ta n¨m nay ®· h¬n 80 tuæi råi, m¾t mê tai yÕu, r¨ng cá còng rông c¶ råi, ¨n uèng kh«ng dÔ dµng n÷a.")
	end
end;
