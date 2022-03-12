-- ÎÄ¼şÃû¡¡£ºtranslife_4_ex.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈİ¡¡¡¡£º×ªÉú4²¹³äÉè¼Æ ÈôÍæ¼ÒÒÑ×ªÉú4´Î£¬ÇÒÃ¿´Î¶¼ÔÚ200¼¶×ªÉú£¬Ôò¿ÉÒÔ»ñµÃÌØÊâ¼¼ÄÜ£¬Õ½ÒâÇ§Çï	
-- ´´½¨Ê±¼ä£º2011-09-14 16:20:38

Include("\\script\\task\\metempsychosis\\task_head.lua")

TRANSLIFE_TIME = 4
TRANSLIFE_LEVEL = 200
SKILL_NAME = "ChiÕn ı Thiªn Thu"
SKILL_ID = 1171 -- Õ½ÒâÇ§Çï id
SKILL_LEVEL = 1 -- Õ½ÒâÇ§Çï µÈ¼¶

function beidou_learn_specialskill()
	local szTitle = format("ChØ cã nh÷ng ®¹i hiÖp nµo kiªn tr×  <color=yellow>%d<color> trïng sinh cÊp <color=yellow>%d<color> lÇn míi cã thÓ häc ®­îc vâ c«ng bİ truyÒn t¹i chç cña ta ®©y! ",TRANSLIFE_LEVEL,TRANSLIFE_TIME)
	local tbOpt = {}
	
	tinsert(tbOpt, {"X¸c ®Şnh muèn häc kü n¨ng",sureLearnSpecialSkill,{PlayerIndex}})
	tinsert(tbOpt, {" KÕt thóc ®èi tho¹i!"})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function checkTranslifetime()
	local n_transcount = ST_GetTransLifeCount()
	if n_transcount < TRANSLIFE_TIME then
		Talk(1,"","Ch­a ®¹t ®­îc yªu cÇu lu«n kiªn tr× cÊp 200 trïng sinh ®Õn lÇn 4, kh«ng thÓ nhËn ®­îc kü n¨ng nµy")	
		return 0
	end
	return 1
end

function checkTranslifeLevel()
	local n_taskid = 0
	local n_taskbyte = 0
	local bRet = 1
	
	for n_transcount=1, TRANSLIFE_TIME do
		local n_id = floor(n_transcount / 2) + mod(n_transcount, 2)
		n_taskid = TSK_ZHUANSHENG_GRE[n_id]
		
		if (mod(n_transcount, 2) == 0) then
			n_taskbyte = 3
		else
			n_taskbyte = 1
		end
		local n_taskvalue = GetTask(n_taskid)
		n_taskvalue = GetByte(n_taskvalue, n_taskbyte)
	
--		print(format("µÚ%d´Î×ªÉúµÄµÈ¼¶Îª%d",n_transcount, n_taskvalue))
	
		if n_taskvalue ~= TRANSLIFE_LEVEL then
			bRet = 0
			break
		end
	end
	
	if bRet ~= 1 then
		Talk(1,"","Ch­a ®¹t ®­îc yªu cÇu lu«n kiªn tr× cÊp 200 trïng sinh ®Õn lÇn 4, kh«ng thÓ nhËn ®­îc kü n¨ng nµy")	
	end
	
	return bRet
end

function checkIsLearned()
	if HaveMagic(SKILL_ID) == -1 then
		return 1
	end
	Talk(1,"",format("§¹i hiÖp ®· häc ®­îc <color=yellow>%s<color>, kh«ng thÓ häc l¹i ®­îc n÷a",SKILL_NAME))
	return 0
end

function sureLearnSpecialSkill(nPlayerIndex)
	
	if checkIsLearned() ~= 1 then
		return 
	end
	
	if checkTranslifetime() ~= 1 then
		return 
	end
	
	if checkTranslifeLevel() ~= 1 then
		return 
	end
	
	-- Ñ§Ï°¼¼ÄÜ
	
	AddMagic(SKILL_ID, SKILL_LEVEL)
	Talk(1,"",format("Chóc mõng ng­¬i häc ®­îc <color=yellow>%s<color>",SKILL_NAME))
end

