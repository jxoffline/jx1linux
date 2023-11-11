-- Ò°ÛÅÈÎÎñÁ´½Å±¾½±ÀøÍ·ÎÄ¼ş
-- Edited by peres
-- 2004/12/25 Ê¥µ®½ÚÔçÉÏ

-- ÔØÈë»Ô»ÍÖ®ÕÂµÄÍ·ÎÄ¼ş
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua");
Include("\\script\\tong\\tong_award_head.lua");	--by zhishan


-- ¸øÍæ¼Ò·¢½±ÀøµÄ×Üº¯Êı
-- ´«Èë²ÎÊı£ºmyAwardType£¬1 ÎªÆÕÍ¨ÈÎÎñ½±Àø 2 ÎªÁ´½±Àø 3 Îª»·½±Àø
function tl_giveplayeraward(myGiveAwardType)

	-- ´«¸ø½±ÀøÃæ°æµÄ²ÎÊı£º
	-- Èç¹ûÊÇÎïÆ·µÄ»°ÔòÒÀ´ÎÎª£º½±ÀøÀàĞÍ£¬Quality¡¢Genre¡¢Detail¡¢Particular¡¢Level¡¢GoodsFive¡¢Magiclevel£¬ºÍËµÃ÷ÎÄ×Ö
	-- Èç¹ûÊÇ½ğÇ®µÄ»°ÔòÒÀ´ÎÎª£º½±ÀøÀàĞÍ£¬½ğÇ®µÄÊıÁ¿
	-- Èç¹ûÊÇ¾­ÑéµÄ»°ÔòÒÀ´ÎÎª£º½±ÀøÀàĞÍ£¬¾­ÑéµÄÊıÁ¿
	-- Èç¹ûÊÇËæ»ú»ú»á»òÕßÊÇÈ¡Ïû»ú»áÔòÖ»¼ÇÂ¼µÚÒ»Î»Îª½±ÀøÀàĞÍ
	local myAwardArry = {
							{0,0,0,0,0,0,0,0,"",0}, 
						 	{0,0,0,0,0,0,0,0,"",0},
						 	{0,0,0,0,0,0,0,0,"",0}
				        }
	
	-- ÓÃÒÔÁ´½±ÀøºÍ»·½±ÀøµÄ·µ»Ø´¦Àí
	local myAwardSingle = {0,0,0,0,0,0,0,0,"",0}
	
	-- ½±ÀøµÄÊı×é£¬·Ö±ğÎª¸÷ÖÖ½±ÀøµÄÈ¨ÖØ
	-- ÒÀ´ÎÎª£º½ğÇ®¡¢¾­Ñé¡¢ÎïÆ·¡¢ÔÙËæ»úÒ»´ÎµÄ»ú»á¡¢È¡ÏûÈÎÎñµÄ»ú»á
	-- 0 ÔòÊÇÄÄ¸ö½±ÀøÀàĞÍÒÑ¾­±»Ñ¡³ö
	local myMainAwardRate = {20,33,34,8,5}
	
	local myTaskValue1,myTaskValue2,myMainValue -- ÁÙÊ±±äÁ¿£¬ÓÃÒÔ¼ÇÂ¼¶Áµ½µÄÊıÖµ
	-- ÓÃÓÚ½±Àø´«ÈëµÄ×Ö·û´®
	local myAwardGoods,myAwardExp,myAwardMoney,myAwardCancal,myAwardChange = "","","","",""
	
	local myArawdGoods = {0,0,0,0,0,0} -- ½±ÀøÎïÆ·Ïà¶ÔÓ¦µÄÊı×é
	
	local myAwardType = 0
	
	local myAwardArryIndex = 1 -- ÓÃÒÔ¼ÇÂ¼½±ÀøÊı×éÀïÒÑ¾­¼ÇÂ¼ÁË¶àÉÙ¸ö
	
	local myRandomNum,myRandomSeed -- Ëæ»úÊıºÍËæ»úÖÖ×Ó
	
	local myCountLinks -- Ä¿Ç°Á¬ĞøÍê³ÉµÄÁ´Êı
	
	local myTimes = tl_gettaskstate(1)
	local myLinks = tl_gettaskstate(2)
	local myLoops = tl_gettaskstate(3)
	
	myCountLinks = tl_counttasklinknum(2)
	
	myTaskType = tl_getplayertasktype()
		
	local _nSeed = SetRandSeed(nt_getTask(1037))
	local nTongValue = 0;
	
	if (myGiveAwardType==1) then -- ½±ÀøÀàĞÍÊÇÆÕÍ¨ÈÎÎñ½±Àø

		for i=1,3 do -- Ñ­»·Ñ¡³öÈı¸ö½±ÀøÖÖÀà
			
			myAwardType,myMainAwardRate = tl_getawardtypeforrate(myMainAwardRate)
			
			tl_print("vßng quay thø  "..i.."®· chän ®­îc lo¹i h×nh gi¶i th­ëng: "..myAwardType);
			
			if (myAwardType==1) then -- Èç¹û½±ÀøÀàĞÍÊÇÇ®
				
				myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				
				-- ¾­¹ı¼Ó³ËÖµ¼ÆËãºóµÄÈÎÎñ½±Àø¼ÛÖµ
				myMainValue = myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2
				
				-- 2005/9/20 ÈÕĞŞ¸ÄÁË½ğÇ®µÄ²úÉú±ÈÀı£¬Îª 60% ~ 100% ¸¡¶¯
				-- 2006/8/23 ÎªÔ½ÄÏĞŞ¸ÄÁËÒ°ÛÅÈÎÎñµÄ½ğÇ®¼ÛÖµ£¬Ôö¼Ó 15%
				myMainValue = floor((myMainValue * 0.05 * 1.15) * (C_Random(60,100) * 0.01)) + myTaskValue1 -- ¼ÆËãºóµÃ³öµÄÊµ¼Ê½ğÇ®Á¿
				
				--=======================================
				
				myMainValue = TireReduce(myMainValue);  -- ½øĞĞÆ£ÀÍÏµÍ³´¦Àí£»
				myMainValue = CountDoubleMode(myMainValue);  -- ½øĞĞË«±¶»î¶¯µÄ´¦Àí
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --¼ÇÂ¼¼ÛÖµÁ¿
				
				myAwardMoney = format("%s%s",myMainValue," tiÒn ");
				
				myAwardArry[myAwardArryIndex] = {1,myMainValue,0,0,0,0,0,0,myAwardMoney,0}
				myAwardArryIndex = myAwardArryIndex + 1
				
				tl_print("NhËn ®­îc  tiÒn th­ëng: "..myAwardMoney);
				
			elseif (myAwardType==2) then -- Èç¹û½±ÀøµÄÊÇ¾­Ñé
			
				myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				-- ¾­¹ı¼Ó³ËÖµ¼ÆËãºóµÄÈÎÎñ½±Àø¼ÛÖµ
				myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
				-- 2006/8/23 ÎªÔ½ÄÏĞŞ¸ÄÁËÒ°ÛÅÈÎÎñµÄ¾­Ñé¼ÛÖµ£¬¼õÉÙ 10%
				myMainValue = floor((myMainValue * 0.36) * (C_Random(80,120) * 0.01)) -- ¼ÆËãºóµÃ³öµÄÊµ¼Ê¾­ÑéÖµÁ¿
				
				--=======================================
				myMainValue = TireReduce(myMainValue);--½øĞĞÆ£ÀÍÏµÍ³´¦Àí£»
				myMainValue = CountDoubleMode(myMainValue);  -- ½øĞĞË«±¶»î¶¯µÄ´¦Àí
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --¼ÇÂ¼¼ÛÖµÁ¿
				
				-- 2007/7/11 ÎªÔ½ÄÏ·À³ÁÃÔĞŞ¸ÄÁËÒ°ÛÅ¾­Ñé½±Àø,Èç¹ûÎªÆ£ÀÍ×´Ì¬,½«¾­Ñé´æÈëµ½ÎïÆ·
				-- Ò°ÛÅ»ı·ÖÖĞ,ÔÚ·ÇÆ£ÀÍÊ±Ê¹ÓÃ¿ÉÒÔ»ñµÃ¾­Ñé
				if (GetTiredDegree() == 2) then
					local nTemExp = floor(myMainValue / 1000);
					if (nTemExp < 0) then
						nTemExp = 1;
					end;
					myMainValue = nTemExp * 1000;
					myAwardExp = format("%s%s",myMainValue," ®iÓm tİch lòy D· TÈu")
					
					myAwardArry[myAwardArryIndex] = {3,myMainValue,0,6,1,1475,1,0,myAwardExp,0}
					myAwardArryIndex = myAwardArryIndex + 1
					SetTask(TSK_TASKLINK_SEANSONPOINT, nTemExp);
					
					tl_print("NhËn ®­îc mét phÇn th­ëng ®iÓm kinh nghiÖm:"..myAwardExp);
				else
					myAwardExp = format("%s%s",myMainValue," ®iÓm kinh nghiÖm")
					
					myAwardArry[myAwardArryIndex] = {2,myMainValue,0,0,0,0,0,0,myAwardExp,0}
					myAwardArryIndex = myAwardArryIndex + 1
					
					tl_print("NhËn ®­îc mét phÇn th­ëng ®iÓm kinh nghiÖm:"..myAwardExp);
				end;
				
			elseif (myAwardType==3) then -- Èç¹û½±ÀøµÄÊÇÎïÆ·
				
				myTaskValue1 = tl_giveplayeraward_goods(1,Task_AwardBasic) -- Ê×ÏÈµÃµ½½±ÀøÎïÆ·µÄĞĞÊı
				
				myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
				myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
				myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
				myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
				myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
				myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
				
				-- LLG_ALLINONE_TODO_20070802
				
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				-- ¾­¹ı¼Ó³ËÖµ¼ÆËãºóµÄÈÎÎñ½±Àø¼ÛÖµ
				myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --¼ÇÂ¼¼ÛÖµÁ¿
				
				
				myArawdGoods = TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Name")
				
				myAwardArry[myAwardArryIndex] = {3,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}
				myAwardArryIndex = myAwardArryIndex + 1
				
				tl_print("NhËn ®­îc mét phÇn th­ëng: "..myArawdGoods);
				
			elseif (myAwardType==4) then -- Èç¹û½±ÀøµÄÊÇÖØĞÂËæ»úÒ»´ÎµÄ»ú»á
				
				myTaskValue1 = tl_getawardagin() -- µÃµ½¼ÓÈëÁË½ğÇ®ºÍ¾­ÑéµÄÁĞ±íºóµÄĞĞÊı
				
				if (myTaskValue1<=getn(Task_AwardBasic) + 1) then
				
					myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
					myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
					myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
					myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
					myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
					myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
				
					myAwardChange = "Cã muèn thö xem ®©y lµ g× kh«ng?"
					
					--=======================================
					myMainValue = TireReduce(myMainValue);--½øĞĞÆ£ÀÍÏµÍ³´¦Àí
					myMainValue = CountDoubleMode(myMainValue);  -- ½øĞĞË«±¶»î¶¯µÄ´¦Àí
					
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --¼ÇÂ¼¼ÛÖµÁ¿
					
					if (0 == myMainValue)then
						myMainValue = 1;
					end
	
					myAwardArry[myAwardArryIndex] = {4,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myAwardChange,1}
				
				elseif (myTaskValue1 == (getn(Task_AwardBasic) + 2)) then
				
					myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
					myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
					-- ¾­¹ı¼Ó³ËÖµ¼ÆËãºóµÄÈÎÎñ½±Àø¼ÛÖµ
					myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
					myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- ¼ÆËãºóµÃ³öµÄÊµ¼Ê¾­ÑéÖµÁ¿
					
					--=======================================
					myMainValue = TireReduce(myMainValue);--½øĞĞÆ£ÀÍÏµÍ³´¦Àí
					myMainValue = CountDoubleMode(myMainValue);  -- ½øĞĞË«±¶»î¶¯µÄ´¦Àí
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --¼ÇÂ¼¼ÛÖµÁ¿
					
					myAwardChange = "Cã muèn thö xem ®©y lµ g× kh«ng?"
					myAwardArry[myAwardArryIndex] = {4,myMainValue,0,0,0,0,0,0,myAwardChange,2}
					
				elseif (myTaskValue1 == (getn(Task_AwardBasic) + 3)) then
	
					myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
					myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
					-- ¾­¹ı¼Ó³ËÖµ¼ÆËãºóµÄÈÎÎñ½±Àø¼ÛÖµ
					myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
					
					--=======================================
					myMainValue = TireReduce(myMainValue); --½øĞĞÆ£ÀÍÏµÍ³´¦Àí£»
					myMainValue = CountDoubleMode(myMainValue);  -- ½øĞĞË«±¶»î¶¯µÄ´¦Àí
					
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --¼ÇÂ¼¼ÛÖµÁ¿
					
					myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- ¼ÆËãºóµÃ³öµÄÊµ¼Ê½ğÇ®Á¿
				
					myAwardChange = "Cã muèn thö xem ®©y lµ g× kh«ng?"
					myAwardArry[myAwardArryIndex] = {4,myMainValue,0,0,0,0,0,0,myAwardChange,3}
									
				end
				
				myAwardArryIndex = myAwardArryIndex + 1
			
			elseif (myAwardType==5) then -- Èç¹û½±ÀøµÄÊÇÒ»´ÎÈ¡ÏûÈÎÎñµÄ»ú»á
			
				myAwardCancal = "mét c¬ héi hñy bá nhiÖm vô "
				myAwardArry[myAwardArryIndex] = {5,0,0,0,0,0,0,0,myAwardCancal,0}
				myAwardArryIndex = myAwardArryIndex + 1	
			
			end
		end
	
		SetRandSeed(_nSeed)
		-- ·µ»ØÒÑ¾­¹¹ÔìºÃµÄ½±ÀøÊı×é
		return myAwardArry, nTongValue;

	elseif (myGiveAwardType==2) then -- ½±ÀøÀàĞÍÊÇÁ´½±Àø
	
		myTaskValue1 = tl_giveplayeraward_goods(2,Task_AwardLink) -- Ê×ÏÈµÃµ½½±ÀøÎïÆ·µÄĞĞÊı
		
		myQuality = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Quality"))
		myGenre = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Particular"))
		myLevel = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Level"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"GoodsFive"))
		
		
		myArawdGoods = TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Name")
		
		myAwardSingle = {3,0,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}

		tl_print("B¹n ®· chän cho m×nh phÇn th­ëng lµ: "..myArawdGoods);
		SetRandSeed(_nSeed)
		return myAwardSingle
			
	elseif (myGiveAwardType==3) then -- ½±ÀøÀàĞÍÊÇ»·½±Àø
	
		tl_print ("B¾t ®Çu lùa chän phÇn th­ëng: ");

		myTaskValue1 = tl_giveplayeraward_goods(3,Task_AwardLoop) -- Ê×ÏÈµÃµ½½±ÀøÎïÆ·µÄĞĞÊı
		
		myQuality = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Quality"))
		myGenre = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Particular"))
		myLevel = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Level"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"GoodsFive"))
		
		myArawdGoods = TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Name")
		
		myAwardSingle = {3,0,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}

		tl_print("B¹n ®· chän cho m×nh phÇn th­ëng lµ: "..myArawdGoods);
		SetRandSeed(_nSeed)
		return myAwardSingle

	end
	SetRandSeed(_nSeed)
