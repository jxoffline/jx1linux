-------------------------------------------------------------------------
-- FileName		:	enemy_turegirl.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 10:16:14
-- Desc			:   Ç§±¦¿â¹Ø¿¨µÄ±»¢°ÉÙÅ®½Å±¾
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀµ
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --µ÷ÓÃ×é¶ÓÅĞ¶Ï
Include("\\script\\task\\tollgate\\killbosshead.lua") --µ÷ÓÃ¶¨ÒåÍ·ÏñµÄÍ·ÎÄ¼ş
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function main()
	if ( GetSex() == 0 ) then 
                 Describe(DescLink_BeiKunShaoNv..": Anh hïng rèt côc xuÊt hiÖn, ta bŞ ng­êi b¶o vÖ b¾t cãc, xin cøu ta !",2,"DÜ nhiªn cã thÓ, ®i theo ta !/offcouseido","Ta cßn cã nh÷ng chuyÖn kh¸c ph¶i lµm !/no") 
        else 
                 Describe(DescLink_BeiKunShaoNv..": Anh hïng rèt côc xuÊt hiÖn, ta bŞ ng­êi b¶o vÖ b¾t cãc, xin cøu ta !",2,"DÜ nhiªn cã thÓ, ®i theo ta !/offcouseido","Ta cßn cã nh÷ng chuyÖn kh¸c ph¶i lµm !/no") 
        end
end

function offcouseido()
	local Uworld1214 = nt_getTask(1214)
	local Npcindex = GetLastDiagNpc()
	nt_setTask(1214,Uworld1214+1)   --ÉèÖÃ±»¾ÈÉÙÅ®ÊıÁ¿
	Msg2Player("Ng­¬i ®· cøu ra bŞ ng­êi b¶o vÖ b¾t cãc ®İch thiÕu n÷, nÕu nh­ an toµn hé tèng nµng rêi ®i quan t¹p, ng­¬i ®em ®¹t ®­îc t­¬ng øng phÇn th­ëng.")
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 6);
	tongaward_message(30);	--by Ğ¡É½£¨°ï»áÖÜÄ¿±ê¹±Ï×¶È£¬Ã¿¸öÉÙÅ®3000µã£©
	DelNpc(Npcindex)
end

function no()
end
