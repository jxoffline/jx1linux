-- xingjiaoshang.lua 
-- ÐÐ½ÅÉÌÈË½Å±¾
-- 2005-09-07 by steve

Include("\\script\\event\\mid_autumn\\mooncake_head.lua")

-- ÓÃ[count]¸ö[type2]ÎïÆ·¶Ò»»[type1]ÎïÆ·µÄ¶Ô»°
function exchange_talk(type1, type2, count)
	-- DEBUG
	print(format("exchange(%d,%d,%d)", type1, type2, count))

	local item1 = tbl_material[type1]
	local item2 = tbl_material[type2]
	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	if (itemcount == 0) then
		-- ²ÄÁÏÒÑ¾­¶Ò»»ÍêÁË
		Say("<#> LÇn nµy " .. item1[1] .. "<#> ®· ®æi hÕt råi! LÇn sau quay l¹i nhe1", 1, "<#> §­îc!/cancel")
	else
		local caption = "<#> §æi 1 " .. item1[1] .. "<#> cÇn cã " .. count .. "<#> " .. item2[1] .. ". Ng­¬i x¸c ®Þnh ®æi chø?"
		local options = {
			"<#> §­îc! Cø nh­ vËy ®i!/" .. format("#exchange(%d,%d,%d)", type1, type2, count),
			"<#> Kh«ng! §Ó ta nghÜ l¹i ®·!/cancel"
		}
		Say(caption, getn(options), options)
	end
end

-- ÓÃ[count]¸ö[type2]ÎïÆ·¶Ò»»[type1]ÎïÆ·
function exchange(type1, type2, count)
	local item1 = tbl_material[type1]
	local item2 = tbl_material[type2]
	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	if (itemcount == 0) then
		-- ²ÄÁÏÒÑ¾­¶Ò»»ÍêÁË
		Talk(1, "", "<#> ThËt ng¹i qu¸! Hµng cña ta ®· b¸n hÕt råi! Quay l¹i sau nhÐ!")
	else
		local exchtime = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME)	-- ±¾´Î¶Ò»»µÄÊ±¼ä
		local lasttime = GetTask(VARV_MOONCAKE_EXCHANGETIME)		-- ÉÏ´Î¶Ò»»µÄÊ±¼ä
		local exchcount = GetTask(VARV_MOONCAKE_EXCHANGECOUNT)		-- ÒÑ¾­¶Ò»»µÄ´ÎÊý
		if (exchtime ~= lasttime) then
			-- ¶Ò»»´ÎÊýÇåÁã
			exchcount = 0
		end
		if (exchcount >= tbl_exchange_limitcount[type1]) then
			-- ´ïµ½ÁË¶Ò»»´ÎÊýÏÞÖÆ
			-- DEBUG
			print(format("exchcount:%d, limitcount:%d", exchcount, tbl_exchange_limitcount[type1]))
			Talk(1, "", "<#> ThËt ng¹i qu¸! Ta ®· mua ®ñ c¸c vËt liÖu råi, sau nµy cÇn g× ta sÏ ghÐ l¹i.") 			
		elseif (CalcEquiproomItemCount(item2[2], item2[3], 1, -1) < count) then
			-- ÓÃÀ´¶Ò»»µÄÎïÆ·ÊýÁ¿²»¹»
			Talk(1, "", "<#> Nguyªn liÖu lµm b¸nh ng­¬i ®em ®Õn vÉn ch­a ®ñ ")
		else
			SetTask(VARV_MOONCAKE_EXCHANGETIME, exchtime)
			SetTask(VARV_MOONCAKE_EXCHANGECOUNT, exchcount + 1)
			WriteLog(format("%s %s(%s): exchange mooncake material %s(%d)==>%s(1)",
				date("%y-%m-%d %H:%M"),
				GetAccount(),
				GetName(),
				item2[1],
				count,
				item1[1]))
			ConsumeEquiproomItem(count, item2[2], item2[3], 1, -1)
			AddEventItem(item1[3])
			SetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT, itemcount - 1)
			Msg2Player("<#> B¹n nhËn ®­îc 1 <color=yellow>" .. item1[1] .. "<color>")
		end
	end
end

