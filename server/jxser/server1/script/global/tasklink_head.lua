
-- Ò°ÛÅÈÎÎñÁ´½Å±¾Í·ÎÄ¼ş
-- Edited by peres
-- 2004/12/25 Ê¥µ®½ÚÔçÉÏ

IncludeLib("FILESYS");

TL_MAXTIMES = 20 -- Ã¿¸öÁ´ÓĞ 20 ¸öÈÎÎñ
TL_MAXLINKS = 20 -- Ã¿¸ö»·ÓĞ 20 ¸öÁ´
TL_MAXLOOPS = 10 -- Íæ¼Ò×Ü¹²¿ÉÒÔ×ö 10 »·µÄÈÎÎñ
TL_MAXLINKSCOUNT = 4 -- Ã¿¸öÁ´×î¶àÖ»ÄÜ×ö 4 ´Î

TL_UPLEVELEXP = "TaskLink_UpLevel"


-- ¶ÁÈ¡ÎÄ¼şÊ±µÄ×Ö·û´®¶¨Òå
TL_BUYGOODS = "TaskLink_BuyGoods"
TL_FINDGOODS = "TaskLink_FindGoods"
TL_SHOWGOODS = "TaskLink_ShowGoods"
TL_FINDMAPS = "TaskLink_FindMaps"
TL_UPGROUND = "TaskLink_UpGround"
TL_WORLDMAPS = "TaskLink_WorldMaps"
TL_LEVELLINK = "TaskLink_Level"
TL_MAINTASKLEVEL = "TaskLink_MainLevel"
TL_AWARDBASIC = "Award_Basic"
TL_AWARDLINK = "Award_Link"
TL_AWARDLOOP = "Award_Loop"


-- ÈÎÎñÁ´ TABLE FILE µÄÔ¤ÔØÈë
TabFile_Load("\\settings\\task\\tasklink_buygoods.txt",TL_BUYGOODS)
TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
TabFile_Load("\\settings\\task\\tasklink_findmaps.txt",TL_FINDMAPS)
TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)
TabFile_Load("\\settings\\task\\tasklink_worldmaps.txt",TL_WORLDMAPS)
TabFile_Load("\\settings\\task\\levellink.txt",TL_LEVELLINK) -- Ã¿¸öµÈ¼¶Ïà¶ÔÓ¦µÄ³õÊ¼µÈ¼¶
TabFile_Load("\\settings\\task\\tasklink_mainlink.txt",TL_MAINTASKLEVEL) -- Ã¿¸öÈÎÎñÀàĞÍÔÚÏàÓ¦µÄµÈ¼¶ÀïÃæ³öÏÖµÄ¼¸ÂÊ
TabFile_Load("\\settings\\npc\\player\\level_exp.txt",TL_UPLEVELEXP) -- Éı¼¶ËùĞèµÄ¾­Ñé±í

TabFile_Load("\\settings\\task\\award_basic.txt",TL_AWARDBASIC)
TabFile_Load("\\settings\\task\\award_link.txt",TL_AWARDLINK)
TabFile_Load("\\settings\\task\\award_loop.txt",TL_AWARDLOOP)



-- È·¶¨Íæ¼Òµ±Ç°µÄÈÎÎñ×´Ì¬Ó¦¸ÃÊÇÊôÓÚµÚ¼¸»·
function GetFirstLoop()
	-- ÓÉÓÚÔİÊ±Ã»ÓĞ»·µÄ²î±ğ£¬ËùÒÔÖ»ÄÜÎª 1 
	return 1
end


-- ×îÖÕµÄÊä³öº¯Êı£¬¸øÓèÍæ¼ÒÈÎÎñ²¢ÇÒÖÃÓÚÈÎÎñ±äÁ¿ÖĞ
function DealTask()

-- Ê×ÏÈÈ·¶¨Íæ¼ÒµÄÈÎÎñµÈ¼¶
local myTaskLevel = GetTaskState(2)

print ("Get The TaskLevel:  "..myTaskLevel)

-- È»ºóËæ»úËã³ö¸ÃµÈ¼¶Ó¦¸Ã½øĞĞÊ²Ã´ÀàĞÍµÄÈÎÎñ
local myTaskType = GetTaskType(myTaskLevel)

SetPlayerTaskTpye(myTaskType)

print ("Get The TaskType:  "..myTaskType)

-- ×îºóÔÙ¶ÁÏàÓ¦µÄ±íÈ·¶¨¾ßÌåµÄÈÎÎñÔÚ±í¸ñÖĞµÄĞĞºÅ 
local myTaskID = GetTaskLink(myTaskType,myTaskLevel)

SaveTaskTableCol(myTaskID)

print ("Get The TaskColID:  "..myTaskID)

-- Èç¹ûÊÇÊÕ¼¯µØÍ¼ÈÎÎñµÄ»°Ôò¼ÇÂ¼µØÍ¼µÄ±àºÅºÍÒªÊÕ¼¯µÄ¾íÖáÀàĞÍ
local myTaskMapID = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"MapID"))
local myMapType = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"MapType"))
local myMapNum = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num"))

-- µÚ5ÀàÈÎÎñµÄÅĞ¶ÏÌõ¼ş
local myTaskValueType

-- ¼ÇÂ¼ÈÎÎñ±äÁ¿
-- ¼ÇÂ¼Íæ¼ÒµÄÈÎÎñÀàĞÍ
SetPlayerTaskTpye(myTaskType)

-- ¼ÇÂ¼Íæ¼ÒµÄÈÎÎñ¾ßÌå±í¸ñĞĞÊı
SaveTaskTableCol(myTaskID)

-- ¶ÔÓ¦²»Í¬µÄÈÎÎñ×÷²»Í¬µÄ±äÁ¿´æ´¢´¦Àí

	if ( myTaskType == 1 ) then
	elseif ( myTaskType == 2 ) then
	elseif ( myTaskType == 3 ) then
	elseif ( myTaskType == 4 ) then
		SetTask(1031,myTaskMapID)
		SetTask(1032,SetByte(GetTask(1032),1,myMapType))
		SetTask(1032,SetByte(GetTask(1032),2,myMapNum))
		SetTask(1025,0) -- Çå¿ÕÔ­À´µÄµØÍ¼Ö¾ÊıÁ¿
	elseif ( myTaskType == 5 ) then -- Èç¹ûÊÇÊôÓÚÊıÖµÉı¼¶µÄÈÎÎñµÄ»°£¬ÔòÅĞ¶ÏÊÇÄÄÖÖÊıÖµ
	
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType"))
		
		if (myTaskValueType == 2) then
			print("NhËn ®­îc nhiÖm vô t¨ng kinh nghiÖm!")
			SetTask(1033,GetLevel())
			SetTask(1034,GetExp())
		elseif (myTaskValueType == 3) then
			print("NhËn ®­îc nhiÖm vô t¨ng danh väng!")
			SetTask(1026,GetRepute())
		elseif (myTaskValueType == 4) then
			print("NhËn ®­îc nhiÖm vô t¨ng phóc duyªn!")
			SetTask(1026,FuYuan_Get())
		elseif (myTaskValueType == 5) then
			print("NhËn ®­îc nhiÖm vô t¨ng PK!")
			SetTask(1026,GetPK())
		end
		
	elseif ( myTaskType == 6 ) then
	end
	
	SetTaskCourse(1) -- ÉèÖÃÈÎÎñ½øÕ¹½ø¶ÈÎª 1 

