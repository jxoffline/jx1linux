----description: ĞÂÊÖ´å_Ğ¡À¼
--author: wangzg	
--date: 2003/7/18
--Modify:2003/7/21 wangzg
--update 2003/7/28 yuanlan
--Update: 2003-08-07 Dan_Deng
-- Update: Dan_Deng(2003-09-09) ĞŞ¸Ä×°±¸ÊôĞÔÉú³É·½Ê½

Include("\\script\\global\\itemhead.lua")

function main(sel) 
  	UTask_world38=GetTask(66)
  	if ((UTask_world38 == 0) and (GetLevel() >= 6)) then		-- ĞèÒª6¼¶ÒÔÉÏ²ÅÄÜ×öÈÎÎñ
  		Talk(3, "select", "TiÓu c« n­¬ng t¹i so l¹i khãc lãc th¶m th­¬ng vËy?", "Gia gia m¾c bÖnh råi! Nh­ng nhµ ta l¹i kh«ng cã tiÒn mua thuèc.", "Muèn mua thuèc g×?")
  	elseif (UTask_world38 == 1) then
		Talk(1,"","C¸m ¬n huynh! Thuèc cña «ng néi t«i tr­íc ®©y lµ do Chñ d­îc ®iÕm bèc.")
  	elseif (UTask_world38 == 5) then
  		if (HaveItem(186) == 1) then
  			DelItem(186)
  			Talk(1,"","ThËt c¶m ¬n huynh! Ta cã mét chiÕc nhÉn, xin huynh nhËn cho!")
  			SetTask(66,10)
  			i = random(0,3)
  			if (i < 3) then 
  				i = 8 
  			else 
  				i = 9 
  			end
  			AddRepute(i)
  			AddNote("Giao X¹ H­¬ng Hæ Cèt Cao cho TiÓu Lan, hoµn thµnh nhiÖm vô. ")
  			Msg2Player("Giao X¹ H­¬ng Hæ Cèt Cao cho TiÓu Lan, hoµn thµnh nhiÖm vô. ")
  			if (random(0,3) == 0) then				-- 25%µÄ»úÂÊµÃ¶ş¼¶½äÖ¸
				p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
  				AddItem(0,3,0,2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
  				Msg2Player("NhËn ®­îc nhÉn qu¶ Tr¸m. ")
  			else
				p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
  				AddItem(0,3,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
  				Msg2Player("Cã ®­îcHoµng Ngäc Giíi chØ. ")
  			end
  			Msg2Player("Danh väng cña b¹n t¨ng thªm "..i.."®iÓm.")
  		else
  			Say("B¹n kh«ng cÈn thËn lµm mÊt X¹ H­¬ng Hæ Cèt Cao, nÕu muèn hoµn thµnh nhiÖm vô b¹n ph¶i cã X¹ H­¬ng Hæ Cèt Cao.", 2, "Ta ®i kiÕm thªm tiÒn/find", "T×m chñ tiÖm thuèc lµm thuèc míi /redo")
  		end		
	elseif ((UTask_world38 > 1) and (UTask_world38 < 10)) then			-- ÈÎÎñÖĞµÄÆÕÍ¨¶Ô»°
		Talk(1,"","C¸m ¬n huynh! Thuèc cña «ng néi t«i tr­íc ®©y lµ do Chñ d­îc ®iÕm bèc.")
  	elseif (UTask_world38 >= 10) then			-- Íê³ÉÈÎÎñºóµÄ¶Ô»°
  		Talk(1,"","C¶m ¬n huynh! Cã thuèc råi, bÖnh cña «ng néi nhÊt ®Şnh sÏ khái.")
	else					-- ·ÇÈÎÎñ¶Ô»°
  		Talk(1,"","¤ng néi Gia gia tuæi ®· cao, søc kháe l¹i kh«ng tèt! Ta chØ hy väng m×nh biÕt y thuËt ®Ó trŞ bÖnh cho «ng.")
	end
end;

function select()
	Say("Ta còng kh«ng biÕt lµ thuèc g×, chİnh lµ tr­íc ®©y Chñ d­îc ®iÕm cho «ng ta.", 2, "Gióp lµm thuèc /yes", "Kh«ng liªn quan ®Õn viÖc cña ta /no")
end;

function yes()
	Talk(1,"","C¸m ¬n huynh! Thuèc cña «ng néi t«i tr­íc ®©y lµ do Chñ d­îc ®iÕm bèc.")
	SetTask(66,1)
	AddNote("NhËn nhiÖm vô: Gióp ¤ng TiÓu Lan t×m thuèc. ")
	Msg2Player("NhËn nhiÖm vô: Gióp ¤ng TiÓu Lan t×m thuèc. ")
end;

function no()
end;

function find()
end;

function redo()
Talk(1,"","§Õn d­îc ®iÕm lÊy thuèc!")
SetTask(66, 2)
SetTask(67, 0)
AddNote("<color=red> Bëi v× X¹ H­¬ng Hæ Cèt Cao bŞ mÊt, vui lßng ®i t×m ¤ng chñ tiÖm thuèc lµm l¹i thuèc. <color> ")
Msg2Player("Bëi v× X¹ H­¬ng Hæ Cèt Cao bŞ mÊt, vui lßng ®i t×m ¤ng chñ tiÖm thuèc lµm l¹i thuèc. ")
end;
