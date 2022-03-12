IL("DICEITEM")
Include("\\script\\missions\\yandibaozang\\include.lua")

function YDBZ_DiceDice(ng,gd,np,ntime,double)
	local nRet = ApplyItemDice(1, 100,ntime, "\\script\\missions\\yandibaozang\\saizi.lua", "YDBZ_OnTimeOver", GetTeamSize())
	-- print(nRet)
	local nBody = 0
	AddDiceItemInfo(nRet,0,ng,gd,np,1,double,1,1,1,1,1)
	local nPlayerOld = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		RollItem(nRet)
	end
		PlayerIndex = nPlayerOld
end

function YDBZ_OnTimeOver(dwID)
	-- print("TimeOver!!")
	YDBZ_show_roll_info(dwID)
end

function YDBZ_show_roll_info(dwID)
	local t, nSize, szItem,quality,nGenre,nDetial,nPart,nLevel,nSeries = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	local ndsign = 0
	local oldplayindex = PlayerIndex
	local ndouble = YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1)
	for index, value in t do
		--print(PlayerIndex,nGenre,nDetial,nPart)
		PlayerIndex = value[5]
		if GetName() == value[1] then	-- µ±È»Íæ¼ÒÈÔÈ»ÔÚÏß²ÅÏÔÊ¾Ïà¹ØÐÅÏ¢
			--print(index)
			local str = "<color=yellow>"..value[1].."<color>§æ xóc x¾c <color=yellow>"..value[2].." ®iÓm<color>."
			if value[3] == 0 then
				str = "<color=yellow>"..value[1].."<color> hñy bá"
			elseif value[3] == 2 then
				if value[4] == 1 then
					if oldplayindex == value[5] and nSeries == 1 and ndouble == 1 then
						if random(1,100) < 50 then
							str = str .. "<color=yellow>[Viªm §Õ LÖnh cã hiÖu lùc]<color>"
							ndsign = 1
						else
							str = str .. "<color=blue>[Viªm ®Õ lÖnh mÊt hiÖu lùc]<color>"
							
						end
						--¼ÇÂ¼log
						if nGenre == 6 and nDetial == 1 and nPart == 1606 then
							YDBZ_sdl_writeLog("V­ît ¶i b¶o tµng viªm ®Õ","Trong qu¸ tr×nh v­ît ¶i thu ®­îc 1 Viªm §Õ ®å ®»ng")
						end	
						if nGenre == 6 and nDetial == 1 and nPart == 1605 then
							YDBZ_sdl_writeLog("V­ît ¶i b¶o tµng viªm ®Õ","Trong lóc v­ît ¶i thu ®­îc 1 h×nh ném")
						end			
					end
					str = str..format(" -- nhÆt ®­îc <color=yellow>%s<color>",szItem)
				end
				bAllGiveUp = 0
			end
			PlayerIndex = oldplayindex
			Msg2Player(str)
			if ndsign == 1 then
				local ndix = AddItem(nGenre,nDetial,nPart,1,0,0)
				if ndix <=0 then
					--ndix = AddItem(nGenre,nDetial,nPart,1,0,0)
					--print(ndix)
				end
				YDBZ_sdl_writeLog("V­ît ¶i b¶o tµng viªm ®Õ",format("Lóc v­ît ¶i thu ®­îc 1 %s",GetItemName(ndix)))
			end
		end
	end
	if bAllGiveUp == 1 then
		Msg2Player("TÊt c¶ ng­êi ch¬i ®Òu hñy bá råi")
	elseif nSize ~= getn(t) then
		Msg2Player("Ng­êi ch¬i kh¸c v× qu¸ h¹n thêi gian, nªn tÝnh lµ hñy bá")
	end
end

function YDBZ_sdl_writeLog(sztitle,szevent)	--¼ÇÂ¼,sztitle=ÊÂ¼þÃû,szevent=ÊÂ¼þÄÚÈÝ
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end