end


-- ÈÎÎñµÄÑ­»·µ½ÏÂÒ»ÂÖ
function TaskProcess()

local myTaskTimes = GetTaskState(1) -- Íæ¼Ò½øĞĞµ½µÄ´ÎÊı
local myTaskLinks = GetTaskState(2) -- Íæ¼Ò½øĞĞµ½µÄÁ´Êı
local myTaskLoops = GetTaskState(3) -- Íæ¼Ò½øĞĞµ½µÄ»·Êı
local myTaskCancel = GetTaskState(4)
local myTaskLinksCount = GetTaskState(6) -- ¼ì²âÍæ¼ÒÔÚµ±Ç°µÄÁ´ÖĞÒÑ¾­½øĞĞÁË¼¸´Î

if (myTaskTimes ~= 0) then
	myTaskTimes = myTaskTimes + 1
	if (myTaskTimes >= TL_MAXTIMES + 1) then
		myTaskTimes = 1
		myTaskLinksCount = myTaskLinksCount + 1
		myTaskCancel = 0 -- È¡Ïû´ÎÊıÎª0
		if (myTaskLinksCount >= TL_MAXLINKSCOUNT + 1) then
			myTaskLinks = myTaskLinks + 1
			myTaskLinksCount = 0
		end
			
	end
	
	if (myTaskLinks >= TL_MAXLINKS + 1) then
		myTaskLinks = GetFirstLink()
		myTaskLoops = myTaskLoops + 1
	end
end

SetTaskState(1,myTaskTimes)
SetTaskState(2,myTaskLinks)
SetTaskState(3,myTaskLoops)
SetTaskState(4,myTaskCancel)
SetTaskState(6,myTaskLinksCount)

DealTask()

main()

end



-- ¼ì²âº¯Êı£¬ÓÃÒÔÈ·ÈÏÍæ¼ÒÊÇ·ñÒÑ¾­Íê³ÉÁËÈÎÎñ
-- ·µ»ØÖµ
-- 1£ºÒÑ¾­´ï³ÉÌõ¼ş
-- 0£º»¹Î´ÄÜÍê³É
-- ´«Èë²ÎÊı nTaskGoods ÓĞ¶à¸ö±í´ï·½Ê½
-- Èç¹ûÊÇÈÎÎñ 1 µÄ»°£ºÖÖÀà¡¢Àà±ğ¡¢Ï¸Àà¡¢ÎåĞĞ¡¢µÈ¼¶
-- Èç¹ûÊÇÈÎÎñ 2 µÄ»°£ºÖÖÀà¡¢Àà±ğ¡¢Ï¸Àà¡¢ÎåĞĞ¡¢µÈ¼¶¡¢Ä§·¨ÊôĞÔID¡¢Ä§·¨ÊôĞÔÏÂÏŞ¡¢Ä§·¨ÊôĞÔÉÏÏŞ
-- Èç¹ûÊÇÈÎÎñ 3 µÄ»°£ºÄ§·¨ÊôĞÔID¡¢Ä§·¨ÊôĞÔÏÂÏŞ¡¢Ä§·¨ÊôĞÔÉÏÏŞ
function CheckTask(nTaskGoods)

local i,j

-- ÈÎÎñËùĞèÇóµÄÎïÆ·
local myTaskGoods

-- ÈÎÎñËùĞèÇóÎïÆ·µÄÖÖÀà¡¢Àà±ğ¡¢Ï¸Àà¡¢ÎåĞĞ¡¢µÈ¼¶
local myGenre,myDetail,myParticular,myGoodsFive,myLevel,myMagicID,myMagicMax,myMagicMin

-- ÈÎÎñËùĞèÇóÎïÆ·µÄÖÖÀà£¬²»´øÄ§·¨ÊôĞÔºÍ´øÄ§·¨ÊôĞÔ
local myGoodsClean,myGoodsMagic

-- ÈÎÎñËùÒªÇóµÄµØÍ¼Ö¾ ID, µØÍ¼Ö¾µÄÊıÁ¿ºÍµØÍ¼Ö¾µÄÀàĞÍ
local myTaskMaps,myTaskMapNum,myTaskMapType

-- ÈÎÎñËùÒªÇóÉı¼¶µÄÊıÖµºÍÊıÖµÀàĞÍ
local myTaskValue,myTaskValueType

-- ÈÎÎñËùÒªÇóµÄÉ½ºÓÉçğ¢Í¼ÊıÁ¿
local myWorldMaps,nWorldMaps

