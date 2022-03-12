-------------------------------------------------------------------------
-- FileName		:	enemy_biaozhiboss.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-05 17:30:14
-- Desc			:   ·çÖ®Æï¹Ø¿¨µÄ±êÖ¾boss½Å±¾
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊı¾İ±í¸ñµÄÀà
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --µ÷ÓÃ×é¶ÓÅĞ¶Ï
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function messenger_gogogo()
	
	
	local _, _, nMapIndex = GetPos()
------------------------------------------------------±äÁ¿¶¨Òå------------------------------------------
	local name = GetName()
	local Uworld1201 = nt_getTask(1201)  --·çÖ®ÆïÈÎÎñµÄÈÎÎñ±äÁ¿
	local Uworld1204 = nt_getTask(1204)  --ËÍĞÅÈÎÎñËùµ½µØµãÈÎÎñ±äÁ¿
	local Uworld3000 = nt_getTask(3000)  --ĞÅÊ¹»ı·Ö
	local Uworld1206 = nt_getTask(1206)  --ĞÅÊ¹³ÆºÅ
	local Uworld1207 = nt_getTask(1207)  --ĞÅÊ¹ÈÎÎñµ±Ç°É±¹Ö¼ÇÊıÆ÷
	local Uworld1208 = nt_getTask(1208)  --·çÖ®ÆïÉ±¹Ö¼ÇÊıÆ÷
	local Uworld1211 = nt_getTask(1211)  --ĞÅÊ¹ÈÎÎñ¹Ø¿¨¿ªÊ¼Ê±¼ä
	local Uworld1213 = nt_getTask(1213)  --Ë«±¶¾­ÑéÊ±¼ä
	local Uworld1214 = nt_getTask(1214)  --¶¨µã´ò¹Ö¿ª¹Ø
	local Uworld1215 = nt_getTask(1215)  --bossË¢¹Ö¿ª¹Ø
	local messenger_nowtime = GetGameTime()  --»ñµÃÍæ¼Òµ±Ç°ÔÚÏßÊ±¼ä
	local Uworld1212  =  messenger_nowtime - Uworld1211 --»ñµÃÍæ¼Òµ±Ç°ÔÚ¸Ã¹Ø¿¨µØÍ¼ÖĞ×ÜÊ±¼ä
	local Npcindex = GetLastDiagNpc()
	SetTaskTemp(180,Npcindex)    --½«µ±Ç°BossË÷Òı´æµ½Ò»¸öÁÙÊ±±äÁ¿ÖĞ
	
	
