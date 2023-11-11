-- ÁúÃÅÕò¡¡Â·ÈË¡¡Ëï¶şÀÉ(¾ÈĞ¡¾êÈÎÎñ)
-- by£ºDan_Deng(2003-09-16)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(199) == 1 then
		allbrother_0801_FindNpcTaskDialog(199)
		return 0;
	end
	Uworld41 = GetByte(GetTask(41),1)
	if (GetLevel() >= 40) and (GetReputeLevel(GetRepute()) >= 5) then		-- ·ûºÏÈÎÎñÌõ¼ş
		if (Uworld41 == 0) then					-- ÈÎÎñ²»ÄÜÖ±½Ó´ÓËï¶şÀÉ´¦Æô¶¯
			if (random(0,1) == 0) then
				Talk(1,"","¤i!...")
			else
				Talk(1,"","T«n NhŞ Lang:............ ")
			end
		elseif (Uworld41 == 5) then			-- ÈÎÎñÕıÊ½Æô¶¯
			Talk(1,"U41_get","ChuyÖn g× khiÕn huynh phiÒn n·o vËy? VŞ ®¹i tÈu bªn c¹nh huynh sao khãc th­¬ng t©m vËy?")
		elseif (Uworld41 == 100) then			-- ÈÎÎñÍê³É
			Talk(2,"U41_prise","ThËt c¶m t¹ ©n nh©n! §¹i ©n ®¹i ®øc nµy ta sÏ kh«ng nbao giêcquªn! Trong nµy lµ linh d­îc cña mét vŞ s­ ThiÕu L©m ®· tÆng ta. Cã thÓ hç trî tiÒm n¨ng.Xin ®õng tõ chèi!","§· nh­ vËy, ta tõ chèi còng kh«ng ®­îc!")
		elseif (Uworld41 == 255) then			-- ÈÎÎñÍê³Éºó
			Talk(1,"","Lóc nµy ta kh«ng d¸m cho TiÓu Quyªn ra khái nhµ, nh­ng cø nh­ vËy th× kh«ng lµ c¸ch l©u dµi. Cã lÏ ph¶i g¶ nã th«i.")
		else											-- ÈÎÎñ½øĞĞÖĞ
			Talk(1,"","H«m qua, TiÓu Quyªn ®· bŞ §¹i v­¬ng cña Cæ ¢m §éng c­íp ®i, Ğp lµm ¸p tr¹i phu nh©n. B©y giê nãi kh«ng chõng th× mäi sù ®· qu¸ muén.! ")
		end
	else							-- ·ñÔò×ªÈ±Ê¡¶Ô»°
		Talk(1,"","Cã ng­êi nãi Long M«n TrÊn chóng ta chØ tßan trém c­íp, ®óng lµ kh«ng biÕt g×! Ta d¸m cuéc lµ kh«ng qu¸ hai ba n¨m n÷a, Long M«n TrÊn sÏ xuÊt hiÖn mét nh©n vËt ®Ønh thiªn lËp ®Şa")
	end
end;

function U41_get()
	Say("¤i! TiÓu Quyªn nhµ ta mÊy ngµy tr­íc bŞ §¹i v­¬ng Cæ ¢m Tr¹i ®Ó ı, nãi lµ muèn con bĞ lµm ¸p tr¹i phu nh©n g× ®ã. H«m qua ®· ®Õn c­íp ®i",2,"H¨ng h¸i ®i cøu ng­êi /U41_get_yes","An ñi vµi c©u cho xong /U41_get_no")
end

function U41_get_yes()
	Talk(2,"","§¹i V­¬ng g×? Gi÷a thanh thiªn b¹ch nhËt l¹i c­íp d©n n÷? Ta sÏ ®i cøu c« Êy vÒ!","Xin hiÖp kh¸ch gióp cho! Cæ ¢m Tr¹i n»m trong Cæ D­¬ng ®éng!")
	Uworld41 = random(1,15)*256*256 + 10			-- µÚÈı×Ö½ÚÎª£¨¶ş½øÖÆµÄ0001 - 1111£©£¬µÚÒ»×Ö½ÚÎª10
	SetTask(41,Uworld41)
	Msg2Player("TiÕp nhËn nhiÖm vô, mang TiÓu Quyªn trë vÒ tõ Cæ ¢m Tr¹i. ")
	AddNote("TiÕp nhËn nhiÖm vô, mang TiÓu Quyªn trë vÒ tõ Cæ ¢m Tr¹i. ")
end

function U41_prise()
	AddProp(1)											-- ½±Àø1µãÇ±ÄÜ
	add_repute = ReturnRepute(30,50,3)			-- ÉùÍû½±Àø£º×î´ó30µã£¬´Ó50¼¶ÆğÃ¿¼¶µİ¼õ3%
	AddRepute(add_repute)
	Uworld41 = SetByte(GetTask(41),1,255)
	SetTask(41,Uworld41)
	Ubonus86 = GetTask(86) + 1					-- ¼ÇÂ¼ÈÎÎñ½±ÀøÁË1µãÇ±ÄÜ(µÚÒ»×Ö½Ú+1)
	if (GetByte(Ubonus86,1) >= 250) then		-- Èİ´í£ºÉÏÏŞÎª250µã
		Ubonus86 = 250
	end
	SetTask(86,Ubonus86)
	AddNote("Cøu TiÓu Quyªn mang vÒ, nhiÖm vô hoµn thµnh. ")
	Msg2Player("<#> NhiÖm vô hoµn thµnh, danh väng cña b¹n t¨ng thªm "..add_repute.."<#> ®iÓm.")
	Talk(1,"KickOutSelf","Uèng xong linh d­îc, vËn c«ng nöa buæi. B¹n c¶m thÊy tiÒm n¨ng t¨ng thªm mét ®iÓm.")
end

function U41_get_no()
	Talk(2,"","ThËt qu¸ ®¸ng! Bän giÆc c­íp nµy thËt ch¼ng xem v­¬ng ph¸p ra g× mµ!","Thêi buæi nµy cßn cã ai nãi v­¬ng ph¸p sao?")
end

function no()
end