end


-- ×Óº¯Êı£¬¸ù¾İ½±ÀøÁ´Ê£ÓàµÄÀàĞÍÈ¡³ö½±Àø
function tl_getawardtypeforrate(myAwardRate)

	local i,j,k = 0,0,0
	local myAwardMainRate = 0
	
	for i=1,getn(myAwardRate) do
		myAwardMainRate = myAwardMainRate + myAwardRate[i]
	end
	
	j=C_Random(1,myAwardMainRate)
	
	tl_print ("HiÖn t¹i lo¹i h×nh phÇn th­ëng gåm: "..myAwardMainRate);
	
	tl_print ("Chän cho m×nh phÇn th­ëng ngÉu nhiªn lµ: "..j);
	
	for i=1,getn(myAwardRate) do
		k = k + myAwardRate[i]
		if (j<=k) then
			myAwardRate[i] = 0 -- ÔÚÈ«¾Ö±äÁ¿ TL_MainAwardRate ÖĞ¼õÈ¥Ò»¸öÖµ
			tl_print ("B¹n ®· chän phÇn th­ëng ë hµng thø: "..i.." ");
			return i,myAwardRate
		end
	end

	tl_print ("Chän phÇn th­ëng xuÊt hiÖn sù cè!!!");

end


-- ËÑÑ°½±ÀøÁĞ±í£¬µÃµ½ÏàÓ¦µÄ½±Àø
-- myAwardType£º½±ÀøµÄÀàĞÍ
-- myAwardOrgTable£º´«ÈëµÄÔ­Ê¼½±ÀøÊı¾İÁĞ±í
-- 1£ºÈÎÎñ»ù±¾½±Àø 2£ºÈÎÎñÁ´Íê³É½±Àø 3:ÈÎÎñ»·Íê³É½±Àø
function tl_giveplayeraward_goods(myAwardType,myAwardOrgTable)