------------------------------------------------------º¯ÊıÅĞ¶Ï--------------------------------------------
	
	if ( Uworld1213 ~= 0 ) and ( Uworld1214 ~= 0 ) and ( Uworld1215 ~= 0 ) then  --¼¸ÖÖÈÎÎñÀàĞÍ¶¼ÒÑ¾­´¥·¢¹ıÁË
		--Msg2Player("Äã»¹ÓĞÈÎÎñÃ»ÓĞÍê³É£¬¼ÓÓÍ¡£") ²»×ö´¦ÀíÁË
	else
		local messenger_choice = random(1,40)
		--if ( messenger_choice == 4 ) then  --Ôö¼ÓÒ»¸öÉñÃØ´óºì°ü
		--	local lucky_hongbao = random(1,10)
		--	if ( lucky_hongbao == 5 ) then
		--		AddItem(6,1,402,0,0,0)      
		--		Msg2Player("Äã»ñµÃÁËÒ»¸öÉñÃØ´óºì°ü")
		--	end
		if ( messenger_choice == 7) then  --Èç¹ûÃ»ÓĞµÃµ½Õâ¸ö¸£Àû£¬ÔòÔö¼Ó»ı·Ö20·ÖÖÓ
			if ( Uworld1213 == 0 ) then
				nt_setTask(1213,messenger_nowtime)
				Msg2Player("B¹n nhËn ®­îc phÇn th­ëng t¨ng gÊp ®«i ®iÓm kinh nghiÖm khi giÕt qu¸i trong 20 phót!")
				AddSkillState( 548, 1, 1, 21600)
			else
				Msg2Player("B¹n ®· tiÕp xóc ®­îc täa ®é")
			end
		elseif ( messenger_choice == 11 ) then  --Ôö¼Ó»ı·Ö10 
			nt_setTask(3000,Uworld3000+20)
			tongaward_message(20);	--by Ğ¡É½
			Msg2Player("§iÓm tİch lòy trong nhiÖm vô Tİn Sø cña b¹n t¨ng lªn 20 ®iÓm!")
		elseif ( messenger_choice == 13 ) then  --¼õÉÙ»ı·Ö10
			if ( Uworld3000 >= 10 ) then 
				nt_setTask(3000,Uworld3000-10)
				Msg2Player("§iÓm tİch lòy trong nhiÖm vô Tİn Sø cña b¹n gi¶m ®i 10 ®iÓm!")
			end
		elseif ( messenger_choice == 16 ) then  --Èç¹ûÃ»ÓĞ´¥·¢¹ı¶¨µã´ò¹ÖµÄÊÂ¼ş£¬´¥·¢ÔÚÄ³µã´òÌØÊâ¹ÖÎïµÄÊÂ¼ş,
			local lucky_dingdian = random(1,3)  --ÔÙ´Î¿ØÖÆ¼¸ÂÊÎª1/3
			
			if ( Uworld1214 == 0 ) then
				if ( lucky_dingdian == 2 ) then  
					Uworld1214 = random(1,15)                                   
					nt_setTask(1214,Uworld1214)									--¼ÇÂ¼ÔÚkillfly±íÖĞÈ¡µÃµÄĞĞÊı
					if ( SubWorldIdx2ID( nMapIndex ) == 387 ) then
						Msg2Player("Trong lóc ®iÒu tra nh÷ng kİ hiÖu ®Ó l¹i b¹n t×m ®­îc 1 bøc th­! Trong th­ b¶o b¹n ®i"..killfly[Uworld1214][1]..","..killfly[Uworld1214][2].."N¬i nµy gäi lµ "..killfly[Uworld1214][3].."VËt phÈm! H¾n ®ang gi÷ b¶o bèi g×?")
					elseif ( SubWorldIdx2ID( nMapIndex ) == 388 ) then
						Msg2Player("Trong lóc ®iÒu tra nh÷ng kİ hiÖu ®Ó l¹i b¹n t×m ®­îc 1 bøc th­! Trong th­ b¶o b¹n ®i"..killfly2[Uworld1214][1]..","..killfly2[Uworld1214][2].."N¬i nµy gäi lµ "..killfly2[Uworld1214][3].."VËt phÈm! H¾n ®ang gi÷ b¶o bèi g×?")
					elseif ( SubWorldIdx2ID( nMapIndex ) == 389 ) then
						Msg2Player("Trong lóc ®iÒu tra nh÷ng kİ hiÖu ®Ó l¹i b¹n t×m ®­îc 1 bøc th­! Trong th­ b¶o b¹n ®i"..killfly3[Uworld1214][1]..","..killfly3[Uworld1214][2].."N¬i nµy gäi lµ "..killfly3[Uworld1214][3].."VËt phÈm! H¾n ®ang gi÷ b¶o bèi g×?")
					end
				end
			else
				Msg2Player("B¹n ®· tiÕp xóc ®­îc täa ®é")
			end
			
		elseif ( messenger_choice == 19 ) then 	--ÔÚ¸ÃbossÉí±ßÔö¼Óif ( messenger_npcindex == killflyboss[i][10]) ¸önpc
			local lucky_shuachu = random(1,3)
			if ( lucky_shuachu == 2 ) then
	
				if ( SubWorldIdx2ID( nMapIndex ) == 387 ) and ( GetGlbValue(811) < 30 ) then --¿ØÖÆ»¢±ªÆïË¢³öÊıÁ¿Îª10¶Ó30Ö§
					SetGlbValue(811,GetGlbValue(811)+3)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --»ñµÃµ±Ç°ËÀÍönpcµÄ´¢´æ±äÁ¿Öµ£¨¶ÔÓ¦±äÁ¿ÉèÖÃÖµÔÚ¸Ãnpc±»¼ÓÔØ´¦£©
					Msg2Player("Nói nµy lµ cña ta, th«n nµy lµ cña ta! Ai muèn ®i qua ®©y h× ®Ó c¸i ®Çu l¹i! (Ch¾c ch¾n giÕt ®­îc tªn nµy sÏ nhËn ®­îc nhiÒu mãn ngoµi ı muèn ®©y!) ")
					for i=1,getn(killflyboss) do  								  --È¥ËùÓĞbossËÀÍöºóÉú³ÉµÄnpc±í¸ñÖĞÑ°ÕÒ·ûºÏ¸ÃbossË÷ÒıµÄ×ø±ê
						if ( messenger_npcindex == killflyboss[i][10]) then   	  --Êı×éÄÚÑ°ÕÒ·ûºÏnpcË÷ÒıµÄ±äÁ¿ÊıÖµ
							Tid = SubWorldID2Idx(killflyboss[i][3]);   			  --Ôö¼Ónpc
							if (Tid >= 0 ) then
								TabValue4 = killflyboss[i][4] * 32
								TabValue5 = killflyboss[i][5] * 32
								newtasknpcindex = AddNpc(killflyboss[i][1],killflyboss[i][2],Tid,TabValue4,TabValue5,killflyboss[i][6],killflyboss[i][7],killflyboss[i][8]);
								SetNpcScript(newtasknpcindex, killflyboss[i][9]);
								SetNpcParam( newtasknpcindex,1,killflyboss[i][10]);
							end
						end
					end
					
				elseif ( SubWorldIdx2ID( nMapIndex ) == 388 ) and ( GetGlbValue(812) < 30 ) then
					SetGlbValue(812,GetGlbValue(812)+3)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --»ñµÃµ±Ç°ËÀÍönpcµÄ´¢´æ±äÁ¿Öµ£¨¶ÔÓ¦±äÁ¿ÉèÖÃÖµÔÚ¸Ãnpc±»¼ÓÔØ´¦£©
					Msg2Player("Nói nµy lµ cña ta, th«n nµy lµ cña ta! Ai muèn ®i qua ®©y h× ®Ó c¸i ®Çu l¹i! (Ch¾c ch¾n giÕt ®­îc tªn nµy sÏ nhËn ®­îc nhiÒu mãn ngoµi ı muèn ®©y!) ")
	
					for i=1,getn(killflyboss2) do  								  --È¥ËùÓĞbossËÀÍöºóÉú³ÉµÄnpc±í¸ñÖĞÑ°ÕÒ·ûºÏ¸ÃbossË÷ÒıµÄ×ø±ê
						if ( messenger_npcindex == killflyboss2[i][10]) then   	  --Êı×éÄÚÑ°ÕÒ·ûºÏnpcË÷ÒıµÄ±äÁ¿ÊıÖµ
							Tid = SubWorldID2Idx(killflyboss2[i][3]);   			  --Ôö¼Ónpc
							if (Tid >= 0 ) then
								TabValue4 = killflyboss2[i][4] * 32
								TabValue5 = killflyboss2[i][5] * 32
								newtasknpcindex = AddNpc(killflyboss2[i][1],killflyboss2[i][2],Tid,TabValue4,TabValue5,killflyboss2[i][6],killflyboss2[i][7],killflyboss2[i][8]);
								SetNpcScript(newtasknpcindex, killflyboss2[i][9]);
								SetNpcParam( newtasknpcindex,1,killflyboss2[i][10]);
							end
						end
					end
					
				elseif ( SubWorldIdx2ID( nMapIndex ) == 389 ) and ( GetGlbValue(813) < 30 ) then
					SetGlbValue(813,GetGlbValue(813)+3)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --»ñµÃµ±Ç°ËÀÍönpcµÄ´¢´æ±äÁ¿Öµ£¨¶ÔÓ¦±äÁ¿ÉèÖÃÖµÔÚ¸Ãnpc±»¼ÓÔØ´¦£©
					Msg2Player("Nói nµy lµ cña ta, th«n nµy lµ cña ta! Ai muèn ®i qua ®©y h× ®Ó c¸i ®Çu l¹i! (Ch¾c ch¾n giÕt ®­îc tªn nµy sÏ nhËn ®­îc nhiÒu mãn ngoµi ı muèn ®©y!) ")
	
					for i=1,getn(killflyboss3) do  								  --È¥ËùÓĞbossËÀÍöºóÉú³ÉµÄnpc±í¸ñÖĞÑ°ÕÒ·ûºÏ¸ÃbossË÷ÒıµÄ×ø±ê
						if ( messenger_npcindex == killflyboss3[i][10]) then   	  --Êı×éÄÚÑ°ÕÒ·ûºÏnpcË÷ÒıµÄ±äÁ¿ÊıÖµ
							Tid = SubWorldID2Idx(killflyboss3[i][3]);   			  --Ôö¼Ónpc
							if (Tid >= 0 ) then
								TabValue4 = killflyboss3[i][4] * 32
								TabValue5 = killflyboss3[i][5] * 32
								newtasknpcindex = AddNpc(killflyboss3[i][1],killflyboss3[i][2],Tid,TabValue4,TabValue5,killflyboss3[i][6],killflyboss3[i][7],killflyboss3[i][8]);
								SetNpcScript(newtasknpcindex, killflyboss3[i][9]);
								SetNpcParam( newtasknpcindex,1,killflyboss3[i][10]);
							end
						end
					end
				end
			end
		end
	end
		
