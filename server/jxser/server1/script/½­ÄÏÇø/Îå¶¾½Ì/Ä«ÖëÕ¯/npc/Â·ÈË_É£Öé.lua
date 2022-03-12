-- Îå¶¾ Â·ÈËNPC Ä«ÖëÕ¯Ö÷É£Öé 10¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-05)

-- ĞŞ¸ÄºóÓëĞ°½ÌÖ÷ÏßÏà¹ØµÄÉ£Öé½Å±¾
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\global\\skills_table.lua");

function main()

-- ĞÂÈÎÎñÏµÍ³ÓëĞ°½ÌÖ÷ÏßÏà¹ØµÄ½Å±¾ --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

		
	if (myTaskValue==150) then
		task_level30_14();
		return
	end


-- ĞÂÈÎÎñÏµÍ³ÓëĞ°½ÌÖ÷ÏßÏà¹ØµÄ½Å±¾ --


	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 10*256+10) then		--10¼¶ÈÎÎñ½øĞĞÖĞ
			i = GetItemCount(86)
			if (i >= 10) and (HaveItem(220) == 1) then
				Talk(1,"L10_prise","Tang tr¹i chñ! §©y lµ nhÒn nhÖn vµ tİn th¹ch mµ ng­êi cÇn")
			else
				Talk(1,"","§å vËt vÉn ch­a cã ®ñ, t¹i sao l¹i chËm nh­ vËy? Mau lªn! Mau lªn!")
			end
		elseif ((UTask_wu == 10*256) and (GetLevel() >= 10)) then		--10¼¶ÈÎÎñ
			Say("VËt liÖu ®Ó cho ta luyÖn c«ng vÉn cßn thiÕu. Ng­¬i h·y ®i lªn Nh¹n §·ng s¬n b¾t thªm cho ta 10 con nhÖn vµ mua thªm 10 bao tİn th¹ch",2,"Tu©n lÖnh!/L10_get_yes","ThËt xin lçi! T¹i h¹ cßn cã chuyÖn ph¶i lµm!/L10_get_no")
		else							-- ³£¹æ¶Ô»°
			Talk(1,"","C¸i tªn b¾t cãc con cña ta vÉn cßn sèng sê sê. NÕu nh­ ta b¾t ®­îc h¾n th× ta sÏ phÕ hÕt x­¬ng cèt cña h¾n, sau ®ã dïng th©n thÓ cña h¾n ®Ó luyÖn 'Tri thï ®éc'. Ta sÏ lµm cho h¾n ®au ®ín, muèn chÕt kh«ng ®­îc, muèn sèng kh«ng xong!")
		end
	else
		Talk(1,"","Kh«ng biÕt con trai ta b©y giê sao råi, cã ®­îc b×nh an v« sù kh«ng….")
	end

end;

function L10_get_yes()
	Talk(1, "", "Mau ®i mau vÒ! Ta ®ang cÇn dïng!")
	SetTask(10,10*256+10)
	AddNote("Gióp Tang Ch©u t×m 10 con nhÖn vµ 10 bao Tİn th¹ch.")
	Msg2Player("Gióp Tang Ch©u t×m 10 con nhÖn vµ 10 bao Tİn th¹ch.")
end;

function L10_get_no()
	Talk(1,"","Hay l¾m! ThËt kh«ng thÓ tin ®­îc!")
end;

function L10_prise()
	Talk(1,"","Tèt l¾m! Ng­¬i lui ra ®i! §õng cã ng¨n trë ta luyÖn c«ng!")
	DelItem(220)
	for i = 1, GetItemCount(86) do DelItem(86) end
	SetTask(10,20*256)
	SetRank(50)
--	AddMagic(62)
--	AddMagic(60)
--	AddMagic(67)
	add_wu(20)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! B¹n ®­îc th¨ng lµ §o¹t Hån T¶n Nh©n! Häc ®­îc vâ c«ng Ngò §éc Ch­ëng Ph¸p, Ngò §éc §ao Ph¸p, Cöu Thiªn Cuång L«i.")
	AddNote("Gióp Tang Ch©u t×m con nhÖn vµ Tİn th¹ch. §­îc phong lµ §o¹t Hån T¶n Nh©n.")
end;