-- »ñÈ¡Íæ¼Òµ±Ç°Ëù½ÓµÄÈÎÎñÀàĞÍ
local myTaskType = GetPlayerTaskType()
local myTaskID = GetTaskTableCol()

	if ( myTaskType == 1) then
		
		myGenre = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Particular"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"GoodsFive"))
		myLevel = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Level"))
		
		myTaskGoods = {myGenre,myDetail,myParticular,myGoodsFive,myLevel}
		
		print("VËt phÈm nhiÖm vô cÇn:"..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
		if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
			return 1
		else
			return 0
		end
		
	elseif ( myTaskType == 2) then
	
		myGenre = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Particular"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"GoodsFive"))
		myLevel = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Level"))
		myMagicID = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MagicEnName"))
		myMagicMax = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MaxValue"))
		myMagicMin = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MinValue"))
		
		myTaskGoods = {myGenre,myDetail,myParticular,myGoodsFive,myLevel,myMagicID,myMagicMin,myMagicMax}
		myGoodsClean = {nTaskGoods[1],nTaskGoods[2],nTaskGoods[3],nTaskGoods[4],nTaskGoods[5]} -- Èç¹û²»ÓÃÅĞ¶ÏÄ§·¨ÊôĞÔÔòÈ¡´ËÖµ
		myGoodsMagic = {nTaskGoods[1],nTaskGoods[2],nTaskGoods[3],nTaskGoods[4],nTaskGoods[5],nTaskGoods[6],nTaskGoods[7],nTaskGoods[8]}
		
		if (myMagicID == "n") then
			print("VËt phÈm nhiÖm vô cÇn:"..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
			if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
				return 1
			else
				return 0
			end			
		else
			print("VËt phÈm nhiÖm vô cÇn:"..myGenre..myDetail..myParticular..myLevel..myGoodsFive.."Thuéc tİnh ma ph¸p:"..myMagicID.." TrŞ nhá nhÊt:"..myMagicMin.." TrŞ lín nhÊt:"..myMagicMax)
			if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[6] == myTaskGoods[6]) and (tonumber(nTaskGoods[7]) >= myTaskGoods[7]) then
				return 1
			else
				return 0
			end
		end 
		
	elseif ( myTaskType == 3) then
	
		myMagicID = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MagicEnName"))
		myMagicMin = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MinValue"))
		myMagicMax = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MaxValue"))
		
		print("VËt phÈm nhiÖm vô cÇn:"..myMagicID..myMagicMin..myMagicMax)
		
		if ( nTaskGoods[1] == myMagicID) and ( nTaskGoods[2] >= myMagicMin ) then
			return 1
		else
			return 0
		end
		
	elseif ( myTaskType == 4) then
	
		myTaskMapNum = GetTask(1025)

		print ("Sè l­îng ®Şa ®å nhiÖm vô cÇn:"..tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num")));

		if (myTaskMapNum>=tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num"))) then
			myTaskMapNum = 0
			SetTask(1025,myTaskMapNum) -- ÖØĞÂÖÃ 0
			return 1
		else
			return 0
		end
		
	elseif (myTaskType == 5) then
	
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType"))
		
		if (myTaskValueType == 2) then
		
		print("NhiÖm vô hiÖn t¹i lµ t¨ng kinh nghiÖm")
			if (CountUpLevelExp(GetTask(1033),GetTask(1034)) >= tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericValue"))) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 3) then -- ÉùÍûÖµ
		
		print("NhiÖm vô hiÖn t¹i lµ t¨ng danh väng")
			if (GetRepute() >= GetTask(1026)) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 4) then -- ¸£ÔµÖµ
		
		print("NhiÖm vô hiÖn t¹i lµ t¨ng phóc duyªn")
			if (FuYuan_Get() >= GetTask(1026)) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 5) then -- PK Öµ
		
		print("NhiÖm vô hiÖn t¹i lµ t¨ng PK")
			if (GetPK() >= GetTask(1026)) then
				return 1
			else
				return 0
			end
		end
		
	elseif (myTaskType == 6) then
		myWorldMaps = tonumber(TabFile_GetCell(TL_WORLDMAPS,myTaskID,"Num"))
		if (GetTask(1027) >= myWorldMaps) then
			nWorldMaps = GetTask(1027) - myWorldMaps -- ÔÚÕâÀïÉ¾ÁËĞèÒªµÄÉ½ºÓÉçğ¢Í¼²ĞÆ¬
			SetTask(1027,nWorldMaps)
			return 1
		else
			return 0
		end
	end
	
end



-- ¸øÍæ¼Ò·¢½±ÀøµÄ×Üº¯Êı
function GivePlayerAward()

	-- ´«¸ø½±ÀøÃæ°æµÄ²ÎÊı£º
	-- Èç¹ûÊÇÎïÆ·µÄ»°ÔòÒÀ´ÎÎª£º½±ÀøÀàĞÍ£¬Quality¡¢Genre¡¢Detail¡¢Particular¡¢Level¡¢GoodsFive¡¢Magiclevel£¬ºÍËµÃ÷ÎÄ×Ö
	-- Èç¹ûÊÇ½ğÇ®µÄ»°ÔòÒÀ´ÎÎª£º½±ÀøÀàĞÍ£¬½ğÇ®µÄÊıÁ¿
	-- Èç¹ûÊÇ¾­ÑéµÄ»°ÔòÒÀ´ÎÎª£º½±ÀøÀàĞÍ£¬¾­ÑéµÄÊıÁ¿
	-- Èç¹ûÊÇËæ»ú»ú»á»òÕßÊÇÈ¡Ïû»ú»áÔòÖ»¼ÇÂ¼µÚÒ»Î»Îª½±ÀøÀàĞÍ
	local myAwardArry = {
							{0,0,0,0,0,0,0,0,""}, 
						 	{0,0,0,0,0,0,0,0,""},
						 	{0,0,0,0,0,0,0,0,""}
				        }
	
	-- ½±ÀøµÄÊı×é£¬·Ö±ğÎª¸÷ÖÖ½±ÀøµÄÈ¨ÖØ
	-- ÒÀ´ÎÎª£º½ğÇ®¡¢¾­Ñé¡¢ÎïÆ·¡¢ÔÙËæ»úÒ»´ÎµÄ»ú»á¡¢È¡ÏûÈÎÎñµÄ»ú»á
	-- 0 ÔòÊÇÄÄ¸ö½±ÀøÀàĞÍÒÑ¾­±»Ñ¡³ö
	local myMainAwardRate = {30,30,30,9,1}
	
	local myTaskValue1,myTaskValue2,myMainValue -- ÁÙÊ±±äÁ¿£¬ÓÃÒÔ¼ÇÂ¼¶Áµ½µÄÊıÖµ
	-- ÓÃÓÚ½±Àø´«ÈëµÄ×Ö·û´®
	local myAwardGoods,myAwardExp,myAwardMoney,myAwardCancal,myAwardChange = "","","","",""
	
	local myArawdGoods = {0,0,0,0,0,0} -- ½±ÀøÎïÆ·Ïà¶ÔÓ¦µÄÊı×é
	
	local myAwardType
	
	local myAwardArryIndex = 1 -- ÓÃÒÔ¼ÇÂ¼½±ÀøÊı×éÀïÒÑ¾­¼ÇÂ¼ÁË¶àÉÙ¸ö
	
	local myRandomNum,myRandomSeed -- Ëæ»úÊıºÍËæ»úÖÖ×Ó
	
	myTimes = GetTaskState(1)
	myLinks = GetTaskState(2)
	
	myTaskType = GetPlayerTaskType()
	
	local _nSeed = SetRandSeed(GetTask(1037))
	
	
	print("B¾t ®Çu chän h×nh thøc ph¸t th­ëng!")
	
	for i=1,3 do -- Ñ­»·Ñ¡³öÈı¸ö½±ÀøÖÖÀà
		
		myAwardType,myMainAwardRate = GetAwardTypeForRate(myMainAwardRate)
		
		print("vßng quay thø  "..i.."®· chän ®­îc lo¹i h×nh gi¶i th­ëng: "..myAwardType);
		
		if (myAwardType==1) then -- Èç¹û½±ÀøÀàĞÍÊÇÇ®
		
			print ("Lo¹i nhiÖm vô hŞªn t¹i lµ:"..GetTaskTextID(myTaskType)..", sè hµng (ID) cña nhiÖm vô hiÖn t¹i lµ:"..GetTaskTableCol());
			
			myTaskValue1 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue1"))
			myTaskValue2 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue2"))
			-- ¾­¹ı¼Ó³ËÖµ¼ÆËãºóµÄÈÎÎñ½±Àø¼ÛÖµ
			myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myLinks+myTimes)*0.1))
			
			myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- ¼ÆËãºóµÃ³öµÄÊµ¼Ê½ğÇ®Á¿
			
			myAwardMoney = format("%s%s",myMainValue," tiÒn ");
			
			myAwardArry[myAwardArryIndex] = {1,myMainValue,0,0,0,0,0,0,myAwardMoney}
			myAwardArryIndex = myAwardArryIndex + 1
			
			print("NhËn ®­îc  tiÒn th­ëng: "..myAwardMoney);
			
		elseif (myAwardType==2) then -- Èç¹û½±ÀøµÄÊÇ¾­Ñé
		
			myTaskValue1 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue1"))
			myTaskValue2 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue2"))
			-- ¾­¹ı¼Ó³ËÖµ¼ÆËãºóµÄÈÎÎñ½±Àø¼ÛÖµ
			myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myLinks+myTimes)*0.1))
			
			myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- ¼ÆËãºóµÃ³öµÄÊµ¼Ê¾­ÑéÖµÁ¿
			
			myAwardExp = format("%s%s",myMainValue," ®iÓm kinh nghiÖm")
			
			myAwardArry[myAwardArryIndex] = {2,myMainValue,0,0,0,0,0,0,myAwardExp}
			myAwardArryIndex = myAwardArryIndex + 1
			
			print("NhËn ®­îc mét phÇn th­ëng ®iÓm kinh nghiÖm:"..myAwardExp);
			
		elseif (myAwardType==3) then -- Èç¹û½±ÀøµÄÊÇÎïÆ·
			
			myTaskValue1 = GivePlayerAward_Goods(1) -- Ê×ÏÈµÃµ½½±ÀøÎïÆ·µÄĞĞÊı
			
			myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
			myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
			myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
			myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
			myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
			myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
			
			
			myArawdGoods = TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Name")
			
			myAwardArry[myAwardArryIndex] = {3,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods}
			myAwardArryIndex = myAwardArryIndex + 1
			
			print("NhËn ®­îc mét phÇn th­ëng: "..myArawdGoods);
			
		elseif (myAwardType==4) then -- Èç¹û½±ÀøµÄÊÇÖØĞÂËæ»úÒ»´ÎµÄ»ú»á
			
			myAwardChange = "Chän l¹i tõ ®Çu"
			myAwardArry[myAwardArryIndex] = {4,0,0,0,0,0,0,0,myAwardExp}
			myAwardArryIndex = myAwardArryIndex + 1
			
			print("NhËn ®­îc c¬ héi");
		
		elseif (myAwardType==5) then -- Èç¹û½±ÀøµÄÊÇÒ»´ÎÈ¡ÏûÈÎÎñµÄ»ú»á
		
			myAwardChange = "1 lÇn  hñy bá nhiÖm vô "
			myAwardArry[myAwardArryIndex] = {5,0,0,0,0,0,0,0,myAwardExp}
			myAwardArryIndex = myAwardArryIndex + 1	
			
			print("NhËn ®­îc c¬ héi 1 lÇn hñy bá nhiÖm vô ");	
		
		end
	end
	
	SetRandSeed(_nSeed)
	-- ·µ»ØÒÑ¾­¹¹ÔìºÃµÄ½±ÀøÊı×é
	return myAwardArry

