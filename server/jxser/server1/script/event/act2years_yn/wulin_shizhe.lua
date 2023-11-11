--2007Äê-Ô½ÄÏÇéÒå½­ºþ×ÊÁÏÆ¬
--¡ª¡ª½£Íø2ÖÜÄêÉúÈÕ»î¶¯°æ
--´Ó2007Äê06ÔÂ11ÈÕÖÁ2007Äê07ÔÂ01ÈÕ
--by fmz
--ÎäÁÖÊ¹Õß,Ô½ÄÏ2007¹úÇì»î¶¯
--modify by Ð¡ÀË¶à¶à

--ACT2YEARS_YN_CELLPAPER_ID = 1436        --²£Á§Ö½µÄID
--ACT2YEARS_YN_BOWKNOT_ID = 1437          --ºûµû½áµÄID
--ACT2YEARS_YN_ROSE_ID =  1438            --Ãµ¹å»¨µÄID
--ACT2YEARS_YN_WHITEBOX_ID =  1439        --°×É«ÀñºÐ
--ACT2YEARS_YN_BLUEBOX_ID =   1441        --À¶É«ÀñºÐ
--ACT2YEARS_YN_YELLOWBOX_ID = 1440        --»ÆÉ«ÀñºÐ
--ACT2YEARS_YN_NORMALCAKE_ID =1442        --ÔÂ±ý
--ACT2YEARS_YN_MIDCAKE_ID = 1443          --ÖÐÐÍÔÂ±ý
--ACT2YEARS_YN_SPECIALCAKE_ID = 1444      --ÌØÊâÔÂ±ý
ACT2YEARS_YN_BEGINTIME = 070825     --»î¶¯¿ªÊ¼ÈÕÆÚ
ACT2YEARS_YN_ENDTIME = 070909       --»î¶¯½áÊøÈÕÆÚ
--
--2007Ô½ÄÏ¹úÇì»î¶¯
GUOQING_YN_TASK_DATE = 1831					--¼ÇÂ¼ÁìÈ¡Ê±ÆÚ,1.Ê±¼ä(Äê%y),2.Ê±¼ä(ÔÂ)£¬3.Ê±¼ä(ÈÕ),4.ÁìÈ¡´ÎÊý
GUOQING_YN_TASK_COUNT = 0 				--¼ÇÂ¼ÁìÈ¡´ÎÊý
GUOQING_YN_WUJIAOXING_ID = 1494			--Ê¤ÀûÎå½ÇÐÇ
GUOQING_YN_LiHe_ID = 1495						--¹úÇìÀñºÐID
--
function Act2Years2007_CheckInTime()
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if nDate > ACT2YEARS_YN_ENDTIME or nDate < ACT2YEARS_YN_BEGINTIME then
        return 0
    else
        return 1
    end
end
--
function main()
    --if Act2Years2007_CheckInTime() == 1 then
        --Say("ÈÈÁÒ×£ºØÎäÁÖ´«ÆæÁ½ÖÜÄêµÄÉúÈÕ¡£<enter>´Ó2007Äê06ÔÂ11ÈÕÖÁ2007Äê07ÔÂ11ÈÕÆÚ¼ä½«»áÔÚ½­ºþÉÏ³öÏÖ×îÃÀÀöºÍ·Ò·¼µÄÃµ¹å»¨£¬Èç¹ûÄãÄÜÊÕ¼¯µ½Ò»Ð©£¬ÎÒ½«ÓÐºñÀñÏàÔù¡£",
        --5,"¶Ò»»°×É«ÀñÆ·ºÐ/WLSZ_ExcWhiteBox","¶Ò»»À¶É«ÀñÆ·ºÐ/WLSZ_ExcBlueBox","¶Ò»»»ÆÉ«ÀñÆ·ºÐ/WLSZ_ExcYellowBox",
        --"ÏêÏ¸ËµÃ÷/WLSZ_ExcDetail","½áÊø¶Ô»°/WLSZ_End")
    if Act2Years2007_CheckInTime() == 1 then
    		Describe("Sø gi¶ vâ l©m: NhiÖt liÖt chóc mõng ngµy Quèc Kh¸nh. Trong kho¶ng thêi gian tõ <color=red>25-08-2007<color> ®Õn <color=red>09-09-2007<color>, ng­êi ch¬i cã thÓ ®em 10 <color=yellow>Ng«i sao chiÕn th¾ng<color> vµ <color=yellow>15 v¹n l­îng<color> ®Ó ®æi lÊy  <color=yellow>Hép quµ Quèc Kh¸nh<color>.<color=yellow>Bªn trong hép quµ Quèc Kh¸nh<color> cã chøa Huy ch­¬ng Quèc Kh¸nh vµ c¸c m¶nh b¶n ®å. NÕu thu thËp ®ñ 12 m¶nh b¶n ®å kh¸c nhau sÏ cã c¬ héi <color=yellow>më réng r­¬ng thø 3<color>.",3,
    				"Ta muèn ®æi hép quµ Quèc Kh¸nh/GuoQing_Give",
    				"C¸ch ®æi hép quµ Quèc Kh¸nh/guoQing_About",
    				"BiÕt råi/no"
    			)
    else		
        Say("Ta chÝnh lµ sø gi¶ vâ l©m.",0)
    end
end
--
function WLSZ_End()    
end
--
function WLSZ_ExcWhiteBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    if nRoseNumber < 10 then
        return Say("CÇn 10 hoa hång ®á",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_WHITEBOX_ID,1,0,0 )
    Msg2Player("§æi 10 hoa hång ®á lÊy hép quµ tr¾ng")
    Say("B¹n nh©n ®­îc 1 <color=red>Hép quµ tr¾ng<color>, bªn trong cã nh÷ng mãn quµ bÊt ngê.",2,"Trë l¹i/main","KÕt thóc ®èi tho¹i/WLSZ_End")
