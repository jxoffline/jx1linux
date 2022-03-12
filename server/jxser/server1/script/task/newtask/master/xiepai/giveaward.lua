
-- ÈÎÎñÏµÍ³Ğ°½Ì·¢½±´¦Àíº¯Êı
-- Edited by peres
-- 2005/01/13 PM 22:12

Include("\\script\\task\\newtask\\master\\clearskillpoint.lua");

-- ´«Èë²ÎÊıÎª£ºÈÎÎñµÈ¼¶

function nt_givePlayerAward(myTaskLevel)

local i
local myAwardText1,myAwardText2 = "",""
local myGolden = {168,169,170,171,172,173,174,175,176}

	if (myTaskLevel==1) then -- Èç¹ûÊÇ 20 ¼¶ÈÎÎñ
		

		
	elseif (myTaskLevel==2) then -- Èç¹ûÊÇ 30 ¼¶ÈÎÎñ
		
		AddOwnExp(80000)
		AddGoldItem(0,177)  --Ôö¼ÓÀ¶Ã±×Ó

		myAwardText1 = "80.000 ®iÓm kinh nghiÖm"
		myAwardText2 = "B¹n nhËn ®­îc 1 kh«i m·o"
		
	elseif (myTaskLevel==3) then -- Èç¹ûÊÇ 40 ¼¶ÈÎÎñ

		AddOwnExp(280000)	
		ClearMagicPoint()  --Ôö¼Ó40¼¶Ê±Ï´µãµÄ¹¦ÄÜ
		
		myAwardText1 = "150.000 ®iÓm kinh nghiÖm"
		myAwardText2 = "1 lÇn tÈy ®iÓm kü n¨ng miÔn phİ "
				
	elseif (myTaskLevel==4) then -- Èç¹ûÊÇ 50 ¼¶ÈÎÎñ
		
		local nRandom=random(1,2);
		
		AddOwnExp(350000)
		
		if nRandom==1 then
			AddItem(6,1,72,1,1,1,0)  -- ÌìÉ½
		else
			AddItem(6,1,73,1,1,1,0)  -- °×¹û
		end;

		myAwardText1 = "350.000 ®iÓm kinh nghiÖm"
		myAwardText2 = "1 phÇn th­ëng"
				
	elseif (myTaskLevel==5) then -- Èç¹ûÊÇ 60 ¼¶ÈÎÎñ

		AddOwnExp(800000)		
		i = random(1,getn(myGolden))
		AddGoldItem(0,myGolden[i])
		
		myAwardText1 = "800.000 ®iÓm kinh nghiÖm"
		myAwardText2 = "1 bé B¶o khİ tuyÖt thÕ "
		
	end
	
	return myAwardText1,myAwardText2

end
