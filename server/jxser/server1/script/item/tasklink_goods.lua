
-- ¹ÖÎïµØÍ¼ÒÔ¼°É½ºÓÉçğ¢Í¼²ĞÆ¬µôÂä½Å±¾
-- Edited by peres
-- 2004/12/25 Ê¥µ®½ÚÍíÉÏ

IncludeLib("BATTLE");
Include("\\script\\task\\newtask\\newtask_head.lua"); 
Include("\\script\\task\\newtask\\map_index.lua"); -- ÓÃÓÚ»ñÈ¡µØÍ¼µÄĞÅÏ¢
Include("\\script\\task\\newtask\\lib_setmembertask.lua"); -- ÓÃÓÚÑ­»·¸Ä±ä¶ÓÓÑµÄÈÎÎñ±äÁ¿

function PickUp( nItemIndex, nPlayerIndex )

local nPreservedPlayerIndex = PlayerIndex
local nMemCount = GetTeamSize()

	if (nMemCount == 0) then
	
		AddMapValues();
	
	else
	
		for i = 1, nMemCount do -- ÔÚÕâÀï¿ªÊ¼Ñ­»·±éÀúÃ¿¸öÍæ¼Ò
		
			PlayerIndex = GetTeamMember(i);
		
			AddMapValues();

		end
	
		PlayerIndex = nPreservedPlayerIndex; -- Ñ­»·½áÊøºóÔÚÕâÀï¹é»¹Ö÷Íæ¼Ò ID
	
	end
	
	return 0

end


-- ¸ù¾İ¸÷ÖÖÌõ¼ş¸øÓèÍæ¼Ò²»Í¬ÀàĞÍµÄµØÍ¼Ö¾
function AddMapValues()

local myMapID, myMapName, myMapX, myMapY -- ÓÃÓÚ»ñÈ¡µØÍ¼Ö¾ĞÅÏ¢µÄ±äÁ¿
local myTaskType = nt_getTask(1021)
local nWorldMaps = nt_getTask(1027) -- ¿´¿´Íæ¼ÒÉíÉÏÓĞ¶àÉÙ¸öÉ½ºÓÉçğ¢Í¼
local myMapNum = nt_getTask(1025) -- ÅĞ¶ÏÍæ¼ÒÉíÉÏÓĞ¶àÉÙÕÅµØÍ¼Ö¾

myMapID = SubWorldIdx2ID( SubWorld )

	if (myTaskType == 4) then
		
		myMapName, myMapX, myMapY = tl_getMapInfo(myMapID)
		
		if (myMapName == 0) or (myMapName == nil) then -- ·ÀÖ¹¿Õ×Ö·û´¦Àí
			myMapName = ""
		end
		
		-- ¸øÍæ¼ÒÔö¼ÓÒ»¾íµ±Ç°µØÍ¼µÄµØÍ¼Ö¾
		if (nt_getTask(1031) == myMapID) then
		
			if (GetByte(nt_getTask(1032),1) == 1) then
				
				myMapNum = myMapNum + 1
				nt_setTask(1025,myMapNum)
				Msg2Player("B¹n nhËn ®­îc mét tÊm"..myMapName.."§Şa §å chİ! HiÖn t¹i b¹n cã tæng céng"..myMapNum.." tÊm.");
				
				return 0
			end
		end
		
		-- ¸øÍæ¼ÒÔö¼ÓÒ»¸öÉ½ºÓÉçğ¢Í¼²ĞÆ¬
		nWorldMaps = nWorldMaps + 1
		nt_setTask(1027,nWorldMaps)
		Msg2Player("B¹n nhËn ®­îc mét m¶nh b¶n ®å S¬n Hµ X· T¾c! HiÖn t¹i b¹n cã tæng céngt"..nWorldMaps.." m¶nh b¶n ®å S¬n Hµ X· T¾c.");
		
	else
		-- ¸øÍæ¼ÒÔö¼ÓÒ»¸öÉ½ºÓÉçğ¢Í¼²ĞÆ¬
		nWorldMaps = nWorldMaps + 1
		nt_setTask(1027,nWorldMaps)
		Msg2Player("B¹n nhËn ®­îc mét m¶nh b¶n ®å S¬n Hµ X· T¾c! HiÖn t¹i b¹n cã tæng céngt"..nWorldMaps.." m¶nh b¶n ®å S¬n Hµ X· T¾c.");
	end

end