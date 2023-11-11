--Î÷ÄÏ±±Çø ³É¶¼¸® ÑÃÃÅÃÅ¿Ú¸æÊ¾ÅÆ1
-- Update: Dan_Deng(2004-02-27) ÖØÐÂÉè¼ÆÈÎÎñ(³É¶¼É±Ò°Öí)
-- ¿ÉÖØ¸´ÈÎÎñ£¨ÖØ¸´ÖÜÆÚ£ºÏÖÊµÊ±¼ä1Ìì£©

function main(sel)
	Uworld11 = GetTask(11)
	Udate = tonumber(date("%Y%m%d"))						-- ÐèÒª×ª»»³ÉÊýÖµ²ÅÄÜÖ±½Ó½øÐÐ±È½Ï
	if (GetSex() == 0) then			-- ÄÐÅ®ÄÚÈÝ²»Í¬
		sexstr = "Tr¸ng sÜ "
	else
		sexstr = "N÷ hiÖp"
	end

	if (Uworld11 == 0) or ((Uworld11 > 255) and (Uworld11 < Udate)) then		-- ¿ÉÒÔ½ÓÈÎÎñ
		Say("Th«ng c¸o: GÇn ®©y c¸c vïng ngo¹i « bÞ heo rõng quÊy nhiÔu, ph¸ ho¹i mïa mµng, thËt lµ phiÒn phøc, ®· treo gi¶i 500 l¹ng b¹c ®Ó t×m dòng sÜ diÖt bÇy heo rõng nµy. HÔ giÕt ®­îc bän chóng th× ®Õn nha m«n l·nh th­ëng.",2,"B¶ng niªm yÕt /W11_get","Kh«ng mµng /no")
	elseif (Uworld11 <= 255) then		-- ÈÎÎñ½øÐÐÖÐ
		Talk(1,"","Nha dÞch phñ Thµnh §«: "..sexstr..GetName().."NhiÒu hiÖp sÜ h¨ng h¸i v× d©n trõ ho¹, ®em l¹i sù yªn b×nh cho d©n chóng, chuÈn bÞ ®ãn nh÷ng tr¸ng sÜ chiÕn th¾ng trë vÒ. ")
	else				-- Î´µ½ÖØ¸´Ê±¼ä
		Talk(1,"","Nha dÞch phñ Thµnh §«: "..sexstr..GetName().."V× d©n trõ häa, ai diÖt ®­îc mèi ho¹ heo rõng ë 4 vïng, bæn phñ th­ëng ngay 500 l¹ng vµ biÓu d­¬ng hµnh ®éng nghÜa hiÖp. Bè c¸o. ")
	end
end;

function W11_get()
	Talk(1,"","B¹n giËt lÊy b¶n th«ng c¸o, quyÕt t©m trõ h¹i gióp b¸ t¸nh!")
	SetTask(11,1)
end

function no()
end