end


-- ×Óº¯Êı£¬¸ù¾İ½±ÀøÁ´Ê£ÓàµÄÀàĞÍÈ¡³ö½±Àø
function GetAwardTypeForRate(myAwardRate)

local i,j,k = 0,0,0
local myAwardMainRate = 0

for i=1,getn(myAwardRate) do
	myAwardMainRate = myAwardMainRate + myAwardRate[i]
end

j=C_Random(1,myAwardMainRate)

for i=1,getn(myAwardRate) do
	k = k + myAwardRate[i]
	if (i<k) then
		myAwardRate[i] = 0 -- ÔÚÈ«¾Ö±äÁ¿ TL_MainAwardRate ÖĞ¼õÈ¥Ò»¸öÖµ
		return i,myAwardRate
	end
end

print ("Chän phÇn th­ëng xuÊt hiÖn sù cè!!!");

end


-- ËÑÑ°½±ÀøÁĞ±í£¬µÃµ½ÏàÓ¦µÄ½±Àø
-- myAwardType£º½±ÀøµÄÀàĞÍ
-- 1£ºÈÎÎñ»ù±¾½±Àø 2£ºÈÎÎñÁ´Íê³É½±Àø 3:ÈÎÎñ»·Íê³É½±Àø
function GivePlayerAward_Goods(myAwardType)

local myTaskValue1,myTaskValue2 -- ´ÓÈÎÎñ±í¸ñÀï¶ÁÈ¡µÄÈÎÎñ½±Àø¼ÛÖµ
local myLinks,myTimes -- Á¬ĞøÍê³ÉµÄ´ÎÊıÓëÁ´Êı
local myMainValue -- ¾­¹ı¼Ó³ËÖµ¼ÆËãºóµÄÈÎÎñ½±Àø¼ÛÖµ
local myTaskType = GetPlayerTaskType()
local myAwardTextID

local myAwardTable

local FinalAward -- ×îÖÕ·µ»ØµÄ½±Àø
	
	if (myAwardType == 1) then
		myAwardTextID = TL_AWARDBASIC
	elseif (myAwardType == 2) then
		myAwardTextID = TL_AWARDLINK
	elseif (myAwardType == 3) then
		myAwardTextID = TL_AWARDLOOP
	end
	
	myTimes = GetTaskState(1)
	myLinks = GetTaskState(2)
	
	myTaskValue1 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue1"))
	myTaskValue2 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue2"))
	
	-- ¾­¹ı¼Ó³ËÖµ¼ÆËãºóµÄÈÎÎñ½±Àø¼ÛÖµ
	myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myLinks+myTimes)*0.1))
	
	myAwardTable = AssignValue_AwardRate(Task_AwardBasic,myMainValue)
	
	FinalAward = TabFile_GetCell(myAwardTextID,GetAward(myAwardTable),"Name")
	