local myTaskValue1,myTaskValue2 -- ´ÓÈÎÎñ±í¸ñÀï¶ÁÈ¡µÄÈÎÎñ½±Àø¼ÛÖµ
local myLinks,myTimes,myLoops,myCountLinks -- Á¬ĞøÍê³ÉµÄ´ÎÊıÓëÁ´Êı
local myMainValue -- ¾­¹ı¼Ó³ËÖµ¼ÆËãºóµÄÈÎÎñ½±Àø¼ÛÖµ
local myTaskType = tl_getplayertasktype()

local myAwardTable

local FinalAward,n -- ×îÖÕ·µ»ØµÄ½±Àø
	
	myTimes = tl_gettaskstate(1)
	myLinks = tl_gettaskstate(2)
	myLoops = tl_gettaskstate(3)
	
	myCountLinks = tl_counttasklinknum(2)
	
	myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
	myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
	
	-- ¾­¹ı¼Ó³ËÖµ¼ÆËãºóµÄÈÎÎñ½±Àø¼ÛÖµ
	if (myAwardType==1) then
		myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1 + myLoops * 0.2))
		myMainValue = myMainValue * (tl_getplayerlucky() * 0.001 + 1)
	elseif (myAwardType==2) or (myAwardType==3) then
		myMainValue = 2000000
	end
	
	--=======================================
	myMainValue = TireReduce(myMainValue);--½øĞĞÆ£ÀÍÏµÍ³´¦Àí
	myMainValue = CountDoubleMode(myMainValue);  -- ½øĞĞË«±¶»î¶¯µÄ´¦Àí
	
	if (0 == myMainValue)then
		myMainValue = 1;
	end
	
	myAwardTable = AssignValue_AwardRate(myAwardOrgTable,myMainValue)

