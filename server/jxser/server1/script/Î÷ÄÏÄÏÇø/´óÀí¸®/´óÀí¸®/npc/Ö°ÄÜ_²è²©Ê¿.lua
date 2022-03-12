-- ´óÀí¡¡Ö°ÄÜ¡¡²è²©Ê¿
-- by£ºDan_Deng(2003-09-16)

-- ¸÷¸ö¼¶±ğµÄÍ¬°é¾çÇéÈÎÎñÊµÌå´¦ÀíÎÄ¼ş
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");

function main()
	
	-- ¿ØÉßÈËÖ®ÃØµÄÈÎÎñ´¦Àí
	if taskProcess_002_02:doTaskEntity()~=0 then return end;
	if taskProcess_002_11:doTaskEntity()~=0 then return end;
	
	Talk(3,"","Trµ cña chóng ta næi tiÕng nhÊt V©n Nam, §¹i Lı chóng ta næi tiÕng lµ trµ H¹ Quan §µ Trµ.","H¹ Quan §µ Trµ h×nh thøc kh«ng gièng nhau, lo¹i lín nh­ chĞn c¬m, lo¹i nhá nh­ nót ¸o.","X­a cã c©u 'H¹ Quan Trµ, §µ Giang Thñy' H¹ Quan Trµ nhÊt ph¶i dïng n­íc s«ng pha míi ®óng. Trµ pha xong cã mµu vµng cam, mïi vŞ th¬m nång, trµ pha ®· l©u vÉn lµ cùc phÈm.")
end;