--	print ("»ñÈ¡ÁË "..myTaskTextID.." ÈÎÎñÀàĞÍÖĞµÄ "..FinalAward.."½±Àø")
	
return GetAward(myAwardTable) -- ·µ»Ø½±ÀøËùÔÚµÄĞĞÊı

end


-- ÔÚÒÑ¾­ĞÎ³ÉÈ¨ÖØÁĞ±íµÄ½±ÀøÖĞÌôÑ¡³öÒ»¸ö½±Àø£¬·µ»ØÖµÎª½±ÀøËùÔÚµÄ±í¸ñĞĞÊı
function GetAward(myAwardVariable)

local i,j,k = 0,0,0
local myMainRate = 0 -- ×ÜµÄ½±ÀøÈ¨ÖØ
	
	for i=1,getn(myAwardVariable) do
		myMainRate = myMainRate + myAwardVariable[i][2]
	end
	
	j = C_Random(1,myMainRate)
	
	for i=1,getn(myAwardVariable) do
		k = k + myAwardVariable[i][2]
		if (j<k) then
			return i
		end
	end

end


-- ×Óº¯Êı£¬ÓÃÒÔÈ·¶¨µ±Ç°Íæ¼ÒËù½Óµ½µÄÈÎÎñ¾ßÌåÊÇÄÄÒ»ÖÖÀàĞÍµÄÈÎÎñ
-- ·µ»ØÖµÎª 1~6£¬Èç¹ûÎª 0 ÔòÍæ¼Ò»¹Ã»ÓĞ´¥·¢ÈÎÎñÁ´
function GetPlayerTaskType()

local myTaskType

--	myTaskType = strsub(format("%d",GetTask(1021),1,1))
myTaskType = GetTask(1021)

return myTaskType

end


-- ×Óº¯Êı£¬ÓÃÒÔÉè¶¨µ±Ç°Íæ¼ÒËù½Óµ½µÄÈÎÎñ¾ßÌåÊÇÄÄÒ»ÖÖÀàĞÍµÄÈÎÎñ
function SetPlayerTaskTpye(myTaskType)
	SetTask(1021,myTaskType)
end


-- ×Óº¯Êı£¬ÓÃÒÔ»ñÈ¡Íæ¼ÒµÄĞÔ±ğ£¬Ö±½Ó·µ»Ø×Ö·û´®
function GetPlayerSex()
local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û

	if (GetSex() == 0) then
		mySex = "C«ng tö "
	else
		mySex = "N÷ hiÖp"
	end
	
return mySex
end


-- ×Óº¯Êı£¬ÓÃÒÔ¼ÇÂ¼Íæ¼Òµ±Ç°ÈÎÎñËù¾ßÌå¶ÔÓ¦µÄ±í¸ñĞĞÊı
function SaveTaskTableCol(myTaskCol)
	SetTask(1030,myTaskCol)
end


-- ×Óº¯Êı£¬ÓÃÒÔ¶ÁÈ¡Íæ¼Òµ±Ç°ÈÎÎñËù¶ÔÓ¦µÄ¾ßÌå±í¸ñĞĞÊı
function GetTaskTableCol()
	return GetTask(1030)
end


-- ×Óº¯Êı£¬¼ì²âÈÎÎñµÄ×´Ì¬
-- 1£ºµ±Ç°½øĞĞµÄ´ÎÊı
-- 2£ºµ±Ç°½øĞĞµÄÁ´Êı
-- 3£ºµ±Ç°½øĞĞµÄ»·Êı
-- 4£ºÊ£ÓàÈ¡ÏûµÄ´ÎÊı
-- 5£ºÍæ¼Òµ±Ç°Ëù½ÓµÄÈÎÎñºÅ´¢´æÔÚ 1021 ÉÏ
-- 6£ºÍæ¼ÒÔÚÃ¿Ò»»·µÄ¸ÃÁ´ÖĞÒÑ¾­×öÁË¼¸´Î£¬×î´óÎª 4
function GetTaskState(myTaskState)

local n

if ( myTaskState <= 4) then
	n = GetByte(GetTask(1020),myTaskState)
elseif ( myTaskState == 5) then
	n = GetTask()
elseif ( myTaskState == 6) then
	n = GetTask(1035)
end

return n

end


-- ×Óº¯Êı£¬ÉèÖÃÈÎÎñµÄ×´Ì¬
-- 1£ºµ±Ç°½øĞĞµÄ´ÎÊı
-- 2£ºµ±Ç°½øĞĞµÄÁ´Êı
-- 3£ºµ±Ç°½øĞĞµÄ»·Êı
-- 4£ºÊ£ÓàÈ¡ÏûµÄ´ÎÊı
-- 5£ºÍæ¼Òµ±Ç°Ëù½ÓµÄÈÎÎñºÅ´¢´æÔÚ 1021 ÉÏ
-- 6£ºÍæ¼ÒÔÚÃ¿Ò»»·µÄ¸ÃÁ´ÖĞÒÑ¾­×öÁË¼¸´Î£¬×î´óÎª 4
function SetTaskState(myTaskState,myTaskValue)

local n

	if ( myTaskState <= 4) then
		n = GetTask(1020)
		SetTask(1020,SetByte(n,myTaskState,myTaskValue))
	elseif ( myTaskState == 5) then -- Èç¹ûÊÇ 5 µÄ»°ÔòÊÇ¼ÇÂ¼Íæ¼Òµ±Ç°Ëù½ÓµÄÈÎÎñºÅÔÚ 1021 ÉÏ
		SetTask(1021,myTaskValue)
	elseif ( myTaskState == 6) then
		SetTask(1035,myTaskValue)
	end

end


-- ×Óº¯Êı£¬ÉèÖÃµ±Ç°ÈÎÎñµÄ½ø³Ì×´Ì¬£¬1¡¢2¡¢3
function SetTaskCourse(myTaskCourse)
	SetTask(1028,myTaskCourse)
end


-- ×Óº¯Êı£¬»ñÈ¡µ±Ç°ÈÎÎñµÄ½ø³Ì×´Ì¬£¬1¡¢2¡¢3
function GetTaskCourse()
	return GetTask(1028)
end



--  //////////////////////////////////////////////////////////////
-- //                  ¶Á±íÓëÈÎÎñµÄÊıÖµ´¦Àí                    //
--//////////////////////////////////////////////////////////////

