--  GetGlbValue(9)  ¼ÇÂ¼Ê±¼ähour
--  GetGlbValue(8)  ¼ÇÂ¼ÁìÈ¡´ÎÊı
--  GetTask(615)    ¼ÇÂ¼Ò»Ğ¡Ê±ÄÚÊÇ·ñÓĞÁì¹ı½±
--  Ê¥µ®Ê÷ËÍÀñ»î¶¯£¬Ã¿Ğ¡Ê±Ã¿Ì¨·şÎñÆ÷ËÍ13¸öÀñÎï£¬Ã¿ÈËÃ¿Ğ¡Ê±Ö»ÄÜÁìÈ¡Ò»¸ö
--  ´Ë»î¶¯´Ó12ÔÂ22ÈÕ³ÖĞøµ½1ÔÂ11ÈÕ


function main()

	iRand = random(1,300)
	if ( iRand < 100 ) then
		Say("Ta cÇu nguyÖn bªn C©y Th«ng, ®ét nhiªn ph¸t hiÖn trªn c©y cã 1 vËt ph¸t s¸ng.",2,"Hay qu¸! ThËt lµ hÊp dÉn!/present","Ta sÏ chuyªn t©m h¬n!/no")
	else
		Say("Ng­êi ch¬i: C©y Th«ng ®Ñp qu¸! CÇu nguyÖn ë chç nµy sÏ thµnh hiÖn thËt!",0)
	end

end

function present()

	local nLastTime = GetGlbValue(9)
	local nQuantity = GetGlbValue(8)
	local Utask615 = GetTask(615)
	local nHour = tonumber( date( "%m%d%H" ) )
	local nMinute = tonumber( date( "%M") )
	
	if ( nLastTime == 0 and mod( nHour , 100 ) ~= 0 and nMinute < 30 ) then
		SetGlbValue(9,nHour - 1)
		SetGlbValue(8,0)
		AddLocalNews("***¤ng giµ Noel ®Ó nhiÒu quµ trªn C©y Th«ng, mäi ng­êi mau ®Õn lÊy ®i!***")
	elseif ( nLastTime ~= nHour and nMinute >= 30 ) then
		SetGlbValue(9,nHour)
		SetGlbValue(8,0)
--		Msg2Player("New hour : ["..nHour.."o'clock] Reset")
		AddLocalNews("***¤ng giµ Noel ®Ó nhiÒu quµ trªn C©y Th«ng, mäi ng­êi mau ®Õn lÊy ®i!***")
	end
	nLastTime = GetGlbValue(9)
	nQuantity = GetGlbValue(8)
	if ( Utask615 ~= nLastTime and nQuantity <= 14 ) then
		onTake()
		SetGlbValue(8,nQuantity + 1)
		SetTask(615,nLastTime)
--		Msg2Player("AddItem 1,total = "..nQuantity + 1)
	elseif ( Utask615 == nLastTime ) then
		Say("§õng cã tham thÕ! H·y nh­êng c¬ héi cho ng­êi kh¸c víi!",0)
	else
		Say("§å tèt chíp m¾t ®· bŞ lÊy hÕt, 1 giê sau h·y quay l¹i thö vËn may ®i!",0)
--		SetTask(615,nHour)
	end		

end

function onTake()

	i = random(1,100000)
	if ( i < 40000 ) then
		AddItem(6,0,20,1,0,0,0)
		Msg2Player("å! Lµ mét ®ãa hoa hång! Ta muèn tÆng nã cho ng­êi yªu.")
	elseif ( i < 85000 ) then
		AddItem(6,0,11,1,0,0,0)
		Msg2Player("å! Lµ 1 c©y Ph¸o hoa, ta sÏ b¾n cho mäi ng­êi xem.")
	elseif ( i < 90000 ) then
		AddItem(6,1,72,1,0,0,0)
		Msg2Player("å! Lµ 1 b×nh Thiªn S¬n B¶o Lé! Hy väng nã sÏ ®em l¹i may m¾n cho ta.")
	elseif ( i < 95000 ) then
		AddItem(6,1,73,1,0,0,0)
		Msg2Player("Ha! 1 b×nh B¸ch Qu¶ Lé, ta ®ang cÇn nã ®Êy!")
	else
		AddItem(6,1,125,1,0,0,0)
		Msg2Player("Ha? 1 b×nh QuÕ Hoa töu, ta muèn t×m mét ng­êi b¹n cïng nhau ®èi Èm!")
	end

end

function no()
end