-- Ê£Óà¿É¶Ò»»´ÎÊý
function GetLeftCount(type)
	local exchtime = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME)	-- ±¾´Î¶Ò»»µÄÊ±¼ä
	local lasttime = GetTask(VARV_MOONCAKE_EXCHANGETIME)		-- ÉÏ´Î¶Ò»»µÄÊ±¼ä
	local exchcount = GetTask(VARV_MOONCAKE_EXCHANGECOUNT)		-- ÒÑ¾­¶Ò»»µÄ´ÎÊý
	if (exchtime ~= lasttime) then
		-- ¶Ò»»´ÎÊýÇåÁã
		exchcount = 0
	end
	return tbl_exchange_limitcount[type] - exchcount
end

-- ¶Ò»»¶Ô»°
function ExchangeTalk()
	local material_type = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_TYPE)
	local material_name = tbl_material[material_type][1]
	local caption = "<#> Ta chu du c¸c n¬i mua ®­îc kh«ng Ýt kú tr©n b¶o vËt, lÇn nµy ta mang ®Õn ®©y <color=red>" ..
		material_name .. 
		"<#> <color>, nh­ng thø ta cÇn vÉn ch­a mua ®­îc, nÕu nh­ ng­¬i cã " ..
		material_name .. 
		"<#> chóng ta cã thÓ trao ®æi <color=red>" ..
		GetLeftCount(material_type) ..
		"<color>."
	local exchanges = GetExchangeList(material_type)
	local options = {}
	local index = 1
	while (index <= getn(exchanges)) do
		local obj_type = exchanges[index][1]
		local obj_count = exchanges[index][2]
		local obj_name = tbl_material[obj_type][1]
		local func = format("#exchange_talk(%d,%d,%d)", material_type, obj_type, obj_count)
		options[index] = "<#> Ta muèn dïng " .. obj_name .. "<#> ®Ó trao ®æi/" .. func
		index = index + 1
	end
	options[index] = "<#> Kh«ng! §Ó ta nghÜ l¹i ®·!/cancel"
	
	Say(caption, getn(options), options)		
end

function OnTimer()
	-- ¹Ø±Õ¶¨Ê±Æ÷
	StopGlbMSTimer(MISSION_MOONCAKE_EXCHANGE, TIMER_MOONCAKE_EXCHANGE)
	-- ÉèÖÃ¶Ò»»²ÄÁÏ×´Ì¬Îª¿ªÊ¼
	SetGlbValue(GBL_VAR_MOONCAKE_EXCHANGING, 1)
	-- ÉèÖÃ±¾´Î¶Ò»»µÄÊ±¼ä£¬ÓÃÀ´ÅÐ¶ÏÍæ¼ÒµÄ¶Ò»»´ÎÊýÏÞÖÆ
	SetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME, GetCurrentTime())
	-- ¹«¸æ
	local city = GetGlbValue(GBL_VAR_MOONCAKE_CITY)
	local type = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_TYPE)
	-- DEBUG
	print(format("material type:%d", type))
	local itemname = tbl_material[type][1]
	local news = "<#> Nghe nãi ë " ..
		tbl_cities[city] ..
		"<#> cã Hµnh C­íc th­¬ng nh©n mang theo rÊt nhiÒu phÈm vËt th­îng h¹ng" ..
		itemname ..
		"<#>, nh­ng b¸n hÕt lµ «ng ta ®i ngay!"
	-- DEBUG
	print(news)
	AddGlobalNews(news)
	AddGlobalNews(news)
	AddGlobalNews(news)
	Msg2SubWorld(news)

	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	WriteLog(format("%s: mooncake material quota: %s(%d)",
		date("%y-%m-%d %H:%M"),
		itemname,
		itemcount))
	-- DEBUG
	print("news: " .. news)
end

function main()
	local exchanging = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGING)
	-- DEBUG
	print(format("exchanging: %d", exchanging))
	local msg = format("GetGlbValue(%d): %d", GBL_VAR_MOONCAKE_EXCHANGING, exchanging)
	print(msg)
	local mapid = GetGlbValue(GBL_VAR_MOONCAKE_CITY)
	if (mapid ~= SubWorldIdx2ID(SubWorld) or exchanging ~= 1) then
		-- »¹Ã»¿ªÊ¼¶Ò»»ÔÂ±ý²ÄÁÏ
		Talk(1, "", "<#> Çy! N¨m nay khã lµm ¨n qu¸! B¹n hµng cña ta kh«ng biÕt sao giê nµy vÉn ch­a giao hµng tíi!")
	else
		ExchangeTalk()
	end
end