end
--
function WLSZ_ExcBlueBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    local nBOWKNOTNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_BOWKNOT_ID, -1 )
    if nRoseNumber < 10 or nBOWKNOTNumber < 1 then
        return Say("CÇn 10 hoa hång ®á vµ 1 n¬ ®á.",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    ConsumeEquiproomItem( 1,6,1,ACT2YEARS_YN_BOWKNOT_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_BLUEBOX_ID,1,0,0 )
    Msg2Player("§æi 10 hoa hång ®á vµ 1 n¬ ®á lÊy hép quµ xanh.")
    Say("B¹n nh©n ®­îc 1 <color=red>Hép quµ xanh<color>, bªn trong cã nh÷ng mãn quµ bÊt ngê.",2,"Trë l¹i/main","KÕt thóc ®èi tho¹i/WLSZ_End")
end
--
function WLSZ_ExcYellowBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    local nCellPaperNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_CELLPAPER_ID, -1 )
    if nRoseNumber < 10 or nCellPaperNumber < 1 then
        return Say("CÇn 10 hoa hång ®á vµ 1 giÊy gãi hoa.",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    ConsumeEquiproomItem( 1,6,1,ACT2YEARS_YN_CELLPAPER_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_YELLOWBOX_ID,1,0,0 )
    Msg2Player("§æi 10 hoa hång ®á vµ 1 giÊy gãi hoa lÊy Hép quµ vµng.")
    Say("B¹n nh©n ®­îc 1 <color=red>Hép quµ vµng<color>, bªn trong cã nh÷ng mãn quµ bÊt ngê.",2,"Trë l¹i/main","KÕt thóc ®èi tho¹i/WLSZ_End")
end
--
function WLSZ_ExcDetail()
    Say("Nguyªn t¾c ®æi hép quµ: <enter>Hép quµ tr¾ng: 10 hoa hång ®á <enter>Hép quµ xanh: 10 hoa hång ®á vµ 1 n¬ ®á <enter> Hép quµ vµng: 10 hoa hång ®á vµ 1 giÊy gãi hoa.",2,"Trë l¹i/main","KÕt thóc ®èi tho¹i/WLSZ_End")
end

--2007Ô½ÄÏ¹úÇì»î¶¯..
function guoQing_About()
	Describe("Sø gi¶ vâ l©m: Trong kho¶ng thêi gian tõ <color=red>25-08-2007<color> ®Õn <color=red>09-09-2007<color>, ng­êi ch¬i cã thÓ ®em 10 <color=yellow>Ng«i sao chiÕn th¾ng<color> vµ <color=yellow>15 v¹n l­îng<color> ®Ó ®æi lÊy 1 <color=yellow>Hép quµ Quèc Kh¸nh<color>. <color=yellow>Ng«i sao chiÕn th¾ng<color> sÏ r¬i ra ë c¸c khu vùc cÊp tõ 50 trë lªn. <color=yellow>Bªn trong hép quµ Quèc Kh¸nh<color> cã chøa Huy ch­¬ng Quèc Kh¸nh vµ c¸c m¶nh b¶n ®å. NÕu thu thËp ®ñ c¸c m¶nh b¶n ®å ®¸nh sè tõ 1 ®Õn 12  sÏ cã c¬ héi <color=yellow>më réng r­¬ng thø 3<color>.",1,"KÕt thóc ®èi tho¹i/WLSZ_End")
end

function GuoQing_Give()
	local nGuoqingLiHe = CalcEquiproomItemCount( 6,1,GUOQING_YN_WUJIAOXING_ID, -1 )

	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(GUOQING_YN_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCount = GetByte(nLibao,4);
	

	if ( nOlddate == nDate and nCount >= 50) then
			Say("Sø gi¶ vâ l©m: ThËt ®¸ng tiÕc, mçi nh©n vËt mçi ngµy chØ cã thÓ ®æi ®­îc tèi ®a 50 <color=yellow>hép quµ Quèc Kh¸nh<color>, ngµy mai h·y ®Õn ®æi nhÐ.",0)
			return 1;
	end
	
	if nGuoqingLiHe < 10 then
		Say("Sø gi¶ vâ l©m: ThËt ®¸ng tiÕc, kh«ng ®ñ 10 Ng«i sao chiÕn th¾ng, kh«ng thÓ ®æi hép quµ Quèc Kh¸nh.",0)
		return 
	end
	
	if GetCash() < 150000 then
		Say("Sø gi¶ vâ l©m: ThËt ®¸ng tiÕc, kh«ng mang ®ñ 15 v¹n l­îng, kh«ng thÓ ®æi hép quµ Quèc Kh¸nh.",0)
		return
	end
	if ( CalcFreeItemCellCount() < 2 ) then
		Say("Kh«ng ®ñ chç trèng, h·y s¾p xÕp l¹i hµnh trang.",0);
		return
	end
	if ( nOlddate ~= nDate ) then
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),4,0));
	end
	Pay(150000)
	nCount = GetByte(GetTask(GUOQING_YN_TASK_DATE),4);
	SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),4,nCount+1))
	ConsumeEquiproomItem( 10,6,1,GUOQING_YN_WUJIAOXING_ID,-1 )
 	local nidx = AddItem(6,1,GUOQING_YN_LiHe_ID,1,0,0 )
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 <color=yellow>Hép quµ Quèc Kh¸nh<color>.")
	WriteLog(format("[WuLinShiZhe]Date:%s\t Account:%s\t Name:%s\t Effect:GetItem %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)))
end
