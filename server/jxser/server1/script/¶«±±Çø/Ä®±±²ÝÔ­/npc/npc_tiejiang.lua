-- Ä®±±²İÔ­ Ö°ÄÜ Ìú½³
-- By: li_xin(2005-01-18)
--update:zhaowenyi(2005-02-20)Ôö¼Ó×ÏÉ«¼°»Æ½ğ×°±¸ÖıÔì

Include("\\script\\global\\×ÏÉ«¼°»Æ½ğ×°±¸ÖıÔì.lua")
function main(sel)
	--Say("ë tr¨m dÆm gÇn ®©y ai kh«ng biÕt ®Õn ®¹i danh ta, tõ ®ao, kiÕm, c«n, th­¬ng, kİch, m­êi t¸m mãn vò khİ ta ®Òu cã ®ñ, kh¸ch quan muèn mua mãn nµo? Cßn muèn chÕ t¹o Trang bŞ HuyÒn Tinh hay trang bŞ Hoµng Kim ®Òu ph¶i ®Õn t×m ta, nhÊt ®Şnh gi¸ c¶ ph¶i ch¨ng!", 3, "Giao dŞch/yes", "chÕ t¹o/onFoundry", "Nh©n tiÖn ghĞ qua th«i/no")
	Say("ë tr¨m dÆm gÇn ®©y ai kh«ng biÕt ®Õn ®¹i danh ta, tõ ®ao, kiÕm, c«n, th­¬ng, kİch, m­êi t¸m mãn vò khİ ta ®Òu cã ®ñ, kh¸ch quan muèn mua mãn nµo? Cßn muèn chÕ t¹o Trang bŞ HuyÒn Tinh hay trang bŞ Hoµng Kim ®Òu ph¶i ®Õn t×m ta, nhÊt ®Şnh gi¸ c¶ ph¶i ch¨ng!", 
			2, 
			"Giao dŞch/yes", 
--			"chÕ t¹o/onFoundry", 
			"Nh©n tiÖn ghĞ qua th«i/no")
end;

function yes()
	Sale(13);  				
end;

function no()
end;