--------------------------------------------------×öbossËÀÍöµÄ»ù±¾²Ù×÷-------------------------------------------------------
	if ( Uworld1213 ~= 0 ) then       --ÅĞ¶ÏÊÇ·ñË«±¶¾­ÑéÊ±¼ä
		if  (  messenger_nowtime - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("Thêi gian t¨ng gÊp ®«i ®iÓm kinh nghiÖm cña b¹n ®· kÕt thóc!")
		else
			AddOwnExp(FLYBOSS_EXP)    --¸øÓèÒ»±¶µÄ¾­Ñé
		end
	end
	
	local Uworld3000 = nt_getTask(3000)
	local Uworld1207 = nt_getTask(1207)
	local Uworld1207 = nt_getTask(1208)
	
	messenger_killnpc_jifen(FLYBOSS_MESSENGEREXP,FLYBOSS_MAPID)
	SetMessengerPlayer(1207,1208,FLYBOSS_EXP,FLYBOSS_MAPID)   --Ôö¼Ó·çÖ®ÆïÉ±¹ÖÊı£¬Ôö¼Óµ±Ç°¹Ø¿¨É±¹ÖÊı£¬Ôö¼Ó¾­Ñé
	
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 3);
	HideNpc(GetTaskTemp(180),FLYBOSS_RELIVE*18)  --18ìõÎªÒ»Ãë  Òş²Ø¸Ã¶Ô»°ĞÍµÄnpc
	Talk(1,"","B¹n ®· ®Õn ®­îc täa ®é")
end