n = tl_getaward(myAwardTable)

return n -- ·µ»Ø½±ÀøËùÔÚµÄĞĞÊı

end


-- Èç¹ûÑ¡ÔñÁËÖØĞÂËæ»úÒ»´ÎµÄ»°Ôòµ÷ÓÃ´Ëº¯Êı
function tl_getawardagin()

tl_print ("B¾t ®Çu thèng kª sè lÇn chän phÇn th­ëng ngÉu nhiªn");

local myMainValue,myTaskValue1,myTaskValue2,myOrgValue
local myTaskType = tl_getplayertasktype()
local myAwardExp,myAwardMoney
local myAwardAddTable = {{0,0},{0,0}}

local myReAwardTable = {}
myReAwardTable[1] = {}

local myTimes = tl_gettaskstate(1)
local myLinks = tl_gettaskstate(2)
local myLoops = tl_gettaskstate(3)

local n

	for i = 1,getn(Task_AwardBasic) + 2 do
		myReAwardTable[i]={}
	end
	
	myCountLinks = tl_counttasklinknum(2)

	myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
	myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
	-- ¾­¹ı¼Ó³ËÖµ¼ÆËãºóµÄÈÎÎñ½±Àø¼ÛÖµ
	myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
	myMainValue = myMainValue * (tl_getplayerlucky() * 0.03 + 1)
	myOrgValue = myMainValue; -- ÕâÊÇÓÃÓÚ´«½øÈ¥Ñ¡ÔñÎïÆ·µÄ»ù´¡¼ÛÖµÁ¿
	
	tl_print ("B¾t ®Çu thèng kª sè lÇn chän phÇn th­ëng ngÉu nhiªn, tæng gi¸ trŞ phÇn th­ëng nhiÖm vô lµ: "..myMainValue);
	
	myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- ¼ÆËãºóµÃ³öµÄÊµ¼Ê¾­ÑéÖµÁ¿
	myAwardExp = myMainValue
	
	myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- ¼ÆËãºóµÃ³öµÄÊµ¼ÊµÄ½ğÇ®Á¿
	myAwardMoney = myMainValue
	
	myAwardAddTable[1][1] = getn(Task_AwardBasic) + 1
	myAwardAddTable[1][2] = myAwardExp
	
	myAwardAddTable[2][1] = getn(Task_AwardBasic) + 2
	myAwardAddTable[2][2] = myAwardMoney
	
	for i = 1,getn(Task_AwardBasic) do
		myReAwardTable[i][1] = Task_AwardBasic[i][1]
		myReAwardTable[i][2] = Task_AwardBasic[i][2]
	end
	
	myReAwardTable[(getn(Task_AwardBasic) + 1)] = {myAwardAddTable[1][1],myAwardAddTable[1][2]}
	myReAwardTable[(getn(Task_AwardBasic) + 2)] = {myAwardAddTable[2][1],myAwardAddTable[2][2]}
	
	tl_print ("nhËp gi¸ trŞ phÇn th­ëng "..myMainValue);
	
	myReAwardTable = AssignValue_AwardRate(myReAwardTable,myOrgValue * 1.2)
	
	tl_print ("Sau khi thèng kª, tæng sè hµng lµ: "..getn(myReAwardTable));
	
	n = tl_getaward(myReAwardTable)
	
	return n

