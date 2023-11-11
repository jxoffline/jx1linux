-------------------------------------------------------------------------
-- FileName		:	posthouse.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-05 16:28:14
-- Desc			:	ËÍÐÅÈÎÎñ³µ·ò½Å±¾
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊý¾Ý±í¸ñµÄÀµ
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀµ
Include("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua") --°üº¬Íæ¼ÒËÀÍö½Å±¾
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷

function messenger_wagoner()
	Uworld1201 = nt_getTask(1201)
	Uworld1202 = nt_getTask(1202)
	Uworld1203 = nt_getTask(1203)
	Uworld1204 = nt_getTask(1204)	
	if ( messenger_gettime() == 10 ) then
		Msg2Player("Xin lçi, nhiÖm vô tÝn sø cña ngµi ®· qu¸ h¹n.")
		return
	end

	if ( Uworld1201 ~= 0 ) then
		if ( Uworld1201 == 10 ) then
			Say("TiÕn vµo b¶n ®å sao ?",2,"Muèn/messenger_flywagoner","Kh«ng/no")
		elseif ( Uworld1201 == 30 ) then
			for i=1,getn(citygo) do 
				if ( Uworld1204 == citygo[i][2]) then
					Msg2Player("ThËt xin lçi, ng­¬i cßn cã nhiÖm vô tÝn sø ch­a hoµn thµnh, xin mêi ®i ®Õn "..citygo[i][4].." DÞch Tr¹m ®Ó tho¸t nhiÖm vô")
				end
			end
		end
	elseif ( Uworld1202 ~= 0 ) then
		if ( Uworld1202 == 10 ) then
			Say("B¹n muèn vµo khu vùc",2,"Muèn/messenger_templewagoner","Kh«ng/no")
		elseif ( Uworld1202 == 30 ) then
			for i=1,getn(citygo) do   --±í¸ñÓ¦¸ÃÓÐËù²»Í¬£¿£¿
				if ( Uworld1204 == citygo[i][2]) then   --£¿£¿
					Msg2Player("ThËt xin lçi, ng­¬i cßn cã nhiÖm vô tÝn sø ch­a hoµn thµnh, xin mêi ®i ®Õn "..citygo[i][4].." DÞch Tr¹m ®Ó tho¸t nhiÖm vô")
				end
			end
		end
	elseif ( Uworld1203 ~= 0 ) then
		if ( Uworld1203 == 10 or Uworld1203 == 20 or Uworld1203 == 21 ) then
			Say("TiÕn vµo b¶n ®å sao ?",2,"Muèn/messenger_storewagoner","Kh«ng/no")
		elseif ( Uworld1203 == 30 ) then
			for i=1,getn(citygo) do   --±í¸ñÓ¦¸ÃÓÐËù²»Í¬£¿£¿
				if ( Uworld1204 == citygo[i][2]) then   --£¿£¿
					Msg2Player("ThËt xin lçi, ng­¬i tÝn cho nhiÖm vô ®· hoµn thµnh, nh­ng lµ cßn ch­a giao vÒ, xin ng­¬i giao vÒ nhiÖm vô"..citygo[i][4].."ë dÞch tr¹m tho¸t nhiÖm vô") --£¿£¿
				end
			end
		end
	else
		Msg2Player("ThËt xin lçi, ng­¬i nh­ cò cßn ch­a ®¹t ®­îc ®­a tÝn sø nhiÖm vô , xin mêi t×m dÞch quan tiÕp nhËn vô.")
	end
end
function messenger_flywagoner()
	SetRevPos(80,40)
	if ( GetLevel() >=60 ) and ( GetLevel() <= 89 ) then
		NewWorld(387,1582,3137)
	elseif ( GetLevel() >=90 ) and ( GetLevel() <= 119 ) then
		NewWorld(388,1582,3137)
	elseif ( GetLevel() >= 120 ) then
		NewWorld(389,1582,3137)
	end
end
function messenger_templewagoner()
	SetRevPos(176,70)
	if ( GetLevel() >=60 ) and ( GetLevel() <= 89 ) then
		NewWorld(390,1312,3198)
	elseif ( GetLevel() >=90 ) and ( GetLevel() <= 119 ) then
		NewWorld(391,1312,3198)
	elseif ( GetLevel() >= 120 ) then
		NewWorld(392,1312,3198)
	end
end

function messenger_storewagoner()
	--SetRevPos(11,10)
	
	--NewWorld(395,1417,3207)
	
	if ( GetLevel() >=60 ) and ( GetLevel() <= 89 ) then
		NewWorld(393,1417,3207)
	elseif ( GetLevel() >=90 ) and ( GetLevel() <= 119 ) then
		NewWorld(394,1417,3207)
	elseif ( GetLevel() >= 120 ) then
		NewWorld(395,1417,3207)
	end

end