-- ËÑÑ°µÈ¼¶Ïà¶ÔÓ¦ÈÎÎñ±í£¬È·¶¨Íæ¼Òµ±Ç°µÄÈÎÎñÁ´µÚÒ»µÈ¼¶ÊÇÊôÓÚÄÄÒ»¼¶
function GetFirstLink()

	local i
	local myLevel = GetLevel()
	local myTotalCol = tonumber(TabFile_GetRowCount(TL_LEVELLINK))
	
	for i = 2,myTotalCol do
		if (myLevel > tonumber(TabFile_GetCell(TL_LEVELLINK,i,"level"))) then
			
		elseif (myLevel <= tonumber(TabFile_GetCell(TL_LEVELLINK,i,"level"))) then
			if (i == 2) then
				return tonumber(TabFile_GetCell(TL_LEVELLINK,2,"task"))
			end
			return tonumber(TabFile_GetCell(TL_LEVELLINK,i-1,"task"))
		end
	end
	
--	return tonumber(TabFile_GetCell(TL_LEVELLINK,j,"task"))
end


-- ËÑÑ°ÈÎÎñÁ´×Ü±í£¬»ñÈ¡ÏàÓ¦µÈ¼¶µÄËæ»úÀàĞÍÈÎÎñ
-- ´«Èë²ÎÊı myTaskLevel ÎªÈÎÎñÁ´µÄµÈ¼¶ 1~20
-- ·µ»ØÖµÎª 1~6 1£ºÎïÆ·¹ºÂò 2£ºÎïÆ·Ñ°ÕÒ 3£ºÎïÆ·Õ¹Ê¾ 4£ºµØÍ¼ÊÕ¼¯ 5£ºÊıÖµÉı¼¶ 6£ºÉ½ºÓÉçğ¢
function GetTaskType(myTaskLevel)

	local i,j,k = 0,0,0
	local myMainRate = 0 -- ËùÓĞÈÎÎñÀàĞÍÔÚÒ»¸öµÈ¼¶ÀïµÄ×Ü±ÈÂÊ
	local myTaskType -- ·µ»ØµÄÈÎÎñÀàĞÍ
	
	print("mylevel:   "..myTaskLevel)
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		myMainRate = myMainRate + Task_MainLevelRate[myTaskLevel][i]
	end
	
	print ("Tæng cÊp bËc cña nhiÖm vô lµ:"..myMainRate)
	
	
	-- ¸ù¾İÈ¨ÖØ¹«Ê½×îºóËæ»ú¼ÆËã³öÈÎÎñÀàĞÍ
	j = C_Random(1,myMainRate)
	
	print ("Sè cÊp bËc ngÉu nhiªn cña nhiÖm vô lµ:"..j)
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		k = k + Task_MainLevelRate[myTaskLevel][i]
		if ( j < k) then
		print ("KÕt thóc tuÇn hoµn, chän lo¹i nhiÖm vô:"..i)
			return i
		end
		print ("HiÖn t¹i tuÇn hoµn ch­a chän lo¹i nhiÖm vô. Tæng cÊp bËc cña nhiÖm vô lµ:"..k)
	end
	
	-- Òì³£´¦Àí£¬Èç¹ûÍæ¼Ò¶¼Ñ¡²»µ½ÈÎÎñÀàĞÍµÄ»°¾ÍÑ¡ 4
	
	print("Chän lo¹i nhiÖm vô bŞ sù cè!");
	
	return 0

end


-- ËÑÑ°ÈÎÎñÁ´£¬È¡µÃÏàÓ¦µÄÈÎÎñ
-- ·µ»ØÖµÊÇ¸ÃÈÎÎñÔÚ±íÖĞµÄĞĞºÅ
function GetTaskLink(myTaskType,myTaskLevel)

	local myTaskCol -- ¼ÇÂ¼ÈÎÎñµÄĞĞºÅ

	if ( myTaskType == 1 ) then -- Èç¹ûÊÇ¹ºÂòÎïÆ·µÄÈÎÎñ
		myTaskCol = SelectTask(Task_BuyGoods,myTaskLevel)
	elseif ( myTaskType == 2 ) then
		myTaskCol = SelectTask(Task_FindGoods,myTaskLevel)	
	elseif ( myTaskType == 3 ) then
		myTaskCol = SelectTask(Task_ShowGoods,myTaskLevel)	
	elseif ( myTaskType == 4 ) then
		myTaskCol = SelectTask(Task_FindMaps,myTaskLevel)
	elseif ( myTaskType == 5 ) then
		myTaskCol = SelectTask(Task_UpGround,myTaskLevel)
	elseif ( myTaskType == 6 ) then
		myTaskCol = SelectTask(Task_WorldMaps,myTaskLevel)
	end

	return myTaskCol

end







-- ¸ù¾İÈÎÎñÁĞ±íÀïµÄÈ¨ÖØËæ»úÌô³öÈÎÎñ£¬·µ»ØÖµÎªÏàÓ¦ÈÎÎñ±í¸ñµÄĞĞºÅ
function SelectTask(myTaskTable,myTaskLevel)

local i,j,k = 0,0,0
local myMainRate  = 0 -- ÈÎÎñµÄ×ÜÈ¨ÖØ

	print ("Chän ®¼ng cÊp nhiÖm vô:"..myTaskLevel.."  ")
	
	print ("Trong ®¼ng cÊp nhiÖm vô tæng céng cã "..getn(myTaskTable[myTaskLevel]).."  nhiÖm vô ")

	for i=1,getn(myTaskTable[myTaskLevel]) do
		myMainRate = myMainRate + myTaskTable[myTaskLevel][i][2]
	end
	
	print ("Chän tæng cÊp bËc nhiÖm vô cô thÓ:"..myMainRate)
	
	-- ¸ù¾İÈ¨ÖØ¹«Ê½×îºóËæ»ú¼ÆËã³ö¾ßÌåµÄÈÎÎñ
	j = C_Random(1,myMainRate)
	
--	print ("ÈÎÎñµÄ×ÜÈ¨ÖØ:  "..myMainRate)
--	print ("Ëæ»úµ½µÄÈÎÎñÈ¨ÖØ  :  "..j)
	
	for i=1,getn(myTaskTable[myTaskLevel]) do
	
		k = k + myTaskTable[myTaskLevel][i][2]
		
		if ( j < k ) then
--			print ("Ñ¡Ôñµ½ÁË±í¸ñÖĞµÄµÚ  "..myTaskTable[myTaskLevel][i][1].."  ĞĞ¡£")
			return myTaskTable[myTaskLevel][i][1]
		end
			
	end
	
	-- Òì³£´¦Àí£¬Èç¹ûÍæ¼ÒÑ¡²»µ½µÄ»°Ôò·µ»Ø 0
	print ("Chän nhiÖm vô cô thÓ bŞ sù cè!")
	return 0
	
end



-- ×Óº¯Êı£¬·´»ØÒ»¸öÈÎÎñÀàĞÍËù¶ÔÓ¦±í¸ñµÄ×Ö·û±êÊ¶
function GetTaskTextID(myTaskType)