end


-- ÔÚÒÑ¾­ĞÎ³ÉÈ¨ÖØÁĞ±íµÄ½±ÀøÖĞÌôÑ¡³öÒ»¸ö½±Àø£¬·µ»ØÖµÎª½±ÀøËùÔÚµÄ±í¸ñĞĞÊı
function tl_getaward(myAwardVariable)

local i,j,k = 0,0,0
local myMainRate = 0 -- ×ÜµÄ½±ÀøÈ¨ÖØ

	tl_print ("Sau khi thèng kª, tæng sè nguyªn tè nhËp trªn c¸c hµng lµ: "..getn(myAwardVariable));

	for i=1,getn(myAwardVariable) do
		myMainRate = myMainRate + myAwardVariable[i][2]
	end

	j = C_Random(1, 100)/100 * myMainRate
	
	tl_print ("Sè lÇn chän lùa quµ th­ëng ngÉu nhiªn lµ:"..j);
	
	for i=1,getn(myAwardVariable) do
		k = k + myAwardVariable[i][2]
		
		tl_print ("Sè lÇn xuÊt hiÖn trŞ sè k trong qu¸ tr×nh lùa chän phÇn th­ëng lµ:"..k);
		
		if (j<k) then
			return myAwardVariable[i][1]
		end
	end

