-------------------------------------------------------------------------
-- FileName		:	enemy_flypoint.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 18:30:14
-- Desc			:   ·çÖ®Æï¹Ø¿¨µÄ¶¨µãĞ¡¹Ö½Å±¾
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --µ÷ÓÃ×é¶ÓÅĞ¶Ï
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function messenger_killrefresh()
	
	local _, _, nMapIndex = GetPos()
	local Uworld3000 = nt_getTask(3000)  --ĞÅÊ¹»ı·Ö
	local Uworld1213 = nt_getTask(1213)  --Ë«±¶¾­ÑéÊ±¼ä
	local Uworld1215 = nt_getTask(1215)  --bossÉí±ßË¢¹ÖµÄ´ò¹Ö¿ª¹Ø
	
		if ( Uworld1213 ~= 0 ) then       --ÅĞ¶ÏÊÇ·ñË«±¶¾­ÑéÊ±¼ä
			if  ( GetGameTime() - Uworld1213 >= 1200 ) then
				nt_setTask(1213,0)
				Msg2Player("Thêi gian t¨ng gÊp ®«i ®iÓm kinh nghiÖm cña b¹n ®· kÕt thóc!")
			else
				AddOwnExp(FLYREFRESH_EXP)    --¸øÓèÒ»±¶µÄ¾­Ñé
			end
		end
		
		nt_setTask(1215,Uworld1215+1)
		
		if ( nt_getTask(1215) >= 13 ) then
			local w = random(1,5) --Ëæ»úµÃµ½Ò»ÑùºÃ¶«Î÷
			if ( w== 3 ) then  
				--AddItem()
			end
						
			nt_setTask(1215,0)
			Msg2Player("B¹n ®· tiªu diÖt Kim Quèc Hæ B¸o Kş.")
		end
		
		SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 2);
		if ( SubWorldIdx2ID( nMapIndex ) == 387 ) and ( GetGlbValue(811) >= 1 ) then  --ÅĞ¶ÏµØÍ¼ÄÚ»¢±ªÆïµÄÊıÁ¿
			SetGlbValue(811,GetGlbValue(811) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 388 ) and ( GetGlbValue(812) >= 1 ) then
			SetGlbValue(812,GetGlbValue(812) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 389 ) and ( GetGlbValue(813) >= 1 ) then
			SetGlbValue(813,GetGlbValue(813) - 1 )
		end	
		
		messenger_killnpc_jifen(FLYREFRESH_MESSENGEREXP,FLYREFRESH_MAPID)
		messenger_killbugbear_inteam(FLYREFRESH_EXP,FLYREFRESH_MAPID)   --Ôö¼Ó¶ÓÎéÄÚÍæ¼Ò¾­Ñé

end