local myTaskTextID

	if (myTaskType == 1) then
		myTaskTextID = TL_BUYGOODS
	elseif (myTaskType == 2) then
		myTaskTextID = TL_FINDGOODS
	elseif (myTaskType == 3) then
		myTaskTextID = TL_SHOWGOODS
	elseif (myTaskType == 4) then
		myTaskTextID = TL_FINDMAPS
	elseif (myTaskType == 5) then
		myTaskTextID = TL_UPGROUND
	elseif (myTaskType == 6) then
		myTaskTextID = TL_WORLDMAPS
	end
	
	return myTaskTextID
end


-- ¼ÆËãÒ»¸öÈÎÎñµÄÈ¨ÖØÔÚÆäµ±Ç°µÈ¼¶ÖĞËùÕ¼µÄ°Ù·Ö±È
-- myTableName ´«ÈëµÄÒª¶ÁÈ¡±í¸ñµÄ×Ö·û
-- myTaskRate µ±Ç°ÈÎÎñµÄÈ¨ÖØ
-- myTableCol Ëù¶Á±íµÄÁĞ(×Ö·û»òÕßÊı×Ö)
function CountTaskRate(myTableName,myTaskRate,myTableCol)

local i
local myTotalRate = 0
local myReadRate
local myPercent

local myTableRow = TabFile_GetRowCount(myTableName) -- »ñÈ¡TABLEÎÄ¼şµÄ×ÜĞĞÊı

	for i = 3,myTableRow-1 do
		myReadRate = tonumber(TabFile_GetCell(myTableName,myTableRow,myTableCol))
		myTotalRate = myTotalRate + myReadRate
		i = i + 1
	end

myPercent = (myTaskRate / myTotalRate) * 100

return myPercent

end



-- ¼ÆËã´Ó¾ÉµÈ¼¶Éı¼¶µ½Íæ¼ÒÄ¿Ç°µÄµÈ¼¶ĞèÒª¶àÉÙ¾­ÑéÖµ
function CountUpLevelExp(myOldLevel,myOldExp)

local i
local myLevel = GetLevel()
local myExp = GetExp()

local myTotalExp = 0

if (myOldLevel<myLevel) then


	for i=myOldLevel,myLevel do
		myTotalExp = myTotalExp + tonumber(TabFile_GetCell(TL_UPLEVELEXP,i+1,2))
	end
	
	myTotalExp = (myTotalExp - myOldExp) - myExp

	return myTotalExp
else
	return myExp - myOldExp
end

end



-- ×Óº¯Êı£¬È¡µÃÈÎÎñÏàÓ¦µÄËµÃ÷£¬·µ»ØÒ»¶Î×Ö·û´®
function GetTaskInfo()

local myTaskMainInfo,myTaskOrder,myTaskInfo1,myTaskInfo2,myTaskInfo3

	local myTaskType = GetPlayerTaskType()
	
	if (myTaskType == 1) then
		
		print("NhËn ®­îc ID:"..GetTaskTableCol())
		
		-- ÎïÆ·Ãû³Æ
		myTaskOrder = TabFile_GetCell(TL_BUYGOODS,GetTaskTableCol(),"TaskInfo1")
		
		print("ThuyÕt minh nhiÖm vô:"..TabFile_GetCell(TL_BUYGOODS,GetTaskTableCol(),"TaskInfo1"))
		
		-- Ä¿µÄµØÃû³Æ
		myTaskInfo1 = TabFile_GetCell(TL_BUYGOODS,GetTaskTableCol(),"TaskInfo")
		
		myTaskMainInfo = format("%s%s%s%s%s","®Õn  ",myTaskInfo1," mua  ",myTaskOrder," gióp ta.");
		
	elseif (myTaskType == 2) then
	 
		-- Ä§·¨ÊôĞÔ
		myTaskOrder = TabFile_GetCell(TL_FINDGOODS,GetTaskTableCol(),"MagicCnName")
		-- ¾ßÌåµÄÎäÆ÷Àà±ğ
		myTaskInfo1 = TabFile_GetCell(TL_FINDGOODS,GetTaskTableCol(),"TaskInfo")
		-- ×îĞ¡Ä§·¨ÊôĞÔ
		myTaskInfo2 = TabFile_GetCell(TL_FINDGOODS,GetTaskTableCol(),"MinValue")
		-- ×î´óÄ§·¨ÊôĞÔ
		myTaskInfo3 = TabFile_GetCell(TL_FINDGOODS,GetTaskTableCol(),"MaxValue")
		
		if (myTaskOrder=="n") then
		
			myTaskMainInfo = format("%s%s%s","§i t×m <color=red>",myTaskInfo1,"<color> gióp ta.");
		else
			myTaskMainInfo = format("%s%s%s%s%s%s%s","§i t×m <color=red>",myTaskOrder,"<color> tèi thiÓu",myTaskInfo2," ",myTaskInfo1," gióp ta.");
		end
		
	elseif (myTaskType == 3) then 
		
		-- Ä§·¨ÊôĞÔÖĞÎÄÃû
		myTaskOrder = TabFile_GetCell(TL_SHOWGOODS,GetTaskTableCol(),"MagicCnName")
		-- Ä§·¨ÊôĞÔµÄ×îĞ¡Öµ
		myTaskInfo1 = TabFile_GetCell(TL_SHOWGOODS,GetTaskTableCol(),"MinValue")
		-- Ä§·¨ÊôĞÔµÄ×î´óÖµ
		myTaskInfo2 = TabFile_GetCell(TL_SHOWGOODS,GetTaskTableCol(),"MaxValue")
		
		myTaskMainInfo = format("%s%s%s%s%s%s%s","§i t×m  trang bŞ hoÆc kho¸ng th¹ch <color=red>",myTaskOrder,"<color> thÊp nhÊt lµ ",myTaskInfo1," cao nhÊt lµ ",myTaskInfo2," ");
		
	elseif (myTaskType == 4) then 
		
		-- µØÍ¼µÄÃû³Æ
		myTaskOrder = TabFile_GetCell(TL_FINDMAPS,GetTaskTableCol(),"TaskInfo1")
		
		-- ËùÒªµÄµØÍ¼ÊıÁ¿
		myTaskInfo1 = TabFile_GetCell(TL_FINDMAPS,GetTaskTableCol(),"Num")
		
		-- µØÍ¼µÄÀàĞÍ
		myTaskInfo2 = TabFile_GetCell(TL_FINDMAPS,GetTaskTableCol(),"MapType")
		
		if (tonumber(myTaskInfo2) == 1) then
			myTaskInfo3 = "§Şa §å chİ "
		else
			myTaskInfo3 = "MËt chİ "
		end
		
		myTaskMainInfo = format("%s%s%s%s%s%s%s%s","§Õn <color=red>",myTaskOrder,"<color> t×m gióp ta",myTaskInfo1," quyÓn",myTaskOrder,myTaskInfo3,"vÒ ®©y.")
		
	elseif (myTaskType == 5) then
		
		-- ĞèÒªÌáÉıµÄÊıÖµÀàĞÍ
		myTaskOrder = TabFile_GetCell(TL_UPGROUND,GetTaskTableCol(),"NumericType")
		
		-- ĞèÒªÌáÉıµÄÊıÖµ×ÜÊı
		myTaskInfo1 = TabFile_GetCell(TL_UPGROUND,GetTaskTableCol(),"NumericValue")
		
		if (tonumber(myTaskOrder) == 1) then
			myTaskInfo2 = " cÊp"
		elseif (tonumber(myTaskOrder) == 2) then
			myTaskInfo2 = "®iÓm kinh nghiÖm "
		elseif (tonumber(myTaskOrder) == 3) then
			myTaskInfo2 = "®iÓm danh väng"
		elseif (tonumber(myTaskOrder) == 4) then
			myTaskInfo2 = "®iÓm phóc duyªn"
		elseif (tonumber(myTaskOrder) == 5) then
			myTaskInfo2 = "®iÓm PK"
		end
		
		myTaskMainInfo = format("%s%s%s%s","§i n©ng cÊp   ",myTaskInfo1," ",myTaskInfo2)
		
	elseif (myTaskType == 6) then
		-- ĞèÒªÊÕ¼¯µÄÉ½ºÓÉçğ¢Í¼²ĞÆ¬
		myTaskOrder = TabFile_GetCell(TL_WORLDMAPS,GetTaskTableCol(),"Num")
		
		myTaskMainInfo = format("%s%s%s","gióp ta thu thËp",myTaskOrder," m¶nh b¶n ®å S¬n Hµ X· T¾c.")
	end

	return myTaskMainInfo
 