end


-- ¸øÓèÍæ¼Ò¹Ì¶¨´ÎÊıµÄ½±Àø£¬Ö±½Ó·¢ÓèÍæ¼Ò
-- ´«Èë²ÎÊıÎªÔ­Ê¼Êı¾İ±í£¬µ±Ç°Íê³ÉµÄ´ÎÊı
function tl_getlinkaward(orgLinkAward, nTask)

local i,j,nAward = 0,0,0;
local decLinkAward = {}; -- ĞĞÊı£¬È¨ÖØ

local k,nRate = 0,0; -- ÓÃÓÚ¼ÆËãÈ¨ÖØµÄÁ½¸öÊı

local nAwardCol = 0; -- »ñÈ¡µ½µÄ±í¸ñĞĞÊı

local nGoods = {"",0,0,0,0,0,0,0};

	for i=1, getn(orgLinkAward) do
	
		if (nTask == orgLinkAward[i][1]) then -- µ½´ïÁË·ûºÏ·¢½±µÄ´ÎÊı
			nAward = nAward + 1;
			--decLinkAward[nAward][1] = orgLinkAward[i][2];
			--decLinkAward[nAward][2] = orgLinkAward[i][3];
			tinsert(decLinkAward, nAward, {orgLinkAward[i][2], orgLinkAward[i][3]});
		end;
	
	end;
	
	if (nAward==0) then -- Ò»¸ö½±Àø¶¼Ã»ÓĞµÄ»°¾Í·µ»Ø¿©
		-- storm_ask2start(4, 1)	--Storm ¿ªÊ¼ÌôÕ½
		return
	end
	
	if (getn(decLinkAward)>0) then
	
		for i=1, getn(decLinkAward) do
			nRate = nRate + decLinkAward[i][2];
		end;
		
		j = C_Random(1, nRate);
		
		for i=1, getn(decLinkAward) do
			k = k + decLinkAward[i][2];
			if (j<=k) then
				nAwardCol = decLinkAward[i][1];
				break;
			end;
		end;
		
		nGoods[1] = TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Name");
		nGoods[2] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Quality"));
		nGoods[3] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Genre"));
		nGoods[4] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Detail"));
		nGoods[5] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Particular"));
		nGoods[6] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Level"));
		nGoods[7] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "GoodsFive"));
		nGoods[8] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Magiclevel"));
		
		if (nGoods[2]==1) then
			AddGoldItem(0, nGoods[3]);
			Msg2Player("Chóc mõng b¹n! Hoµn thµnh nhiÖm vô lÇn nµy  "..nTask.." b¹n nhËn ®­îc"..nGoods[1].."!!!");
			Say("B¹n trÎ lµm tèt l¾m, tÆng ng­¬i <color=yellow>"..nGoods[1].."<color> nµy, sau nµy h·y cè g¾ng thªm nhĞ!", 0);
			AddGlobalCountNews("Ng­êi ch¬i "..GetName().."B¹n hoµn thµnh nhiÖm vô nµy  "..nTask.." D· TÈu, nhËn ®­îc 1 bé Trang bŞ Hoµng Kim "..nGoods[1].." mét c¸i!!!", 3);
			
			WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName().."lÇn, nhËn ®­îc 1 bé Trang bŞ Hoµng Kim "..nGoods[1])
			
		else
			AddItem(nGoods[3],nGoods[4],nGoods[5],nGoods[6],nGoods[7],nGoods[8],0);
			Msg2Player("Chóc mõng b¹n! Hoµn thµnh nhiÖm vô lÇn nµy  "..nTask.." b¹n nhËn ®­îc"..nGoods[1].."!!!");
			
			if (nTask >= 100) then -- Èç¹ûÈÎÎñ´ÎÊı´óÓÚ 100 ²ÅĞ´ LOG
				TaskLink_WriteLog(nTask, nGoods[1]);
			end;
			
			Say("B¹n trÎ lµm tèt l¾m, tÆng ng­¬i <color=yellow>"..nGoods[1].."<color> nµy, sau nµy h·y cè g¾ng thªm nhĞ!", 0);
		end;
		
	else
	
		-- storm_ask2start(4, 1)	--Storm ¿ªÊ¼ÌôÕ½
		return
	
	end;

