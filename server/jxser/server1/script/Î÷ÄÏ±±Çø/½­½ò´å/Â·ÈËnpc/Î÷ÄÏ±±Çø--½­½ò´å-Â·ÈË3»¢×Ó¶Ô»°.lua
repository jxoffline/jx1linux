--Î÷ÄÏ±±Çø ½­½ò´å Â·ÈË3»¢×Ó¶Ô»°
--½­½ò´åĞÂÊÖÈÎÎñ£º»¢×ÓµÄµ¯¹­
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) ĞŞ¸Ä×°±¸ÊôĞÔÉú³É·½Ê½

Include("\\script\\global\\itemhead.lua")

function main(sel)
--	UTask_world18 = GetTask(46);
	UTask_world45 = GetTask(45)
	if ((UTask_world45 == 0) and (GetLevel() >= 5)) then		-- ÈÎÎñÆô¶¯£¬ĞèÒª5¼¶ÒÔÉÏ
		if(GetSex() == 0)then
			Say("§¹i ca! Thî rÌn høa tÆng ta mét c©y giµn n¸, kh«ng biÕt ®· lµm xong ch­a, h·y hái «ng Êy dïm ta!", 2 , "Gióp /yes", "Kh«ng gióp /no")
		else
			Say("§¹i tû, Thî rÌn sÏ tÆng ta mét c©y giµn n¸, kh«ng biÕt ®· lµm xong ch­a, h·y hái «ng Êy dïm ta!", 2 , "Gióp /yes", "Kh«ng gióp /no")
		end
	elseif(UTask_world45 == 10) then
		Talk(1,"","Mau ®i hái ®¹i thóc lµm xong ch­a?")
	elseif(UTask_world45 == 20) then
		if(HaveItem(176) == 1) then
			Talk(1,"","Tèt l¾m, Tèt l¾m! Chót n÷a ta sÏ ®i t×m Thiªn Thiªn ch¬i. Thanh vò khİ nµy ta t×m ®­îc ngoµi th«n, ta gi÷ ë ®©y ch¼ng lµm g×, th«i th× göi tÆng ng­¬i!")
			DelItem(176)
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			AddItem(0,0,random(0,5),2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)		-- Ò»°ÑËæ»ú¶ş¼¶ÎäÆ÷
			SetTask(45, 100)
			AddRepute(8)
			AddNote("Hoµn thµnh nhiÖm vô mang giµn n¸ vÒ cho Hæ tö ")
			Msg2Player("Mang giµn n¸ vÒ cho Hæ tö, nhiÖm vô hoµn thµnh ")
			Msg2Player("NhËn ®­îc mét binh khİ ")
			Msg2Player("Danh väng cña b¹n t¨ng thªm 8 ®iÓm ")
		else
			Talk(1,"","§îi ®¹i thóc gióp ta lµm xong n¸, ta muèn ®i ra ngoµi th«n b¾n chim, nh­ng kh«ng muèn ®Ó mÑ ta biÕt, bµ nhÊt ®Şnh sÏ kh«ng cho ta ®i!")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","t¹i ao tuyÕt vÉn ch­a r¬i nhØ? Ta thİch nhÊt lµ ch¹y ®ïa trªn tuyÕt!")
		else
			Talk(1,"","Ai da! Kh«ng biÕt thóc thóc Thî rÌn ®· lµm n¸ xong ch­a? Tay nghÒ cña ®¹i thóc rÊt giái. TiÖm thiÕt kiÕm næi tiÕng cña «ng gÇn xa ®Òu biÕt tiÕng, t¹o ra nh÷ng lo¹i vò khİ tuyÖt vêi!")
		end
	end
end;

function yes()
	Talk(1,"","TiÖm cña thóc thóc Thî rÌn n»m ngay cöa th«n, rÊt dÔ t×m!")
	SetTask(45, 10)
	AddNote("TiÕp nhËn nhiÖm vô thay Hæ tö ®Õn hái ng­êi thî rÌn ®· lµm xong c©y giµn n¸ ch­a ")
	Msg2Player("TiÕp nhËn nhiÖm vô thay Hæ tö ®Õn hái ng­êi thî rÌn ®· lµm xong c©y giµn n¸ ch­a ")
end;

function no()
	Talk(1,"","Ta ®i t×m ng­êi kh¸c ®i hái dïm ta!")
end;