end



function AssignValue(myTaskVariable,myTaskTextID)

local i,j,k = 0,0,0
local myTaskIndex = {}
myTaskVariable = {}
myTaskVariable[1] = {}
myTaskVariable[1][1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID)
local myColText
local myReadRate

--	print (format("%s%s%s",myTaskTextID,"  :  ",myTableRow))
	
	for i = 1,20 do
		myTaskVariable[i]={}
		for j=1,myTableRow - 1 do
			myTaskVariable[i][j] = {0,0}
		end
	end

	for i = 1,20 do
		myTaskIndex[i] = 0
	end

	for i = 1,20 do  -- ´ÓµÚÒ»¼¶µ½µÚ¶şÊ®¼¶µÄÀú±éÑ­»·
		for j = 2,myTableRow do
			myColText = format("%s%s","TaskRate",i)
			myReadRate = tonumber(TabFile_GetCell(myTaskTextID,j,myColText))
			
			if (myReadRate ~= nil) then -- Èç¹ûÔÚÈÎÎñÁ´µÈ¼¶È¨ÖØÀïÃæÓĞÊıÖµµÄ»°£¬ÔòÊôÓÚÕâ¸öµÈ¼¶

					myTaskIndex[i] = myTaskIndex[i] + 1
					myTaskVariable[i][myTaskIndex[i]] = {j,myReadRate}
			end
		end
--		print ("The "..myTaskTextID.." 's Task: "..i.." have: "..getn(myTaskVariable[i]).." members.");
	end
	
--	print (format("%s%s%s",myTaskTextID,"  :  ","finshed!!!"))
	
return myTaskVariable

end


-- ËùÓĞÈÎÎñÀàĞÍÔÚÃ¿¸öµÈ¼¶ÖĞ±ÈÂÊµÄË÷Òı
function AssignValue_TaskRate(myTaskVariable,myTaskTextID)

local i,j,k

myTaskVariable = {}
myTaskVariable[1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID) -- »ñÈ¡TABLEÎÄ¼şµÄ×ÜĞĞÊı
local myTableCol -- ºÏ²¢×Ö·û´®£¬¹¹Ôì±íÍ·±êÊ¶£º"level20"
local myRate

	for i = 1,TL_MAXLINKS do
		myTaskVariable[i]={}
		for j=1,6 do
			myTaskVariable[i][j] = 0
		end
	end
	
	k = 0
	
	for i = 1,TL_MAXLINKS do
		for j = 2,myTableRow do
			k = j - 1 
			myTableCol = format("%s%s","level",i)
			myRate = tonumber(TabFile_GetCell(myTaskTextID,j,myTableCol))
			myTaskVariable[i][k] = myRate
--			print ("MyTaskLevel: "..i.."  MyTaskType: "..k.." MyRate:  "..myRate)
		end
	end

return myTaskVariable

end


-- ¹¹Ôì½±ÀøÄÚ´æ±í¸ñ
function AssignValue_Award(myTaskVariable,myTaskTextID)

local i,j = 0,1

myTaskVariable = {}
myTaskVariable[1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID)

	for i = 1,myTableRow - 1 do
		myTaskVariable[i]={}
	end
	
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTaskVariable[i] = {j,tonumber(TabFile_GetCell(myTaskTextID,j,"TaskValue"))}
		print("Lo¹i phÇn th­ëng:"..myTaskTextID.."   PhÇn th­ëng nhiÖm vô ID:"..j.."   Gi¸ trŞ phÇn th­ëng:"..myTaskVariable[i][2])
	end
	
return myTaskVariable
	
end


-- ½¨Á¢½±ÀøÈ¨ÖØË÷Òı±í
-- ´«Èë²ÎÊı£ºmyTaskVariable ÊÇÔ­Ê¼µÄ½±Àø¼ÛÖµÁĞ±í£¬myAwardValue ÊÇ¼ÆËãºóµÄÎïÆ·×Ü¼ÛÖµÁ¿
-- ·µ»ØÖµÎªÃ¿¸ö½±ÀøµÄ±í¸ñÎÄ¼şĞĞºÅË÷ÒıÓëÆäÈ¨ÖØ
function AssignValue_AwardRate(myAwardVariable,myAwardValue)

local i,j = 0,0
local myAwardRate = {} -- ×ª»»ºóµÄÈ¨ÖØ±í
local myAwardNum = getn(myAwardVariable)
	
	for i = 1,myAwardNum do
		myAwardRate[i]={}
	end
	
	for i=1,myAwardNum do
		j=floor((myAwardValue/(myAwardNum*(myAwardVariable[i][2])))*10000000)
		myAwardRate[i] = {i,j}
	end
	
	return myAwardRate
	
end