end


-- »ñÈ¡Íæ¼ÒµÄĞÒÔËÖµ
function tl_getplayerlucky()

local nLucky = GetLucky(0);

	if (nLucky~=nil) and (nLucky~=0) then
		return nLucky
	else
		return 1
	end;
	
end;


-- ½¨Á¢½±ÀøÈ¨ÖØË÷Òı±í
-- ´«Èë²ÎÊı£ºmyTaskVariable ÊÇÔ­Ê¼µÄ½±Àø¼ÛÖµÁĞ±í£¬myAwardValue ÊÇ¼ÆËãºóµÄÎïÆ·×Ü¼ÛÖµÁ¿
-- ·µ»ØÖµÎªÃ¿¸ö½±ÀøµÄ±í¸ñÎÄ¼şĞĞºÅË÷ÒıÓëÆäÈ¨ÖØ
function AssignValue_AwardRate(myAwardVariable,myAwardValue)

local i,j,k = 0,0,0
local myAwardRate = {{}} -- ×ª»»ºóµÄÈ¨ÖØ±í
local myAwardNum = getn(myAwardVariable)
	
	for i = 1,myAwardNum do
		myAwardRate[i]={}
	end
	
	for i=1,myAwardNum do
	
		k = i + 1 -- Îª±£³Ö±í¸ñĞĞÊıµÄ¶ÔÓ¦ËùÒÔÓÃ k 
	
		myAwardRate[i][2] = myAwardVariable[i][2]
		
		if (myAwardValue > myAwardVariable[i][2]) then
			myAwardRate[i][2] = myAwardValue
		end
		
		j = myAwardValue / ( myAwardNum * (myAwardRate[i][2]) ) 
		
		myAwardRate[i] = {k,j}
		
	end
	
	return myAwardRate
	
