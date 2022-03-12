-- Ï´ÊôĞÔµãÓÃµÄĞÉºì±¦Ê¯£¬¿ÉÒÔÏ´Îå¸öÊôĞÔµã
-- By Asmik(2004-02-26)

function main()
	Say("Lùa chän lo¹i ®iÓm muèn tÈy:",5,"Søc m¹nh/tune_str","Th©n ph¸p/tune_dex","ViÖc nµy. ta cßn ph¶i vÒ suy nghÜ l¹i /tune_vit","Néi c«ng/tune_eng","VÉn ch­a nghÜ ra /no")
end


function tune_str()
	base_str = {35,20,25,30,20}			-- ÎåĞĞÈËÎïµÄÌìÉúÁ¦Á¿£¬Ï´Ç±ÄÜÊ±²»ÔÊĞíµÍÓÚ´ËÖµ
	i = GetSeries() + 1
	if (GetStrg(1) < base_str[i] + 5) then		-- Ï´ÍêºóÁ¦Á¿»áµÍÓÚÌìÉúÁ¦Á¿£¬²»ÔÊĞíÏ´
		Say("Søc m¹nh cña b¹n ®· ®¹t møc tèi ®a!",1,"ta ®ang suy nghÜ /no")
	else											-- ¿ªÊ¼Ï´Ç±ÄÜ£¬Íê³Éºó×Ô¶¯ÌßÏÂÏß
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
		AddStrg(-5)
--		AddProp(5)				-- AddStrg()º¯ÊıÒÑ¾­¼ÓÁËÎ´·ÖÅäÇ±ÄÜ
	end
end

function tune_dex()
	base_dex = {25,35,25,20,15}
	i = GetSeries() + 1
	if (GetDex(1) < base_dex[i] + 5) then		-- Ï´ÍêºóÉí·¨»áµÍÓÚÌìÉúÉí·¨£¬²»ÔÊĞíÏ´
		Say("Søc m¹nh cña b¹n ®· ®¹t møc tèi ®a!",1,"ta ®ang suy nghÜ /no")
	else											-- ¿ªÊ¼Ï´Ç±ÄÜ£¬Íê³Éºó×Ô¶¯ÌßÏÂÏß
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
		AddDex(-5)
--		AddProp(5)				-- AddStrg()º¯ÊıÒÑ¾­¼ÓÁËÎ´·ÖÅäÇ±ÄÜ
	end
end

function tune_vit()
	base_vit = {25,20,25,30,25}
	i = GetSeries() + 1
	if (GetVit(1) < base_vit[i] + 5) then		-- Ï´ÍêºóÍâ¹¦»áµÍÓÚÌìÉú£¬²»ÔÊĞíÏ´
		Say("Søc m¹nh cña b¹n ®· ®¹t møc tèi ®a!",1,"ta ®ang suy nghÜ /no")
	else											-- ¿ªÊ¼Ï´Ç±ÄÜ£¬Íê³Éºó×Ô¶¯ÌßÏÂÏß
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
		AddVit(-5)
--		AddProp(5)				-- AddStrg()º¯ÊıÒÑ¾­¼ÓÁËÎ´·ÖÅäÇ±ÄÜ
	end
end

function tune_eng()
	base_eng = {15,25,25,20,40}
	i = GetSeries() + 1
	if (GetEng(1) < base_eng[i] + 5) then		-- Ï´ÍêºóÄÚ¹¦»áµÍÓÚÌìÉú£¬²»ÔÊĞíÏ´
		Say("Søc m¹nh cña b¹n ®· ®¹t møc tèi ®a!",1,"ta ®ang suy nghÜ /no")
	else											-- ¿ªÊ¼Ï´Ç±ÄÜ£¬Íê³Éºó×Ô¶¯ÌßÏÂÏß
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
		AddEng(-5)
--		AddProp(5)				-- AddStrg()º¯ÊıÒÑ¾­¼ÓÁËÎ´·ÖÅäÇ±ÄÜ
	end
end

function no()
	AddItem(6, 1, 21, 1, 0, 0, 0)
end