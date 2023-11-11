--ÁúÈª´å Ö°ÄÜ ÔÓ»õµêÀÏ°å
--ÁúÈª´åĞÂÊÖÈÎÎñ£ººóµùºÃ²»ºÃ¡¢Ñô´º°×Ñ©¸ş
-- By: Dan_Deng(2003-09-03)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\itemhead.lua")
Include("\\script\\global\\global_zahuodian.lua");


function main(sel)
	UTask_world18 = GetTask(18)
	if (UTask_world18 == 0) then 		--¡°ºóµùºÃ²»ºÃ¡±ÈÎÎñÆô¶¯
		Talk(4,"W18_get","Çy! ThËt lµ kh«ng may m¾n!","¤ng l¹i gÆp ph¶i chuyÖn phiÒn phøc n÷a ­?","Nãi thËt xÊu hæ! N¨m råi ta c­íi mét ng­êi vî! C« ta lµ ng­êi t¸i gi¸, dÉn theo mét ®øa con. Çy! Ta thËt kh«ng hiÓu lµ ®øa bĞ nã muèn g×. Nh­ng biÕt lµ nã rÊt ghĞt ta ","Cã lÏ t¹i v× «ng qu¸ mÆc c¶m th«i! Cø hái th¼ng ngay ®øa bĞ xem nã muèn g× cã tèt h¬n kh«ng ")
	elseif (UTask_world18 == 6) then		-- ¡°ºóµùºÃ²»ºÃ¡±ÈÎÎñÍê³É
		Talk(1,"W18_prise","Ta ®· hái qua ®øa nhá ®ã råi! Nã tuyÖt ®èi kh«ng hÒ ghĞt «ng ®©u! ¤ng cø yªn t©m ®i!")
	elseif (GetTask(20) == 5) and (HaveItem(231) == 0) then		-- ¡°Ñô´º°×Ñ©¸ş¡±ÈÎÎñ½øĞĞÖĞ²¢ÇÒÃ»ÓĞ´ËµÀ¾ß
		if (UTask_world18 == 10) then			-- ÒÑÍê³É¡°ºóµùºÃ²»ºÃ¡±ÈÎÎñ
			Talk(1,"","D­¬ng Xu©n Linh Chi? Lo¹i linh chi nµy hiÖn nay rÊt İt thÊy. Nh­ng mµ ë ®©y ta vÉn cßn mét İt. Ng­¬i gióp cho ta mét chuyÖn nµy th× ta sÏ tÆng hÕt sè Linh Chi ®ã cho ng­¬i ")
			AddEventItem(231)
			AddNote("§­îc «ng chñ t¹p hãa tÆng cho D­¬ng Xu©n Linh Chi")
			Msg2Player("§­îc «ng chñ t¹p hãa tÆng cho D­¬ng Xu©n Linh Chi")
		else
			local buttons = store_sel_village_extend();
			tinsert(buttons, 1, "Mua D­¬ng Xu©n Linh Chi/W20_buy");
			Say("D­¬ng Xu©n Linh Chi? Lo¹i linh chi nµy hiÖn nay rÊt İt thÊy. Nh­ng mµ ë ®©y ta vÉn cßn mét İt. ChØ cÇn cã 500 l¹ng b¹c",getn(buttons),buttons);
		end
	else
		local buttons = store_sel_village_extend();
		Say("Ta tr­íc ®©y vèn lµ mét th­¬ng nh©n, kÕt giao rÊt nhiÒu b»ng h÷u. Sau ®ã x¶y ra ®¹i lo¹n, ®Õn ®©u còng thÊy chiÕn tranh. Nªn ta ®µnh an ®Şnh n¬i nµy vËy",getn(buttons),buttons)
	end
end;

function W18_get()
	local buttons = store_sel_village_extend();
	tinsert(buttons, 1, "Th«i vËy ®Ó ta gióp «ng hái cho/W18_get_yes");
	Say("Nh­ng mµ….Nh­ng mµ ta vÉn lµ ng­êi thÊt b¹i! Cã mét ®øa trÎ th«i mµ còng kh«ng thÓ lÊy lßng ®­îc nã ",getn(buttons),buttons)
end

function W18_get_yes()
	SetTask(18,3)
	Talk(1,"","VËy th× tèt qu¸! Ta sÏ ë ®©y ®îi tin vui cña ng­¬i nhĞ!")
	AddNote("NhËn nhiÖm vô: gióp «ng chñ ®i hái t©m ı cña Khæng HiÓu")
	Msg2Player("NhËn nhiÖm vô: gióp «ng chñ ®i hái t©m ı cña Khæng HiÓu")
end

function W18_prise()
	Talk(1,"","VËy th× tèt qu¸! Ta thËt c¶m rÊt c¶m ¬n ng­¬i!ë ®©y cã chót lßng thµnh! Mong ng­êi nhËn cho")
	SetTask(18,10)
	AddNote("Nãi l¹i suy nghÜ cña Khæng HiÓu víi «ng chñ t¹p hãa, hoµn thµnh nhiÖm vô.")
	Msg2Player("Nãi l¹i suy nghÜ cña Khæng HiÓu víi «ng chñ t¹p hãa, hoµn thµnh nhiÖm vô.")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(GetSex() == 0) then
		AddItem(0, 2, 6, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("§­îc mét ¸o v¶i th«.")
	else
		AddItem(0, 2, 13, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("§­îc mét B¸ch §iÖt quÇn.")
	end
	AddRepute(5)
	Msg2Player("Danh väng cña b¹n t¨ng thªm 5 ®iÓm")
end

function W20_buy()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(231)
		AddNote("Mua ®­îc D­¬ng Xu©n Linh Chi.")
		Msg2Player("Mua ®­îc D­¬ng Xu©n Linh Chi.")
		Talk(2,"","Thø Linh Chi nµy thËt lµ quı ","Mét phÇn tiÒn th× mét phÇn hµng. Ng­¬i kh«ng thiÖt thßi ®©u!")
	else
		Talk(1,"","B¸n thËt lµ m¾c! Ta ®©u cã nhiÒu tiÒn nh­ vËy")
	end
end

function yes()
	Sale(29)
end;

function no()
end;