end

-- ¹¹Ôì¹Ì¶¨´ÎÊı½±ÀøµÄÄÚ´æÁĞ±í
function AssignValue_LinkAward(myTaskTextID)

local i,j = 0,0;
local myLinkAward = {{0,0,0}}; -- ÄÚ´æÁĞ±í£¬ÈÎÎñ´ÎÊı¡¢±í¸ñĞĞÊı¡¢È¨ÖØ

local myTableRow = TabFile_GetRowCount(myTaskTextID)
local nTaskNum = 0;

	for i=1,myTableRow - 1 do
		myLinkAward[i] = {0,0,0};
	end;

	for i=2, myTableRow do
		j = j + 1;
		nTaskNum = tonumber(TabFile_GetCell(myTaskTextID, i, "Num"));
		myLinkAward[j][1] = nTaskNum;
		myLinkAward[j][2] = i;
		myLinkAward[j][3] = tonumber(TabFile_GetCell(myTaskTextID, i, "TaskValue"));
	end;
	
	return myLinkAward;
	
end


-- ÈÎÎñÁ´Ğ´Èë LOG 
function TaskLink_WriteLog(nTask, strGoods)

	WriteLog(" [Ghi nhí nhËn phÇn th­ëng]"..date(" [%y n¨m %m th¸ng %d ngµy  %H giê %M phót]")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName().."B¹n hoµn thµnh nhiÖm vô nµy  "..nTask.."  lÇn, nhËn ®­îc phÇn th­ëng"..strGoods);

end

-- ·ÀÆ£ÀÍÏµÍ³Ë¥¼õº¯Êı
function TireReduce(myMainValue)
--	Msg2Player("Ô­Ê¼¼ÛÖµÁ¿£º"..myMainValue);
	if (nil == myMainValue) 
		then return 0; 
	end
	local Value = myMainValue;
	local TireDegree = GetTiredDegree();
	TireDegree = 0;
	if (1 == TireDegree) then
		Value = floor(Value / 2);
	elseif (2 == TireDegree) then
		Value = 0;
	end
	
--	Msg2Player("·À³ÁÃÔ´¦Àíºó¼ÛÖµÁ¿£º"..Value);
	return Value;
end


-- Ë«±¶»î¶¯µÄÄ£Ê½
-- ´«Èë²ÎÊı£ºint:nValue ËùÒª¼ÆËãµÄ¼ÛÖµÁ¿
function CountDoubleMode(nValue)

local nDoubleMode = greatnight_huang_event(4);

	if nDoubleMode~=0 or nDoubleMode~=nil then
		return nValue*nDoubleMode;
	else
		return nValue;
	end;

end;

-- ¶ÁÈ¡±íµÄÊı¾İ,Ã¿´Î¶¼ÓÖ¶à´¦²Ù×÷,Ğ´³ÉÒ»¸öº¯Êı
function getawardgoodsdata(nIndex)
	local	myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Quality"))
	local	myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Genre"))
	local	myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Detail"))
	local	myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Particular"))
	local	myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Level"))
	local	myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"GoodsFive"))
	local	myArawdGoods = TabFile_GetCell(TL_AWARDBASIC,nIndex,"Name")
	return myQuality, myGenre, myDetail, myParticular, myLevel, myGoodsFive, myArawdGoods;
end;

--function GetTiredDegree()
--	return 1;
--end